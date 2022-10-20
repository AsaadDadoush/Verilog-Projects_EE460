`timescale 1ns / 1ps
module ALU(
	input [7:0] i0,i1,
	input [2:0] sel,
	output reg [7:0] aluOut);
	
	always @(*)
	
	begin 
	
		case(sel)
		
			3'b000:	aluOut = i0 + i1;
			3'b001:	aluOut = i0 - i1;
			3'b010:	aluOut = i0 & i1;
			3'b011:	aluOut = i0 | i1;
			3'b100:	aluOut = i0 ^ i1;
			
			default  aluOut = 8'h00;
		endcase 
	end
endmodule

	