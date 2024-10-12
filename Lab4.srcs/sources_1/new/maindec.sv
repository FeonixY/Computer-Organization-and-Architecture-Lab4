module maindec
(
input logic [5:0] op,
output logic regwrite, regdst,
output logic alusrc, branch,
output logic memwrite, memtoreg,
output logic jump,
output logic [1:0] aluop,
output logic sorz
);
logic [9:0] controls;

assign {regwrite, regdst, alusrc, branch, memwrite, memtoreg, jump, aluop, sorz} = controls;

always_comb
    case(op)
        6'b000000: controls = 10'b1100000100;  //RTYPE
        6'b100011: controls = 10'b1010010000;  //LW
        6'b101011: controls = 10'b0010100000;  //SW
        6'b000100: controls = 10'b0001000010;  //BEQ
        6'b001000: controls = 10'b1010000000;  //ADDI
        6'b000010: controls = 10'b0000001000;  //J
        6'b001100: controls = 10'b1010000111;  //ANDI
        default:   controls = 10'bxxxxxxxxxx;
    endcase

endmodule