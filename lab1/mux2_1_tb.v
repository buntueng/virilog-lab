`timescale 1ns / 1ps
// File: mux2_1_tb.v
// Testbench for the mux2_1 module.
module mux2_1_tb;
// Declare testbench signals. Inputs to DUT are 'reg', output from DUT is 'wire'.
reg tb_in0;
reg tb_in1;
reg tb_select;
wire tb_out;
// Instantiate the Design Under Test (DUT).
mux2_1 dut (
.in0(tb_in0),
.in1(tb_in1),
.select(tb_select),
.out(tb_out)
);

  // Generate VCD waveform file (optional for GTKWave)
  initial begin
    $dumpfile("mux2_1_tb.vcd");
    $dumpvars(0, mux2_1_tb);
  end

// Initial block to generate stimulus and monitor results.
initial begin
// Monitor system task to display signal values whenever they change.
$monitor("Time=%0t, in0=%b, in1=%b, select=%b, out=%b", $time, tb_in0, tb_in1, tb_select, tb_out);

// Test cases for 2:1 MUX: covering all combinations of inputs and select line.
// Select = 0 (in0 should pass through)
tb_in0 = 1'b0; tb_in1 = 1'b0; tb_select = 1'b0; #10; // Expected: out = 0
tb_in0 = 1'b1; tb_in1 = 1'b0; tb_select = 1'b0; #10; // Expected: out = 1
tb_in0 = 1'b0; tb_in1 = 1'b1; tb_select = 1'b0; #10; // Expected: out = 0
tb_in0 = 1'b1; tb_in1 = 1'b1; tb_select = 1'b0; #10; // Expected: out = 1
// Select = 1 (in1 should pass through)
tb_in0 = 1'b0; tb_in1 = 1'b0; tb_select = 1'b1; #10; // Expected: out = 0
tb_in0 = 1'b1; tb_in1 = 1'b0; tb_select = 1'b1; #10; // Expected: out = 0
tb_in0 = 1'b0; tb_in1 = 1'b1; tb_select = 1'b1; #10; // Expected: out = 1
tb_in0 = 1'b1; tb_in1 = 1'b1; tb_select = 1'b1; #10; // Expected: out = 1
$finish; // Terminate simulation.
end
endmodule