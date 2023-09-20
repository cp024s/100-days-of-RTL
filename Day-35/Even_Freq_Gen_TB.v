`timescale 1ns/1ps

module EvenFrequencyGenerator_TB;
    reg clk;               // Clock signal
    reg rst;               // Reset signal
    wire even_freq_out;   // Output signal

    // Instantiate the EvenFrequencyGenerator module
    EvenFrequencyGenerator uut (
        .clk(clk),
        .rst(rst),
        .even_freq_out(even_freq_out)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;      // Toggle the clock every 5 time units
    end

    initial begin
        // Initialize signals
        clk = 0;
        rst = 0;

        // Apply reset
        rst = 1;
        #10 rst = 0;

        // Simulate for 100 time units
        #100 $finish;
    end

    // Display even_freq_out
    always @(posedge clk) begin
        $display("even_freq_out = %b", even_freq_out);
    end

endmodule
