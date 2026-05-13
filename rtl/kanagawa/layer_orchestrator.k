// OpenTaalas - Layer Orchestrator (v12)
//
// Pure-Kanagawa orchestrator that owns all per-layer sub-modules and exposes
// a minimal high-level interface. Goal: drop layer_block boundary pin count
// from v11.3's 1225 down to ~50, making chip-level routing tractable on sky130.
//
// Composes rope_apply, vector_unit (and more later) as private fields. Inner
// per-element loops use pipelined_for from the Kanagawa control library.
//
// Skeleton step: validates composition + pipelined_for + sub-module method
// chaining within one high-level method. Once compiled cleanly we'll grow it
// to all 12 phase methods per the v12 plan.

module opentaalas.layer_orchestrator
    { layer_orchestrator
    }

import opentaalas.rope_apply
import opentaalas.vector_unit
import control.loop

class layer_orchestrator
{
private:
    rope_apply  _rope;
    vector_unit _vpu;

public:
    // ----------------------------------------------------------------
    // Cascade in/out — pure pass-through to _rope. (Stays exposed
    // because the chip-level wrapper drives this from rope_gen output.)
    // ----------------------------------------------------------------
    void forward_cos(uint2 phase, uint<256> v)  { _rope.forward_cos(phase, v); }
    void forward_sin(uint2 phase, uint<256> v)  { _rope.forward_sin(phase, v); }
    uint<256> read_cos_forwarded(uint2 phase)   { return _rope.read_cos_forwarded(phase); }
    uint<256> read_sin_forwarded(uint2 phase)   { return _rope.read_sin_forwarded(phase); }

    // ----------------------------------------------------------------
    // Programming pass-throughs (boot-time table fill). Could collapse
    // into a single 4-bit cmd dispatch later for further pin reduction.
    // ----------------------------------------------------------------
    void prog_gamma_pre_attn(uint16 idx, uint16 val) { _vpu.set_gamma_pre_attn(idx, val); }
    void prog_gamma_pre_mlp(uint16 idx, uint16 val)  { _vpu.set_gamma_pre_mlp(idx, val); }
    void prog_rsqrt_lut(uint8 idx, uint16 val)       { _vpu.set_rsqrt_lut(idx, val); }
    void prog_sigmoid_lut(uint8 idx, uint16 val)     { _vpu.set_sigmoid_lut(idx, val); }

    // ----------------------------------------------------------------
    // High-level phase methods — orchestrator runs the inner loop internally.
    // These are the methods that actually FOLD pins by burying many sub-module
    // calls inside one orchestrator transaction.
    // ----------------------------------------------------------------

    // RMSNorm sum-of-squares accumulation over `dim` BF16 elements.
    // Caller streams elements via stream_input(); orchestrator drives _vpu.
    // For the skeleton we just expose the rmsnorm_get_sum / rmsnorm_reset.
    void rmsnorm_reset() { _vpu.rmsnorm_reset(); }
    uint32 rmsnorm_get_sum() { return _vpu.rmsnorm_get_sum(); }

    // Single accumulation step (caller drives the loop counter externally).
    // Boundary cost: ~20 pins. Trade-off vs internal pipelined_for is loop
    // visibility — caller can interleave with other work.
    void rmsnorm_step(uint16 x_bf16) { _vpu.rmsnorm_accumulate(x_bf16); }

    // SwiGLU per-element compute. Boundary: ~40 pins.
    uint16 swiglu_step(uint16 gate_bf16, uint16 up_bf16) {
        return _vpu.swiglu_compute(gate_bf16, up_bf16);
    }

    // Residual add per-element. Boundary: ~38 pins.
    uint16 residual_add_step(uint16 a_bf16, uint16 b_bf16) {
        return _vpu.residual_add(a_bf16, b_bf16);
    }

    // Per-element BF16 rotate — composed forward to _rope.
    uint16 rotate_even(uint16 x_even, uint16 x_odd, uint16 cos_val, uint16 sin_val) {
        return _rope.rotate_even(x_even, x_odd, cos_val, sin_val);
    }
    uint16 rotate_odd(uint16 x_even, uint16 x_odd, uint16 cos_val, uint16 sin_val) {
        return _rope.rotate_odd(x_even, x_odd, cos_val, sin_val);
    }
}

export layer_orchestrator;
