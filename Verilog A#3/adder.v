module Adder(
	input [16:0] addIn1, addIn2,
	output reg [16:0] addOut);
	
	
	always @ (*)
		
		addOut = addIn1 +	addIn2;
endmodule
