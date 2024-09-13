`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    
// Design Name:    RISC CPU
// Module Name:    program_memory 
// Project Name:   Simple RISC CPU
// Target Devices: 
// Tool versions: 
// Description:    This module defines the program memory, which stores the 
//                 instructions for the RISC CPU. The instructions are fetched 
//                 based on the address provided by the program counter.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module program_memory #(
    parameter program_mem_width = 32,  // Width of each instruction
    parameter program_mem_depth = 4096, // Number of instructions
    parameter program_mem_addr = 12     // Address width for program memory
)(
	 input wire clk, //clock input
    input [program_mem_addr-1:0] program_addr,  // Address from program counter
    output wire [program_mem_width-1:0] instruction // Output instruction
);

    // Memory array to store the program instructions
    reg [program_mem_width-1:0] programmemory [0:program_mem_depth-1];

    // asynchronous read
        assign instruction = programmemory[program_addr];

    // always block to load instructions into the memory
  always@(posedge clk)
		begin                                                             //r0 hardwired to 32'd0
                  programmemory[0]<= 32'b0000000_00110_00000_000_00010_1110011;  // addi r2 = r0 + 6 here immediate value given in RS2 and opcode is 1110011
		  programmemory[1]<= 32'b0000000_01010_00000_000_00011_1110011;  // addi r3 = r0 + 10 here immediate value given in RS2 and opcode is 1110011
		  programmemory[2]<= 32'b0000000_00010_00011_000_00110_0000000;// no op 
		  programmemory[3]<= 32'b0100000_10010_10011_000_00111_0000000;// no op
		  programmemory[4]<= 32'b0000000_00010_00011_000_00110_0110011;// ADD R6=R3+R2
		  programmemory[5]<= 32'b0100000_00010_00011_000_00111_0110011;// subtract  r7= r3 - r2;
		  programmemory[6]<= 32'b0000000_00010_00011_110_01000_0110011;// AND r8 = r3 & r2
		  programmemory[7]<= 32'b0000000_00010_00011_111_01001_0110011;// OR r9 = r3 | r2
		  programmemory[8]<= 32'b0000000_00010_00011_100_01010_0110011;// XOR r10 = r3 ^ r2
		  programmemory[9]<= 32'b0000000_00010_00011_100_01010_1111111;// halt operation opcode is 1111111 
		  
		end

endmodule


