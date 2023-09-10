module two_port_ram (
  input wire clk,
  input wire rst,
  input wire [7:0] addr1, // Address for port 1
  input wire [7:0] addr2, // Address for port 2
  input wire [7:0] data_in1, // Data input for port 1
  input wire [7:0] data_in2, // Data input for port 2
  input wire write_en1, // Write enable for port 1
  input wire write_en2, // Write enable for port 2
  output wire [7:0] data_out1, // Data output for port 1
  output wire [7:0] data_out2 // Data output for port 2
);

  reg [7:0] memory [0:255]; // 256 x 8-bit memory

  // Read data from the memory for port 1
  assign data_out1 = (write_en1) ? 8'bZ : memory[addr1];

  // Read data from the memory for port 2
  assign data_out2 = (write_en2) ? 8'bZ : memory[addr2];

  // Write data to the memory for port 1
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      memory[addr1] <= 8'b0;
    end else if (write_en1) begin
      memory[addr1] <= data_in1;
    end
  end

  // Write data to the memory for port 2
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      memory[addr2] <= 8'b0;
    end else if (write_en2) begin
      memory[addr2] <= data_in2;
    end
  end

endmodule
