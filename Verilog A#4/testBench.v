module testBench();

	reg [15:0] PERIOD, ACTIVE;
	reg  start, stop, clk, reset;
	wire PWN_SIGNAL;

	
	always #5 clk = ~clk;   // Clock cycle 


	PWM PWM_TEST(PERIOD, ACTIVE, start, stop, clk, reset, PWN_SIGNAL);
	
	
	initial begin
		// inital all the signals with 0 vlaue 
		start = 0; 
		stop = 0;
		clk = 0;
		PERIOD = 0;
		ACTIVE = 0;
		reset = 1;  // reset signal 
		#10
		reset = 0;
		
		// ======================= case 1 50% duty cycle  =======================
		
		PERIOD = 16'd12;  // Period of 12
		ACTIVE = 16'd6;   // Active for 6
		                  // So the Duty cycle is 50 % on , 50% off
		#10						
		start = 1;        // Start signal to start the programm
		#10
		start = 0;
		#400					// test the first case for 400 time unit 
		stop = 1;         // then give a stop signal to stop the programm
		#10
		stop = 0;			// clear the stop signal 
		#10
		
		reset = 1;			// reset signal for reset the programm and test another case
		#10
		reset = 0;
		
		// ======================= case 2 25% duty cycle  =======================
		
		PERIOD = 16'd12;  // Period of 12
		ACTIVE = 16'd3;   // Active for 3
		#10               // So the Duty cycle is 25 % on , 75% off
		start = 1;        // Start signal to start the programm
		#10
		start = 0;
		#400              // test the sec case for 400 time unit
		stop = 1;         // then give a stop signal to stop the programm  
		#10
		stop = 0;			// clear the stop signal 
		#10
		
		reset = 1;			// reset signal for reset the programm and test another case
		#10
		reset = 0;
		
		// ======================= case 3 75% duty cycle  =======================
		
		PERIOD = 16'd12;  // Period of 12
		ACTIVE = 16'd9;   // Active for 9
		#10               // So the Duty cycle is  75% on , 25% off
		start = 1;			// Start signal to start the programm
		#10			
		start = 0;
		#400					// test the third case for 400 time unit				
		stop = 1;			// then give a stop signal to stop the programm
		
		reset = 1;        // Finsh the test and reset
		#10
		reset = 0;
		#100
		stop=1;           // Terminate the process and exit
		
		
	end
	

endmodule 