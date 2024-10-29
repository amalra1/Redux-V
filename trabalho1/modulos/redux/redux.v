module redux #(
    parameter ALG = 1
)(
    input wire clk, reset,
    output wire[7:0] out
);
    wire[7:0] cur_pc, n_pc, imm_extended, a, b, instruction, write_data, ula_out, data_out, b_ula, imm_unsigned;
    wire[3:0] sel_ula, imm, opcode;
    wire[1:0] r_a, r_b;
    wire b_mx, j_mx, r_mx, se_mx, d_mx, we, re, u_imm, zero_flag;

    assign opcode = instruction[7:4];
    assign imm = instruction[3:0];
    assign r_a = r_mx ? 2'b00 : instruction[3:2];
    assign r_b = instruction[1:0];
    assign imm_extended = { {4{imm[3]}} , imm};
    assign imm_unsigned = imm;
    assign write_data = d_mx ? ula_out : data_out;
    assign b_ula = se_mx ? (u_imm ? imm_unsigned : imm_extended) : b;
    assign zero_flag = (a == 8'b00000000) ? 1 : 0;

    assign out = ula_out;

    next_pc NPC(
        .jmx(j_mx), .bmx(b_mx), .zero_flag(zero_flag),
        .cur_pc(cur_pc), .imm(imm_extended), .b(b),
        .n_pc(n_pc)
    );

    program_counter PC(
        .n_pc(n_pc), 
        .clk(clk),
        .reset(reset),
        .cur_pc(cur_pc)
    );

    instruction_memory #(.ALG(ALG)) MEI(
        .address(cur_pc), 
        .instruction(instruction)
    );

    control_memory MEC(
        .opcode(opcode), 
        .sel_ula(sel_ula), 
        .b_mx(b_mx), .j_mx(j_mx), .r_mx(r_mx), .se_mx(se_mx), .d_mx(d_mx), .we(we), .re(re), .u_imm(u_imm)
    );
        
    reg_bank BRE(
        .clk(clk), .reset(reset), .write_enable(re),
        .r_a(r_a), .r_b(r_b), .write_addr(r_a),
        .write_data(write_data),
        .a(a), .b(b)
    );

    ula ULA(
        .a(a), .b(b_ula), 
        .select(sel_ula),
        .s(ula_out)
    );

    data_memory MED(
        .clk(clk), .reset(reset), .write_enable(we), 
        .address(b), .data_in(a), 
        .data_out(data_out)
    );

    
endmodule