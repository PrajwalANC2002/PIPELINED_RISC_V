`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    
// Design Name:    Control Unit
// Module Name:    control_unit 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description:    Control unit for the CPU, generating control signals 
//                 based on the opcode.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module control_unit(
    input wire [6:0] opcode,                  // 6-bit opcode from the instruction
    output reg reg_write_en,                  // Register write enable signal
    output reg add_imm,                      // add immediate mux control signal
	 output reg alu_en                        //alu enable output for alu control unit 
);

// Control logic based on the opcode
always @(opcode) begin
    case (opcode)
        7'b0110011: //ALU OPERATION 
				begin
					add_imm = 1'b0; //add_imm mux select line control signal
					reg_write_en = 1'b1; 
					alu_en = 1'b1; 
				end
		  7'b1110011: //ADDI to load the value into register set
				begin
					add_imm = 1'b1; //add_imm mux select line control signal
					reg_write_en = 1'b1;
					alu_en = 1'b1;
				end
        default: 
			 begin
				add_imm = 1'b0;
				reg_write_en = 1'b0;
				alu_en = 1'b0;
          end
    endcase
end
endmodule
