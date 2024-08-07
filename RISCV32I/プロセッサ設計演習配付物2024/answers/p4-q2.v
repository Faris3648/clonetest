/*///////////////////////////////////////////////////////////////
 
 Verilog 入門 練習4-2
 
 2つの1ビットの入力clk, rstと1つの32ビットの出力outを持ち、
 clkが立ち上がる度に1加算された値を出力するモジュールcounter32を作成せよ。
 初期値は0で、rstが立ち下がると0にリセットされるものとする。
 
///////////////////////////////////////////////////////////////*/

//`timescale 10ns/10ns
`define ANSWER

//↓ここにモジュールを書く

module counter32(input clk, input rst, output reg[31:0] out);
    always@(posedge clk or negedge rst)begin
        if(!rst)begin
            out <= 0;
        end else begin
            out <= out+1;
        end
    end
endmodule

//↑ここにモジュールを書く

`include "../p4/q2.v"
/*
module top;
    reg clk, rst;
    wire[31:0] out;
	integer i;
    counter32 i_counter32(.clk(clk), .rst(rst), .out(out));

    always@(clk, rst)begin
        #5
        $display("out=%10d", out);
    end

    initial begin
        #0
        clk <= 0;
		rst <= 1;
        #5
		rst <= 0;
		#5
		rst <= 1;
		for(i = 0; i < 100; i = i+1) #10 clk <= ~clk;
		#5
		rst <= 0;
		#5
		rst <= 0;
		for(i = 0; i < 100; i = i+1) #10 clk <= ~clk;
        $finish();
    end
endmodule
*/