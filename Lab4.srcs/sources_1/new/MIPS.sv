module MIPS
(
input  logic clk, reset,
input  logic [31:0] instrF, readdataM,
output logic [31:0] pcF,
output logic memwriteM,
output logic [31:0] aluoutM,
output logic [31:0] writedataM
);
logic [5:0] opD,functD;
logic equalD, pcsrcD, branchD, jumpD;
logic [2:0] alucontrolE;
logic regwriteE, memtoregE, alusrcE, regdstE, flushE;
logic regwriteM, memtoregM;
logic  regwriteW, memtoregW;
logic SorZD;

controller c(clk, reset, 
             opD, functD, equalD, 
             flushE, 
             pcsrcD, branchD, jumpD, 
             alucontrolE,
             regwriteE, memtoregE, alusrcE, regdstE, 
             regwriteM, memtoregM, memwriteM, 
             regwriteW, memtoregW,
             SorZD);
                 
datapath dp(clk, reset, 
            instrF, 
            pcsrcD, branchD, jumpD, 
            alucontrolE, 
            regwriteE, memtoregE, alusrcE, regdstE,
            readdataM, 
            regwriteM, memtoregM, 
            regwriteW, memtoregW, 
            SorZD,
            pcF, 
            opD, functD, equalD, 
            flushE, 
            aluoutM, writedataM);

endmodule