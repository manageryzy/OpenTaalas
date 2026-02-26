// kanagawa_harness.h — Reusable Verilator co-simulation harness for Kanagawa modules
//
// All Kanagawa-exported modules share a common handshake protocol:
//   - clk, rst, stall_rate_in[2:0], stall_rate_valid_in
//   - rst_and_startup_done_out
//   - Per-method: <method>_valid_in, <method>_rdy_out,
//                 <method>_rden_in, <method>_empty_out, <method>_result_out
//
// Usage:
//   KanagawaHarness<Vmac_pe> h;
//   h.reset();
//   h.wait_ready(h.dut()->mac_rdy_out);
//   // drive inputs, tick, read FIFO...

#pragma once

#include <verilated.h>
#include <cassert>
#include <cstdint>
#include <cstdio>
#include <memory>

template <typename VModel>
class KanagawaHarness {
 public:
  explicit KanagawaHarness(int timeout_cycles = 10000)
      : _timeout(timeout_cycles), _cycle(0) {
    _ctx = std::make_unique<VerilatedContext>();
    _ctx->traceEverOn(false);
    _dut = std::make_unique<VModel>(_ctx.get());
    _dut->clk = 0;
    _dut->rst = 1;
    _dut->stall_rate_in = 0;
    _dut->stall_rate_valid_in = 0;
    _dut->eval();
  }

  ~KanagawaHarness() { _dut->final(); }

  // Hold reset for 60 cycles, then wait for rst_and_startup_done_out.
  void reset() {
    _dut->rst = 1;
    for (int i = 0; i < 60; ++i) tick();
    _dut->rst = 0;
    int waited = 0;
    while (!_dut->rst_and_startup_done_out) {
      tick();
      if (++waited > _timeout) {
        std::fprintf(stderr, "TIMEOUT: rst_and_startup_done_out never asserted\n");
        std::abort();
      }
    }
  }

  // One full clock cycle: posedge then negedge.
  void tick() {
    _dut->clk = 1;
    _dut->eval();
    _dut->clk = 0;
    _dut->eval();
    ++_cycle;
  }

  void tick_n(int n) {
    for (int i = 0; i < n; ++i) tick();
  }

  // Spin until rdy becomes 1.
  void wait_ready(const uint8_t& rdy) {
    int waited = 0;
    while (!rdy) {
      tick();
      if (++waited > _timeout) {
        std::fprintf(stderr, "TIMEOUT: ready never asserted\n");
        std::abort();
      }
    }
  }

  // Wait for FIFO non-empty, capture result, pulse rden for one cycle.
  template <typename T>
  T read_fifo(uint8_t& rden, const uint8_t& empty, const T& result) {
    int waited = 0;
    while (empty) {
      tick();
      if (++waited > _timeout) {
        std::fprintf(stderr, "TIMEOUT: FIFO empty never deasserted\n");
        std::abort();
      }
    }
    T val = result;
    rden = 1;
    tick();
    rden = 0;
    return val;
  }

  // Drain a void-return FIFO (e.g. clear): wait non-empty, pulse rden.
  void drain_fifo(uint8_t& rden, const uint8_t& empty) {
    int waited = 0;
    while (empty) {
      tick();
      if (++waited > _timeout) {
        std::fprintf(stderr, "TIMEOUT: FIFO empty never deasserted (drain)\n");
        std::abort();
      }
    }
    rden = 1;
    tick();
    rden = 0;
  }

  VModel* dut() { return _dut.get(); }
  uint64_t cycle_count() const { return _cycle; }

 private:
  std::unique_ptr<VerilatedContext> _ctx;
  std::unique_ptr<VModel> _dut;
  int _timeout;
  uint64_t _cycle;
};
