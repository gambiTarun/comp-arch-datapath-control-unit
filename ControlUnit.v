`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:59:11 04/06/2020 
// Design Name: 
// Module Name:    ControlUnit 
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
module ControlUnit(
    input [5:0] Opcode,
	 input [5:0] Funct,
    output reg ALU_op,
	 output reg ALU_src,
    output reg Reg_write,
    output reg Writeback_src
    );
wire Funct_MSB;
assign Funct_MSB = Funct[5];

always@(*)
begin 
	case(Opcode)
		6'b000000:
		begin
			ALU_op = 1'b0;
			Reg_write = 1'b1;
			if(Funct_MSB == 1'b1)
			begin
			ALU_src = 1'b0;
			end
			else
			begin
			ALU_src = 1'b1;
			end
			Writeback_src = 1'b0;
		end
		6'b111111:
		begin
			ALU_op = 1'b1;
			Reg_write = 1'b1;
			ALU_src= 1'b0;
			Writeback_src = 1'b1;
		end
		default: begin
			ALU_op = 1'b1;
			Reg_write = 1'b0;
			ALU_src= 1'b0;
			Writeback_src = 1'b0;
		end
	endcase

end
endmodule

