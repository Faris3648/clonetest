/*///////////////////////////////////////////////////////////////
 
 Verilog 入門 練習2-2
 
 2つの32ビットの入力a, bと1つの32ビットの出力cを持ち、
 a, bの加算の結果をcに出力するモジュールadderを作成せよ。
 
///////////////////////////////////////////////////////////////*/

//`timescale 1ns/1ns
`define ANSWER

//↓ここにモジュールを書く

module adder(input[31:0] a, input[31:0] b, output[31:0] c);
    assign c = a+b;
endmodule

//↑ここにモジュールを書く

`include "../p2/q2.v"
/*
module top;
    reg[31:0] a, b;
    wire[31:0] c;
    adder i_adder(.a(a), .b(b), .c(c));

    always@(a, b, c)begin
        $display("a=%10d b=%10d c=%10d %s", a, b, c, a+b == c ? "Check Passed!" : "Check Failed!");
    end

    initial begin
        #0
        a <= 0;
		b <= 0;
        #10
        a <= 5;
		b <= 4;
        #10
        a <= 13;
		b <= 66;
        #10
        a <= 749;
		b <= 619;
        #10
        a <= 786;
		b <= 4932;
        #10
        a <= 65035;
		b <= 555489;
        #10
        $finish();
    end
endmodule
*/