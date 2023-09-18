module PriorityResolver_tb;

  // Define parameters
  parameter N = 3; // Number of inputs

  // Declare signals
  reg [N-1:0] inputs;
  wire [N-1:0] output;

  // Instantiate the PriorityResolver module
  PriorityResolver #(N) uut (
    .inputs(inputs),
    .output(output)
  );

  // Stimulus generation
  initial begin
    $monitor("Time=%0t inputs=%b output=%b", $time, inputs, output);

    // Test all possible input combinations
    for (int i = 0; i < 2**N; i = i + 1) begin
      inputs = i;
      #10; // Allow some time for the output to settle
    end

    // End simulation
    $finish;
  end

endmodule
