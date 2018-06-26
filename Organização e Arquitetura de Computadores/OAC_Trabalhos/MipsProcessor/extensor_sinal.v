`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:33:49 01/13/2018 
// Design Name: 
// Module Name:    extensor_sinal 
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
module extensor_sinal(
			sinal_16, 
			sinal_32);
	
	input wire[15:0] sinal_16;
	output wire[31:0] sinal_32;
	
	assign sinal_32 = {{16{sinal_16[15]}},sinal_16};

endmodule
