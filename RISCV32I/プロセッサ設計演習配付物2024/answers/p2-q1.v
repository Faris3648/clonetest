/*///////////////////////////////////////////////////////////////
                     
 Verilog 入門 練習2-1 
 
 1つの32ビットの入力inと1つの32ビットの出力outを持ち、
 inに4を加算した値を出力するモジュールplus4を作成せよ。

///////////////////////////////////////////////////////////////*/

//`timescale 1ns/1ns
`define ANSWER

//↓ここにモジュールを書く

module plus4(input[31:0] in, output[31:0] out);
    assign out = in + 32'd4;
endmodule

//↑ここにモジュールを書く

`include "../p2/q1.v"
/*
module top;
    reg[31:0] in;
    wire[31:0] out;
    plus4 i_plus4(.in(in), .out(out));

    always@(in, out)begin
        $display("in=%10d out=%10d %s", in, out, in+4 == out ? "Check Passed!" : "Check Failed!");
    end

    initial begin
        #0
        in <= 0;
        #10
        in <= 10;
        #10
        in <= 50;
        #10
        in <= 132;
        #10
        in <= 892734;
        #10
        in <= 192908;
        #10
        $finish();
    end
endmodule
*/