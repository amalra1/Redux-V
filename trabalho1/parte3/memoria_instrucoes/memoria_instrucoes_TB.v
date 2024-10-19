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
        #10
        endereco = 8'd0;
        $display("Endereco[%b] = [%b]", endereco, instrucao);
        #10
        endereco = 8'd100;
        $display("Endereco[%b] = [%b]", endereco, instrucao);
        #10
        endereco = 8'd255;
        $display("Endereco[%b] = [%b]", endereco, instrucao);
        #10
    end

endmodule