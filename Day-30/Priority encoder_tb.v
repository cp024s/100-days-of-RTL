module Testbench_PriorityEncoder8to3;

    reg enable, clear;
    reg [7:0] inputs;
    wire [2:0] output;

    // Instantiate the priority encoder module
    PriorityEncoder8to3 uut (
        .enable(enable),
        .clear(clear),
        .inputs(inputs),
        .output(output)
    );

    // Clock generation
    reg clk = 0;
    always #5 clk = ~clk;

    // Stimulus generation
    initial begin
        enable = 1;
        clear = 0;

        // Test all 256 input combinations
        for (int i = 0; i < 256; i = i + 1) begin
            inputs = i;
            #10;

            $display("Input: %b, Output: %b", inputs, output);
        end

        // End simulation
        $finish;
    end

    // Clock driver
    always begin
        #5 clk = ~clk;
    end

endmodule
