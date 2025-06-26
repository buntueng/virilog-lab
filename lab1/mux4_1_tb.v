// File: tb_mux4_1.v
// Testbench for 4-to-1 multiplexer (mux4_1)

`timescale 1ns / 1ps

module mux4_1_tb;

    // Testbench signals
    reg in0, in1, in2, in3;
    reg [1:0] select;
    wire out;

    // Instantiate the mux4_1 module
    mux4_1 uut (
        .in0(in0),
        .in1(in1),
        .in2(in2),
        .in3(in3),
        .select(select),
        .out(out)
    );

    // Test sequence
    initial begin
        // Create VCD dump file
        $dumpfile("mux4_1_tb.vcd");
        $dumpvars(0, mux4_1_tb);

        // Initialize inputs
        in0 = 0; in1 = 1; in2 = 0; in3 = 1;

        // Test all select combinations
        select = 2'b00; #10;  // Expect out = in0
        select = 2'b01; #10;  // Expect out = in1
        select = 2'b10; #10;  // Expect out = in2
        select = 2'b11; #10;  // Expect out = in3

        // Change input values and test again
        in0 = 1; in1 = 0; in2 = 1; in3 = 0;
        select = 2'b00; #10;
        select = 2'b01; #10;
        select = 2'b10; #10;
        select = 2'b11; #10;

        $finish;
    end

endmodule
