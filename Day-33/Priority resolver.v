module PriorityResolver (
  input wire [N-1:0] inputs, // N input signals to be prioritized
  output wire [N-1:0] output // Output representing the highest priority input
);

  reg [N-1:0] priority_output; // Register to store the priority output

  always @(*) begin
    // Initialize priority_output to all zeros
    priority_output = 0;

    // Iterate through each input signal
    for (i = 0; i < N; i = i + 1) begin
      // If the current input is asserted and higher priority input
      // hasn't been found yet, update the priority_output
      if (inputs[i] && (priority_output == 0)) begin
        priority_output = 1 << i;
      end
    end
  end

  assign output = priority_output; // Assign the priority output to the output port

endmodule
