module jk_flip_flop (
  input wire J,
  input wire K,
  input wire clock,
  input wire reset,
  output wire Q,
  output wire Qbar
);

  reg Q;

  always @(posedge clock or posedge reset) begin
    if (reset) begin
      // Reset condition, clear the flip-flop
      Q <= 0;
    end else begin
      // JK flip-flop logic
      case ({J, K})
        2'b00: Q <= Q;     // No change
        2'b01: Q <= 0;      // Reset
        2'b10: Q <= 1;      // Set
        2'b11: Q <= ~Q;     // Toggle
      endcase
    end
  end

  // Qbar is the complement of Q
  assign Qbar = ~Q;

endmodule
