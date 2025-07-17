`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.06.2024 12:17:19
// Design Name: 
// Module Name: Booth_4_bit_multiplier_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module testbench_booth();
  reg signed [3:0]M;
  reg signed [3:0]Q;

  wire signed [7:0]result;
  
  Booth_4_bit_multiplier inst(M,Q,result);

    
    initial begin
      M=-7; 
      Q=3; 
      #10
      M=4; 
      Q=2;  
      #10
       M=-5; 
      Q=-2;  
      #10
       M=-4; //
      Q=-2; // 
      #40
       $finish();
    end
endmodule