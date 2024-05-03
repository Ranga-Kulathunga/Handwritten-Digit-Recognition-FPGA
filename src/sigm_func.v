`timescale 1ns / 1ps

module sigm_func(
    input [21:0] sigmIn,
    output [7:0] sigmOut
    );
    
    wire ovf;
    wire sign;
    wire [8:0] addr;
    
    assign sign = sigmIn[21];
    assign ovf = (!sigmIn[21] && |sigmIn[20:14]) || (sigmIn[21] && (!(&sigmIn[20:14]) || !(|sigmIn[13:5])));
    assign addr = sigmIn[13:5];
    
    sigmoid_0 sigm_inst(
        .addr(addr),
        .sign(sign),
        .ovf(ovf),
        .data(sigmOut)
    );
    
endmodule
