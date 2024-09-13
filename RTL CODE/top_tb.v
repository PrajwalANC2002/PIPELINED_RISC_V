`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:56:10 09/06/2024
// Design Name:   pipelined_top
// Module Name:   /home/ise/CA_project/pipelined_cpu/top_tb.v
// Project Name:  pipelined_cpu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: pipelined_top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
`include "pipelined_top.v"
module top_tb;

	// Inputs
	reg clk;
	reg rst_n;

	// Outputs
	wire [31:0] alu_out;

	// Instantiate the Unit Under Test (UUT)
	pipelined_top uut (
		.clk(clk), 
		.rst_n(rst_n), 
		.alu_out(alu_out)
	);
	
	always #5 clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 0;
		rst_n = 1;
		
		#50 rst_n = 0;
		#10 rst_n =1;

		// Wait 100 ns for global reset to finish
		
        
		// Add stimulus here

	end
      
endmodule

