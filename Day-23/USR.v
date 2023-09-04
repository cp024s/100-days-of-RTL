module Universal_Shift_Register (
  input wire clk,        // Clock input
  input wire reset,      // Reset input
  input wire load,       // Load input
  input wire shift_left, // Shift left input
  input wire shift_right, // Shift right input
  input wire serial_in,  // Serial input
  input wire enable,     // Enable input
  output wire [3:0] q    // 4-bit output
);

  reg [3:0] data_reg;

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      data_reg <= 4'b0000; // Reset to all zeros
    end else if (load) begin
      data_reg <= serial_in; // Load parallel data
    end else if (enable) begin
      if (shift_left) begin
        data_reg <= {data_reg[2:0], data_reg[3]}; // Shift left
      end else if (shift_right) begin
        data_reg <= {data_reg[0], data_reg[3:1]}; // Shift right
      end
    end
  end

  assign q = data_reg;

endmodule
