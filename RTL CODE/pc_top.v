`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    
// Design Name: 
// Module Name:    pctop 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description:    Program counter top-level module for managing instruction addresses.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module pc_top#(
    parameter pc_width = 32  // Width of the program counter
)(
    input wire clk,               // Clock signal at 150 MHz
    input wire pc_rst_n,                  // Active-low reset signal
	 input wire [6:0] opcode,              ////to perform halt operation in PC
    output wire [pc_width-1:0] next_instr_addr // Address of the next instruction
);

// Internal wires for interconnections
wire [pc_width-1:0] next_instr_wire, current_instr_wire;//current_instr_wire_read_addr;

// Instantiate the PC incrementer module
pc_incr p0 (
    .next_instr(next_instr_wire),           // Input: Program counter input
    .clk(clk),                            // Input: clock
    .pc_rst_n(pc_rst_n),                 // Input: reset signal
	 .opcode(opcode),                     // Input: opcode for halt operation
    .current_instr(current_instr_wire)   // Output: Program counter output
);

// Instantiate the PC address module
pc_address p1 (
    .read_addr(current_instr_wire),      // Input: current instruction address to PC adder module      
    .next_instr_addr(next_instr_wire)    // Output: next instruction address from PC adder module
);

// Assign the current instruction address as the next instruction address output
assign next_instr_addr = current_instr_wire;

endmodule
