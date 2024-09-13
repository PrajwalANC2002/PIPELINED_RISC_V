`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    
// Design Name:    ALU Control
// Module Name:    alu_control
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description:    ALU Control module for selecting ALU operations based on the 
//                 instruction opcode and enabling signal.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module alu_control(
    input wire [6:0] func7,   // 7-bit function 7 value 
	 input wire [2:0] func3,   //3 - bit function 3 value
    input wire alu_en,                  // ALU enable signal
    output reg [2:0] alu_operation      // 3-bit ALU operation code
);

// ALU operation selection logic based on function 7,function 3 and ALU enable signal
always @(func7 or func3 or alu_en)
begin
    if (alu_en)
	 begin
        case({func7,func3})
            10'b0000000_000: alu_operation = 3'd0;  // func7=0000000 and func3 = 000 then add operation encoded as 3'd0
            10'b0100000_000: alu_operation = 3'd1; // func7=0100000 and func3 = 000 then sub operation encoded as 3'd1
            10'b0000000_110: alu_operation = 3'd2; // func7=0000000 and func3 = 110 then bitwise and encoded as 3'd2
            10'b0000000_111: alu_operation = 3'd3; // func7=0000000 and func3 = 111 then bitwise or operation encoded as 3'd3
				10'b0000000_100: alu_operation = 3'd4; // func7=0000000 and func3 = 100 then bitwise xor encoded as 3'd4
            default: alu_operation = 3'd5; // Default operation code this case will not happen since alu_en is used
        endcase
    end 
	 else 
	 begin
			alu_operation = 3'd7; // deafult state for alu when ALU is disabled does not happen in this design
    end
end

endmodule
