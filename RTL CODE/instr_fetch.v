`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:33:30 09/05/2024 
// Design Name: 
// Module Name:    instr_fetch 
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
module instr_fetch(
	 input wire clk,        // Clock input
    input wire rst_n,       // Active low reset
	 output wire [31:0] instruction
    );
	 
wire [31:0] next_instr_addr;
wire [31:0] instruction_wire;
pc_top pctop (
    .clk(clk), 
    .pc_rst_n(rst_n),
	 .opcode(instruction_wire[6:0]), //to perform halt operation in PC
    .next_instr_addr(next_instr_addr)
);
	 
program_memory p1(
	 .clk(clk),
    .program_addr(next_instr_addr[11:0]), // Instruction address (12-bit)
    .instruction(instruction_wire)        // 32-bit instruction output
);

assign instruction = instruction_wire;

endmodule
