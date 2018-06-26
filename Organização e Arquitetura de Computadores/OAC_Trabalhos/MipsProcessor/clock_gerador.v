`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:06:25 01/13/2018 
// Design Name: 
// Module Name:    clock_gerador 
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
module clock_gerador(
					saida);

	output reg saida;
	//
	initial 
		begin
			saida = 1'b0;
		end
		
		always
			begin 
				saida = #1 ~saida;
			end
endmodule
