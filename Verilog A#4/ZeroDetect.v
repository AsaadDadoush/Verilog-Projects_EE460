module ZeroDetect(
	
	input [15:0] Data,
	input clk, reset,
	output reg zero_Check);
	
	always @ (posedge clk, posedge reset)
	begin
	
		if(reset)
			zero_Check <= 0;
		else if (Data == 0)
			zero_Check <= 1;
		else
			zero_Check <= 0;
	end
endmodule
