/*///////////////////////////////////////////////////////////////
 
 Verilog 入門 練習2-3
 
 1つの1ビットの入力ctrlと2つの32ビットの入力a, b、
 1つの32ビットの出力outを持ち、
 ctrlが0のときaを、1のときbをoutに出力するモジュールmuxを作成せよ。
 
///////////////////////////////////////////////////////////////*/

`timescale 1ns/1ns

`ifndef ANSWER
//↓ここにモジュールを書く



//↑ここにモジュールを書く
`endif //ANSWER

module top;
    reg[31:0] a, b;
	reg ctrl;
    wire[31:0] out;
    mux i_mux(.a(a), .b(b), .ctrl(ctrl), .out(out));

    always@(a, b, ctrl)begin
		#5
        $display("ctrl=%1b a=%10d b=%10d out=%10d %s", ctrl, a, b, out, (!ctrl && out == a) || (ctrl && out == b) ? "Check Passed!" : "Check Failed!");
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