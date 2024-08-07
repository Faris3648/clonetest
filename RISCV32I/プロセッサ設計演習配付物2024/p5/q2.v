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
 ヒント: 
 レジスタ配列を使ってdata_widthビットreg_num本のレジスタを作る
 ゼロレジスタの有効無効はgenerateを使う（コンパイル時にどちらか決定するため）
 レジスタアドレスのビット幅（ceil(log2(reg_num))）はシステムタスク$clog2()で実現できる

///////////////////////////////////////////////////////////////*/

`timescale 10ns/10ns

`ifndef ANSWER
//↓ここにモジュールを書く



//↑ここにモジュールを書く
`endif //ANSWER

module top;
    reg clk, rst, write_n;
    reg[31:0] in;
	reg[4:0] rs1, rs2, rd;
	wire[31:0] out1, out2;
	integer i, j;
    regfile i_regfile(
		.clk(clk), .rst(rst), .write_n(write_n), 
		.rs1(rs1), .rs2(rs2), .rd(rd), .in(in), .out1(out1), .out2(out2));

    always@(clk, rst)begin
        #5
        $write("%10d: rs1=%d rs2=%d rd=%d write_n=%b in=%h out1=%h out2=%h", $time, rs1, rs2, rd, write_n, in, out1, out2);
		reg_dump;
    end

    initial begin
        #0
        clk <= 0;
		rst <= 1;
		write_n <= 1;
		rs1 <= 0;
		rs2 <= 0;
		rd <= 0;
        #10
		rst <= 0;
		#5
		rst <= 1;
		#10
		for(i = 0; i < 10; i = i+1) #10 clk <= ~clk;
		write_n <= 0;
		rd <= 1;
		in <= 'h100;
		rs1 <= 1;
		rs2 <= 2;
		#10
		clk <= ~clk;
		#10
		clk <= ~clk;
		write_n <= 1;
		for(i = 0; i < 10; i = i+1) #10 clk <= ~clk;
		write_n <= 0;
		rd <= 5;
		in <= 'h12345;
		rs1 <= 1;
		rs2 <= 5;
		#10
		clk <= ~clk;
		#10
		clk <= ~clk;
		write_n <= 1;
		for(i = 0; i < 10; i = i+1) #10 clk <= ~clk;
		write_n <= 0;
		rd <= 4;
		in <= 'hdeadbeef;
		rs1 <= 1;
		rs2 <= 5;
		#10
		clk <= ~clk;
		#10
		clk <= ~clk;
		write_n <= 1;
		for(i = 0; i < 10; i = i+1) #10 clk <= ~clk;
		write_n <= 0;
		rd <= 0;
		in <= 'h12345;
		rs1 <= 0;
		rs2 <= 4;
		#10
		clk <= ~clk;
		#10
		clk <= ~clk;
		write_n <= 1;
		for(i = 0; i < 10; i = i+1) #10 clk <= ~clk;
		#5
		rst <= 0;
		#5
		rst <= 1;
		for(i = 0; i < 10; i = i+1) #10 clk <= ~clk;
        $finish();
    end

	task reg_dump;
		reg[31:0] tmp;
	begin
		for(j = 0; j < 32; j = j+1)begin
			tmp = i_regfile.registers[j];
			if(j%4 == 0) $write("\n");
			$write("%d:%h ", j, tmp);
		end
		$write("\n");
	end
	endtask
endmodule