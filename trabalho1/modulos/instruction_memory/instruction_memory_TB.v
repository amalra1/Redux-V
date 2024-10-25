module instruction_memory_TB ();
    reg[7:0] n_pc;
    reg clk;
    wire[7:0] address;
    wire[7:0] instruction;
    
    program_counter PC (.n_pc(n_pc), .clk(clk), .cur_pc(address));
    instruction_memory MEM (.address(address), .instruction(instruction));

    initial 
    begin
        $dumpfile("instruction_memory.vcd");
        $dumpvars(5, instruction_memory_TB);
    end

    always 
    begin
        #5 clk = ~clk;
    end

    initial 
    begin
        clk = 0;
        #10;  
        for (n_pc = 0; n_pc <= 101; n_pc = n_pc + 1) 
        begin
            #10;
            $display("address[%d] = [%b]", address, instruction);

            // Fim de algoritmo
            if (instruction === 8'bxxxxxxxx) 
            begin
                $display("-------Algoritmo finalizado");
            end 
        end
	$finish;
    end
endmodule
