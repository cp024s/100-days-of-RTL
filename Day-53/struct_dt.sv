// Define the unpacked struct
typedef struct packed {
    logic [7:0] data1;
    logic [15:0] data2;
    // ... other members
} my_struct_t;

// Testbench module
module tb;
    // Declare an instance of the struct
    my_struct_t my_struct_instance;

    // Initialize values in the struct
    initial begin
        my_struct_instance.data1 = 8'hFF;
        my_struct_instance.data2 = 16'hABCD;
        
        // Call a function to verify the struct
        if (verify_struct(my_struct_instance))
            $display("Struct verification passed");
        else
            $display("Struct verification failed");
        
        // Additional testing or simulation steps
        // ...
    end

    // Function to verify the struct
    function logic verify_struct(my_struct_t struct_to_verify);
        // Perform verification checks on struct members
        if (struct_to_verify.data1 != 8'hFF)
            return 0; // Verification failed
        
        if (struct_to_verify.data2 != 16'hABCD)
            return 0; // Verification failed

        // Additional verification checks if needed

        // If all checks pass, return success
        return 1;
    endfunction
endmodule
