`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:     
// Design Name: 
// Module Name:    instr_decode 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module instr_decode(
	input wire clk,
	input wire rst_n,
	input wire [31:0] instruction,
	input wire [4:0] register_addr_in,
	input wire [31:0] register_write_data_in,
	input wire register_write_en_in,
	output wire register_write_en_out,
	output wire [2:0] alu_op,
	output wire [31:0] register_data_out1,
	output wire [31:0] add_imm_out,//output of mux for next stage
	output wire [4:0] register_addr_out 
    );

wire [2:0] alu_op_wire;
wire alu_en_wire;
wire add_imm_wire;
wire [31:0] register_data_out1_wire,register_data_out2_wire;
wire [31:0] instruction_wire;

wire [31:0] imm_padded_out;

assign instruction_wire = instruction;	 

assign imm_padded_out = {{27{instruction_wire[24]}}, instruction_wire[24:20]}; //MSB replication to retain the sign of immediate value used in ADDI instruction

assign add_imm_out = add_imm_wire ? imm_padded_out : register_data_out2_wire; // add immediate mux to select between normal alu and addi operation


register_file r0(
    .clk(clk),
    .reg_rst_n(rst_n),
    .write_en(register_write_en_in),   // register set write enable
    .reg_read_addr_1(instruction_wire[19:15]), // slicing the [19:15] bits from instruction to specify the address of register from which to read the data for RS1
    .reg_read_addr_2(instruction_wire[24:20]), // slicing the [24:20] bits from instruction to specify the address of register from which to read the data for RS2
    .reg_write_addr(register_addr_in), // reg_write_addr specifies which register to write the reg_write_data to from the write back stage acts as RD
    .reg_write_data(register_write_data_in),   //register set write data from the write back stage
    .reg_data_out_1(register_data_out1_wire), // register data output from the address specified by reg_read_addr_1
    .reg_data_out_2(register_data_out2_wire) //// register data output from the address specified by reg_read_addr_2
);

assign register_data_out1 = register_data_out1_wire;


// ALU control instantiation
alu_control a1(
    .func3(instruction_wire[14:12]), //extracting func3 from instruction
	 .func7(instruction_wire[31:25]), //extracting func7 from instruction
    .alu_en(alu_en_wire),            //alu enable helps enable the alu whenever required
    .alu_operation(alu_op_wire)      //specifies what operation needs to be performed
);

assign alu_op = alu_op_wire;



// Control unit instantiation
control_unit c0(
    .opcode(instruction_wire[6:0]),                //extracting opcode from instruction  
    .reg_write_en(register_write_en_out_wire),     // register set write enable
    .alu_en(alu_en_wire),                          // alu enable 
    .add_imm(add_imm_wire)                         //add immediate mux control signal
);

assign register_write_en_out = register_write_en_out_wire;

assign register_addr_out = instruction_wire[11:7];

endmodule
