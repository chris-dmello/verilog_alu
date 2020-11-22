//====================================================
//			Fierce Digital Semester Project
//					 16-bit ALU
//====================================================

//====================================================
// Opcodes
//====================================================
//	-------------------------
//	| 0000 | No-Operation	|
//	| 0001 | Reset			|
//	| 0100 | ADD			|
//	| 0101 | SUBTRACT		|
//	| 1000 | AND			|
//	| 1001 | OR				|
//	| 1010 | XOR			|
//	| 1011 | NAND			|
//	| 1100 | NOR			|
//	| 1101 | NOT			|
//	-------------------------

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

// 16-bit D Flip-Flop
module DFF16(clk, D, Q);
	input clk;
	input [15:0] D;
	output [15:0] Q;

	reg [15:0] value;

	assign Q = value;

	always @(posedge clk)
		value = D;

endmodule

//1-bit Half-Adder
module half_adder(A, B, c_out, op);
	input  A, B;
	output c_out, op;
	xor(op, A, B);
	and(c_out, A, B);

endmodule	

// 1-bit Full-Adder
module full_adder(A, B, c_in, c_out, op);
	input A, B, c_in;
	output c_out, op;
	wire w0, w1, w2;
	
	half_adder HA1(A, B, w0, w1);
	half_adder HA2(w1, c_in, w2, op);
	or(c_out, w0, w3);

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
module NOT(A, op);
	input [15:0] A;
	output [15:0] op;
	
	not G[0:15] (op, A);
	
endmodule


//====================================================
// ALU
//====================================================
module ALU(clk, A, B, opcode, result);
	// I/O
	input clk;
	input [15:0] A, B;
	input [3:0] opcode;
	output [15:0] result;

	// Wires
	wire [15:0] w0, w1, w2, w3, w4, w5, w6, w7, w8, w9;
	adder addOp(A, B, w2);
	subtractor subOp(A, B, w3);
	OR orOp(A, B, w4);
	XOR xorOp(A, B, w5);
	AND andOp(A, B, w6);
	NAND nandOp(A, B, w7);
	NOR norOp(A, B, w8);
	NOT notOp(A, w9);

	wire [15:0] [9:0] muxIn = {w0, w1, w2, w3, w4, w5, w6, w7, w8, w9};
	
	MUX mux(muxIn, opcode, result);	

	//always @ (posedge clk)
	//	begin
	//		case(opcode)
//
//
	//	end

endmodule




//====================================================
// TEST BENCH
//====================================================

//module TestBench()
//	initial begin
//   
//	end