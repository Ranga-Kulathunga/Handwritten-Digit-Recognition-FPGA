`timescale 1ns / 1ps

module mac3_acc(
    input clk,
    input rst,
    input [127:0] pixels,
    input [127:0] weights,
    input [7:0] b,
    output [21:0] dout_final
    );
   
    wire [19:0] sumOUT;
    //Instantiating MAC
    mac3 MAC(.clk(clk), .pixelsIN(pixels), .weightsIN(weights), .sumOUT(sumOUT)); 
    
    //Instantiating accumulator
    acc ACC(.clk(clk), .rst(rst), .din(sumOUT), .b(b), .dout(dout_final));

endmodule
