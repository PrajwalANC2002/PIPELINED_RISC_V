`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:52:07 09/11/2024 
// Design Name: 
// Module Name:    instr_fetch_register 
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
module instr_fetch_register(
	input wire clk,
	input wire [31:0] instruction_in,
	output reg [31:0] instruction_out
);
	always@(posedge clk)
		begin
			instruction_out <= instruction_in;
		end
		
endmodule


