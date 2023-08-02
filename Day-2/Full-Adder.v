module FullAdder(
  input wire a, 
  input wire b,
  input wire carry_in,
  output wire sum,
  output wire carry_out
);

  assign sum = a ^ b ^ carry_in;
  assign carry_out = (a & b) | (carry_in & (a ^ b));
  
endmodule
//----------------------------------------------------------------------------------
// test bench module //
module Testbench;

  // Inputs
  reg a, b, carry_in;
  
  // Outputs
  wire sum, carry_out;
  
  // Instantiate the full adder module
  FullAdder dut(
    .a(a),
    .b(b),
    .carry_in(carry_in),
    .sum(sum),
    .carry_out(carry_out)
  );
  
  // Clock signal for testbench
  reg clk = 0;
  
  // Testbench stimulus
  initial begin
    $display("Testbench for Full Adder");
    
    // Testcase 1: a=0, b=0, carry_in=0
    #10 a = 0; b = 0; carry_in = 0;
    #5 $display("a=%b, b=%b, carry_in=%b, sum=%b, carry_out=%b", a, b, carry_in, sum, carry_out);
    
    // Testcase 2: a=0, b=0, carry_in=1
    #10 a = 0; b = 0; carry_in = 1;
    #5 $display("a=%b, b=%b, carry_in=%b, sum=%b, carry_out=%b", a, b, carry_in, sum, carry_out);
    
    // Testcase 3: a=0, b=1, carry_in=0
    #10 a = 0; b = 1; carry_in = 0;
    #5 $display("a=%b, b=%b, carry_in=%b, sum=%b, carry_out=%b", a, b, carry_in, sum, carry_out);
    
    // Testcase 4: a=0, b=1, carry_in=1
    #10 a = 0; b = 1; carry_in = 1;
    #5 $display("a=%b, b=%b, carry_in=%b, sum=%b, carry_out=%b", a, b, carry_in, sum, carry_out);
    
    // Testcase 5: a=1, b=0, carry_in=0
    #10 a = 1; b = 0; carry_in = 0;
    #5 $display("a=%b, b=%b, carry_in=%b, sum=%b, carry_out=%b", a, b, carry_in, sum, carry_out);
    
    // Testcase 6: a=1, b=0, carry_in=1
    #10 a = 1; b = 0; carry_in = 1;
    #5 $display("a=%b, b=%b, carry_in=%b, sum=%b, carry_out=%b", a, b, carry_in, sum, carry_out);
    
    // Testcase 7: a=1, b=1, carry_in=0
    #10 a = 1; b = 1; carry_in = 0;
    #5 $display("a=%b, b=%b, carry_in=%b, sum=%b, carry_out=%b", a, b, carry_in, sum, carry_out);
    
    // Testcase 8: a=1, b=1, carry_in=1
    #10 a = 1; b = 1; carry_in = 1;
    #5 $display("a=%b, b=%b, carry_in=%b, sum=%b, carry_out=%b", a, b, carry_in, sum, carry_out);
    
    // Finish the simulation
    #5 $finish;
  end
  
  // Toggle the clock signal
  always #5 clk = ~clk;
  
endmodule
