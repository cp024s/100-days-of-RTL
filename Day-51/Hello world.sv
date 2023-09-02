module testbench;
  initial begin
    // Print "Hello, World!" to the console
    $display("Hello, World!");

    // Terminate the simulation
    $finish;
  end
endmodule

// Instantiate the testbench module
module top;
  testbench tb();
endmodule
