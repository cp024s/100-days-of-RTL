## In this code:

- `RAM_4x4` is the name of the module.
- `address` is a 2-bit input that specifies the memory location to read from or write to.
- `write_enable` is a control signal that enables or disables write operations.
- `data_input` is a 4-bit input used for writing data into the memory.
- `data_output` is a 4-bit output that provides the data read from the memory.

The memory is implemented as an array of 4-bit registers (`memory`) with four locations (0 to 3). The `always` block is sensitive to positive edges of both `write_enable` and `address`. When `write_enable` is asserted, it writes `data_input` into the specified memory location. When `write_enable` is not asserted, it reads data from the specified memory location and drives it to `data_output`.

## In this Test bench:

- The RAM_4x4 module is instantiated, and its inputs and outputs are connected.
- A clock signal is generated with a 10-unit time period.
- The testbench initializes the address, write_enable, and data_input signals.
- It first writes data (1101) to the RAM at address 01 and then reads the data from the same address.
- Finally, it checks whether the data output matches the expected value and prints a pass or fail message accordingly.
