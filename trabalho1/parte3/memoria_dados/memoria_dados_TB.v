module memoria_dados_TB ();
    reg writeEnable;
    wire[7:0] endereco;
    wire[7:0] dadoEntrada;
    reg clk;
    wire[7:0] dadoSaida;
    
    memoria_dados DUT (.writeEnable(writeEnable), .endereco(endereco), .dadoEntrada(dadoEntrada), .clk(clk), dadoSaida(dadoSaida));

    initial 
    begin
        $dumpfile("memoria_dados.vcd");
        $dumpvars(5, memoria_dados_TB);
    end

    always 
    begin
        #5 clk = ~clk;
    end

    initial 
    begin
        clk = 0;
        writeEnable = 0;
        dadoSaida = 8'b0;
        dadoEntrada = 8'b0;
        endereco = 8'b0;
        #10;

        // Escrevendo um dado(1) em um endereco(1)
        writeEnable = 1;
        dadoEntrada = 8'b11110000;
        endereco = 8'b00001111;

        #10;
        $display("Escrevendo [%b] no Endereco [%d]", dadoEntrada, endereco);
        $display("Dado Saida = [%b]", dadoSaida);

        // Escrevendo um dado(2) em um endereco(2)
        dadoEntrada = 8'b00001111;
        endereco = 8'b11110000;

        #10;
        $display("Escrevendo [%b] no Endereco [%d]", dadoEntrada, endereco);
        $display("Dado Saida = [%b]", dadoSaida);

        // Verificando se o dado(1) ainda está no endereco(1)
        writeEnable = 0;
        endereco = 8'b00001111;

        #10;
        $display("Dado [%b] no Endereco [%b]", dadoSaida, endereco);

        // Verificando se o dado(2) ainda está no endereco(2)
        endereco = 8'b11110000;

        #10;
        $display("Dado [%b] no Endereco [%b]", dadoSaida, endereco);

        #10;

	$finish;
    end
endmodule
