module serial_adder (
  input wire clk,        // Clock input
  input wire reset,      // Reset input
  input wire A,          // First binary input bit
  input wire B,          // Second binary input bit
  input wire cin,        // Carry input
  output wire sum,       // Sum output bit
  output wire cout       // Carry output bit
);

  reg sum_reg;           // Sum register
  wire xor_out, and_out; // Intermediate wires for XOR and AND gates

  // XOR gate for sum bit
  assign xor_out = A ^ B;

  // AND gate for carry out bit
  assign and_out = A & B;

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      sum_reg <= 1'b0; // Reset the sum register to zero
      cout <= 1'b0;    // Reset carry output to zero
    end else begin
      // Calculate the new sum and carry output
      sum_reg <= xor_out ^ cin;
      cout <= (xor_out & cin) | and_out;
    end
  end

  assign sum = sum_reg; // Output is the sum bit

endmodule
