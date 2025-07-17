`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.06.2024 12:13:10
// Design Name: 
// Module Name: Booth_multiplier
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


module Booth_multiplier(
input [3:0]A_in,
input [3:0]M,
input [4:0]Q_in,
output [3:0]A_out,
output [4:0]Q_out);

reg [3:0]A_temp;
reg [4:0]Q_temp;
  wire [3:0] A_sum = A_in + M;
  wire [3:0] A_sub = A_in + (~M+1);
  
    always@(A_in or M or Q_in or A_out or Q_out) begin 
    case(Q_in[1:0])
      2'b00,2'b11: begin 
       			   A_temp={A_in[3],A_in[3:1]};
       			   Q_temp={A_in[0],Q_in[4:1]}; 
                    end
      2'b01: begin
        A_temp={A_sum[3],A_sum[3:1]};
        Q_temp={A_sum[0],Q_in[4:1]};
             end
      2'b10: begin
        A_temp={A_sub[3],A_sub[3:1]};
        Q_temp={A_sub[0],Q_in[4:1]};        
      end
    endcase
  end
  assign A_out = A_temp;
  assign Q_out = Q_temp;
endmodule
