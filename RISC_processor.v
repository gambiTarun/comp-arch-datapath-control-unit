`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:25:49 04/06/2020 
// Design Name: 
// Module Name:    RISC_processor 
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
module RISC_processor(
    input clk,
    input Reset
    );
	 wire Reg_write,ALU_op,ALU_src,Writeback_src;
	 wire [5:0] Opcode;
	 wire [5:0] Funct;
	 
	 Datapath DU
	 (
		.clk(clk),
		.Reg_write(Reg_write),
		.ALU_op(ALU_op),
		.ALU_src(ALU_src),
		.Writeback_src(Writeback_src),
		.Reset(Reset),
		.Opcode(Opcode),
		.Funct(Funct)
		);
		
	 ControlUnit CU
	 (
		.Opcode(Opcode),
		.Funct(Funct),
		.ALU_op(ALU_op),
		.ALU_src(ALU_src),
		.Reg_write(Reg_write),
		.Writeback_src(Writeback_src)
	 );
	 
endmodule
