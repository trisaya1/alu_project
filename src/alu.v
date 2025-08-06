`timescale 1ns / 1ps

module alu(
    input  [3:0] A,        // Operand A
    input  [3:0] B,        // Operand B
    input  [3:0] opcode,   // Operation selector
    output reg [3:0] result, // ALU result
    output reg carry_flag, // Carry/overflow flag
    output reg zero_flag,  // Zero result flag
    output reg negative_flag, // Negative flag (MSB of result)
    output reg overflow_flag // Overflow flag for signed operations
);

    // Internal variable for multiplication
    reg [7:0] product;

    always @(*) begin
        // Default assignments
        result = 4'b0000;
        carry_flag = 0;
        overflow_flag = 0;
        product = 8'b00000000;

        // Reset flags at the start of each operation
        negative_flag = 0;
        overflow_flag = 0;

        case (opcode)
            4'b0000: {carry_flag, result} = A + B;    // ADD
            4'b0001: {carry_flag, result} = A - B;    // SUB
            4'b0010: result = A & B;                  // AND
            4'b0011: result = A | B;                  // OR
            4'b0100: result = ~A;                     // NOT A
            4'b0101: begin                            // MUL
                product = A * B;
                result = product[3:0];
                carry_flag = |product[7:4];
            end
            4'b0110: begin                            // DIV
                if (B == 0) begin
                    result = 4'b0000;
                    carry_flag = 1;
                end else begin
                    result = A / B;
                end
            end
            4'b0111: result = A ^ B;                  // XOR
            4'b1000: result = A << 1;                 // LSL
            4'b1001: result = A >> 1;                 // LSR
            4'b1010: result = {A[3], A[3:1]};         // ASR
            4'b1011: result = {A[2:0], A[3]};         // ROL
            4'b1100: result = {A[0], A[3:1]};         // ROR
            4'b1101: result = A << 1;                 // ASL (Arithmetic Shift Left)
            4'b1111: result = A;                      // PASS A
            default: result = 4'b0000;
        endcase

        // **Overflow Flag**: Check for overflow in ADD/SUB
        if ((opcode == 4'b0000 || opcode == 4'b0001) && 
            ((A[3] == B[3] && result[3] != A[3]) || // Overflow condition for ADD/SUB
             (A[3] != B[3] && result[3] != A[3]))) begin
            overflow_flag = 1;
        end

        // **Negative Flag**: Set when MSB (bit 3) of result is 1
        if (result[3] == 1) begin
            negative_flag = 1;
        end

        // **Zero Flag**: Set if result is 0
        zero_flag = (result == 4'b0000);
    end
endmodule