module memoria_instrucoes_TB ();
    reg[7:0] endereco;
    wire[7:0] instrucao;
    
    memoria_instrucoes DUT(.endereco(endereco), .instrucao(instrucao));

    initial 
    begin
        $dumpfile("memoria_instrucoes.vcd");
        $dumpvars(5, memoria_instrucoes_TB);
    end

    initial 
    begin
        #10;  
        for (endereco = 0; endereco <= 101; endereco = endereco + 1) 
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
