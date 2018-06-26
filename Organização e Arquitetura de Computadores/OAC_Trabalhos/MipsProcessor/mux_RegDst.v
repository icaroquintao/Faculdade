`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:46:45 01/13/2018 
// Design Name: 
// Module Name:    mux_RegDst 
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
module mux_RegDst( 
			instrucao20_16, 
			instrucao15_11, 
			controle, 
			escrita_registrador);

	input wire[4:0] instrucao20_16;
	input wire[4:0] instrucao15_11;
	input controle;

	output reg[4:0] escrita_registrador; 

	always @ (instrucao20_16 or instrucao15_11 or controle)
		begin
			if (controle == 1'b1) 
				begin
					escrita_registrador <= instrucao15_11;
			end
			if (controle == 1'b0)
				begin
					escrita_registrador <= instrucao20_16;
			end
		end
endmodule
