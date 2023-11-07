module coin_tb();
reg i, j, clock, reset;
wire x, y;
parameter CYCLE = 10; // DUT
coin FSM(
.i(i),
.j(j),
.clock(clock),
.reset(reset),
.x(x),
.y(y)
);
initial begin
clock = 1'b0;
forever
#(CYCLE/2) clock = ~clock;
end
task initialize;
begin
{i, j, reset} = 0;
end
endtask
// Delay task
task delay(input integer d);
begin
#d;
end
endtask
task RESET;
begin
@(negedge clock);
reset = 1'b1;
@(negedge clock);
reset = 1'b0;
end
endtask
task stimulus(input m, input n);
begin
@(negedge clock);
i = m;
j = n;
end
endtask
initial
$monitor("reset=%b, clock=%b, i=%b, j=%b, Output x=%b, y=%b", reset, clock, i, j, x, y);
initial begin
$dumpfile("dump.vcd");
$dumpvars;
end
initial begin
initialize;
RESET;
stimulus(0, 0);
stimulus(1, 0);
stimulus(0, 1);
stimulus(1, 1);
stimulus(0, 0);
stimulus(1, 0);
stimulus(1, 1);
RESET;
stimulus(1, 0);
stimulus(0, 1);
stimulus(1, 1);
stimulus(1, 1);
delay(10);
$finish;
end
endmodule
