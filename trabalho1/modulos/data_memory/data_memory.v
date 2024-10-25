module data_memory(
    input wire clk, write_enable, 
    input wire[7:0] address, data_in,
    output wire[7:0] data_out
);

    // Cria a memória (Matriz)
    reg[7:0] memoria[0:255];

    always @(posedge clk)
    begin
        if (write_enable == 1) 
        begin
            memoria[address] = data_in;
        end
    end

    assign data_out = memoria[address];
endmodule
