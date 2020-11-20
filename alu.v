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
	
	or(op[0], A[0], B[0]);
	or(op[1], A[1], B[1]);
	or(op[2], A[2], B[2]);
	or(op[3], A[3], B[3]);
	or(op[4], A[4], B[4]);
	or(op[5], A[5], B[5]);
	or(op[6], A[6], B[6]);
	or(op[7], A[7], B[7]);
	or(op[8], A[8], B[8]);
	or(op[9], A[9], B[9]);
	or(op[10], A[10], B[10]);
	or(op[11], A[11], B[11]);
	or(op[12], A[12], B[12]);
	or(op[13], A[13], B[13]);
	or(op[14], A[14], B[14]);
	or(op[15], A[15], B[15]);
	
endmodule


// 16-bit AND module
module AND(A, B, op);
	input [15:0] A, B;
	output [15:0] op;
	
	and(op[0], A[0], B[0]);
	and(op[1], A[1], B[1]);
	and(op[2], A[2], B[2]);
	and(op[3], A[3], B[3]);
	and(op[4], A[4], B[4]);
	and(op[5], A[5], B[5]);
	and(op[6], A[6], B[6]);
	and(op[7], A[7], B[7]);
	and(op[8], A[8], B[8]);
	and(op[9], A[9], B[9]);
	and(op[10], A[10], B[10]);
	and(op[11], A[11], B[11]);
	and(op[12], A[12], B[12]);
	and(op[13], A[13], B[13]);
	and(op[14], A[14], B[14]);
	and(op[15], A[15], B[15]);
	
endmodule


// 16-bit XOR module
module XOR(A, B, op);
	input [15:0] A, B;
	output [15:0] op;
	
	xor(op[0], A[0], B[0]);
	xor(op[1], A[1], B[1]);
	xor(op[2], A[2], B[2]);
	xor(op[3], A[3], B[3]);
	xor(op[4], A[4], B[4]);
	xor(op[5], A[5], B[5]);
	xor(op[6], A[6], B[6]);
	xor(op[7], A[7], B[7]);
	xor(op[8], A[8], B[8]);
	xor(op[9], A[9], B[9]);
	xor(op[10], A[10], B[10]);
	xor(op[11], A[11], B[11]);
	xor(op[12], A[12], B[12]);
	xor(op[13], A[13], B[13]);
	xor(op[14], A[14], B[14]);
	xor(op[15], A[15], B[15]);
	
endmodule


// 16-bit NAND module
module NAND(A, B, op);
	input [15:0] A, B;
	output [15:0] op;
	
	nand(op[0], A[0], B[0]);
	nand(op[1], A[1], B[1]);
	nand(op[2], A[2], B[2]);
	nand(op[3], A[3], B[3]);
	nand(op[4], A[4], B[4]);
	nand(op[5], A[5], B[5]);
	nand(op[6], A[6], B[6]);
	nand(op[7], A[7], B[7]);
	nand(op[8], A[8], B[8]);
	nand(op[9], A[9], B[9]);
	nand(op[10], A[10], B[10]);
	nand(op[11], A[11], B[11]);
	nand(op[12], A[12], B[12]);
	nand(op[13], A[13], B[13]);
	nand(op[14], A[14], B[14]);
	nand(op[15], A[15], B[15]);
	
endmodule


// 16-bit NOR module
module NOR(A, B, op);
	input [15:0] A, B;
	output [15:0] op;
	
	nor(op[0], A[0], B[0]);
	nor(op[1], A[1], B[1]);
	nor(op[2], A[2], B[2]);
	nor(op[3], A[3], B[3]);
	nor(op[4], A[4], B[4]);
	nor(op[5], A[5], B[5]);
	nor(op[6], A[6], B[6]);
	nor(op[7], A[7], B[7]);
	nor(op[8], A[8], B[8]);
	nor(op[9], A[9], B[9]);
	nor(op[10], A[10], B[10]);
	nor(op[11], A[11], B[11]);
	nor(op[12], A[12], B[12]);
	nor(op[13], A[13], B[13]);
	nor(op[14], A[14], B[14]);
	nor(op[15], A[15], B[15]);
	
endmodule


// 16-bit NOT module
module NOT(A, B, op);
	input [15:0] A, B;
	output [15:0] op;
	
	not(op[0], A[0], B[0]);
	not(op[1], A[1], B[1]);
	not(op[2], A[2], B[2]);
	not(op[3], A[3], B[3]);
	not(op[4], A[4], B[4]);
	not(op[5], A[5], B[5]);
	not(op[6], A[6], B[6]);
	not(op[7], A[7], B[7]);
	not(op[8], A[8], B[8]);
	not(op[9], A[9], B[9]);
	not(op[10], A[10], B[10]);
	not(op[11], A[11], B[11]);
	not(op[12], A[12], B[12]);
	not(op[13], A[13], B[13]);
	not(op[14], A[14], B[14]);
	not(op[15], A[15], B[15]);
	
endmodule


//====================================================
// BREADBOARD
//====================================================





//====================================================
// TEST BENCH
//====================================================
