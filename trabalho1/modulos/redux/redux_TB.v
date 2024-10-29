`timescale 1ps/1ps
module redux_TB ();
reg clk1;
reg clk2;
reg clk3;
reg reset;

redux #(.ALG(1)) RED1(.clk(clk1), .reset(reset));
redux #(.ALG(2)) RED2(.clk(clk2), .reset(reset));
redux #(.ALG(3)) RED3(.clk(clk3), .reset(reset));

initial begin 
    $dumpfile("redux.vcd");
    $dumpvars(5, redux_TB);
    $dumpvars(0, RED1.BRE.regs[0]);
    $dumpvars(0, RED1.BRE.regs[1]);
    $dumpvars(0, RED1.BRE.regs[2]);
    $dumpvars(0, RED1.BRE.regs[3]);

    $dumpvars(0, RED2.BRE.regs[0]);
    $dumpvars(0, RED2.BRE.regs[1]);
    $dumpvars(0, RED2.BRE.regs[2]);
    $dumpvars(0, RED2.BRE.regs[3]);

    $dumpvars(0, RED3.BRE.regs[0]);
    $dumpvars(0, RED3.BRE.regs[1]);
    $dumpvars(0, RED3.BRE.regs[2]);
    $dumpvars(0, RED3.BRE.regs[3]);
end

initial begin: clock

    $display("Testando algoritmo 1:");
    reset = 1;
    clk1 = 0;
    #10
    clk1 = 1;
    #10
    clk1 = 0;
    reset = 0;
    #10
    clk1 = 1;
    while (RED1.cur_pc !== 8'bxxxxxxxx) begin
        #10;
        clk1 = ~clk1;
    end
    
    for (reg[7:0] j = 0; j <= 255; j++) begin
        if (RED1.MED.memory[j] !== 8'bxxxxxxxx) 
            $display("M[%d] = %d", j, $signed(RED1.MED.memory[j]));
    end

    $display();

    $display("Testando algoritmo 2:");
    reset = 1;
    clk2 = 0;
    #10
    clk2 = 1;
    #10
    clk2 = 0;
    reset = 0;
    #10
    clk2 = 1;
    while (RED2.cur_pc !== 8'bxxxxxxxx) begin
        #10;
        clk2 = ~clk2;
    end
    
    for (reg[7:0] j = 0; j <= 255; j++) begin
        if (RED2.MED.memory[j] !== 8'bxxxxxxxx) 
            $display("M[%d] = %d", j, $signed(RED2.MED.memory[j]));
    end

    $display();

    $display("Testando algoritmo 3:");
    reset = 1;
    clk3 = 0;
    #10
    clk3 = 1;
    #10
    clk3 = 0;
    reset = 0;
    #10
    clk3 = 1;

    $display("00 addi 7:");
    #10;
    clk3 = 1;
    #10;
    clk3 = 0;
    $display("  Resultado esperado:   R[0]=   7");
    $display("  Resultado encontrado: R[0]=%d", $signed(RED3.BRE.regs[0]));
    $display();

    $display("01 st R[2] R[0]:");
    #10;
    clk3 = 1;
    #10;
    clk3 = 0;
    $display("  Resultado esperado:   M[7]=   0");
    $display("  Resultado encontrado: M[7]=%d", $signed(RED3.MED.memory[7]));
    $display();

    $display("02 subi 15:");
    #10;
    clk3 = 1;
    #10;
    clk3 = 0;
    $display("  Resultado esperado:   R[0]=  -8");
    $display("  Resultado encontrado: R[0]=%d", $signed(RED3.BRE.regs[0]));
    $display();

    $display("03 sub R[1] R[0]:");
    #10;
    clk3 = 1;
    #10;
    clk3 = 0;
    $display("  Resultado esperado:   R[1]=   8");
    $display("  Resultado encontrado: R[1]=%d", $signed(RED3.BRE.regs[1]));
    $display();

    $display("04 not R[2] R[0]:");
    #10;
    clk3 = 1;
    #10;
    clk3 = 0;
    $display("  Resultado esperado:   R[2]=   7");
    $display("  Resultado encontrado: R[2]=%d", $signed(RED3.BRE.regs[2]));
    $display();

    $display("05 add R[3] R[1]:");
    #10;
    clk3 = 1;
    #10;
    clk3 = 0;
    $display("  Resultado esperado:   R[3]=   8");
    $display("  Resultado encontrado: R[3]=%d", $signed(RED3.BRE.regs[3]));
    $display();

    $display("06 xor R[3] R[0]:");
    #10;
    clk3 = 1;
    #10;
    clk3 = 0;
    $display("  Resultado esperado:   R[3]= -16");
    $display("  Resultado encontrado: R[3]=%d", $signed(RED3.BRE.regs[3]));
    $display();

    $display("07 mul R[1] R[2]:");
    #10;
    clk3 = 1;
    #10;
    clk3 = 0;
    $display("  Resultado esperado:   R[1]=  56");
    $display("  Resultado encontrado: R[1]=%d", $signed(RED3.BRE.regs[1]));
    $display();

    $display("08 and R[1] R[3]:");
    #10;
    clk3 = 1;
    #10;
    clk3 = 0;
    $display("  Resultado esperado:   R[1]=  48");
    $display("  Resultado encontrado: R[1]=%d", $signed(RED3.BRE.regs[1]));
    $display();

    $display("09 or R[0] R[2]:");
    #10;
    clk3 = 1;
    #10;
    clk3 = 0;
    $display("  Resultado esperado:   R[0]=  -1");
    $display("  Resultado encontrado: R[0]=%d", $signed(RED3.BRE.regs[0]));
    $display();

    $display("10 srr R[0] R[2]:");
    #10;
    clk3 = 1;
    #10;
    clk3 = 0;
    $display("  Resultado esperado:   R[0]=   1");
    $display("  Resultado encontrado: R[0]=%d", $signed(RED3.BRE.regs[0]));
    $display();

    $display("11 slr R[0] R[2]:");
    #10;
    clk3 = 1;
    #10;
    clk3 = 0;
    $display("  Resultado esperado:   R[0]=-128");
    $display("  Resultado encontrado: R[0]=%d", $signed(RED3.BRE.regs[0]));
    $display();

    $display("12 rol R[0] R[2]:");
    #10;
    clk3 = 1;
    #10;
    clk3 = 0;
    $display("  Resultado esperado:   R[0]=  64");
    $display("  Resultado encontrado: R[0]=%d", $signed(RED3.BRE.regs[0]));
    $display();

    $display("13 brzr R[0] R[1]:");
    #10;
    clk3 = 1;
    #10;
    clk3 = 0;
    $display("  Resultado esperado:   PC=  14");
    $display("  Resultado encontrado: PC=%d", $signed(RED3.cur_pc));
    $display();

    $display("14 ld R[0] R[2]:");
    #10;
    clk3 = 1;
    #10;
    clk3 = 0;
    $display("  Resultado esperado:   R[0]=   0");
    $display("  Resultado encontrado: R[0]=%d", $signed(RED3.BRE.regs[0]));
    $display();
    
    $display("15 ji -2:");
    #10;
    clk3 = 1;
    #10;
    clk3 = 0;
    $display("  Resultado esperado:   PC=  13");
    $display("  Resultado encontrado: PC=%d", $signed(RED3.cur_pc));
    $display();

    $display("13 brzr R[0] R[1]:");
    #10;
    clk3 = 1;
    #10;
    clk3 = 0;
    $display("  Resultado esperado:   PC=  48");
    $display("  Resultado encontrado: PC=%d", $signed(RED3.cur_pc));
    $display();

end
    
endmodule