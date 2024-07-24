// MU0 12 bit register testbench
// S Tatu (based on a design by Jeff Pepper)
// Date 13/12/2020
// 

// Do not touch the following line it is required for simulation 
`timescale 1ns/100ps 

// module header

module mu0_reg12_tb();

// Internal connections
reg Clk;
reg Reset;
reg En;
reg [11:0] D;
wire [11:0] Q;

mu0_reg12 dut (Clk, Reset, En, D, Q);
// Instantiate mu0_reg12 as dut (device under test)
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
En = 1'b0; Reset = 1'b0; D=12'h101;
#100 En = 1'b1;
#100 D = 12'h111;
#100 D = 12'h000; En = 1'b0;
#100 D = 12'h100;
#100 En = 1'b1;
#100 D = 12'h110;
#100 D = 12'h011; Reset = 1'b1;
#100 D = 12'h001; Reset = 1'b0;

  #100 $finish;      // end the simulation
end
 
// Save results as VCD file 
// Do not change
initial
 begin
  $dumpfile("mu0_reg12_tb_results.vcd");  // Save simulation waveforms in this file
  $dumpvars; // Capture all simulation waveforms
 end

endmodule 
