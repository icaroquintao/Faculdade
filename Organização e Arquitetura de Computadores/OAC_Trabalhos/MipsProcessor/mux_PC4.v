`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:56:41 01/13/2018 
// Design Name: 
// Module Name:    mux_PC4 
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
module mux_PC4( 
			jump_address, 
			saida_mux_PCSrc, 
			controle, 
			saida_pc);

	input wire[31:0] jump_address;
	input wire[31:0] saida_mux_PCSrc;
	input wire controle;

	output reg[31:0] saida_pc;

	always @ ( jump_address or saida_mux_PCSrc or controle)
		begin
			if (controle == 1'b0) 
				begin
					saida_pc <= saida_mux_PCSrc;
			end
				
				if (controle == 1'b1)begin
					saida_pc <= jump_address; 
			end
		end

endmodule
