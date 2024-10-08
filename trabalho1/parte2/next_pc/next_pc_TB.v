`timescale 1ns/1ps
module next_pc_TB();
    reg jmx, bmx;
    reg[7:0] curPC, imm, Rb;
    wire[7:0] pc;



    initial begin
        $dumpfile("next_pc.vcd");
        $dumpvars(5, next_pc_TB);
        #100 $finish();
    end


    initial begin
        curPC = 0;
        $display("teste 1 %b", curPC + 8'd1);

        // if ((Q == 0) && (nQ == 1)) $display("Teste 1 - OK");
        // else $display ("Teste 1 - Falha com J: %b e K: %b - Olhe o GTKWave para detalhes", J, K);

        // J = 1; K = 0;

        // if ((Q == 0) && (nQ == 1)) $display("Teste 1.5 - OK");
        // else $display ("Teste 1.5 - Falha - saída atualizada antes do clock - Olhe o GTKWave para detalhes");

        // #1
        // Clk = ~Clk; #1 Clk = ~Clk;
        // #1

        // if ((Q == 1) && (nQ == 0)) $display("Teste 2 - OK");
        // else $display ("Teste 2 - Falha com J: %b e K: %b - Olhe o GTKWave para detalhes", J, K);

        // J = 1; K = 1;

        // if ((Q == 1) && (nQ == 0)) $display("Teste 2.5 - OK");
        // else $display ("Teste 2.5 - Falha - saída atualizada antes do clock - Olhe o GTKWave para detalhes");
        
        // #1
        // Clk = ~Clk; #1 Clk = ~Clk;
        // #1

        // if ((Q == 0) && (nQ == 1)) $display("Teste 3 - OK");
        // else $display ("Teste 3 - Falha com J: %b e K: %b - Olhe o GTKWave para detalhes", J, K);


        // J = 0; K = 0;
        // #1
        // Clk = ~Clk; #1 Clk = ~Clk;
        // #1

        // if ((Q == 0) && (nQ == 1)) $display("Teste 4 - OK");
        // else $display ("Teste 4 - Falha com J: %b e K: %b - Olhe o GTKWave para detalhes", J, K);
    end
endmodule