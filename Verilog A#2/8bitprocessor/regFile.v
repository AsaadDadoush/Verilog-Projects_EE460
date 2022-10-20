`timescale 1ns / 1ps
module regFile(
	input [2:0] ra, rb, rw,
	input RegWr,
	output [7:0] dataA, dataB,
	input [7:0] dataW,
	input clk);
	
	reg [7:0] rf [7:0];
	
	always @ (posedge clk)
	
		if(RegWr)
			rf[rw] <= dataW;
			
		assign dataA = rf[ra];
		assign dataB = rf[rb];
		
endmodule
