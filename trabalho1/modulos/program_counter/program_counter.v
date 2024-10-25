module program_counter (
    input wire[7:0] n_pc, 
    input wire clk,
    output reg[7:0] cur_pc
);

initial begin
    cur_pc = 0;
end


always @(posedge clk) begin
    cur_pc <= n_pc;
end
    
endmodule