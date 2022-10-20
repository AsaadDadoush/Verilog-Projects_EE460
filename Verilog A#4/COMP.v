module COMP(
	
	input [15:0] Data_in,
	input clk, reset, load,
	output reg [15:0] Data_out);
	
	
	always @(posedge clk, posedge reset)
	begin
	
		if(reset)
			Data_out <= 0;
		else
			if(load)
				Data_out <= Data_in;
	end
endmodule
	