`timescale 1ns / 1ps

module alu_tb;

    reg [3:0] A, B, opcode; 
    wire [3:0] result; 
    wire carry_flag, zero_flag;

    alu uut (
        .A(A),
        .B(B),
        .opcode(opcode),
        .result(result),
        .carry_flag(carry_flag),
        .zero_flag(zero_flag)
    );

    initial begin
        $monitor("t=%0dns | A=%d, B=%d, opcode=%b | result=%d | carry=%b | zero=%b",
                  $time, A, B, opcode, result, carry_flag, zero_flag);

        // ADD
        A=4'd7; B=4'd8; opcode=4'b0000; #10;

        // SUB
        A=4'd5; B=4'd5; opcode=4'b0001; #10;

        // AND
        A=4'ha; B=4'hc; opcode=4'b0010; #10;

        // OR
        A=4'hc; B=4'h3; opcode=4'b0011; #10;

        // NOT A
        A=4'hc; B=4'd0; opcode=4'b0100; #10;

        // PASS A
        A=4'd9; B=4'd0; opcode=4'b1111; #10;

        // MUL
        A=4'd3; B=4'd4; opcode=4'b0101; #10;
        A=4'd8; B=4'd4; opcode=4'b0101; #10;

        // DIV
        A=4'd9; B=4'd3; opcode=4'b0110; #10;
        A=4'd5; B=4'd0; opcode=4'b0110; #10;

        // XOR
        A=4'hf; B=4'h0; opcode=4'b0111; #10;

        // LSL
        A=4'b0101; B=4'd0; opcode=4'b1000; #10;

        // LSR
        A=4'b1010; B=4'd0; opcode=4'b1001; #10;

        // ASR
        A=4'b1010; B=4'd0; opcode=4'b1010; #10;

        // ROL
        A=4'b1001; B=4'd0; opcode=4'b1011; #10;

        // ROR
        A=4'b1001; B=4'd0; opcode=4'b1100; #10;

        $finish;
    end
endmodule