`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:55:11 04/06/2020 
// Design Name: 
// Module Name:    RegisterFile 
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
module RegisterFile(
    input [4:0] ReadRegNum1,
    input [4:0] ReadRegNum2,
    input [4:0] WriteRegNum,
    input [31:0] WriteData,
    output [31:0] ReadData1,
    output [31:0] ReadData2,
    input RegWrite,
    input clk,
    input Reset
    );
reg [31:0] reg_mem [31:0];

assign ReadData1 = reg_mem[ReadRegNum1];
assign ReadData2 = reg_mem[ReadRegNum2];

always@(posedge clk, negedge Reset)
begin

	//If Reset bit is zero preload the register with default values
	if(Reset == 0)begin
		reg_mem[0]= 0;
		reg_mem[1]= 20;
		reg_mem[2]= 40;
		reg_mem[3]= 10;
		reg_mem[4]= 10;
		reg_mem[5]= 15;
		reg_mem[6]= 50;
		reg_mem[7]= 5;
		reg_mem[8]= 20;
		reg_mem[9]= 30;
		reg_mem[10]= 0;
		reg_mem[11]= 30;
		reg_mem[12]= 10;
		reg_mem[13]= 15;
	end

	else if(RegWrite == 1)begin
		reg_mem[WriteRegNum] = WriteData;
	end


end
endmodule

