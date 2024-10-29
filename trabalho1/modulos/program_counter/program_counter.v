module program_counter (
    input wire[7:0] n_pc, 
    input wire clk, reset,
    output reg[7:0] cur_pc
);


always @(posedge clk) begin

    if (reset)
        cur_pc = 0;
    else
        cur_pc = n_pc;
end
    
endmodule