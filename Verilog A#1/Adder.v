
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:47:30 01/23/2020 
// Design Name: 
// Module Name:    Adder
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

module Adder(
	input [7:0] data_x,data_y,
	output reg [7:0] dataOut);
	
	always @(*)
	
		dataOut = data_x + data_y;
endmodule

	
	