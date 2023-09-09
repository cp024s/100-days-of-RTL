module ParallelShifter(
  input [7:0] data_in,       // 8-bit input data
  input [2:0] shift_amount,  // 3-bit control signal for shifting amount
  input shift_direction,     // Control signal for shifting direction (0 for left, 1 for right)
  output [7:0] data_out      // 8-bit output data
);

reg [7:0] shifted_data;

always @(*) begin
  case (shift_direction)
    0: shifted_data = data_in << shift_amount;  // Left shift
    1: shifted_data = data_in >> shift_amount;  // Right shift
    default: shifted_data = 8'b0;               // No shift by default
  endcase
end

assign data_out = shifted_data;

endmodule
