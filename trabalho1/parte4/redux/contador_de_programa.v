module contador_de_programa (
    input wire[7:0] entrada, 
    input wire clk,
    output reg[7:0] saida
);

initial begin
    saida = 0;
end


always @(posedge clk) begin
    saida <= entrada;
end
    
endmodule