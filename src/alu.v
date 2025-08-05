// alu.v - Extended 4-bit ALU
`timescale 1ns / 1ps

module alu(
    input  [3:0] A,        // Operand A
    input  [3:0] B,        // Operand B
    input  [3:0] opcode,   // Operation selector
    output reg [3:0] result, // ALU result
    output reg carry_flag, // Carry/overflow flag
    output reg zero_flag   // Zero result flag
);

    // Internal variable for multiplication
    reg [7:0] product;

    always @(*) begin
        case (opcode)
            4'b0000: begin // ADD
                {carry_flag, result} = A + B;
            end

            4'b0001: begin // SUB
                {carry_flag, result} = A - B;
            end

            4'b0010: begin // AND
                result = A & B;
                carry_flag = 0;
            end

            4'b0011: begin // OR
                result = A | B;
                carry_flag = 0;
            end

            4'b0100: begin // NOT A
                result = ~A;
                carry_flag = 0;
            end

            4'b0101: begin // MUL (Multiply)
                product = A * B;
                result = product[3:0];
                carry_flag = |product[7:4]; // Overflow if upper bits non-zero
            end

            4'b0110: begin // DIV (Divide)
                if (B == 0) begin
                    result = 4'b0000;
                    carry_flag = 1; // Indicate divide-by-zero
                end else begin
                    result = A / B;
                    carry_flag = 0;
                end
            end

            4'b1111: begin // PASS A
                result = A;
                carry_flag = 0;
            end

            default: begin
                result = 4'b0000;
                carry_flag = 0;
            end
        endcase

        // Zero flag
        if (result == 4'b0000)
            zero_flag = 1;
        else
            zero_flag = 0;
    end
endmodule