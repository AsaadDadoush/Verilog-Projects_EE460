`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2019 12:54:06 PM
// Design Name: 
// Module Name: bilboSystem
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//  Figure 10-33: System System with BILBO Registers and Tester
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module bilboSystem #(parameter [2:0] n = 4)(
	input Clk, 
	input LdA, LdB, LdC,
	input B1, B2,
	input Si, 
	output So, 
	input [n-1:0] DBus, 
	inout [n:0] Output);
	 
	//wire [4:0] Output;
	//wire [4:0] Output_xhdl0;
	
	wire [n-1:0] Aout;
	wire [n-1:0] Bout;
	wire [n:0] Cin;
	wire ACE;
	wire BCE;
	wire CCE;
	wire CB1;
	wire Test;
	wire S1;
	wire S2;
	
	wire [n-1:0] Sum;
	wire Carry;
	
	//assign Output = Output_xhdl0;
	
	assign Test = ~B1 | B2;
	assign ACE = Test | LdA;
	assign BCE = Test | LdB;
	assign CCE = Test | LdC;
	assign CB1 = B1 ^ B2;
	assign Cin = {Carry, Sum};
	
	BILBO #(n) RegA (Clk, ACE, B1,  B2, S1, S2, DBus, Aout);
	BILBO #(n) RegB (Clk, BCE, B1,  B2, Si, S1, DBus, Bout);
	BILBO #(n+1) RegC (Clk, CCE, CB1, B2, S2, So, Cin, Output);
	Adder4 Adder (Aout, Bout, 1'b0, Sum, Carry);

endmodule
