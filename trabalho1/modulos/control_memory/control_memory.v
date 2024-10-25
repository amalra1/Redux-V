module control_memory (
    input wire[3:0] opcode,
    output reg[3:0] sel_ula,
    output reg b_mx, j_mx, r_mx, se_mx, d_mx, we, re, u_imm
);

always @(opcode) begin
    case (opcode)
        4'b0000: begin b_mx = 1;           r_mx = 0;                                         we = 0; re = 0;            end
        4'b0001: begin b_mx = 0; j_mx = 1;                                                   we = 0; re = 0; u_imm = 1; end
        4'b0010: begin b_mx = 0; j_mx = 0; r_mx = 0;            d_mx = 0;                    we = 0; re = 1;            end
        4'b0011: begin b_mx = 0; j_mx = 0; r_mx = 0;                                         we = 1; re = 0;            end
        4'b0100: begin b_mx = 0; j_mx = 0; r_mx = 1; se_mx = 1; d_mx = 1; sel_ula = 4'b0100; we = 0; re = 1; u_imm = 0; end
        4'b0101: begin b_mx = 0; j_mx = 0; r_mx = 1; se_mx = 1; d_mx = 1; sel_ula = 4'b0101; we = 0; re = 1; u_imm = 1; end
        4'b0110: begin b_mx = 0; j_mx = 0; r_mx = 0; se_mx = 0; d_mx = 1; sel_ula = 4'b1000; we = 0; re = 1;            end
        4'b0111: begin b_mx = 0; j_mx = 0; r_mx = 0; se_mx = 0; d_mx = 1; sel_ula = 4'b1001; we = 0; re = 1;            end
        4'b1000: begin b_mx = 0; j_mx = 0; r_mx = 0; se_mx = 0; d_mx = 1; sel_ula = 4'b0000; we = 0; re = 1;            end
        4'b1001: begin b_mx = 0; j_mx = 0; r_mx = 0; se_mx = 0; d_mx = 1; sel_ula = 4'b0001; we = 0; re = 1;            end
        4'b1010: begin b_mx = 0; j_mx = 0; r_mx = 0; se_mx = 0; d_mx = 1; sel_ula = 4'b0010; we = 0; re = 1;            end
        4'b1011: begin b_mx = 0; j_mx = 0; r_mx = 0; se_mx = 0; d_mx = 1; sel_ula = 4'b0011; we = 0; re = 1;            end
        4'b1100: begin b_mx = 0; j_mx = 0; r_mx = 0; se_mx = 0; d_mx = 1; sel_ula = 4'b0100; we = 0; re = 1;            end
        4'b1101: begin b_mx = 0; j_mx = 0; r_mx = 0; se_mx = 0; d_mx = 1; sel_ula = 4'b0101; we = 0; re = 1;            end
        4'b1110: begin b_mx = 0; j_mx = 0; r_mx = 0; se_mx = 0; d_mx = 1; sel_ula = 4'b0110; we = 0; re = 1;            end
        4'b1111: begin b_mx = 0; j_mx = 0; r_mx = 0; se_mx = 0; d_mx = 1; sel_ula = 4'b0111; we = 0; re = 1;            end
    endcase
end

    
endmodule