module next_pc (
    input wire jmx, bmx, zero_flag,
    input wire[7:0] curPC, imm, b,
    output wire[7:0] pc
);
    assign pc = (bmx & zero_flag) ? b :
                jmx ? curPC + imm:
                curPC + 8'd1;
endmodule
