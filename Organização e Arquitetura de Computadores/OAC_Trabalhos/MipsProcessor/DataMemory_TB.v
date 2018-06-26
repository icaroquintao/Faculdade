`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:13:39 01/19/2018
// Design Name:   DataMemory
// Module Name:   /home/art/MipsProcessor/DataMemory_TB.v
// Project Name:  MipsProcessor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DataMemory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module DataMemory_TB;

	// Inputs
	reg memWrite;
	reg [31:0] Address;
	reg [31:0] write_data;
	reg memRead;

	// Outputs
	wire [31:0] read_data;

	// Instantiate the Unit Under Test (UUT)
	DataMemory uut (
		.memWrite(memWrite), 
		.Address(Address), 
		.write_data(write_data), 
		.memRead(memRead), 
		.read_data(read_data)
	);

	initial begin
		// Initialize Inputs
		memWrite = 0;
		Address = 0;
		write_data = 0;
		memRead = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		  $monitor("memWrite = ",memWrite, "Address = ",Address ,"write_data = ",write_data , "memRead = ",memRead, "read_data",read_data);
		  
		  
		  #10 memRead = 1;
		  
		// Add stimulus here

	end
      
endmodule

