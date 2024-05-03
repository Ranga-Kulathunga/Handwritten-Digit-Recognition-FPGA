`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2024 02:54:28 PM
// Design Name: 
// Module Name: tb_sigm
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


module tb_sigm();

    parameter half_cycle = 20;
    reg signed [21:0] count;
    reg clk;
    wire clk2;
    wire [7:0] data_out;
    integer outfile;
    
    assign #2 clk2 = clk; //delayed clock
    
    sigm_func uut(count, data_out);
    
    initial begin
    outfile = $fopen("C:/Users/SIU856570146/OneDrive - Southern Illinois University/Documents/Spring 2024/ECE 528 - Programmable ASIC Design/Project/Handwritten-Digit-Recognition-FPGA/test/simout.txt","w");
    clk=0;
    count = -16640;
    end
    
    always #half_cycle clk = !clk;
    
    // write to file
    always @(posedge clk)
        $fdisplay(outfile, "%h", data_out);
        
    always @(posedge clk2) begin
    count = count + 32;
    if(count>=16640) begin
        $fclose(outfile);
        $finish;
    end
    end
endmodule
