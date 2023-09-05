module RAM_4x4 (
  input wire [1:0] address,
  input wire write_enable,
  input wire [3:0] data_input,
  output wire [3:0] data_output
);

  reg [3:0] memory [0:3];

  assign data_output = (write_enable) ? 4'bZZZZ : memory[address];

  always @(posedge write_enable or posedge address)
  begin
    if (write_enable)
      memory[address] <= data_input;
  end

endmodule
