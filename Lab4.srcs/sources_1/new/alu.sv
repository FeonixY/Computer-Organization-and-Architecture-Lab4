module alu
(
input logic [31:0] a,
input logic [31:0] b,
input logic [2:0] alucontrol,
output logic [31:0] result
);
logic [31:0] b2, sum, slt;

assign b2 = alucontrol[2] ? ~b : b;
assign sum = a + b2 + alucontrol[2];
assign slt = sum[31];

always_comb
    case (alucontrol[1:0])
        2'b00: result = a & b;
        2'b01: result = a | b;
        2'b10: result = sum;
        2'b11: result = slt;
    endcase

endmodule