# 32bitCPU
32-bit pipelined CPU using RISC-V architecture. Created using VHDL in Intel Quartus 22.1, implemented on the DE-10 Nano.

Instructions implemented:
Upper Immediate: LUI, AUIPC \n
Jump: JAL, JALR \n
Branch: BEQ, BNE, BLT, BGE, BLTU, BGEU \n
Load: LB, LH, LW, LBU, LHU \n
Store: SB, SH, SW \n
Arithmetic with Immediate: ADDI, SLTI, SLTIO, XORI, ORI, ANDI, SLLI, SRLI, SRAI \n
Arithmetic: ADD, SUJB, SLL, SLT, SLTU, XOR, SRL, SRA, OR, AND \n

Project Layout: \n
/src \t -> VHDL source files \n
/test \t -> testbenches \n
/programs \t -> RV32I test programs placed in memory initialization files \n
/docs \t -> Waveforms of test programs, FPGA demo video, block diagrams \n

Testing: \n
Testbenches in /test use programs stored in /programs to test various functionalities \n
Automated test cases are checked when different testbenches ran \n
Waveforms of programs included in /docs for further verification \n

Documentation: \n
Waveforms (add link to image gallery) \n
Demo video (add link to showcase video) \n
Block Diagram (add image) \n

Using this Project: \n
1. Clone the repository \n
2. Open the project, 32bitCPU.qpf, in Quartus Prime 22.1 \n 
3. Update the CPUMIF.mif file to contain the desired program \n
4. Compile the project \n 
5. Program the project to the DE-10 Nano \n