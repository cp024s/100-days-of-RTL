module palindrome_checker (
  input wire [7:0] data_in,
  output wire is_palindrome
);

  reg [7:0] reversed_data;
  wire [7:0] data_in_flipped;

  assign data_in_flipped = {data_in[0], data_in[1], data_in[2], data_in[3], data_in[4], data_in[5], data_in[6], data_in[7]};
  
  always @(*) begin
    reversed_data = {data_in_flipped[7], data_in_flipped[6], data_in_flipped[5], data_in_flipped[4], data_in_flipped[3], data_in_flipped[2], data_in_flipped[1], data_in_flipped[0]};
  end

  assign is_palindrome = (data_in == reversed_data);

endmodule
