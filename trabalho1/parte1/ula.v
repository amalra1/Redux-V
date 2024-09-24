module ula (
  input wire [7:0] ra,
  input wire [7:0] rb,
  input wire [2:0] opcode,
  output wire [7:0] result      
);

  // Variável para cada resultado das operações da ULA
  wire [7:0] not_result, and_result, or_result, xor_result, add_result, sub_result, slr_result, srr_result;

  // Todas as operações da ULA
  assign not_result = ~ra;
  assign and_result = ra & rb;
  assign or_result = ra | rb;
  assign xor_result = ra ^ rb;
  assign add_result = ra + rb;
  assign sub_result = ra - rb;
  assign slr_result = ra << rb;
  assign srr_result = ra >> rb;
  
  mux8 mux_saida(not_result, and_result, or_result, xor_result, add_result, sub_result, slr_result, srr_result, opcode, result);
		
endmodule
