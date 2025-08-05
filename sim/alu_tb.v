// alu_tb.v is a testbench for alu.v (ALU)
// A testbench is like a lab environment - it feeds signals into the ALU and observes what comes out 

`timescale 1ns / 1ps // Simulation time unit of 1ns, time precision of 1ps


module alu_tb; // Declares a testbench module with no ports as testbenches are not connected to anything 

// Testbench variables
reg [3:0] A, B, opcode; // 'reg' is used for inputs in simulation (you'll assign to them in time)
wire [3:0] result; // 'wire' is used for outputs (ALU sets them, you observe them)
wire carry_flag, zero_flag;

// Instantiate the ALU module via uut (Unit Under Test) which wires the testbench variables to the real ALU inputs/outputs
alu uut (
.A(A),
.B(B),
.opcode(opcode),
.result(result),
.carry_flag(carry_flag),
.zero_flag(zero_flag)
);

initial begin // 'initial' block runs once at the beginning of simulation

// A print-to-console debugging tool that shows what's happening at each simulation step witgout needing to open the waveform every time
// add this between every test next time
//$monitor("Time= %0t | A= %b B= %b Opcode= %b -> Result= %b | Carry= %b Zero= %b", 
//$time, A, B, opcode, result, carry_flag, zero_flag);

// Test 1: ADD 3 + 2
A = 4'd3; B = 4'd2; opcode = 4'b0000; // 4'd3 means 4-bit decimal 3, 4'd2 means 4-bit decimal 2, 4'b0000 means ADD via my ISA (Instruction Set Architecture)
#10; // #10 means wait 10ns (due to simulation time unit of ns), after 10ns result shpuld be 5

// All other test cases follow the same idea: assign A, B, opcode, then wait, then let simulator show what result came out

// Test 2: SUB 5 - 5 (should set zero_flag)
A = 4'd5; B = 4'd5; opcode = 4'b0001;
#10;

// Test 3: AND 1010 & 1100
A = 4'b1010; B = 4'b1100; opcode = 4'b0010;
#10;

// Test 4: OR 1010 | 1100
A = 4'b1010; B = 4'b1100; opcode = 4'b0011;
#10;

// Test 5: NOT A (on 1100)
A = 4'b1100; B = 4'b0000; opcode = 4'b0100;
#10;

// Test 6: PASS A
A = 4'b1001; B = 4'b0000; opcode = 4'b1111;
#10;

// Test 7: Default/Invalid opcode
A = 4'd3; B = 4'd3; opcode = 4'b1000;
#10;

$finish;
end

endmodule