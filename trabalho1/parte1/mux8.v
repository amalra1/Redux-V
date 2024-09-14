module mux8 (
  input wire [7:0] in0,      // Entrada 0
  input wire [7:0] in1,      // Entrada 1
  input wire [7:0] in2,      // Entrada 2
  input wire [7:0] in3,      // Entrada 3
  input wire [7:0] in4,      // Entrada 4
  input wire [7:0] in5,      // Entrada 5
  input wire [7:0] in6,      // Entrada 6
  input wire [7:0] in7,      // Entrada 7
  input wire [2:0] sel,      // Sinal de seleção (3 bits)
  output wire [7:0] out      // Saída
);

  // Atribuição contínua para selecionar a saída correta com base no sinal de seleção
  assign out = (sel == 3'b000) ? in0 :
               (sel == 3'b001) ? in1 :
               (sel == 3'b010) ? in2 :
               (sel == 3'b011) ? in3 :
               (sel == 3'b100) ? in4 :
               (sel == 3'b101) ? in5 :
               (sel == 3'b110) ? in6 :
               (sel == 3'b111) ? in7 :
               8'b0;

endmodule
