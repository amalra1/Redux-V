module reg_bank_TB ();

reg clk, write_enable;
reg[1:0] r_a, r_b, write_addr;
reg[7:0] write_data;
wire[7:0] a, b;

reg_bank REGS(.clk(clk), .write_enable(write_enable), .r_a(r_a), .r_b(r_b), .write_addr(write_addr), .write_data(write_data), .a(a), .b(b));

initial begin 
    $dumpfile("reg_bank.vcd");
    $dumpvars(5, reg_bank_TB);
end

initial begin: clock
    clk = 0;
    for (integer i = 0; i < 40; i++) begin
        clk = ~clk;
        #10;
    end
end

initial begin
    write_enable <= 1;
    r_a <= 2'b00;
    r_b <= 2'b00;
    write_data <= 8'b000000;
    write_addr <= 2'b00;
    #20

    write_enable <= 1;
    r_a <= 2'b01;
    r_b <= 2'b01;
    write_data <= 8'b000000;
    write_addr <= 2'b01;
    #20

    write_enable <= 1;
    r_a <= 2'b10;
    r_b <= 2'b10;
    write_data <= 8'b000000;
    write_addr <= 2'b10;
    #20

    write_enable <= 1;
    r_a <= 2'b11;
    r_b <= 2'b11;
    write_data <= 8'b000000;
    write_addr <= 2'b11;
    #20

    write_data <= 8'b11110101;
    write_addr <= 2'b00;
    r_a <= 2'b00;
    #20

    write_data <= 8'b01010011;
    write_addr <= 2'b11;
    r_b <= 2'b11;

end
    
endmodule