module master_slave_flip_flop (
  input wire clk,       // Clock input
  input wire rst,       // Reset input
  input wire d,         // Data input
  output reg q         // Output
);

  // Master flip-flop
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      q <= 1'b0;       // Reset the output to 0
    end else begin
      q <= d;          // Update the output with the input data
    end
  end

  // Slave flip-flop
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      // The slave flip-flop is also reset with the master flip-flop
    end else begin
      // The slave flip-flop captures the output of the master flip-flop
    end
  end

endmodule
