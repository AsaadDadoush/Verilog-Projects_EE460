`timescale 1ns / 1ps
module MUX3(

    input [7:0] dataIn, dataA ,dataB, aluResults,
    output reg [7:0] muxOut,
	 input [1:0] ctr
    );

	always @(*)
	
		case(ctr)
		2'b00: muxOut = dataIn;
		2'b01: muxOut = dataA;
		2'b10: muxOut = dataB;
		2'b11: muxOut = aluResults;
		default : muxOut = 8'h00;
		
		endcase

endmodule
