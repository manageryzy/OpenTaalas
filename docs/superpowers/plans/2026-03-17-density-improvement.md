# Density Improvement Implementation Plan

> **For agentic workers:** REQUIRED: Use superpowers:subagent-driven-development (if subagents available) or superpowers:executing-plans to implement this plan. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Reduce macro-bearing die area from ~108 mm² to ~51.5 mm² by folding the nor_rom_65536x192 macro (344:1 → 1.6:1 aspect ratio) and shrinking all dies with proper routing margins.

**Architecture:** The ROM compiler gets a `--fold` parameter that physically rearranges tall/narrow ROM arrays into wider/shorter ones with internal column muxing. A wrapper Verilog module preserves the original interface while instantiating the wider physical blackbox. Die sizes are then co-optimized per module.

**Tech Stack:** Python (ROM compiler), SystemVerilog (wrapper + blackbox), Tcl (macro placement), Make (ORFS config)

**Spec:** `docs/superpowers/specs/2026-03-17-density-improvement-design.md`

---

## Chunk 1: ROM Compiler Folding

### Task 1: Add fold_factor to RomSpec and dimension calculations

**Files:**
- Modify: `tools/rom_compiler/nor_rom_compiler.py:48-79` (RomSpec class)

- [ ] **Step 1: Add fold_factor field and physical dimension properties to RomSpec**

Add `fold` field (default 1) and physical row/col/dimension properties:

```python
@dataclass
class RomSpec:
    name: str
    rows: int
    cols: int
    fold: int = 1

    @property
    def phys_rows(self) -> int:
        return self.rows // self.fold

    @property
    def phys_cols(self) -> int:
        return self.cols * self.fold

    @property
    def phys_name(self) -> str:
        if self.fold > 1:
            return f"{self.name}_phys"
        return self.name

    @property
    def bits(self) -> int:
        return self.rows * self.cols

    @property
    def addr_width(self) -> int:
        return max(1, math.ceil(math.log2(self.rows)))

    @property
    def phys_addr_width(self) -> int:
        return max(1, math.ceil(math.log2(self.phys_rows)))

    @property
    def fold_sel_bits(self) -> int:
        return max(1, math.ceil(math.log2(self.fold))) if self.fold > 1 else 0

    @property
    def width_um(self) -> float:
        core = self.phys_cols * BITCELL_WIDTH
        return core + ROW_DECODER_WIDTH + 2 * GUARD_RING

    @property
    def height_um(self) -> float:
        core = self.phys_rows * BITCELL_HEIGHT
        return core + COL_MUX_HEIGHT + 2 * GUARD_RING

    @property
    def area_mm2(self) -> float:
        return self.width_um * self.height_um / 1e6

    @property
    def leakage_uw(self) -> float:
        return self.bits / 1024 * LEAKAGE_PER_KBIT
```

- [ ] **Step 2: Verify dimension calculations manually**

Run Python interactively:

```bash
cd /home/mana/workspace/OpenTaalas
python3 -c "
from tools.rom_compiler.nor_rom_compiler import RomSpec
s = RomSpec('nor_rom_65536x192', 65536, 192, fold=16)
print(f'phys: {s.phys_rows}x{s.phys_cols}')
print(f'size: {s.width_um:.1f} x {s.height_um:.1f} um')
print(f'ratio: {s.height_um/s.width_um:.1f}:1')
print(f'phys_name: {s.phys_name}')
print(f'addr: {s.addr_width}b, phys_addr: {s.phys_addr_width}b, sel: {s.fold_sel_bits}b')
"
```

Expected output:
```
phys: 4096x3072
size: 1427.1 x 2223.8 um
ratio: 1.6:1
phys_name: nor_rom_65536x192_phys
addr: 16b, phys_addr: 12b, sel: 4b
```

- [ ] **Step 3: Validate fold=1 gives same dimensions as before**

```bash
python3 -c "
from tools.rom_compiler.nor_rom_compiler import RomSpec
s = RomSpec('nor_rom_1024x880', 1024, 880)
print(f'size: {s.width_um:.1f} x {s.height_um:.1f} um')
print(f'phys_name: {s.phys_name}')
"
```

Expected: `size: 418.8 x 565.0 um` and `phys_name: nor_rom_1024x880` (same name when fold=1).

- [ ] **Step 4: Commit**

```bash
git add tools/rom_compiler/nor_rom_compiler.py
git commit -m "feat(rom-compiler): add fold_factor to RomSpec for physical array folding"
```

---

### Task 2: Generate folded wrapper Verilog

**Files:**
- Modify: `tools/rom_compiler/nor_rom_compiler.py` (add `generate_wrapper` function)

- [ ] **Step 1: Add wrapper generation function**

Add after `generate_verilog_blackbox()` (~line 535):

```python
def generate_folded_wrapper(spec: RomSpec) -> str:
    """Generate wrapper module that instantiates folded physical ROM + column mux.

    Wrapper keeps the original interface (addr_width, cols) but internally reads
    a wider physical ROM and muxes the correct slice.
    """
    if spec.fold <= 1:
        return ""

    addr_w = spec.addr_width
    phys_addr_w = spec.phys_addr_width
    sel_bits = spec.fold_sel_bits
    phys_cols = spec.phys_cols

    lines = []
    lines.append(f'// Folded wrapper for {spec.name}')
    lines.append(f'// Logical: {spec.rows} rows x {spec.cols} cols')
    lines.append(f'// Physical: {spec.phys_rows} rows x {phys_cols} cols (fold={spec.fold})')
    lines.append(f'// addr[{addr_w-1}:{phys_addr_w}] selects fold bank, addr[{phys_addr_w-1}:0] selects row')
    lines.append(f'module {spec.name} (')
    lines.append(f'  input  wire              clk,')
    lines.append(f'  input  wire              ce,')
    lines.append(f'  input  wire [{addr_w-1:>3d}:0] addr,')
    lines.append(f'  output wire [{spec.cols-1:>3d}:0] dout')
    lines.append(f');')
    lines.append(f'')
    lines.append(f'  // Split address: upper bits select fold bank, lower bits select physical row')
    lines.append(f'  wire [{phys_addr_w-1}:0] phys_addr = addr[{phys_addr_w-1}:0];')
    lines.append(f'  wire [{sel_bits-1}:0] fold_sel = addr[{addr_w-1}:{phys_addr_w}];')
    lines.append(f'')
    lines.append(f'  // Physical ROM read — full width')
    lines.append(f'  wire [{phys_cols-1}:0] phys_dout;')
    lines.append(f'  {spec.phys_name} u_phys_rom (')
    lines.append(f'    .clk  (clk),')
    lines.append(f'    .ce   (ce),')
    lines.append(f'    .addr (phys_addr),')
    lines.append(f'    .dout (phys_dout)')
    lines.append(f'  );')
    lines.append(f'')
    lines.append(f'  // Register fold_sel to align with ROM output (1-cycle read latency)')
    lines.append(f'  reg [{sel_bits-1}:0] fold_sel_r;')
    lines.append(f'  always @(posedge clk) begin')
    lines.append(f'    if (ce)')
    lines.append(f'      fold_sel_r <= fold_sel;')
    lines.append(f'  end')
    lines.append(f'')
    lines.append(f'  // Column mux: select the correct {spec.cols}-bit slice')
    lines.append(f'  assign dout = phys_dout[fold_sel_r * {spec.cols} +: {spec.cols}];')
    lines.append(f'')
    lines.append(f'endmodule')
    return '\n'.join(lines) + '\n'
```

- [ ] **Step 2: Verify wrapper generation**

```bash
python3 -c "
from tools.rom_compiler.nor_rom_compiler import RomSpec, generate_folded_wrapper
s = RomSpec('nor_rom_65536x192', 65536, 192, fold=16)
print(generate_folded_wrapper(s))
"
```

Expected: A valid SystemVerilog module `nor_rom_65536x192` with:
- `addr[15:0]` input, `dout[191:0]` output
- Instantiates `nor_rom_65536x192_phys` with `addr[11:0]`, `dout[3071:0]`
- Registered `fold_sel_r[3:0]` for column mux alignment
- `dout = phys_dout[fold_sel_r * 192 +: 192]`

- [ ] **Step 3: Commit**

```bash
git add tools/rom_compiler/nor_rom_compiler.py
git commit -m "feat(rom-compiler): add generate_folded_wrapper for column-muxed ROMs"
```

---

### Task 3: Update generate_all and CLI for folded macros

**Files:**
- Modify: `tools/rom_compiler/nor_rom_compiler.py:81-87` (PREDEFINED list)
- Modify: `tools/rom_compiler/nor_rom_compiler.py:538-589` (generate_all + main)

- [ ] **Step 1: Update PREDEFINED list with fold factors**

```python
PREDEFINED = [
    RomSpec("nor_rom_1024x880", 1024, 880),
    RomSpec("nor_rom_4096x1024", 4096, 1024),
    RomSpec("nor_rom_4096x192", 4096, 192, fold=2),
    RomSpec("nor_rom_65536x192", 65536, 192, fold=16),
]
```

Note: `nor_rom_4096x192` is folded 2× per spec (21.8:1 → 5.9:1). No design currently references it, but the collateral is generated for future use.

- [ ] **Step 2: Update generate_all to handle folded macros**

When `fold > 1`, generate_all must:
1. Generate physical blackbox (`_phys` name) with LEF/LIB/GDS/bb.v
2. Generate the wrapper module as a separate `.v` file (NOT `.bb.v`)
3. Delete old unfolded collateral if it exists

Replace `generate_all`:

```python
def generate_all(spec: RomSpec, output_dir: str):
    """Generate all collateral for a ROM macro."""
    os.makedirs(output_dir, exist_ok=True)

    if spec.fold > 1:
        # Generate physical macro collateral (wider, shorter array)
        phys_spec = RomSpec(spec.phys_name, spec.phys_rows, spec.phys_cols)
        lib_path = os.path.join(output_dir, f'{phys_spec.name}.lib')
        lef_path = os.path.join(output_dir, f'{phys_spec.name}.lef')
        gds_path = os.path.join(output_dir, f'{phys_spec.name}.gds')
        bb_path = os.path.join(output_dir, f'{phys_spec.name}.bb.v')

        with open(lib_path, 'w') as f:
            f.write(generate_liberty(phys_spec))
        with open(lef_path, 'w') as f:
            f.write(generate_lef(phys_spec))
        generate_gds(phys_spec, gds_path)
        with open(bb_path, 'w') as f:
            f.write(generate_verilog_blackbox(phys_spec))

        # Generate wrapper (same logical interface, instantiates physical ROM)
        wrapper_path = os.path.join(output_dir, f'{spec.name}.v')
        with open(wrapper_path, 'w') as f:
            f.write(generate_folded_wrapper(spec))

        # Remove old unfolded collateral if it exists
        for ext in ['.lib', '.lef', '.gds', '.bb.v']:
            old = os.path.join(output_dir, f'{spec.name}{ext}')
            if os.path.exists(old):
                os.remove(old)
                print(f"    Removed old: {old}")

        print(f"  {spec.name} (folded {spec.fold}x):")
        print(f"    Logical: {spec.rows}x{spec.cols}  Physical: {spec.phys_rows}x{spec.phys_cols}")
        print(f"    Phys size: {phys_spec.width_um:.1f} x {phys_spec.height_um:.1f} µm")
        print(f"    Ratio: {phys_spec.height_um/phys_spec.width_um:.1f}:1")
        print(f"    Files: {lib_path} {lef_path} {gds_path} {bb_path} {wrapper_path}")
    else:
        lib_path = os.path.join(output_dir, f'{spec.name}.lib')
        lef_path = os.path.join(output_dir, f'{spec.name}.lef')
        gds_path = os.path.join(output_dir, f'{spec.name}.gds')
        bb_path = os.path.join(output_dir, f'{spec.name}.bb.v')

        with open(lib_path, 'w') as f:
            f.write(generate_liberty(spec))
        with open(lef_path, 'w') as f:
            f.write(generate_lef(spec))
        generate_gds(spec, gds_path)
        with open(bb_path, 'w') as f:
            f.write(generate_verilog_blackbox(spec))

        print(f"  {spec.name}:")
        print(f"    Rows={spec.rows}  Cols={spec.cols}  Bits={spec.bits/1024:.1f}K")
        print(f"    Addr={spec.addr_width}b  Area={spec.area_mm2:.3f} mm²")
        print(f"    Size={spec.width_um:.1f} x {spec.height_um:.1f} µm")
        print(f"    Files: {lib_path} {lef_path} {gds_path} {bb_path}")
```

- [ ] **Step 3: Add --fold CLI argument**

Update `main()`:

```python
def main():
    parser = argparse.ArgumentParser(description='NOR ROM Compiler for sky130hd')
    parser.add_argument('--name', help='Macro name')
    parser.add_argument('--rows', type=int, help='Number of rows')
    parser.add_argument('--cols', type=int, help='Number of columns (data width)')
    parser.add_argument('--fold', type=int, default=1, help='Fold factor (default: 1)')
    parser.add_argument('--all', action='store_true', help='Generate all predefined macros')
    parser.add_argument('--output-dir', default='flow/macros/sky130hd',
                        help='Output directory for generated files')
    args = parser.parse_args()

    if args.all:
        print("Generating all predefined NOR ROM macros:")
        for spec in PREDEFINED:
            generate_all(spec, args.output_dir)
        print(f"\nGenerated {len(PREDEFINED)} macros in {args.output_dir}/")
    elif args.name and args.rows and args.cols:
        spec = RomSpec(args.name, args.rows, args.cols, fold=args.fold)
        generate_all(spec, args.output_dir)
    else:
        parser.print_help()
        sys.exit(1)
```

- [ ] **Step 4: Commit**

```bash
git add tools/rom_compiler/nor_rom_compiler.py
git commit -m "feat(rom-compiler): update generate_all and CLI for folded macro output"
```

---

### Task 4: Regenerate all macro collateral

**Files:**
- Delete: `flow/macros/sky130hd/nor_rom_65536x192.bb.v`
- Delete: `flow/macros/sky130hd/nor_rom_65536x192.lef`
- Delete: `flow/macros/sky130hd/nor_rom_65536x192.lib`
- Delete: `flow/macros/sky130hd/nor_rom_65536x192.gds`
- Create: `flow/macros/sky130hd/nor_rom_65536x192_phys.bb.v`
- Create: `flow/macros/sky130hd/nor_rom_65536x192_phys.lef`
- Create: `flow/macros/sky130hd/nor_rom_65536x192_phys.lib`
- Create: `flow/macros/sky130hd/nor_rom_65536x192_phys.gds`
- Create: `flow/macros/sky130hd/nor_rom_65536x192.v` (wrapper)

- [ ] **Step 1: Run the compiler with --all**

```bash
cd /home/mana/workspace/OpenTaalas
python3 tools/rom_compiler/nor_rom_compiler.py --all --output-dir flow/macros/sky130hd/
```

Expected output should show:
- `nor_rom_1024x880`: 418.8 x 565.0 µm (unchanged)
- `nor_rom_4096x1024`: 485.0 x 2223.8 µm (unchanged)
- `nor_rom_4096x192`: 102.3 x 2223.8 µm (unchanged)
- `nor_rom_65536x192 (folded 16x)`: Physical 4096x3072, 1427.1 x 2223.8 µm, ratio 1.6:1

- [ ] **Step 2: Verify old unfolded files are gone**

```bash
ls -la flow/macros/sky130hd/nor_rom_65536x192.*
```

Expected: only `nor_rom_65536x192.v` (wrapper). No `.bb.v`, `.lef`, `.lib`, `.gds`.

- [ ] **Step 3: Verify new physical macro files exist**

```bash
ls -la flow/macros/sky130hd/nor_rom_65536x192_phys.*
```

Expected: `.bb.v`, `.lef`, `.lib`, `.gds` — four files.

- [ ] **Step 4: Verify LEF dimensions**

```bash
grep 'SIZE' flow/macros/sky130hd/nor_rom_65536x192_phys.lef
```

Expected: `SIZE 1427.xxx BY 2224.xxx ;` (approximately 1427 × 2224 µm).

- [ ] **Step 5: Commit**

```bash
git add -A flow/macros/sky130hd/nor_rom_65536x192*
git commit -m "feat(macros): regenerate nor_rom_65536x192 as folded 16x (1427x2224 µm)"
```

---

### Task 5: Update kanagawa_runtime_sky130.mk to include wrapper

**Files:**
- Modify: `flow/designs/kanagawa_runtime_sky130.mk:10-31`

The wrapper file (`nor_rom_65536x192.v`) is NOT a `.bb.v` file, so the `MACRO_BB` wildcard (`*.bb.v`) won't pick it up. Add a `MACRO_WRAPPERS` variable that picks up `.v` files while excluding `.bb.v` files.

- [ ] **Step 1: Add MACRO_WRAPPERS to kanagawa_runtime_sky130.mk**

After the `MACRO_BB` line (line 42), add:

```makefile
# Folded ROM wrapper modules (synthesizable, not blackbox)
MACRO_WRAPPERS = $(filter-out %.bb.v,$(wildcard $(_macros_dir)/*.v))
```

Then add `$(MACRO_WRAPPERS)` to the end of the `KANAGAWA_RUNTIME_SV` list (after `hal_dual_port_ram.sv`):

```makefile
  $(_project)/rtl/hal/sky130/hal_dual_port_ram.sv \
  $(MACRO_WRAPPERS)
```

This is future-proof — any new folded ROM wrappers (`.v` but not `.bb.v`) in the macros directory will be picked up automatically.

- [ ] **Step 2: Verify the include works**

```bash
cd /home/mana/workspace/OpenTaalas
make -n -f flow/designs/kanagawa_runtime_sky130.mk -p 2>/dev/null | grep nor_rom_65536x192.v || echo "Not found"
```

This is a dry check — the makefile isn't standalone. Just verify the file exists:

```bash
test -f flow/macros/sky130hd/nor_rom_65536x192.v && echo "Wrapper exists" || echo "MISSING"
```

- [ ] **Step 3: Commit**

```bash
git add flow/designs/kanagawa_runtime_sky130.mk
git commit -m "build: add folded ROM wrapper to kanagawa runtime includes"
```

---

### Task 6: Verilator lint on wrapper + physical blackbox

**Files:** (read-only verification)

- [ ] **Step 1: Lint the physical blackbox**

```bash
verilator --lint-only -Wall \
  flow/macros/sky130hd/nor_rom_65536x192_phys.bb.v \
  2>&1 | head -20
```

Expected: Clean (just a blackbox module declaration).

- [ ] **Step 2: Lint the wrapper with physical blackbox**

```bash
verilator --lint-only -Wall \
  flow/macros/sky130hd/nor_rom_65536x192_phys.bb.v \
  flow/macros/sky130hd/nor_rom_65536x192.v \
  2>&1 | head -20
```

Expected: Clean — no warnings or errors. The wrapper instantiates the physical blackbox.

- [ ] **Step 3: Commit (no changes, just verification checkpoint)**

If clean, no commit needed. If warnings, fix and commit.

---

## Chunk 2: Die Resizing — embed_rom and lm_head_demo

These two modules both use the folded `nor_rom_65536x192` (now ~1427×2224 µm). They share the same macro shape, so die sizing is identical.

### Task 7: Resize embed_rom die (600×36000 → 2000×3000)

**Files:**
- Modify: `flow/designs/sky130hd/embed_rom/config.mk:19-20`
- Modify: `flow/designs/sky130hd/embed_rom/macro_place.tcl`

- [ ] **Step 1: Update config.mk die area**

Change:
```makefile
export DIE_AREA  = 0 0 600 36000
export CORE_AREA = 10 10 590 35990
```

To:
```makefile
export DIE_AREA  = 0 0 2000 3000
export CORE_AREA = 10 10 1990 2990
```

- [ ] **Step 2: Update macro_place.tcl for centered placement**

The folded physical macro is `nor_rom_65536x192_phys` (~1427×2224 µm).
Center it in a 2000×3000 die:
- X = (2000 - 1427) / 2 ≈ 287, snap to site grid: 286.58 → 286.580
- Y = (3000 - 2224) / 2 ≈ 388, snap to site grid: 388.16 → 388.160

The HAL module name in the netlist will match the physical macro name `nor_rom_65536x192_phys`. Need to check what instance name the synthesizer gives it.

Actually — the HAL instantiates `nor_rom_65536x192` (the wrapper). The wrapper instantiates `nor_rom_65536x192_phys`. So the macro placement TCL needs to find the `_phys` instance inside the wrapper. The instance path will be something like `<wrapper_inst>/u_phys_rom`.

Rewrite `macro_place.tcl` to find block macros dynamically (same pattern as kv_cache_demo):

```tcl
# Place folded nor_rom_65536x192_phys macro in embed_rom
# Physical macro: ~1427×2224 µm, die: 2000×3000
# Center macro with routing channels on all sides
set block [ord::get_db_block]
set macros {}
foreach inst [$block getInsts] {
    set master [$inst getMaster]
    if {[$master isBlock]} {
        lappend macros [$inst getName]
    }
}
puts "Found [llength $macros] macros:"
foreach m $macros { puts "  '$m'" }

# Expect 1 macro (nor_rom_65536x192_phys)
# Center: X=(2000-1427)/2≈287, Y=(3000-2224)/2≈388
set macros [lsort $macros]
foreach inst_name $macros {
    place_macro -macro_name $inst_name -location "287 388" -orientation R0
}
```

- [ ] **Step 3: Also update VERILOG_FILES to include wrapper**

Check if `config.mk` already includes the wrapper via `KANAGAWA_RUNTIME_SV`. Since we added it to `kanagawa_runtime_sky130.mk` in Task 5, it should be included automatically. Verify:

```bash
grep 'nor_rom_65536x192.v' flow/designs/kanagawa_runtime_sky130.mk
```

If present, no change needed in `config.mk`.

- [ ] **Step 4: Commit**

```bash
git add flow/designs/sky130hd/embed_rom/config.mk flow/designs/sky130hd/embed_rom/macro_place.tcl
git commit -m "feat(embed_rom): resize die 600x36000 → 2000x3000 for folded ROM"
```

---

### Task 8: Resize lm_head_demo die (600×36000 → 2000×3000)

**Files:**
- Modify: `flow/designs/sky130hd/lm_head_demo/config.mk`
- Modify: `flow/designs/sky130hd/lm_head_demo/macro_place.tcl`

- [ ] **Step 1: Update config.mk die area**

Same as embed_rom:
```makefile
export DIE_AREA  = 0 0 2000 3000
export CORE_AREA = 10 10 1990 2990
```

- [ ] **Step 2: Update macro_place.tcl**

Same placement as embed_rom (identical macro):

```tcl
# Place folded nor_rom_65536x192_phys macro in lm_head_demo
# Physical macro: ~1427×2224 µm, die: 2000×3000
set block [ord::get_db_block]
set macros {}
foreach inst [$block getInsts] {
    set master [$inst getMaster]
    if {[$master isBlock]} {
        lappend macros [$inst getName]
    }
}
puts "Found [llength $macros] macros:"
foreach m $macros { puts "  '$m'" }

set macros [lsort $macros]
foreach inst_name $macros {
    place_macro -macro_name $inst_name -location "287 388" -orientation R0
}
```

- [ ] **Step 3: Commit**

```bash
git add flow/designs/sky130hd/lm_head_demo/config.mk flow/designs/sky130hd/lm_head_demo/macro_place.tcl
git commit -m "feat(lm_head_demo): resize die 600x36000 → 2000x3000 for folded ROM"
```

---

## Chunk 3: Die Resizing — mac_array, rope, vector_unit

### Task 9: Resize mac_array die (3000×3000 → 1500×3000)

**Files:**
- Modify: `flow/designs/sky130hd/mac_array/config.mk:19-20`
- Modify: `flow/designs/sky130hd/mac_array/macro_place.tcl`

The nor_rom_1024x880 macro is ~419×565 µm (unchanged, no folding needed).

- [ ] **Step 1: Update config.mk die area and add GRT flags**

```makefile
export DIE_AREA  = 0 0 1500 3000
export CORE_AREA = 10 10 1490 2990
```

Also add GRT flags if not already present (the current mac_array config.mk lacks these, and they're needed at 50% area reduction):

```makefile
export GLOBAL_ROUTE_ARGS = -congestion_iterations 30 -congestion_report_iter_step 5 -verbose -allow_congestion
export SKIP_INCREMENTAL_REPAIR = 1
export RECOVER_POWER = 0
export SKIP_ANTENNA_REPAIR = 1
```

- [ ] **Step 2: Update macro_place.tcl**

Center the macro in the new die:
- X = (1500 - 419) / 2 ≈ 541
- Y = (3000 - 565) / 2 ≈ 1218

```tcl
# Place nor_rom_1024x880 macro in mac_array
# Macro: ~419×565 µm, die: 1500×3000
set block [ord::get_db_block]
set macros {}
foreach inst [$block getInsts] {
    set master [$inst getMaster]
    if {[$master isBlock]} {
        lappend macros [$inst getName]
    }
}
puts "Found [llength $macros] macros:"
foreach m $macros { puts "  '$m'" }

set macros [lsort $macros]
foreach inst_name $macros {
    place_macro -macro_name $inst_name -location "541 1218" -orientation R0
}
```

- [ ] **Step 3: Commit**

```bash
git add flow/designs/sky130hd/mac_array/config.mk flow/designs/sky130hd/mac_array/macro_place.tcl
git commit -m "feat(mac_array): resize die 3000x3000 → 1500x3000"
```

---

### Task 10: Resize rope die (5000×5000 → 2000×3500)

**Files:**
- Modify: `flow/designs/sky130hd/rope/config.mk:19-20`
- Modify: `flow/designs/sky130hd/rope/macro_place.tcl`

Two nor_rom_4096x1024 macros, each ~485×2226 µm.

- [ ] **Step 1: Update config.mk die area**

```makefile
export DIE_AREA  = 0 0 2000 3500
export CORE_AREA = 10 10 1990 3490
```

- [ ] **Step 2: Update macro_place.tcl**

Place 2 macros side by side with ~200µm gap between them and ~150µm margin to die edge:
- Total macro width: 2 × 485 = 970, gap: 200, total: 1170
- Left X: (2000 - 1170) / 2 ≈ 415
- Right X: 415 + 485 + 200 = 1100
- Y: center vertically: (3500 - 2226) / 2 ≈ 637

```tcl
# Place 2× nor_rom_4096x1024 macros in rope
# Each macro: ~485×2226 µm, die: 2000×3500
set block [ord::get_db_block]
set macros {}
foreach inst [$block getInsts] {
    set master [$inst getMaster]
    if {[$master isBlock]} {
        lappend macros [$inst getName]
    }
}
puts "Found [llength $macros] macros:"
foreach m $macros { puts "  '$m'" }

set macros [lsort $macros]
set x_positions {415 1100}
set base_y 637
set idx 0
foreach inst_name $macros {
    set x [lindex $x_positions $idx]
    place_macro -macro_name $inst_name -location "$x $base_y" -orientation R0
    incr idx
}
```

- [ ] **Step 3: Commit**

```bash
git add flow/designs/sky130hd/rope/config.mk flow/designs/sky130hd/rope/macro_place.tcl
git commit -m "feat(rope): resize die 5000x5000 → 2000x3500"
```

---

### Task 11: Resize vector_unit die (5000×5000 → 4000×5500)

**Files:**
- Modify: `flow/designs/sky130hd/vector_unit/config.mk:19-20`
- Modify: `flow/designs/sky130hd/vector_unit/macro_place.tcl`

Two nor_rom_4096x1024 macros, each ~485×2226 µm. This module has 791K cells — the die can't shrink as aggressively.

- [ ] **Step 1: Update config.mk die area**

```makefile
export DIE_AREA  = 0 0 4000 5500
export CORE_AREA = 10 10 3990 5490
```

- [ ] **Step 2: Update macro_place.tcl**

Place 2 macros side by side near the top of the die, leaving most vertical space for 791K cells:
- Total macro width: 2 × 485 = 970, gap: 200, total: 1170
- Center X: (4000 - 1170) / 2 ≈ 1415
- Right X: 1415 + 485 + 200 = 2100
- Y: place near top for cells below: 5500 - 2226 - 150 = 3124

```tcl
# Place 2× nor_rom_4096x1024 macros in vector_unit
# Each macro: ~485×2226 µm, die: 4000×5500
# Place macros near top, cells fill below
set block [ord::get_db_block]
set macros {}
foreach inst [$block getInsts] {
    set master [$inst getMaster]
    if {[$master isBlock]} {
        lappend macros [$inst getName]
    }
}
puts "Found [llength $macros] macros:"
foreach m $macros { puts "  '$m'" }

set macros [lsort $macros]
set x_positions {1415 2100}
set base_y 3124
set idx 0
foreach inst_name $macros {
    set x [lindex $x_positions $idx]
    place_macro -macro_name $inst_name -location "$x $base_y" -orientation R0
    incr idx
}
```

- [ ] **Step 3: Commit**

```bash
git add flow/designs/sky130hd/vector_unit/config.mk flow/designs/sky130hd/vector_unit/macro_place.tcl
git commit -m "feat(vector_unit): resize die 5000x5000 → 4000x5500"
```

---

## Chunk 4: PnR Validation

**Important:** Before running PnR for each module, clean the ORFS results cache to avoid stale data from previous die sizes:

```bash
rm -rf ~/workspace/OpenROAD-flow-scripts/flow/results/sky130hd/<module>/
```

### Task 12: Run PnR on embed_rom (validation of folded ROM)

This is the critical first test — if the folded ROM routes cleanly in the new die, all other modules follow the same pattern.

**Files:** (read-only — checking ORFS output)

- [ ] **Step 1: Clean ORFS cache, source EDA environment, and run synthesis**

```bash
source ~/workspace/eda-env.sh
cd ~/workspace/OpenROAD-flow-scripts/flow
make DESIGN_CONFIG=/home/mana/workspace/OpenTaalas/flow/designs/sky130hd/embed_rom/config.mk synth
```

Verify: synthesis completes without errors. Check that `nor_rom_65536x192_phys` appears as a macro instance (not flattened).

- [ ] **Step 2: Run through GRT**

```bash
make DESIGN_CONFIG=/home/mana/workspace/OpenTaalas/flow/designs/sky130hd/embed_rom/config.mk route
```

Check GRT log for overflow count. Target: **0 overflow**.

If overflow > 0, increase die by 10%:
- First try: 2200 × 3300
- Second try: 2400 × 3600
- Update config.mk and macro_place.tcl accordingly before re-running.

- [ ] **Step 3: Run through DRT and check DRC**

```bash
make DESIGN_CONFIG=/home/mana/workspace/OpenTaalas/flow/designs/sky130hd/embed_rom/config.mk finish
```

Check `6_report.json` for DRC violations. Target: **0 DRC**.

- [ ] **Step 4: Record results and commit any die size adjustments**

If die size was adjusted from the initial 2000×3000, commit the updated config.mk and macro_place.tcl:

```bash
git add flow/designs/sky130hd/embed_rom/
git commit -m "fix(embed_rom): adjust die size to <final>x<final> for clean DRC"
```

---

### Task 13: Run PnR on lm_head_demo

- [ ] **Step 1: Run full PnR**

```bash
source ~/workspace/eda-env.sh
cd ~/workspace/OpenROAD-flow-scripts/flow
make DESIGN_CONFIG=/home/mana/workspace/OpenTaalas/flow/designs/sky130hd/lm_head_demo/config.mk finish
```

- [ ] **Step 2: Check results — target 0 DRC, 0 GRT overflow**

Same validation as Task 12. Adjust die if needed.

- [ ] **Step 3: Commit any adjustments**

---

### Task 14: Run PnR on mac_array

- [ ] **Step 1: Run full PnR**

```bash
make DESIGN_CONFIG=/home/mana/workspace/OpenTaalas/flow/designs/sky130hd/mac_array/config.mk finish
```

- [ ] **Step 2: Check results**

This module previously needed 3000×3000 for clean GRT. Target 1500×3000 — if overflow, try 1800×3000, then 2000×3000.

- [ ] **Step 3: Commit any adjustments**

---

### Task 15: Run PnR on rope

- [ ] **Step 1: Run full PnR**

```bash
make DESIGN_CONFIG=/home/mana/workspace/OpenTaalas/flow/designs/sky130hd/rope/config.mk finish
```

- [ ] **Step 2: Check results**

Previous die was 5000×5000. Target 2000×3500. If overflow, try 2500×4000.

- [ ] **Step 3: Commit any adjustments**

---

### Task 16: Run PnR on vector_unit (highest risk)

- [ ] **Step 1: Run full PnR**

```bash
make DESIGN_CONFIG=/home/mana/workspace/OpenTaalas/flow/designs/sky130hd/vector_unit/config.mk finish
```

- [ ] **Step 2: Check results**

791K cells in 4000×5500. This is the riskiest module. If congestion is severe, fallback sizes:
- 4500×5500 (24.75 mm²)
- 5000×5500 (27.5 mm²)
- 5000×5000 (25.0 mm², same as current — no regression)

- [ ] **Step 3: Commit any adjustments**

---

### Task 17: Update documentation

**Files:**
- Modify: `docs/backend-metrics.md` (update die areas, utilization, fmax)
- Modify: `docs/pnr-reports.md` (update per-module analysis)

- [ ] **Step 1: Update backend-metrics.md with new die areas and results**

Update the macro-bearing designs table with new die sizes, DRC counts, fmax, and power from the `6_report.json` files.

- [ ] **Step 2: Update pnr-reports.md**

Update each module section with new floorplan dimensions and routing results.

- [ ] **Step 3: Commit**

```bash
git add docs/backend-metrics.md docs/pnr-reports.md
git commit -m "docs: update PnR metrics after density improvement"
```

---

### Task 18: Final summary commit

- [ ] **Step 1: Verify all designs route clean**

```bash
for d in embed_rom lm_head_demo mac_array rope vector_unit; do
    echo "=== $d ==="
    python3 -c "
import json
with open('$HOME/workspace/OpenROAD-flow-scripts/flow/results/sky130hd/$d/base/6_report.json') as f:
    r = json.load(f)
    print(f'DRC: {r.get(\"detailedroute__route__drc_errors\", \"N/A\")}')
    print(f'WNS: {r.get(\"finish__timing__setup__ws\", \"N/A\")}')
"
done
```

- [ ] **Step 2: Summary commit with results**

```bash
git add -A
git commit -m "feat: density improvement complete — 108 mm² → ~52 mm² (52% reduction)

NOR ROM folding (nor_rom_65536x192: 344:1 → 1.6:1 aspect ratio),
die co-optimization with routing margins for all macro-bearing designs.

Results:
- embed_rom: <die> → <result>
- lm_head_demo: <die> → <result>
- mac_array: <die> → <result>
- rope: <die> → <result>
- vector_unit: <die> → <result>
"
```
