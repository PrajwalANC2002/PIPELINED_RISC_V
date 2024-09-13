`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    
// Design Name: 
// Module Name:    pc_address 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description:    Computes the next instruction address based on jump, 
//                 conditional jump, and ALU output signals.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module pc_address#(
    parameter pc_width = 32  // Width of the program counter
)(
    input wire [pc_width-1:0] read_addr,      // Current instruction address (PC value)
    output wire [pc_width-1:0] next_instr_addr // Calculated next instruction address
);

reg [pc_width-1:0] adder_out;

// Increment the current instruction address by 1
always @(read_addr) 
	begin
	  adder_out = read_addr +1'b1;
	end
assign next_instr_addr = adder_out;

endmodule
