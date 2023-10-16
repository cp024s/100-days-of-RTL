## Ceaser Cipher method

This Verilog module,
takes an 8-bit ASCII character as input (`plaintext`) and a 4-bit shift value (`shift`). It then performs the Caesar cipher encryption by adding the shift value to the input character. If the result exceeds the ASCII range (greater than 127), it wraps around by subtracting 26 to stay within the printable ASCII characters range. The result is the ciphertext.

Keep in mind that this is a basic example, and in a real-world application, you'd want to expand upon it. You could also implement a module for decryption in a similar fashion. Additionally, this code assumes that you are working with 8-bit ASCII characters, and the shift value should be in the range [0, 15] for a 4-bit shift. You can modify the module and parameters as needed for your specific application.
