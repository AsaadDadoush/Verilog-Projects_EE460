`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2019 01:00:52 PM
// Design Name: 
// Module Name: Verilog Code for BILBO Register of Figure 10-31
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

module BILBO #(parameter [2:0] n = 4) (
	input  Clk, 
	input  CE,
	input  B1, B2,     // Mode select
	input  Si,         // Serial input
	output So,         // Serial output
	input [1:n] Z,     // Parallel input
	inout [1:n] Q);    // Parallel output
	
	reg [1:n] nextQ;
	
	wire FB;
	wire [1:0] mode;
	
	initial
	begin
	   nextQ = {n{1'b0}};
	end
	
	assign mode = {B1, B2};
	
	assign Q = nextQ;
	assign FB = Q[1] ^ Q[n];
	
	always @(posedge Clk)
	begin : xhdl_4
		//if (Clk == 1'b1 & CE == 1'b1)
		if (CE == 1'b1)
		begin
		case (mode)
		2'b00 : //Shift register mode
	      begin
			 nextQ <= {Si, Q[1:n-1]};
		  end
		2'b01 : //Pseudo Random Pattern Generator mode
		  begin
			nextQ <= {FB, Q[1:n-1]};
		  end
        2'b10 : //Normal Operation mode
		  begin
			nextQ <= Z;
		  end
        2'b11 : //Multiple Input Signature Register mode
		  begin
			nextQ <= Z[1:n] ^ ({FB, Q[1:n-1]});
		  end
		endcase
		end
	end
	
	assign So = Q[n];

endmodule
