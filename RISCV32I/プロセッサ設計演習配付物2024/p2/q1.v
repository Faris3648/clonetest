/*///////////////////////////////////////////////////////////////
 
 Verilog 入門 練習2-1 
 
 1つの32ビットの入力inと1つの32ビットの出力outを持ち、
 inに4を加算した値を出力するモジュールplus4を作成せよ。
 
///////////////////////////////////////////////////////////////*/

`timescale 10ns/10ns

`ifndef ANSWER
//↓ここにモジュールを書く



//↑ここにモジュールを書く
`endif //ANSWER

module top;
    reg[31:0] in;
    wire[31:0] out;
    plus4 i_plus4(.in(in), .out(out));

    always@(in)begin
        #5
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