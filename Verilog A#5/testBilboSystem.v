`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2019 04:51:30 PM
// Design Name: 
// Module Name: testBilboSystem
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module testBilboSystem();
	reg Clk;
	reg LdA;
	reg LdB;
	reg LdC;
	reg B1;
	reg B2;
	reg Si;
	
	wire So;
	wire [3:0] DBus;
	wire [4:0] Output;
	
	reg [4:0] Sig;
			//    							  regC  regA  regB
	parameter [0:12] test_vector = 13'b00000_1101_0111;
	parameter [4:0] test_result = 5'b01000; //Compared test (correct signature 01000)
	
	initial
	begin
		LdA = 1'b0;
		LdB = 1'b0;
		LdC = 1'b0;
		
		B1 = 1'b0;
		B2 = 1'b0;
		Si = 1'b0;
		Clk = 1'b0;
		Sig = 0;
	end
	always #25 Clk = ~Clk;
	
	bilboSystem #(4) Sys (Clk, LdA, LdB, LdC, B1, B2, Si, So, DBus, Output);
	
	   // (1): Load A with 1011 and B with 1110; clear C (00000)------
	always 
	begin
	   $display ("Start Simulation");
		B1 <= 1'b0; //Shift in test vector
		B2 <= 1'b0;
		begin : xhdl_2
			integer i;
			for (i=0; i<= 12; i=i+1)
			begin
				Si <= test_vector[i];
				@(posedge Clk);
			end
		end
		
		// (2): Test the system by using A and B as pattern generators (PRPGs) and C as a signature register(MISR). for four clock times.
		
		B1 <= 1'b0; //Use PRPG and MISR
		B2 <= 1'b1;
		begin : xhdl_3
			integer i;
			for (i=1; i<=15; i=i+1) //for 15 cycles
			begin
				@(posedge Clk);
			end
		end
		
		
		// (3): Shift the resulting signature
		
		B1 <= 1'b0; //Shift signature out  
		B2 <= 1'b0;
		begin : xhdl_4
			integer i;
			for (i=0; i<=4; i=i+1)
			begin											
				$display("I is %d, So is %d", i, So);
				$display($time);
				@(posedge Clk);
				Sig <= {So, Sig[4:1]};
			end
		end
		
		// (4): Return the system to the normal system mode.
				
		B1 <= 1'b1; //Normal system mode
		B2 <= 1'b0;
		@(posedge Clk);
		$display (" ");
		$display ("Returned to normal mode");
		$display (" ");
		
		//---------------------------------------------------
		
		if (Sig == test_result) //Compare signature
		begin
			$display ("System passed test. (NO ERROR)");
			$display (" ");
		end
		else
		begin
			$display ("System did not pass test! (ERROR)");
			$display (" ");
		end
		
		
		@(posedge Clk);
		@(posedge Clk);
		$stop();
		//forever #100000; //wait for manual termiantion
	end

endmodule
