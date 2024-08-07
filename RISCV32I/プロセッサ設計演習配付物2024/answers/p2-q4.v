/*///////////////////////////////////////////////////////////////
 
 Verilog 入門 練習2-3
 
 1つの3ビットの入力ctrlと2つの32ビットの入力a, b、
 1つの32ビットの出力outを持ち、
 下の表に示す出力をするモジュールaluを作成せよ。
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

module alu(input signed[31:0] a, input signed[31:0] b, input[2:0] ctrl, output signed[31:0] out);
	assign out = 
		ctrl == 3'b000 ? a+b : 
		ctrl == 3'b001 ? a-b :
		ctrl == 3'b010 ? a&b : 
		ctrl == 3'b011 ? a|b :
		ctrl == 3'b100 ? a^b :
		ctrl == 3'b101 ? a<<b :
		ctrl == 3'b110 ? a>>b : a>>>b;
endmodule

//↑ここにモジュールを書く

`include "../p2/q4.v"
/*
module top;
    reg[31:0] a, b;
	reg[2:0] ctrl;
    wire[31:0] out;
    alu i_alu(.a(a), .b(b), .ctrl(ctrl), .out(out));

    always@(in, out)begin
        $display("ctrl=%3b a=%10d b=%10d out=%10d %s", ctrl, a, b, out, check(.a(a), .b(b), .ctrl(ctrl), .out(out)));
    end

    initial begin
		integer i;
        #0
		ctrl <= 3'b000;
        a <= 0;
		b <= 0;
		for(i = 0; i < 8; i = i+1)begin
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
		end
		#10
        $finish();
    end

	function[0] check(input signed[31:0] a, input signed[31:0] b, input signed[31:0] out, input[2:0] ctrl);
		case(ctrl)
			3'b000: check = (out == a+b);
			3'b001: check = (out == a-b);
			3'b010: check = (out == a&b);
			3'b011: check = (out == a|b);
			3'b100: check = (out == a^b);
			3'b101: check = (out == a<<b);
			3'b110: check = (out == a>>b);
			3'b111: check = (out == a>>>b);
		endcase
	endfunction
endmodule
*/