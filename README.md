# MIPS Single-Cycle Processor (VHDL)

This project implements a simplified MIPS single-cycle processor using VHDL and is tested using Xilinx ISE. It models the core components of the MIPS architecture including the datapath, control unit, and ALU, and supports a basic instruction set for simulation and educational purposes.


## 📌 Overview
The processor follows the classic single-cycle MIPS architecture, executing each instruction in one clock cycle. It supports basic instruction types including R-type and I-type instructions.

### 🔧 Features

- **Instruction Set Supported**:
  - R-type: `add`, `sub`, `and`, `or`, `slt`
  - I-type: `lw`, `sw`, `beq`, `addi`
- **Modules Implemented**:
  - Program Counter (PC)
  - Instruction Memory
  - Register File
  - ALU
  - Data Memory
  - Control Unit
  - Sign Extend
  - Shift Left
  - MUXes

## 📚 Documentation

A PDF file is included in the repository:
- ✅ Contains VHDL **code snippets** for each component.
- 📊 Shows the **hierarchical structure** of the entire MIPS processor design.

## 🧠 Architecture Overview

The design follows the classic single-cycle MIPS processor model:

- **Datapath Components**: Register file, ALU, instruction memory, data memory, PC
- **Control Unit**: Generates control signals based on opcode and funct fields
- **Execution**: Each instruction is completed in a single clock cycle

<img src="https://github.com/user-attachments/assets/ae563fbc-b13c-4655-b9bf-4b0b5a81f9da" width="600">

## 📂 Project Structure

```
MIPS-Single-Cycle-Processor-VHDL/
│
├── Project/                # VHDL source files
│   ├── Adder_32.vhd
│   ├── alu.vhd
│   ├── ALUCTRL.vhd
│   ├── ControlUnit.vhd
│   ├── instruction_memo.vhd
│   ├── instruction_to_reg.vhd
│   ├── memory.vhd
│   ├── MIPS.vhd
│   ├── mux.vhd
│   ├── PC.vhd
│   ├── Registers.vhd
│   ├── shifter_26_28.vhd
│   ├── shifter_32_32.vhd
│   └── sign_extend.vhd
│
├── Project/          # Testbenches
│   ├── alu_control_test.vhd
│   ├── alu_test.vhd
│   ├── ControlUnit_tset.vhd
│   ├── memo_test.vhd
│   ├── MIPS_Test.vhd
│   ├── muxTest.vhd
│   ├── RegTest.vhd
│

│
└── README.md
```
## 🛠️ Tools Used

- **Language**: VHDL
- **Simulation Tool**: Xilinx ISE Simulator
- **Testbench**: Custom VHDL testbench with sample instructions

## 🚀 How to Run

1. Open Xilinx ISE.
2. Create a new project and add all VHDL source files.
3. Set the top-level module as the main processor entity.
4. Add the testbench and run simulation.
5. Observe outputs and waveform to validate execution.

   
### 📥 Sample Test Program

Below is a sequence of MIPS instructions used to test the processor, along with their corresponding hexadecimal machine code:

| Assembly Instruction                | Machine Code |
| ----------------------------------- | ------------ |
| `add $v0, $a0, $a1`                 | `0x00851020` |
| `sw $v0, 8($zero)`                  | `0xAC020008` |
| `lw $a2, 8($zero)`                  | `0x8C060008` |
| `beq $v0, $a2, Good_Processor`      | `0x10460001` |
| `slt $s1, $v0, $a2`                 | `0x0046882A` |
| `Good_Processor: sub $s1, $a1, $a0` | `0x00A48822` |

These instructions test:

* **R-type execution** (`add`, `sub`, `slt`)
* **Memory access** (`lw`, `sw`)
* **Branch evaluation** (`beq`)

They serve as a functional benchmark to validate correct operation of all core components.


### 📊 Waveform Outputs
<img src="https://github.com/user-attachments/assets/c196a228-0072-48e6-969b-11505bf3314d" width="600">
<img src="https://github.com/user-attachments/assets/8f19726e-2536-4cc0-b204-db4023eef5f9" width="600">

## 📜 License

This project is licensed under the [MIT License](LICENSE).

## 🙌 Acknowledgements

- Based on the architecture taught in *Computer Organization and Design* by David A. Patterson & John L. Hennessy.
- MIPS architecture references adapted from educational sources and documentation.

---

Feel free to fork, clone, or contribute to improve this MIPS implementation!
