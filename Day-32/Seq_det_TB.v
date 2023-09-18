module testbench_sequence_detector;

    // Declare signals
    reg clk;
    reg reset;
    reg x;
    wire y;

    // Instantiate the sequence detector module
    sequence_detector_moore seq_detector (
        .clk(clk),
        .reset(reset),
        .x(x),
        .y(y)
    );

    // Clock generation
    always begin
        #5 clk = ~clk; // Toggle the clock every 5 time units
    end

    // Test scenarios
    initial begin
        // Initialize signals
        clk = 0;
        reset = 0;
        x = 0;

        // Case 1: Reset and no sequence detected
        $display("Case 1: Reset and no sequence detected");
        reset = 1;
        #10 reset = 0;
        #20;

        // Case 2: Single '1', no sequence detected
        $display("Case 2: Single '1', no sequence detected");
        x = 1;
        #10 x = 0;
        #20;

        // Case 3: '101' sequence detected
        $display("Case 3: '101' sequence detected");
        x = 1;
        #10 x = 0;
        #10 x = 1;
        #10 x = 0;
        #10;

        // Case 4: Reset and no sequence detected
        $display("Case 4: Reset and no sequence detected");
        reset = 1;
        #10 reset = 0;
        #20;

        // Case 5: '1010' sequence detected
        $display("Case 5: '1010' sequence detected");
        x = 1;
        #10 x = 0;
        #10 x = 1;
        #10 x = 0;
        #10 x = 1;
        #10 x = 0;
        #10;

        // Finish simulation
        $finish;
    end

endmodule
