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
	input [15:0][15:0] channels;
	input [3:0] select;
	output [15:0] op;
	
	assign op = channels[select];

endmodule	

// 16-bit D Flip-Flop
module DFF16(clk, D, Q);
	input clk;
	input [15:0] D;
	output [15:0] Q;
	reg [15:0] Q;

	always @(posedge clk)
	begin
		Q = D;
	end
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
	or(c_out, w0, w2);

endmodule

// 16-bit Adder - Structural
module add_subtract_16(A, B, M, c_out, op);
	input [15:0] A, B;
	input M;
	output [15:0] op;
	output c_out;

	// interfaces
	wire [15:0] cin;
	wire [15:0] cout;
	wire [15:0] B1;

	// Link wires
	assign cin[0] = M;
	assign cin[1] = cout[0];
	assign cin[2] = cout[1];
	assign cin[3] = cout[2];
	assign cin[4] = cout[3];
	assign cin[5] = cout[4];
	assign cin[6] = cout[5];
	assign cin[7] = cout[6];
	assign cin[8] = cout[7];
	assign cin[9] = cout[8];
	assign cin[10] = cout[9];
	assign cin[11] = cout[10];
	assign cin[12] = cout[11];
	assign cin[13] = cout[12];
	assign cin[14] = cout[13];
	assign cin[15] = cout[14];
	assign c_out = cout[15];
	
	xor G[15:0] (B1, B, M);
	full_adder FA[15:0] (A, B1, cin, cout, op);
	
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
module ALU(clk, A, opcode, C, E);

	input clk;
	input [3:0] opcode;
	input [15:0] A;

	output [15:0] C;
	output E; // Error applicable only to addition
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


//interfaces
	wire [15:0][15:0] channels;
	wire [15:0] b;
	wire [15:0] outputADD;
	wire cout;
	wire [15:0] outputAND;
	wire [15:0] outputOR;
	wire [15:0] outputXOR;
	wire [15:0] outputNAND;
	wire [15:0] outputNOR;
	wire [15:0] outputNOT;

	wire [15:0] next, cur;

	add_subtract_16 add_sub1(cur, A, opcode[0], cout, outputADD);
	AND and_er1(A, cur, outputAND);
	OR or_er1(A, cur, outputOR);
	XOR xor_er1(A, cur, outputXOR);
	NAND nander1(A, cur, outputNAND);
	NOR nor_er1(A, cur, outputNAND);
	NOT not_er1(cur, outputNOT);

	assign channels[0] = cur; // No-Operation
	assign channels[1] = 0; // Reset
	assign channels[2] = 0;
	assign channels[3] = 0;
	assign channels[4] = outputADD;
	assign channels[5] = outputADD;
	assign channels[6] = 0;
	assign channels[7] = 0;
	assign channels[8] = outputAND;
	assign channels[9] = outputOR;
	assign channels[10] = outputXOR;
	assign channels[11] = outputNAND;
	assign channels[12] = outputNOR;
	assign channels[13] = outputNOT;
	assign channels[14] = 0;
	assign channels[15] = 0;

	MUX mux1(channels, opcode, b);
	DFF16 acc1(clk, next, cur);

	assign next = b;
	assign C = b;
	assign E = !opcode[3] & opcode[2] & !opcode[0] & cout; //ERROR bit
	
endmodule
//====================================================
// TEST BENCH
//====================================================

module TestBench();

	reg clk;
	reg [15:0] A;
	reg [3:0] opcode;
	reg [8*8:1] command;
	wire [15:0] outputC;
	wire E;
	
	ALU alu1(clk, A, opcode, outputC, E);
	
	   //CLOCK
    initial begin //Start Clock Thread
		forever //While TRUE
			begin //Do Clock Procedural
				clk=0; //square wave is low
				#5; //half a wave is 5 time units
				clk=1;//square wave is high
				#5; //half a wave is 5 time units
			end
	end
		
	initial begin //Display Thread, output!
		$display("------------------------------------------------------------------------------");
		$display("|Clk|Accumulator     |Input           |Opcode|Command |Output          |Error|");
		$display("|---|----------------|----------------|------|--------|----------------|-----|");
	   #2; //offset from square 
	   forever //While True
			begin
				$display("|%b  |%16b|%16b|%4b  |%-8s|%16b|%b    |",clk,alu1.cur,A,opcode,command,alu1.b, E);
				#5;
				$display("|%b  |%16b|%16b|%4b  |%-8s|%16b|%b    |",clk,alu1.cur,A,opcode,command,alu1.b, E);
				#5;
				$display("|---|----------------|----------------|------|--------|----------------|-----|");
			end
	end

	// STIMULUS
	initial begin
		#6; // get in tune with clock
		A = 16'b0;
		opcode = 4'b0001; //Reset
		command = "RESET";
		#10;
		A = 16'b0;
		opcode = 4'b0000; //NOOP
		command = "NO-OP";
		#10;
		A = 35000;
		opcode = 4'b0100; // ADD
		command = "ADD";
		#10;
		#10; // ADD and cause overflow
		A = 16'b0;
		opcode = 4'b0001; //RESET
		command = "RESET";
		#10;
		A = 16'b0000000000000100; // A = 4
		opcode = 4'b0100; // ADD
		command = "ADD";
		#10;
		A = 16'b0000000000000011; // A = 3
		opcode = 4'b0101; // SUBTRACT
		command = "SUBTRACT";
		#10;
		A = 16'b0;
		opcode = 4'b0001; //RESET
		command = "RESET";
		#10;
		A = 16'b1111111111111111;
		opcode = 4'b1001; // OR
		command = "OR";
		#10;
		A = 16'b0;
		opcode = 4'b1000; // AND
		command = "AND";
		#10;
		A = 16'b1111111111111111;
		opcode = 4'b1010; //XOR
		command = "XOR";
		#10
		opcode = 4'b1101; //NOT
		command = "NOT";
		#10
		A = 16'b0;
		opcode = 4'b0001; //RESET
		command = "RESET";
		#10
	$finish;
	end
endmodule
