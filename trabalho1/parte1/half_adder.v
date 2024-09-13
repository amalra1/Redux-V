module half_adder
(
	input wire a, b,
  	output wire s, carry_out
);
  
  xor u1 (s, a, b);
  and u2 (carry_out, a, b);
  
endmodule