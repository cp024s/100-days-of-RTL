module lifo_queue (
  input wire clk,            // Clock signal
  input wire reset,          // Reset signal
  input wire push,           // Push data into the queue
  input wire pop,            // Pop data from the queue
  input wire [7:0] data_in,  // Data to be pushed into the queue
  output wire [7:0] data_out // Data popped from the queue
);

  reg [7:0] queue [3:0];     // LIFO queue with 4 elements
  reg [1:0] top;              // Top pointer

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      top <= 2'b00;           // Reset top pointer
      queue[0] <= 8'b0;       // Clear all elements in the queue
      queue[1] <= 8'b0;
      queue[2] <= 8'b0;
      queue[3] <= 8'b0;
    end else begin
      if (push) begin
        if (top < 2'b11) begin
          top <= top + 1;     // Increment top pointer for push
          queue[top] <= data_in; // Push data into the queue
        end
      end else if (pop) begin
        if (top > 2'b00) begin
          data_out <= queue[top]; // Pop data from the queue
          top <= top - 1;         // Decrement top pointer for pop
        end
      end
    end
  end

endmodule
