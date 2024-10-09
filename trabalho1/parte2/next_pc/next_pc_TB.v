`timescale 1ns/1ps
module next_pc_TB();
    reg jmx, bmx;
    reg[7:0] curPC, Rb;
    reg signed[7:0] imm;
    wire[7:0] pc;

    next_pc DUT(.jmx(jmx), .bmx(bmx), .curPC(curPC), .imm(imm), .Rb(Rb), .pc(pc));

    initial begin
        $dumpfile("next_pc.vcd");
        $dumpvars(5, next_pc_TB);
    end


    initial begin
        curPC = 120;
        imm = 6;
        Rb = 55;
        bmx = 0;
        jmx = 0;

        #10

        $display("curPC = %d", curPC);
        $display("imm   = %d", imm);
        $display("Rb    = %d", Rb);

        $display("\nTeste para bmx = 0, jmx = 0");
        $display("Resultado     : pc = %d", pc);


        curPC = pc;
        bmx = 0;
        jmx = 1;

        #10 

        $display("\nTeste para bmx = 0, jmx = 1");
        $display("Resultado     : pc = %d", pc);

        curPC = pc;

        #10

        $display("\nTeste para bmx = 0, jmx = 1");
        $display("Resultado     : pc = %d", pc);

        curPC = pc;
        bmx = 1;

        #10 

        $display("\nTeste para bmx = 1");
        $display("Resultado     : pc = %d", pc);

        $display("\nSetando curPC = 0; imm = -4");

        curPC = 0;
        imm = -4;
        bmx = 0;
        jmx = 1;
        
        #10

        $display("\nTeste para bmx = 0, jmx = 1");
        $display("Resultado     : pc = %d", pc);

    end
endmodule