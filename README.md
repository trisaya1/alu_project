# 4-bit ALU Project (Verilog)

This project is a simulation-only implementation of a **4-bit ALU (Arithmetic Logic Unit)** designed using **Verilog** in **Xilinx Vivado**. It is part of a portfolio for applying to hardware intern positions at companies like **Arm** and **AMD**.

---

## Completed Features

- **ALU (Arithmetic Logic Unit)**  
  Performs basic arithmetic and logic operations: addition, subtraction, multiplication, division, AND, OR, NOT, XOR, and shift/rotate operations.

- **Carry Flag**  
  Indicates an overflow condition or carry result from arithmetic operations.

- **Zero Flag**  
  Indicates if the result of the operation is zero.

- **Testbenches**  
  Includes simulation files for unit testing the ALU and verifying the operations through **Vivado** simulation.

- **Waveform Results**  
  Provides a detailed analysis of the simulation waveforms generated from each ALU operation.

---

## Folder Structure

**Within `/src` contains the source code for the ALU**  
- `alu.v` – ALU module  

**Within `/sim` contains the testbenches for the ALU**
- `alu_tb.v` – ALU testbench, verifying the correctness of each operation  

**Within `/docs` contains waveform screenshots and documentation**  
- `waveform_mul_div.png` – Screenshot for MUL and DIV operations  
- `waveform_shift_rotate.png` – Screenshot for shift/rotate operations  
- Additional images for future phases (e.g., overflow detection)

**`README.md` – Project documentation**  
**`waveforms.md` – Module-by-module waveform explanations**

---

## Tools Used

- **Language**: Verilog HDL  
- **Simulator**: Xilinx Vivado Simulator (Behavioral Simulation)  
- **Editor**: Visual Studio Code  
- **Version Control**: Git & GitHub  

---

## Simulation Waveforms

Detailed waveform documentation is available here:  
[waveforms.md](waveforms.md)

---

## Next Steps

- Migrate project to **SystemVerilog** for cleaner syntax and stronger verification support  
- Build a **UVM (Universal Verification Methodology)** testbench environment for scalable testing  
- Create **architecture diagrams** and populate `/docs` with waveform screenshots exported from Vivado  
- Extend instruction set and expand control logic for additional opcodes  
- Integrate additional features such as memory-mapped I/O or pipelining  
---

## Goals

- Learn digital design principles through simulation-based development  
- Build and verify a fully functional, simulation-only ALU  
- Demonstrate Verilog, Git, and verification skills for hardware internship placements  
- Prepare for industry-standard **SystemVerilog/UVM workflows**

