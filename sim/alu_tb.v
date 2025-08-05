// alu_tb.v - Testbench for ALU
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

        // Original tests
        A = 4'd3; B = 4'd3; opcode = 4'b1000; #10; // Undefined opcode

        // NEW: ADD test
        A = 4'd7; B = 4'd8; opcode = 4'b0000; #10; // ADD: 7 + 8 = 15, carry=0

        A = 4'd5; B = 4'd5; opcode = 4'b0001; #10; // SUB
        A = 4'ha; B = 4'hc; opcode = 4'b0010; #10; // AND
        A = 4'hc; B = 4'd0; opcode = 4'b0100; #10; // NOT A
        A = 4'd9; B = 4'd0; opcode = 4'b1111; #10; // PASS A
        A = 4'd3; B = 4'd3; opcode = 4'b1000; #10; // Undefined again

        // Extended arithmetic tests
        A = 4'd3; B = 4'd4; opcode = 4'b0101; #10; // MUL: 3*4=12, no overflow
        A = 4'd8; B = 4'd4; opcode = 4'b0101; #10; // MUL: overflow
        A = 4'd9; B = 4'd3; opcode = 4'b0110; #10; // DIV: 9/3=3
        A = 4'd5; B = 4'd0; opcode = 4'b0110; #10; // DIV: divide-by-zero

        $finish;
    end

endmodule