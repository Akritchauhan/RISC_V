`timescale 1ns / 1ps

// 1st
module testbench();
reg clk1,clk2;
integer k;

RISC uut(clk1,clk2);
initial 
begin
clk1=0;clk2=0;
repeat(20)
begin
#5 clk1=1; #5 clk2=0;
#5 clk2=1; #5 clk1=0;
end
end


initial
begin
for (k=0 ; k<31; k=k+1)
RISC.REG[k]=k;

RISC.MEM[0]=32'h280100a;   //ADDI R1,R0,10;
RISC.MEM[1]=32'h28020014;  //ADDI R2,R0,20;
RISC.MEM[2]=32'h28030019;  //ADDI R3,R0,25;
RISC.MEM[3]=32'h0ce77800;  //Dummy
RISC.MEM[4]=32'h0ce77800;  //Dummy
RISC.MEM[5]=32'h00222000;  //ADD R4,R1,R2
RISC.MEM[6]=32'h0ce77800;  //Dummy
RISC.MEM[7]=32'h00832800;  //ADD R5,R4,R3
RISC.MEM[8]=32'hfc000000;  //HLT
RISC.HALTED=0;
RISC.PC=0;
RISC.TAKEN_BRANCH=0;
#250
for (k=0;k<6;k=k+1)
$display("R%1d  = %2d",k,RISC.REG[k]);
#300 $finish;
end
endmodule


