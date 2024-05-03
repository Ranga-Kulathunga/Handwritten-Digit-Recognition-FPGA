`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2024 02:14:43 PM
// Design Name: 
// Module Name: tb_mult
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


module tb_mult_1( );

    reg [7:0] a,b;
    wire [15:0] s;
    mult mult1 (a,b,s);
    
    initial begin
        a = 0;
        b = 0;
        #10 a = 7; b = 1;
        #10 a = -5; b = 3;
        #20 $finish;
     end

endmodule
