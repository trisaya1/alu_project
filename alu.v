// alu.v - 4-bit ALU for the 4-bit CPU

`timescale 1ns / 1ps // timescale isn't mandatory in verilog module files as typically there are no simulation delays like #10 that the simulator needs to interpret
                     // timescales are mandatory for testbenches, but is good practice to include in module files too
module alu(
 // An ALU chip has input pins for A, B, and opcode, and output pins for result, carry, and zero
 
 // Declaring input ports: A and B are the input operands, opcode tells the ALU which operation to perform
 // [3:0} means 4-bit bus (bits 3 to 0), so it supports binary values from 0000 to 1111, or decimal 0-15
 // Note that buses are just groups of wires. A 4-bit bus is 4 wires
 
input [3:0] A, // Operand A (4 bits)
input [3:0] B, // Operand B (4 bits)
input [3:0] opcode, // Operation selector

// Declaring output ports, 'reg' means you will assign to them inside a procedural block like 'always'

output reg [3:0] result, // ALU result
output reg carry_flag, // Carry out flag, will equal 1 if there's an overflow in addition or a borrow in subtraction
output reg zero_flag // Zero result flag, will equal 1 if the result is zero
);

// This is a combinational block where the ALU checks inputs and produces outputs immediately

always @(*) begin // @(*) means it runs any time any input changes - it's how we model combinational logic (no memory, no clock)
case (opcode) // A case block is like a switch statement in C/Python: it chooses behaviour based on the opcode value (selecting the function the ALU performs)

// next time: implement more opcodes in the module and testbench code for ALU

4'b0000: begin // ADD: A + B, 4'b0000 means 4-bit binary literal 0000
{carry_flag, result} = A + B; // joins bits: if A + B = 5'b10000, the MSB goes to carry_flag (1 bit), and the remaining 4 bits go to result
end 

4'b0001: begin // SUB: A - B
{carry_flag, result} = A - B;
end

4'b0010: begin // AND
result = A & B; // & is bitwise AND
carry_flag = 0; // No carry in logic operations as they happen bit by bit
end 

4'b0011: begin // OR
result = A | B;
carry_flag = 0;
end

4'b0100: begin // NOT A
result = ~A;
carry_flag = 0;
end

4'b1111: begin // PASS A
result = A;
carry_flag = 0;
end

default: begin // Default case
result = 4'b0000;
carry_flag = 0;
end

endcase

// Set zero flag if result is 0
if (result == 4'b0000)
zero_flag = 1;
else
zero_flag = 0;
end

endmodule