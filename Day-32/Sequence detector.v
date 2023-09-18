module sequence_detector_moore(
    input wire clk,        // Clock input
    input wire reset,      // Reset input
    input wire x,          // Input signal

    output reg y          // Output signal
);
    // Define states
    typedef enum logic [1:0] {
        S0,  // State 0: Initial state
        S1,  // State 1: First '1' detected
        S2,  // State 2: '0' after '1'
        S3   // State 3: '1' after '0' (Sequence detected)
    } state_t;

    // Define the state register and initialize to S0
    reg state_t current_state, next_state;

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            current_state <= S0;
        end else begin
            current_state <= next_state;
        end
    end

    // Next state logic and output logic
    always_comb begin
        case (current_state)
            S0: if (x == 1'b1) next_state = S1; else next_state = S0;
            S1: if (x == 1'b0) next_state = S2; else next_state = S1;
            S2: if (x == 1'b1) next_state = S3; else next_state = S0;
            S3: next_state = S0;
            default: next_state = S0;
        endcase
    end

    // Output logic (Moore model)
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            y <= 1'b0; // Reset the output to 0
        end else begin
            case (current_state)
                S3: y <= 1'b1; // Output '1' when sequence is detected
                default: y <= 1'b0; // Output '0' otherwise
            endcase
        end
    end

endmodule
