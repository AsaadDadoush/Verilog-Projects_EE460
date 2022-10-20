`timescale 1ns / 1ps
module dataPath(
    input [7:0] dataIn,
	 input [2:0] Rx, Ry, 
    output [7:0] dataOut,
	 input[2:0] AluSelction,
    input [1:0] destSrc,
    input regWrite,
	 input  clk
    );
	
	wire [7:0] dataA,  dataB, dataW, result; 

	assign dataOut = dataW;
	
	regFile RF(Ry, Rx, Rx, regWrite, dataA, dataB, dataW, clk);
	
	ALU   AS(dataB, dataA, AluSelction, result);
	
	MUX3  mux(dataIn, dataA, dataB, result, dataW, destSrc);


endmodule
