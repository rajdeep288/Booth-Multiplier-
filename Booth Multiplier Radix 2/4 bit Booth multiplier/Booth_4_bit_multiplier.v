`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.06.2024 12:15:30
// Design Name: 
// Module Name: Booth_4_bit_multiplier
// Project Name: 
// Target Devices: 


module Booth_4_bit_multiplier(
input signed [3:0]M,
input signed [3:0]Q,
output  reg signed [7:0]result);

wire [3:0]A_out1,A_out2,A_out3,A_out4;
wire [4:0]Q_out1,Q_out2,Q_out3,Q_out4;

Booth_multiplier B1(4'b0000,M,{Q,1'b0},A_out1,Q_out1);
Booth_multiplier B2(A_out1,M,Q_out1,A_out2,Q_out2);
Booth_multiplier B3(A_out2,M,Q_out2,A_out3,Q_out3);
Booth_multiplier B4(A_out3,M,Q_out3,A_out4,Q_out4);

always@(*) begin 
  result={A_out4,Q_out4[4:1]};
end
endmodule






























