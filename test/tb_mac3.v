`timescale 1ns / 1ps

module tb_mac3();

    parameter half_cycle = 20;
    reg [127:0] data_p[39:0];
    reg [127:0] data_w[39:0];
    wire [19:0] s;
    
    reg [127:0] p,w;
    reg [7:0] count;
    reg clk;
    wire clk2;
    
    integer outfile;
    
    assign #2 clk2=clk; //delayed clk
    
    mac3 uut(p,w,s);
    
    initial begin
        $readmemh("digits_hex.txt",data_p);
        $readmemh("weights_hex.txt",data_w);
        outfile = $fopen("simout.txt","w");
        clk = 0;
        count = 0;
    end
   
   
    always #half_cycle clk = !clk;
    
    // write to file
    always @(posedge clk)
    if(count > 0)
        $fdisplay(outfile,"%h",s);
        
    always @(posedge clk2) begin
        p = data_p[count];
        w = data_w[count];
        count = count + 1;
        if (count == 41) begin
            $fclose(outfile);
            $finish;
        end
    end
endmodule
