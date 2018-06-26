`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:28:30 01/15/2018 
// Design Name: 
// Module Name:    Shift_Left_2_32 
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
module Shift_Left_2_32(
   	signal,
		out
		);

	input wire[31:0] signal;
	output reg[31:0] out;
	
	always @ (signal)
	begin
		out = (signal-1);
	end
endmodule
