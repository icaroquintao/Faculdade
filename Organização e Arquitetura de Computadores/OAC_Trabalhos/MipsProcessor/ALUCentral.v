`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:12:21 01/13/2018 
// Design Name: 
// Module Name:    ALUCentral 
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
module ALUCentral(dado_1, dado_2, ALUControl, zero,zero_bne, ALUResult);

	input wire[31:0] dado_1;
	input wire[31:0] dado_2;
	input wire[3:0] ALUControl;
	
	output wire zero;
	output wire zero_bne;
	output reg [31:0] ALUResult;
	
	always @ (ALUControl or dado_1 or dado_2)
	begin
		
		case (ALUControl)
			
			4'b0000 : ALUResult <= (dado_1 & dado_2); 
					
			4'b0001 : ALUResult <= (dado_1 | dado_2);
						
			4'b0010 : ALUResult <= (dado_1 + dado_2);
					
			4'b0110 : ALUResult <= (dado_1 - dado_2);
					
			4'b0111 : ALUResult <= (dado_1 < dado_2) ? 1:0;
					
			default : ALUResult <= 0;
		
		endcase
		
	end
	
	assign zero=(dado_1==dado_2)?1:0;
	assign zero_bne = (dado_1!=dado_2) ? 1:0;
	
endmodule
