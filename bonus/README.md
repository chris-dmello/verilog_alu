# Bonus
This folder contains the same ALU verilog as the root, with the exception of it's test bench, which had been replaced with a file I/O based controller. The idea is that we can create a Java/Python/C++/JavaScript calculator which will use this ALU for performing it's operations. 

## Input Format
The ALU can be acessed by placing 36 binary digits in the `calc_in.dat` file. The first 16 will be the first operand (`A`), the next 16 will be the second operand (`B`), and the last 4 will be the opcode.

## Output Format
The verilog program will continually push the result to the `calc_out.dat` file, where it can be read by the calculator program.
