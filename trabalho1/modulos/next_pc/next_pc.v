module next_pc (
    input wire jmx, bmx, zero_flag,
    input wire[7:0] cur_pc, imm, b,
    output wire[7:0] n_pc
);
    assign n_pc = (bmx & zero_flag) ? b :
                jmx ? cur_pc + imm:
                cur_pc + 8'd1;
endmodule
