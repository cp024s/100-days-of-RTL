module hamming_code_generator (
  input [3:0] data_input,
  output reg [6:0] codeword_output
);

reg [3:0] parity_bits;
reg [3:0] data_bits;

always @(data_input) begin
  // Split the 4-bit data into data bits and parity bits
  data_bits[0] = data_input[0];
  data_bits[1] = data_input[1];
  data_bits[2] = data_input[2];
  data_bits[3] = data_input[3];

  // Calculate parity bits
  parity_bits[0] = data_bits[0] ^ data_bits[1] ^ data_bits[3];
  parity_bits[1] = data_bits[0] ^ data_bits[2] ^ data_bits[3];
  parity_bits[2] = data_bits[1] ^ data_bits[2] ^ data_bits[3];

  // Create the 7-bit codeword with data and parity bits
  codeword_output[0] = data_bits[0];
  codeword_output[1] = data_bits[1];
  codeword_output[2] = parity_bits[0];
  codeword_output[3] = data_bits[2];
  codeword_output[4] = parity_bits[1];
  codeword_output[5] = parity_bits[2];
  codeword_output[6] = data_bits[3];
end

endmodule
