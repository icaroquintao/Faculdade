`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:40:10 01/13/2018 
// Design Name: 
// Module Name:    ALUControl 
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

/*


dddddddddddddddddddddddddddddddddd
*/

module ALUControl(ALUOp, 
						funct, 
						saida_p_ALU);

	input wire[1:0] ALUOp;
	input wire[5:0] funct;
	output reg[3:0] saida_p_ALU;
	
	always @(ALUOp or funct)
		begin
			case(ALUOp)
				//  SLIDE 43
				2'b00 : saida_p_ALU <= 4'b0010;
				
				2'b01 : saida_p_ALU <= 4'b0110;
				
				2'b10 : 
						case (funct)
							//add
							6'b100000: saida_p_ALU <= 4'b0010;
							//sub
							6'b100010: saida_p_ALU <= 4'b0110;
							//and
							6'b100100: saida_p_ALU <= 4'b0000;
							// or
							6'b100101: saida_p_ALU <= 4'b0001;
							//slt
							6'b101010: saida_p_ALU <= 4'b0111;
							
							default: saida_p_ALU = 4'b0111;
						endcase
			endcase
		end
endmodule
