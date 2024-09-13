`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:08:16 09/06/2024 
// Design Name: 
// Module Name:    pipelined_top 
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

`include "alu_control.v"
`include "control_unit.v"
`include "instr_decode.v"
`include "instr_decode_register.v"
`include "instr_execution.v"
`include "instr_execution_register.v"
`include "instr_fetch.v"
`include "instr_fetch_register.v"
`include "pc_address.v"
`include "pc_top.v"
`include "alu.v"
`include "pc_incr.v"
`include "program_memory 1.v"
`include "register_file.v"





module pipelined_top(
	input wire clk,
	input wire rst_n,
	output wire [31:0] alu_out
);


wire [31:0] instruction_wire_fetch_in,instruction_wire_fetch_out;


wire [31:0] alu_out_writeback;
wire [4:0] register_addr_writeback;
wire reg_write_en_writeback;

instr_fetch i0 (
    .clk(clk), 
    .rst_n(rst_n), 
    .instruction(instruction_wire_fetch_in)
);

instr_fetch_register i0_1 (
    .clk(clk), 
    .instruction_in(instruction_wire_fetch_in), 
    .instruction_out(instruction_wire_fetch_out)
);

wire register_write_en_decode_in;
wire [2:0] alu_op_decode_in;
wire [31:0] alu_operand1_decode_in,alu_operand2_decode_in;
wire [4:0] register_write_addr_decode_in;

instr_decode i1 (
    .clk(clk), 
    .rst_n(rst_n), 
    .instruction(instruction_wire_fetch_out), 
    .register_addr_in(register_addr_writeback),         //register address write back after passing through all the pipelined stages 
    .register_write_data_in(alu_out_writeback),        //writeback from alu output to the register write data after passing through all the pipelined stages
    .register_write_en_in(reg_write_en_writeback),     //register write enable after passing through all the pipelined stages 
    .register_write_en_out(register_write_en_decode_in),  
    .alu_op(alu_op_decode_in), 
    .register_data_out1(alu_operand1_decode_in), 
    .add_imm_out(alu_operand2_decode_in), 
    .register_addr_out(register_write_addr_decode_in)
);

wire register_write_en_execute_in;
wire [2:0] alu_op_execute_in;
wire [31:0] alu_operand1_execute_in,alu_operand2_execute_in;
wire [4:0] register_write_addr_execute_in;

instr_decode_register i1_0 (
    .clk(clk), 
    .register_write_en_in(register_write_en_decode_in), 
    .alu_op_in(alu_op_decode_in), 
    .alu_operand1_in(alu_operand1_decode_in), 
    .alu_operand2_in(alu_operand2_decode_in), 
    .register_write_addr_in(register_write_addr_decode_in), 
    .register_write_en_out(register_write_en_execute_in), 
    .alu_op_out(alu_op_execute_in), 
    .alu_operand1_out(alu_operand1_execute_in), 
    .alu_operand2_out(alu_operand2_execute_in), 
    .register_write_addr_out(register_write_addr_execute_in)
    );
wire [31:0] alu_out_reg_in;
wire [4:0] register_addr_reg_in;
wire reg_write_en_reg_in;

instr_execution i2 (
    .reg_write_en_in(register_write_en_execute_in), 
    .alu_op_in(alu_op_execute_in), 
    .alu_operand1(alu_operand1_execute_in), 
    .alu_operand2(alu_operand2_execute_in), 
    .register_addr_in(register_write_addr_execute_in), 
    .alu_out(alu_out_reg_in), 
    .register_addr_out(register_addr_reg_in), 
    .reg_write_en_out(reg_write_en_reg_in)
);


instr_execution_register i2_0 (
    .clk(clk), 
    .reg_write_en_reg_in(reg_write_en_reg_in), 
    .alu_out_reg_in(alu_out_reg_in), 
    .register_addr_reg_in(register_addr_reg_in), 
    .reg_write_en_reg_out(reg_write_en_writeback), 
    .alu_out_reg_out(alu_out_writeback), 
    .register_addr_reg_out(register_addr_writeback)
);
	 
assign alu_out = alu_out_writeback;

endmodule
