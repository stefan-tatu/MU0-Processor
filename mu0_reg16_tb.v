// MU0 16 bit register testbench
// S Tatu (based on a design by Jeff Pepper)
// Date 12/12/2020
// 

// Do not touch the following line it is required for simulation 
`timescale 1ns/100ps 

// module header

module mu0_reg16_tb();

// Internal connections

reg Clk;
reg Reset;
reg En;
reg [15:0] D;
wire [15:0] Q;


mu0_reg16 dut (Clk, Reset, En, D, Q);
// Instantiate mu0_reg16 as dut (device under test)
// Uses explicit dot pins - safer than position substitution




// Set up the clock

initial Clk= 0;
always // always do the following
    begin
    #50 // wait half a clock period
    Clk = ~Clk; // invert the clock
    end

// Test vectors
initial
 begin
En = 1'b0; Reset = 1'b0; D=16'h0000;
#100 En = 1'b1;
#100 D = 16'h1111;
#100 D = 16'h1001; En = 1'b0;
#100 D = 16'h1100;
#100 En = 1'b1;
#100 D = 16'h1000;
#100 D = 16'h0001; Reset = 1'b1;
#100 D = 16'h1010; Reset = 1'b0;
  
   
  #100 $finish;      // exit the simulation
 end
 
// Save results as VCD file 
// Do not change
initial
 begin
  $dumpfile("mu0_reg16_tb_results.vcd");  // Save simulation waveforms in this file
  $dumpvars; // Capture all simulation waveforms
 end

endmodule 
