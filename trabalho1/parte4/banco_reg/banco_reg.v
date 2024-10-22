module banco_reg (
    input wire clk, write_enable, 
    input wire[1:0] r_a, r_b, write_addr,
    input wire[7:0] write_data,
    output wire[7:0] a, b
);

reg[7:0] regs[0:4];

always @(posedge clk) begin
    if (write_enable) begin
        regs[write_addr] <= write_data;
    end
end

assign a = regs[r_a];
assign b = regs[r_b];

endmodule