module fifo(
  input wire clk,        // Clock signal
  input wire rst,        // Reset signal
  input wire wr_en,      // Write enable signal
  input wire rd_en,      // Read enable signal
  input wire [7:0] data_in,  // Data input (8 bits)
  output wire [7:0] data_out  // Data output (8 bits)
);

  reg [7:0] memory [0:3];  // 4-word memory
  reg [2:0] wr_ptr;        // Write pointer (3 bits)
  reg [2:0] rd_ptr;        // Read pointer (3 bits)
  reg [2:0] count;         // Count of data in the FIFO (3 bits)

  // Write logic
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      wr_ptr <= 3'b000;   // Reset write pointer
      count <= 3'b000;    // Reset count
    end else if (wr_en) begin
      memory[wr_ptr] <= data_in;  // Write data to memory
      wr_ptr <= (wr_ptr + 1) % 4;  // Increment write pointer
      count <= count + 1;         // Increment count
    end
  end

  // Read logic
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      rd_ptr <= 3'b000;   // Reset read pointer
    end else if (rd_en && count > 0) begin
      data_out <= memory[rd_ptr];  // Read data from memory
      rd_ptr <= (rd_ptr + 1) % 4;  // Increment read pointer
      count <= count - 1;          // Decrement count
    end
  end

endmodule
