#!/usr/bin/env python3
"""SRAM Macro Compiler for sky130hd (placeholder collateral).

Generates Liberty (.lib), LEF, and placeholder GDS for SRAM macros.
Until OpenRAM is integrated, these are placeholder timing/area models
based on sky130 6T SRAM bitcell parameters.

Usage:
    python3 sram_compiler.py --all --output-dir flow/macros/sky130hd/
"""

import argparse
import math
import os
import struct
import sys
from dataclasses import dataclass

# sky130hd technology parameters
SITE_WIDTH = 0.460  # µm
SITE_HEIGHT = 2.720  # µm

# 6T SRAM bitcell (sky130)
BITCELL_WIDTH = 0.920  # µm per bit (2 metal pitches)
BITCELL_HEIGHT = 1.080  # µm per row

# Peripheral overhead
ROW_DECODER_WIDTH = 15.0  # µm
COL_MUX_HEIGHT = 12.0  # µm (sense amps, write drivers, output regs)
GUARD_RING = 2.0  # µm

# Timing (6T SRAM at sky130, estimated)
CLK_TO_Q_READ = 1.5  # ns
SETUP_TIME = 0.3  # ns
HOLD_TIME = 0.1  # ns
MIN_PULSE_WIDTH = 0.8  # ns
WRITE_SETUP = 0.3  # ns

INPUT_CAP = 0.008  # pF
OUTPUT_CAP_LOAD = 0.015  # pF

LEAKAGE_PER_KBIT = 0.5  # µW per Kbit


@dataclass
class SramSpec:
    name: str
    width: int   # data width in bits
    depth: int   # number of rows

    @property
    def bits(self) -> int:
        return self.width * self.depth

    @property
    def addr_width(self) -> int:
        return max(1, math.ceil(math.log2(self.depth)))

    @property
    def width_um(self) -> float:
        core = self.width * BITCELL_WIDTH
        return core + ROW_DECODER_WIDTH + 2 * GUARD_RING

    @property
    def height_um(self) -> float:
        core = self.depth * BITCELL_HEIGHT
        return core + COL_MUX_HEIGHT + 2 * GUARD_RING

    @property
    def area_mm2(self) -> float:
        return self.width_um * self.height_um / 1e6

    @property
    def leakage_uw(self) -> float:
        return self.bits / 1024 * LEAKAGE_PER_KBIT


MFG_GRID = 0.005  # µm (5nm manufacturing grid)


def snap_mfg(val: float) -> float:
    """Snap to manufacturing grid (5nm)."""
    return round(round(val / MFG_GRID) * MFG_GRID, 3)


def snap_to_grid(val: float, grid: float) -> float:
    return math.ceil(val / grid) * grid


# KV cache: 2 × 8-bit × 4M deep is too large for a single macro.
# Use 4096-deep tiles (4096 × 8 = 32 Kbit each).
# External address decode selects tiles.
PREDEFINED = [
    SramSpec("sram_4096x8", 8, 4096),
]


def generate_liberty(spec: SramSpec) -> str:
    addr_w = spec.addr_width
    leakage_nw = spec.leakage_uw * 1000

    lines = []
    lines.append(f'library ({spec.name}) {{')
    lines.append(f'  comment : "SRAM macro {spec.depth}x{spec.width} for sky130hd";')
    lines.append(f'  technology (cmos);')
    lines.append(f'  delay_model : table_lookup;')
    lines.append(f'  time_unit : "1ns";')
    lines.append(f'  voltage_unit : "1V";')
    lines.append(f'  current_unit : "1mA";')
    lines.append(f'  pulling_resistance_unit : "1kohm";')
    lines.append(f'  leakage_power_unit : "1nW";')
    lines.append(f'  capacitive_load_unit (1, pf);')
    lines.append(f'')
    lines.append(f'  nom_process : 1;')
    lines.append(f'  nom_voltage : 1.8;')
    lines.append(f'  nom_temperature : 25;')
    lines.append(f'')
    lines.append(f'  input_threshold_pct_rise : 50;')
    lines.append(f'  input_threshold_pct_fall : 50;')
    lines.append(f'  output_threshold_pct_rise : 50;')
    lines.append(f'  output_threshold_pct_fall : 50;')
    lines.append(f'  slew_lower_threshold_pct_rise : 20;')
    lines.append(f'  slew_upper_threshold_pct_rise : 80;')
    lines.append(f'  slew_lower_threshold_pct_fall : 20;')
    lines.append(f'  slew_upper_threshold_pct_fall : 80;')
    lines.append(f'')
    lines.append(f'  default_cell_leakage_power : {leakage_nw:.1f};')
    lines.append(f'  default_fanout_load : 1;')
    lines.append(f'  default_max_transition : 1.0;')
    lines.append(f'  default_output_pin_cap : 0.0;')
    lines.append(f'')

    # Bus types
    lines.append(f'  type (bus{addr_w}) {{')
    lines.append(f'    base_type : array;')
    lines.append(f'    data_type : bit;')
    lines.append(f'    bit_width : {addr_w};')
    lines.append(f'    bit_from : {addr_w-1};')
    lines.append(f'    bit_to : 0;')
    lines.append(f'    downto : true;')
    lines.append(f'  }}')
    lines.append(f'')
    lines.append(f'  type (bus{spec.width}) {{')
    lines.append(f'    base_type : array;')
    lines.append(f'    data_type : bit;')
    lines.append(f'    bit_width : {spec.width};')
    lines.append(f'    bit_from : {spec.width-1};')
    lines.append(f'    bit_to : 0;')
    lines.append(f'    downto : true;')
    lines.append(f'  }}')
    lines.append(f'')

    lines.append(f'  cell ({spec.name}) {{')
    lines.append(f'    area : {spec.width_um * spec.height_um:.1f};')
    lines.append(f'    cell_leakage_power : {leakage_nw:.1f};')
    lines.append(f'    dont_touch : true;')
    lines.append(f'    dont_use : true;')
    lines.append(f'    memory () {{')
    lines.append(f'      type : ram;')
    lines.append(f'      address_width : {addr_w};')
    lines.append(f'      word_width : {spec.width};')
    lines.append(f'    }}')
    lines.append(f'')

    # Clock
    lines.append(f'    pin (clk) {{')
    lines.append(f'      direction : input;')
    lines.append(f'      capacitance : {INPUT_CAP};')
    lines.append(f'      clock : true;')
    lines.append(f'      min_pulse_width_low : {MIN_PULSE_WIDTH};')
    lines.append(f'      min_pulse_width_high : {MIN_PULSE_WIDTH};')
    lines.append(f'    }}')
    lines.append(f'')

    # CE, WE
    for pin_name in ['ce', 'we']:
        lines.append(f'    pin ({pin_name}) {{')
        lines.append(f'      direction : input;')
        lines.append(f'      capacitance : {INPUT_CAP};')
        lines.append(f'    }}')
        lines.append(f'')

    # Address
    lines.append(f'    bus (addr) {{')
    lines.append(f'      bus_type : bus{addr_w};')
    lines.append(f'      direction : input;')
    lines.append(f'      pin (addr[{addr_w-1}:0]) {{')
    lines.append(f'        capacitance : {INPUT_CAP};')
    lines.append(f'        timing () {{')
    lines.append(f'          related_pin : "clk";')
    lines.append(f'          timing_type : setup_rising;')
    lines.append(f'          rise_constraint (scalar) {{ values ("{SETUP_TIME}"); }}')
    lines.append(f'          fall_constraint (scalar) {{ values ("{SETUP_TIME}"); }}')
    lines.append(f'        }}')
    lines.append(f'        timing () {{')
    lines.append(f'          related_pin : "clk";')
    lines.append(f'          timing_type : hold_rising;')
    lines.append(f'          rise_constraint (scalar) {{ values ("{HOLD_TIME}"); }}')
    lines.append(f'          fall_constraint (scalar) {{ values ("{HOLD_TIME}"); }}')
    lines.append(f'        }}')
    lines.append(f'      }}')
    lines.append(f'    }}')
    lines.append(f'')

    # Data in
    lines.append(f'    bus (din) {{')
    lines.append(f'      bus_type : bus{spec.width};')
    lines.append(f'      direction : input;')
    lines.append(f'      pin (din[{spec.width-1}:0]) {{')
    lines.append(f'        capacitance : {INPUT_CAP};')
    lines.append(f'        timing () {{')
    lines.append(f'          related_pin : "clk";')
    lines.append(f'          timing_type : setup_rising;')
    lines.append(f'          rise_constraint (scalar) {{ values ("{WRITE_SETUP}"); }}')
    lines.append(f'          fall_constraint (scalar) {{ values ("{WRITE_SETUP}"); }}')
    lines.append(f'        }}')
    lines.append(f'        timing () {{')
    lines.append(f'          related_pin : "clk";')
    lines.append(f'          timing_type : hold_rising;')
    lines.append(f'          rise_constraint (scalar) {{ values ("{HOLD_TIME}"); }}')
    lines.append(f'          fall_constraint (scalar) {{ values ("{HOLD_TIME}"); }}')
    lines.append(f'        }}')
    lines.append(f'      }}')
    lines.append(f'    }}')
    lines.append(f'')

    # Data out
    lines.append(f'    bus (dout) {{')
    lines.append(f'      bus_type : bus{spec.width};')
    lines.append(f'      direction : output;')
    lines.append(f'      pin (dout[{spec.width-1}:0]) {{')
    lines.append(f'        max_capacitance : {OUTPUT_CAP_LOAD};')
    lines.append(f'        timing () {{')
    lines.append(f'          related_pin : "clk";')
    lines.append(f'          timing_type : rising_edge;')
    lines.append(f'          timing_sense : non_unate;')
    lines.append(f'          cell_rise (scalar) {{ values ("{CLK_TO_Q_READ}"); }}')
    lines.append(f'          cell_fall (scalar) {{ values ("{CLK_TO_Q_READ}"); }}')
    lines.append(f'          rise_transition (scalar) {{ values ("0.1"); }}')
    lines.append(f'          fall_transition (scalar) {{ values ("0.1"); }}')
    lines.append(f'        }}')
    lines.append(f'      }}')
    lines.append(f'    }}')
    lines.append(f'  }}')
    lines.append(f'}}')
    return '\n'.join(lines) + '\n'


def generate_lef(spec: SramSpec) -> str:
    w = snap_to_grid(spec.width_um, SITE_WIDTH)
    h = snap_to_grid(spec.height_um, SITE_HEIGHT)
    addr_w = spec.addr_width

    lines = []
    lines.append(f'VERSION 5.8 ;')
    lines.append(f'BUSBITCHARS "[]" ;')
    lines.append(f'DIVIDERCHAR "/" ;')
    lines.append(f'')
    lines.append(f'MACRO {spec.name}')
    lines.append(f'  CLASS BLOCK ;')
    lines.append(f'  ORIGIN 0 0 ;')
    lines.append(f'  SIZE {w:.3f} BY {h:.3f} ;')
    lines.append(f'  SYMMETRY X Y ;')
    lines.append(f'')

    pin_w = 0.340  # > met3 min width (0.3) + margin, ensures track crossing
    pin_ext = 0.500  # extension beyond boundary
    # Align pins to met3 tracks: y = 0.34 + n * 0.68
    met3_offset = 0.340
    met3_pitch = 0.680
    pin_pitch = met3_pitch
    first_track = met3_offset + met3_pitch * math.ceil((GUARD_RING + 0.5 - met3_offset) / met3_pitch)
    y_pos = snap_mfg(first_track - pin_w / 2)

    # clk, ce, we on left edge
    for name, use in [('clk', 'CLOCK'), ('ce', 'SIGNAL'), ('we', 'SIGNAL')]:
        lines.append(f'  PIN {name}')
        lines.append(f'    DIRECTION INPUT ;')
        lines.append(f'    USE {use} ;')
        lines.append(f'    PORT')
        lines.append(f'      LAYER met3 ;')
        lines.append(f'        RECT {snap_mfg(-pin_ext):.3f} {y_pos:.3f} {snap_mfg(pin_ext):.3f} {snap_mfg(y_pos + pin_w):.3f} ;')
        lines.append(f'    END')
        lines.append(f'  END {name}')
        lines.append(f'')
        y_pos = snap_mfg(y_pos + pin_pitch)

    # Address pins
    for i in range(addr_w):
        lines.append(f'  PIN addr[{i}]')
        lines.append(f'    DIRECTION INPUT ;')
        lines.append(f'    USE SIGNAL ;')
        lines.append(f'    PORT')
        lines.append(f'      LAYER met3 ;')
        lines.append(f'        RECT {snap_mfg(-pin_ext):.3f} {y_pos:.3f} {snap_mfg(pin_ext):.3f} {snap_mfg(y_pos + pin_w):.3f} ;')
        lines.append(f'    END')
        lines.append(f'  END addr[{i}]')
        lines.append(f'')
        y_pos = snap_mfg(y_pos + pin_pitch)

    # Din pins
    for i in range(spec.width):
        lines.append(f'  PIN din[{i}]')
        lines.append(f'    DIRECTION INPUT ;')
        lines.append(f'    USE SIGNAL ;')
        lines.append(f'    PORT')
        lines.append(f'      LAYER met3 ;')
        lines.append(f'        RECT {snap_mfg(-pin_ext):.3f} {y_pos:.3f} {snap_mfg(pin_ext):.3f} {snap_mfg(y_pos + pin_w):.3f} ;')
        lines.append(f'    END')
        lines.append(f'  END din[{i}]')
        lines.append(f'')
        y_pos = snap_mfg(y_pos + pin_pitch)

    # Dout pins on right edge — aligned to met3 tracks
    y_pos = snap_mfg(first_track - pin_w / 2)
    for i in range(spec.width):
        lines.append(f'  PIN dout[{i}]')
        lines.append(f'    DIRECTION OUTPUT ;')
        lines.append(f'    USE SIGNAL ;')
        lines.append(f'    PORT')
        lines.append(f'      LAYER met3 ;')
        lines.append(f'        RECT {snap_mfg(w - pin_ext):.3f} {y_pos:.3f} {snap_mfg(w + pin_ext):.3f} {snap_mfg(y_pos + pin_w):.3f} ;')
        lines.append(f'    END')
        lines.append(f'  END dout[{i}]')
        lines.append(f'')
        y_pos = snap_mfg(y_pos + pin_pitch)

    # Power
    lines.append(f'  PIN VDD')
    lines.append(f'    DIRECTION INOUT ;')
    lines.append(f'    USE POWER ;')
    lines.append(f'    PORT')
    lines.append(f'      LAYER met4 ;')
    lines.append(f'        RECT 0.000 {h - 1.000:.3f} {w:.3f} {h:.3f} ;')
    lines.append(f'    END')
    lines.append(f'  END VDD')
    lines.append(f'')
    lines.append(f'  PIN VSS')
    lines.append(f'    DIRECTION INOUT ;')
    lines.append(f'    USE GROUND ;')
    lines.append(f'    PORT')
    lines.append(f'      LAYER met4 ;')
    lines.append(f'        RECT 0.000 0.000 {w:.3f} 1.000 ;')
    lines.append(f'    END')
    lines.append(f'  END VSS')
    lines.append(f'')

    # Obstruction (met1+met2 only; met3 left open for pin access)
    lines.append(f'  OBS')
    lines.append(f'    LAYER met1 ;')
    lines.append(f'      RECT {GUARD_RING:.3f} {GUARD_RING:.3f} {w - GUARD_RING:.3f} {h - GUARD_RING:.3f} ;')
    lines.append(f'    LAYER met2 ;')
    lines.append(f'      RECT {GUARD_RING:.3f} {GUARD_RING:.3f} {w - GUARD_RING:.3f} {h - GUARD_RING:.3f} ;')
    lines.append(f'  END')
    lines.append(f'')
    lines.append(f'END {spec.name}')
    lines.append(f'')
    lines.append(f'END LIBRARY')
    return '\n'.join(lines) + '\n'


def generate_gds(spec: SramSpec, filepath: str):
    """Generate minimal valid GDSII."""
    w_nm = int(snap_to_grid(spec.width_um, SITE_WIDTH) * 1000)
    h_nm = int(snap_to_grid(spec.height_um, SITE_HEIGHT) * 1000)

    def record(rtype, dtype, data=b''):
        length = 4 + len(data)
        return struct.pack('>HBB', length, rtype, dtype) + data
    def int32(val): return struct.pack('>i', val)
    def int16(val): return struct.pack('>h', val)
    def string(s):
        b = s.encode('ascii')
        if len(b) % 2: b += b'\x00'
        return b
    def gds_real8(val):
        if val == 0: return b'\x00' * 8
        sign = 0
        if val < 0: sign = 0x80; val = -val
        exp16 = 0; mant = val
        while mant >= 1.0: mant /= 16.0; exp16 += 1
        while mant < 1.0 / 16.0: mant *= 16.0; exp16 -= 1
        return struct.pack('>B', (exp16 + 64) | sign) + struct.pack('>Q', int(mant * (2**56)))[1:]

    ts = int16(2026) + int16(3) + int16(11) + int16(0) + int16(0) + int16(0)

    gds = b''
    gds += record(0x00, 0x01, int16(600))
    gds += record(0x01, 0x01, ts + ts)
    gds += record(0x02, 0x06, string(spec.name))
    gds += record(0x03, 0x05, gds_real8(1e-3) + gds_real8(1e-9))
    gds += record(0x05, 0x01, ts + ts)
    gds += record(0x06, 0x06, string(spec.name))
    gds += record(0x08, 0x00)  # BOUNDARY
    gds += record(0x0D, 0x01, int16(0))  # LAYER 0
    gds += record(0x0E, 0x01, int16(0))  # DATATYPE 0
    gds += record(0x10, 0x03, int32(0)+int32(0)+int32(w_nm)+int32(0)+
                  int32(w_nm)+int32(h_nm)+int32(0)+int32(h_nm)+int32(0)+int32(0))
    gds += record(0x11, 0x00)  # ENDEL
    gds += record(0x0C, 0x00)  # TEXT
    gds += record(0x0D, 0x01, int16(0))
    gds += record(0x16, 0x01, int16(0))
    gds += record(0x10, 0x03, int32(w_nm//2) + int32(h_nm//2))
    gds += record(0x19, 0x06, string(spec.name))
    gds += record(0x11, 0x00)
    gds += record(0x07, 0x00)  # ENDSTR
    gds += record(0x04, 0x00)  # ENDLIB

    with open(filepath, 'wb') as f:
        f.write(gds)


def generate_verilog_blackbox(spec: SramSpec) -> str:
    addr_w = spec.addr_width
    lines = []
    lines.append(f'// Blackbox for {spec.name} SRAM macro')
    lines.append(f'// {spec.depth} rows x {spec.width} bits')
    lines.append(f'(* blackbox *)')
    lines.append(f'module {spec.name} (')
    lines.append(f'  input  wire              clk,')
    lines.append(f'  input  wire              ce,')
    lines.append(f'  input  wire              we,')
    lines.append(f'  input  wire [{addr_w-1:>3d}:0] addr,')
    lines.append(f'  input  wire [{spec.width-1:>3d}:0] din,')
    lines.append(f'  output reg  [{spec.width-1:>3d}:0] dout')
    lines.append(f');')
    lines.append(f'endmodule')
    return '\n'.join(lines) + '\n'


def generate_all(spec: SramSpec, output_dir: str):
    os.makedirs(output_dir, exist_ok=True)

    for ext, gen in [('.lib', generate_liberty), ('.lef', generate_lef)]:
        path = os.path.join(output_dir, f'{spec.name}{ext}')
        with open(path, 'w') as f:
            f.write(gen(spec))

    gds_path = os.path.join(output_dir, f'{spec.name}.gds')
    generate_gds(spec, gds_path)

    bb_path = os.path.join(output_dir, f'{spec.name}.bb.v')
    with open(bb_path, 'w') as f:
        f.write(generate_verilog_blackbox(spec))

    print(f"  {spec.name}:")
    print(f"    Depth={spec.depth}  Width={spec.width}  Bits={spec.bits/1024:.1f}K")
    print(f"    Addr={spec.addr_width}b  Area={spec.area_mm2:.4f} mm²")
    print(f"    Size={spec.width_um:.1f} x {spec.height_um:.1f} µm")


def main():
    parser = argparse.ArgumentParser(description='SRAM Compiler for sky130hd')
    parser.add_argument('--all', action='store_true')
    parser.add_argument('--name')
    parser.add_argument('--width', type=int)
    parser.add_argument('--depth', type=int)
    parser.add_argument('--output-dir', default='flow/macros/sky130hd')
    args = parser.parse_args()

    if args.all:
        print("Generating predefined SRAM macros:")
        for spec in PREDEFINED:
            generate_all(spec, args.output_dir)
    elif args.name and args.width and args.depth:
        spec = SramSpec(args.name, args.width, args.depth)
        generate_all(spec, args.output_dir)
    else:
        parser.print_help()
        sys.exit(1)


if __name__ == '__main__':
    main()
