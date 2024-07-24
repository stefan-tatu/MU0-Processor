// MU0 16 bit, 2 to 1 MUX testbench
// S Tatu (based on a design by Jeff Pepper)
// Date 13/12/2020
// 

// Do not touch the following line it is required for simulation 
`timescale 1ns/100ps 

// module header

module mu0_mux16_tb();

// Internal connections

reg [15:0] A;
reg [15:0] B;
reg S;
wire [15:0] Q;


mu0_mux16 dut (A, B, S, Q);
// Instantiate mu0_mux16 as dut (device under test)
// Uses explicit dot pins - safer than position substitution





// Test vectors
initial
 begin
 #100 A=16'h1000; B=16'h0001; S=0;
 #100 A=16'h1000; B=16'h0001; S=1;
 #100 A=16'h1110; B=16'h0011; S=0;
 #100 A=16'h1110; B=16'h0111; S=1;


 #100 $finish;   // end the simulation
end
 
// Save results as VCD file 
// Do not change
initial
 begin
  $dumpfile("mu0_mux16_tb_results.vcd");  // Save simulation waveforms in this file
  $dumpvars; // Capture all simulation waveforms
 end

endmodule 
