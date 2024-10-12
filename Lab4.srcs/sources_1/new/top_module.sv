
module top_module
(
input logic clk, reset,
output logic [31:0] writedata, dataadr,
output logic memwrite
);
logic [31:0] pc, instr, readdata;

MIPS mips(clk, reset, instr, readdata, pc, memwrite, dataadr,writedata);
instruction_memory imem(pc[7:2], instr);
data_memory dmem(clk, memwrite, dataadr, writedata, readdata);

endmodule
