# UNIVERSAL SHIFT REGISTER
A universal shift register is a digital circuit that can perform both parallel loading and serial shifting of data. It can shift data left or right, load data in parallel, and perform other operations. Here's a simple example of a universal shift register implemented in Verilog. This code demonstrates a basic 4-bit universal shift register that supports left shift, right shift, parallel load, and serial input.

<hr>

## In this Verilog code:

- `clk` is the clock signal used for synchronization.
- `reset` is the reset input to initialize the register.
- `load` is the parallel load control input.
- `shift_left` and `shift_right` are the shift direction control inputs.
- `serial_in` is the serial input data.
- `enable` is an enable signal to control when shifting occurs.
- `q` is the 4-bit output representing the contents of the shift register.

You can use this module in your larger Verilog design to create a universal shift register that suits your specific requirements. Make sure to instantiate this module and connect the inputs and outputs appropriately within your design.

To test the Verilog code for the universal shift register, you can create a testbench. A testbench simulates the behavior of your module and checks if it's working correctly. Here's a basic testbench for the universal shift register:

## In this testbench:

- We instantiate the `Universal_Shift_Register` module and connect its inputs and outputs.
- We generate a clock signal (`clk`) and toggle it every 5 time units.
- We simulate a test sequence:
  - Reset the universal shift register.
  - Load data into the register.
  - Perform a left shift.
  - Perform a right shift.
  - Observe the output (`q`) using the `$display` statement.

To simulate and test your design, you would need a Verilog simulator such as ModelSim or XSIM (Xilinx Simulator). Compile both your module and the testbench, and then run the simulation. The testbench will check if the universal shift register behaves as expected under different inputs and operations.
