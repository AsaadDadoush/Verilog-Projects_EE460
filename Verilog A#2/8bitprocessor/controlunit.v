`timescale 1ns / 1ps
module controlUnit(
  input [2:0] opCode,
  output regWrite,
  output [2:0] aluSelction,
  output [1:0] destSrc);
  
  reg [5:0] ctrlSignals;
  assign {regWrite, aluSelction, destSrc} = ctrlSignals;

  always @(*)
    case(opCode)        // wr,alu,mux
     3'b000: ctrlSignals = 6'b1_XXX_00; //load
	  3'b001: ctrlSignals = 6'b1_XXX_01; //mov
	  3'b010: ctrlSignals = 6'b1_000_11; //add
	  3'b011: ctrlSignals = 6'b1_001_11; //sub
	  3'b100: ctrlSignals = 6'b1_010_11; //and
	  3'b101: ctrlSignals = 6'b1_011_11; //or
	  3'b110: ctrlSignals = 6'b1_100_11; //xor
	  3'b111: ctrlSignals = 6'b0_XXX_10; //store
	  default : ctrlSignals = 6'b000000;
    endcase
endmodule
