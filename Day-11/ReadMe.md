# D FLIP FLOP

- ***D*** is the data input. <br>
- ***clk*** is the clock input, which triggers the flip-flop on the rising edge. <br>
- ***rst*** is the reset input, which asynchronously sets the output to 0 (1'b0) when asserted. <br>
- ***q*** is the output of the flip-flop, which stores the value of d on the rising edge of the clock if the reset is not active. <br>
- You can instantiate this module in your Verilog design and connect it to other components as needed. Remember to include the necessary clock and reset signals in your overall design to properly control the flip-flop's behavior. <br>

### Testbench Code
This testbench includes: <br>
- Clock generation with a 50% duty cycle. <br>
- Stimulus generation to apply and release reset and change the data input. <br>
- A display statement to show the simulation time, inputs, and the flip-flop's output (q) whenever the clock edge occurs.
