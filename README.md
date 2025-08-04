# Exploring PolkaVM

Exploration regards v0.26.0 of PolkaVM and is up-to-date with Summer 2025

## Resources

- https://use.ink

- https://use.ink/docs/v6/

- https://github.com/novasamatech/substrate-sdk-ios

- https://github.com/novasamatech/substrate-sdk-android

- https://github.com/paritytech/polkavm

- https://github.com/paritytech/subxt

- https://protocol.berlin/

## Notes

- PolkaVM, RISC-V based virtual machine https://github.com/paritytech/polkavm

- Revive recompiler, LLVM-based EVM to RISC-V recompiler

- As of August 2025, PolkaVM smart contracts with Ethereum compatibility are in early-stage development and may be unstable or incomplete.

- CoreVM, like Docker but for PolkaVM. It can run (mostly) unmodified native applications (like Doom or Quake)

- If planning to scale with zK, then zkVMs are the best choice, not PolkaVM nor RISC-V

- An alternative to zK is scaling with, shared economic security and proactive block validation

### PolkaVM notes

- RISC-V based virtual machine

- 64-bit registers, 4KB paged 32-bit address space

- Harvard Architecture: No program bytecode into memory, No self-modifying code

- Guaranteed to be 100% deterministic

- Guaranteed linear-time `O(n)` recompilation

- It's "RISC-V based" because, at some point, it eliminates all the instructions that it doesn't need to support or execute (floating point, atomics, SIMD, etc...)

- Continuations : Execution of a program over multiple blocks, if they reachthe gas limit or reach the block limit. All the state/stack/registers/memory is stored in a non-persistent DA layer. When the next block starts, the program can keep executing where it left off. It's made possible thanks to having an Addressable Stack.

- Has Formal Specification


### Revive Compiler notes

- Solidity can be compiled to YUL, an intermediate representation for the EVM. Revive compiles the YUL IR to LLVM IR. LLVM compiler can then target RISC-V, and thus the PolkaVM.

## Instructions

### With Docker

```bash
git clone https://github.com/Neal-C/exploring_polkavm.git
```

```bash
cd exploring_polkavm
```

```bash
docker build -t neal-c-polkavm:latest .
```

```bash
docker run --name neal-c-polkavm neal-c-polkavm:latest
```

### With local installation

https://use.ink/docs/v6/getting-started/setup/

cargo-contract : 

```bash
cargo install --locked --git https://github.com/use-ink/cargo-contract
```

Requirements: Rust >= 1.88.0 && cargo-contract 5.0.3


```bash
git clone https://github.com/Neal-C/exploring_polkavm.git
```

```bash
cd exploring_polkavm
```

```bash
cargo contract build
```

```bash
cargo contract test
```