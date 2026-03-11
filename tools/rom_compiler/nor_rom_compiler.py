#!/usr/bin/env python3
"""NOR ROM Compiler for sky130hd.

Generates Liberty (.lib), LEF, and placeholder GDS for via-programmed NOR ROMs.
Each ROM is synchronous single-port read with registered output.

Usage:
    python3 nor_rom_compiler.py --name nor_rom_1024x880 --rows 1024 --cols 880 --output-dir flow/macros/sky130hd/
    python3 nor_rom_compiler.py --all --output-dir flow/macros/sky130hd/
"""

import argparse
import math
import os
import struct
import sys
from dataclasses import dataclass

# sky130hd technology parameters
SITE_WIDTH = 0.460  # µm (sky130hd site width)
SITE_HEIGHT = 2.720  # µm (sky130hd site height)
METAL_PITCH = 0.480  # µm (met1 pitch)

# NOR ROM bitcell parameters (sky130, contact-programmed)
BITCELL_WIDTH = 0.460  # µm per bit (1 metal pitch)
BITCELL_HEIGHT = 0.540  # µm per row (slightly taller than min)

# Peripheral overhead
ROW_DECODER_WIDTH = 10.0  # µm (address decoder + wordline drivers)
COL_MUX_HEIGHT = 8.0  # µm (sense amps + output registers)
GUARD_RING = 2.0  # µm each side

# Timing parameters (sky130, estimated)
CLK_TO_Q = 2.0  # ns (clock to output delay)
SETUP_TIME = 0.5  # ns (address setup before clock)
HOLD_TIME = 0.1  # ns (address hold after clock)
MIN_PULSE_WIDTH = 1.0  # ns

# Capacitance parameters
INPUT_CAP = 0.005  # pF per input pin
OUTPUT_CAP_LOAD = 0.010  # pF per output (max load for timing)

# Power (rough estimates)
LEAKAGE_PER_KBIT = 0.1  # µW per Kbit
DYNAMIC_PER_ACCESS = 0.05  # pJ per bit per access


@dataclass
class RomSpec:
    name: str
    rows: int
    cols: int

    @property
    def bits(self) -> int:
        return self.rows * self.cols

    @property
    def addr_width(self) -> int:
        return max(1, math.ceil(math.log2(self.rows)))

    @property
    def width_um(self) -> float:
        core = self.cols * BITCELL_WIDTH
        return core + ROW_DECODER_WIDTH + 2 * GUARD_RING

    @property
    def height_um(self) -> float:
        core = self.rows * BITCELL_HEIGHT
        return core + COL_MUX_HEIGHT + 2 * GUARD_RING

    @property
    def area_mm2(self) -> float:
        return self.width_um * self.height_um / 1e6

    @property
    def leakage_uw(self) -> float:
        return self.bits / 1024 * LEAKAGE_PER_KBIT


# Predefined macros matching the spec
PREDEFINED = [
    RomSpec("nor_rom_1024x880", 1024, 880),
    RomSpec("nor_rom_4096x1024", 4096, 1024),
    RomSpec("nor_rom_4096x192", 4096, 192),
    RomSpec("nor_rom_65536x192", 65536, 192),
]


MFG_GRID = 0.005  # µm (5nm manufacturing grid for sky130)


def snap_to_grid(val: float, grid: float) -> float:
    """Snap dimension to manufacturing grid."""
    return math.ceil(val / grid) * grid


def snap_mfg(val: float) -> float:
    """Snap to manufacturing grid (5nm)."""
    return round(round(val / MFG_GRID) * MFG_GRID, 3)


def generate_liberty(spec: RomSpec) -> str:
    """Generate Liberty (.lib) timing model."""
    addr_w = spec.addr_width
    leakage_nw = spec.leakage_uw * 1000

    lines = []
    lines.append(f'library ({spec.name}) {{')
    lines.append(f'  comment : "NOR ROM macro {spec.rows}x{spec.cols} for sky130hd";')
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

    # Bus type definitions must come before cell
    lines.append(f'  type (bus{addr_w}) {{')
    lines.append(f'    base_type : array;')
    lines.append(f'    data_type : bit;')
    lines.append(f'    bit_width : {addr_w};')
    lines.append(f'    bit_from : {addr_w-1};')
    lines.append(f'    bit_to : 0;')
    lines.append(f'    downto : true;')
    lines.append(f'  }}')
    if spec.cols != addr_w:
        lines.append(f'')
        lines.append(f'  type (bus{spec.cols}) {{')
        lines.append(f'    base_type : array;')
        lines.append(f'    data_type : bit;')
        lines.append(f'    bit_width : {spec.cols};')
        lines.append(f'    bit_from : {spec.cols-1};')
        lines.append(f'    bit_to : 0;')
        lines.append(f'    downto : true;')
        lines.append(f'  }}')
    lines.append(f'')
    lines.append(f'  cell ({spec.name}) {{')
    lines.append(f'    area : {spec.width_um * spec.height_um:.1f};')
    lines.append(f'    cell_leakage_power : {leakage_nw:.1f};')
    lines.append(f'    dont_touch : true;')
    lines.append(f'    dont_use : true;')
    lines.append(f'')

    # Clock pin
    lines.append(f'    pin (clk) {{')
    lines.append(f'      direction : input;')
    lines.append(f'      capacitance : {INPUT_CAP};')
    lines.append(f'      clock : true;')
    lines.append(f'      min_pulse_width_low : {MIN_PULSE_WIDTH};')
    lines.append(f'      min_pulse_width_high : {MIN_PULSE_WIDTH};')
    lines.append(f'    }}')
    lines.append(f'')

    # Chip enable
    lines.append(f'    pin (ce) {{')
    lines.append(f'      direction : input;')
    lines.append(f'      capacitance : {INPUT_CAP};')
    lines.append(f'    }}')
    lines.append(f'')

    # Address bus
    lines.append(f'    bus (addr) {{')
    lines.append(f'      bus_type : bus{addr_w};')
    lines.append(f'      direction : input;')
    lines.append(f'      pin (addr[{addr_w-1}:0]) {{')
    lines.append(f'        capacitance : {INPUT_CAP};')
    lines.append(f'        timing () {{')
    lines.append(f'          related_pin : "clk";')
    lines.append(f'          timing_type : setup_rising;')
    lines.append(f'          rise_constraint (scalar) {{')
    lines.append(f'            values ("{SETUP_TIME}");')
    lines.append(f'          }}')
    lines.append(f'          fall_constraint (scalar) {{')
    lines.append(f'            values ("{SETUP_TIME}");')
    lines.append(f'          }}')
    lines.append(f'        }}')
    lines.append(f'        timing () {{')
    lines.append(f'          related_pin : "clk";')
    lines.append(f'          timing_type : hold_rising;')
    lines.append(f'          rise_constraint (scalar) {{')
    lines.append(f'            values ("{HOLD_TIME}");')
    lines.append(f'          }}')
    lines.append(f'          fall_constraint (scalar) {{')
    lines.append(f'            values ("{HOLD_TIME}");')
    lines.append(f'          }}')
    lines.append(f'        }}')
    lines.append(f'      }}')
    lines.append(f'    }}')
    lines.append(f'')

    # Data output bus
    lines.append(f'    bus (dout) {{')
    lines.append(f'      bus_type : bus{spec.cols};')
    lines.append(f'      direction : output;')
    lines.append(f'      pin (dout[{spec.cols-1}:0]) {{')
    lines.append(f'        max_capacitance : {OUTPUT_CAP_LOAD};')
    lines.append(f'        timing () {{')
    lines.append(f'          related_pin : "clk";')
    lines.append(f'          timing_type : rising_edge;')
    lines.append(f'          timing_sense : non_unate;')
    lines.append(f'          cell_rise (scalar) {{')
    lines.append(f'            values ("{CLK_TO_Q}");')
    lines.append(f'          }}')
    lines.append(f'          cell_fall (scalar) {{')
    lines.append(f'            values ("{CLK_TO_Q}");')
    lines.append(f'          }}')
    lines.append(f'          rise_transition (scalar) {{')
    lines.append(f'            values ("0.1");')
    lines.append(f'          }}')
    lines.append(f'          fall_transition (scalar) {{')
    lines.append(f'            values ("0.1");')
    lines.append(f'          }}')
    lines.append(f'        }}')
    lines.append(f'      }}')
    lines.append(f'    }}')
    lines.append(f'  }}')

    lines.append(f'}}')
    return '\n'.join(lines) + '\n'


def generate_lef(spec: RomSpec) -> str:
    """Generate LEF abstract layout."""
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

    # Pin placement along edges — pins on met3, aligned to routing tracks,
    # extending beyond boundary for router access
    pin_w = 0.340  # > met3 min width (0.3) + margin
    pin_ext = 0.500  # extension beyond boundary for access

    # met3 routing grid parameters
    met3_offset = 0.340
    met3_pitch = 0.680
    first_track = met3_offset + met3_pitch * math.ceil((GUARD_RING + 0.5 - met3_offset) / met3_pitch)

    # Calculate available tracks per edge
    max_pin_y = h - 1.0 - pin_w  # last pin bottom Y
    tracks_per_edge = int((max_pin_y - (first_track - pin_w / 2)) / met3_pitch) + 1

    # Input pins (left edge, bottom): clk, ce, addr[0:N-1]
    num_inputs = 2 + addr_w  # clk + ce + addr
    y_pos = snap_mfg(first_track - pin_w / 2)

    lines.append(f'  PIN clk')
    lines.append(f'    DIRECTION INPUT ;')
    lines.append(f'    USE CLOCK ;')
    lines.append(f'    PORT')
    lines.append(f'      LAYER met3 ;')
    lines.append(f'        RECT {snap_mfg(-pin_ext):.3f} {y_pos:.3f} {snap_mfg(pin_ext):.3f} {snap_mfg(y_pos + pin_w):.3f} ;')
    lines.append(f'    END')
    lines.append(f'  END clk')
    lines.append(f'')
    y_pos = snap_mfg(y_pos + met3_pitch)

    lines.append(f'  PIN ce')
    lines.append(f'    DIRECTION INPUT ;')
    lines.append(f'    USE SIGNAL ;')
    lines.append(f'    PORT')
    lines.append(f'      LAYER met3 ;')
    lines.append(f'        RECT {snap_mfg(-pin_ext):.3f} {y_pos:.3f} {snap_mfg(pin_ext):.3f} {snap_mfg(y_pos + pin_w):.3f} ;')
    lines.append(f'    END')
    lines.append(f'  END ce')
    lines.append(f'')
    y_pos = snap_mfg(y_pos + met3_pitch)

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
        y_pos = snap_mfg(y_pos + met3_pitch)

    left_input_end_track = num_inputs  # tracks used by inputs on left edge

    # Data output pins — distribute across right edge, overflow to left edge above inputs
    right_count = min(spec.cols, tracks_per_edge)
    left_count = spec.cols - right_count
    # If overflow needed, also check left edge has room above inputs
    left_avail = tracks_per_edge - left_input_end_track
    if left_count > left_avail:
        # Not enough room even with both edges; increase macro height would be needed
        # For now, warn and pack (shouldn't happen with current specs)
        left_count = left_avail

    # Right edge: dout[0 : right_count-1]
    y_pos = snap_mfg(first_track - pin_w / 2)
    for i in range(right_count):
        pin_y = snap_mfg(y_pos + i * met3_pitch)
        lines.append(f'  PIN dout[{i}]')
        lines.append(f'    DIRECTION OUTPUT ;')
        lines.append(f'    USE SIGNAL ;')
        lines.append(f'    PORT')
        lines.append(f'      LAYER met3 ;')
        lines.append(f'        RECT {snap_mfg(w - pin_ext):.3f} {pin_y:.3f} {snap_mfg(w + pin_ext):.3f} {snap_mfg(pin_y + pin_w):.3f} ;')
        lines.append(f'    END')
        lines.append(f'  END dout[{i}]')
        lines.append(f'')

    # Left edge overflow: dout[right_count : right_count+left_count-1] above inputs
    if left_count > 0:
        y_pos = snap_mfg(first_track - pin_w / 2 + left_input_end_track * met3_pitch)
        for j in range(left_count):
            i = right_count + j
            pin_y = snap_mfg(y_pos + j * met3_pitch)
            lines.append(f'  PIN dout[{i}]')
            lines.append(f'    DIRECTION OUTPUT ;')
            lines.append(f'    USE SIGNAL ;')
            lines.append(f'    PORT')
            lines.append(f'      LAYER met3 ;')
            lines.append(f'        RECT {snap_mfg(-pin_ext):.3f} {pin_y:.3f} {snap_mfg(pin_ext):.3f} {snap_mfg(pin_y + pin_w):.3f} ;')
            lines.append(f'    END')
            lines.append(f'  END dout[{i}]')
            lines.append(f'')

    # Power pins — vertical met4 stripes matching PDN grid pitch (27.14µm)
    # so PDN can place met4↔met5 vias at overlap points
    pdn_met4_pitch = 27.140
    pdn_met4_offset = 13.570
    pdn_met4_width = 1.600

    lines.append(f'  PIN VDD')
    lines.append(f'    DIRECTION INOUT ;')
    lines.append(f'    USE POWER ;')
    lines.append(f'    PORT')
    lines.append(f'      LAYER met4 ;')
    # VDD stripes at even multiples of pitch (offset + 0, 2*pitch, 4*pitch, ...)
    x = pdn_met4_offset
    stripe_idx = 0
    while x + pdn_met4_width / 2 < w:
        if stripe_idx % 2 == 0:  # even = VDD
            x1 = snap_mfg(x - pdn_met4_width / 2)
            x2 = snap_mfg(x + pdn_met4_width / 2)
            if x1 >= 0 and x2 <= w:
                lines.append(f'        RECT {x1:.3f} 0.000 {x2:.3f} {h:.3f} ;')
        x += pdn_met4_pitch
        stripe_idx += 1
    lines.append(f'    END')
    lines.append(f'  END VDD')
    lines.append(f'')

    lines.append(f'  PIN VSS')
    lines.append(f'    DIRECTION INOUT ;')
    lines.append(f'    USE GROUND ;')
    lines.append(f'    PORT')
    lines.append(f'      LAYER met4 ;')
    # VSS stripes at odd multiples of pitch
    x = pdn_met4_offset
    stripe_idx = 0
    while x + pdn_met4_width / 2 < w:
        if stripe_idx % 2 == 1:  # odd = VSS
            x1 = snap_mfg(x - pdn_met4_width / 2)
            x2 = snap_mfg(x + pdn_met4_width / 2)
            if x1 >= 0 and x2 <= w:
                lines.append(f'        RECT {x1:.3f} 0.000 {x2:.3f} {h:.3f} ;')
        x += pdn_met4_pitch
        stripe_idx += 1
    lines.append(f'    END')
    lines.append(f'  END VSS')
    lines.append(f'')

    # Obstruction (met1+met2 internal routing; met4 except power stripes)
    lines.append(f'  OBS')
    lines.append(f'    LAYER met1 ;')
    lines.append(f'      RECT {GUARD_RING:.3f} {GUARD_RING:.3f} {w - GUARD_RING:.3f} {h - GUARD_RING:.3f} ;')
    lines.append(f'    LAYER met2 ;')
    lines.append(f'      RECT {GUARD_RING:.3f} {GUARD_RING:.3f} {w - GUARD_RING:.3f} {h - GUARD_RING:.3f} ;')
    lines.append(f'    LAYER met4 ;')
    lines.append(f'      RECT {GUARD_RING:.3f} {GUARD_RING:.3f} {w - GUARD_RING:.3f} {h - GUARD_RING:.3f} ;')
    lines.append(f'  END')
    lines.append(f'')
    lines.append(f'END {spec.name}')
    lines.append(f'')
    lines.append(f'END LIBRARY')
    return '\n'.join(lines) + '\n'


def generate_gds(spec: RomSpec, filepath: str):
    """Generate minimal valid GDSII with boundary + text labels."""
    w_nm = int(snap_to_grid(spec.width_um, SITE_WIDTH) * 1000)
    h_nm = int(snap_to_grid(spec.height_um, SITE_HEIGHT) * 1000)

    def pad(data: bytes) -> bytes:
        if len(data) % 2 != 0:
            data += b'\x00'
        return data

    def record(rtype: int, dtype: int, data: bytes = b'') -> bytes:
        length = 4 + len(data)
        return struct.pack('>HBB', length, rtype, dtype) + data

    def int32(val: int) -> bytes:
        return struct.pack('>i', val)

    def int16(val: int) -> bytes:
        return struct.pack('>h', val)

    def string(s: str) -> bytes:
        b = s.encode('ascii')
        if len(b) % 2 != 0:
            b += b'\x00'
        return b

    # Record types
    HEADER = 0x00; BGNLIB = 0x01; LIBNAME = 0x02; UNITS = 0x03
    ENDLIB = 0x04; BGNSTR = 0x05; STRNAME = 0x06; ENDSTR = 0x07
    BOUNDARY = 0x08; LAYER = 0x0D; DATATYPE = 0x0E; XY = 0x10
    ENDEL = 0x11; TEXT = 0x0C; TEXTTYPE = 0x16; STRING = 0x19

    # Data types
    NONE = 0x00; INT16 = 0x01; INT32 = 0x03; REAL8 = 0x05; ASCII = 0x06

    # IEEE 754 double to GDSII real8
    def gds_real8(val: float) -> bytes:
        if val == 0:
            return b'\x00' * 8
        sign = 0
        if val < 0:
            sign = 0x80
            val = -val
        exp16 = 0
        mant = val
        while mant >= 1.0:
            mant /= 16.0
            exp16 += 1
        while mant < 1.0 / 16.0:
            mant *= 16.0
            exp16 -= 1
        exp_byte = (exp16 + 64) | sign
        mant_int = int(mant * (2 ** 56))
        return struct.pack('>B', exp_byte) + struct.pack('>Q', mant_int)[1:]

    # Timestamp (dummy)
    ts = int16(2026) + int16(3) + int16(11) + int16(0) + int16(0) + int16(0)

    gds = b''
    gds += record(HEADER, INT16, int16(600))  # GDSII v6
    gds += record(BGNLIB, INT16, ts + ts)
    gds += record(LIBNAME, ASCII, string(spec.name))
    gds += record(UNITS, REAL8, gds_real8(1e-3) + gds_real8(1e-9))  # 1nm database units

    # Structure
    gds += record(BGNSTR, INT16, ts + ts)
    gds += record(STRNAME, ASCII, string(spec.name))

    # Boundary on layer 0 (outline)
    gds += record(BOUNDARY, NONE)
    gds += record(LAYER, INT16, int16(0))
    gds += record(DATATYPE, INT16, int16(0))
    gds += record(XY, INT32, int32(0) + int32(0) +
                  int32(w_nm) + int32(0) +
                  int32(w_nm) + int32(h_nm) +
                  int32(0) + int32(h_nm) +
                  int32(0) + int32(0))
    gds += record(ENDEL, NONE)

    # Text label with macro name
    gds += record(TEXT, NONE)
    gds += record(LAYER, INT16, int16(0))
    gds += record(TEXTTYPE, INT16, int16(0))
    gds += record(XY, INT32, int32(w_nm // 2) + int32(h_nm // 2))
    gds += record(STRING, ASCII, string(spec.name))
    gds += record(ENDEL, NONE)

    gds += record(ENDSTR, NONE)
    gds += record(ENDLIB, NONE)

    with open(filepath, 'wb') as f:
        f.write(gds)


def generate_verilog_blackbox(spec: RomSpec) -> str:
    """Generate Verilog blackbox for synthesis."""
    addr_w = spec.addr_width
    lines = []
    lines.append(f'// Blackbox for {spec.name} NOR ROM macro')
    lines.append(f'// {spec.rows} rows x {spec.cols} cols = {spec.bits} bits')
    lines.append(f'(* blackbox *)')
    lines.append(f'module {spec.name} (')
    lines.append(f'  input  wire              clk,')
    lines.append(f'  input  wire              ce,')
    lines.append(f'  input  wire [{addr_w-1:>3d}:0] addr,')
    lines.append(f'  output reg  [{spec.cols-1:>3d}:0] dout')
    lines.append(f');')
    lines.append(f'endmodule')
    return '\n'.join(lines) + '\n'


def generate_all(spec: RomSpec, output_dir: str):
    """Generate all collateral for a ROM macro."""
    os.makedirs(output_dir, exist_ok=True)

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


def main():
    parser = argparse.ArgumentParser(description='NOR ROM Compiler for sky130hd')
    parser.add_argument('--name', help='Macro name')
    parser.add_argument('--rows', type=int, help='Number of rows')
    parser.add_argument('--cols', type=int, help='Number of columns (data width)')
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
        spec = RomSpec(args.name, args.rows, args.cols)
        generate_all(spec, args.output_dir)
    else:
        parser.print_help()
        sys.exit(1)


if __name__ == '__main__':
    main()
