`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:20:16 01/13/2018 
// Design Name: 
// Module Name:    ALU_Norte 
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
module ALU_Norte( sinal_shift, pc, saida_mux);

	input wire[31:0] sinal_shift;
	input wire[31:0] pc;

	output reg[31:0] saida_mux;

	// fazer o cast para inter, evitar erros
	always @ (sinal_shift or pc)
		begin
			saida_mux <= sinal_shift + pc;
		end
		
endmodule
