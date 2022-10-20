module TestBench;

	
	reg [4:0] n; // number of addtions
	reg go;      // go signal
	reg reset;
	reg clk;
	
	
	wire done;
	wire [16:0] dataOut;
	
	FibonacciAdder FA( n, go, clk, reset, done, dataOut);
	
	always
		#5 clk = ~clk;
	
	initial begin
		// inital the values
		n = 0;
		go = 0;
		reset = 1; // the reset signal to remove the redline in the first number of the outputs in the wave
		clk = 0;
		#1         // just give a small pulse for the reset signal
		reset = 0;
		
		
		@(posedge clk);
		n = 24;  // max 24
		go = 0; 
		
		
		@(posedge clk);
		n = 24;
		go = 1;     // start counting
		#300;
		$stop;
		
	end
	
endmodule
		
		
		