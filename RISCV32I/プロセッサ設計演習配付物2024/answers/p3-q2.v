/*///////////////////////////////////////////////////////////////
 
 Verilog 入門 練習3-2
 
 1つの16ビットの入力inと1つの32ビットの出力outを持ち、
 inを符号拡張して32ビットにするモジュールsextを作成せよ。
 
///////////////////////////////////////////////////////////////*/

//`timescale 1ns/1ns
`define ANSWER

//↓ここにモジュールを書く

module sext(input[15:0] in, output[31:0] out);
	assign out = {{16{in[15]}}, in};
endmodule

//↑ここにモジュールを書く

`include "../p3/q2.v"
/*
module top;
	reg[15:0] in;
	wire[31:0] out;
	sext i_sext(.in(in), .out(out));

	always@(in)begin
		#5
		$display("in=%10d(%b) out=%10d(%b) %s", in, in, out, out, out == {{16{in[15]}}, in} ? "Check Passed!" : "Check Failed!");
	end

	initial begin
		#0
		in <= 0;
		#10
		in <= 53;
		#10
		in <= 32;
		#10
		in <= -19;
		#10
		in <= -39;
		#10
		in <= -3615;
		#10
		in <= 9580;
		#10
		in <= -9245;
		#10
		$finish();
	end
endmodule
*/