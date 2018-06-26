`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:52:35 01/20/2018 
// Design Name: 
// Module Name:    mux_Mem_To_Reg 
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
module mux_Mem_To_Reg(
    
		read_data, 
		ALUResult, 
		controle, 
		escrita_dado);

	input wire[31:0] read_data;
	input wire[31:0] ALUResult;
	input controle;
	output reg [31:0] escrita_dado;

	always @ (controle or ALUResult or read_data)
		begin
			if (controle == 1) begin
				escrita_dado <= read_data;
			end
		
			if (controle == 0) begin
				escrita_dado <= ALUResult;
			end
		end // end always
	 
	

endmodule
