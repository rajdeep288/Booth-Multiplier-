`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.07.2025 15:15:12
// Design Name: 
// Module Name: booth_radix4_tb
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


module booth_radix4_tb();
reg signed [3:0] M,Q;
wire signed [7:0] product;

Booth_multiplier_4bit uut (M,Q,product);

initial begin 
M=4'b0;
Q=4'b0;
#20
M=4'b0101;
Q=4'b0010;
#20
M=4'b0101;
Q=4'b0111;
#20 
M=-3;
Q=-2;
#20 
M=-4;
Q=-2;
#20 
M=-3;
Q= 2;

#1000 $finish();
end
endmodule
