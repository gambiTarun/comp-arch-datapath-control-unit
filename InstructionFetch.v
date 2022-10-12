`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:46:27 04/06/2020 
// Design Name: 
// Module Name:    InstructionFetch 
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
module InstructionFetch(
		input clk,
		input Reset,
		output [31:0] InstructionCode
		);
reg [31:0] PC;

InstructionMemory abc(
	PC,
	Reset,
	InstructionCode
);


always@(posedge clk, negedge Reset)

begin
if(Reset==0)
PC<=0;

else
PC<=PC+4;

end
endmodule

