`timescale 1ns / 1ps
module testProc;

	// Inputs
	reg [7:0] dataIn;
	reg [8:0] func;
	reg clock;

	// Outputs
	wire [7:0] dataOut;

	// Instantiate the Unit Under Test (UUT)
	simple8BitProcessor uut (
		.dataIn(dataIn), 
		.dataOut(dataOut), 
		.func(func), 
		.clk(clock)
	);
	
	always
		#5 clock = ~clock;

	initial begin
		func=0;clock=0;dataIn=0;
		
	 @(posedge clock);
	
		dataIn = 5;
		func = 9'b000_000_XXX; // Load 5 in R0   ===== Result = 5 ===== R0 = 5
		@(posedge clock);
		dataIn = 7;
		func = 9'b000_001_XXX; // Load 7 in R1   ===== Result = 7 ===== R1 = 7
		@(posedge clock);
		dataIn = 3;
		func = 9'b000_010_XXX; // Load 3 in R2   ===== Result = 3 ===== R2 = 3
		@(posedge clock);
		func = 9'b001_001_010; // Mov R2 to R1   ===== Result = 3 ===== R1 = 3
		@(posedge clock);
		func = 9'b010_001_000; // Add R1 to R0   ===== R1 + R0 = 8 ===== R1 = 8
		@(posedge clock);
		func = 9'b011_001_010; // Sub R2 from R1 ===== R1 - R2 = 5 ===== R1 = 5
		@(posedge clock);
		dataIn = 11;
		func = 9'b000_111_000; // Load 10 in R7  ===== Result = 11 ===== R7 = 11
		@(posedge clock);
		dataIn = 7;
		func = 9'b000_110_000; // Load 15 in R6  ===== Result = 7 ===== R6 = 7
		@(posedge clock);
		func = 9'b100_111_110; // And R7 with R6 ===== R7 & R6 = 3 ==== R7 = 3
		@(posedge clock);
		func = 9'b101_111_110; // or R7 with R6  ===== R7 | R6 = 7 ==== R7 = 7
		@(posedge clock);
		func = 9'b110_110_001; // Xor R6 with R1 ===== R6 ^ R1 = 2 ===== R6 = 2
		#10		
		@(posedge clock);
		func = 9'b111_111_XXX; // Store R7       ====== Results = 7 ==== R7 = 7
		#10
		$end;

	end
      
endmodule
