`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2024 02:24:04 PM
// Design Name: 
// Module Name: tb_mult_2
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


module tb_mult_2( );

    parameter half_cycle = 10;
    
    reg [7:0] data_a[3:0];
    reg [7:0] data_b[3:0]; // 8-bit memory with 4 locations
    
    reg [7:0] a, b;
    reg clk;
    reg [3:0] count;
    
    wire [15:0] p;
    wire clk2;
    
    integer outfile;
    
    assign #2 clk2=clk; // delayed clk
    
    mult mult1(a,b,p);
    
    initial begin
       $readmemh("vectora.txt", data_a);
       $readmemh("vectorb.txt", data_b);
       outfile = $fopen("C:/Users/SIU856570146/OneDrive - Southern Illinois University/Documents/Spring 2024/ECE 528 - Programmable ASIC Design/Project/Handwritten-Digit-Recognition-FPGA/test/simout.txt","w");
       clk = 0;
       count = 0;
    end
     
    always #half_cycle clk = !clk; // generate clock
    
    // write to file
    always @(posedge clk)
    $fdisplay(outfile, "%d: a=%h, b=%h, p=%h", count, a, b, p);
    
    always @(posedge clk2) begin
        a = data_a[count];
        b = data_b[count];
        
        count = count + 1;
        if (count == 5) begin
            $fclose(outfile);
            $finish;
        end
    end 

endmodule
