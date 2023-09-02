In this example:

1. We create a `testbench` module that contains the actual testbench code within an `initial` block.
2. Inside the `initial` block, we use the `$display` system function to print "Hello, World!" to the console.
3. After printing the message, we use `$finish` to terminate the simulation.

The `top` module instantiates the `testbench` module, allowing you to run the simulation.

To simulate this testbench, you can use a SystemVerilog simulator like ModelSim or VCS. Make sure to compile your design files and the testbench file together, and then run the simulation. You should see "Hello, World!" printed in the simulation console.
