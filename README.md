# 🖥️ 32-bit 5-Stage Pipelined RISC Processor in Verilog

A simplified **32-bit RISC Processor** implemented in **Verilog HDL** using a **5-stage instruction pipeline**. This project demonstrates the fundamentals of pipelined processor design, including instruction execution, register file operations, memory access, and write-back.

> **Educational Project** – Designed for learning computer architecture, digital design, and Verilog HDL.

---

## ✨ Features

* ✅ 32-bit RISC architecture
* ✅ 5-stage instruction pipeline
* ✅ Separate instruction and data memory
* ✅ Register file with 32 general-purpose registers
* ✅ Support for Arithmetic, Logical, Load/Store, and Branch instructions
* ✅ Two-phase clock implementation (`clk1` and `clk2`)
* ✅ Behavioral Verilog implementation
* ✅ Simulation testbench included

---

## 🏗️ Processor Architecture

The processor follows a classic **5-stage pipeline**:

```
             +----------------+
             | Instruction    |
             | Fetch (IF)     |
             +----------------+
                     |
                     v
             +----------------+
             | Instruction    |
             | Decode (ID)    |
             +----------------+
                     |
                     v
             +----------------+
             | Execute (EX)   |
             +----------------+
                     |
                     v
             +----------------+
             | Memory Access  |
             | (MEM)          |
             +----------------+
                     |
                     v
             +----------------+
             | Write Back     |
             | (WB)           |
             +----------------+
```

---

## 📂 Repository Structure

```
.
├── RISC.v              # 32-bit pipelined RISC processor
├── testbench.v         # Simulation testbench
├── README.md
```

---

## ⚙️ Pipeline Stages

### 1️⃣ Instruction Fetch (IF)

* Fetches instruction from instruction memory.
* Updates Program Counter (PC).
* Handles branch redirection.

Registers Used:

* `IF_ID_IR`
* `IF_ID_NPC`

---

### 2️⃣ Instruction Decode (ID)

* Decodes opcode.
* Reads operands from register file.
* Generates immediate value.
* Determines instruction type.

Registers Used:

* `ID_EX_A`
* `ID_EX_B`
* `ID_EX_IR`
* `ID_EX_IMM`
* `ID_EX_TYPE`

---

### 3️⃣ Execute (EX)

Performs:

* Arithmetic operations
* Logical operations
* Immediate arithmetic
* Branch condition evaluation
* Address calculation

Registers Used:

* `EX_MEM_ALUOUT`
* `EX_MEM_IR`
* `EX_MEM_TYPE`

---

### 4️⃣ Memory Access (MEM)

Performs:

* Memory Read
* Memory Write
* Passes ALU result forward

Registers Used:

* `MEM_WB_ALUOUT`
* `MEM_WB_LMD`
* `MEM_WB_IR`

---

### 5️⃣ Write Back (WB)

Writes results back into the register file.

Supported write-back operations:

* ALU Results
* Load Instructions

---

## 📖 Supported Instruction Set

### Register-Register ALU Instructions

| Instruction | Description    |
| ----------- | -------------- |
| ADD         | Addition       |
| SUB         | Subtraction    |
| AND         | Bitwise AND    |
| OR          | Bitwise OR     |
| SLT         | Set Less Than  |
| MUL         | Multiplication |

---

### Register-Immediate Instructions

| Instruction | Description             |
| ----------- | ----------------------- |
| ADDI        | Add Immediate           |
| SUBI        | Subtract Immediate      |
| SLTI        | Set Less Than Immediate |

---

### Memory Instructions

| Instruction | Description |
| ----------- | ----------- |
| LW          | Load Word   |
| SW          | Store Word  |

---

### Branch Instructions

| Instruction | Description                 |
| ----------- | --------------------------- |
| BEQZ        | Branch if Equal to Zero     |
| BNEQZ       | Branch if Not Equal to Zero |

---

### System Instruction

| Instruction | Description    |
| ----------- | -------------- |
| HLT         | Halt Processor |

---

## 📋 Register File

* **32 General Purpose Registers**
* Register Width: **32 bits**

```verilog
reg [31:0] REG[0:31];
```

---

## 💾 Memory

```
1024 Words
Word Size = 32 bits
```

```verilog
reg [31:0] MEM[0:1023];
```

Memory is used for both instructions and data.

---

## 🧪 Test Program

The included testbench initializes the processor with a simple program:

```assembly
ADDI R1, R0, 10
ADDI R2, R0, 20
ADDI R3, R0, 25
ADD  R4, R1, R2
ADD  R5, R4, R3
HLT
```

Expected Register Values:

| Register | Value |
| -------- | ----: |
| R1       |    10 |
| R2       |    20 |
| R3       |    25 |
| R4       |    30 |
| R5       |    55 |

---

## ▶️ Simulation

### Using Xilinx Vivado

1. Create a new RTL project.
2. Add `RISC.v` and `testbench.v`.
3. Set `testbench` as the simulation top module.
4. Run **Behavioral Simulation**.
5. Observe register values in the console and inspect waveforms.

### Using Icarus Verilog

```bash
iverilog -o risc_sim RISC.v testbench.v
vvp risc_sim
```

(Optional) View waveforms:

```bash
gtkwave dump.vcd
```

---

## 📌 Current Implementation

* ✔️ 5-stage pipelined datapath
* ✔️ Instruction fetch
* ✔️ Instruction decode
* ✔️ Execute stage
* ✔️ Memory stage
* ✔️ Write-back stage
* ✔️ Register file
* ✔️ Arithmetic instructions
* ✔️ Immediate instructions
* ✔️ Load/Store support
* ✔️ Branch support
* ✔️ Halt instruction

---

## 🚀 Possible Future Improvements

* Data forwarding (bypassing)
* Hazard detection unit
* Pipeline stall logic
* Branch prediction
* Jump and Call instructions
* Separate instruction and data caches
* Exception and interrupt handling
* Comprehensive verification testbench with assertions and randomized tests
* Support for additional instructions (XOR, NOR, Shift, Divide, etc.)

---

## 📚 Learning Outcomes

This project demonstrates:

* Verilog HDL design
* Processor datapath implementation
* Pipeline architecture
* Register-transfer level (RTL) design
* Instruction execution flow
* Memory interface
* Computer architecture fundamentals
* Simulation and verification

---

## 👨‍💻 Author

**Akrit Chauhan**

* B.Tech – Electronics & Communication Engineering
* Indian Institute of Information Technology (IIIT) Una

If you found this project useful, consider giving the repository a ⭐ on GitHub!
