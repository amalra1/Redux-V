module ula 
(
    input wire[7:0] a, b,
    input wire[3:0] select,
    output wire[7:0] s
);

    assign s = (select == 4'b0000) ? ~a : 
    (select == 4'b0001) ? (a & b) :  // aND
    (select == 4'b0010) ? (a | b) :  // OR
    (select == 4'b0011) ? (a ^ b) :  // XOR
    (select == 4'b0100) ? (a + b) :  // ADD
    (select == 4'b0101) ? (a - b) :  // SUB
    (select == 4'b0110) ? (a << b) :  // SLR
    (select == 4'b0111) ? (a >> b) :  // SRR
    (select == 4'b1000) ? (a * b) :  // MUL
    (select == 4'b1001) ? ((a << (b % 8'd8)) | (a >> (8'd8 - (b % 8'd8)))) :  // ROL
    8'b0;

endmodule