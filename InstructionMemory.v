`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    05:49:25 04/06/2020 
// Design Name: 
// Module Name:    InstructionMemory 
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
module InstructionMemory(
    input [31:0] PC,
    input Reset,
    output [31:0] InstructionCode
    );
reg [7:0]  Mem[35:0]; //Byte addressable memory with 36 locations
	 
//For Normal Memory Read
assign InstructionCode = {Mem[PC+3], Mem[PC+2], Mem[PC+1], Mem[PC]};
//Reads Instruction Specified by PC
	 
always@(Reset)
begin
if(Reset==0)

		begin
		$readmemh("Test.mem",Mem);
		end

end
endmodule
