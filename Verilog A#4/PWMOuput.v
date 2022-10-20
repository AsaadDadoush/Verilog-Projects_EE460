module PWMOutput(
	
	input [15:0] PERIOD, ACTIVE,
	output reg PWM_SIGNAL);
	
	always @ (*)
		
		PWM_SIGNAL <= (PERIOD > ACTIVE) ? 0:1;
endmodule
