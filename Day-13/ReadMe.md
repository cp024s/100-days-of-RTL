# JK FLIP FLOP

A JK flip-flop is a type of sequential logic circuit commonly used in digital electronics and can be implemented in Verilog, a hardware description language. It has two inputs, J (set) and K (reset), and two outputs, Q and Q'. The JK flip-flop has the following behavior:

When J and K are both set to 0, the flip-flop holds its previous state (Q remains unchanged).

When J is set to 1 and K is set to 0, the flip-flop sets its output Q to 1 (Q = 1).

When J is set to 0 and K is set to 1, the flip-flop resets its output Q to 0 (Q = 0).

When both J and K are set to 1, the flip-flop toggles its state. If Q is 0, it becomes 1, and if Q is 1, it becomes 0.

## Verilog Explanation

### In this Verilog code:

- ***J and K*** are the input wires representing the J and K inputs.
- ***clock*** is the clock input.
- ***reset*** is the reset input.
- ***Q*** is the Q output.
- ***Qbar*** is the complement of Q.
- Inside the always block, there is a synchronous process sensitive to the rising edge of the clock signal and the rising edge of the reset signal. It implements the JK flip-flop behavior using a case statement.

### In this testbench:

- We instantiate the JK flip-flop module and connect its inputs and outputs to the testbench signals.
- We generate a clock signal (clk) and toggle it with a period of 10 time units.
- We initialize the inputs with different test cases. For each test case, we apply inputs, wait for a period, and then change the inputs. We also display the values of J, K, Q, and Qbar at each time step.
- After all test cases are complete, we finish the simulation using $finish.
