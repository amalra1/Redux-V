module memoria_dados(
    input wire writeEnable,
    input wire[7:0] endereco,
    input wire[7:0] dadoEntrada,
    input wire clk,
    output reg[7:0] dadoSaida
);

    // Cria a memória (Matriz)
    reg[7:0] memoria[0:255];

    always @(posedge clk)
    begin
        if (writeEnable == 1) 
        begin
            memoria[endereco] = dadoEntrada;
        end

        dadoSaida = memoria[endereco];
    end
endmodule
