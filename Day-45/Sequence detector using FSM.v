module SequenceDetector (
  input wire clk,
  input wire reset,
  input wire data_in,
  output reg detected
);

// Define states
parameter S0 = 2'b00;
parameter S1 = 2'b01;
parameter S2 = 2'b10;
parameter S3 = 2'b11;

// Define state register
reg [1:0] state, next_state;

// State transition logic
always @(posedge clk or posedge reset) begin
  if (reset)
    state <= S0;
  else
    state <= next_state;
end

// Output logic
always @(state, data_in) begin
  case (state)
    S0: begin
      if (data_in) // Detect '1'
        next_state = S1;
      else
        next_state = S0;
    end
    S1: begin
      if (data_in) // Detect '0'
        next_state = S2;
      else
        next_state = S0;
    end
    S2: begin
      if (data_in) // Detect '1'
        next_state = S3;
      else
        next_state = S0;
    end
    S3: begin
      if (!data_in) // Detect '0'
        next_state = S0;
      else
        next_state = S3;
    end
    default: next_state = S0;
  endcase
end

// Output is high when the sequence is detected
always @(state) begin
  if (state == S3)
    detected = 1'b1;
  else
    detected = 1'b0;
end

endmodule
