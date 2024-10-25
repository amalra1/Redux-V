module ula 
(
    input wire[7:0] A,
    input wire[7:0] B,
    input wire[3:0] Seletor,
    output wire[7:0] S
);

    assign S = (Seletor == 4'b0000) ? ~A : 
    (Seletor == 4'b0001) ? (A & B) :  // AND
    (Seletor == 4'b0010) ? (A | B) :  // OR
    (Seletor == 4'b0011) ? (A ^ B) :  // XOR
    (Seletor == 4'b0100) ? (A + B) :  // ADD
    (Seletor == 4'b0101) ? (A - B) :  // SUB
    (Seletor == 4'b0110) ? (A << B) :  // SLR
    (Seletor == 4'b0111) ? (A >> B) :  // SRR
    (Seletor == 4'b1000) ? (A * B) :  // MUL
    (Seletor == 4'b1001) ? ((A << (B % 8'd8)) | (A >> (8'd8 - (B % 8'd8)))) :  // ROL
    8'b0;

endmodule