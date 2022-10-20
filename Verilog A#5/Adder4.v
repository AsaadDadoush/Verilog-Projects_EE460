`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2019 05:02:27 PM
// Design Name: 
// Module Name: Adder4
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 4-bit Adder
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Adder4 #(parameter [2:0] n = 4)(
    input [n-1:0] A, B, 
    input cIn, 
    output [n-1:0] Sum, 
    output cOut);

    assign {cOut, Sum} = A + B + cIn;

endmodule
