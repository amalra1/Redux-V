module redux (
    input wire clk
);
    wire[7:0] cur_pc, n_pc, imm_extended, a, b, instrucao, write_data, ula_out, data_out, b_ula;
    wire[3:0] ula_sel, imm, opcode;
    wire[1:0] r_a, r_b;
    wire b_mx, j_mx, r_mx, se_mx, d_mx, we, re;

    assign opcode = instrucao[7:4];
    assign imm = instrucao[3:0];
    assign r_a = r_mx ? 2'b00 : instrucao[3:2];
    assign r_b = instrucao[1:0];
    assign imm_extended = {4{imm[3]}, imm};
    assign write_data = d_mx ? ula_out : data_out;
    assign b_ula = se_mx ? imm_extended : b;

    next_pc NPC(.jmx(j_mx), .bmx(b_mx), .curPC(cur_pc), .imm(imm_extended), .b(b), .pc(n_pc));

    contador_de_programa PC(.entrada(n_pc), .clk(clk), .saida(cur_pc));
    memoria_instrucoes MEI(.endereco(cur_pc), .instrucao(instrucao));
    memoria_controle MEC(.opcode(opcode), .ula(ula_sel), .b_mx(b_mx), .j_mx(j_mx), .r_mx(r_mx), .se_mx(se_mx), .d_mx(d_mx), .we(we), .re(re));
    banco_reg BRE(.clk(clk), .write_enable(re), .r_a(r_a), .r_b(r_b), .write_addr(r_a), .write_data(write_data), .a(a), .(b));
    ula ULA(.A(a), .b(b_ula), .Seletor(ula_sel), .S(ula_out));
    memoria_dados MED(.write_enable(we), .endereco(b), .dadoEntrada(a), .clk(clk), .dadoSaida(data_out));

    
endmodule