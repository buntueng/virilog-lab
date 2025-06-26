// File: up_counter.v
// This module implements a 4-bit asynchronous reset up-counter.

module up_counter (
    input wire clk,         // Clock input: drives sequential logic
    input wire reset,       // Asynchronous reset input: clears counter immediately
    output reg [3:0] count  // 4-bit counter output: declared as 'reg' to hold its state
);

// Always block for sequential logic.
// Triggered on positive edge of clock OR positive edge of reset.
always @(posedge clk or posedge reset) begin
    if (reset) begin
        count <= 4'b0000;    // Asynchronously reset count to 0
    end else begin
        count <= count + 1;  // Increment count on positive clock edge
    end
end

endmodule
