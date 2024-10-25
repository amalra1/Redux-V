`timescale 1ps/1ps
module redux_TB ();
reg clk;

redux RED(.clk(clk));

initial begin 
    $dumpfile("redux.vcd");
    $dumpvars(5, redux_TB);
    $dumpvars(0, RED.BRE.regs[0]);
    $dumpvars(0, RED.BRE.regs[1]);
    $dumpvars(0, RED.BRE.regs[2]);
    $dumpvars(0, RED.BRE.regs[3]);
end

initial begin: clock
    clk = 0;
    for (integer i = 0; i < 1000; i++) begin
        #10;
        clk = ~clk;
    end
    
    for (reg[7:0] j = 0; j < 255; j++) begin
        $display("data[%d] = %d", j, $signed(RED.MED.memoria[j]));
    end
end
    
endmodule