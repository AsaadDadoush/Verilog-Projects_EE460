module CNT(
	
	input [15:0] CNT_input,
	input clk, reset, load, enb,
	output reg [15:0] CNT_output);
	
	always @(posedge clk, posedge reset)
	begin
	
		if(reset)
			CNT_output <= 0;
		else
			if(load)
				CNT_output <= CNT_input;
			else
				if(enb)
					CNT_output <= CNT_output - 1;
	end
endmodule
