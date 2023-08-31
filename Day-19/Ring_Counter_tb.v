module RingCounter_Testbench();

    // Inputs
    reg clk;      // Clock signal
    reg rst;      // Reset signal

    // Outputs
    wire [3:0] out;  // Output from the RingCounter module

    // Instantiate the RingCounter module
    RingCounter uut (
        .clk(clk),
        .rst(rst),
        .out(out)
    );

    // Clock generation
    always begin
        clk = 0;
        #5;  // 5 time units delay
        clk = 1;
        #5;  // 5 time units delay
    end

    // Testbench initialization
    initial begin
        $display("Time  Ring Counter");
        $monitor("%2t  %b", $time, out);

        // Initialize inputs
        rst = 1;
        #10; // Wait for 10 time units
        rst = 0;

        // Simulate for 20 clock cycles
        #100; // Wait for 100 time units

        // Finish simulation
        $finish;
    end

endmodule
