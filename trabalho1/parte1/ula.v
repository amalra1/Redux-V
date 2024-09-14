module ula (
  input wire [7:0] ra,
  input wire [7:0] rb,
  input wire [3:0] opcode,
  output wire [7:0] result,
  output wire carry_out       
);

  // Variável para cada resultado das operações da ULA
  wire [7:0] not_result, and_result, or_result, xor_result, add_result, sub_result, slr_result, srr_result;
  wire slr_carry_out, srr_carry_out;

  // Todas as operações da ULA
  assign not_result = ~ra;
  assign and_result = ra & rb;
  assign or_result = ra | rb;
  assign xor_result = ra ^ rb;
  assign add_result = ra + rb;
  assign sub_result = ra - rb;
  assign slr_result = ra << rb;
  assign srr_result = ra >> rb;

  // Carry out dos shifts é o bit mais "significativo"
  assign slr_carry_out = ra[7];
  assign srr_carry_out = ra[0];
  
  mux8 mux_saida(not_result, and_result, or_result, xor_result, add_result, sub_result, slr_result, srr_result, opcode, result);

  // Seleção do carry_out baseado no opcode
  assign carry_out = (opcode == 4'b1110) ? slr_carry_out :
                     (opcode == 4'b1111) ? srr_carry_out :
                     1'b0;			
endmodule
