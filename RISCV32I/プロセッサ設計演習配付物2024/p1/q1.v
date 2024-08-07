/*///////////////////////////////////////////////////////////////
                     
 Verilog 入門 練習1-1 
 
 32ビットの入力inと32ビットの出力outを持ち、
 inの値をそのままoutに出力するモジュールi2oを作成せよ。

///////////////////////////////////////////////////////////////*/

`timescale 1ns/1ns

`ifndef ANSWER
//↓ここにモジュールを書く



//↑ここにモジュールを書く
`endif //ANSWER

module top;
    reg[31:0] in;
    wire[31:0] out;

    i2o i_i2o (.in(in), .out(out));

    //テスト対象の信号線の監視
    always@(in)begin
        #5
        $display("in=%10d out=%10d %s", in, out, in==out ? "Check Passed!" : "Check Failed!");
    end

    //テスト
    initial begin
        #0
        //monitorでは%sがうまく使えなかった
        //$monitor("in=%10d out=%10d", in, out);
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