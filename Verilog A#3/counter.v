module counter(

	input[4:0] n,
	input clr, clk,
	output cOut);
	
	
	reg [4:0] cn = 1;
	assign cOut = (cn < n);
	
	always @ (posedge clk)
		
		if(clr)
			cn <= 5'b00000;
		else 
			cn <= cn + 5'b00001;
endmodule

	
	