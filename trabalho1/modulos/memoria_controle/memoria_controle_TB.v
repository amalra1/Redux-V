module memoria_controle_TB ();
    reg [3:0] opcode;
    reg [10:0] mask;
    wire [3:0] ula;
    wire b_mx, j_mx, r_mx, se_mx, d_mx, we, re;

    memoria_controle MEMC (.opcode(opcode), 
                           .b_mx(b_mx), .j_mx(j_mx), .r_mx(r_mx), .se_mx(se_mx), 
                           .d_mx(d_mx), .ula(ula), .we(we), .re(re));

initial begin
    opcode = 4'b0000;
    mask = 11'b10100000011;
    #10;
    if (({b_mx, j_mx, r_mx, se_mx, d_mx, ula, we, re} & mask) == 11'b10000000000) begin
        $display("ok for opcode: %b", opcode);
    end else begin
        $display("ERROR for opcode: %b", opcode);
        $display("expected: 1x0xxxxxx00");
        $display("     got: %b\n", {b_mx, j_mx, r_mx, se_mx, d_mx, ula, we, re});
    end
    
    opcode = 4'b0001;
    mask = 11'b11000000011;
    #10;
    if (({b_mx, j_mx, r_mx, se_mx, d_mx, ula, we, re} & mask) == 11'b01000000000) begin
        $display("ok for opcode: %b", opcode);
    end else begin
        $display("ERROR for opcode: %b", opcode);
        $display("expected: 10xxxxxxx00");
        $display("     got: %b\n", {b_mx, j_mx, r_mx, se_mx, d_mx, ula, we, re});
    end
    
    
    opcode = 4'b0010;
    mask = 11'b11101000011;
    #10;
    if (({b_mx, j_mx, r_mx, se_mx, d_mx, ula, we, re} & mask) == 11'b00000000001) begin
        $display("ok for opcode: %b", opcode);
    end else begin
        $display("ERROR for opcode: %b", opcode);
        $display("expected: 000x0xxxx01");
        $display("     got: %b\n\n", {b_mx, j_mx, r_mx, se_mx, d_mx, ula, we, re});
    end
    
    opcode = 4'b0011;
    mask = 11'b11100000011;
    #10;
    if (({b_mx, j_mx, r_mx, se_mx, d_mx, ula, we, re} & mask) == 11'b00000000010) begin
        $display("ok for opcode: %b", opcode);
    end else begin
        $display("ERROR for opcode: %b", opcode);
        $display("expected: 000xxxxxx10");
        $display("     got: %b\n", {b_mx, j_mx, r_mx, se_mx, d_mx, ula, we, re});
    end
    
    opcode = 4'b0100;
    mask = 11'b11111111111;
    #10;
    if (({b_mx, j_mx, r_mx, se_mx, d_mx, ula, we, re} & mask) == 11'b00111010001) begin
        $display("ok for opcode: %b", opcode);
    end else begin
        $display("ERROR for opcode: %b", opcode);
        $display("expected: 00111010101");
        $display("     got: %b\n", {b_mx, j_mx, r_mx, se_mx, d_mx, ula, we, re});
    end
    
    opcode = 4'b0101;
    #10;
    if (({b_mx, j_mx, r_mx, se_mx, d_mx, ula, we, re} & mask) == 11'b00111010101) begin
        $display("ok for opcode: %b", opcode);
    end else begin
        $display("ERROR for opcode: %b", opcode);
        $display("expected: 00111010101");
        $display("     got: %b\n", {b_mx, j_mx, r_mx, se_mx, d_mx, ula, we, re});
    end
    
    opcode = 4'b0110;
    #10;
    if (({b_mx, j_mx, r_mx, se_mx, d_mx, ula, we, re} & mask) == 11'b00001100001) begin
        $display("ok for opcode: %b", opcode);
    end else begin
        $display("ERROR for opcode: %b", opcode);
        $display("expected: 00001100001");
        $display("     got: %b\n", {b_mx, j_mx, r_mx, se_mx, d_mx, ula, we, re});
    end
    
    opcode = 4'b0111;
    #10;
    if (({b_mx, j_mx, r_mx, se_mx, d_mx, ula, we, re} & mask) == 11'b00001100101) begin
        $display("ok for opcode: %b", opcode);
    end else begin
        $display("ERROR for opcode: %b", opcode);
        $display("expected: 00001100101");
        $display("     got: %b\n", {b_mx, j_mx, r_mx, se_mx, d_mx, ula, we, re});
    end
    
    opcode = 4'b1000;
    #10;
    if (({b_mx, j_mx, r_mx, se_mx, d_mx, ula, we, re} & mask) == 11'b00001000001) begin
        $display("ok for opcode: %b", opcode);
    end else begin
        $display("ERROR for opcode: %b", opcode);
        $display("expected: 00001000001");
        $display("     got: %b\n", {b_mx, j_mx, r_mx, se_mx, d_mx, ula, we, re});
    end
    
    opcode = 4'b1001;
    #10;
    if (({b_mx, j_mx, r_mx, se_mx, d_mx, ula, we, re} & mask) == 11'b00001000101) begin
        $display("ok for opcode: %b", opcode);
    end else begin
        $display("ERROR for opcode: %b", opcode);
        $display("expected: 00001000101");
        $display("     got: %b\n", {b_mx, j_mx, r_mx, se_mx, d_mx, ula, we, re});
    end
    
    opcode = 4'b1010;
    #10;
    if (({b_mx, j_mx, r_mx, se_mx, d_mx, ula, we, re} & mask) == 11'b00001001001) begin
        $display("ok for opcode: %b", opcode);
    end else begin
        $display("ERROR for opcode: %b", opcode);
        $display("expected: 00001001001");
        $display("     got: %b\n", {b_mx, j_mx, r_mx, se_mx, d_mx, ula, we, re});
    end
    
    opcode = 4'b1011;
    #10;
    if (({b_mx, j_mx, r_mx, se_mx, d_mx, ula, we, re} & mask) == 11'b00001001101) begin
        $display("ok for opcode: %b", opcode);
    end else begin
        $display("ERROR for opcode: %b", opcode);
        $display("expected: 00001001101");
        $display("     got: %b\n", {b_mx, j_mx, r_mx, se_mx, d_mx, ula, we, re});
    end
    
    opcode = 4'b1100;
    #10;
    if (({b_mx, j_mx, r_mx, se_mx, d_mx, ula, we, re} & mask) == 11'b00001010001) begin
        $display("ok for opcode: %b", opcode);
    end else begin
        $display("ERROR for opcode: %b", opcode);
        $display("expected: 00001010001");
        $display("     got: %b\n", {b_mx, j_mx, r_mx, se_mx, d_mx, ula, we, re});
    end
    
    opcode = 4'b1101;
    #10;
    if (({b_mx, j_mx, r_mx, se_mx, d_mx, ula, we, re} & mask) == 11'b00001010101) begin
        $display("ok for opcode: %b", opcode);
    end else begin
        $display("ERROR for opcode: %b", opcode);
        $display("expected: 00001010101");
        $display("     got: %b\n", {b_mx, j_mx, r_mx, se_mx, d_mx, ula, we, re});
    end
    
    opcode = 4'b1110;
    #10;
    if (({b_mx, j_mx, r_mx, se_mx, d_mx, ula, we, re} & mask) == 11'b00001011001) begin
        $display("ok for opcode: %b", opcode);
    end else begin
        $display("ERROR for opcode: %b", opcode);
        $display("expected: 00001011001");
        $display("     got: %b\n", {b_mx, j_mx, r_mx, se_mx, d_mx, ula, we, re});
    end
    
    opcode = 4'b1111;
    #10;
    if (({b_mx, j_mx, r_mx, se_mx, d_mx, ula, we, re} & mask) == 11'b00001011101) begin
        $display("ok for opcode: %b", opcode);
    end else begin
        $display("ERROR for opcode: %b", opcode);
        $display("expected: 00001011101");
        $display("     got: %b\n", {b_mx, j_mx, r_mx, se_mx, d_mx, ula, we, re});
    end

end
    

endmodule

