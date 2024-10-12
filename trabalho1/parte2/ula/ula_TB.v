`timescale 1ns/1ps
module ula_TB();
    reg[7:0] A,
    reg[7:0] B,
    reg[3:0] Seletor,
    reg ZERO,
    wire[7:0] S;

    ula DUT(.A(A), .B(B), .Seletor(Seletor), .ZERO(ZERO), .S(S));

    initial begin
        $dumpfile("ula.vcd");
        $dumpvars(5, ula_TB);
    end

    initial begin
        A = 8;
        B = 2;

        $display("Valor em R[A] = %d", A);
        $display("Valor em R[B] = %d", B);

        #10

        $display("\nTodas as operações da ULA:\n");
        for (Seletor = 0; Seletor < 10; Seletor = Seletor + 1) begin
            #10;
            
            if (Seletor == 0) $display("NOT R[A] = ");
            else if (Seletor == 1) $display("R[A] AND R[B] = ");
            else if (Seletor == 2) $display("R[A] OR R[B] = ");
            else if (Seletor == 3) $display("R[A] XOR R[B] = ");
            else if (Seletor == 4) $display("R[A] ADD R[B] = ");
            else if (Seletor == 5) $display("R[A] SUB R[B] = ");
            else if (Seletor == 6) $display("R[A] SLR R[B] = ");
            else if (Seletor == 7) $display("R[A] SRR R[B] = ");
            else if (Seletor == 8) $display("R[A] MUL R[B] = ");
            else if (Seletor == 9) $display("R[A] ROL R[B] = ");
            
            $display("Seletor = %d, Resultado = %d, ZERO = %d\n", Seletor, S, ZERO);
        end
    end
endmodule
