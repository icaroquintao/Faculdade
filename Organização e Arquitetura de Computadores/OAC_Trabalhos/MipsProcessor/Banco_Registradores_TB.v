`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:54:28 01/19/2018
// Design Name:   Banco_Registradores
// Module Name:   /home/art/MipsProcessor/Banco_Registradores_TB.v
// Project Name:  MipsProcessor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Banco_Registradores
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Banco_Registradores_TB;

	// Inputs
	reg regWrite;
	reg [4:0] read_register_1;
	reg [4:0] read_register_2;
	reg [4:0] write_register;
	reg [31:0] write_data;

	// Outputs
	wire [31:0] read_data_1;
	wire [31:0] read_data_2;

	// Instantiate the Unit Under Test (UUT)
	Banco_Registradores uut (
		.regWrite(regWrite), 
		.read_register_1(read_register_1), 
		.read_register_2(read_register_2), 
		.write_register(write_register), 
		.write_data(write_data), 
		.read_data_1(read_data_1), 
		.read_data_2(read_data_2)
	);

	initial begin
		// Initialize Inputs
		regWrite = 1;
		read_register_1 = 0;
		read_register_2 = 1;
		write_register = 2;
		write_data = 7;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		$monitor("regWrite = ",regWrite, "read_register_1 = ",read_register_1, 	"read_register_2 = ",read_register_2, "write_register = ",write_register,"write_data = "	,write_data, "\nread_data_1 = ",read_data_1 ,"read_data_2 = ",read_data_2);

	end
      
endmodule

