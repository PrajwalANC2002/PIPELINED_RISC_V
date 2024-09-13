`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    
// Design Name: 
// Module Name:    instr_decde_register 
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
module instr_decode_register(
	input wire clk,
	input wire register_write_en_in,
	input wire [2:0] alu_op_in,
	input wire [31:0] alu_operand1_in,
	input wire [31:0] alu_operand2_in,
	input wire [4:0] register_write_addr_in,
	output reg register_write_en_out,
	output reg [2:0] alu_op_out,
	output reg [31:0] alu_operand1_out,
	output reg [31:0] alu_operand2_out,
	output reg [4:0] register_write_addr_out
);

	always@(posedge clk)
		begin
			register_write_en_out <= register_write_en_in;
			alu_op_out <= alu_op_in;
			alu_operand1_out <= alu_operand1_in;
			alu_operand2_out <= alu_operand2_in;
			register_write_addr_out <= register_write_addr_in;
		end

endmodule
