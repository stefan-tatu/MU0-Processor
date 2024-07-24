// MU0 12 bit register design - behavioural style
// S Tatu (based on a design by Jeff Pepper)
// Date 12/12/2020
// 

// Do not touch the following line it is required for simulation 
`timescale 1ns/100ps

// for simulation purposes, do not delete
`default_nettype none

// module header

module mu0_reg12(input  wire        Clk, 
	             input  wire        Reset,     
			     input  wire        En, 
			     input  wire [11:0] D, 
			     output reg  [11:0] Q);

// behavioural code - clock driven

always @(posedge Clk)
    if (Reset)
        Q <= 12'h000;
    else if (En)
        Q <= D;

endmodule 

// for simulation purposes, do not delete
`default_nettype wire
