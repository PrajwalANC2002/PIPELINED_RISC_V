`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    
// Design Name:    Simple RISC CPU
// Module Name:    alu 
// Project Name:   Simple RISC CPU Design
// Target Devices: 
// Tool versions: 
// Description:    This module implements an Arithmetic Logic Unit (ALU) that performs
//                 various arithmetic and logical operations based on the provided opcode.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module alu #(
    parameter opwidth = 32,        // Width of operands and result
    parameter opcodewidth = 3      // Width of the alu opcode
)(
    input [opwidth-1:0] operand1,  // First operand
    input [opwidth-1:0] operand2,  // Second operand
    input [opcodewidth-1:0] alu_op,// ALU operation code
    output reg [opwidth-1:0] alu_out // Result of the ALU operation
);

always @(operand1 or operand2 or alu_op) 
begin
    case (alu_op)
        3'd0: alu_out = operand1 + operand2;                             // Addition
        3'd1: alu_out = operand1 - operand2;                             // Subtraction
        3'd2: alu_out = operand1 & operand2;                             // Bitwise AND
        3'd3: alu_out = operand1 | operand2;                             // Bitwise OR
        3'd4: alu_out = operand1 ^ operand2;                             // Bitwise XOR
        default: alu_out = {opwidth{1'b0}};                              // Default to zero for undefined opcodes if alu_op=3'b111 this state will be taken
    endcase
end

endmodule

