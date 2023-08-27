module SR_Latch_Testbench;

    // Declare signals for the SR latch module
    reg S, R;        // Inputs
    wire Q, Qn;      // Outputs

    // Instantiate the SR latch module
    SR_Latch SR_Latch_inst (
        .S(S),
        .R(R),
        .Q(Q),
        .Qn(Qn)
    );

    // Stimulus generation
    initial begin
        // Initialize inputs
        S = 0;
        R = 0;

        // Apply test cases
        #10 S = 1;     // Set the latch (Q should become 1)
        #10 R = 1;     // Reset the latch (Q should become 0)
        #10 S = 0;     // Release Set (no change in Q)
        #10 R = 0;     // Release Reset (no change in Q)
        #10 S = 1;     // Set the latch again (Q should become 1)
        #10 R = 1;     // Reset the latch again (Q should become 0)
        #10 S = 0;     // Release Set (no change in Q)
        #10 R = 0;     // Release Reset (no change in Q)
        
        // Add more test cases if needed

        // End simulation
        $finish;
    end

    // Display the results
    always @(posedge S, posedge R) begin
        $display("S=%b, R=%b, Q=%b, Qn=%b", S, R, Q, Qn);
    end

endmodule
