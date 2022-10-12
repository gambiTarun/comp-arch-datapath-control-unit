`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:01:21 04/06/2020 
// Design Name: 
// Module Name:    Datapath 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Datapath(
	input clk,
	input Reg_write,ALU_op,ALU_src,Writeback_src,Reset,
	output [5:0] Opcode,
	output [5:0] Funct
	);
wire [31:0] Instr;
wire [4:0] WriteRegNum;
wire [31:0] WriteData;
wire [4:0] ReadRegNum1;
wire [31:0] ReadData1;
wire [4:0] ReadRegNum2;
wire [31:0] RegReadData2;
wire [31:0] Imm, ReadData2;
wire [31:0] Shamt;
wire [2:0] ALU_control;
wire [31:0] ALU_result;
wire Zero;

InstructionFetch IF(.clk(clk),.Reset(Reset), .InstructionCode(Instr));
assign WriteRegNum = Instr[25:21];
assign ReadRegNum1 = Instr[20:16];
assign ReadRegNum2 = Instr[15:11];

RegisterFile Rfile(
	.ReadRegNum1(ReadRegNum1),
	.ReadRegNum2(ReadRegNum2),
	.WriteRegNum(WriteRegNum),
	.WriteData(WriteData),
	.ReadData1(ReadData1),
	.ReadData2(ReadData2),
	.RegWrite(Reg_write),
	.clk(clk),
	.Reset(Reset)
	);
	
assign Imm = {{11{Instr[21]}}, Instr[21:0]};
assign Shamt = {{27{Instr[10]}}, Instr[10:6]};

ALU_control ALU_control_unit(.Funct(Instr[5:0]), .ALU_op(ALU_op), .ALU_control(ALU_control));
assign RegReadData2 = (ALU_src == 1'b0)? ReadData2 : Shamt;
ALU ALU_unit(.A(ReadData1), .B(RegReadData2), .ALU_control(ALU_control), .ALU_result(ALU_result), .Zero(Zero));
assign WriteData = (Writeback_src==1'b0)? ALU_result : Imm;
assign Opcode = Instr[31:26];
assign Funct = Instr[5:0];

endmodule

