// Half Adder module definition
module Half_adder(input A, input B, output S, output C);
    // Sum output
    assign S = A ^ B; // XOR operation
    // Carry output
    assign C = A & B; // AND operation
endmodule
