module PWM(
	
	input [15:0] PERIOD, ACTIVE,
	input start, stop, clk, reset,
	output PWM_SIGNAL);

	wire	Load_Comp, Load_CNT, enb, Zero_Check;
	wire [15:0] Comp0_Out, Comp1_Out, CNT_Out;
	
	DataPath DP(PERIOD, ACTIVE ,clk, reset, Load_Comp, Load_CNT, enb, Zero_Check, PWM_SIGNAL);
	ControlUnit CU(clk , reset, start, stop, Zero_Check, Load_Comp, Load_CNT, enb);
	
endmodule
