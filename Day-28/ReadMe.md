## FIFO Queue
- `module fifo(...)`: This line defines a Verilog module named `fifo` with input and output ports.

- `reg [7:0] memory [0:3];`: This declares a 4-word memory array. Each word is 8 bits wide, and there are four words in total. This is where data is stored.

- `reg [2:0] wr_ptr;`, `reg [2:0] rd_ptr;`, and `reg [2:0] count;`: These lines declare three 3-bit registers. `wr_ptr` is used as the write pointer to track where the next write operation should occur in the memory. `rd_ptr` is used as the read pointer to track where the next read operation should occur in the memory. `count` is used to keep track of how many words are currently stored in the FIFO.


- `Write logic`
  - This section defines the write logic for the FIFO. It is sensitive to the rising edge of the clock (`posedge clk`) and the rising edge of the reset signal (`posedge rst`). Inside this block:
  - When `rst` is asserted (high), it resets the `wr_ptr` and `count` to zero.
  - When `wr_en` is asserted (high), it writes the `data_in` to the memory at the location specified by `wr_ptr`, increments `wr_ptr`, and increments the `count`.


- `Read logic`
  - This section defines the read logic for the FIFO. Like the write logic, it is sensitive to the rising edge of the clock and reset signal. Inside this block:
  - When `rst` is asserted, it resets the `rd_ptr`.
  - When `rd_en` is asserted and `count` is greater than zero, it reads data from the memory at the location specified by `rd_ptr`, increments `rd_ptr`, and decrements the `count`. The read data is assigned to `data_out`.

The module `fifo` is now fully described, with separate blocks for write and read logic to handle data writing and reading in a FIFO manner. This simple FIFO implementation can be instantiated and connected to other parts of your larger digital design.
