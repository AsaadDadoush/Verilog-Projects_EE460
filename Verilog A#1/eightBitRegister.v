
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:46:17 08/29/2015 
// Design Name: 
// Module Name:    eightBitRegister 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module eightBitRegister #(parameter W = 8) (
   input  [W-1:0] dataIn,
   output [W-1:0] dataOut,
   input enb,
   input reset,
   input clock);

	reg  [W-1:0] data;

	assign dataOut = data;

   // asynchronous reset
   always @ (posedge clock, posedge reset)
      if (reset)  
          data  <= 8'h00;
      else 
         if (enb) 
            data <= dataIn;
endmodule
