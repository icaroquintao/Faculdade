`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:40:35 01/13/2018 
// Design Name: 
// Module Name:    Shif_Left_2 
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
module Shif_Left_2(
		signal,
		out
	 );

	input wire[25:0] signal;
	output reg[27:0] out;
	
	always @ (signal)
	begin
		out = signal << 2;
	end
endmodule
