
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08/29/2021 
// Design Name: 
// Module Name:    triStateBus 
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
module triStateBus #(parameter W = 8)(
	input [W-1:0] inData,   // External input data
   inout [W-1:0] dataBus,	// Bus
	// Control Signals
	input enbIn, enbA, enbB, enbC, enbAdd,
	input ldA, ldB, ldC, 
	//
	input reset,
	input clock);
			
	wire [W-1:0] dataOutA, dataOutB, dataOutC, dataOutAdder;

	triStateBuff #(W) triBufIn(inData, dataBus, enbIn);
    
	triStateBuff #(W) triBufA(dataOutA, dataBus, enbA);
	triStateBuff #(W) triBufB(dataOutB, dataBus, enbB);
	triStateBuff #(W) triBufC(dataOutC, dataBus, enbC);
	
	triStateBuff #(W) triAdd(dataOutAdder, dataBus, enbAdd);
	
	Adder Add_1(dataOutA, dataOutC, dataOutAdder);

	eightBitRegister #(W) regA(dataBus, dataOutA, ldA, reset, clock);
	eightBitRegister #(W) regB(dataBus, dataOutB, ldB, reset, clock);
	eightBitRegister #(W) regC(dataBus, dataOutC, ldC, reset, clock);
	

endmodule
