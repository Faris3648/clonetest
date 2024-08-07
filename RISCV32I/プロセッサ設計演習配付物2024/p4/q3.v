/*///////////////////////////////////////////////////////////////
 
 Verilog 入門 練習4-3
 
 2つの1ビットの入力clk, rst、1つの32ビットの出力outを持ち、
 clkが立ち上がる度に1加算された値を出力するモジュールdeccntrを作成せよ。
 初期値は0で、rstが立ち下がると0にリセットされるものとする。
 ただし、999の次は0となるようにする。
 
///////////////////////////////////////////////////////////////*/

`timescale 1ns/1ns

`ifndef ANSWER
//↓ここにモジュールを書く



//↑ここにモジュールを書く
`endif //ANSWER

module top;
    reg clk, rst;
    wire[31:0] out;
	integer i;
    deccntr i_deccntr(.clk(clk), .rst(rst), .out(out));

    always@(clk, rst)begin
        #5
        $display("%d out=%10d", $time, out);
    end

    initial begin
        #0
        clk <= 0;
		rst <= 1;
        #10
		rst <= 0;
		#5
		rst <= 1;
		for(i = 0; i < 220; i = i+1) #10 clk <= ~clk;
		#5
		rst <= 0;
		#5
		rst <= 1;
		for(i = 0; i < 110; i = i+1) #10 clk <= ~clk;
        $finish();
    end
endmodule