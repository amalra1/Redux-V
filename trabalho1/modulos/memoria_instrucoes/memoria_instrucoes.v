module memoria_instrucoes #(
    parameter ALG = 1
) (
    input wire[7:0] endereco,
    output wire[7:0] instrucao
);

    // Cria a memória (Matriz)
    reg[7:0] memoria[0:255];

    // Inicializa a memória com as instrucoes passadas
    initial 
    begin
        if (ALG == 1) begin
            memoria[0] = 8'b10110000;
            memoria[1] = 8'b10110101;
            memoria[2] = 8'b10111010;
            memoria[3] = 8'b10111111;
            memoria[4] = 8'b01000011;
            memoria[5] = 8'b11000100;
            memoria[6] = 8'b10110000;
            memoria[7] = 8'b00110100;
            memoria[8] = 8'b01000111;
            memoria[9] = 8'b01000011;
            memoria[10] = 8'b11001100;
            memoria[11] = 8'b11001000;
            memoria[12] = 8'b01001000;
            memoria[13] = 8'b11101000;
            memoria[14] = 8'b11001000;
            memoria[15] = 8'b01001111;
            memoria[16] = 8'b00111000;
            memoria[17] = 8'b10110000;
            memoria[18] = 8'b10111010;
            memoria[19] = 8'b11011001;
            memoria[20] = 8'b01000101;
            memoria[21] = 8'b11100001;
            memoria[22] = 8'b00010010;
            memoria[23] = 8'b00011100;
            memoria[24] = 8'b01000000;
            memoria[25] = 8'b00001000;
            memoria[26] = 8'b11001001;
            memoria[27] = 8'b10110000;
            memoria[28] = 8'b11001110;
            memoria[29] = 8'b01000001;
            memoria[30] = 8'b00010010;
            memoria[31] = 8'b00011000;
            memoria[32] = 8'b00100100;
            memoria[33] = 8'b11000110;
            memoria[34] = 8'b00110111;
            memoria[35] = 8'b11011110;
            memoria[36] = 8'b11001000;
            memoria[37] = 8'b10110000;
            memoria[38] = 8'b00100100;
            memoria[39] = 8'b00011000;
        end else if (ALG == 2) begin
            memoria[0] = 8'b10110000;
            memoria[1] = 8'b10110101;
            memoria[2] = 8'b10111010;
            memoria[3] = 8'b10111111;
            memoria[4] = 8'b01000101;
            memoria[5] = 8'b00110001;
            memoria[6] = 8'b01010001;
            memoria[7] = 8'b11001000;
            memoria[8] = 8'b01010110;
            memoria[9] = 8'b11100010;
            memoria[10] = 8'b11000100;
            memoria[11] = 8'b10110000;
            memoria[12] = 8'b01000111;
            memoria[13] = 8'b11000100;
            memoria[14] = 8'b01010110;
            memoria[15] = 8'b00110100;
            memoria[16] = 8'b01000010;
            memoria[17] = 8'b11001100;
            memoria[18] = 8'b01010001;
            memoria[19] = 8'b00111100;
            memoria[20] = 8'b10111010;
            memoria[21] = 8'b10110000;
            memoria[22] = 8'b00100100;
            memoria[23] = 8'b01000100;
            memoria[24] = 8'b11100000;
            memoria[25] = 8'b01010100;
            memoria[26] = 8'b00010010;
            memoria[27] = 8'b00011010;
            memoria[28] = 8'b11010110;
            memoria[29] = 8'b00000100;
            memoria[30] = 8'b10110000;
            memoria[31] = 8'b01000001;
            memoria[32] = 8'b11001000;
            memoria[33] = 8'b00100100;
            memoria[34] = 8'b00010010;
            memoria[35] = 8'b00011000;
            memoria[36] = 8'b01110110;
            memoria[37] = 8'b11110000;
            memoria[38] = 8'b10010001;
            memoria[39] = 8'b10111111;
            memoria[40] = 8'b11001100;
            memoria[41] = 8'b10110000;
            memoria[42] = 8'b00010010;
            memoria[43] = 8'b00011000;
            memoria[44] = 8'b01000100;
            memoria[45] = 8'b11100000;
            memoria[46] = 8'b01011111;
            memoria[47] = 8'b00001100;
            memoria[48] = 8'b01100110;
            memoria[49] = 8'b10110000;
            memoria[50] = 8'b00010010;
            memoria[51] = 8'b00011000;
            memoria[52] = 8'b01000010;
            memoria[53] = 8'b00101100;
            memoria[54] = 8'b01010001;
            memoria[55] = 8'b00110100;
            memoria[56] = 8'b11001110;
            memoria[57] = 8'b11011100;
            memoria[58] = 8'b00110111;
            memoria[59] = 8'b00011000;
        end
        
    end

    assign instrucao = memoria[endereco];

endmodule
