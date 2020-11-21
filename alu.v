//====================================================
// Fierce Digital Semester Project
//====================================================



//====================================================
// PARTS BIN
//====================================================

// 16 to 1, 4-bit wide MUX
module MUX(channels, select, op);
	input [15:0][9:0] channels;
	input [3:0] select;
	output [15:0] op;
	
	assign op = channels[select];

endmodule	


// 16-bit Adder
module adder(A, B, op);
	input [15:0] A, B;
	output [15:0] op;
	
	assign op = A + B;
	
endmodule


// 16-bit Subtractor
module subtractor(A, B, op);
	input [15:0] A, B;
	output [15:0] op;
	
	assign op = A - B;
	
endmodule


// 16-bit OR module
module OR(A, B, op);
	input [15:0] A, B;
	output [15:0] op;
	
	or G[0:15] (op, A, B);
	
endmodule


// 16-bit AND module
module AND(A, B, op);
	input [15:0] A, B;
	output [15:0] op;
	
	and G[0:15] (op, A, B);
	
endmodule


// 16-bit XOR module
module XOR(A, B, op);
	input [15:0] A, B;
	output [15:0] op;
	
	xor G[0:15] (op, A, B);
	
endmodule


// 16-bit NAND module
module NAND(A, B, op);
	input [15:0] A, B;
	output [15:0] op;
	
	nand G[0:15] (op, A, B);
	
endmodule


// 16-bit NOR module
module NOR(A, B, op);
	input [15:0] A, B;
	output [15:0] op;
	
	nor G[0:15] (op, A, B);
	
endmodule


// 16-bit NOT module
module NOT(A, B, op);
	input [15:0] A, B;
	output [15:0] op;
	
	not G[0:15] (op, A, B);
	
endmodule


//====================================================
// ALU
//====================================================
module ALU(clk, A, B, opcode, result)
	// I/O
	input clk;
	input [15:0] A, B;
	input [3:0] opcode;
	output [15:0] result;

	// Wires
	//wire [15:0]

	//MUX()	

	always @ (posedge clk)
		begin
			case(opcode):


		end




//====================================================
// TEST BENCH
//====================================================

//module TestBench()
//	initial begin
//   
//	end