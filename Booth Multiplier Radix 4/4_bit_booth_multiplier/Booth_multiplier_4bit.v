`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.07.2025 15:07:19
// Design Name: 
// Module Name: Booth_multiplier_4bit
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


module Booth_multiplier_4bit(
input signed [3:0] M,Q,
output signed [7:0] product
    );
   
wire signed [3:0] A_out1,A_out2;
wire signed [4:0] Q_out1,Q_out2;
booth_multiplier_radix_4 B1 (.M(M),.Q_in(Q),.Q_minus_1(1'b0),.A_in(4'b0),.Q_out(Q_out1),.A_out(A_out1));
booth_multiplier_radix_4 B2 (.M(M),.Q_in(Q_out1[4:1]),.Q_minus_1(Q_out1[0]),.A_in(A_out1),.Q_out(Q_out2),.A_out(A_out2));

assign product = {A_out2,Q_out2[4:1]};
endmodule
