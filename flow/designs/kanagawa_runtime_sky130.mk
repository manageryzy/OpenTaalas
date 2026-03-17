# flow/designs/kanagawa_runtime_sky130.mk — Kanagawa runtime for sky130hd synthesis
#
# Replaces mock HAL with sky130 HAL (physical macro wrappers).
# Usage: include $(_this_dir)/../../kanagawa_runtime_sky130.mk
# Requires _project to be set before include.

_kanagawa_rtl := $(_project)/third-party/kanagawa/runtime/rtl
_macros_dir   := $(_project)/flow/macros/sky130hd

KANAGAWA_RUNTIME_SV = \
  $(_kanagawa_rtl)/types.sv \
  $(_kanagawa_rtl)/functions.sv \
  $(_kanagawa_rtl)/flip_flop_chains.sv \
  $(_kanagawa_rtl)/reset_control.sv \
  $(_kanagawa_rtl)/write_delay_fifo.sv \
  $(_kanagawa_rtl)/fixed_delay_fifo.sv \
  $(_kanagawa_rtl)/sync_ram.sv \
  $(_kanagawa_rtl)/memory_bypass.sv \
  $(_kanagawa_rtl)/full_empty_counter.sv \
  $(_kanagawa_rtl)/fifo_ptrs.sv \
  $(_kanagawa_rtl)/fifo_ptrs_ex.sv \
  $(_kanagawa_rtl)/fifo_debug.sv \
  $(_kanagawa_rtl)/show_ahead_register_fifo.sv \
  $(_kanagawa_rtl)/register_fifo.sv \
  $(_kanagawa_rtl)/one_register_fifo.sv \
  $(_kanagawa_rtl)/skid_buffer.sv \
  $(_kanagawa_rtl)/hal/mock/hal_non_mergeable_registers.sv \
  $(_kanagawa_rtl)/hal/mock/hal_show_ahead_fifo.sv \
  $(_kanagawa_rtl)/hal/mock/hal_ready_valid_fifo.sv \
  $(_kanagawa_rtl)/hal/mock/hal_simple_dual_port_ram_tile.sv \
  $(_project)/rtl/hal/sky130/hal_dual_port_ram.sv \
  $(MACRO_WRAPPERS)

# Mock HAL files (registers, FIFOs) require SIMULATION define to bypass `error guards.
# Only hal_dual_port_ram is replaced by the sky130 HAL; other mock HAL modules are
# behavioral RTL that synthesizes correctly.
KANAGAWA_VERILOG_DEFINES = -DSIMULATION

# Physical macro collateral
MACRO_LEFS = $(wildcard $(_macros_dir)/*.lef)
MACRO_LIBS = $(wildcard $(_macros_dir)/*.lib)
MACRO_GDS  = $(wildcard $(_macros_dir)/*.gds)
MACRO_BB   = $(wildcard $(_macros_dir)/*.bb.v)
# Folded ROM wrapper modules (synthesizable, not blackbox)
MACRO_WRAPPERS = $(filter-out %.bb.v,$(wildcard $(_macros_dir)/*.v))
