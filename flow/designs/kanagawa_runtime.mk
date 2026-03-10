# flow/designs/kanagawa_runtime.mk — Shared Kanagawa runtime file list for ORFS
#
# Usage in config.mk:
#   include $(_this_dir)/../../kanagawa_runtime.mk
#   export VERILOG_FILES = <design>.sv <design>_types.sv $(KANAGAWA_RUNTIME_SV)
#
# Requires _project to be set before include.

_kanagawa_rtl := $(_project)/third-party/kanagawa/runtime/rtl

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
  $(_kanagawa_rtl)/hal/mock/hal_dual_port_ram.sv \
  $(_kanagawa_rtl)/sim/string_table.sv

# Mock HAL files require SIMULATION define to bypass `error guards
KANAGAWA_VERILOG_DEFINES = -DSIMULATION
