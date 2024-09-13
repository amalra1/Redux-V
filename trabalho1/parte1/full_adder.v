module full_adder
(
    input wire a, b, carry_in,
    output wire s, carry_out
);
  
  wire s_half, carry_1, carry_2;

  half_adder ha1(a, b, s_half, carry_1);
  half_adder ha2(s_half, carry_in, s, carry_2);
  
  assign carry_out = carry_1 | carry_2;

endmodule