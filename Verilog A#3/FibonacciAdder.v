module FibonacciAdder(

	input [4:0] numberIn,
	input go, clk, reset,
	output done,
	output [16:0] dataOut);
	
	wire [16:0] Input_A, Input_B;
	wire enA, enB, selA, selB, counter_CU;
	
	
	datapth dp(enA, enB, reset, clk, Input_A, selA, Input_B, selB, numberIn, counter_CU, dataOut);
	ControlUnit CU(go, counter_CU, reset, clk, done, Input_A, Input_B, selA, selB, enA, enB);

endmodule
