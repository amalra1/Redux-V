module data_memory_TB ();
    reg clk, write_enable;
    reg[7:0] address, data_in;
    wire[7:0] data_out;
    
    data_memory DUT (.write_enable(write_enable), .address(address), .data_in(data_in), .clk(clk), .data_out(data_out));

    initial 
    begin
        $dumpfile("data_memory.vcd");
        $dumpvars(5, data_memory_TB);
    end

    always 
    begin
        #5 clk = ~clk;
    end

    initial 
    begin
        clk = 0;
        write_enable = 0;
        data_in = 8'b0;
        address = 8'b0;
        #10;

        // Escrevendo um dado(1) em um address(1)
        write_enable = 1;
        data_in = 8'b11110000;
        address = 8'b00001111;

        #10;
	$display("\nEscrevendo dados:");
        $display("Dado [%b] escrito no Endereco [%d]", data_in, address);
        $display("Dado Saida quando fazemos isso é = [%b]", data_out);

        // Escrevendo um dado(2) em um address(2)
        data_in = 8'b00001111;
        address = 8'b11110000;

        #10;
        $display("Dado [%b] escrito no Endereco [%d]", data_in, address);
        $display("Dado Saida quando fazemos isso é = [%b]", data_out);

        // Verificando se o dado(1) ainda está no address(1)
        write_enable = 0;
        address = 8'b00001111;

        #10;
	$display("\nVerificando se os dados escritos ainda estão nos enderecos:");
	$display("Memoria[%d] = [%b]", address, data_out);

        // Verificando se o dado(2) ainda está no address(2)
        address = 8'b11110000;

        #10;
	$display("Memoria[%d] = [%b]", address, data_out);

	// Sobrescrevendo um dado de um address que ja tem algo
	write_enable = 1;
	address = 8'b00001111;
	data_in = 8'b10101010;

	#10;
	$display("\nSobrescrevendo um dado de um endereço que já tem algo:");
	$display("Dado [%b] escrito no Endereco [%d]", data_in, address);
	$display("Memoria[%d] = [%b]", address, data_out);

        #10;

	$finish;
    end
endmodule
