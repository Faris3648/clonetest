/*///////////////////////////////////////////////////////////////
 
 Verilog 入門 練習3-3
 
 1つの32ビットの入力instと1つの32ビットの出力immを持ち、
 instのRISC-V命令から即値を取り出しimmに出力するモジュールimmgenを作成せよ。
 ただし即値のない命令の場合は0を出力する。
 
///////////////////////////////////////////////////////////////*/

`timescale 1ns/1ns

`ifndef ANSWER
//↓ここにモジュールを書く



//↑ここにモジュールを書く
`endif //ANSWER

module top;
	reg[31:0] inst;
	wire signed[31:0] imm;
	immgen i_immgen(.inst(inst), .imm(imm));

	always@(inst)begin
		#5
		$display("inst=%h(%b) imm=%h(%d) %s", inst, inst, imm, imm, check(inst, imm) ? "Check Passed!" : "Check Failed!");
	end

	initial begin
		#0
		inst <= 0;
		#10
		inst <= 32'hf8010113; //addi sp, sp, -128
		#10
		inst <= 32'h08030137; //lui sp, 0x8030 #li 0x8030000
		#10
		inst <= 32'h010000ef; //jal ra, 16
		#10
		inst <= 32'h06112e23; //sw ra, 124(sp)
		#10
		inst <= 32'h0187a783; //lw a5, 24(a5)
		#10
		inst <= 32'hfd042023; //sw  a6, -64(s0)
		#10
		inst <= 32'h15478793; //addi a5, a5, 340
		#10
		inst <= 32'h00008067; //jalr 0(ra)
		#10
		inst <= 32'h00f71a63; //bne a4, a5, 20
		#10
		inst <= 32'hd2e7d8e3; //bge a5, a4, -720
		#10
		inst <= 32'h00e787b3; //add a5, a5, a4
		#10
		$finish();
	end

	function check(input[31:0] inst, input[31:0] imm);
		case(inst[6:0])
			7'b0000011: check = {{20{inst[31]}}, inst[31:20]} == imm;
			7'b0010011: check = {{20{inst[31]}}, inst[31:20]} == imm;
			7'b0100011: check = {{20{inst[31]}}, inst[31:25], inst[11:7]} == imm;
			7'b1100011: check = {{20{inst[31]}}, inst[7], inst[30:25], inst[11:8], 1'b0} == imm;
			7'b0010111: check = {inst[31:12], 12'b0} == imm;
			7'b0110111: check = {inst[31:12], 12'b0} == imm;
			7'b1100111: check = {{20{inst[31]}}, inst[31:20]} == imm;
			7'b1101111: check = {{20{inst[31]}}, inst[19:12], inst[20], inst[30:21], 1'b0} == imm;
			default: check = 32'b0 == imm; 
		endcase
	endfunction
endmodule