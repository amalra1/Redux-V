`timescale 1ns/1ps
module ula_TB();
    reg[7:0] A;
    reg[7:0] B;
    reg[3:0] Seletor;
    wire ZERO;
    wire[7:0] S;

    ula DUT(.A(A), .B(B), .Seletor(Seletor), .ZERO(ZERO), .S(S));

    initial begin
        $dumpfile("ula.vcd");
        $dumpvars(5, ula_TB);
    end

    initial begin
        A = 8'b01000111;
        B = 8'b00000010;

        $display("Valor em R[A] = %b", A);
        $display("Valor em R[B] = %b", B);

        #10;

        $display("\nTodas as operações da ULA:\n");
        for (Seletor = 0; Seletor < 10; Seletor = Seletor + 1) begin
            #10;
            
            if (Seletor == 0) $display("NOT R[A]:");
            else if (Seletor == 1) $display("R[A] AND R[B]:");
            else if (Seletor == 2) $display("R[A] OR R[B]:");
            else if (Seletor == 3) $display("R[A] XOR R[B]:");
            else if (Seletor == 4) $display("R[A] ADD R[B]:");
            else if (Seletor == 5) $display("R[A] SUB R[B]:");
            else if (Seletor == 6) $display("R[A] SLR R[B]:");
            else if (Seletor == 7) $display("R[A] SRR R[B]:");
            else if (Seletor == 8) $display("R[A] MUL R[B]:");
            else if (Seletor == 9) $display("R[A] ROL R[B]:");
            
            $display("Seletor = %b, Resultado = %b, ZERO = %d\n", Seletor, S, ZERO);
        end

        #10;

        $display("Subtracao que retorna S == 0:");
        Seletor = 5;
        A = 8'b01000111;
        B = 8'b01000111;
        $display("Valor em R[A] = %b", A);
        $display("Valor em R[B] = %b", B);
        $display("Seletor = %b, Resultado = %b, ZERO = %d\n", Seletor, S, ZERO);

        #10;

        $display("Operacao ROL que da mais de uma volta em R[A]:");
        Seletor = 9;
        A = 8'b01000111;
        B = 8'b00001100;

	#10;

        $display("Valor em R[A] = %b", A);
        $display("Valor em R[B] = %b", B);
        $display("Seletor = %b, Resultado = %b, ZERO = %d\n", Seletor, S, ZERO);

        #10;

    end
endmodule
