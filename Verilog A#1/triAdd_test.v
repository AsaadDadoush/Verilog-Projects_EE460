
module triadd_test();
	reg [7:0] dataIn;
	wire [7:0] dataBus;
	reg enbIn, enbA, enbB, enbC, enbAdd,ldA, ldB, ldC, reset, clock;
	
	triStateBus testbench(dataIn, dataBus, enbIn, enbA, enbB, enbC, enbAdd, ldA, ldB, ldC, reset, clock);
	
	
	initial clock = 0;
	always #5 clock = ~clock;
	
	initial begin 
		
		reset = 0;ldA = 0;ldB = 0;ldC = 0;enbA = 0;enbB = 0;enbC = 0;enbAdd = 0;enbIn = 0;
		#10;
	
		// First load the values for all A , B , C
		
		enbIn =1;
		dataIn = 8'd7;
		ldA = 1; // A = 7
		#10
		ldA = 0;
		dataIn = 8'd5;
		ldB = 1; // B = 5
		#10
		ldB = 0;
		dataIn = 8'd9; // C = 9
		ldC = 1;
		#10
		enbIn = 0;
		ldC = 0;
		#10
		// B = A + C
		enbAdd = 1;  // Add 7 and 9
		ldB = 1;     // store 16 in B
		#10			 // B = 16
		enbAdd = 0;  // Stop Add
		ldB = 0;     // Stop load 
		enbB = 1;    // write the data on the bus
		ldA = 1;     // write 16 on A to perform C = C + B since our design only add A & C
		//  C = C + B
		#6
		enbB = 0; // stop write
		ldA = 0;  // stop load
		enbAdd = 1;// Add 9 and 16
		ldC = 1;  // load 25
		#4
		enbAdd = 0;
		#10		 // C = 25
		// B = A + A
		enbAdd = 0; // Stop add
		enbA = 1;   // since its A + A we need to depicate A value in bothe regs
		ldC = 1;
		#10         // now reg A & C has the sane value = 16
		enbA = 0;   // Stop wrtie 
		ldC = 0;    // stop load 
		enbAdd = 1; // Add 16 & 16
		ldB = 1;    // B = 32
	
	end
endmodule
