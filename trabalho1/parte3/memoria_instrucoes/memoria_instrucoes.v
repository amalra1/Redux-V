module memoria_instrucoes(
    input wire[7:0] endereco,
    output reg[7:0] instrucao
);

    // Cria a memória (Matriz)
    reg[7:0][0:255] memoria;

    // Populando a memoria com exemplos em enderecos especificos
    initial 
    begin
        memoria[0] = 8'b01010101;
        memoria[4] = 8'b11111111;
    end

    always @*
    begin
        instrucao = memoria[endereco];
    end

endmodule
