`timescale 1ns/1ps
module ula_TB();
    reg[7:0] a, b;
    reg[3:0] select;
    wire[7:0] s;

    ula DUT(.a(a), .b(b), .select(select), .s(s));

    initial begin
        $dumpfile("ula.vcd");
        $dumpvars(5, ula_TB);
    end

    initial begin
        a = 8'b01000111;
        b = 8'b00000010;

        $display("Valor em R[a] = %b", a);
        $display("Valor em R[b] = %b", b);

        #10;

        $display("\nTodas as operações da ULA:\n");
        for (select = 0; select < 10; select = select + 1) begin
            #10;
            
            if (select == 0) $display("NOT R[b]:");
            else if (select == 1) $display("R[a] AND R[b]:");
            else if (select == 2) $display("R[a] OR R[b]:");
            else if (select == 3) $display("R[a] XOR R[b]:");
            else if (select == 4) $display("R[a] ADD R[b]:");
            else if (select == 5) $display("R[a] SUB R[b]:");
            else if (select == 6) $display("R[a] SLR R[b]:");
            else if (select == 7) $display("R[a] SRR R[b]:");
            else if (select == 8) $display("R[a] MUL R[b]:");
            else if (select == 9) $display("R[a] ROL R[b]:");
            
            $display("select = %b, Resultado = %b\n", select, s);
        end

        #10;

        $display("Subtracao que retorna s == 0:");
        select = 5;
        a = 8'b01000111;
        b = 8'b01000111;
        $display("Valor em R[a] = %b", a);
        $display("Valor em R[b] = %b", b);
        $display("select = %b, Resultado = %b\n", select, s);

        #10;

        $display("Operacao ROL que da mais de uma volta em R[a]:");
        select = 9;
        a = 8'b01000111;
        b = 8'b00001100;

	#10;

        $display("Valor em R[a] = %b", a);
        $display("Valor em R[b] = %b", b);
        $display("select = %b, Resultado = %b\n", select, s);

        #10;

    end
endmodule
