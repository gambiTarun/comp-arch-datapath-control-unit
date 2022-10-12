`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:51:29 04/06/2020 
// Design Name: 
// Module Name:    ALU_control 
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
module ALU_control(
    input [5:0] Funct,
	 input ALU_op,
    output reg[2:0] ALU_control
    );
	 
wire [6:0] ALU_control_in;
assign ALU_control_in = {ALU_op,Funct};
always@(ALU_control_in)
casex(ALU_control_in)
7'b0100000: ALU_control = 3'b000;
7'b0100010: ALU_control = 3'b001;
7'b0100100: ALU_control = 3'b010;
7'b0100101: ALU_control = 3'b011;
7'b0000000: ALU_control = 3'b100;
7'b0000010: ALU_control = 3'b101;
default: ALU_control = 3'b000;

endcase
endmodule

