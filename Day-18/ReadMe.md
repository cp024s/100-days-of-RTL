# Johnson Counter

## Overview

This repository contains a Verilog implementation of a 4-bit Johnson counter along with its testbench. A Johnson counter is a digital sequential circuit that cycles through a sequence of binary states, ensuring that only one bit changes at a time as it progresses through the sequence.

## Contents

- `johnson_counter.v`: This is the main Verilog module that defines the 4-bit Johnson counter. It includes the state transitions and state logic.
- `testbench.v`: This file is the testbench for the Johnson counter. It contains the clock generation, initialization, and display of the counter's output.
- `tb_johnson_counter.v`: An alternative testbench file that also simulates the Johnson counter. Use either this or `testbench.v` for simulation.

## Usage

To use this Johnson counter implementation and testbench, follow these steps:

1. **Simulator Setup**: Ensure that you have a Verilog simulator such as ModelSim or Synopsys VCS installed on your system.

2. **Simulation**: You can choose either `testbench.v` or `tb_johnson_counter.v` for simulation. To simulate using ModelSim, for example, you can run the following commands:

   ```shell
   $ vlog johnson_counter.v testbench.v   # Compile the Verilog files
   $ vsim -c testbench                   # Run the simulation
   ```

3. **View Output**: After running the simulation, you can observe the Johnson counter's output in the simulation window. The counter's output will be displayed in binary format.

4. **Customization**: You can modify the counter's width (currently set to 4 bits) or other parameters in `johnson_counter.v` to suit your requirements.
