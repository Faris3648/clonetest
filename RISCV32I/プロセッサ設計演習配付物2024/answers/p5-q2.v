/*///////////////////////////////////////////////////////////////
 
 Verilog 入門 練習5-2
 
 3つの1ビットの入力clk, rst, write_n、
 3つのceil(log2(reg_num))ビットの入力rs1, rs2, rd、1つのdata_widthビットの入力in、
 2つのdata_widthビットの出力out1, out2、
 内部にreg_num本のレジスタを持ち、
 クロックの立ち上がりでwrite_nが0であればrdで指定されたレジスタにinを書き込み、
 それ以外であれば全てのレジスタの値を保持し、out1にrs1で指定されたレジスタの値を、
 out2にrs2で指定されたレジスタの値を出力するモジュールregfileを作成せよ。
 ただし、rstが立ち下がった時は全てのレジスタを0とする。
 また、パラメータzeroregが1である場合はレジスタ0には何を書き込まれても常に0であるものとする。
 既定値はdata_widthが32、reg_numが32、zeroregが1とする。
 デバッグの兼ね合いで、内部のレジスタはregistersという名のレジスタ配列とする。

 ヒント: 
 レジスタ配列を使ってdata_widthビットreg_num本のレジスタを作る
 ゼロレジスタの有効無効はgenerateを使う（コンパイル時にどちらか決定するため）
 レジスタアドレスのビット幅（ceil(log2(reg_num))）はシステムタスク$clog2()で実現できる
 
///////////////////////////////////////////////////////////////*/

//`timescale 10ns/10ns
`define ANSWER

//↓ここにモジュールを書く

module regfile #(
    parameter data_width = 32,
    parameter reg_num = 32,
    parameter addr_width = $clog2(reg_num),
    parameter zeroreg = 1
)(
    input clk, input rst, input write_n,
    input[addr_width-1:0] rs1, input[addr_width-1:0] rs2, input[addr_width-1:0] rd,
    input[data_width-1:0] in,
    output[data_width-1:0] out1, output[data_width-1:0] out2
);
    integer i;
    reg[data_width-1:0] registers[0:reg_num];
    
    //ゼロレジスタ対応の場合分け
    generate 
        if(zeroreg) begin
            assign out1 = rs1 == 0 ? 0 : registers[rs1];
            assign out2 = rs2 == 0 ? 0 : registers[rs2];
        end else begin
            assign out1 = registers[rs1];
            assign out2 = registers[rs2];
        end    
    endgenerate

    always@(posedge clk, negedge rst)begin
        if(!rst) begin
            for(i = 0; i < reg_num; i = i+1)begin
                registers[i] <= 0;
            end
        end else if(!write_n) begin
            for(i = 0; i < reg_num; i = i+1)begin
                registers[i] <= rd == i ? in : registers[i];
            end
        end else begin
            for(i = 0; i < reg_num; i = i+1)begin
                registers[i] <= registers[i];
            end
        end
    end
    
endmodule

//↑ここにモジュールを書く

`include "../p5/q2.v"
/*
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
*/