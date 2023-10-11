module testbench;

  // Parameters
  reg [3:0] data_input [0:15];
  wire [6:0] codeword_output [0:15];

  // Instantiate the Hamming code generator module
  hamming_code_generator uut (
    .data_input(data_input),
    .codeword_output(codeword_output)
  );

  // Testbench stimulus
  initial begin
    // Initialize the data inputs
    data_input[0] = 4'b0000;
    data_input[1] = 4'b0101;
    data_input[2] = 4'b1100;
    data_input[3] = 4'b1001;
    data_input[4] = 4'b1111;
    data_input[5] = 4'b0110;
    data_input[6] = 4'b1010;
    data_input[7] = 4'b0011;
    data_input[8] = 4'b1000;
    data_input[9] = 4'b0100;
    data_input[10] = 4'b0010;
    data_input[11] = 4'b0001;
    data_input[12] = 4'b1011;
    data_input[13] = 4'b1101;
    data_input[14] = 4'b0111;
    data_input[15] = 4'b1110;

    // Apply data inputs and display codewords
    for (int i = 0; i < 16; i = i + 1) begin
      #10 data_input = data_input + 1;
      $display("Data Input = %b, Codeword Output = %b", data_input[i], codeword_output[i]);
    end

    $finish;
  end

endmodule
