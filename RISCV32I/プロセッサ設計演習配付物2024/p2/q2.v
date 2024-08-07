/*///////////////////////////////////////////////////////////////
 
 Verilog 入門 練習2-2
 
 2つの32ビットの入力a, bと1つの32ビットの出力cを持ち、
 a, bの加算の結果をcに出力するモジュールadderを作成せよ。
 
///////////////////////////////////////////////////////////////*/

`timescale 1ns/1ns

`ifndef ANSWER
//↓ここにモジュールを書く



//↑ここにモジュールを書く
`endif //ANSWER

module top;
    reg[31:0] a, b;
    wire[31:0] c;
    adder i_adder(.a(a), .b(b), .c(c));

    always@(a, b)begin
		#5
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