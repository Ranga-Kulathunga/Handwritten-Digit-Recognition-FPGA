`timescale 1ns / 1ps

module acc(
    input clk,
    input rst,
    input [19:0] din,
    input [7:0] b,
    output reg [21:0] dout
    );
    
    reg [21:0] accReg,muxout;
    
    wire sel,en;
    wire [21:0] b_ext,sum;
    
    adder22 ul(din,muxout,sum);
    acc_ctrl u2(clk,rst,sel,en);
    
    assign b_ext = {{14{b[7]}},b}; // sign extension
    
    always @(posedge clk) begin
        if(en)
            dout <= sum;
    end
    
    always @(posedge clk)
        accReg <= sum;
        
    always @(*) begin
        if(sel)
            muxout = b_ext;
        else
            muxout = accReg;
    end
endmodule
