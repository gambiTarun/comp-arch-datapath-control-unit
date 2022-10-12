`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:49:04 04/06/2020 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
    input [31:0] A,
    input [31:0] B,
    input [2:0] ALU_control,
    output reg [31:0] ALU_result,
    output reg Zero
    );

always@(*)
begin
		case(ALU_control)
		4'b000:
			ALU_result = A+B;
		4'b001:
			ALU_result = A-B;
		4'b010:
			ALU_result = A&B;
		4'b011:
			ALU_result = A|B;
		4'b100:
			ALU_result = A<<B;
		4'b101:
			ALU_result = A>>B;
		endcase
			
if(ALU_result==0)
begin
	Zero = 1'b1;
end
else
begin
	Zero = 1'b0;
end

end
endmodule
