module d_flip_flop (
    input wire d,    // Data input
    input wire clk,  // Clock input
    input wire rst,  // Reset input
    output wire q    // Output
);

  // Implementing D flip-flop behavior
  always @(posedge clk or posedge rst) begin
    if (rst)         // Reset takes precedence
      q <= 1'b0;
    else
      q <= d;        // Store the input on the rising clock edge
  end

endmodule
