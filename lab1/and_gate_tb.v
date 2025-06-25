`timescale 1ns / 1ps
// File: and_gate_tb.v
// Testbench for the 2-input AND gate module.

module and_gate_tb;

  // Declare testbench signals
  reg a;
  reg b;
  wire y;

  // Instantiate the Design Under Test (DUT)
  and_gate dut (
    .a(a),
    .b(b),
    .y(y)
  );

  // Generate VCD waveform file (optional for GTKWave)
  initial begin
    $dumpfile("and_gate_tb.vcd");
    $dumpvars(0, and_gate_tb);
  end

  // Stimulus
  initial begin
    $monitor("Time=%0t ns | a=%b b=%b => y=%b", $time, a, b, y);

    // Apply all input combinations
    a = 0; b = 0; #10;
    a = 0; b = 1; #10;
    a = 1; b = 0; #10;
    a = 1; b = 1; #10;

    $finish; // End simulation
  end

endmodule
