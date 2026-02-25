# OpenTaalas

Open-source ASIC for LLM inference, inspired by [Taalas](https://taalas.com).

## Status

Early exploration — architecture definition and physical design feasibility studies.

## Project Structure

```
rtl/
  chisel/        # Scala/Chisel source
  kanagawa/      # Kanagawa HLS source
  generated/     # Output SV from both tools
third-party/
  kanagawa/      # Kanagawa compiler (git submodule)
flow/            # OpenROAD flow scripts and configs
constraints/     # SDC timing constraints
docs/            # Architecture notes and analysis
scripts/         # Helper scripts
```

## HDL Stack

- [Chisel](https://www.chisel-lang.org/) — Scala-based HDL for structural RTL
- [Kanagawa](https://github.com/microsoft/kanagawa) — Microsoft HLS with Wavefront Threading for accelerator blocks

## License

TBD
