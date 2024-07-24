`timescale 1ns / 1ps

//test bench to load a word stored in memmory, perform operation and store it in new memory location

module processor_tb;
reg clk1, clk2;
integer k;

processor mips (clk1, clk2);

processor dut(.clk1(clk1), .clk2(clk2));

initial 
begin 
clk1 = 0;
clk2 = 0;
repeat(50)
 begin
 #5 clk1 = 1; 
 #5 clk1 = 0;
 #5 clk2 = 1; 
 #5 clk2 = 0;
 end 
end 

initial 
begin
for (k=0; k<31; k=k+1)
 mips.Reg[k]= k;
 
mips.Mem[0] = 32'h28010078;         //AADI r1, r0, 120
mips.Mem[1] = 32'h0c631800;         //OR r3, r3, r3        dummy inst.
mips.Mem[2] = 32'h20220000;         //LW r2, 0(r1)         
mips.Mem[3] = 32'h0c631800;         //OR r3, r3, r3         dummy inst.
mips.Mem[4] = 32'h2842002d;         //ADDI r2, r2, 45
mips.Mem[5] = 32'h0c631800;         //OR r3, r3, r3         dummy inst.
mips.Mem[6] = 32'h24220001;         //SW r2, 1(r1)
mips.Mem[7] = 32'hfc000000;         //HLT

mips.Mem[120] = 85;
mips.PC = 0;
mips.HALTED = 0;
mips.TAKEN_BRANCH = 0;

#500
$display ("Mem[120]: %4d \nMem[121]: %4d", mips.Mem[120], mips.Mem[121]);
end 

initial 
begin
$dumpfile ("mips.vcd");
$dumpvars (0, processor_tb);
#600 
$finish;
end 
  
endmodule
