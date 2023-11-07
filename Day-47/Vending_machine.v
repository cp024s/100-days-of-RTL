module coin (
input clock,
input reset,
input i,
input j,
output x,
output y
);
parameter
IDLE = 3'b000,
ONE_RUPEE_STATE = 3'b001,
TWO_RUPEE_STATE = 3'b010,
THREE_RUPEE_STATE = 3'b011,
FOUR_RUPEE_STATE = 3'b100;
reg [3:0] p_state, n_state;
always @(posedge clock or posedge reset)
begin
if (reset == 1)
p_state <= IDLE;
else
p_state <= n_state;
end
always @(p_state, i, j)
begin
case (p_state)
IDLE: begin
if (i == 1 && j == 0)
n_state <= ONE_RUPEE_STATE;
else if (i == 1 && j == 1)
n_state <= TWO_RUPEE_STATE;
else
n_state <= IDLE;
End
ONE_RUPEE_STATE: begin
if (i == 1 && j == 0)
n_state <= TWO_RUPEE_STATE;
else if (i == 1 && j == 1)
n_state <= THREE_RUPEE_STATE;
else
n_state <= IDLE;
End
TWO_RUPEE_STATE: begin
if (i == 1 && j == 0)
n_state <= THREE_RUPEE_STATE;
else if (i == 1 && j == 1)
n_state <= FOUR_RUPEE_STATE;
else
n_state <= IDLE;
End
THREE_RUPEE_STATE: begin
if (i == 1 && j == 0)
n_state <= ONE_RUPEE_STATE;
else if (i == 1 && j == 1)
n_state <= TWO_RUPEE_STATE;
else
n_state <= IDLE;
End
FOUR_RUPEE_STATE: begin
if (i == 1 && j == 0)
n_state <= TWO_RUPEE_STATE;
else if (i == 1 && j == 1)
n_state <= THREE_RUPEE_STATE;
else
n_state <= IDLE;
end
default: n_state <= IDLE;
endcase
end
assign {x, y} = (p_state == THREE_RUPEE_STATE) ? TWO_RUPEE_STATE : ((p_state ==
FOUR_RUPEE_STATE) ? THREE_RUPEE_STATE : FOUR_RUPEE_STATE);
endmodule
