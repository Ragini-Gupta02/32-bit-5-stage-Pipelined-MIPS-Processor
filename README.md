# 32-bit-5-stage-Pipelined-MIPS-Processor

This project implements a 32-bit, 5-stage pipelined processor coded in Verilog. The processor is designed to efficiently handle arithmetic and logical operations by leveraging a pipelined architecture, which improves instruction throughput. The pipeline stages include:

1. Instruction Fetch (IF): Retrieves instructions from memory.
2. Instruction Decode (ID): Decodes the instruction and reads registers.
3. Execution (EX): Performs arithmetic and logical operations.
4. Memory Access (MEM): Accesses memory for load and store instructions.
5. Write Back (WB): Writes results back to the register file.

By breaking down the instruction execution process into these five stages, the processor can execute multiple instructions simultaneously, increasing overall performance and efficiency.
