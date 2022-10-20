module DataPath(
	
	input [15:0] PERIOD, ACTIVE,
	input clk, reset, Load_Comp, Load_CNT, Enb,
	output zero_Check, PWM_SIGNAL);
	
	wire [15:0] comp0_Out, comp1_Out, CNT_Out;
	
	COMP COMP0(PERIOD, clk, reset, Load_Comp, comp0_Out);
	COMP COMP1(ACTIVE, clk, reset, Load_Comp, comp1_Out);
	CNT CNT(comp0_Out, clk, reset, Load_CNT, Enb, CNT_Out);
	
	ZeroDetect ZeroDec(CNT_Out, clk, reset, zero_Check);
	
	PWMOutput PWM_Output(CNT_Out, comp1_Out,PWM_SIGNAL);

endmodule

	
	
	