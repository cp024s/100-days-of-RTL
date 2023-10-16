module caesar_cipher_tb;

    // Declare signals for the testbench
    reg [7:0] plaintext;
    reg [3:0] shift;
    wire [7:0] ciphertext;

    // Instantiate the caesar_cipher module
    caesar_cipher caesar_inst (
        .plaintext(plaintext),
        .shift(shift),
        .ciphertext(ciphertext)
    );

    // Initialize the testbench
    initial begin
        $display("Testbench for Caesar Cipher");

        // Test Case 1: Shift by 3
        plaintext = 65; // ASCII 'A'
        shift = 3;
        #10; // Wait for some time
        if (ciphertext === 68) $display("Test Case 1 Passed");
        else $display("Test Case 1 Failed");

        // Test Case 2: Shift by 10
        plaintext = 97; // ASCII 'a'
        shift = 10;
        #10; // Wait for some time
        if (ciphertext === 107) $display("Test Case 2 Passed");
        else $display("Test Case 2 Failed");

        // Test Case 3: Shift by 5
        plaintext = 87; // ASCII 'W'
        shift = 5;
        #10; // Wait for some time
        if (ciphertext === 82) $display("Test Case 3 Passed");
        else $display("Test Case 3 Failed");

        // Test Case 4: Shift by 15
        plaintext = 122; // ASCII 'z'
        shift = 15;
        #10; // Wait for some time
        if (ciphertext === 97) $display("Test Case 4 Passed");
        else $display("Test Case 4 Failed");

        // Test Case 5: Shift by 8
        plaintext = 32; // Space character
        shift = 8;
        #10; // Wait for some time
        if (ciphertext === 32) $display("Test Case 5 Passed");
        else $display("Test Case 5 Failed");

        // Finish the simulation
        $finish;
    end

endmodule

// Simulate the testbench
initial begin
    $dumpfile("caesar_cipher_tb.vcd");
    $dumpvars(0, caesar_cipher_tb);
    $display("Starting simulation...");
    $monitor("plaintext = %d, shift = %d, ciphertext = %d", plaintext, shift, ciphertext);
    $display("------------------------------");

    // Run the simulation
    #100; // Simulate for 100 time units

    $display("Simulation complete.");
    $finish;
end
