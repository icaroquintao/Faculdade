`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:25:37 01/13/2018 
// Design Name: 
// Module Name:    mux_PCSrc 
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
module mux_PCSrc(
		add_result, 
		pc4, 
		controle, 
		saida_proximo_mux);

	input wire[31:0] add_result;
	input wire[31:0] pc4;
	input wire controle;

	output reg[31:0] saida_proximo_mux;

	always @ (add_result or pc4 or controle)
		begin
			if (controle == 1'b0)
				begin
					saida_proximo_mux <= pc4;
			end
		
			if (controle == 1'b1)
				begin
					saida_proximo_mux <= add_result;
			end
		end

endmodule
