// MU0 16 bit, 2 to 1 MUX design - behavioural style
// S Tatu (based on a design by Jeff Pepper)
// Date 13/12/2020
// 

// Do not touch the following line it is required for simulation 
`timescale 1ns/100ps

// for simulation purposes, do not delete
`default_nettype none

// module definition

module mu0_mux16(input  wire  [15:0] A, 
	             input  wire  [15:0] B, 
			     input  wire         S, 
			     output reg  [15:0]  Q);


// Combinatorial logic for 2to1 multiplexor
// S is select, A channel0, B channel1


always @(A, B, S)
   begin
    if (S == 0)
        Q <= A;
    else if (S == 1)
        Q <= B;
   end
    

endmodule 

// for simulation purposes, do not delete
`default_nettype wire
