// File: mux2_1.v
// This module implements a 2-input to 1-output multiplexer.

module mux2_1 (
    input  wire in0,     // Data input 0
    input  wire in1,     // Data input 1
    input  wire select,  // Select line (0 for in0, 1 for in1)
    output reg  out      // Output of the multiplexer. Declared as 'reg' because it's assigned inside an 'always' block.
);

// This always block describes the behavioral logic of the MUX.
// It is sensitive to changes in any of its inputs (in0, in1, select).
always @(*) begin
    if (select == 1'b1) begin
        out = in1; // Output is in1
    end else begin
        out = in0; // Output is in0
    end
end

endmodule
