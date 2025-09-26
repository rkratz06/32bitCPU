# 32bitCPU
32-bit pipelined CPU using RISC-V architecture. Created using VHDL in Intel Quartus 22.1, implemented on the DE-10 Nano.

Instructions implemented:
Upper Immediate: LUI, AUIPC
Jump: JAL, JALR
Branch: BEQ, BNE, BLT, BGE, BLTU, BGEU
Load: LB, LH, LW, LBU, LHU
Store: SB, SH, SW
Arithmetic with Immediate: ADDI, SLTI, SLTIO, XORI, ORI, ANDI, SLLI, SRLI, SRAI
Arithmetic: ADD, SUJB, SLL, SLT, SLTU, XOR, SRL, SRA, OR, AND

Project Layout:
/src -> VHDL source files
/test -> testbenches
/programs -> RV32I test programs placed in memory initialization files
/docs -> Waveforms of test programs, FPGA demo video, block diagrams

Testing:
Testbenches in /test use programs stored in /programs to test various functionalities
Automated test cases are checked when different testbenches ran
Waveforms of programs included in /docs for further verification

Documentation:
Waveforms (add link to image gallery)
Demo video (add link to showcase video)

Using this Project:
1. Clone the repository
2. Open the project, /src/32bitCPU.qpf, in Quartus Prime 22.1
3. Update the CPUMIF.mif file to contain the desired program
4. Compile the project
5. Program the project to the DE-10 Nano