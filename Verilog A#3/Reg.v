module Reg(
	
	input [16:0] dataIn,
	output [16:0] dataOut,
	input en, reset, clk);
	
	reg [16:0] data;
	
	assign dataOut = data;
	
	
	always @ (posedge clk, posedge reset)
	
		if (reset)
			data <= 17'd0;
		else
			if (en)
				data <= dataIn;
endmodule

			