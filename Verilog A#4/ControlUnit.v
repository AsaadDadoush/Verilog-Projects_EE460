module ControlUnit(
	input clk, reset, start, stop, zero_Check,
	output reg load_Comp, load_CNT, enb);

	parameter S0 = 0;
	parameter S1 = 1;
	
	reg state, nextState;
	
	always @ (*) begin
	
		load_Comp=0;load_CNT=0;enb=0;nextState=state;
		
		case(state)
			S0: begin
				
				load_Comp=1;
				if(start) begin
					load_CNT=1;
					nextState= S1;
				end
				else
					nextState = S0;
			end
			
			S1: begin
			
				enb = 1;
				if(stop)
					nextState = S0;
				else
					if(zero_Check) begin
						load_CNT=1;
						nextState=S1;
					end
					else
						nextState=S1;
			end
		endcase
	end
	
	always @(posedge clk)
		
			if(reset)
				state <= S0;
			else
				state <= nextState;
				
endmodule

				
				
		