module contador_de_programa_TB ();
    reg [7:0] entrada;
    reg clk;
    wire [7:0] saida;
    
    contador_de_programa DUT(.entrada(entrada), .clk(clk), .saida(saida));

    initial begin
        $dumpfile("contador_de_programa.vcd");
        $dumpvars(5, contador_de_programa_TB);
    end

    initial begin
        #10
        clk = ~clk;
        #10
        clk = ~clk;
        #10
        clk = ~clk;
        #10
        clk = ~clk;
        #10
        clk = ~clk;
        #10
        clk = ~clk;
        #10
        clk = ~clk;
        #10
        clk = ~clk;
        #10
        clk = ~clk;
        #10
        clk = ~clk;
        #10
        clk = ~clk;
        #10
        clk = ~clk;
        #10
        clk = ~clk;
    end

    initial begin
        clk = 0;
        entrada = 8'd10;
        #15
        entrada = 8'd11;
        #15
        entrada = 8'd19;
        #15
        entrada = 8'd12;
        #15
        entrada = 8'd13;
        #15
        entrada = 8'd19;
        #15
        entrada = 8'd11;
        #15
        entrada = 8'd13;
        #15
        entrada = 8'd14;
        #15
        entrada = 8'd18;
        #15
        entrada = 8'd10;
    end

endmodule