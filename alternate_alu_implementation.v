//====================================================
// ALU
//====================================================
module ALU(clk, A, B, opcode, result)
	// I/O
	input clk;
	input [15:0] A, B;
	input [3:0] opcode;
	output [15:0] result;

	always @ (posedge clk)
		begin
			case(opcode):
                //4'b0000: //NO-OP
                //    result = result;
                4'b0001: // RESET
                    result = 16'b0000000000000000;
                4'b0010: //ADD
                    result = A + B;
                4'b0100: //SUBTRACT
                    result = A - B;
                4'b0101: //AND
                    result = A & B;
                4'b1000: //OR
                    result = A | B;
                4'b1001: //XOR
                    result = A ^ B;
                4'b1010: //NAND
                    result = ~(A + B);
                4'b1011: //NOR
                    result = ~(A | B);
                4'b1101: //NOT
                    result = ~A;
                default: result = A + B;
            endcase
		end

endmodule