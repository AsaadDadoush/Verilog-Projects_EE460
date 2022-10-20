module ControlUnit(

	input go, count, reset, clk,
	output reg done,
	output reg [16:0] input_A, input_B,
	output reg selA, selB, enA, enB);
	
	localparam S0 = 2'b00; // state 0
	localparam S1 = 2'b01; // state 1
	localparam S2 = 2'b10; // state 2 
	
	reg [1:0] state = S0;
	reg [1:0] nextState = S0;


	always @ (posedge clk)
		
		if (reset)
			state <= S0;
			
		else 
			state <= nextState;
			
	
	always @ (*)
		begin 
			case(state)
				S0: if (count & go)
							nextState = S1;
					 else 
							nextState = S0;
				S1: if (~count)
							nextState = S2;
					 else 
							nextState = S1;
				S2: nextState = S0;
				 
			endcase
	   end
			
	
	always @ (*)
	
		begin
				
					
		case(state)
			
			S0: if(~count) begin 
					input_A = 1;
					input_B = 0;
					selA = 1;
					selB = 1;
					enA = 1;
					enB = 1;
					done = 0;
				end
				
			S1: if(count) begin
					done = 0;
					input_A = 1;
					input_B = 0;
					selA = 0;
					selB = 0;
					enA = 1;
					enB = 1;
				 end
			
			S2: begin
					done = #10 1; #10
					input_A = 0;
					input_B = 0;
					enA = 0;
					enB = 0;
					selA = 0;
					selB = 0;
					done = 0;
				end
		endcase
	end
endmodule

				