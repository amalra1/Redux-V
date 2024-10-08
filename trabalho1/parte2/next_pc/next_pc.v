module next_pc (
    input wire jmx, bmx,
    input wire[7:0] curPC, imm, Rb,
    output wire[7:0] pc
);
    assign pc = (bmx == 1)? Rb :
                (jmx == 1)? curPC + imm:
                curPC + 8'd1;
endmodule
