`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:11:31 09/06/2024 
// Design Name: 
// Module Name:    instr_execution_register 
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
module instr_execution_register(
	input wire clk,
	input wire reg_write_en_reg_in,
	input wire [31:0] alu_out_reg_in,
	input wire [4:0] register_addr_reg_in,
	output reg reg_write_en_reg_out,
	output reg [31:0] alu_out_reg_out,
	output reg [4:0] register_addr_reg_out
);

	always@(posedge clk)
		begin
			reg_write_en_reg_out <= reg_write_en_reg_in;
			alu_out_reg_out <= alu_out_reg_in;
			register_addr_reg_out <= register_addr_reg_in;
		end


endmodule
