module MUX(

	input [16:0] dataA, dataB,
	input sel,
	output reg [16:0] muxOut);
	
	
	always @ (*)
		
		if (sel == 0)
			muxOut = dataA;
		else
			muxOut = dataB;
endmodule

			