`timescale 1ns / 1ps

module tb_acc();
    parameter half_cycle = 20;
    
    reg clk,rst;
    reg [19:0] din;
    reg [7:0] b;
    wire [21:0] dout;
    
    acc uut(clk,rst,din,b,dout);
    
    initial begin
        clk = 0;
        rst = 1;
        b = 11;
        din = 0;
    end

    always #half_cycle clk = !clk;
    
    initial begin
    #110 rst = 0;
    #40 din = 1;
    #40 din = 2;
    #40 din = 3;
    #40 din = 4;
    #40 din = -3;
    #40 din = 2;
    #40 din = -5;
    #40 din = -10;
    #80 $finish;
    end

endmodule
