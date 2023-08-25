# JK FLIP FLOP

A JK flip-flop is a type of sequential logic circuit commonly used in digital electronics and can be implemented in Verilog, a hardware description language. It has two inputs, J (set) and K (reset), and two outputs, Q and Q'. The JK flip-flop has the following behavior:

When J and K are both set to 0, the flip-flop holds its previous state (Q remains unchanged).

When J is set to 1 and K is set to 0, the flip-flop sets its output Q to 1 (Q = 1).

When J is set to 0 and K is set to 1, the flip-flop resets its output Q to 0 (Q = 0).

When both J and K are set to 1, the flip-flop toggles its state. If Q is 0, it becomes 1, and if Q is 1, it becomes 0.
