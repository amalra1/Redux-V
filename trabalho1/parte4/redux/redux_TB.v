`timescale 1ps/1ps
module redux_TB ();
reg clk;

redux RED(.clk(clk));

initial begin 
    $dumpfile("redux.vcd");
    $dumpvars(5, redux_TB);
end

initial begin: clock
    clk = 0;
    for (integer i = 0; i < 200; i++) begin
        #10;
        clk = ~clk;
    end
    
    for (reg[7:0] j = 0; j < 255; j++) begin
        $display("data[%d] = %d", j, RED.MED.memoria[j]);
    end
end
    
endmodule