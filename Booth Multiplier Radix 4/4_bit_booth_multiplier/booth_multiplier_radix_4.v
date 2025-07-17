`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Rajdeep Vora
// 
// Create Date: 16.07.2025 11:24:29
// Design Name: 
// Module Name: booth_multiplier_radix_4
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
//////////////////////////////////////////////////////////////////////////////////


module booth_multiplier_radix_4(///l/
input [3:0]M,
input [3:0]Q_in,
input Q_minus_1,
input [3:0]A_in,
output reg [4:0] Q_out,
output reg [3:0] A_out
    );
wire [3:0] A_sum=A_in+M;
//wire [3:0] A_sum_i=A_out+M;
wire [3:0] A_sub=A_in+(~M+1'b1);  
  
 always@(*) begin 
 case({Q_in[1:0],Q_minus_1})
 3'b000,3'b111: 
         begin 
         A_out = { {2{A_in[3]}}, A_in[3:2] };
         Q_out = {A_in[1:0],Q_in[3:1]};
         end
 3'b001,3'b010: begin 
         
         A_out = { {2{A_sum[3]}}, A_sum[3:2] };
         Q_out = { A_sum[1:0],     Q_in[3:1] };
         end
// 3'b010: begin 
//         A_out <= { {2{A_sum[3]}}, A_in[3:2] };
//         Q_out<=  { A_in[1:0],     Q_in[3:2] };
//         end 
 3'b011: begin 
         A_out = { A_in[3], A_in[3:1] };
         Q_out =  { A_in[0],     Q_in[3:0] };
         A_out = A_out+ M;
         Q_out = {A_out[0],Q_out[4:1]};
         A_out = {A_out[3],A_out[3:1]};
        
         end
 3'b100: begin 
          A_out = { A_in[3], A_in[3:1] };
         Q_out =  { A_in[0],     Q_in[3:0] };
         A_out = A_out- M;
         Q_out = {A_out[0],Q_out[4:1]};
         A_out = {A_out[3],A_out[3:1]};
         
         end
 3'b101,3'b110:
         begin 
         A_out = { {2{A_sub[3]}}, A_sub[3:2] };
         Q_out = { A_sub[1:0],     Q_in[3:1] };
         end
// 3'b110: begin 
 
//         end
// 3'b111: begin 
 
//         end
 endcase
 
 end
endmodule
