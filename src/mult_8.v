`timescale 1ns / 1ps

module mult_8(
    input signed [7:0] wi,
    input signed [7:0] xi,
    output signed [15:0] pi
    );
    
    assign pi = wi*xi;
endmodule
