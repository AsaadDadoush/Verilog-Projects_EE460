
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Mohammad Awedh
// 
// Create Date:    15:49:23 08/29/2021 
// Design Name: 
// Module Name:    triStateBuff
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
module triStateBuff #(parameter W = 8) (
    input      [W-1:0] buffIn,
    output reg [W-1:0] buffOut,
    input enb			//Active High
    );

	always @(*)
		if(enb)
			buffOut = buffIn;
		else
			buffOut = 8'hzz;
			
endmodule