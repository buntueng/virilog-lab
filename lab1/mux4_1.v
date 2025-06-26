// File: mux4_1.v
// This module implements a 4-input to 1-output multiplexer using mux2_1.

module mux4_1 (
    input  wire in0,     // Data input 0
    input  wire in1,     // Data input 1
    input  wire in2,     // Data input 2
    input  wire in3,     // Data input 3
    input  wire [1:0] select, // 2-bit select line
    output wire out      // Final output
);

    wire mux0_out, mux1_out;

    // First level of 2-to-1 MUXes
    mux2_1 mux0 (
        .in0(in0),
        .in1(in1),
        .select(select[0]),
        .out(mux0_out)
    );

    mux2_1 mux1 (
        .in0(in2),
        .in1(in3),
        .select(select[0]),
        .out(mux1_out)
    );

    // Second level MUX to select between the outputs of the first level
    mux2_1 mux2 (
        .in0(mux0_out),
        .in1(mux1_out),
        .select(select[1]),
        .out(out)
    );

endmodule
