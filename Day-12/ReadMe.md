# SR FLIP FLOP

### Overview
The SR (Set-Reset) flip-flop is a fundamental digital logic circuit used in digital electronics and sequential logic design. It is a bistable multivibrator, meaning it has two stable states and can store one bit of information. The SR flip-flop is also known as the Set-Reset flip-flop, S-R latch, or SR NOR latch. This description provides an overview of the SR flip-flop's purpose, behavior, and applications.

### Purpose
The primary purpose of the SR flip-flop is to store a single binary digit (0 or 1) as an output state. It is a simple memory element that can be set to 1 (set state) or reset to 0 (reset state) using external control inputs. The state of the SR flip-flop remains stable until a change in the control inputs triggers a transition.

### Behavior
The SR flip-flop consists of two inputs, S (Set) and R (Reset), and two outputs, Q and ~Q (complement of Q). Its behavior can be summarized as follows:

When the Set input (S) is activated (set to 1), the Q output becomes 1, and ~Q becomes 0. This is referred to as the "set" state.

When the Reset input (R) is activated (set to 1), the Q output becomes 0, and ~Q becomes 1. This is referred to as the "reset" state.

If both Set and Reset inputs are inactive (both set to 0), the SR flip-flop retains its current state (Q and ~Q remain unchanged).

If both Set and Reset inputs are simultaneously activated (both set to 1), it leads to an undefined or prohibited state. In practical applications, this condition is avoided to maintain proper operation.
<br>
## Verilog Part

### Inputs and Outputs
- ***S (Set):*** The Set input. When set to 1, it sets the Q output to 1.
- ***R (Reset):*** The Reset input. When set to 1, it resets the Q output to 0.
- ***CLK (Clock):*** The clock input for synchronous operation.
- ***Q:*** The Q output of the flip-flop.
- ***~Q (Inverted Q):*** The complement of the Q output.

### Behavior
The SRFlipFlop module operates as follows:

- When both S and R are inactive (0), the flip-flop maintains its previous state.
- When S is asserted (1) and R is not asserted (0), the flip-flop sets Q to 1.
- When R is asserted (1) and S is not asserted (0), the flip-flop resets Q to 0.
- When both S and R are asserted (1), the behavior is undefined, and the Q output should not be relied upon.



### Overview
The SRFlipFlop_TB testbench is designed to verify the functionality of the SRFlipFlop module, a Verilog implementation of a Set-Reset (SR) flip-flop. This README provides an overview of the testbench and instructions on how to use it for simulation.

### Testbench Files
- `SRFlipFlop_TB.v`: The Verilog testbench code.
- `SRFlipFlop.v`: The Verilog module being tested (SRFlipFlop).
