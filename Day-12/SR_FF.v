module SRFlipFlop (
  input wire S,
  input wire R,
  input wire CLK,
  output wire Q,
  output wire ~Q
);

  reg Q, ~Q;

  always @(posedge CLK) begin
    if (R && ~S) // Invalid condition, both set and reset are active
      Q <= Q; // No change
    else if (R)
      Q <= 0; // Reset
    else if (S)
      Q <= 1; // Set
  end

  assign ~Q = ~Q;

endmodule
