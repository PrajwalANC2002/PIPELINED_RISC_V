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
