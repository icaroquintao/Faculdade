`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:00:50 01/22/2018 
// Design Name: 
// Module Name:    soma_jump 
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
module soma_jump(
		sinal28,
		saida32
    );
		input wire [27:0] sinal28;
		output wire [31:0] saida32;
		

		assign  saida32 = (sinal28>> 2);
endmodule
