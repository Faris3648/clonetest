/*///////////////////////////////////////////////////////////////
 
 Verilog 入門 練習2-3
 
 1つの1ビットの入力ctrlと2つの32ビットの入力a, b、
 1つの32ビットの出力outを持ち、
 ctrlが0のときaを、1のときbをoutに出力するモジュールmuxを作成せよ。
 
///////////////////////////////////////////////////////////////*/

//`timescale 1ns/1ns
`define ANSWER

//↓ここにモジュールを書く

module mux(input[31:0] a, input[31:0] b, input ctrl, output[31:0] out);
    assign out = ctrl ? b : a;
endmodule

//↑ここにモジュールを書く


`include "../p2/q3.v"
/*
module top;
    reg[31:0] a, b;
	reg ctrl;
    wire[31:0] out;
    adder i_adder(.a(a), .b(b), .ctrl(ctrl), .out(out));

    always@(in, out)begin
        $display("ctrl=%1b a=%10d b=%10d out=%10d %s", ctrl, a, b, out, !ctrl ? out == a ? "Check Passed!" : "Check Failed!");
    end

    initial begin
        #0
		ctrl <= 0;
        a <= 0;
		b <= 0;
        #10
		ctrl <= 1;
        a <= 5;
		b <= 4;
        #10
		ctrl <= 1;
        a <= 13;
		b <= 66;
        #10
		ctrl <= 1;
        a <= 749;
		b <= 619;
        #10
		ctrl <= 0;
        a <= 786;
		b <= 4932;
        #10
		ctrl <= 0;
        a <= 65035;
		b <= 555489;
        #10
        $finish();
    end
endmodule
*/