// File: and_gate.v
// This module implements a 2-input AND gate.
module or_gate (
 input a, // First input
 input b, // Second input
 output y // Output of the AND gate
 );
 // Continuous assignment to define the combinational logic
 assign y = a | b;
endmodule