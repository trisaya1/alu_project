// ============================================================================
// opcodes.vh - ALU settings and operation codes for 8-bit design
// ----------------------------------------------------------------------------
// This file is used by both the ALU design and the testbench.
// It sets the ALU data width and gives names to each operation code (opcode).
// ============================================================================

`ifndef ALU_OPCODES_VH
`define ALU_OPCODES_VH

// -------------------
// ALU size settings
// -------------------
// Width of the ALU's inputs and output.
// Change this number if you want to make the ALU bigger or smaller.
`define ALU_DATA_WIDTH 8
// The position of the most significant bit (MSB).
// For 8 bits, the MSB is bit 7.
`define ALU_MSB        (`ALU_DATA_WIDTH-1)


// -------------------
// Operation codes
// -------------------
// Each operation is given a short name and a 4-bit code.
// The ALU uses these codes to decide which calculation to perform.

// Arithmetic
`define OP_ADD   4'b0000   // Add:       A + B
`define OP_SUB   4'b0001   // Subtract:  A - B

// Logic
`define OP_AND   4'b0010   // AND:       A & B (bit is 1 only if both bits are 1)
`define OP_OR    4'b0011   // OR:        A | B (bit is 1 if either bit is 1)
`define OP_XOR   4'b0100   // XOR:       A ^ B (bit is 1 if bits are different)
`define OP_NOT   4'b0101   // NOT:       ~A    (flips every bit in A)

// Multiply / Divide 
`define OP_MUL   4'b0110   // Multiply:  A * B (only keeps the lowest 8 bits)
`define OP_DIV   4'b0111   // Divide:    A / B (if B=0, result will be 0 and flag set)

// Shifts / Rotates (move bits left or right by 1 place)
`define OP_LSL   4'b1000   // Logical shift left:  A << 1 (fills with 0 on right)
`define OP_LSR   4'b1001   // Logical shift right: A >> 1 (fills with 0 on left)
`define OP_ASR   4'b1010   // Arithmetic shift right: keeps the leftmost bit the same
`define OP_ROL   4'b1011   // Rotate left:  moves the leftmost bit to the right end
`define OP_ROR   4'b1100   // Rotate right: moves the rightmost bit to the left end
`define OP_ASL   4'b1101   // Arithmetic shift left (same as logical shift left here)

// Pass-through
`define OP_PASS  4'b1111   // Pass A:    result is just A

// Reserved (not used now)
`define OP_RSVD  4'b1110   // Reserved for future use

`endif // ALU_OPCODES_VH