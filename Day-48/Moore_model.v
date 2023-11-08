module MooreMachine (
  input clk,
  input reset,
  output reg out_A,
  output reg out_B,
  output reg out_C,
  output reg out_D,
  reg [1:0] state,
  reg [1:0] next_state
);

// Define state encoding
parameter S0 = 2'b00;
parameter S1 = 2'b01;
parameter S2 = 2'b10;
parameter S3 = 2'b11;

// State register
always @(posedge clk or posedge reset) begin
  if (reset) begin
    state <= S0;
  end else begin
    state <= next_state;
  end
end

// Next state logic
always @(*) begin
  case (state)
    S0: next_state = S1;
    S1: next_state = S2;
    S2: next_state = S3;
    S3: next_state = S0;
  endcase
end

// Moore output logic
always @(posedge clk or posedge reset) begin
  if (reset) begin
    out_A <= 1'b0;
    out_B <= 1'b0;
    out_C <= 1'b0;
    out_D <= 1'b0;
  end else begin
    case (state)
      S0: begin
        out_A <= 1'b1;
        out_B <= 1'b0;
        out_C <= 1'b0;
        out_D <= 1'b0;
      end
      S1: begin
        out_A <= 1'b0;
        out_B <= 1'b1;
        out_C <= 1'b0;
        out_D <= 1'b0;
      end
      S2: begin
        out_A <= 1'b0;
        out_B <= 1'b0;
        out_C <= 1'b1;
        out_D <= 1'b0;
      end
      S3: begin
        out_A <= 1'b0;
        out_B <= 1'b0;
        out_C <= 1'b0;
        out_D <= 1'b1;
      end
    endcase
  end
end

endmodule
