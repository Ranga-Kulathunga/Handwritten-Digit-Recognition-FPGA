`timescale 1ns / 1ps

module node_func(
    input clk,
    input rst,
    input [127:0] pixels,
    input [127:0] weights,
    input [7:0] b,
    output [7:0] nodeOut
    );
    
    wire [21:0] d_out;
    
    mac3_acc mac3_acc_inst(
        .clk        (clk),
        .rst        (rst),
        .pixels     (pixels),
        .weights    (weights),
        .b          (b),
        .dout_final (d_out)
    );
    
    sigm_func sigm_func_inst(
        .sigmIn     (d_out),
        .sigmOut    (nodeOut)
    );
        
endmodule
