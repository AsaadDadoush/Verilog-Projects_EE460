`timescale 1ns / 1ps
module simple8BitProcessor(

	input [7:0] dataIn,
	output [7:0] dataOut,
	input [8:0]func,
	input clk);
	
	wire [2:0] opCode = func[8:6];
   wire [2:0] Rx = func[5:3];
	wire [2:0] Ry = func[2:0];
	wire [1:0] muxControl;
	wire [2:0] ALUControl;
	wire regWrite;
	
	controlUnit CU(opCode, regWrite, ALUControl, muxControl);
	dataPath	DP(dataIn, Rx, Ry, dataOut, ALUControl, muxControl, regWrite, clk);
	
endmodule 
