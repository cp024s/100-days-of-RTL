module SR_Latch (
    input wire S,   // Set input
    input wire R,   // Reset input
    output wire Q,  // Q output
    output wire Qn  // Q' (not Q) output
);

    reg Q, Qn;  // Output registers

    // SR latch logic
    always @(S, R) begin
        if (R && !S) begin
            Q <= 0;
            Qn <= 1;
        end else if (!R && S) begin
            Q <= 1;
            Qn <= 0;
        end else begin
            // No change in state when both inputs are 0 or both are 1
        end
    end

endmodule
