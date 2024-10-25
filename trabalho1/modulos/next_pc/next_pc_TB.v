`timescale 1ns/1ps
module next_pc_TB();
    reg jmx, bmx, zero_flag;
    reg[7:0] cur_pc, b;
    reg signed[7:0] imm;
    wire[7:0] n_pc;

    next_pc DUT(.jmx(jmx), .bmx(bmx), .cur_pc(cur_pc), .imm(imm), .b(b), .n_pc(n_pc));

    initial begin
        $dumpfile("next_pc.vcd");
        $dumpvars(5, next_pc_TB);
    end


    initial begin
        cur_pc = 120;
        imm = 6;
        b = 55;
        bmx = 0;
        jmx = 0;

        #10

        $display("cur_pc = %d", cur_pc);
        $display("imm   = %d", imm);
        $display("b    = %d", b);

        $display("\nTeste para bmx = 0, jmx = 0");
        $display("Resultado     : pc = %d", n_pc);


        cur_pc = n_pc;
        bmx = 0;
        jmx = 1;

        #10 

        $display("\nTeste para bmx = 0, jmx = 1");
        $display("Resultado     : pc = %d", n_pc);

        cur_pc = n_pc;

        #10

        $display("\nTeste para bmx = 0, jmx = 1");
        $display("Resultado     : pc = %d", n_pc);

        cur_pc = n_pc;
        bmx = 1;

        #10 

        $display("\nTeste para bmx = 1");
        $display("Resultado     : pc = %d", n_pc);

        $display("\nSetando cur_pc = 0; imm = -4");

        cur_pc = 0;
        imm = -4;
        bmx = 0;
        jmx = 1;
        
        #10

        $display("\nTeste para bmx = 0, jmx = 1");
        $display("Resultado     : pc = %d", n_pc);

    end
endmodule