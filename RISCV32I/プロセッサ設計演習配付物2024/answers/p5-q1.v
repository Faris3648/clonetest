/*///////////////////////////////////////////////////////////////
 
 Verilog 入門 練習5-1
 
 練習3で作成したaluの入出力のビット幅をパラメータ化して、32ビット以外に対応できるように変更せよ。
 パラメータ名はdata_widthとして、規定値は32とする。
 +----+-------+
 |ctrl| out   |
 +----+-------+
 |000 | a+b   |
 |001 | a-b   |
 |010 | a&b   |
 |011 | a|b   |
 |100 | a^b   |
 |101 | a<<b  |
 |110 | a>>b  |
 |111 | a>>>b |
 +----+-------+
 
 
///////////////////////////////////////////////////////////////*/

//`timescale 1ns/1ns
`define ANSWER

//↓ここにモジュールを書く

module alu #(
	parameter data_width = 32
)(
	input signed[data_width-1:0] a, input signed[data_width-1:0] b, input[2:0] ctrl, output signed[data_width-1:0] out
);
	assign out = f_alu(a, b, ctrl);

	function signed [data_width-1:0] f_alu(input signed[data_width-1:0] a, input signed[data_width-1:0] b, input[2:0] ctrl);
		case(ctrl)
			3'b000: f_alu = a+b;
			3'b001: f_alu = a-b;
			3'b010: f_alu = a&b;
			3'b011: f_alu = a|b;
			3'b100: f_alu = a^b;
			3'b101: f_alu = a<<b;
			3'b110: f_alu = a>>b;
			3'b111: f_alu = a>>>b;
		endcase
	endfunction
endmodule

//↑ここにモジュールを書く

`include "../p5/q1.v"
/*
module top;
    reg signed[31:0] a, b;
	reg signed[2:0] ctrl;
    wire signed[31:0] out;
	wire test;
	integer i;
    alu i_alu #(.data_width(16)) (.a(a), .b(b), .ctrl(ctrl), .out(out));

    always@(a, b, ctrl)begin
		#5
        $display("ctrl=%3b a=%10d(%b) b=%10d(%b) out=%10d(%b) %s", ctrl, a, a, b, b, out, out, check(a, b, out, ctrl) ? "Check Passed!" : "Check Failed!");
    end

    initial begin
        #0
		ctrl <= 3'b000;
        a <= 0;
		b <= 0;
		for(i = 0; i < 5; i = i+1)begin
			#10
			ctrl <= i;
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
			a <= 36;
			b <= -83;
			#10
			a <= -77;
			b <= 5528;
			#10
			a <= -1488;
			b <= -5942;
		end
		for(i = 5; i < 8; i = i+1)begin
			#10
			ctrl <= i;
			a <= 1;
			b <= 6;
			#10
			a <= 39;
			b <= 11;
			#10
			a <= 359;
			b <= 7;
			#10
			a <= 1048;
			b <= 13;
			#10
			a <= 47972;
			b <= 10;
			#10
			a <= -5132;
			b <= 8;
			#10
			a <= -5173;
			b <= 3;
			#10
			a <= -400;
			b <= 2;
		end
		#10
        $finish();
    end

	function check(input signed[31:0] a, input signed[31:0] b, input signed[31:0] out, input[2:0] ctrl);
		case(ctrl)
			3'b000: check = (out == (a+b));
			3'b001: check = (out == (a-b));
			3'b010: check = (out == (a&b));
			3'b011: check = (out == (a|b));
			3'b100: check = (out == (a^b));
			3'b101: check = (out == (a<<b));
			3'b110: check = (out == (a>>b));
			3'b111: check = (out == (a>>>b));
		endcase
	endfunction
endmodule
*/
