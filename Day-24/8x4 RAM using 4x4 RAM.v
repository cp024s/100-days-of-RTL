module RAM_8x4 (
  input wire [2:0] address,
  input wire write_enable,
  input wire [3:0] data_input,
  output wire [3:0] data_output
);

  wire [3:0] data_out1, data_out2;
  wire [1:0] addr1, addr2;

  // Split the 3-bit address into two 2-bit addresses
  assign addr1 = address[2:1];
  assign addr2 = address[0];

  // Instantiate four 4x4 RAM modules
  RAM_4x4 RAM1 (.address(addr1), .write_enable(write_enable), .data_input(data_input), .data_output(data_out1));
  RAM_4x4 RAM2 (.address(addr2), .write_enable(write_enable), .data_input(data_input), .data_output(data_out2));
  
  // Multiplex the outputs based on the address
  always @(*)
  begin
    case (address)
      3'b000: data_output = data_out1;
      3'b001: data_output = {data_out2[3], data_out1[3:0]};
      3'b010: data_output = {data_out2[2:0], data_out1[3:1]};
      3'b011: data_output = {data_out2[1:0], data_out1[3:2]};
      3'b100: data_output = {data_out2[0], data_out1[3:3]};
      default: data_output = 4'bZZZZ; // Invalid address
    endcase
  end

endmodule   
