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

// 16-bit Adder - Behavioral
module adder16_behavioral(A, B, op);
	input [15:0] A, B;
	output [15:0] op;

	assign op = A + B;
	
endmodule


// 16-bit Adder - Structural
module adder16(A, B, c_in, c_out, op);
	input [15:0] A, B;
	input c_in;
	output [15:0] op;
	output c_out;
	wire c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15;

	full_adder FA0(A[0], B[0], c_in, c1, op[0]);
	full_adder FA1(A[1], B[1], c1, c2, op[1]);
	full_adder FA2(A[2], B[2], c2, c3, op[2]);
	full_adder FA3(A[3], B[3], c3, c4, op[3]);
	full_adder FA4(A[4], B[4], c4, c5, op[4]);
	full_adder FA5(A[5], B[5], c5, c6, op[5]);
	full_adder FA6(A[6], B[6], c6, c7, op[6]);
	full_adder FA7(A[7], B[7], c7, c8, op[7]);
	full_adder FA8(A[8], B[8], c8, c9, op[8]);
	full_adder FA9(A[9], B[9], c9, c10, op[9]);
	full_adder FA10(A[10], B[10], c10, c11, op[10]);
	full_adder FA11(A[11], B[11], c11, c12, op[11]);
	full_adder FA12(A[12], B[12], c12, c13, op[12]);
	full_adder FA13(A[13], B[13], c13, c14, op[13]);
	full_adder FA14(A[14], B[14], c14, c15, op[14]);
	full_adder FA15(A[15], B[15], c15, c_out, op[15]);

endmodule


// 16-bit Subtractor - Behavioral
module subtractor16_behavioral(A, B, op);
	input [15:0] A, B;
	output [15:0] op;
	
	assign op = A - B;
	
endmodule


// 16-bit Subtractor - Structural
module subtractor16(A, B, overflow, op);
	input [15:0] A, B;
	output [15:0] op;
	output overflow;
	wire c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15; //carry lines
	wire c_final;

	full_adder FA0(A[0], ~(B[0]), 1'b1, c1, op[0]);
	full_adder FA1(A[1], ~(B[1]), c1, c2, op[1]);
	full_adder FA2(A[2], ~(B[2]), c2, c3, op[2]);
	full_adder FA3(A[3], ~(B[3]), c3, c4, op[3]);
	full_adder FA4(A[4], ~(B[4]), c4, c5, op[4]);
	full_adder FA5(A[5], ~(B[5]), c5, c6, op[5]);
	full_adder FA6(A[6], ~(B[6]), c6, c7, op[6]);
	full_adder FA7(A[7], ~(B[7]), c7, c8, op[7]);
	full_adder FA8(A[8], ~(B[8]), c8, c9, op[8]);
	full_adder FA9(A[9], ~(B[9]), c9, c10, op[9]);
	full_adder FA10(A[10], ~(B[10]), c10, c11, op[10]);
	full_adder FA11(A[11], ~(B[11]), c11, c12, op[11]);
	full_adder FA12(A[12], ~(B[12]), c12, c13, op[12]);
	full_adder FA13(A[13], ~(B[13]), c13, c14, op[13]);
	full_adder FA14(A[14], ~(B[14]), c14, c15, op[14]);
	full_adder FA15(A[15], ~(B[15]), c15, c_final, op[15]);
	xor(overflow, c15, c_final);

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
	adder16_behavioral addOp(A, B, w2);
	subtractor16_behavioral subOp(A, B, w3);
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