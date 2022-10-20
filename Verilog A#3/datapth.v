module datapth(

	input enA, enB, reset, clk,
	input [16:0] input_A,
	input selA,
	input [16:0] input_B,
	input selB,
	input [4:0] n,
	output counter_CU,
	output [16:0] dataOut);
	
	wire [16:0] mux_A, mux_B, add_result, A_add, B_add;
		
	assign dataOut = add_result;
	
	Reg regA(mux_A, A_add, enA, reset, clk);
	Reg regB(mux_B, B_add, enB, reset, clk);
	
	Adder Add_AB(A_add, B_add, add_result);
	
	MUX muxA(add_result, input_A, selA,  mux_A);
	MUX muxB(A_add, input_B, selB,  mux_B);
	
	counter count(n, reset, clk, counter_CU);
endmodule

	