module memoria_instrucoes_TB ();
    reg[7:0] entrada;
    reg clk;
    reg[7:0] endereco;
    wire[7:0] instrucao;
    
    contador_de_programa PC (.entrada(entrada), .clk(clk), .saida(endereco));
    memoria_instrucoes MEM (.endereco(endereco), .instrucao(instrucao));

    initial 
    begin
        $dumpfile("memoria_instrucoes.vcd");
        $dumpvars(5, memoria_instrucoes_TB);
    end

    always 
    begin
        #5 clk = ~clk;
    end

    initial 
    begin
        clk = 0;
        #10;  
        for (entrada = 0; entrada <= 101; entrada = entrada + 1) 
        begin
            #10;
            $display("Endereco[%d] = [%b]", endereco, instrucao);

            // Fim de algoritmo
            if (instrucao === 8'bxxxxxxxx) 
            begin
                $display("-------Algoritmo finalizado");
            end 
        end
    end
endmodule
