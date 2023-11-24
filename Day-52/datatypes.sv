module DataTypeVerification;

  // Declare variables with different logic data types
  bit myBit;
  logic myLogic;
  reg [7:0] myReg;
  wire [3:0] myWire;
  integer myInt;
  time myTime;

  // Initial block to initialize variables
  initial begin
    myBit = 1;
    myLogic = 'x;
    myReg = 8'hA5;
    myWire = 4'b1100;
    myInt = 42;
    myTime = 100;

    // Display initial values
    $display("Initial values:");
    $display("myBit = %0b", myBit);
    $display("myLogic = %0b", myLogic);
    $display("myReg = %h", myReg);
    $display("myWire = %b", myWire);
    $display("myInt = %0d", myInt);
    $display("myTime = %0t", myTime);

    // Assertion to check if myBit is 1
    assert(myBit == 1) else $fatal("Error: myBit should be 1");

    // Additional assertions or functional coverage can be added here

    $stop; // Stop simulation
  end

endmodule
