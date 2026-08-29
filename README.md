# RTL Datapath and Pipelining

RTL design experiments covering datapaths, registers, ALU design, and pipelining using Verilog.

## Current Work

### 1. 4-bit ALU + Result Register

The `alu_datapath` module implements a 4-bit combinational ALU followed by a clocked result register.

| `alu_ctrl` | Operation |
|---|---|
| `2'b00` | A + B |
| `2'b01` | A - B |
| `2'b10` | A & B |
| `2'b11` | A \| B |

The result register updates on the rising edge of `clk` when `ena` is asserted.

### 2. Two-Stage Pipelined Datapath

The `pipelined_datapath` module implements:

`result = (A + B) * C`

The datapath is divided into two pipeline stages:

```text
Stage 1                    Stage 2
A,B -> ADD -> [sum] -> MULT -> [result]
                  ^       ^
                  |       |
C ------------ [c_reg] --+
```

`C` is registered alongside the sum so that the operands belonging to the same operation remain aligned in the pipeline.

The pipeline demonstrates:

- Pipeline registers
- Latency vs. throughput
- Non-blocking assignments in sequential RTL
- Overlapping independent operations
- Datapath timing and stage separation

## Simulation

Testbenches are provided under `tb/` for both designs. The pipelined testbench verifies:

- `(2+3)*4 = 20`
- `(5+1)*2 = 12`
- `(4+2)*3 = 18`

The expected results appear after the pipeline latency.

## Repository Structure

```text
rtl-datapath-and-pipelining/
├── rtl/
│   ├── alu_datapath.v
│   └── pipelined_datapath.v
├── tb/
│   ├── tb_alu_datapath.v
│   └── tb_pipelined_datapath.v
└── README.md
```

## Learning Roadmap

- [x] Basic ALU + register datapath
- [x] Two-stage pipelined datapath
- [ ] Pipeline hazards
- [ ] Stalling and forwarding
- [ ] More advanced datapath/control architectures
- [ ] Register interfaces
- [ ] Memory-mapped I/O
- [ ] Bus fundamentals
- [ ] RISC-V datapath and pipeline
