// File: up_counter_tb.v
// Testbench for the 4-bit asynchronous reset up-counter

`timescale 1ns / 1ps

module up_counter_tb;

    // Testbench signals
    reg clk;
    reg reset;
    wire [3:0] count;

    // Instantiate the Device Under Test (DUT)
    up_counter uut (
        .clk(clk),
        .reset(reset),
        .count(count)
    );

    // Clock generation: 10ns period (100 MHz)
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Toggle clock every 5 ns
    end

    // Test sequence
    initial begin
        // VCD waveform dump setup
        $dumpfile("up_counter.vcd");       // Output VCD file
        $dumpvars(0, up_counter_tb);       // Dump all variables in this module

        // Initialize inputs
        reset = 1;
        #12;
        reset = 0;

        // Run simulation for a while to observe counting
        #100;

        // Apply asynchronous reset again
        reset = 1;
        #10;
        reset = 0;

        #50;

        $finish; // End simulation
    end

    // Monitor the signals in console
    initial begin
        $monitor("Time = %0t | reset = %b | count = %b", $time, reset, count);
    end

endmodule
