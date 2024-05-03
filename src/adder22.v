`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/25/2024 01:36:16 PM
// Design Name: 
// Module Name: adder22
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


module adder22(
    input signed [19:0] a,
    input signed [21:0] b,
    output signed [21:0] s
    );
    
    assign s = a+b;
endmodule
