`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:10:27 09/05/2024 
// Design Name: 
// Module Name:    instr_execution 
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
module instr_execution(
    input wire reg_write_en_in,
	 input wire [2:0] alu_op_in,
	 input wire [31:0] alu_operand1,
	 input wire [31:0] alu_operand2,
	 input wire [4:0] register_addr_in,
	 output wire [31:0] alu_out,
	 output wire [4:0] register_addr_out,
	 output wire reg_write_en_out
);

wire [31:0] alu_operand1_wire,alu_operand2_wire;
wire [2:0] alu_op_in_wire;
wire [31:0] alu_out_wire;

assign alu_op_in_wire = alu_op_in;

assign alu_operand1_wire = alu_operand1;

assign alu_operand2_wire = alu_operand2;
	 

alu a0(
    .operand1(alu_operand1_wire), // alu operand1 connect to register set data out1
    .operand2(alu_operand2_wire), // alu operand2 connect to register set data out2
    .alu_op(alu_op_in_wire),  //specifies the alu operations to be performed 
    .alu_out(alu_out_wire)        // alu output 
);

assign alu_out = alu_out_wire;

assign register_addr_out = register_addr_in;

assign reg_write_en_out = reg_write_en_in;

endmodule
