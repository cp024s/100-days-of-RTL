// Johnson Counter Module
module johnson_counter (
    input wire clk,    // Clock input
    input wire reset,  // Reset input
    output reg [3:0] q // 4-bit Johnson counter output
);

// Define internal signals
reg [3:0] q_next;

// Johnson counter state transitions
always @(posedge clk or posedge reset) begin
    if (reset) begin
        q <= 4'b0001; // Reset state
    end else begin
        q <= q_next; // Update state
    end
end

// Johnson counter state logic
always @(posedge clk) begin
    q_next[0] <= q[1];
    q_next[1] <= q[2];
    q_next[2] <= q[3];
    q_next[3] <= ~q[3];
end

endmodule
