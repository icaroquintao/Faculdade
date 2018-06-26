`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:08:38 01/13/2018 
// Design Name: 
// Module Name:    mux_ALUSrc 
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
module mux_ALUSrc(
			read_data2, 
			extensor_sinal, 
			controle, 
			saida_para_ALU);

	input wire[31:0] read_data2;
	input wire[31:0] extensor_sinal;
	input wire controle;

	output reg[31:0] saida_para_ALU;

	always @ (read_data2 or extensor_sinal or controle)
		begin
			if (controle == 1'b1)
				begin
					saida_para_ALU <= extensor_sinal;
				end
				
				if (controle == 1'b0)
					begin
						saida_para_ALU <= read_data2;
					end
		end
endmodule
