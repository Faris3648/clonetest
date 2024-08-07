/*///////////////////////////////////////////////////////////////
                     
 Verilog 入門 練習1-1 
 
 3つの1ビットの入力clk, rst, write_nと1つの32ビットの入力in、1つの32ビットの出力outを持ち、
 内部で値を保持してその値をoutに出力するモジュールregisterを作成せよ。
 clkの立ち上がりでwrite_nが0であれば内部の値をinとし、それ以外では値を保持する。
 初期値は0で、rstが立ち下がると0にリセットされるものとする。

///////////////////////////////////////////////////////////////*/

`timescale 1ns/1ns

`ifndef ANSWER
//↓ここにモジュールを書く



//↑ここにモジュールを書く
`endif //ANSWER

module top;
    reg clk, rst, write_n;
	reg[31:0] in;
    wire[31:0] out;
	integer i;
    register i_register(.clk(clk), .rst(rst), .write_n(write_n), .in(in), .out(out));

    always@(clk, rst, write_n, in)begin
        #5
        $display("%d rst=%d write_n=%b in=%10d out=%10d", $time, rst, write_n, in, out);
    end

    initial begin
        #0
        clk <= 0;
		rst <= 1;
		write_n <= 1;
		in <= 0;
        #10
		rst <= 0;
		#5
		rst <= 1;
		for(i = 0; i < 10; i = i+1) #10 clk <= ~clk;
		#10
		write_n <= 0;
		in <= 123;
		clk <= ~clk;
		#10
		write_n <= 1;
		clk <= ~clk;
		in <= 0;
		for(i = 0; i < 10; i = i+1) #10 clk <= ~clk;
		#5
		rst <= 0;
		#5
		rst <= 1;
		for(i = 0; i < 10; i = i+1) #10 clk <= ~clk;
		#10
		write_n <= 0;
		in <= 546;
		clk <= ~clk;
		#10
		write_n <= 1;
		clk <= ~clk;
		in <= 0;
		for(i = 0; i < 10; i = i+1) #10 clk <= ~clk;
        $finish();
    end
endmodule