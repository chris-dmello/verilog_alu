# Commands

Command | opcode | Description
--------|--------|------------
Command | 0000 | Description
No-Operation|0000 | System is idle, and stays in a ready state
Reset | 0001 | Clear all value to 0, and go to ready state
ADD | 0100 | Add the input to current value of accumulator
SUBTRACT | 0101 | Subtract the input from current value
AND | 1000 | perform an AND operation the current value with the input value
OR | 1001 | perform an OR operation the current value with the input value
XOR | 1010 | perform an XOR operation the current value with the input value
NAND | 1011 | perform an NAND operation the current value with the input value
NOR | 1100 | perform an NOR operation the current value with the input value
NOT | 1101 | perform an NOT operation the current value
