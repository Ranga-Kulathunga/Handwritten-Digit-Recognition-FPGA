`timescale 1ns / 1ps

module tb_nodefunc();

    parameter half_cycle = 20;
    reg [127:0] data_p [39:0];
    reg [127:0] data_w [39:0];
    wire [7:0] nodeOut;
    
    reg [127:0] p,w;
    reg [7:0] b;
    
    reg [7:0] count;
    reg clk,rst1,rst2;
    wire clk2;
    
    integer outfile;
    assign #2 clk2 = clk; // delayed clock
    
    node_func uut(clk2,rst2,p,w,b,nodeOut);
    
    initial begin
        $readmemh("digits_hex.txt",data_p);
        $readmemh("weights_hex.txt",data_w);
        outfile = $fopen("simout.txt","w");
        clk=0;
        count=0;
        rst1=1;
        rst2=1;
        b=11;
        #145 rst1=0;   
    end
    
    always #half_cycle clk = !clk;
    
   // write node output to file
    always @(posedge clk)
    if((count>7)&(count[1:0]==2'b00))
        $fdisplay(outfile,"%h",nodeOut);
        
    always @(posedge clk2) begin
    p = data_p[count];
    w = data_w[count];
    
    if(!rst1) begin
        count = count+1;
        
        if(count == 4)
            rst2 = 0;
        
        if(count == 45) begin
            $fclose(outfile);
            $finish;
        end
    end
    end
    
endmodule
