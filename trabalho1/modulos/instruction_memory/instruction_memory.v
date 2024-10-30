module instruction_memory #(
    parameter ALG = 1
) (
    input wire[7:0] address,
    output wire[7:0] instruction
);

    // Cria a memória (Matriz)
    reg[7:0] memory[0:255];

    // Inicializa a memória com as instrucoes passadas
    initial 
    begin
        if (ALG == 1) begin
            memory[0] <= 8'b10110000;
            memory[1] <= 8'b10110101;
            memory[2] <= 8'b10111010;
            memory[3] <= 8'b10111111;
            memory[4] <= 8'b01000011;
            memory[5] <= 8'b11000100;
            memory[6] <= 8'b10110000;
            memory[7] <= 8'b00110100;
            memory[8] <= 8'b01000111;
            memory[9] <= 8'b01000011;
            memory[10] <= 8'b11001100;
            memory[11] <= 8'b11001000;
            memory[12] <= 8'b01001000;
            memory[13] <= 8'b11101000;
            memory[14] <= 8'b11001000;
            memory[15] <= 8'b01001111;
            memory[16] <= 8'b00111000;
            memory[17] <= 8'b10110000;
            memory[18] <= 8'b10111010;
            memory[19] <= 8'b11011001;
            memory[20] <= 8'b01000101;
            memory[21] <= 8'b11100001;
            memory[22] <= 8'b00010010;
            memory[23] <= 8'b00011100;
            memory[24] <= 8'b01000000;
            memory[25] <= 8'b00001000;
            memory[26] <= 8'b11001001;
            memory[27] <= 8'b10110000;
            memory[28] <= 8'b11001110;
            memory[29] <= 8'b01000001;
            memory[30] <= 8'b00010010;
            memory[31] <= 8'b00011000;
            memory[32] <= 8'b00100100;
            memory[33] <= 8'b11000110;
            memory[34] <= 8'b00110111;
            memory[35] <= 8'b11011110;
            memory[36] <= 8'b11001000;
            memory[37] <= 8'b10110000;
            memory[38] <= 8'b00100100;
            memory[39] <= 8'b00011000;
        end else if (ALG == 2) begin
            memory[0] <= 8'b10110000;
            memory[1] <= 8'b10110101;
            memory[2] <= 8'b10111010;
            memory[3] <= 8'b10111111;
            memory[4] <= 8'b01000101;
            memory[5] <= 8'b00110001;
            memory[6] <= 8'b01010001;
            memory[7] <= 8'b11001000;
            memory[8] <= 8'b01010110;
            memory[9] <= 8'b11100010;
            memory[10] <= 8'b11000100;
            memory[11] <= 8'b10110000;
            memory[12] <= 8'b01000111;
            memory[13] <= 8'b11000100;
            memory[14] <= 8'b01010110;
            memory[15] <= 8'b00110100;
            memory[16] <= 8'b01000010;
            memory[17] <= 8'b11001100;
            memory[18] <= 8'b01010001;
            memory[19] <= 8'b00111100;
            memory[20] <= 8'b10111010;
            memory[21] <= 8'b10110000;
            memory[22] <= 8'b00100100;
            memory[23] <= 8'b01000100;
            memory[24] <= 8'b00010010;
            memory[25] <= 8'b00011100;
            memory[26] <= 8'b11100000;
            memory[27] <= 8'b01000010;
            memory[28] <= 8'b11010110;
            memory[29] <= 8'b00000100;
            memory[30] <= 8'b10110000;
            memory[31] <= 8'b01000001;
            memory[32] <= 8'b00010010;
            memory[33] <= 8'b00011000;
            memory[34] <= 8'b11001000;
            memory[35] <= 8'b00100100;
            memory[36] <= 8'b01110110;
            memory[37] <= 8'b10111111;
            memory[38] <= 8'b11001100;
            memory[39] <= 8'b01000011;
            memory[40] <= 8'b00010010;
            memory[41] <= 8'b00011000;
            memory[42] <= 8'b11100000;
            memory[43] <= 8'b11100011;
            memory[44] <= 8'b10010001;
            memory[45] <= 8'b10111111;
            memory[46] <= 8'b11001100;
            memory[47] <= 8'b10110000;
            memory[48] <= 8'b00010010;
            memory[49] <= 8'b00011000;
            memory[50] <= 8'b01000100;
            memory[51] <= 8'b11100000;
            memory[52] <= 8'b01011001;
            memory[53] <= 8'b00001100;
            memory[54] <= 8'b01100110;
            memory[55] <= 8'b10110000;
            memory[56] <= 8'b00010010;
            memory[57] <= 8'b00011000;
            memory[58] <= 8'b01000010;
            memory[59] <= 8'b00101100;
            memory[60] <= 8'b01010001;
            memory[61] <= 8'b00110100;
            memory[62] <= 8'b11001110;
            memory[63] <= 8'b11011100;
            memory[64] <= 8'b00110111;
            memory[65] <= 8'b00011000;
        end else begin
            memory[0] <= 8'b01000111;
            memory[1] <= 8'b00111000;
            memory[2] <= 8'b01011111;
            memory[3] <= 8'b11010100;
            memory[4] <= 8'b10001000;
            memory[5] <= 8'b11001101;
            memory[6] <= 8'b10111100;
            memory[7] <= 8'b01100110;
            memory[8] <= 8'b10010111;
            memory[9] <= 8'b10100010;
            memory[10] <= 8'b11110010;
            memory[11] <= 8'b11100010;
            memory[12] <= 8'b01110010;
            memory[13] <= 8'b00000001;
            memory[14] <= 8'b00100010;
            memory[15] <= 8'b00011110;
        end
        
    end

    assign instruction = memory[address];

endmodule
