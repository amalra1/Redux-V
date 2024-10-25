module program_counter_TB ();
    reg [7:0] n_pc;
    reg clk;
    wire [7:0] cur_pc;
    
    program_counter DUT(.n_pc(n_pc), .clk(clk), .cur_pc(cur_pc));

    initial begin
        $dumpfile("program_counter.vcd");
        $dumpvars(5, program_counter_TB);
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
        n_pc = 8'd10;
        #15
        n_pc = 8'd11;
        #15
        n_pc = 8'd19;
        #15
        n_pc = 8'd12;
        #15
        n_pc = 8'd13;
        #15
        n_pc = 8'd19;
        #15
        n_pc = 8'd11;
        #15
        n_pc = 8'd13;
        #15
        n_pc = 8'd14;
        #15
        n_pc = 8'd18;
        #15
        n_pc = 8'd10;
    end

endmodule