module piso_shift_register (
  input wire clk,           // Clock input
  input wire reset,         // Reset input
  input wire [7:0] parallel_in, // Parallel input data (8 bits)
  input wire shift_enable,  // Shift enable control signal
  output wire serial_out    // Serial output
);

  reg [7:0] shift_reg;      // 8-bit shift register
  reg [2:0] shift_counter;  // Shift counter for serial output

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      shift_reg <= 8'b0;    // Reset the shift register to all zeros
      shift_counter <= 3'b0; // Reset the shift counter
    end else if (shift_enable) begin
      // Load parallel data when shift enable is asserted
      shift_reg <= parallel_in;
      // Increment the shift counter
      shift_counter <= shift_counter + 1;
    end else begin
      // Shift right when shift enable is deasserted
      shift_reg <= {1'b0, shift_reg[7:1]}; // Shift the data
    end
  end

  assign serial_out = shift_reg[0]; // Serial output is the least significant bit

endmodule
