# Counter

1. **Module Declaration:** The code begins by declaring a Verilog module named `SimpleCounter` This module has three ports:

    `clk`: This is the clock input signal. <br>
    `reset`: This is the reset input signal. <br>
    `count`: This is a 4-bit output signal representing the count value. <br>

2. **4-Bit Register:** Inside the module, there's a 4-bit register named `count`. This register holds the current count value. Registers are used to store and update data in digital circuits.

3. **Always Block:** The core functionality of the counter is defined within an `always` block. This block is sensitive to the positive edges of both the clock signal (`posedge clk`) and the reset signal (`posedge reset`). This means that the block's contents will execute whenever there is a rising edge on either the clock or the reset signal.

4. **Reset Logic:** Inside the `always` block, there's an if statement. When the reset signal is asserted (`high`), indicated by if (`reset`), the count is set to 4'b0000, effectively resetting the counter to zero. This ensures that the counter can be initialized to a known state.

5. **Counting Logic:** When the clock signal transitions to the positive edge (indicated by `posedge clk`), and the reset signal is not asserted, the counter count is incremented by 1. This simple logic increments the count value each time the clock rises.

6. **Assign Statement:** Finally, there's an `assign` statement that continuously assigns the value of `count` to the output count. This makes the current count value available at the module's output for external use.

<hr>

# Counter - TB

1. The testbench begins with a declaration of signals:  <br>
            `clk` for the clock input. <br>
            `reset` for the reset input. <br>
            `count` to monitor the counter's output. <br>

2. The `SimpleCounter` module is instantiated within the testbench, connecting its inputs and outputs to the corresponding signals declared in the testbench.

3. A clock signal is generated using an `always` block. In this case, the clock is toggled every 5 time units using `#5`.

4. The testbench initializes signals by setting `clk` to 0 and asserting the `reset` signal for a brief period to initialize the counter to zero.

5. Inside the `initial` block, the testbench monitors the `count` signal and displays its value using `$display` at each time step.

6. The simulation is run for 100 time units using `$finish`. You can adjust this value to control the simulation duration.
