
// This file was generated. Do not modify.
// kanagawa --backend=sv --import-dir=/home/mana/workspace/OpenTaalas/third-party/kanagawa/library --base-library=/home/mana/workspace/OpenTaalas/third-party/kanagawa/library/mini-base.k --output=/home/mana/workspace/OpenTaalas/rtl/generated/kanagawa/layer_orchestrator --frequency=250 --register-ratio=8 --max-register-ratio=16 /home/mana/workspace/OpenTaalas/rtl/kanagawa/layer_orchestrator.k

`default_nettype wire
module rope_applyDebugView_forward_cosEntry
(
    input wire clk,
    input wire[1:0]  _phase,
    input wire[255:0]  _v,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("forward_cosEntry time: %0t phase: %p v: %p", $time, _phase, _v);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module rope_applyDebugView_forward_sinEntry
(
    input wire clk,
    input wire[1:0]  _phase,
    input wire[255:0]  _v,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("forward_sinEntry time: %0t phase: %p v: %p", $time, _phase, _v);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module rope_applyDebugView_read_cos_forwardedEntry
(
    input wire clk,
    input wire[1:0]  _phase,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("read_cos_forwardedEntry time: %0t phase: %p", $time, _phase);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module rope_applyDebugView_read_cos_forwardedExit
(
    input wire clk,
    input wire[255:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("read_cos_forwardedExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module rope_applyDebugView_read_sin_forwardedEntry
(
    input wire clk,
    input wire[1:0]  _phase,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("read_sin_forwardedEntry time: %0t phase: %p", $time, _phase);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module rope_applyDebugView_read_sin_forwardedExit
(
    input wire clk,
    input wire[255:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("read_sin_forwardedExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module rope_applyDebugView_rotate_evenEntry
(
    input wire clk,
    input wire[15:0]  _x_even,
    input wire[15:0]  _x_odd,
    input wire[15:0]  _cos_val,
    input wire[15:0]  _sin_val,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("rotate_evenEntry time: %0t x_even: %p x_odd: %p cos_val: %p sin_val: %p", $time, _x_even, _x_odd, _cos_val, _sin_val);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module rope_applyDebugView_rotate_evenExit
(
    input wire clk,
    input wire[15:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("rotate_evenExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module rope_applyDebugView_rotate_oddEntry
(
    input wire clk,
    input wire[15:0]  _x_even,
    input wire[15:0]  _x_odd,
    input wire[15:0]  _cos_val,
    input wire[15:0]  _sin_val,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("rotate_oddEntry time: %0t x_even: %p x_odd: %p cos_val: %p sin_val: %p", $time, _x_even, _x_odd, _cos_val, _sin_val);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module rope_applyDebugView_rotate_oddExit
(
    input wire clk,
    input wire[15:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("rotate_oddExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
`ifndef _TYPESCOPE_CoreModuleTypeScope
`define _TYPESCOPE_CoreModuleTypeScope
`endif // _TYPESCOPE_CoreModuleTypeScope
module rope_apply_rotate_odd_BasicBlock_0(	// rope_apply.k:273:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  output wire [15:0] fifo_data_out_0,
  output wire        fifo_wren_0,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [63:0] data_in_11,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  logic        done_out_0;	// rope_apply.k:273:9
  logic [15:0] fifo_data_out_0_0;	// rope_apply.k:273:9
  logic        fifo_wren_0_0;	// rope_apply.k:273:9
  logic        input_rdy_0_0;	// rope_apply.k:273:9
  logic [7:0]  control_state_out_0;	// rope_apply.k:273:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// rope_apply.k:273:9
  always_comb begin	// rope_apply.k:273:9
    input_rdy_0_0 = _GEN;	// rope_apply.k:273:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// rope_apply.k:273:9
  end // always_comb
  reg   [15:0] p0_x_even;	// rope_apply.k:273:9
  reg   [15:0] p0_x_odd;	// rope_apply.k:273:9
  reg   [15:0] p0_cos_val;	// rope_apply.k:273:9
  reg   [15:0] p0_sin_val;	// rope_apply.k:273:9
  reg          p0_stage1_enable = 1'h0;	// rope_apply.k:273:9
  reg   [12:0] p0__prod_plus_ma32_shl_4_;	// rope_apply.k:273:9
  reg   [5:0]  p0_mb;	// rope_apply.k:273:9
  reg   [11:0] p0_prod;	// rope_apply.k:273:9
  reg   [12:0] p0__prod_plus_ma32_shl_4__0;	// rope_apply.k:273:9
  reg   [5:0]  p0_mb_0;	// rope_apply.k:273:9
  reg   [11:0] p0_prod_0;	// rope_apply.k:273:9
  reg   [13:0] p0__ma32_shl_5_;	// rope_apply.k:273:9
  reg   [13:0] p0__ma32_shl_5__0;	// rope_apply.k:273:9
  reg   [14:0] p0__ma32_shl_6_;	// rope_apply.k:273:9
  reg   [14:0] p0__ma32_shl_6__0;	// rope_apply.k:273:9
  reg          p0_mb_1;	// rope_apply.k:273:9
  reg          p0_mb_2;	// rope_apply.k:273:9
  reg   [15:0] p0__ma32_shl_7_;	// rope_apply.k:273:9
  reg   [15:0] p0__ma32_shl_7__0;	// rope_apply.k:273:9
  reg   [15:0] p0__a_exp_plus_b_exp_minus_127_plus_1_;	// rope_apply.k:273:9
  reg   [15:0] p0__a_exp_plus_b_exp_minus_127_;	// rope_apply.k:273:9
  reg   [15:0] p0__a_exp_plus_b_exp_minus_127_plus_1__0;	// rope_apply.k:273:9
  reg   [15:0] p0__a_exp_plus_b_exp_minus_127__0;	// rope_apply.k:273:9
  reg   [15:0] p0_sin_val_0;	// rope_apply.k:273:9
  reg   [15:0] p0_x_even_0;	// rope_apply.k:273:9
  reg   [15:0] p0_cos_val_0;	// rope_apply.k:273:9
  reg   [15:0] p0_x_odd_0;	// rope_apply.k:273:9
  reg          p0__b_exp_ne_0_;	// rope_apply.k:273:9
  reg          p0__a_exp_ne_0_;	// rope_apply.k:273:9
  reg          p0__b_exp_ne_0__0;	// rope_apply.k:273:9
  reg          p0__a_exp_ne_0__0;	// rope_apply.k:273:9
  reg          p0_stage2_enable = 1'h0;	// rope_apply.k:273:9
  reg          p0_prod_1;	// rope_apply.k:273:9
  reg   [15:0] p0__a_exp_plus_b_exp_minus_127_plus_1__1;	// rope_apply.k:273:9
  reg   [15:0] p0__a_exp_plus_b_exp_minus_127__1;	// rope_apply.k:273:9
  reg          p0_prod_2;	// rope_apply.k:273:9
  reg   [15:0] p0__a_exp_plus_b_exp_minus_127_plus_1__2;	// rope_apply.k:273:9
  reg   [15:0] p0__a_exp_plus_b_exp_minus_127__2;	// rope_apply.k:273:9
  reg   [15:0] p0_sin_val_1;	// rope_apply.k:273:9
  reg   [15:0] p0_x_even_1;	// rope_apply.k:273:9
  reg   [14:0] p0_prod_3;	// rope_apply.k:273:9
  reg   [15:0] p0_cos_val_1;	// rope_apply.k:273:9
  reg   [15:0] p0_x_odd_1;	// rope_apply.k:273:9
  reg   [14:0] p0_prod_4;	// rope_apply.k:273:9
  reg          p0__b_exp_ne_0__1;	// rope_apply.k:273:9
  reg          p0__a_exp_ne_0__1;	// rope_apply.k:273:9
  reg          p0__b_exp_ne_0__2;	// rope_apply.k:273:9
  reg          p0__a_exp_ne_0__2;	// rope_apply.k:273:9
  reg          p0_stage3_enable = 1'h0;	// rope_apply.k:273:9
  reg   [11:0] p0_aligned_b;	// rope_apply.k:273:9
  reg   [1:0]  p0_shift;	// rope_apply.k:273:9
  reg   [11:0] p0_aligned_a;	// rope_apply.k:273:9
  reg   [1:0]  p0_shift_0;	// rope_apply.k:273:9
  reg          p0__pa_exp_ge_pb_exp_;	// rope_apply.k:273:9
  reg   [10:0] p0__pa_mant_shl_4_;	// rope_apply.k:273:9
  reg   [10:0] p0__pb_mant_shl_4_;	// rope_apply.k:273:9
  reg          p0__pa_sign_eq_pb_sign_;	// rope_apply.k:273:9
  reg   [15:0] p0_sr_exp;	// rope_apply.k:273:9
  reg          p0_pa_sign;	// rope_apply.k:273:9
  reg          p0_pb_sign;	// rope_apply.k:273:9
  reg   [15:0] p0_p1;	// rope_apply.k:273:9
  reg          p0__pb_exp_eq_0_;	// rope_apply.k:273:9
  reg          p0__pa_exp_eq_0_;	// rope_apply.k:273:9
  reg   [15:0] p0_p2;	// rope_apply.k:273:9
  reg          p0_stage4_enable = 1'h0;	// rope_apply.k:273:9
  reg   [7:0]  p0__tmp_and_240_;	// rope_apply.k:273:9
  reg   [15:0] p0_tmp;	// rope_apply.k:273:9
  reg          p0__tmp_and_65280_ne_0_;	// rope_apply.k:273:9
  reg   [15:0] p0_sr_exp_0;	// rope_apply.k:273:9
  reg   [15:0] p0_sum;	// rope_apply.k:273:9
  reg          p0_pa_sign_0;	// rope_apply.k:273:9
  reg          p0_pb_sign_0;	// rope_apply.k:273:9
  reg          p0__aligned_a_ge_aligned_b_;	// rope_apply.k:273:9
  reg          p0__pa_sign_eq_pb_sign__0;	// rope_apply.k:273:9
  reg   [15:0] p0_p1_0;	// rope_apply.k:273:9
  reg          p0__sum_ne_0_;	// rope_apply.k:273:9
  reg          p0__pb_exp_eq_0__0;	// rope_apply.k:273:9
  reg          p0__pa_exp_eq_0__0;	// rope_apply.k:273:9
  reg   [15:0] p0_p2_0;	// rope_apply.k:273:9
  reg          p0_stage5_enable = 1'h0;	// rope_apply.k:273:9
  reg          p0__pa_exp_eq_0__1;	// rope_apply.k:273:9
  reg   [15:0] p0_p2_1;	// rope_apply.k:273:9
  reg   [15:0] p0_result;	// rope_apply.k:273:9
  reg          p0_stage6_enable = 1'h0;	// rope_apply.k:273:9
  reg   [15:0] p0_result_0;	// rope_apply.k:273:9
  reg          p0_stage7_enable = 1'h0;	// rope_apply.k:273:9
  reg   [15:0] p0_result_1;	// rope_apply.k:273:9
  reg          p0_stage8_enable = 1'h0;	// rope_apply.k:273:9
  reg   [15:0] p0_result_2;	// rope_apply.k:273:9
  reg          p0_stage9_enable = 1'h0;	// rope_apply.k:273:9
  wire         prod = p0_x_even[6] & p0_sin_val[0];	// rope_apply.k:273:9, :284:{21,33}, :285:{21,33}, :287:35, :288:{21,25}
  wire         prod_0 = p0_x_even[5] & p0_sin_val[0];	// rope_apply.k:273:9, :284:{21,33}, :285:{21,33}, :287:35, :288:{21,25}
  wire         prod_1 = p0_x_even[4] & p0_sin_val[0];	// rope_apply.k:273:9, :284:{21,33}, :285:{21,33}, :287:35, :288:{21,25}
  wire         prod_2 = p0_x_even[3] & p0_sin_val[0];	// rope_apply.k:273:9, :284:{21,33}, :285:{21,33}, :287:35, :288:{21,25}
  wire         prod_3 = p0_x_even[2] & p0_sin_val[0];	// rope_apply.k:273:9, :284:{21,33}, :285:{21,33}, :287:35, :288:{21,25}
  wire         prod_4 = p0_x_even[1] & p0_sin_val[0];	// rope_apply.k:273:9, :284:{21,33}, :285:{21,33}, :287:35, :288:{21,25}
  wire         prod_5 = p0_x_even[0] & p0_sin_val[0];	// rope_apply.k:273:9, :284:{21,33}, :285:{21,33}, :287:35, :288:{21,25}
  wire  [15:0] _a_exp_plus_b_exp_ =
    16'({8'h0, p0_x_even[14:7]} + {8'h0, p0_sin_val[14:7]});	// rope_apply.k:273:9, :301:39, :306:39
  wire         prod_6 = p0_x_odd[6] & p0_cos_val[0];	// rope_apply.k:273:9, :323:{21,33}, :324:{21,33}, :326:35, :327:{21,25}
  wire         prod_7 = p0_x_odd[5] & p0_cos_val[0];	// rope_apply.k:273:9, :323:{21,33}, :324:{21,33}, :326:35, :327:{21,25}
  wire         prod_8 = p0_x_odd[4] & p0_cos_val[0];	// rope_apply.k:273:9, :323:{21,33}, :324:{21,33}, :326:35, :327:{21,25}
  wire         prod_9 = p0_x_odd[3] & p0_cos_val[0];	// rope_apply.k:273:9, :323:{21,33}, :324:{21,33}, :326:35, :327:{21,25}
  wire         prod_10 = p0_x_odd[2] & p0_cos_val[0];	// rope_apply.k:273:9, :323:{21,33}, :324:{21,33}, :326:35, :327:{21,25}
  wire         prod_11 = p0_x_odd[1] & p0_cos_val[0];	// rope_apply.k:273:9, :323:{21,33}, :324:{21,33}, :326:35, :327:{21,25}
  wire         prod_12 = p0_x_odd[0] & p0_cos_val[0];	// rope_apply.k:273:9, :323:{21,33}, :324:{21,33}, :326:35, :327:{21,25}
  wire  [15:0] _a_exp_plus_b_exp__0 =
    16'({8'h0, p0_x_odd[14:7]} + {8'h0, p0_cos_val[14:7]});	// rope_apply.k:273:9, :340:39, :345:39
  wire  [9:0]  _prod_plus_ma32_shl_1_ =
    10'({2'h0, p0_sin_val[0], prod, prod_0, prod_1, prod_2, prod_3, prod_4, prod_5}
        + {2'h1, p0_x_even[6:0], 1'h0});	// rope_apply.k:273:9, :285:{21,33}, :288:{21,25}, :289:{51,58}
  wire  [9:0]  _prod_plus_ma32_shl_1__0 =
    10'({2'h0, p0_cos_val[0], prod_6, prod_7, prod_8, prod_9, prod_10, prod_11, prod_12}
        + {2'h1, p0_x_odd[6:0], 1'h0});	// rope_apply.k:273:9, :324:{21,33}, :327:{21,25}, :328:{51,58}
  wire         prod_13 = _prod_plus_ma32_shl_1_[9] & p0_sin_val[1];	// rope_apply.k:273:9, :285:{21,33}, :289:{21,25,51}
  wire         prod_14 = _prod_plus_ma32_shl_1_[8] & p0_sin_val[1];	// rope_apply.k:273:9, :285:{21,33}, :289:{21,25,51}
  wire         prod_15 =
    _prod_plus_ma32_shl_1_[7]
      ? p0_sin_val[0] | p0_sin_val[1]
      : p0_sin_val[0] & ~(p0_sin_val[1]);	// rope_apply.k:273:9, :285:{21,33}, :289:{21,25,51}
  wire         prod_16 =
    _prod_plus_ma32_shl_1_[6] ? prod | p0_sin_val[1] : prod & ~(p0_sin_val[1]);	// rope_apply.k:273:9, :285:{21,33}, :288:{21,25}, :289:{21,25,51}
  wire         prod_17 =
    _prod_plus_ma32_shl_1_[5] ? prod_0 | p0_sin_val[1] : prod_0 & ~(p0_sin_val[1]);	// rope_apply.k:273:9, :285:{21,33}, :288:{21,25}, :289:{21,25,51}
  wire         prod_18 =
    _prod_plus_ma32_shl_1_[4] ? prod_1 | p0_sin_val[1] : prod_1 & ~(p0_sin_val[1]);	// rope_apply.k:273:9, :285:{21,33}, :288:{21,25}, :289:{21,25,51}
  wire         prod_19 =
    _prod_plus_ma32_shl_1_[3] ? prod_2 | p0_sin_val[1] : prod_2 & ~(p0_sin_val[1]);	// rope_apply.k:273:9, :285:{21,33}, :288:{21,25}, :289:{21,25,51}
  wire         prod_20 =
    _prod_plus_ma32_shl_1_[2] ? prod_3 | p0_sin_val[1] : prod_3 & ~(p0_sin_val[1]);	// rope_apply.k:273:9, :285:{21,33}, :288:{21,25}, :289:{21,25,51}
  wire         prod_21 =
    _prod_plus_ma32_shl_1_[1] ? prod_4 | p0_sin_val[1] : prod_4 & ~(p0_sin_val[1]);	// rope_apply.k:273:9, :285:{21,33}, :288:{21,25}, :289:{21,25,51}
  wire         prod_22 =
    _prod_plus_ma32_shl_1_[0] ? prod_5 | p0_sin_val[1] : prod_5 & ~(p0_sin_val[1]);	// rope_apply.k:273:9, :285:{21,33}, :288:{21,25}, :289:{21,25,51}
  wire         prod_23 = _prod_plus_ma32_shl_1__0[9] & p0_cos_val[1];	// rope_apply.k:273:9, :324:{21,33}, :328:{21,25,51}
  wire         prod_24 = _prod_plus_ma32_shl_1__0[8] & p0_cos_val[1];	// rope_apply.k:273:9, :324:{21,33}, :328:{21,25,51}
  wire         prod_25 =
    _prod_plus_ma32_shl_1__0[7]
      ? p0_cos_val[0] | p0_cos_val[1]
      : p0_cos_val[0] & ~(p0_cos_val[1]);	// rope_apply.k:273:9, :324:{21,33}, :328:{21,25,51}
  wire         prod_26 =
    _prod_plus_ma32_shl_1__0[6] ? prod_6 | p0_cos_val[1] : prod_6 & ~(p0_cos_val[1]);	// rope_apply.k:273:9, :324:{21,33}, :327:{21,25}, :328:{21,25,51}
  wire         prod_27 =
    _prod_plus_ma32_shl_1__0[5] ? prod_7 | p0_cos_val[1] : prod_7 & ~(p0_cos_val[1]);	// rope_apply.k:273:9, :324:{21,33}, :327:{21,25}, :328:{21,25,51}
  wire         prod_28 =
    _prod_plus_ma32_shl_1__0[4] ? prod_8 | p0_cos_val[1] : prod_8 & ~(p0_cos_val[1]);	// rope_apply.k:273:9, :324:{21,33}, :327:{21,25}, :328:{21,25,51}
  wire         prod_29 =
    _prod_plus_ma32_shl_1__0[3] ? prod_9 | p0_cos_val[1] : prod_9 & ~(p0_cos_val[1]);	// rope_apply.k:273:9, :324:{21,33}, :327:{21,25}, :328:{21,25,51}
  wire         prod_30 =
    _prod_plus_ma32_shl_1__0[2] ? prod_10 | p0_cos_val[1] : prod_10 & ~(p0_cos_val[1]);	// rope_apply.k:273:9, :324:{21,33}, :327:{21,25}, :328:{21,25,51}
  wire         prod_31 =
    _prod_plus_ma32_shl_1__0[1] ? prod_11 | p0_cos_val[1] : prod_11 & ~(p0_cos_val[1]);	// rope_apply.k:273:9, :324:{21,33}, :327:{21,25}, :328:{21,25,51}
  wire         prod_32 =
    _prod_plus_ma32_shl_1__0[0] ? prod_12 | p0_cos_val[1] : prod_12 & ~(p0_cos_val[1]);	// rope_apply.k:273:9, :324:{21,33}, :327:{21,25}, :328:{21,25,51}
  wire  [10:0] _prod_plus_ma32_shl_2_ =
    11'({1'h0,
         prod_13,
         prod_14,
         prod_15,
         prod_16,
         prod_17,
         prod_18,
         prod_19,
         prod_20,
         prod_21,
         prod_22} + {2'h1, p0_x_even[6:0], 2'h0});	// rope_apply.k:273:9, :289:{21,25}, :290:{51,58}
  wire  [10:0] _prod_plus_ma32_shl_2__0 =
    11'({1'h0,
         prod_23,
         prod_24,
         prod_25,
         prod_26,
         prod_27,
         prod_28,
         prod_29,
         prod_30,
         prod_31,
         prod_32} + {2'h1, p0_x_odd[6:0], 2'h0});	// rope_apply.k:273:9, :328:{21,25}, :329:{51,58}
  wire         prod_33 = _prod_plus_ma32_shl_2_[10] & p0_sin_val[2];	// rope_apply.k:273:9, :285:{21,33}, :290:{21,25,51}
  wire         prod_34 =
    _prod_plus_ma32_shl_2_[9] ? prod_13 | p0_sin_val[2] : prod_13 & ~(p0_sin_val[2]);	// rope_apply.k:273:9, :285:{21,33}, :289:{21,25}, :290:{21,25,51}
  wire         prod_35 =
    _prod_plus_ma32_shl_2_[8] ? prod_14 | p0_sin_val[2] : prod_14 & ~(p0_sin_val[2]);	// rope_apply.k:273:9, :285:{21,33}, :289:{21,25}, :290:{21,25,51}
  wire         prod_36 =
    _prod_plus_ma32_shl_2_[7] ? prod_15 | p0_sin_val[2] : prod_15 & ~(p0_sin_val[2]);	// rope_apply.k:273:9, :285:{21,33}, :289:{21,25}, :290:{21,25,51}
  wire         prod_37 =
    _prod_plus_ma32_shl_2_[6] ? prod_16 | p0_sin_val[2] : prod_16 & ~(p0_sin_val[2]);	// rope_apply.k:273:9, :285:{21,33}, :289:{21,25}, :290:{21,25,51}
  wire         prod_38 =
    _prod_plus_ma32_shl_2_[5] ? prod_17 | p0_sin_val[2] : prod_17 & ~(p0_sin_val[2]);	// rope_apply.k:273:9, :285:{21,33}, :289:{21,25}, :290:{21,25,51}
  wire         prod_39 =
    _prod_plus_ma32_shl_2_[4] ? prod_18 | p0_sin_val[2] : prod_18 & ~(p0_sin_val[2]);	// rope_apply.k:273:9, :285:{21,33}, :289:{21,25}, :290:{21,25,51}
  wire         prod_40 =
    _prod_plus_ma32_shl_2_[3] ? prod_19 | p0_sin_val[2] : prod_19 & ~(p0_sin_val[2]);	// rope_apply.k:273:9, :285:{21,33}, :289:{21,25}, :290:{21,25,51}
  wire         prod_41 =
    _prod_plus_ma32_shl_2_[2] ? prod_20 | p0_sin_val[2] : prod_20 & ~(p0_sin_val[2]);	// rope_apply.k:273:9, :285:{21,33}, :289:{21,25}, :290:{21,25,51}
  wire         prod_42 =
    _prod_plus_ma32_shl_2_[1] ? prod_21 | p0_sin_val[2] : prod_21 & ~(p0_sin_val[2]);	// rope_apply.k:273:9, :285:{21,33}, :289:{21,25}, :290:{21,25,51}
  wire         prod_43 =
    _prod_plus_ma32_shl_2_[0] ? prod_22 | p0_sin_val[2] : prod_22 & ~(p0_sin_val[2]);	// rope_apply.k:273:9, :285:{21,33}, :289:{21,25}, :290:{21,25,51}
  wire         prod_44 = _prod_plus_ma32_shl_2__0[10] & p0_cos_val[2];	// rope_apply.k:273:9, :324:{21,33}, :329:{21,25,51}
  wire         prod_45 =
    _prod_plus_ma32_shl_2__0[9] ? prod_23 | p0_cos_val[2] : prod_23 & ~(p0_cos_val[2]);	// rope_apply.k:273:9, :324:{21,33}, :328:{21,25}, :329:{21,25,51}
  wire         prod_46 =
    _prod_plus_ma32_shl_2__0[8] ? prod_24 | p0_cos_val[2] : prod_24 & ~(p0_cos_val[2]);	// rope_apply.k:273:9, :324:{21,33}, :328:{21,25}, :329:{21,25,51}
  wire         prod_47 =
    _prod_plus_ma32_shl_2__0[7] ? prod_25 | p0_cos_val[2] : prod_25 & ~(p0_cos_val[2]);	// rope_apply.k:273:9, :324:{21,33}, :328:{21,25}, :329:{21,25,51}
  wire         prod_48 =
    _prod_plus_ma32_shl_2__0[6] ? prod_26 | p0_cos_val[2] : prod_26 & ~(p0_cos_val[2]);	// rope_apply.k:273:9, :324:{21,33}, :328:{21,25}, :329:{21,25,51}
  wire         prod_49 =
    _prod_plus_ma32_shl_2__0[5] ? prod_27 | p0_cos_val[2] : prod_27 & ~(p0_cos_val[2]);	// rope_apply.k:273:9, :324:{21,33}, :328:{21,25}, :329:{21,25,51}
  wire         prod_50 =
    _prod_plus_ma32_shl_2__0[4] ? prod_28 | p0_cos_val[2] : prod_28 & ~(p0_cos_val[2]);	// rope_apply.k:273:9, :324:{21,33}, :328:{21,25}, :329:{21,25,51}
  wire         prod_51 =
    _prod_plus_ma32_shl_2__0[3] ? prod_29 | p0_cos_val[2] : prod_29 & ~(p0_cos_val[2]);	// rope_apply.k:273:9, :324:{21,33}, :328:{21,25}, :329:{21,25,51}
  wire         prod_52 =
    _prod_plus_ma32_shl_2__0[2] ? prod_30 | p0_cos_val[2] : prod_30 & ~(p0_cos_val[2]);	// rope_apply.k:273:9, :324:{21,33}, :328:{21,25}, :329:{21,25,51}
  wire         prod_53 =
    _prod_plus_ma32_shl_2__0[1] ? prod_31 | p0_cos_val[2] : prod_31 & ~(p0_cos_val[2]);	// rope_apply.k:273:9, :324:{21,33}, :328:{21,25}, :329:{21,25,51}
  wire         prod_54 =
    _prod_plus_ma32_shl_2__0[0] ? prod_32 | p0_cos_val[2] : prod_32 & ~(p0_cos_val[2]);	// rope_apply.k:273:9, :324:{21,33}, :328:{21,25}, :329:{21,25,51}
  wire  [11:0] _prod_plus_ma32_shl_3_ =
    12'({1'h0,
         prod_33,
         prod_34,
         prod_35,
         prod_36,
         prod_37,
         prod_38,
         prod_39,
         prod_40,
         prod_41,
         prod_42,
         prod_43} + {2'h1, p0_x_even[6:0], 3'h0});	// rope_apply.k:273:9, :290:{21,25}, :291:{51,58}
  wire  [11:0] _prod_plus_ma32_shl_3__0 =
    12'({1'h0,
         prod_44,
         prod_45,
         prod_46,
         prod_47,
         prod_48,
         prod_49,
         prod_50,
         prod_51,
         prod_52,
         prod_53,
         prod_54} + {2'h1, p0_x_odd[6:0], 3'h0});	// rope_apply.k:273:9, :329:{21,25}, :330:{51,58}
  wire         prod_55 = _prod_plus_ma32_shl_3_[11] & p0_sin_val[3];	// rope_apply.k:273:9, :285:{21,33}, :291:{21,25,51}
  wire         prod_56 =
    _prod_plus_ma32_shl_3_[10] ? prod_33 | p0_sin_val[3] : prod_33 & ~(p0_sin_val[3]);	// rope_apply.k:273:9, :285:{21,33}, :290:{21,25}, :291:{21,25,51}
  wire         prod_57 =
    _prod_plus_ma32_shl_3_[9] ? prod_34 | p0_sin_val[3] : prod_34 & ~(p0_sin_val[3]);	// rope_apply.k:273:9, :285:{21,33}, :290:{21,25}, :291:{21,25,51}
  wire         prod_58 =
    _prod_plus_ma32_shl_3_[8] ? prod_35 | p0_sin_val[3] : prod_35 & ~(p0_sin_val[3]);	// rope_apply.k:273:9, :285:{21,33}, :290:{21,25}, :291:{21,25,51}
  wire         prod_59 =
    _prod_plus_ma32_shl_3_[7] ? prod_36 | p0_sin_val[3] : prod_36 & ~(p0_sin_val[3]);	// rope_apply.k:273:9, :285:{21,33}, :290:{21,25}, :291:{21,25,51}
  wire         prod_60 =
    _prod_plus_ma32_shl_3_[6] ? prod_37 | p0_sin_val[3] : prod_37 & ~(p0_sin_val[3]);	// rope_apply.k:273:9, :285:{21,33}, :290:{21,25}, :291:{21,25,51}
  wire         prod_61 =
    _prod_plus_ma32_shl_3_[5] ? prod_38 | p0_sin_val[3] : prod_38 & ~(p0_sin_val[3]);	// rope_apply.k:273:9, :285:{21,33}, :290:{21,25}, :291:{21,25,51}
  wire         prod_62 =
    _prod_plus_ma32_shl_3_[4] ? prod_39 | p0_sin_val[3] : prod_39 & ~(p0_sin_val[3]);	// rope_apply.k:273:9, :285:{21,33}, :290:{21,25}, :291:{21,25,51}
  wire         prod_63 =
    _prod_plus_ma32_shl_3_[3] ? prod_40 | p0_sin_val[3] : prod_40 & ~(p0_sin_val[3]);	// rope_apply.k:273:9, :285:{21,33}, :290:{21,25}, :291:{21,25,51}
  wire         prod_64 =
    _prod_plus_ma32_shl_3_[2] ? prod_41 | p0_sin_val[3] : prod_41 & ~(p0_sin_val[3]);	// rope_apply.k:273:9, :285:{21,33}, :290:{21,25}, :291:{21,25,51}
  wire         prod_65 =
    _prod_plus_ma32_shl_3_[1] ? prod_42 | p0_sin_val[3] : prod_42 & ~(p0_sin_val[3]);	// rope_apply.k:273:9, :285:{21,33}, :290:{21,25}, :291:{21,25,51}
  wire         prod_66 =
    _prod_plus_ma32_shl_3_[0] ? prod_43 | p0_sin_val[3] : prod_43 & ~(p0_sin_val[3]);	// rope_apply.k:273:9, :285:{21,33}, :290:{21,25}, :291:{21,25,51}
  wire         prod_67 = _prod_plus_ma32_shl_3__0[11] & p0_cos_val[3];	// rope_apply.k:273:9, :324:{21,33}, :330:{21,25,51}
  wire         prod_68 =
    _prod_plus_ma32_shl_3__0[10] ? prod_44 | p0_cos_val[3] : prod_44 & ~(p0_cos_val[3]);	// rope_apply.k:273:9, :324:{21,33}, :329:{21,25}, :330:{21,25,51}
  wire         prod_69 =
    _prod_plus_ma32_shl_3__0[9] ? prod_45 | p0_cos_val[3] : prod_45 & ~(p0_cos_val[3]);	// rope_apply.k:273:9, :324:{21,33}, :329:{21,25}, :330:{21,25,51}
  wire         prod_70 =
    _prod_plus_ma32_shl_3__0[8] ? prod_46 | p0_cos_val[3] : prod_46 & ~(p0_cos_val[3]);	// rope_apply.k:273:9, :324:{21,33}, :329:{21,25}, :330:{21,25,51}
  wire         prod_71 =
    _prod_plus_ma32_shl_3__0[7] ? prod_47 | p0_cos_val[3] : prod_47 & ~(p0_cos_val[3]);	// rope_apply.k:273:9, :324:{21,33}, :329:{21,25}, :330:{21,25,51}
  wire         prod_72 =
    _prod_plus_ma32_shl_3__0[6] ? prod_48 | p0_cos_val[3] : prod_48 & ~(p0_cos_val[3]);	// rope_apply.k:273:9, :324:{21,33}, :329:{21,25}, :330:{21,25,51}
  wire         prod_73 =
    _prod_plus_ma32_shl_3__0[5] ? prod_49 | p0_cos_val[3] : prod_49 & ~(p0_cos_val[3]);	// rope_apply.k:273:9, :324:{21,33}, :329:{21,25}, :330:{21,25,51}
  wire         prod_74 =
    _prod_plus_ma32_shl_3__0[4] ? prod_50 | p0_cos_val[3] : prod_50 & ~(p0_cos_val[3]);	// rope_apply.k:273:9, :324:{21,33}, :329:{21,25}, :330:{21,25,51}
  wire         prod_75 =
    _prod_plus_ma32_shl_3__0[3] ? prod_51 | p0_cos_val[3] : prod_51 & ~(p0_cos_val[3]);	// rope_apply.k:273:9, :324:{21,33}, :329:{21,25}, :330:{21,25,51}
  wire         prod_76 =
    _prod_plus_ma32_shl_3__0[2] ? prod_52 | p0_cos_val[3] : prod_52 & ~(p0_cos_val[3]);	// rope_apply.k:273:9, :324:{21,33}, :329:{21,25}, :330:{21,25,51}
  wire         prod_77 =
    _prod_plus_ma32_shl_3__0[1] ? prod_53 | p0_cos_val[3] : prod_53 & ~(p0_cos_val[3]);	// rope_apply.k:273:9, :324:{21,33}, :329:{21,25}, :330:{21,25,51}
  wire         prod_78 =
    _prod_plus_ma32_shl_3__0[0] ? prod_54 | p0_cos_val[3] : prod_54 & ~(p0_cos_val[3]);	// rope_apply.k:273:9, :324:{21,33}, :329:{21,25}, :330:{21,25,51}
  wire         prod_79 = p0__prod_plus_ma32_shl_4_[12] & p0_mb[4];	// rope_apply.k:273:9, :292:{21,25}
  wire         prod_80 =
    p0__prod_plus_ma32_shl_4_[11] ? p0_prod[11] | p0_mb[4] : p0_prod[11] & ~(p0_mb[4]);	// rope_apply.k:273:9, :292:{21,25}
  wire         prod_81 =
    p0__prod_plus_ma32_shl_4_[10] ? p0_prod[10] | p0_mb[4] : p0_prod[10] & ~(p0_mb[4]);	// rope_apply.k:273:9, :292:{21,25}
  wire         prod_82 =
    p0__prod_plus_ma32_shl_4_[9] ? p0_prod[9] | p0_mb[4] : p0_prod[9] & ~(p0_mb[4]);	// rope_apply.k:273:9, :292:{21,25}
  wire         prod_83 =
    p0__prod_plus_ma32_shl_4_[8] ? p0_prod[8] | p0_mb[4] : p0_prod[8] & ~(p0_mb[4]);	// rope_apply.k:273:9, :292:{21,25}
  wire         prod_84 =
    p0__prod_plus_ma32_shl_4_[7] ? p0_prod[7] | p0_mb[4] : p0_prod[7] & ~(p0_mb[4]);	// rope_apply.k:273:9, :292:{21,25}
  wire         prod_85 =
    p0__prod_plus_ma32_shl_4_[6] ? p0_prod[6] | p0_mb[4] : p0_prod[6] & ~(p0_mb[4]);	// rope_apply.k:273:9, :292:{21,25}
  wire         prod_86 =
    p0__prod_plus_ma32_shl_4_[5] ? p0_prod[5] | p0_mb[4] : p0_prod[5] & ~(p0_mb[4]);	// rope_apply.k:273:9, :292:{21,25}
  wire         prod_87 =
    p0__prod_plus_ma32_shl_4_[4] ? p0_prod[4] | p0_mb[4] : p0_prod[4] & ~(p0_mb[4]);	// rope_apply.k:273:9, :292:{21,25}
  wire         prod_88 =
    p0__prod_plus_ma32_shl_4_[3] ? p0_prod[3] | p0_mb[4] : p0_prod[3] & ~(p0_mb[4]);	// rope_apply.k:273:9, :292:{21,25}
  wire         prod_89 =
    p0__prod_plus_ma32_shl_4_[2] ? p0_prod[2] | p0_mb[4] : p0_prod[2] & ~(p0_mb[4]);	// rope_apply.k:273:9, :292:{21,25}
  wire         prod_90 =
    p0__prod_plus_ma32_shl_4_[1] ? p0_prod[1] | p0_mb[4] : p0_prod[1] & ~(p0_mb[4]);	// rope_apply.k:273:9, :292:{21,25}
  wire         prod_91 =
    p0__prod_plus_ma32_shl_4_[0] ? p0_prod[0] | p0_mb[4] : p0_prod[0] & ~(p0_mb[4]);	// rope_apply.k:273:9, :292:{21,25}
  wire         prod_92 = p0__prod_plus_ma32_shl_4__0[12] & p0_mb_0[4];	// rope_apply.k:273:9, :331:{21,25}
  wire         prod_93 =
    p0__prod_plus_ma32_shl_4__0[11]
      ? p0_prod_0[11] | p0_mb_0[4]
      : p0_prod_0[11] & ~(p0_mb_0[4]);	// rope_apply.k:273:9, :331:{21,25}
  wire         prod_94 =
    p0__prod_plus_ma32_shl_4__0[10]
      ? p0_prod_0[10] | p0_mb_0[4]
      : p0_prod_0[10] & ~(p0_mb_0[4]);	// rope_apply.k:273:9, :331:{21,25}
  wire         prod_95 =
    p0__prod_plus_ma32_shl_4__0[9]
      ? p0_prod_0[9] | p0_mb_0[4]
      : p0_prod_0[9] & ~(p0_mb_0[4]);	// rope_apply.k:273:9, :331:{21,25}
  wire         prod_96 =
    p0__prod_plus_ma32_shl_4__0[8]
      ? p0_prod_0[8] | p0_mb_0[4]
      : p0_prod_0[8] & ~(p0_mb_0[4]);	// rope_apply.k:273:9, :331:{21,25}
  wire         prod_97 =
    p0__prod_plus_ma32_shl_4__0[7]
      ? p0_prod_0[7] | p0_mb_0[4]
      : p0_prod_0[7] & ~(p0_mb_0[4]);	// rope_apply.k:273:9, :331:{21,25}
  wire         prod_98 =
    p0__prod_plus_ma32_shl_4__0[6]
      ? p0_prod_0[6] | p0_mb_0[4]
      : p0_prod_0[6] & ~(p0_mb_0[4]);	// rope_apply.k:273:9, :331:{21,25}
  wire         prod_99 =
    p0__prod_plus_ma32_shl_4__0[5]
      ? p0_prod_0[5] | p0_mb_0[4]
      : p0_prod_0[5] & ~(p0_mb_0[4]);	// rope_apply.k:273:9, :331:{21,25}
  wire         prod_100 =
    p0__prod_plus_ma32_shl_4__0[4]
      ? p0_prod_0[4] | p0_mb_0[4]
      : p0_prod_0[4] & ~(p0_mb_0[4]);	// rope_apply.k:273:9, :331:{21,25}
  wire         prod_101 =
    p0__prod_plus_ma32_shl_4__0[3]
      ? p0_prod_0[3] | p0_mb_0[4]
      : p0_prod_0[3] & ~(p0_mb_0[4]);	// rope_apply.k:273:9, :331:{21,25}
  wire         prod_102 =
    p0__prod_plus_ma32_shl_4__0[2]
      ? p0_prod_0[2] | p0_mb_0[4]
      : p0_prod_0[2] & ~(p0_mb_0[4]);	// rope_apply.k:273:9, :331:{21,25}
  wire         prod_103 =
    p0__prod_plus_ma32_shl_4__0[1]
      ? p0_prod_0[1] | p0_mb_0[4]
      : p0_prod_0[1] & ~(p0_mb_0[4]);	// rope_apply.k:273:9, :331:{21,25}
  wire         prod_104 =
    p0__prod_plus_ma32_shl_4__0[0]
      ? p0_prod_0[0] | p0_mb_0[4]
      : p0_prod_0[0] & ~(p0_mb_0[4]);	// rope_apply.k:273:9, :331:{21,25}
  wire  [13:0] _prod_plus_ma32_shl_5_ =
    14'({1'h0,
         prod_79,
         prod_80,
         prod_81,
         prod_82,
         prod_83,
         prod_84,
         prod_85,
         prod_86,
         prod_87,
         prod_88,
         prod_89,
         prod_90,
         prod_91} + p0__ma32_shl_5_);	// rope_apply.k:273:9, :292:{21,25}, :293:51
  wire  [13:0] _prod_plus_ma32_shl_5__0 =
    14'({1'h0,
         prod_92,
         prod_93,
         prod_94,
         prod_95,
         prod_96,
         prod_97,
         prod_98,
         prod_99,
         prod_100,
         prod_101,
         prod_102,
         prod_103,
         prod_104} + p0__ma32_shl_5__0);	// rope_apply.k:273:9, :331:{21,25}, :332:51
  wire         prod_105 = _prod_plus_ma32_shl_5_[13] & p0_mb[5];	// rope_apply.k:273:9, :293:{21,25,51}
  wire         prod_106 =
    _prod_plus_ma32_shl_5_[12] ? prod_79 | p0_mb[5] : prod_79 & ~(p0_mb[5]);	// rope_apply.k:273:9, :292:{21,25}, :293:{21,25,51}
  wire         prod_107 =
    _prod_plus_ma32_shl_5_[11] ? prod_80 | p0_mb[5] : prod_80 & ~(p0_mb[5]);	// rope_apply.k:273:9, :292:{21,25}, :293:{21,25,51}
  wire         prod_108 =
    _prod_plus_ma32_shl_5_[10] ? prod_81 | p0_mb[5] : prod_81 & ~(p0_mb[5]);	// rope_apply.k:273:9, :292:{21,25}, :293:{21,25,51}
  wire         prod_109 =
    _prod_plus_ma32_shl_5_[9] ? prod_82 | p0_mb[5] : prod_82 & ~(p0_mb[5]);	// rope_apply.k:273:9, :292:{21,25}, :293:{21,25,51}
  wire         prod_110 =
    _prod_plus_ma32_shl_5_[8] ? prod_83 | p0_mb[5] : prod_83 & ~(p0_mb[5]);	// rope_apply.k:273:9, :292:{21,25}, :293:{21,25,51}
  wire         prod_111 =
    _prod_plus_ma32_shl_5_[7] ? prod_84 | p0_mb[5] : prod_84 & ~(p0_mb[5]);	// rope_apply.k:273:9, :292:{21,25}, :293:{21,25,51}
  wire         prod_112 =
    _prod_plus_ma32_shl_5_[6] ? prod_85 | p0_mb[5] : prod_85 & ~(p0_mb[5]);	// rope_apply.k:273:9, :292:{21,25}, :293:{21,25,51}
  wire         prod_113 =
    _prod_plus_ma32_shl_5_[5] ? prod_86 | p0_mb[5] : prod_86 & ~(p0_mb[5]);	// rope_apply.k:273:9, :292:{21,25}, :293:{21,25,51}
  wire         prod_114 =
    _prod_plus_ma32_shl_5_[4] ? prod_87 | p0_mb[5] : prod_87 & ~(p0_mb[5]);	// rope_apply.k:273:9, :292:{21,25}, :293:{21,25,51}
  wire         prod_115 =
    _prod_plus_ma32_shl_5_[3] ? prod_88 | p0_mb[5] : prod_88 & ~(p0_mb[5]);	// rope_apply.k:273:9, :292:{21,25}, :293:{21,25,51}
  wire         prod_116 =
    _prod_plus_ma32_shl_5_[2] ? prod_89 | p0_mb[5] : prod_89 & ~(p0_mb[5]);	// rope_apply.k:273:9, :292:{21,25}, :293:{21,25,51}
  wire         prod_117 =
    _prod_plus_ma32_shl_5_[1] ? prod_90 | p0_mb[5] : prod_90 & ~(p0_mb[5]);	// rope_apply.k:273:9, :292:{21,25}, :293:{21,25,51}
  wire         prod_118 =
    _prod_plus_ma32_shl_5_[0] ? prod_91 | p0_mb[5] : prod_91 & ~(p0_mb[5]);	// rope_apply.k:273:9, :292:{21,25}, :293:{21,25,51}
  wire         prod_119 = _prod_plus_ma32_shl_5__0[13] & p0_mb_0[5];	// rope_apply.k:273:9, :332:{21,25,51}
  wire         prod_120 =
    _prod_plus_ma32_shl_5__0[12] ? prod_92 | p0_mb_0[5] : prod_92 & ~(p0_mb_0[5]);	// rope_apply.k:273:9, :331:{21,25}, :332:{21,25,51}
  wire         prod_121 =
    _prod_plus_ma32_shl_5__0[11] ? prod_93 | p0_mb_0[5] : prod_93 & ~(p0_mb_0[5]);	// rope_apply.k:273:9, :331:{21,25}, :332:{21,25,51}
  wire         prod_122 =
    _prod_plus_ma32_shl_5__0[10] ? prod_94 | p0_mb_0[5] : prod_94 & ~(p0_mb_0[5]);	// rope_apply.k:273:9, :331:{21,25}, :332:{21,25,51}
  wire         prod_123 =
    _prod_plus_ma32_shl_5__0[9] ? prod_95 | p0_mb_0[5] : prod_95 & ~(p0_mb_0[5]);	// rope_apply.k:273:9, :331:{21,25}, :332:{21,25,51}
  wire         prod_124 =
    _prod_plus_ma32_shl_5__0[8] ? prod_96 | p0_mb_0[5] : prod_96 & ~(p0_mb_0[5]);	// rope_apply.k:273:9, :331:{21,25}, :332:{21,25,51}
  wire         prod_125 =
    _prod_plus_ma32_shl_5__0[7] ? prod_97 | p0_mb_0[5] : prod_97 & ~(p0_mb_0[5]);	// rope_apply.k:273:9, :331:{21,25}, :332:{21,25,51}
  wire         prod_126 =
    _prod_plus_ma32_shl_5__0[6] ? prod_98 | p0_mb_0[5] : prod_98 & ~(p0_mb_0[5]);	// rope_apply.k:273:9, :331:{21,25}, :332:{21,25,51}
  wire         prod_127 =
    _prod_plus_ma32_shl_5__0[5] ? prod_99 | p0_mb_0[5] : prod_99 & ~(p0_mb_0[5]);	// rope_apply.k:273:9, :331:{21,25}, :332:{21,25,51}
  wire         prod_128 =
    _prod_plus_ma32_shl_5__0[4] ? prod_100 | p0_mb_0[5] : prod_100 & ~(p0_mb_0[5]);	// rope_apply.k:273:9, :331:{21,25}, :332:{21,25,51}
  wire         prod_129 =
    _prod_plus_ma32_shl_5__0[3] ? prod_101 | p0_mb_0[5] : prod_101 & ~(p0_mb_0[5]);	// rope_apply.k:273:9, :331:{21,25}, :332:{21,25,51}
  wire         prod_130 =
    _prod_plus_ma32_shl_5__0[2] ? prod_102 | p0_mb_0[5] : prod_102 & ~(p0_mb_0[5]);	// rope_apply.k:273:9, :331:{21,25}, :332:{21,25,51}
  wire         prod_131 =
    _prod_plus_ma32_shl_5__0[1] ? prod_103 | p0_mb_0[5] : prod_103 & ~(p0_mb_0[5]);	// rope_apply.k:273:9, :331:{21,25}, :332:{21,25,51}
  wire         prod_132 =
    _prod_plus_ma32_shl_5__0[0] ? prod_104 | p0_mb_0[5] : prod_104 & ~(p0_mb_0[5]);	// rope_apply.k:273:9, :331:{21,25}, :332:{21,25,51}
  wire  [14:0] _prod_plus_ma32_shl_6_ =
    15'({1'h0,
         prod_105,
         prod_106,
         prod_107,
         prod_108,
         prod_109,
         prod_110,
         prod_111,
         prod_112,
         prod_113,
         prod_114,
         prod_115,
         prod_116,
         prod_117,
         prod_118} + p0__ma32_shl_6_);	// rope_apply.k:273:9, :293:{21,25}, :294:51
  wire  [14:0] _prod_plus_ma32_shl_6__0 =
    15'({1'h0,
         prod_119,
         prod_120,
         prod_121,
         prod_122,
         prod_123,
         prod_124,
         prod_125,
         prod_126,
         prod_127,
         prod_128,
         prod_129,
         prod_130,
         prod_131,
         prod_132} + p0__ma32_shl_6__0);	// rope_apply.k:273:9, :332:{21,25}, :333:51
  wire  [15:0] _prod_plus_ma32_shl_7_ =
    16'({1'h0,
         _prod_plus_ma32_shl_6_[14] & p0_mb_1,
         _prod_plus_ma32_shl_6_[13] ? prod_105 | p0_mb_1 : prod_105 & ~p0_mb_1,
         _prod_plus_ma32_shl_6_[12] ? prod_106 | p0_mb_1 : prod_106 & ~p0_mb_1,
         _prod_plus_ma32_shl_6_[11] ? prod_107 | p0_mb_1 : prod_107 & ~p0_mb_1,
         _prod_plus_ma32_shl_6_[10] ? prod_108 | p0_mb_1 : prod_108 & ~p0_mb_1,
         _prod_plus_ma32_shl_6_[9] ? prod_109 | p0_mb_1 : prod_109 & ~p0_mb_1,
         _prod_plus_ma32_shl_6_[8] ? prod_110 | p0_mb_1 : prod_110 & ~p0_mb_1,
         _prod_plus_ma32_shl_6_[7] ? prod_111 | p0_mb_1 : prod_111 & ~p0_mb_1,
         _prod_plus_ma32_shl_6_[6] ? prod_112 | p0_mb_1 : prod_112 & ~p0_mb_1,
         _prod_plus_ma32_shl_6_[5] ? prod_113 | p0_mb_1 : prod_113 & ~p0_mb_1,
         _prod_plus_ma32_shl_6_[4] ? prod_114 | p0_mb_1 : prod_114 & ~p0_mb_1,
         _prod_plus_ma32_shl_6_[3] ? prod_115 | p0_mb_1 : prod_115 & ~p0_mb_1,
         _prod_plus_ma32_shl_6_[2] ? prod_116 | p0_mb_1 : prod_116 & ~p0_mb_1,
         _prod_plus_ma32_shl_6_[1] ? prod_117 | p0_mb_1 : prod_117 & ~p0_mb_1,
         _prod_plus_ma32_shl_6_[0] ? prod_118 | p0_mb_1 : prod_118 & ~p0_mb_1}
        + p0__ma32_shl_7_);	// rope_apply.k:273:9, :293:{21,25}, :294:{21,51}, :295:51
  wire  [15:0] _prod_plus_ma32_shl_7__0 =
    16'({1'h0,
         _prod_plus_ma32_shl_6__0[14] & p0_mb_2,
         _prod_plus_ma32_shl_6__0[13] ? prod_119 | p0_mb_2 : prod_119 & ~p0_mb_2,
         _prod_plus_ma32_shl_6__0[12] ? prod_120 | p0_mb_2 : prod_120 & ~p0_mb_2,
         _prod_plus_ma32_shl_6__0[11] ? prod_121 | p0_mb_2 : prod_121 & ~p0_mb_2,
         _prod_plus_ma32_shl_6__0[10] ? prod_122 | p0_mb_2 : prod_122 & ~p0_mb_2,
         _prod_plus_ma32_shl_6__0[9] ? prod_123 | p0_mb_2 : prod_123 & ~p0_mb_2,
         _prod_plus_ma32_shl_6__0[8] ? prod_124 | p0_mb_2 : prod_124 & ~p0_mb_2,
         _prod_plus_ma32_shl_6__0[7] ? prod_125 | p0_mb_2 : prod_125 & ~p0_mb_2,
         _prod_plus_ma32_shl_6__0[6] ? prod_126 | p0_mb_2 : prod_126 & ~p0_mb_2,
         _prod_plus_ma32_shl_6__0[5] ? prod_127 | p0_mb_2 : prod_127 & ~p0_mb_2,
         _prod_plus_ma32_shl_6__0[4] ? prod_128 | p0_mb_2 : prod_128 & ~p0_mb_2,
         _prod_plus_ma32_shl_6__0[3] ? prod_129 | p0_mb_2 : prod_129 & ~p0_mb_2,
         _prod_plus_ma32_shl_6__0[2] ? prod_130 | p0_mb_2 : prod_130 & ~p0_mb_2,
         _prod_plus_ma32_shl_6__0[1] ? prod_131 | p0_mb_2 : prod_131 & ~p0_mb_2,
         _prod_plus_ma32_shl_6__0[0] ? prod_132 | p0_mb_2 : prod_132 & ~p0_mb_2}
        + p0__ma32_shl_7__0);	// rope_apply.k:273:9, :332:{21,25}, :333:{21,51}, :334:51
  wire  [15:0] r_exp =
    p0_prod_1
      ? p0__a_exp_plus_b_exp_minus_127_plus_1__1
      : p0__a_exp_plus_b_exp_minus_127__1;	// rope_apply.k:273:9, :298:21
  wire  [15:0] r_exp_0 =
    p0_prod_2
      ? p0__a_exp_plus_b_exp_minus_127_plus_1__2
      : p0__a_exp_plus_b_exp_minus_127__2;	// rope_apply.k:273:9, :337:21
  wire         _GEN_0 = r_exp < 16'hFF & (|r_exp);	// rope_apply.k:283:{21,37,38,55}, :298:21, :300:{34,47}, :305:{34,47}, :308:{21,25,31,44}, :310:{30,45,47}
  wire         _GEN_1 = ~p0_prod_1 & _GEN_0;	// rope_apply.k:273:9, :283:{21,37,38,55}, :298:21, :300:{34,47}, :305:{34,47}, :308:{21,25}, :310:{30,45,47}
  wire         _GEN_2 = r_exp_0 < 16'hFF & (|r_exp_0);	// rope_apply.k:322:{21,37,38,54}, :337:21, :339:{34,47}, :344:{34,47}, :347:{21,25,31,44}, :349:{30,45,47}
  wire         _GEN_3 = ~p0_prod_2 & _GEN_2;	// rope_apply.k:273:9, :322:{21,37,38,54}, :337:21, :339:{34,47}, :344:{34,47}, :347:{21,25}, :349:{30,45,47}
  wire         _GEN_4 = p0__b_exp_ne_0__1 & p0__a_exp_ne_0__1;	// rope_apply.k:273:9, :281:{17,21}
  wire         p1 =
    (r_exp[8]
       ? _GEN_0
       : p0_sin_val_1[15] ? ~(p0_x_even_1[15]) & _GEN_0 : p0_x_even_1[15] & _GEN_0)
    & _GEN_4;	// rope_apply.k:273:9, :281:{17,21}, :283:{21,37,38,55}, :298:21, :300:{34,47}, :305:{34,47}, :308:{21,25}, :310:{30,45,47}
  wire         p1_0 = r_exp[7] & _GEN_0 & _GEN_4;	// rope_apply.k:281:{17,21}, :283:{21,37,38,55}, :298:21, :300:{34,47}, :305:{34,47}, :308:{21,25}, :310:{30,45,47}
  wire         p1_1 = r_exp[6] & _GEN_0 & _GEN_4;	// rope_apply.k:281:{17,21}, :283:{21,37,38,55}, :298:21, :300:{34,47}, :305:{34,47}, :308:{21,25}, :310:{30,45,47}
  wire         p1_2 = r_exp[5] & _GEN_0 & _GEN_4;	// rope_apply.k:281:{17,21}, :283:{21,37,38,55}, :298:21, :300:{34,47}, :305:{34,47}, :308:{21,25}, :310:{30,45,47}
  wire         p1_3 = r_exp[4] & _GEN_0 & _GEN_4;	// rope_apply.k:281:{17,21}, :283:{21,37,38,55}, :298:21, :300:{34,47}, :305:{34,47}, :308:{21,25}, :310:{30,45,47}
  wire         p1_4 = r_exp[3] & _GEN_0 & _GEN_4;	// rope_apply.k:281:{17,21}, :283:{21,37,38,55}, :298:21, :300:{34,47}, :305:{34,47}, :308:{21,25}, :310:{30,45,47}
  wire         p1_5 = r_exp[2] & _GEN_0 & _GEN_4;	// rope_apply.k:281:{17,21}, :283:{21,37,38,55}, :298:21, :300:{34,47}, :305:{34,47}, :308:{21,25}, :310:{30,45,47}
  wire         p1_6 = r_exp[1] & _GEN_0 & _GEN_4;	// rope_apply.k:281:{17,21}, :283:{21,37,38,55}, :298:21, :300:{34,47}, :305:{34,47}, :308:{21,25}, :310:{30,45,47}
  wire         p1_7 = r_exp[0] & _GEN_0 & _GEN_4;	// rope_apply.k:281:{17,21}, :283:{21,37,38,55}, :298:21, :300:{34,47}, :305:{34,47}, :308:{21,25}, :310:{30,45,47}
  wire         p1_8 =
    (p0_prod_3[14] ? (p0_prod_3[13] | p0_prod_1) & _GEN_0 : p0_prod_3[13] & _GEN_1)
    & _GEN_4;	// rope_apply.k:273:9, :281:{17,21}, :283:{21,37,38,55}, :298:21, :300:{34,47}, :305:{34,47}, :308:{21,25}, :310:{30,45,47}
  wire         p1_9 =
    (p0_prod_3[13] ? (p0_prod_3[12] | p0_prod_1) & _GEN_0 : p0_prod_3[12] & _GEN_1)
    & _GEN_4;	// rope_apply.k:273:9, :281:{17,21}, :283:{21,37,38,55}, :298:21, :300:{34,47}, :305:{34,47}, :308:{21,25}, :310:{30,45,47}
  wire         p1_10 =
    (p0_prod_3[12] ? (p0_prod_3[11] | p0_prod_1) & _GEN_0 : p0_prod_3[11] & _GEN_1)
    & _GEN_4;	// rope_apply.k:273:9, :281:{17,21}, :283:{21,37,38,55}, :298:21, :300:{34,47}, :305:{34,47}, :308:{21,25}, :310:{30,45,47}
  wire         p1_11 =
    (p0_prod_3[11] ? (p0_prod_3[10] | p0_prod_1) & _GEN_0 : p0_prod_3[10] & _GEN_1)
    & _GEN_4;	// rope_apply.k:273:9, :281:{17,21}, :283:{21,37,38,55}, :298:21, :300:{34,47}, :305:{34,47}, :308:{21,25}, :310:{30,45,47}
  wire         p1_12 =
    (p0_prod_3[10] ? (p0_prod_3[9] | p0_prod_1) & _GEN_0 : p0_prod_3[9] & _GEN_1)
    & _GEN_4;	// rope_apply.k:273:9, :281:{17,21}, :283:{21,37,38,55}, :298:21, :300:{34,47}, :305:{34,47}, :308:{21,25}, :310:{30,45,47}
  wire         p1_13 =
    (p0_prod_3[9] ? (p0_prod_3[8] | p0_prod_1) & _GEN_0 : p0_prod_3[8] & _GEN_1) & _GEN_4;	// rope_apply.k:273:9, :281:{17,21}, :283:{21,37,38,55}, :298:21, :300:{34,47}, :305:{34,47}, :308:{21,25}, :310:{30,45,47}
  wire         p1_14 =
    (p0_prod_3[8] ? (p0_prod_3[7] | p0_prod_1) & _GEN_0 : p0_prod_3[7] & _GEN_1) & _GEN_4;	// rope_apply.k:273:9, :281:{17,21}, :283:{21,37,38,55}, :298:21, :300:{34,47}, :305:{34,47}, :308:{21,25}, :310:{30,45,47}
  wire         _GEN_5 = p0__b_exp_ne_0__2 & p0__a_exp_ne_0__2;	// rope_apply.k:273:9, :320:{17,21}
  wire         p2 =
    (r_exp_0[8]
       ? _GEN_2
       : p0_cos_val_1[15] ? ~(p0_x_odd_1[15]) & _GEN_2 : p0_x_odd_1[15] & _GEN_2)
    & _GEN_5;	// rope_apply.k:273:9, :320:{17,21}, :322:{21,37,38,54}, :337:21, :339:{34,47}, :344:{34,47}, :347:{21,25}, :349:{30,45,47}
  wire         p2_0 = r_exp_0[7] & _GEN_2 & _GEN_5;	// rope_apply.k:320:{17,21}, :322:{21,37,38,54}, :337:21, :339:{34,47}, :344:{34,47}, :347:{21,25}, :349:{30,45,47}
  wire         p2_1 = r_exp_0[6] & _GEN_2 & _GEN_5;	// rope_apply.k:320:{17,21}, :322:{21,37,38,54}, :337:21, :339:{34,47}, :344:{34,47}, :347:{21,25}, :349:{30,45,47}
  wire         p2_2 = r_exp_0[5] & _GEN_2 & _GEN_5;	// rope_apply.k:320:{17,21}, :322:{21,37,38,54}, :337:21, :339:{34,47}, :344:{34,47}, :347:{21,25}, :349:{30,45,47}
  wire         p2_3 = r_exp_0[4] & _GEN_2 & _GEN_5;	// rope_apply.k:320:{17,21}, :322:{21,37,38,54}, :337:21, :339:{34,47}, :344:{34,47}, :347:{21,25}, :349:{30,45,47}
  wire         p2_4 = r_exp_0[3] & _GEN_2 & _GEN_5;	// rope_apply.k:320:{17,21}, :322:{21,37,38,54}, :337:21, :339:{34,47}, :344:{34,47}, :347:{21,25}, :349:{30,45,47}
  wire         p2_5 = r_exp_0[2] & _GEN_2 & _GEN_5;	// rope_apply.k:320:{17,21}, :322:{21,37,38,54}, :337:21, :339:{34,47}, :344:{34,47}, :347:{21,25}, :349:{30,45,47}
  wire         p2_6 = r_exp_0[1] & _GEN_2 & _GEN_5;	// rope_apply.k:320:{17,21}, :322:{21,37,38,54}, :337:21, :339:{34,47}, :344:{34,47}, :347:{21,25}, :349:{30,45,47}
  wire         p2_7 = r_exp_0[0] & _GEN_2 & _GEN_5;	// rope_apply.k:320:{17,21}, :322:{21,37,38,54}, :337:21, :339:{34,47}, :344:{34,47}, :347:{21,25}, :349:{30,45,47}
  wire         p2_8 =
    (p0_prod_4[14] ? (p0_prod_4[13] | p0_prod_2) & _GEN_2 : p0_prod_4[13] & _GEN_3)
    & _GEN_5;	// rope_apply.k:273:9, :320:{17,21}, :322:{21,37,38,54}, :337:21, :339:{34,47}, :344:{34,47}, :347:{21,25}, :349:{30,45,47}
  wire         p2_9 =
    (p0_prod_4[13] ? (p0_prod_4[12] | p0_prod_2) & _GEN_2 : p0_prod_4[12] & _GEN_3)
    & _GEN_5;	// rope_apply.k:273:9, :320:{17,21}, :322:{21,37,38,54}, :337:21, :339:{34,47}, :344:{34,47}, :347:{21,25}, :349:{30,45,47}
  wire         p2_10 =
    (p0_prod_4[12] ? (p0_prod_4[11] | p0_prod_2) & _GEN_2 : p0_prod_4[11] & _GEN_3)
    & _GEN_5;	// rope_apply.k:273:9, :320:{17,21}, :322:{21,37,38,54}, :337:21, :339:{34,47}, :344:{34,47}, :347:{21,25}, :349:{30,45,47}
  wire         p2_11 =
    (p0_prod_4[11] ? (p0_prod_4[10] | p0_prod_2) & _GEN_2 : p0_prod_4[10] & _GEN_3)
    & _GEN_5;	// rope_apply.k:273:9, :320:{17,21}, :322:{21,37,38,54}, :337:21, :339:{34,47}, :344:{34,47}, :347:{21,25}, :349:{30,45,47}
  wire         p2_12 =
    (p0_prod_4[10] ? (p0_prod_4[9] | p0_prod_2) & _GEN_2 : p0_prod_4[9] & _GEN_3)
    & _GEN_5;	// rope_apply.k:273:9, :320:{17,21}, :322:{21,37,38,54}, :337:21, :339:{34,47}, :344:{34,47}, :347:{21,25}, :349:{30,45,47}
  wire         p2_13 =
    (p0_prod_4[9] ? (p0_prod_4[8] | p0_prod_2) & _GEN_2 : p0_prod_4[8] & _GEN_3) & _GEN_5;	// rope_apply.k:273:9, :320:{17,21}, :322:{21,37,38,54}, :337:21, :339:{34,47}, :344:{34,47}, :347:{21,25}, :349:{30,45,47}
  wire         p2_14 =
    (p0_prod_4[8] ? (p0_prod_4[7] | p0_prod_2) & _GEN_2 : p0_prod_4[7] & _GEN_3) & _GEN_5;	// rope_apply.k:273:9, :320:{17,21}, :322:{21,37,38,54}, :337:21, :339:{34,47}, :344:{34,47}, :347:{21,25}, :349:{30,45,47}
  wire  [15:0] pa_exp = {8'h0, p1_0, p1_1, p1_2, p1_3, p1_4, p1_5, p1_6, p1_7};	// rope_apply.k:281:{17,21}, :283:{21,37,38,55}, :298:21, :300:{34,47}, :305:{34,47}, :308:{21,25}, :310:{30,45,47}, :357:{17,33}
  wire  [15:0] pb_exp = {8'h0, p2_0, p2_1, p2_2, p2_3, p2_4, p2_5, p2_6, p2_7};	// rope_apply.k:320:{17,21}, :322:{21,37,38,54}, :337:21, :339:{34,47}, :344:{34,47}, :347:{21,25}, :349:{30,45,47}, :358:{17,33}
  wire         _pa_exp_ge_pb_exp_ =
    {p1_0,
     p1_1,
     p1_2,
     p1_3,
     p1_4,
     p1_5,
     p1_6,
     p1_7} >= {p2_0, p2_1, p2_2, p2_3, p2_4, p2_5, p2_6, p2_7};	// rope_apply.k:281:{17,21}, :283:{21,37,38,55}, :298:21, :300:{34,47}, :305:{34,47}, :308:{21,25}, :310:{30,45,47}, :320:{17,21}, :322:{21,37,38,54}, :337:21, :339:{34,47}, :344:{34,47}, :347:{21,25}, :349:{30,45,47}, :357:{17,33}, :358:{17,33}, :377:25
  wire  [15:0] _pa_exp_minus_pb_exp_ = 16'(pa_exp - pb_exp);	// rope_apply.k:357:{17,33}, :358:{17,33}, :381:40
  wire  [15:0] _pb_exp_minus_pa_exp_ = 16'(pb_exp - pa_exp);	// rope_apply.k:357:{17,33}, :358:{17,33}, :393:40
  wire  [3:0]  shift = _pa_exp_minus_pb_exp_ > 16'hC ? 4'hC : _pa_exp_minus_pb_exp_[3:0];	// rope_apply.k:381:40, :382:{25,29}
  wire  [3:0]  shift_0 =
    _pb_exp_minus_pa_exp_ > 16'hC ? 4'hC : _pb_exp_minus_pa_exp_[3:0];	// rope_apply.k:393:40, :394:{25,29}
  wire         _GEN_6 = ~(shift[3]) & ~(shift[2]);	// rope_apply.k:382:25, :384:{25,29,49,61}, :385:{25,29,49,61}
  wire         _GEN_7 = ~(shift[3]) & shift[2];	// rope_apply.k:382:25, :384:{25,29,49,61}, :385:{25,29,49,61}
  wire         _GEN_8 = shift[3] ^ shift[2];	// rope_apply.k:382:25, :384:{25,29,49,61}, :385:{25,29,49,61}
  wire         _GEN_9 = shift[3] & ~(shift[2]);	// rope_apply.k:382:25, :384:{25,29,49,61}, :385:{25,29,49,61}
  wire         _GEN_10 = ~(shift_0[3]) & ~(shift_0[2]);	// rope_apply.k:394:25, :396:{25,29,49,61}, :397:{25,29,49,61}
  wire         _GEN_11 = ~(shift_0[3]) & shift_0[2];	// rope_apply.k:394:25, :396:{25,29,49,61}, :397:{25,29,49,61}
  wire         _GEN_12 = shift_0[3] ^ shift_0[2];	// rope_apply.k:394:25, :396:{25,29,49,61}, :397:{25,29,49,61}
  wire         _GEN_13 = shift_0[3] & ~(shift_0[2]);	// rope_apply.k:394:25, :396:{25,29,49,61}, :397:{25,29,49,61}
  wire         _GEN_14 = ~(p0_shift[1]) & ~(p0_shift[0]);	// rope_apply.k:273:9, :386:{25,29,49,61}, :387:{25,29,49,61}
  wire         _GEN_15 = ~(p0_shift[1]) & p0_shift[0];	// rope_apply.k:273:9, :386:{25,29,49,61}, :387:{25,29,49,61}
  wire         _GEN_16 = ~(p0_shift[1]) | ~(p0_shift[0]);	// rope_apply.k:273:9, :386:{25,29,49,61}, :387:{25,29,49,61}
  wire         _GEN_17 = p0_shift[1] ^ ~(p0_shift[0]);	// rope_apply.k:273:9, :386:{25,29,49,61}, :387:{25,29,49,61}
  wire         _GEN_18 = ~(p0_shift_0[1]) & ~(p0_shift_0[0]);	// rope_apply.k:273:9, :398:{25,29,49,61}, :399:{25,29,49,61}
  wire         _GEN_19 = ~(p0_shift_0[1]) & p0_shift_0[0];	// rope_apply.k:273:9, :398:{25,29,49,61}, :399:{25,29,49,61}
  wire         aligned_a =
    p0_aligned_a[11]
      ? (p0_aligned_a[10] ? ~(p0_shift_0[1]) : _GEN_19)
      : p0_aligned_a[10] & _GEN_18;	// rope_apply.k:273:9, :398:{25,29,49,61}, :399:{25,29,49,61}
  wire         _GEN_20 = ~(p0_shift_0[1]) | ~(p0_shift_0[0]);	// rope_apply.k:273:9, :398:{25,29,49,61}, :399:{25,29,49,61}
  wire         aligned_a_0 =
    p0_aligned_a[10]
      ? (p0_aligned_a[11]
           ? (p0_aligned_a[9] ? _GEN_20 : ^p0_shift_0)
           : p0_aligned_a[9] ? ~(p0_shift_0[1]) : _GEN_19)
      : p0_aligned_a[11]
          ? (p0_aligned_a[9] | p0_shift_0[1]) & ~(p0_shift_0[0])
          : p0_aligned_a[9] & _GEN_18;	// rope_apply.k:273:9, :398:{25,29,49,61}, :399:{25,29,49,61}
  wire         _GEN_21 = p0_shift_0[1] ^ ~(p0_shift_0[0]);	// rope_apply.k:273:9, :398:{25,29,49,61}, :399:{25,29,49,61}
  wire         aligned_a_1 =
    p0_aligned_a[11]
      ? (p0_aligned_a[9]
           ? (p0_aligned_a[10]
                ? p0_aligned_a[8] | (|p0_shift_0)
                : p0_aligned_a[8] & ~(p0_shift_0[1]) | p0_shift_0[0])
           : p0_aligned_a[10]
               ? p0_aligned_a[8] & ~(p0_shift_0[0]) | p0_shift_0[1]
               : p0_aligned_a[8] ? _GEN_21 : (&p0_shift_0))
      : p0_aligned_a[9]
          ? (p0_aligned_a[10]
               ? (p0_aligned_a[8] ? _GEN_20 : ^p0_shift_0)
               : p0_aligned_a[8] ? ~(p0_shift_0[1]) : _GEN_19)
          : p0_aligned_a[10]
              ? (p0_aligned_a[8] | p0_shift_0[1]) & ~(p0_shift_0[0])
              : p0_aligned_a[8] & _GEN_18;	// rope_apply.k:273:9, :398:{25,29,49,61}, :399:{25,29,49,61}
  wire         aligned_a_2 =
    p0_aligned_a[10]
      ? (p0_aligned_a[8]
           ? (p0_aligned_a[9]
                ? p0_aligned_a[7] | (|p0_shift_0)
                : p0_aligned_a[7] & ~(p0_shift_0[1]) | p0_shift_0[0])
           : p0_aligned_a[9]
               ? p0_aligned_a[7] & ~(p0_shift_0[0]) | p0_shift_0[1]
               : p0_aligned_a[7] ? _GEN_21 : (&p0_shift_0))
      : p0_aligned_a[8]
          ? (p0_aligned_a[9]
               ? (p0_aligned_a[7] ? _GEN_20 : ^p0_shift_0)
               : p0_aligned_a[7] ? ~(p0_shift_0[1]) : _GEN_19)
          : p0_aligned_a[9]
              ? (p0_aligned_a[7] | p0_shift_0[1]) & ~(p0_shift_0[0])
              : p0_aligned_a[7] & _GEN_18;	// rope_apply.k:273:9, :398:{25,29,49,61}, :399:{25,29,49,61}
  wire         aligned_a_3 =
    p0_aligned_a[9]
      ? (p0_aligned_a[7]
           ? (p0_aligned_a[8]
                ? p0_aligned_a[6] | (|p0_shift_0)
                : p0_aligned_a[6] & ~(p0_shift_0[1]) | p0_shift_0[0])
           : p0_aligned_a[8]
               ? p0_aligned_a[6] & ~(p0_shift_0[0]) | p0_shift_0[1]
               : p0_aligned_a[6] ? _GEN_21 : (&p0_shift_0))
      : p0_aligned_a[7]
          ? (p0_aligned_a[8]
               ? (p0_aligned_a[6] ? _GEN_20 : ^p0_shift_0)
               : p0_aligned_a[6] ? ~(p0_shift_0[1]) : _GEN_19)
          : p0_aligned_a[8]
              ? (p0_aligned_a[6] | p0_shift_0[1]) & ~(p0_shift_0[0])
              : p0_aligned_a[6] & _GEN_18;	// rope_apply.k:273:9, :398:{25,29,49,61}, :399:{25,29,49,61}
  wire         aligned_a_4 =
    p0_aligned_a[8]
      ? (p0_aligned_a[6]
           ? (p0_aligned_a[7]
                ? p0_aligned_a[5] | (|p0_shift_0)
                : p0_aligned_a[5] & ~(p0_shift_0[1]) | p0_shift_0[0])
           : p0_aligned_a[7]
               ? p0_aligned_a[5] & ~(p0_shift_0[0]) | p0_shift_0[1]
               : p0_aligned_a[5] ? _GEN_21 : (&p0_shift_0))
      : p0_aligned_a[6]
          ? (p0_aligned_a[7]
               ? (p0_aligned_a[5] ? _GEN_20 : ^p0_shift_0)
               : p0_aligned_a[5] ? ~(p0_shift_0[1]) : _GEN_19)
          : p0_aligned_a[7]
              ? (p0_aligned_a[5] | p0_shift_0[1]) & ~(p0_shift_0[0])
              : p0_aligned_a[5] & _GEN_18;	// rope_apply.k:273:9, :398:{25,29,49,61}, :399:{25,29,49,61}
  wire         aligned_a_5 =
    p0_aligned_a[7]
      ? (p0_aligned_a[5]
           ? (p0_aligned_a[6]
                ? p0_aligned_a[4] | (|p0_shift_0)
                : p0_aligned_a[4] & ~(p0_shift_0[1]) | p0_shift_0[0])
           : p0_aligned_a[6]
               ? p0_aligned_a[4] & ~(p0_shift_0[0]) | p0_shift_0[1]
               : p0_aligned_a[4] ? _GEN_21 : (&p0_shift_0))
      : p0_aligned_a[5]
          ? (p0_aligned_a[6]
               ? (p0_aligned_a[4] ? _GEN_20 : ^p0_shift_0)
               : p0_aligned_a[4] ? ~(p0_shift_0[1]) : _GEN_19)
          : p0_aligned_a[6]
              ? (p0_aligned_a[4] | p0_shift_0[1]) & ~(p0_shift_0[0])
              : p0_aligned_a[4] & _GEN_18;	// rope_apply.k:273:9, :398:{25,29,49,61}, :399:{25,29,49,61}
  wire         aligned_a_6 = p0_aligned_a[11] & _GEN_18 | p0__pa_exp_ge_pb_exp_;	// rope_apply.k:273:9, :377:21, :398:{25,29,49,61}, :399:{25,29,49,61}
  wire         aligned_a_7 =
    p0__pa_mant_shl_4_[10]
      ? aligned_a | p0__pa_exp_ge_pb_exp_
      : aligned_a & ~p0__pa_exp_ge_pb_exp_;	// rope_apply.k:273:9, :377:21, :398:{25,29,49,61}, :399:{25,29,49,61}
  wire         aligned_a_8 =
    p0__pa_mant_shl_4_[9]
      ? aligned_a_0 | p0__pa_exp_ge_pb_exp_
      : aligned_a_0 & ~p0__pa_exp_ge_pb_exp_;	// rope_apply.k:273:9, :377:21, :398:{25,29,49,61}, :399:{25,29,49,61}
  wire         aligned_a_9 =
    p0__pa_mant_shl_4_[8]
      ? aligned_a_1 | p0__pa_exp_ge_pb_exp_
      : aligned_a_1 & ~p0__pa_exp_ge_pb_exp_;	// rope_apply.k:273:9, :377:21, :398:{25,29,49,61}, :399:{25,29,49,61}
  wire         aligned_a_10 =
    p0__pa_mant_shl_4_[7]
      ? aligned_a_2 | p0__pa_exp_ge_pb_exp_
      : aligned_a_2 & ~p0__pa_exp_ge_pb_exp_;	// rope_apply.k:273:9, :377:21, :398:{25,29,49,61}, :399:{25,29,49,61}
  wire         aligned_a_11 =
    p0__pa_mant_shl_4_[6]
      ? aligned_a_3 | p0__pa_exp_ge_pb_exp_
      : aligned_a_3 & ~p0__pa_exp_ge_pb_exp_;	// rope_apply.k:273:9, :377:21, :398:{25,29,49,61}, :399:{25,29,49,61}
  wire         aligned_a_12 =
    p0__pa_mant_shl_4_[5]
      ? aligned_a_4 | p0__pa_exp_ge_pb_exp_
      : aligned_a_4 & ~p0__pa_exp_ge_pb_exp_;	// rope_apply.k:273:9, :377:21, :398:{25,29,49,61}, :399:{25,29,49,61}
  wire         aligned_a_13 =
    p0__pa_mant_shl_4_[4]
      ? aligned_a_5 | p0__pa_exp_ge_pb_exp_
      : aligned_a_5 & ~p0__pa_exp_ge_pb_exp_;	// rope_apply.k:273:9, :377:21, :398:{25,29,49,61}, :399:{25,29,49,61}
  wire         aligned_a_14 =
    (p0_aligned_a[6]
       ? (p0_aligned_a[4]
            ? (p0_aligned_a[5]
                 ? p0_aligned_a[3] | (|p0_shift_0)
                 : p0_aligned_a[3] & ~(p0_shift_0[1]) | p0_shift_0[0])
            : p0_aligned_a[5]
                ? p0_aligned_a[3] & ~(p0_shift_0[0]) | p0_shift_0[1]
                : p0_aligned_a[3] ? _GEN_21 : (&p0_shift_0))
       : p0_aligned_a[4]
           ? (p0_aligned_a[5]
                ? (p0_aligned_a[3] ? _GEN_20 : ^p0_shift_0)
                : p0_aligned_a[3] ? ~(p0_shift_0[1]) : _GEN_19)
           : p0_aligned_a[5]
               ? (p0_aligned_a[3] | p0_shift_0[1]) & ~(p0_shift_0[0])
               : p0_aligned_a[3] & _GEN_18) & ~p0__pa_exp_ge_pb_exp_;	// rope_apply.k:273:9, :377:21, :398:{25,29,49,61}, :399:{25,29,49,61}
  wire         aligned_a_15 =
    (p0_aligned_a[5]
       ? (p0_aligned_a[3]
            ? (p0_aligned_a[4]
                 ? p0_aligned_a[2] | (|p0_shift_0)
                 : p0_aligned_a[2] & ~(p0_shift_0[1]) | p0_shift_0[0])
            : p0_aligned_a[4]
                ? p0_aligned_a[2] & ~(p0_shift_0[0]) | p0_shift_0[1]
                : p0_aligned_a[2] ? _GEN_21 : (&p0_shift_0))
       : p0_aligned_a[3]
           ? (p0_aligned_a[4]
                ? (p0_aligned_a[2] ? _GEN_20 : ^p0_shift_0)
                : p0_aligned_a[2] ? ~(p0_shift_0[1]) : _GEN_19)
           : p0_aligned_a[4]
               ? (p0_aligned_a[2] | p0_shift_0[1]) & ~(p0_shift_0[0])
               : p0_aligned_a[2] & _GEN_18) & ~p0__pa_exp_ge_pb_exp_;	// rope_apply.k:273:9, :377:21, :398:{25,29,49,61}, :399:{25,29,49,61}
  wire         aligned_a_16 =
    (p0_aligned_a[4]
       ? (p0_aligned_a[2]
            ? (p0_aligned_a[3]
                 ? p0_aligned_a[1] | (|p0_shift_0)
                 : p0_aligned_a[1] & ~(p0_shift_0[1]) | p0_shift_0[0])
            : p0_aligned_a[3]
                ? p0_aligned_a[1] & ~(p0_shift_0[0]) | p0_shift_0[1]
                : p0_aligned_a[1] ? _GEN_21 : (&p0_shift_0))
       : p0_aligned_a[2]
           ? (p0_aligned_a[3]
                ? (p0_aligned_a[1] ? _GEN_20 : ^p0_shift_0)
                : p0_aligned_a[1] ? ~(p0_shift_0[1]) : _GEN_19)
           : p0_aligned_a[3]
               ? (p0_aligned_a[1] | p0_shift_0[1]) & ~(p0_shift_0[0])
               : p0_aligned_a[1] & _GEN_18) & ~p0__pa_exp_ge_pb_exp_;	// rope_apply.k:273:9, :377:21, :398:{25,29,49,61}, :399:{25,29,49,61}
  wire         aligned_a_17 =
    (p0_aligned_a[3]
       ? (p0_aligned_a[1]
            ? (p0_aligned_a[2]
                 ? p0_aligned_a[0] | (|p0_shift_0)
                 : p0_aligned_a[0] & ~(p0_shift_0[1]) | p0_shift_0[0])
            : p0_aligned_a[2]
                ? p0_aligned_a[0] & ~(p0_shift_0[0]) | p0_shift_0[1]
                : p0_aligned_a[0] ? _GEN_21 : (&p0_shift_0))
       : p0_aligned_a[1]
           ? (p0_aligned_a[2]
                ? (p0_aligned_a[0] ? _GEN_20 : ^p0_shift_0)
                : p0_aligned_a[0] ? ~(p0_shift_0[1]) : _GEN_19)
           : p0_aligned_a[2]
               ? (p0_aligned_a[0] | p0_shift_0[1]) & ~(p0_shift_0[0])
               : p0_aligned_a[0] & _GEN_18) & ~p0__pa_exp_ge_pb_exp_;	// rope_apply.k:273:9, :377:21, :398:{25,29,49,61}, :399:{25,29,49,61}
  wire  [15:0] aligned_a_18 =
    {4'h0,
     aligned_a_6,
     aligned_a_7,
     aligned_a_8,
     aligned_a_9,
     aligned_a_10,
     aligned_a_11,
     aligned_a_12,
     aligned_a_13,
     aligned_a_14,
     aligned_a_15,
     aligned_a_16,
     aligned_a_17};	// rope_apply.k:377:21
  wire         aligned_b = p0_aligned_b[11] & _GEN_14 | ~p0__pa_exp_ge_pb_exp_;	// rope_apply.k:273:9, :377:21, :386:{25,29,49,61}, :387:{25,29,49,61}
  wire         aligned_b_0 =
    (p0_aligned_b[11]
       ? (p0_aligned_b[10] ? ~(p0_shift[1]) : _GEN_15)
       : p0_aligned_b[10] & _GEN_14)
      ? p0__pb_mant_shl_4_[10] | p0__pa_exp_ge_pb_exp_
      : p0__pb_mant_shl_4_[10] & ~p0__pa_exp_ge_pb_exp_;	// rope_apply.k:273:9, :377:21, :386:{25,29,49,61}, :387:{25,29,49,61}
  wire         aligned_b_1 =
    (p0_aligned_b[10]
       ? (p0_aligned_b[11]
            ? (p0_aligned_b[9] ? _GEN_16 : ^p0_shift)
            : p0_aligned_b[9] ? ~(p0_shift[1]) : _GEN_15)
       : p0_aligned_b[11]
           ? (p0_aligned_b[9] | p0_shift[1]) & ~(p0_shift[0])
           : p0_aligned_b[9] & _GEN_14)
      ? p0__pb_mant_shl_4_[9] | p0__pa_exp_ge_pb_exp_
      : p0__pb_mant_shl_4_[9] & ~p0__pa_exp_ge_pb_exp_;	// rope_apply.k:273:9, :377:21, :386:{25,29,49,61}, :387:{25,29,49,61}
  wire         aligned_b_2 =
    (p0_aligned_b[11]
       ? (p0_aligned_b[9]
            ? (p0_aligned_b[10]
                 ? p0_aligned_b[8] | (|p0_shift)
                 : p0_aligned_b[8] & ~(p0_shift[1]) | p0_shift[0])
            : p0_aligned_b[10]
                ? p0_aligned_b[8] & ~(p0_shift[0]) | p0_shift[1]
                : p0_aligned_b[8] ? _GEN_17 : (&p0_shift))
       : p0_aligned_b[9]
           ? (p0_aligned_b[10]
                ? (p0_aligned_b[8] ? _GEN_16 : ^p0_shift)
                : p0_aligned_b[8] ? ~(p0_shift[1]) : _GEN_15)
           : p0_aligned_b[10]
               ? (p0_aligned_b[8] | p0_shift[1]) & ~(p0_shift[0])
               : p0_aligned_b[8] & _GEN_14)
      ? p0__pb_mant_shl_4_[8] | p0__pa_exp_ge_pb_exp_
      : p0__pb_mant_shl_4_[8] & ~p0__pa_exp_ge_pb_exp_;	// rope_apply.k:273:9, :377:21, :386:{25,29,49,61}, :387:{25,29,49,61}
  wire         aligned_b_3 =
    (p0_aligned_b[10]
       ? (p0_aligned_b[8]
            ? (p0_aligned_b[9]
                 ? p0_aligned_b[7] | (|p0_shift)
                 : p0_aligned_b[7] & ~(p0_shift[1]) | p0_shift[0])
            : p0_aligned_b[9]
                ? p0_aligned_b[7] & ~(p0_shift[0]) | p0_shift[1]
                : p0_aligned_b[7] ? _GEN_17 : (&p0_shift))
       : p0_aligned_b[8]
           ? (p0_aligned_b[9]
                ? (p0_aligned_b[7] ? _GEN_16 : ^p0_shift)
                : p0_aligned_b[7] ? ~(p0_shift[1]) : _GEN_15)
           : p0_aligned_b[9]
               ? (p0_aligned_b[7] | p0_shift[1]) & ~(p0_shift[0])
               : p0_aligned_b[7] & _GEN_14)
      ? p0__pb_mant_shl_4_[7] | p0__pa_exp_ge_pb_exp_
      : p0__pb_mant_shl_4_[7] & ~p0__pa_exp_ge_pb_exp_;	// rope_apply.k:273:9, :377:21, :386:{25,29,49,61}, :387:{25,29,49,61}
  wire         aligned_b_4 =
    (p0_aligned_b[9]
       ? (p0_aligned_b[7]
            ? (p0_aligned_b[8]
                 ? p0_aligned_b[6] | (|p0_shift)
                 : p0_aligned_b[6] & ~(p0_shift[1]) | p0_shift[0])
            : p0_aligned_b[8]
                ? p0_aligned_b[6] & ~(p0_shift[0]) | p0_shift[1]
                : p0_aligned_b[6] ? _GEN_17 : (&p0_shift))
       : p0_aligned_b[7]
           ? (p0_aligned_b[8]
                ? (p0_aligned_b[6] ? _GEN_16 : ^p0_shift)
                : p0_aligned_b[6] ? ~(p0_shift[1]) : _GEN_15)
           : p0_aligned_b[8]
               ? (p0_aligned_b[6] | p0_shift[1]) & ~(p0_shift[0])
               : p0_aligned_b[6] & _GEN_14)
      ? p0__pb_mant_shl_4_[6] | p0__pa_exp_ge_pb_exp_
      : p0__pb_mant_shl_4_[6] & ~p0__pa_exp_ge_pb_exp_;	// rope_apply.k:273:9, :377:21, :386:{25,29,49,61}, :387:{25,29,49,61}
  wire         aligned_b_5 =
    (p0_aligned_b[8]
       ? (p0_aligned_b[6]
            ? (p0_aligned_b[7]
                 ? p0_aligned_b[5] | (|p0_shift)
                 : p0_aligned_b[5] & ~(p0_shift[1]) | p0_shift[0])
            : p0_aligned_b[7]
                ? p0_aligned_b[5] & ~(p0_shift[0]) | p0_shift[1]
                : p0_aligned_b[5] ? _GEN_17 : (&p0_shift))
       : p0_aligned_b[6]
           ? (p0_aligned_b[7]
                ? (p0_aligned_b[5] ? _GEN_16 : ^p0_shift)
                : p0_aligned_b[5] ? ~(p0_shift[1]) : _GEN_15)
           : p0_aligned_b[7]
               ? (p0_aligned_b[5] | p0_shift[1]) & ~(p0_shift[0])
               : p0_aligned_b[5] & _GEN_14)
      ? p0__pb_mant_shl_4_[5] | p0__pa_exp_ge_pb_exp_
      : p0__pb_mant_shl_4_[5] & ~p0__pa_exp_ge_pb_exp_;	// rope_apply.k:273:9, :377:21, :386:{25,29,49,61}, :387:{25,29,49,61}
  wire         aligned_b_6 =
    (p0_aligned_b[7]
       ? (p0_aligned_b[5]
            ? (p0_aligned_b[6]
                 ? p0_aligned_b[4] | (|p0_shift)
                 : p0_aligned_b[4] & ~(p0_shift[1]) | p0_shift[0])
            : p0_aligned_b[6]
                ? p0_aligned_b[4] & ~(p0_shift[0]) | p0_shift[1]
                : p0_aligned_b[4] ? _GEN_17 : (&p0_shift))
       : p0_aligned_b[5]
           ? (p0_aligned_b[6]
                ? (p0_aligned_b[4] ? _GEN_16 : ^p0_shift)
                : p0_aligned_b[4] ? ~(p0_shift[1]) : _GEN_15)
           : p0_aligned_b[6]
               ? (p0_aligned_b[4] | p0_shift[1]) & ~(p0_shift[0])
               : p0_aligned_b[4] & _GEN_14)
      ? p0__pb_mant_shl_4_[4] | p0__pa_exp_ge_pb_exp_
      : p0__pb_mant_shl_4_[4] & ~p0__pa_exp_ge_pb_exp_;	// rope_apply.k:273:9, :377:21, :386:{25,29,49,61}, :387:{25,29,49,61}
  wire         aligned_b_7 =
    (p0_aligned_b[6]
       ? (p0_aligned_b[4]
            ? (p0_aligned_b[5]
                 ? p0_aligned_b[3] | (|p0_shift)
                 : p0_aligned_b[3] & ~(p0_shift[1]) | p0_shift[0])
            : p0_aligned_b[5]
                ? p0_aligned_b[3] & ~(p0_shift[0]) | p0_shift[1]
                : p0_aligned_b[3] ? _GEN_17 : (&p0_shift))
       : p0_aligned_b[4]
           ? (p0_aligned_b[5]
                ? (p0_aligned_b[3] ? _GEN_16 : ^p0_shift)
                : p0_aligned_b[3] ? ~(p0_shift[1]) : _GEN_15)
           : p0_aligned_b[5]
               ? (p0_aligned_b[3] | p0_shift[1]) & ~(p0_shift[0])
               : p0_aligned_b[3] & _GEN_14) & p0__pa_exp_ge_pb_exp_;	// rope_apply.k:273:9, :377:21, :386:{25,29,49,61}, :387:{25,29,49,61}
  wire         aligned_b_8 =
    (p0_aligned_b[5]
       ? (p0_aligned_b[3]
            ? (p0_aligned_b[4]
                 ? p0_aligned_b[2] | (|p0_shift)
                 : p0_aligned_b[2] & ~(p0_shift[1]) | p0_shift[0])
            : p0_aligned_b[4]
                ? p0_aligned_b[2] & ~(p0_shift[0]) | p0_shift[1]
                : p0_aligned_b[2] ? _GEN_17 : (&p0_shift))
       : p0_aligned_b[3]
           ? (p0_aligned_b[4]
                ? (p0_aligned_b[2] ? _GEN_16 : ^p0_shift)
                : p0_aligned_b[2] ? ~(p0_shift[1]) : _GEN_15)
           : p0_aligned_b[4]
               ? (p0_aligned_b[2] | p0_shift[1]) & ~(p0_shift[0])
               : p0_aligned_b[2] & _GEN_14) & p0__pa_exp_ge_pb_exp_;	// rope_apply.k:273:9, :377:21, :386:{25,29,49,61}, :387:{25,29,49,61}
  wire         aligned_b_9 =
    (p0_aligned_b[4]
       ? (p0_aligned_b[2]
            ? (p0_aligned_b[3]
                 ? p0_aligned_b[1] | (|p0_shift)
                 : p0_aligned_b[1] & ~(p0_shift[1]) | p0_shift[0])
            : p0_aligned_b[3]
                ? p0_aligned_b[1] & ~(p0_shift[0]) | p0_shift[1]
                : p0_aligned_b[1] ? _GEN_17 : (&p0_shift))
       : p0_aligned_b[2]
           ? (p0_aligned_b[3]
                ? (p0_aligned_b[1] ? _GEN_16 : ^p0_shift)
                : p0_aligned_b[1] ? ~(p0_shift[1]) : _GEN_15)
           : p0_aligned_b[3]
               ? (p0_aligned_b[1] | p0_shift[1]) & ~(p0_shift[0])
               : p0_aligned_b[1] & _GEN_14) & p0__pa_exp_ge_pb_exp_;	// rope_apply.k:273:9, :377:21, :386:{25,29,49,61}, :387:{25,29,49,61}
  wire         aligned_b_10 =
    (p0_aligned_b[3]
       ? (p0_aligned_b[1]
            ? (p0_aligned_b[2]
                 ? p0_aligned_b[0] | (|p0_shift)
                 : p0_aligned_b[0] & ~(p0_shift[1]) | p0_shift[0])
            : p0_aligned_b[2]
                ? p0_aligned_b[0] & ~(p0_shift[0]) | p0_shift[1]
                : p0_aligned_b[0] ? _GEN_17 : (&p0_shift))
       : p0_aligned_b[1]
           ? (p0_aligned_b[2]
                ? (p0_aligned_b[0] ? _GEN_16 : ^p0_shift)
                : p0_aligned_b[0] ? ~(p0_shift[1]) : _GEN_15)
           : p0_aligned_b[2]
               ? (p0_aligned_b[0] | p0_shift[1]) & ~(p0_shift[0])
               : p0_aligned_b[0] & _GEN_14) & p0__pa_exp_ge_pb_exp_;	// rope_apply.k:273:9, :377:21, :386:{25,29,49,61}, :387:{25,29,49,61}
  wire  [15:0] aligned_b_11 =
    {4'h0,
     aligned_b,
     aligned_b_0,
     aligned_b_1,
     aligned_b_2,
     aligned_b_3,
     aligned_b_4,
     aligned_b_5,
     aligned_b_6,
     aligned_b_7,
     aligned_b_8,
     aligned_b_9,
     aligned_b_10};	// rope_apply.k:377:21
  wire  [12:0] _aligned_a_plus_aligned_b_ =
    13'({1'h0,
         aligned_a_6,
         aligned_a_7,
         aligned_a_8,
         aligned_a_9,
         aligned_a_10,
         aligned_a_11,
         aligned_a_12,
         aligned_a_13,
         aligned_a_14,
         aligned_a_15,
         aligned_a_16,
         aligned_a_17}
        + {1'h0,
           aligned_b,
           aligned_b_0,
           aligned_b_1,
           aligned_b_2,
           aligned_b_3,
           aligned_b_4,
           aligned_b_5,
           aligned_b_6,
           aligned_b_7,
           aligned_b_8,
           aligned_b_9,
           aligned_b_10});	// rope_apply.k:377:21, :407:31
  wire         _aligned_a_ge_aligned_b_ =
    {aligned_a_6,
     aligned_a_7,
     aligned_a_8,
     aligned_a_9,
     aligned_a_10,
     aligned_a_11,
     aligned_a_12,
     aligned_a_13,
     aligned_a_14,
     aligned_a_15,
     aligned_a_16,
     aligned_a_17} >= {aligned_b,
                       aligned_b_0,
                       aligned_b_1,
                       aligned_b_2,
                       aligned_b_3,
                       aligned_b_4,
                       aligned_b_5,
                       aligned_b_6,
                       aligned_b_7,
                       aligned_b_8,
                       aligned_b_9,
                       aligned_b_10};	// rope_apply.k:377:21, :411:29
  wire  [15:0] _aligned_a_minus_aligned_b_ = 16'(aligned_a_18 - aligned_b_11);	// rope_apply.k:377:21, :414:35
  wire  [15:0] _aligned_b_minus_aligned_a_ = 16'(aligned_b_11 - aligned_a_18);	// rope_apply.k:377:21, :419:35
  wire         _GEN_22 = ~_aligned_a_ge_aligned_b_ & ~p0__pa_sign_eq_pb_sign_;	// rope_apply.k:273:9, :404:21, :411:{25,29}
  wire         sum =
    _aligned_a_minus_aligned_b_[15]
      ? (_aligned_b_minus_aligned_a_[15] | _aligned_a_ge_aligned_b_)
        & ~p0__pa_sign_eq_pb_sign_
      : _aligned_b_minus_aligned_a_[15] & _GEN_22;	// rope_apply.k:273:9, :404:21, :411:{25,29}, :414:35, :419:35
  wire         sum_0 =
    _aligned_a_minus_aligned_b_[14]
      ? (_aligned_b_minus_aligned_a_[14] | _aligned_a_ge_aligned_b_)
        & ~p0__pa_sign_eq_pb_sign_
      : _aligned_b_minus_aligned_a_[14] & _GEN_22;	// rope_apply.k:273:9, :404:21, :411:{25,29}, :414:35, :419:35
  wire         sum_1 =
    _aligned_a_minus_aligned_b_[13]
      ? (_aligned_b_minus_aligned_a_[13] | _aligned_a_ge_aligned_b_)
        & ~p0__pa_sign_eq_pb_sign_
      : _aligned_b_minus_aligned_a_[13] & _GEN_22;	// rope_apply.k:273:9, :404:21, :411:{25,29}, :414:35, :419:35
  wire         _GEN_23 = _aligned_a_ge_aligned_b_ | p0__pa_sign_eq_pb_sign_;	// rope_apply.k:273:9, :404:21, :411:{25,29}
  wire         sum_2 =
    _aligned_a_plus_aligned_b_[12]
      ? (_aligned_a_minus_aligned_b_[12]
           ? _aligned_b_minus_aligned_a_[12] | _GEN_23
           : _aligned_b_minus_aligned_a_[12] & ~_aligned_a_ge_aligned_b_
             | p0__pa_sign_eq_pb_sign_)
      : _aligned_a_minus_aligned_b_[12]
          ? (_aligned_b_minus_aligned_a_[12] | _aligned_a_ge_aligned_b_)
            & ~p0__pa_sign_eq_pb_sign_
          : _aligned_b_minus_aligned_a_[12] & _GEN_22;	// rope_apply.k:273:9, :404:21, :407:31, :411:{25,29}, :414:35, :419:35
  wire         sum_3 =
    _aligned_a_plus_aligned_b_[11]
      ? (_aligned_a_minus_aligned_b_[11]
           ? _aligned_b_minus_aligned_a_[11] | _GEN_23
           : _aligned_b_minus_aligned_a_[11] & ~_aligned_a_ge_aligned_b_
             | p0__pa_sign_eq_pb_sign_)
      : _aligned_a_minus_aligned_b_[11]
          ? (_aligned_b_minus_aligned_a_[11] | _aligned_a_ge_aligned_b_)
            & ~p0__pa_sign_eq_pb_sign_
          : _aligned_b_minus_aligned_a_[11] & _GEN_22;	// rope_apply.k:273:9, :404:21, :407:31, :411:{25,29}, :414:35, :419:35
  wire         sum_4 =
    _aligned_a_plus_aligned_b_[10]
      ? (_aligned_a_minus_aligned_b_[10]
           ? _aligned_b_minus_aligned_a_[10] | _GEN_23
           : _aligned_b_minus_aligned_a_[10] & ~_aligned_a_ge_aligned_b_
             | p0__pa_sign_eq_pb_sign_)
      : _aligned_a_minus_aligned_b_[10]
          ? (_aligned_b_minus_aligned_a_[10] | _aligned_a_ge_aligned_b_)
            & ~p0__pa_sign_eq_pb_sign_
          : _aligned_b_minus_aligned_a_[10] & _GEN_22;	// rope_apply.k:273:9, :404:21, :407:31, :411:{25,29}, :414:35, :419:35
  wire         sum_5 =
    _aligned_a_plus_aligned_b_[9]
      ? (_aligned_a_minus_aligned_b_[9]
           ? _aligned_b_minus_aligned_a_[9] | _GEN_23
           : _aligned_b_minus_aligned_a_[9] & ~_aligned_a_ge_aligned_b_
             | p0__pa_sign_eq_pb_sign_)
      : _aligned_a_minus_aligned_b_[9]
          ? (_aligned_b_minus_aligned_a_[9] | _aligned_a_ge_aligned_b_)
            & ~p0__pa_sign_eq_pb_sign_
          : _aligned_b_minus_aligned_a_[9] & _GEN_22;	// rope_apply.k:273:9, :404:21, :407:31, :411:{25,29}, :414:35, :419:35
  wire         sum_6 =
    _aligned_a_plus_aligned_b_[8]
      ? (_aligned_a_minus_aligned_b_[8]
           ? _aligned_b_minus_aligned_a_[8] | _GEN_23
           : _aligned_b_minus_aligned_a_[8] & ~_aligned_a_ge_aligned_b_
             | p0__pa_sign_eq_pb_sign_)
      : _aligned_a_minus_aligned_b_[8]
          ? (_aligned_b_minus_aligned_a_[8] | _aligned_a_ge_aligned_b_)
            & ~p0__pa_sign_eq_pb_sign_
          : _aligned_b_minus_aligned_a_[8] & _GEN_22;	// rope_apply.k:273:9, :404:21, :407:31, :411:{25,29}, :414:35, :419:35
  wire         sum_7 =
    _aligned_a_plus_aligned_b_[7]
      ? (_aligned_a_minus_aligned_b_[7]
           ? _aligned_b_minus_aligned_a_[7] | _GEN_23
           : _aligned_b_minus_aligned_a_[7] & ~_aligned_a_ge_aligned_b_
             | p0__pa_sign_eq_pb_sign_)
      : _aligned_a_minus_aligned_b_[7]
          ? (_aligned_b_minus_aligned_a_[7] | _aligned_a_ge_aligned_b_)
            & ~p0__pa_sign_eq_pb_sign_
          : _aligned_b_minus_aligned_a_[7] & _GEN_22;	// rope_apply.k:273:9, :404:21, :407:31, :411:{25,29}, :414:35, :419:35
  wire         sum_8 =
    _aligned_a_plus_aligned_b_[6]
      ? (_aligned_a_minus_aligned_b_[6]
           ? _aligned_b_minus_aligned_a_[6] | _GEN_23
           : _aligned_b_minus_aligned_a_[6] & ~_aligned_a_ge_aligned_b_
             | p0__pa_sign_eq_pb_sign_)
      : _aligned_a_minus_aligned_b_[6]
          ? (_aligned_b_minus_aligned_a_[6] | _aligned_a_ge_aligned_b_)
            & ~p0__pa_sign_eq_pb_sign_
          : _aligned_b_minus_aligned_a_[6] & _GEN_22;	// rope_apply.k:273:9, :404:21, :407:31, :411:{25,29}, :414:35, :419:35
  wire         sum_9 =
    _aligned_a_plus_aligned_b_[5]
      ? (_aligned_a_minus_aligned_b_[5]
           ? _aligned_b_minus_aligned_a_[5] | _GEN_23
           : _aligned_b_minus_aligned_a_[5] & ~_aligned_a_ge_aligned_b_
             | p0__pa_sign_eq_pb_sign_)
      : _aligned_a_minus_aligned_b_[5]
          ? (_aligned_b_minus_aligned_a_[5] | _aligned_a_ge_aligned_b_)
            & ~p0__pa_sign_eq_pb_sign_
          : _aligned_b_minus_aligned_a_[5] & _GEN_22;	// rope_apply.k:273:9, :404:21, :407:31, :411:{25,29}, :414:35, :419:35
  wire         sum_10 =
    _aligned_a_plus_aligned_b_[4]
      ? (_aligned_a_minus_aligned_b_[4]
           ? _aligned_b_minus_aligned_a_[4] | _GEN_23
           : _aligned_b_minus_aligned_a_[4] & ~_aligned_a_ge_aligned_b_
             | p0__pa_sign_eq_pb_sign_)
      : _aligned_a_minus_aligned_b_[4]
          ? (_aligned_b_minus_aligned_a_[4] | _aligned_a_ge_aligned_b_)
            & ~p0__pa_sign_eq_pb_sign_
          : _aligned_b_minus_aligned_a_[4] & _GEN_22;	// rope_apply.k:273:9, :404:21, :407:31, :411:{25,29}, :414:35, :419:35
  wire         sum_11 =
    _aligned_a_plus_aligned_b_[3]
      ? (_aligned_a_minus_aligned_b_[3]
           ? _aligned_b_minus_aligned_a_[3] | _GEN_23
           : _aligned_b_minus_aligned_a_[3] & ~_aligned_a_ge_aligned_b_
             | p0__pa_sign_eq_pb_sign_)
      : _aligned_a_minus_aligned_b_[3]
          ? (_aligned_b_minus_aligned_a_[3] | _aligned_a_ge_aligned_b_)
            & ~p0__pa_sign_eq_pb_sign_
          : _aligned_b_minus_aligned_a_[3] & _GEN_22;	// rope_apply.k:273:9, :404:21, :407:31, :411:{25,29}, :414:35, :419:35
  wire         sum_12 =
    _aligned_a_plus_aligned_b_[2]
      ? (_aligned_a_minus_aligned_b_[2]
           ? _aligned_b_minus_aligned_a_[2] | _GEN_23
           : _aligned_b_minus_aligned_a_[2] & ~_aligned_a_ge_aligned_b_
             | p0__pa_sign_eq_pb_sign_)
      : _aligned_a_minus_aligned_b_[2]
          ? (_aligned_b_minus_aligned_a_[2] | _aligned_a_ge_aligned_b_)
            & ~p0__pa_sign_eq_pb_sign_
          : _aligned_b_minus_aligned_a_[2] & _GEN_22;	// rope_apply.k:273:9, :404:21, :407:31, :411:{25,29}, :414:35, :419:35
  wire         sum_13 =
    _aligned_a_plus_aligned_b_[1]
      ? (_aligned_a_minus_aligned_b_[1]
           ? _aligned_b_minus_aligned_a_[1] | _GEN_23
           : _aligned_b_minus_aligned_a_[1] & ~_aligned_a_ge_aligned_b_
             | p0__pa_sign_eq_pb_sign_)
      : _aligned_a_minus_aligned_b_[1]
          ? (_aligned_b_minus_aligned_a_[1] | _aligned_a_ge_aligned_b_)
            & ~p0__pa_sign_eq_pb_sign_
          : _aligned_b_minus_aligned_a_[1] & _GEN_22;	// rope_apply.k:273:9, :404:21, :407:31, :411:{25,29}, :414:35, :419:35
  wire         sum_14 =
    _aligned_a_plus_aligned_b_[0]
      ? (_aligned_a_minus_aligned_b_[0]
           ? _aligned_b_minus_aligned_a_[0] | _GEN_23
           : _aligned_b_minus_aligned_a_[0] & ~_aligned_a_ge_aligned_b_
             | p0__pa_sign_eq_pb_sign_)
      : _aligned_a_minus_aligned_b_[0]
          ? (_aligned_b_minus_aligned_a_[0] | _aligned_a_ge_aligned_b_)
            & ~p0__pa_sign_eq_pb_sign_
          : _aligned_b_minus_aligned_a_[0] & _GEN_22;	// rope_apply.k:273:9, :404:21, :407:31, :411:{25,29}, :414:35, :419:35
  wire  [15:0] sum_15 =
    {sum,
     sum_0,
     sum_1,
     sum_2,
     sum_3,
     sum_4,
     sum_5,
     sum_6,
     sum_7,
     sum_8,
     sum_9,
     sum_10,
     sum_11,
     sum_12,
     sum_13,
     sum_14};	// rope_apply.k:404:21, :411:25
  wire  [7:0]  _GEN_24 = {sum, sum_0, sum_1, sum_2, sum_3, sum_4, sum_5, sum_6};	// rope_apply.k:404:21, :411:25, :427:29
  wire         tmp = sum ? sum_7 | (|_GEN_24) : sum_7 & ~(|_GEN_24);	// rope_apply.k:404:21, :411:25, :427:{25,29,52,58}
  wire         tmp_0 = sum_0 ? sum_8 | (|_GEN_24) : sum_8 & ~(|_GEN_24);	// rope_apply.k:404:21, :411:25, :427:{25,29,52,58}
  wire         tmp_1 = sum_1 ? sum_9 | (|_GEN_24) : sum_9 & ~(|_GEN_24);	// rope_apply.k:404:21, :411:25, :427:{25,29,52,58}
  wire         tmp_2 = sum_2 ? sum_10 | (|_GEN_24) : sum_10 & ~(|_GEN_24);	// rope_apply.k:404:21, :411:25, :427:{25,29,52,58}
  wire         tmp_3 = sum_3 ? sum_11 | (|_GEN_24) : sum_11 & ~(|_GEN_24);	// rope_apply.k:404:21, :411:25, :427:{25,29,52,58}
  wire         tmp_4 = sum_4 ? sum_12 | (|_GEN_24) : sum_12 & ~(|_GEN_24);	// rope_apply.k:404:21, :411:25, :427:{25,29,52,58}
  wire         tmp_5 = sum_5 ? sum_13 | (|_GEN_24) : sum_13 & ~(|_GEN_24);	// rope_apply.k:404:21, :411:25, :427:{25,29,52,58}
  wire         tmp_6 = sum_6 ? sum_14 | (|_GEN_24) : sum_14 & ~(|_GEN_24);	// rope_apply.k:404:21, :411:25, :427:{25,29,52,58}
  wire         tmp_7 =
    p0_tmp[7] ? p0_tmp[3] | (|p0__tmp_and_240_) : p0_tmp[3] & ~(|p0__tmp_and_240_);	// rope_apply.k:273:9, :428:{25,29,52,58}
  wire         tmp_8 =
    p0_tmp[6] ? p0_tmp[2] | (|p0__tmp_and_240_) : p0_tmp[2] & ~(|p0__tmp_and_240_);	// rope_apply.k:273:9, :428:{25,29,52,58}
  wire         pos = tmp_7 | tmp_8;	// rope_apply.k:427:25, :428:{25,52,58,74}, :429:{25,29,52,58,74}, :430:{25,29,58}
  wire         pos_0 =
    (p0_tmp[5] ? p0_tmp[1] | (|p0__tmp_and_240_) : p0_tmp[1] & ~(|p0__tmp_and_240_))
    & ~tmp_8 | tmp_7;	// rope_apply.k:273:9, :427:25, :428:{25,29,52,58,74}, :429:{25,29,52,58,74}, :430:{25,29,58}
  wire  [15:0] pos_1 = {12'h0, p0__tmp_and_65280_ne_0_, |p0__tmp_and_240_, pos, pos_0};	// rope_apply.k:273:9, :427:25, :428:{25,29,74}, :429:{25,29,52,58,74}, :430:{25,29,58}
  wire         _pos_gt_11_ = pos_1 > 16'hB;	// rope_apply.k:427:25, :428:{25,74}, :429:{25,29,52,58,74}, :430:{25,29,58}, :434:29
  wire         _pos_lt_11_ = pos_1 < 16'hB;	// rope_apply.k:427:25, :428:{25,74}, :429:{25,29,52,58,74}, :430:{25,29,58}, :439:34
  wire  [15:0] _11_minus_pos_ = 16'(16'hB - pos_1);	// rope_apply.k:427:25, :428:{25,74}, :429:{25,29,52,58,74}, :430:{25,29,58}, :441:43
  wire  [15:0] _sr_exp_plus_pos_minus_11_ = 16'(p0_sr_exp_0 + 16'(pos_1 - 16'hB));	// rope_apply.k:273:9, :427:25, :428:{25,74}, :429:{25,29,52,58,74}, :430:{25,29,58}, :436:{40,49}
  wire  [15:0] _sum_shr_pos_minus_7_ =
    p0_sum
    >> 16'({12'h0, p0__tmp_and_65280_ne_0_, |p0__tmp_and_240_, pos, pos_0} - 16'h7);	// rope_apply.k:273:9, :427:25, :428:{25,29,74}, :429:{25,29,52,58,74}, :430:{25,29,58}, :437:{38,46}
  wire         _diff_ge_sr_exp_ = _11_minus_pos_ >= p0_sr_exp_0;	// rope_apply.k:273:9, :441:43, :442:33
  wire  [15:0] _sr_exp_minus_diff_ = 16'(p0_sr_exp_0 - _11_minus_pos_);	// rope_apply.k:273:9, :441:43, :448:44
  wire         _GEN_25 = ~(_11_minus_pos_[3]) | ~(_11_minus_pos_[2]);	// rope_apply.k:441:43, :451:{29,33,62}, :452:{29,33,62}
  wire         _GEN_26 = _11_minus_pos_[3] ^ _11_minus_pos_[2];	// rope_apply.k:441:43, :451:{29,33,62}, :452:{29,33,62}
  wire         _GEN_27 = ~(_11_minus_pos_[3]) & _11_minus_pos_[2];	// rope_apply.k:441:43, :451:{29,33,62}, :452:{29,33,62}
  wire         _GEN_28 = ~(_11_minus_pos_[3]) & ~(_11_minus_pos_[2]);	// rope_apply.k:441:43, :451:{29,33,62}, :452:{29,33,62}
  wire         shifted =
    p0_sum[6]
      ? (p0_sum[2]
           ? (p0_sum[10] ? _GEN_25 : _GEN_26)
           : p0_sum[10] ? ~(_11_minus_pos_[3]) : _GEN_27)
      : p0_sum[2]
          ? (p0_sum[10] | _11_minus_pos_[3]) & ~(_11_minus_pos_[2])
          : p0_sum[10] & _GEN_28;	// rope_apply.k:273:9, :441:43, :451:{29,33,62}, :452:{29,33,62}
  wire         shifted_0 =
    p0_sum[5]
      ? (p0_sum[1]
           ? (p0_sum[9] ? _GEN_25 : _GEN_26)
           : p0_sum[9] ? ~(_11_minus_pos_[3]) : _GEN_27)
      : p0_sum[1]
          ? (p0_sum[9] | _11_minus_pos_[3]) & ~(_11_minus_pos_[2])
          : p0_sum[9] & _GEN_28;	// rope_apply.k:273:9, :441:43, :451:{29,33,62}, :452:{29,33,62}
  wire         shifted_1 =
    p0_sum[4]
      ? (p0_sum[0]
           ? (p0_sum[8] ? _GEN_25 : _GEN_26)
           : p0_sum[8] ? ~(_11_minus_pos_[3]) : _GEN_27)
      : p0_sum[0]
          ? (p0_sum[8] | _11_minus_pos_[3]) & ~(_11_minus_pos_[2])
          : p0_sum[8] & _GEN_28;	// rope_apply.k:273:9, :441:43, :451:{29,33,62}, :452:{29,33,62}
  wire         shifted_2 =
    p0_sum[3] ? (p0_sum[7] ? ~(_11_minus_pos_[3]) : _GEN_27) : p0_sum[7] & _GEN_28;	// rope_apply.k:273:9, :441:43, :451:{29,33,62}, :452:{29,33,62}
  wire         shifted_3 =
    p0_sum[2] ? (p0_sum[6] ? ~(_11_minus_pos_[3]) : _GEN_27) : p0_sum[6] & _GEN_28;	// rope_apply.k:273:9, :441:43, :451:{29,33,62}, :452:{29,33,62}
  wire         shifted_4 =
    p0_sum[1] ? (p0_sum[5] ? ~(_11_minus_pos_[3]) : _GEN_27) : p0_sum[5] & _GEN_28;	// rope_apply.k:273:9, :441:43, :451:{29,33,62}, :452:{29,33,62}
  wire         shifted_5 =
    p0_sum[0] ? (p0_sum[4] ? ~(_11_minus_pos_[3]) : _GEN_27) : p0_sum[4] & _GEN_28;	// rope_apply.k:273:9, :441:43, :451:{29,33,62}, :452:{29,33,62}
  wire         shifted_6 = p0_sum[3] & _GEN_28;	// rope_apply.k:273:9, :451:{29,33,62}, :452:{29,33,62}
  wire         shifted_7 = p0_sum[2] & _GEN_28;	// rope_apply.k:273:9, :451:{29,33,62}, :452:{29,33,62}
  wire         _GEN_29 = _11_minus_pos_[1] | _11_minus_pos_[0];	// rope_apply.k:441:43, :453:{29,33,62}, :454:{29,33,62}, :455:{29,38}
  wire         _GEN_30 = _11_minus_pos_[1] ^ ~(_11_minus_pos_[0]);	// rope_apply.k:441:43, :453:{29,33,62}, :454:{29,33,62}, :455:{29,38}
  wire         _GEN_31 = _11_minus_pos_[1] & _11_minus_pos_[0];	// rope_apply.k:441:43, :453:{29,33,62}, :454:{29,33,62}, :455:{29,38}
  wire         _GEN_32 = ~(_11_minus_pos_[1]) | ~(_11_minus_pos_[0]);	// rope_apply.k:441:43, :453:{29,33,62}, :454:{29,33,62}, :455:{29,38}
  wire         _GEN_33 = _11_minus_pos_[1] ^ _11_minus_pos_[0];	// rope_apply.k:441:43, :453:{29,33,62}, :454:{29,33,62}, :455:{29,38}
  wire         _GEN_34 = ~(_11_minus_pos_[1]) & _11_minus_pos_[0];	// rope_apply.k:441:43, :453:{29,33,62}, :454:{29,33,62}, :455:{29,38}
  wire         _GEN_35 = ~(_11_minus_pos_[1]) & ~(_11_minus_pos_[0]);	// rope_apply.k:441:43, :453:{29,33,62}, :454:{29,33,62}, :455:{29,38}
  wire         r_mant =
    shifted_2
      ? (shifted_0
           ? (shifted_1
                ? shifted | _GEN_29
                : shifted & ~(_11_minus_pos_[1]) | _11_minus_pos_[0])
           : shifted_1
               ? shifted & ~(_11_minus_pos_[0]) | _11_minus_pos_[1]
               : shifted ? _GEN_30 : _GEN_31)
      : shifted_0
          ? (shifted_1
               ? (shifted ? _GEN_32 : _GEN_33)
               : shifted ? ~(_11_minus_pos_[1]) : _GEN_34)
          : shifted_1
              ? (shifted | _11_minus_pos_[1]) & ~(_11_minus_pos_[0])
              : shifted & _GEN_35;	// rope_apply.k:441:43, :451:{29,33,62}, :452:{29,33,62}, :453:{29,33,62}, :454:{29,33,62}, :455:{29,38}
  wire         r_mant_0 =
    shifted_3
      ? (shifted_1
           ? (shifted_2
                ? shifted_0 | _GEN_29
                : shifted_0 & ~(_11_minus_pos_[1]) | _11_minus_pos_[0])
           : shifted_2
               ? shifted_0 & ~(_11_minus_pos_[0]) | _11_minus_pos_[1]
               : shifted_0 ? _GEN_30 : _GEN_31)
      : shifted_1
          ? (shifted_2
               ? (shifted_0 ? _GEN_32 : _GEN_33)
               : shifted_0 ? ~(_11_minus_pos_[1]) : _GEN_34)
          : shifted_2
              ? (shifted_0 | _11_minus_pos_[1]) & ~(_11_minus_pos_[0])
              : shifted_0 & _GEN_35;	// rope_apply.k:441:43, :451:{29,33,62}, :452:{29,33,62}, :453:{29,33,62}, :454:{29,33,62}, :455:{29,38}
  wire         r_mant_1 =
    shifted_4
      ? (shifted_2
           ? (shifted_3
                ? shifted_1 | _GEN_29
                : shifted_1 & ~(_11_minus_pos_[1]) | _11_minus_pos_[0])
           : shifted_3
               ? shifted_1 & ~(_11_minus_pos_[0]) | _11_minus_pos_[1]
               : shifted_1 ? _GEN_30 : _GEN_31)
      : shifted_2
          ? (shifted_3
               ? (shifted_1 ? _GEN_32 : _GEN_33)
               : shifted_1 ? ~(_11_minus_pos_[1]) : _GEN_34)
          : shifted_3
              ? (shifted_1 | _11_minus_pos_[1]) & ~(_11_minus_pos_[0])
              : shifted_1 & _GEN_35;	// rope_apply.k:441:43, :451:{29,33,62}, :452:{29,33,62}, :453:{29,33,62}, :454:{29,33,62}, :455:{29,38}
  wire         r_mant_2 =
    shifted_5
      ? (shifted_3
           ? (shifted_4
                ? shifted_2 | _GEN_29
                : shifted_2 & ~(_11_minus_pos_[1]) | _11_minus_pos_[0])
           : shifted_4
               ? shifted_2 & ~(_11_minus_pos_[0]) | _11_minus_pos_[1]
               : shifted_2 ? _GEN_30 : _GEN_31)
      : shifted_3
          ? (shifted_4
               ? (shifted_2 ? _GEN_32 : _GEN_33)
               : shifted_2 ? ~(_11_minus_pos_[1]) : _GEN_34)
          : shifted_4
              ? (shifted_2 | _11_minus_pos_[1]) & ~(_11_minus_pos_[0])
              : shifted_2 & _GEN_35;	// rope_apply.k:441:43, :451:{29,33,62}, :452:{29,33,62}, :453:{29,33,62}, :454:{29,33,62}, :455:{29,38}
  wire         r_mant_3 =
    shifted_6
      ? (shifted_4
           ? (shifted_5
                ? shifted_3 | _GEN_29
                : shifted_3 & ~(_11_minus_pos_[1]) | _11_minus_pos_[0])
           : shifted_5
               ? shifted_3 & ~(_11_minus_pos_[0]) | _11_minus_pos_[1]
               : shifted_3 ? _GEN_30 : _GEN_31)
      : shifted_4
          ? (shifted_5
               ? (shifted_3 ? _GEN_32 : _GEN_33)
               : shifted_3 ? ~(_11_minus_pos_[1]) : _GEN_34)
          : shifted_5
              ? (shifted_3 | _11_minus_pos_[1]) & ~(_11_minus_pos_[0])
              : shifted_3 & _GEN_35;	// rope_apply.k:441:43, :451:{29,33,62}, :452:{29,33,62}, :453:{29,33,62}, :454:{29,33,62}, :455:{29,38}
  wire         r_mant_4 =
    shifted_7
      ? (shifted_5
           ? (shifted_6
                ? shifted_4 | _GEN_29
                : shifted_4 & ~(_11_minus_pos_[1]) | _11_minus_pos_[0])
           : shifted_6
               ? shifted_4 & ~(_11_minus_pos_[0]) | _11_minus_pos_[1]
               : shifted_4 ? _GEN_30 : _GEN_31)
      : shifted_5
          ? (shifted_6
               ? (shifted_4 ? _GEN_32 : _GEN_33)
               : shifted_4 ? ~(_11_minus_pos_[1]) : _GEN_34)
          : shifted_6
              ? (shifted_4 | _11_minus_pos_[1]) & ~(_11_minus_pos_[0])
              : shifted_4 & _GEN_35;	// rope_apply.k:441:43, :451:{29,33,62}, :452:{29,33,62}, :453:{29,33,62}, :454:{29,33,62}, :455:{29,38}
  wire         r_mant_5 =
    p0_sum[1] & _GEN_28
      ? (shifted_6
           ? (shifted_7
                ? shifted_5 | _GEN_29
                : shifted_5 & ~(_11_minus_pos_[1]) | _11_minus_pos_[0])
           : shifted_7
               ? shifted_5 & ~(_11_minus_pos_[0]) | _11_minus_pos_[1]
               : shifted_5 ? _GEN_30 : _GEN_31)
      : shifted_6
          ? (shifted_7
               ? (shifted_5 ? _GEN_32 : _GEN_33)
               : shifted_5 ? ~(_11_minus_pos_[1]) : _GEN_34)
          : shifted_7
              ? (shifted_5 | _11_minus_pos_[1]) & ~(_11_minus_pos_[0])
              : shifted_5 & _GEN_35;	// rope_apply.k:273:9, :441:43, :451:{29,33,62}, :452:{29,33,62}, :453:{29,33,62}, :454:{29,33,62}, :455:{29,38}
  wire         _GEN_36 = _pos_lt_11_ | _pos_gt_11_;	// rope_apply.k:434:{25,29}, :439:{30,34}, :442:29
  wire         _GEN_37 = ~_diff_ge_sr_exp_ & _pos_lt_11_;	// rope_apply.k:434:25, :439:{30,34}, :442:{29,33}
  wire         _GEN_38 = ~_diff_ge_sr_exp_ & _pos_lt_11_ & ~_pos_gt_11_;	// rope_apply.k:434:{25,29}, :439:{30,34}, :442:{29,33}
  wire         norm_exp =
    _sr_exp_plus_pos_minus_11_[8]
      ? _sr_exp_minus_diff_[8] & _GEN_37 | _pos_gt_11_
      : _sr_exp_minus_diff_[8] & _GEN_38;	// rope_apply.k:434:{25,29}, :436:{40,49}, :439:30, :442:29, :448:44
  wire         _GEN_39 = ~_pos_lt_11_ & ~_pos_gt_11_;	// rope_apply.k:434:{25,29}, :439:{30,34}, :442:29
  wire         norm_exp_0 =
    _sr_exp_plus_pos_minus_11_[7]
      ? (~(_sr_exp_minus_diff_[7]) | _diff_ge_sr_exp_
           ? p0_sr_exp_0[7] & ~_pos_lt_11_ | _pos_gt_11_
           : p0_sr_exp_0[7] | _GEN_36)
      : ~(_sr_exp_minus_diff_[7]) | _diff_ge_sr_exp_
          ? p0_sr_exp_0[7] & _GEN_39
          : (p0_sr_exp_0[7] | _pos_lt_11_) & ~_pos_gt_11_;	// rope_apply.k:273:9, :434:{25,29}, :436:{40,49}, :439:{30,34}, :442:{29,33}, :448:44
  wire         norm_exp_1 =
    _sr_exp_plus_pos_minus_11_[6]
      ? (~(_sr_exp_minus_diff_[6]) | _diff_ge_sr_exp_
           ? p0_sr_exp_0[6] & ~_pos_lt_11_ | _pos_gt_11_
           : p0_sr_exp_0[6] | _GEN_36)
      : ~(_sr_exp_minus_diff_[6]) | _diff_ge_sr_exp_
          ? p0_sr_exp_0[6] & _GEN_39
          : (p0_sr_exp_0[6] | _pos_lt_11_) & ~_pos_gt_11_;	// rope_apply.k:273:9, :434:{25,29}, :436:{40,49}, :439:{30,34}, :442:{29,33}, :448:44
  wire         norm_exp_2 =
    _sr_exp_plus_pos_minus_11_[5]
      ? (~(_sr_exp_minus_diff_[5]) | _diff_ge_sr_exp_
           ? p0_sr_exp_0[5] & ~_pos_lt_11_ | _pos_gt_11_
           : p0_sr_exp_0[5] | _GEN_36)
      : ~(_sr_exp_minus_diff_[5]) | _diff_ge_sr_exp_
          ? p0_sr_exp_0[5] & _GEN_39
          : (p0_sr_exp_0[5] | _pos_lt_11_) & ~_pos_gt_11_;	// rope_apply.k:273:9, :434:{25,29}, :436:{40,49}, :439:{30,34}, :442:{29,33}, :448:44
  wire         norm_exp_3 =
    _sr_exp_plus_pos_minus_11_[4]
      ? (~(_sr_exp_minus_diff_[4]) | _diff_ge_sr_exp_
           ? p0_sr_exp_0[4] & ~_pos_lt_11_ | _pos_gt_11_
           : p0_sr_exp_0[4] | _GEN_36)
      : ~(_sr_exp_minus_diff_[4]) | _diff_ge_sr_exp_
          ? p0_sr_exp_0[4] & _GEN_39
          : (p0_sr_exp_0[4] | _pos_lt_11_) & ~_pos_gt_11_;	// rope_apply.k:273:9, :434:{25,29}, :436:{40,49}, :439:{30,34}, :442:{29,33}, :448:44
  wire         norm_exp_4 =
    _sr_exp_plus_pos_minus_11_[3]
      ? (~(_sr_exp_minus_diff_[3]) | _diff_ge_sr_exp_
           ? p0_sr_exp_0[3] & ~_pos_lt_11_ | _pos_gt_11_
           : p0_sr_exp_0[3] | _GEN_36)
      : ~(_sr_exp_minus_diff_[3]) | _diff_ge_sr_exp_
          ? p0_sr_exp_0[3] & _GEN_39
          : (p0_sr_exp_0[3] | _pos_lt_11_) & ~_pos_gt_11_;	// rope_apply.k:273:9, :434:{25,29}, :436:{40,49}, :439:{30,34}, :442:{29,33}, :448:44
  wire         norm_exp_5 =
    _sr_exp_plus_pos_minus_11_[2]
      ? (~(_sr_exp_minus_diff_[2]) | _diff_ge_sr_exp_
           ? p0_sr_exp_0[2] & ~_pos_lt_11_ | _pos_gt_11_
           : p0_sr_exp_0[2] | _GEN_36)
      : ~(_sr_exp_minus_diff_[2]) | _diff_ge_sr_exp_
          ? p0_sr_exp_0[2] & _GEN_39
          : (p0_sr_exp_0[2] | _pos_lt_11_) & ~_pos_gt_11_;	// rope_apply.k:273:9, :434:{25,29}, :436:{40,49}, :439:{30,34}, :442:{29,33}, :448:44
  wire         norm_exp_6 =
    _sr_exp_plus_pos_minus_11_[1]
      ? (~(_sr_exp_minus_diff_[1]) | _diff_ge_sr_exp_
           ? p0_sr_exp_0[1] & ~_pos_lt_11_ | _pos_gt_11_
           : p0_sr_exp_0[1] | _GEN_36)
      : ~(_sr_exp_minus_diff_[1]) | _diff_ge_sr_exp_
          ? p0_sr_exp_0[1] & _GEN_39
          : (p0_sr_exp_0[1] | _pos_lt_11_) & ~_pos_gt_11_;	// rope_apply.k:273:9, :434:{25,29}, :436:{40,49}, :439:{30,34}, :442:{29,33}, :448:44
  wire         norm_exp_7 =
    _sr_exp_plus_pos_minus_11_[0]
      ? (~(_sr_exp_minus_diff_[0]) | _diff_ge_sr_exp_
           ? p0_sr_exp_0[0] & ~_pos_lt_11_ | _pos_gt_11_
           : p0_sr_exp_0[0] | _GEN_36)
      : ~(_sr_exp_minus_diff_[0]) | _diff_ge_sr_exp_
          ? p0_sr_exp_0[0] & _GEN_39
          : (p0_sr_exp_0[0] | _pos_lt_11_) & ~_pos_gt_11_;	// rope_apply.k:273:9, :434:{25,29}, :436:{40,49}, :439:{30,34}, :442:{29,33}, :448:44
  wire  [15:0] norm_exp_8 =
    {_sr_exp_plus_pos_minus_11_[15]
       ? _sr_exp_minus_diff_[15] & _GEN_37 | _pos_gt_11_
       : _sr_exp_minus_diff_[15] & _GEN_38,
     _sr_exp_plus_pos_minus_11_[14]
       ? _sr_exp_minus_diff_[14] & _GEN_37 | _pos_gt_11_
       : _sr_exp_minus_diff_[14] & _GEN_38,
     _sr_exp_plus_pos_minus_11_[13]
       ? _sr_exp_minus_diff_[13] & _GEN_37 | _pos_gt_11_
       : _sr_exp_minus_diff_[13] & _GEN_38,
     _sr_exp_plus_pos_minus_11_[12]
       ? _sr_exp_minus_diff_[12] & _GEN_37 | _pos_gt_11_
       : _sr_exp_minus_diff_[12] & _GEN_38,
     _sr_exp_plus_pos_minus_11_[11]
       ? _sr_exp_minus_diff_[11] & _GEN_37 | _pos_gt_11_
       : _sr_exp_minus_diff_[11] & _GEN_38,
     _sr_exp_plus_pos_minus_11_[10]
       ? _sr_exp_minus_diff_[10] & _GEN_37 | _pos_gt_11_
       : _sr_exp_minus_diff_[10] & _GEN_38,
     _sr_exp_plus_pos_minus_11_[9]
       ? _sr_exp_minus_diff_[9] & _GEN_37 | _pos_gt_11_
       : _sr_exp_minus_diff_[9] & _GEN_38,
     norm_exp,
     norm_exp_0,
     norm_exp_1,
     norm_exp_2,
     norm_exp_3,
     norm_exp_4,
     norm_exp_5,
     norm_exp_6,
     norm_exp_7};	// rope_apply.k:434:{25,29}, :436:{40,49}, :439:30, :442:29, :448:44
  wire         _norm_exp_lt_255_ = norm_exp_8 < 16'hFF;	// rope_apply.k:434:25, :439:30, :442:29, :463:54
  wire         _sr_sign_shl_15_or_norm_exp_shl_7_or_r_mant_ =
    norm_exp
    | (p0_pa_sign_0
         ? p0_pb_sign_0 | p0__aligned_a_ge_aligned_b_ | p0__pa_sign_eq_pb_sign__0
         : p0_pb_sign_0 & ~p0__aligned_a_ge_aligned_b_ & ~p0__pa_sign_eq_pb_sign__0);	// rope_apply.k:273:9, :404:21, :411:25, :434:25, :437:{29,38}, :439:30, :442:29, :460:{29,38}, :465:{38,54,56}
  wire         _sr_sign_shl_15_or_norm_exp_shl_7_or_r_mant__0 =
    _sum_shr_pos_minus_7_[6]
      ? (r_mant ? p0_sum[10] | _GEN_36 : p0_sum[10] & ~_pos_lt_11_ | _pos_gt_11_)
      : r_mant ? (p0_sum[10] | _pos_lt_11_) & ~_pos_gt_11_ : p0_sum[10] & _GEN_39;	// rope_apply.k:273:9, :404:21, :411:25, :434:{25,29}, :437:{29,38}, :439:{30,34}, :442:29, :453:{29,33,62}, :454:{29,33,62}, :455:{29,38}, :460:{29,38}, :465:{38,54,56}
  wire         _sr_sign_shl_15_or_norm_exp_shl_7_or_r_mant__1 =
    _sum_shr_pos_minus_7_[5]
      ? (r_mant_0 ? p0_sum[9] | _GEN_36 : p0_sum[9] & ~_pos_lt_11_ | _pos_gt_11_)
      : r_mant_0 ? (p0_sum[9] | _pos_lt_11_) & ~_pos_gt_11_ : p0_sum[9] & _GEN_39;	// rope_apply.k:273:9, :404:21, :411:25, :434:{25,29}, :437:{29,38}, :439:{30,34}, :442:29, :453:{29,33,62}, :454:{29,33,62}, :455:{29,38}, :460:{29,38}, :465:{38,54,56}
  wire         _sr_sign_shl_15_or_norm_exp_shl_7_or_r_mant__2 =
    _sum_shr_pos_minus_7_[4]
      ? (r_mant_1 ? p0_sum[8] | _GEN_36 : p0_sum[8] & ~_pos_lt_11_ | _pos_gt_11_)
      : r_mant_1 ? (p0_sum[8] | _pos_lt_11_) & ~_pos_gt_11_ : p0_sum[8] & _GEN_39;	// rope_apply.k:273:9, :404:21, :411:25, :434:{25,29}, :437:{29,38}, :439:{30,34}, :442:29, :453:{29,33,62}, :454:{29,33,62}, :455:{29,38}, :460:{29,38}, :465:{38,54,56}
  wire         _sr_sign_shl_15_or_norm_exp_shl_7_or_r_mant__3 =
    _sum_shr_pos_minus_7_[3]
      ? (r_mant_2 ? p0_sum[7] | _GEN_36 : p0_sum[7] & ~_pos_lt_11_ | _pos_gt_11_)
      : r_mant_2 ? (p0_sum[7] | _pos_lt_11_) & ~_pos_gt_11_ : p0_sum[7] & _GEN_39;	// rope_apply.k:273:9, :404:21, :411:25, :434:{25,29}, :437:{29,38}, :439:{30,34}, :442:29, :453:{29,33,62}, :454:{29,33,62}, :455:{29,38}, :460:{29,38}, :465:{38,54,56}
  wire         _sr_sign_shl_15_or_norm_exp_shl_7_or_r_mant__4 =
    _sum_shr_pos_minus_7_[2]
      ? (r_mant_3 ? p0_sum[6] | _GEN_36 : p0_sum[6] & ~_pos_lt_11_ | _pos_gt_11_)
      : r_mant_3 ? (p0_sum[6] | _pos_lt_11_) & ~_pos_gt_11_ : p0_sum[6] & _GEN_39;	// rope_apply.k:273:9, :404:21, :411:25, :434:{25,29}, :437:{29,38}, :439:{30,34}, :442:29, :453:{29,33,62}, :454:{29,33,62}, :455:{29,38}, :460:{29,38}, :465:{38,54,56}
  wire         _sr_sign_shl_15_or_norm_exp_shl_7_or_r_mant__5 =
    _sum_shr_pos_minus_7_[1]
      ? (r_mant_4 ? p0_sum[5] | _GEN_36 : p0_sum[5] & ~_pos_lt_11_ | _pos_gt_11_)
      : r_mant_4 ? (p0_sum[5] | _pos_lt_11_) & ~_pos_gt_11_ : p0_sum[5] & _GEN_39;	// rope_apply.k:273:9, :404:21, :411:25, :434:{25,29}, :437:{29,38}, :439:{30,34}, :442:29, :453:{29,33,62}, :454:{29,33,62}, :455:{29,38}, :460:{29,38}, :465:{38,54,56}
  wire         _sr_sign_shl_15_or_norm_exp_shl_7_or_r_mant__6 =
    _sum_shr_pos_minus_7_[0]
      ? (r_mant_5 ? p0_sum[4] | _GEN_36 : p0_sum[4] & ~_pos_lt_11_ | _pos_gt_11_)
      : r_mant_5 ? (p0_sum[4] | _pos_lt_11_) & ~_pos_gt_11_ : p0_sum[4] & _GEN_39;	// rope_apply.k:273:9, :404:21, :411:25, :434:{25,29}, :437:{29,38}, :439:{30,34}, :442:29, :453:{29,33,62}, :454:{29,33,62}, :455:{29,38}, :460:{29,38}, :465:{38,54,56}
  wire         _GEN_40 = _norm_exp_lt_255_ & (|norm_exp_8) & p0__sum_ne_0_;	// rope_apply.k:273:9, :366:22, :423:21, :434:25, :439:30, :442:29, :463:{25,29,38,54}
  wire         _GEN_41 =
    _norm_exp_lt_255_ & (|norm_exp_8) & p0__sum_ne_0_ & ~p0__pb_exp_eq_0__0;	// rope_apply.k:273:9, :366:22, :423:21, :434:25, :439:30, :442:29, :463:{25,29,38,54}
  always @(posedge clk) begin	// rope_apply.k:273:9
    p0_x_even <= data_in_11[15:0];	// rope_apply.k:273:9
    p0_x_odd <= data_in_11[31:16];	// rope_apply.k:273:9
    p0_cos_val <= data_in_11[47:32];	// rope_apply.k:273:9
    p0_sin_val <= data_in_11[63:48];	// rope_apply.k:273:9
    if (rst)	// rope_apply.k:273:9
      p0_stage1_enable <= 1'h0;	// rope_apply.k:273:9
    else	// rope_apply.k:273:9
      p0_stage1_enable <= _GEN & input_valid_0;	// rope_apply.k:273:9
    p0__prod_plus_ma32_shl_4_ <=
      13'({1'h0,
           prod_55,
           prod_56,
           prod_57,
           prod_58,
           prod_59,
           prod_60,
           prod_61,
           prod_62,
           prod_63,
           prod_64,
           prod_65,
           prod_66} + {2'h1, p0_x_even[6:0], 4'h0});	// rope_apply.k:273:9, :291:{21,25}, :292:{51,58}
    p0_mb <= p0_sin_val[5:0];	// rope_apply.k:273:9
    p0_prod <=
      {prod_55,
       prod_56,
       prod_57,
       prod_58,
       prod_59,
       prod_60,
       prod_61,
       prod_62,
       prod_63,
       prod_64,
       prod_65,
       prod_66};	// rope_apply.k:273:9, :291:{21,25}
    p0__prod_plus_ma32_shl_4__0 <=
      13'({1'h0,
           prod_67,
           prod_68,
           prod_69,
           prod_70,
           prod_71,
           prod_72,
           prod_73,
           prod_74,
           prod_75,
           prod_76,
           prod_77,
           prod_78} + {2'h1, p0_x_odd[6:0], 4'h0});	// rope_apply.k:273:9, :330:{21,25}, :331:{51,58}
    p0_mb_0 <= p0_cos_val[5:0];	// rope_apply.k:273:9
    p0_prod_0 <=
      {prod_67,
       prod_68,
       prod_69,
       prod_70,
       prod_71,
       prod_72,
       prod_73,
       prod_74,
       prod_75,
       prod_76,
       prod_77,
       prod_78};	// rope_apply.k:273:9, :330:{21,25}
    p0__ma32_shl_5_ <= {2'h1, p0_x_even[6:0], 5'h0};	// rope_apply.k:273:9, :293:58
    p0__ma32_shl_5__0 <= {2'h1, p0_x_odd[6:0], 5'h0};	// rope_apply.k:273:9, :332:58
    p0__ma32_shl_6_ <= {2'h1, p0_x_even[6:0], 6'h0};	// rope_apply.k:273:9, :294:58
    p0__ma32_shl_6__0 <= {2'h1, p0_x_odd[6:0], 6'h0};	// rope_apply.k:273:9, :333:58
    p0_mb_1 <= p0_sin_val[6];	// rope_apply.k:273:9, :285:{21,33}
    p0_mb_2 <= p0_cos_val[6];	// rope_apply.k:273:9, :324:{21,33}
    p0__ma32_shl_7_ <= {2'h1, p0_x_even[6:0], 7'h0};	// rope_apply.k:273:9, :295:58
    p0__ma32_shl_7__0 <= {2'h1, p0_x_odd[6:0], 7'h0};	// rope_apply.k:273:9, :334:58
    p0__a_exp_plus_b_exp_minus_127_plus_1_ <= 16'(_a_exp_plus_b_exp_ - 16'h7E);	// rope_apply.k:273:9, :301:{33,39,47}, :306:39
    p0__a_exp_plus_b_exp_minus_127_ <= 16'(_a_exp_plus_b_exp_ - 16'h7F);	// rope_apply.k:273:9, :301:39, :306:{33,39}
    p0__a_exp_plus_b_exp_minus_127_plus_1__0 <= 16'(_a_exp_plus_b_exp__0 - 16'h7E);	// rope_apply.k:273:9, :340:{33,39,47}, :345:39
    p0__a_exp_plus_b_exp_minus_127__0 <= 16'(_a_exp_plus_b_exp__0 - 16'h7F);	// rope_apply.k:273:9, :340:39, :345:{33,39}
    p0_sin_val_0 <= p0_sin_val;	// rope_apply.k:273:9
    p0_x_even_0 <= p0_x_even;	// rope_apply.k:273:9
    p0_cos_val_0 <= p0_cos_val;	// rope_apply.k:273:9
    p0_x_odd_0 <= p0_x_odd;	// rope_apply.k:273:9
    p0__b_exp_ne_0_ <= |(p0_sin_val[14:7]);	// rope_apply.k:273:9, :280:{17,32}, :281:41
    p0__a_exp_ne_0_ <= |(p0_x_even[14:7]);	// rope_apply.k:273:9, :279:{17,32}, :281:27
    p0__b_exp_ne_0__0 <= |(p0_cos_val[14:7]);	// rope_apply.k:273:9, :319:{17,32}, :320:41
    p0__a_exp_ne_0__0 <= |(p0_x_odd[14:7]);	// rope_apply.k:273:9, :318:{17,32}, :320:27
    if (rst)	// rope_apply.k:273:9
      p0_stage2_enable <= 1'h0;	// rope_apply.k:273:9
    else	// rope_apply.k:273:9
      p0_stage2_enable <= p0_stage1_enable;	// rope_apply.k:273:9
    p0_prod_1 <= _prod_plus_ma32_shl_7_[15];	// rope_apply.k:273:9, :295:{21,51}
    p0__a_exp_plus_b_exp_minus_127_plus_1__1 <= p0__a_exp_plus_b_exp_minus_127_plus_1_;	// rope_apply.k:273:9
    p0__a_exp_plus_b_exp_minus_127__1 <= p0__a_exp_plus_b_exp_minus_127_;	// rope_apply.k:273:9
    p0_prod_2 <= _prod_plus_ma32_shl_7__0[15];	// rope_apply.k:273:9, :334:{21,51}
    p0__a_exp_plus_b_exp_minus_127_plus_1__2 <= p0__a_exp_plus_b_exp_minus_127_plus_1__0;	// rope_apply.k:273:9
    p0__a_exp_plus_b_exp_minus_127__2 <= p0__a_exp_plus_b_exp_minus_127__0;	// rope_apply.k:273:9
    p0_sin_val_1 <= p0_sin_val_0;	// rope_apply.k:273:9
    p0_x_even_1 <= p0_x_even_0;	// rope_apply.k:273:9
    p0_prod_3 <= _prod_plus_ma32_shl_7_[14:0];	// rope_apply.k:273:9, :295:51
    p0_cos_val_1 <= p0_cos_val_0;	// rope_apply.k:273:9
    p0_x_odd_1 <= p0_x_odd_0;	// rope_apply.k:273:9
    p0_prod_4 <= _prod_plus_ma32_shl_7__0[14:0];	// rope_apply.k:273:9, :334:51
    p0__b_exp_ne_0__1 <= p0__b_exp_ne_0_;	// rope_apply.k:273:9
    p0__a_exp_ne_0__1 <= p0__a_exp_ne_0_;	// rope_apply.k:273:9
    p0__b_exp_ne_0__2 <= p0__b_exp_ne_0__0;	// rope_apply.k:273:9
    p0__a_exp_ne_0__2 <= p0__a_exp_ne_0__0;	// rope_apply.k:273:9
    if (rst)	// rope_apply.k:273:9
      p0_stage3_enable <= 1'h0;	// rope_apply.k:273:9
    else	// rope_apply.k:273:9
      p0_stage3_enable <= p0_stage2_enable;	// rope_apply.k:273:9
    p0_aligned_b <=
      {~(shift[3]) & ~(shift[2]),
       p2_8 & _GEN_6,
       p2_9 & _GEN_6,
       p2_10 & _GEN_6,
       p2_11 ? ~(shift[3]) : _GEN_7,
       p2_8 ? (p2_12 ? ~(shift[3]) : _GEN_7) : p2_12 & _GEN_6,
       p2_9 ? (p2_13 ? ~(shift[3]) : _GEN_7) : p2_13 & _GEN_6,
       p2_10 ? (p2_14 ? ~(shift[3]) : _GEN_7) : p2_14 & _GEN_6,
       p2_11 ? _GEN_8 : _GEN_9,
       p2_12 ? (p2_8 ? _GEN_8 : _GEN_7) : p2_8 & _GEN_9,
       p2_13 ? (p2_9 ? _GEN_8 : _GEN_7) : p2_9 & _GEN_9,
       p2_14 ? (p2_10 ? _GEN_8 : _GEN_7) : p2_10 & _GEN_9};	// rope_apply.k:273:9, :320:{17,21}, :382:25, :384:{25,29,49,61}, :385:{25,29,49,61}
    p0_shift <= shift[1:0];	// rope_apply.k:273:9, :382:25
    p0_aligned_a <=
      {~(shift_0[3]) & ~(shift_0[2]),
       p1_8 & _GEN_10,
       p1_9 & _GEN_10,
       p1_10 & _GEN_10,
       p1_11 ? ~(shift_0[3]) : _GEN_11,
       p1_8 ? (p1_12 ? ~(shift_0[3]) : _GEN_11) : p1_12 & _GEN_10,
       p1_9 ? (p1_13 ? ~(shift_0[3]) : _GEN_11) : p1_13 & _GEN_10,
       p1_10 ? (p1_14 ? ~(shift_0[3]) : _GEN_11) : p1_14 & _GEN_10,
       p1_11 ? _GEN_12 : _GEN_13,
       p1_12 ? (p1_8 ? _GEN_12 : _GEN_11) : p1_8 & _GEN_13,
       p1_13 ? (p1_9 ? _GEN_12 : _GEN_11) : p1_9 & _GEN_13,
       p1_14 ? (p1_10 ? _GEN_12 : _GEN_11) : p1_10 & _GEN_13};	// rope_apply.k:273:9, :281:{17,21}, :394:25, :396:{25,29,49,61}, :397:{25,29,49,61}
    p0_shift_0 <= shift_0[1:0];	// rope_apply.k:273:9, :394:25
    p0__pa_exp_ge_pb_exp_ <= _pa_exp_ge_pb_exp_;	// rope_apply.k:273:9, :377:25
    p0__pa_mant_shl_4_ <= {p1_8, p1_9, p1_10, p1_11, p1_12, p1_13, p1_14, 4'h0};	// rope_apply.k:273:9, :281:{17,21}, :372:{21,38}, :380:37, :395:37
    p0__pb_mant_shl_4_ <= {p2_8, p2_9, p2_10, p2_11, p2_12, p2_13, p2_14, 4'h0};	// rope_apply.k:273:9, :320:{17,21}, :373:{21,38}, :383:37, :392:37
    p0__pa_sign_eq_pb_sign_ <= p1 == p2;	// rope_apply.k:273:9, :281:{17,21}, :320:{17,21}, :404:25
    p0_sr_exp <=
      {8'h0,
       p1_0 ? p2_0 | _pa_exp_ge_pb_exp_ : p2_0 & ~_pa_exp_ge_pb_exp_,
       p1_1 ? p2_1 | _pa_exp_ge_pb_exp_ : p2_1 & ~_pa_exp_ge_pb_exp_,
       p1_2 ? p2_2 | _pa_exp_ge_pb_exp_ : p2_2 & ~_pa_exp_ge_pb_exp_,
       p1_3 ? p2_3 | _pa_exp_ge_pb_exp_ : p2_3 & ~_pa_exp_ge_pb_exp_,
       p1_4 ? p2_4 | _pa_exp_ge_pb_exp_ : p2_4 & ~_pa_exp_ge_pb_exp_,
       p1_5 ? p2_5 | _pa_exp_ge_pb_exp_ : p2_5 & ~_pa_exp_ge_pb_exp_,
       p1_6 ? p2_6 | _pa_exp_ge_pb_exp_ : p2_6 & ~_pa_exp_ge_pb_exp_,
       p1_7 ? p2_7 | _pa_exp_ge_pb_exp_ : p2_7 & ~_pa_exp_ge_pb_exp_};	// rope_apply.k:273:9, :281:{17,21}, :283:{21,37,38,55}, :298:21, :300:{34,47}, :305:{34,47}, :308:{21,25}, :310:{30,45,47}, :320:{17,21}, :322:{21,37,38,54}, :337:21, :339:{34,47}, :344:{34,47}, :347:{21,25}, :349:{30,45,47}, :377:{21,25}
    p0_pa_sign <= p1;	// rope_apply.k:273:9, :281:{17,21}
    p0_pb_sign <= p2;	// rope_apply.k:273:9, :320:{17,21}
    p0_p1 <=
      {p1,
       p1_0,
       p1_1,
       p1_2,
       p1_3,
       p1_4,
       p1_5,
       p1_6,
       p1_7,
       p1_8,
       p1_9,
       p1_10,
       p1_11,
       p1_12,
       p1_13,
       p1_14};	// rope_apply.k:273:9, :281:{17,21}, :283:{21,37,38,55}, :298:21, :300:{34,47}, :305:{34,47}, :308:{21,25}, :310:{30,45,47}
    p0__pb_exp_eq_0_ <= {p2_0, p2_1, p2_2, p2_3, p2_4, p2_5, p2_6, p2_7} == 8'h0;	// rope_apply.k:273:9, :320:{17,21}, :322:{21,37,38,54}, :337:21, :339:{34,47}, :344:{34,47}, :347:{21,25}, :349:{30,45,47}, :358:{17,33}, :366:26
    p0__pa_exp_eq_0_ <= {p1_0, p1_1, p1_2, p1_3, p1_4, p1_5, p1_6, p1_7} == 8'h0;	// rope_apply.k:273:9, :281:{17,21}, :283:{21,37,38,55}, :298:21, :300:{34,47}, :305:{34,47}, :308:{21,25}, :310:{30,45,47}, :357:{17,33}, :362:21
    p0_p2 <=
      {p2,
       p2_0,
       p2_1,
       p2_2,
       p2_3,
       p2_4,
       p2_5,
       p2_6,
       p2_7,
       p2_8,
       p2_9,
       p2_10,
       p2_11,
       p2_12,
       p2_13,
       p2_14};	// rope_apply.k:273:9, :320:{17,21}, :322:{21,37,38,54}, :337:21, :339:{34,47}, :344:{34,47}, :347:{21,25}, :349:{30,45,47}
    if (rst)	// rope_apply.k:273:9
      p0_stage4_enable <= 1'h0;	// rope_apply.k:273:9
    else	// rope_apply.k:273:9
      p0_stage4_enable <= p0_stage3_enable;	// rope_apply.k:273:9
    p0__tmp_and_240_ <= {tmp, tmp_0, tmp_1, tmp_2, tmp_3, tmp_4, tmp_5, tmp_6} & 8'hF0;	// rope_apply.k:273:9, :427:{25,52,58}, :428:29
    p0_tmp <=
      {sum & ~(|_GEN_24),
       sum_0 & ~(|_GEN_24),
       sum_1 & ~(|_GEN_24),
       sum_2 & ~(|_GEN_24),
       sum_3 & ~(|_GEN_24),
       sum_4 & ~(|_GEN_24),
       sum_5 & ~(|_GEN_24),
       sum_6 & ~(|_GEN_24),
       tmp,
       tmp_0,
       tmp_1,
       tmp_2,
       tmp_3,
       tmp_4,
       tmp_5,
       tmp_6};	// rope_apply.k:273:9, :404:21, :411:25, :427:{25,29,52,58}
    p0__tmp_and_65280_ne_0_ <= |_GEN_24;	// rope_apply.k:273:9, :427:29
    p0_sr_exp_0 <= p0_sr_exp;	// rope_apply.k:273:9
    p0_sum <= sum_15;	// rope_apply.k:273:9, :404:21, :411:25
    p0_pa_sign_0 <= p0_pa_sign;	// rope_apply.k:273:9
    p0_pb_sign_0 <= p0_pb_sign;	// rope_apply.k:273:9
    p0__aligned_a_ge_aligned_b_ <= _aligned_a_ge_aligned_b_;	// rope_apply.k:273:9, :411:29
    p0__pa_sign_eq_pb_sign__0 <= p0__pa_sign_eq_pb_sign_;	// rope_apply.k:273:9
    p0_p1_0 <= p0_p1;	// rope_apply.k:273:9
    p0__sum_ne_0_ <= |sum_15;	// rope_apply.k:273:9, :404:21, :411:25, :423:25
    p0__pb_exp_eq_0__0 <= p0__pb_exp_eq_0_;	// rope_apply.k:273:9
    p0__pa_exp_eq_0__0 <= p0__pa_exp_eq_0_;	// rope_apply.k:273:9
    p0_p2_0 <= p0_p2;	// rope_apply.k:273:9
    if (rst)	// rope_apply.k:273:9
      p0_stage5_enable <= 1'h0;	// rope_apply.k:273:9
    else	// rope_apply.k:273:9
      p0_stage5_enable <= p0_stage4_enable;	// rope_apply.k:273:9
    p0__pa_exp_eq_0__1 <= p0__pa_exp_eq_0__0;	// rope_apply.k:273:9
    p0_p2_1 <= p0_p2_0;	// rope_apply.k:273:9
    p0_result <=
      {p0_p1_0[15]
         ? _sr_sign_shl_15_or_norm_exp_shl_7_or_r_mant_ & _GEN_40 | p0__pb_exp_eq_0__0
         : _sr_sign_shl_15_or_norm_exp_shl_7_or_r_mant_ & _GEN_41,
       p0_p1_0[14] ? norm_exp_0 & _GEN_40 | p0__pb_exp_eq_0__0 : norm_exp_0 & _GEN_41,
       p0_p1_0[13] ? norm_exp_1 & _GEN_40 | p0__pb_exp_eq_0__0 : norm_exp_1 & _GEN_41,
       p0_p1_0[12] ? norm_exp_2 & _GEN_40 | p0__pb_exp_eq_0__0 : norm_exp_2 & _GEN_41,
       p0_p1_0[11] ? norm_exp_3 & _GEN_40 | p0__pb_exp_eq_0__0 : norm_exp_3 & _GEN_41,
       p0_p1_0[10] ? norm_exp_4 & _GEN_40 | p0__pb_exp_eq_0__0 : norm_exp_4 & _GEN_41,
       p0_p1_0[9] ? norm_exp_5 & _GEN_40 | p0__pb_exp_eq_0__0 : norm_exp_5 & _GEN_41,
       p0_p1_0[8] ? norm_exp_6 & _GEN_40 | p0__pb_exp_eq_0__0 : norm_exp_6 & _GEN_41,
       p0_p1_0[7] ? norm_exp_7 & _GEN_40 | p0__pb_exp_eq_0__0 : norm_exp_7 & _GEN_41,
       p0_p1_0[6]
         ? _sr_sign_shl_15_or_norm_exp_shl_7_or_r_mant__0 & _GEN_40 | p0__pb_exp_eq_0__0
         : _sr_sign_shl_15_or_norm_exp_shl_7_or_r_mant__0 & _GEN_41,
       p0_p1_0[5]
         ? _sr_sign_shl_15_or_norm_exp_shl_7_or_r_mant__1 & _GEN_40 | p0__pb_exp_eq_0__0
         : _sr_sign_shl_15_or_norm_exp_shl_7_or_r_mant__1 & _GEN_41,
       p0_p1_0[4]
         ? _sr_sign_shl_15_or_norm_exp_shl_7_or_r_mant__2 & _GEN_40 | p0__pb_exp_eq_0__0
         : _sr_sign_shl_15_or_norm_exp_shl_7_or_r_mant__2 & _GEN_41,
       p0_p1_0[3]
         ? _sr_sign_shl_15_or_norm_exp_shl_7_or_r_mant__3 & _GEN_40 | p0__pb_exp_eq_0__0
         : _sr_sign_shl_15_or_norm_exp_shl_7_or_r_mant__3 & _GEN_41,
       p0_p1_0[2]
         ? _sr_sign_shl_15_or_norm_exp_shl_7_or_r_mant__4 & _GEN_40 | p0__pb_exp_eq_0__0
         : _sr_sign_shl_15_or_norm_exp_shl_7_or_r_mant__4 & _GEN_41,
       p0_p1_0[1]
         ? _sr_sign_shl_15_or_norm_exp_shl_7_or_r_mant__5 & _GEN_40 | p0__pb_exp_eq_0__0
         : _sr_sign_shl_15_or_norm_exp_shl_7_or_r_mant__5 & _GEN_41,
       p0_p1_0[0]
         ? _sr_sign_shl_15_or_norm_exp_shl_7_or_r_mant__6 & _GEN_40 | p0__pb_exp_eq_0__0
         : _sr_sign_shl_15_or_norm_exp_shl_7_or_r_mant__6 & _GEN_41};	// rope_apply.k:273:9, :366:22, :404:21, :411:25, :423:21, :434:25, :437:{29,38}, :439:30, :442:29, :460:{29,38}, :463:{25,29}, :465:{38,54,56}
    if (rst)	// rope_apply.k:273:9
      p0_stage6_enable <= 1'h0;	// rope_apply.k:273:9
    else	// rope_apply.k:273:9
      p0_stage6_enable <= p0_stage5_enable;	// rope_apply.k:273:9
    p0_result_0 <= p0__pa_exp_eq_0__1 ? p0_p2_1 : p0_result;	// rope_apply.k:273:9, :362:17
    if (rst)	// rope_apply.k:273:9
      p0_stage7_enable <= 1'h0;	// rope_apply.k:273:9
    else	// rope_apply.k:273:9
      p0_stage7_enable <= p0_stage6_enable;	// rope_apply.k:273:9
    p0_result_1 <= p0_result_0;	// rope_apply.k:273:9
    if (rst)	// rope_apply.k:273:9
      p0_stage8_enable <= 1'h0;	// rope_apply.k:273:9
    else	// rope_apply.k:273:9
      p0_stage8_enable <= p0_stage7_enable;	// rope_apply.k:273:9
    p0_result_2 <= p0_result_1;	// rope_apply.k:273:9
    if (rst)	// rope_apply.k:273:9
      p0_stage9_enable <= 1'h0;	// rope_apply.k:273:9
    else	// rope_apply.k:273:9
      p0_stage9_enable <= p0_stage8_enable;	// rope_apply.k:273:9
  end // always @(posedge)
  always_comb begin	// rope_apply.k:273:9
    fifo_wren_0_0 = p0_stage9_enable;	// rope_apply.k:271:5, :273:9
    fifo_data_out_0_0 = p0_result_2;	// rope_apply.k:271:5, :273:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// rope_apply.k:273:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// rope_apply.k:273:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  rope_applyDebugView_rotate_oddEntry rope_applyDebugView_rotate_oddEntry_instance (	// rope_apply.k:271:5
    .clk       (clk),	// rope_apply.k:271:5
    ._x_even   (p0_stage1_enable ? p0_x_even : 'x),	// rope_apply.k:271:5, :273:9
    ._x_odd    (p0_stage1_enable ? p0_x_odd : 'x),	// rope_apply.k:271:5, :273:9
    ._cos_val  (p0_stage1_enable ? p0_cos_val : 'x),	// rope_apply.k:271:5, :273:9
    ._sin_val  (p0_stage1_enable ? p0_sin_val : 'x),	// rope_apply.k:271:5, :273:9
    .valid     (p0_stage1_enable),	// rope_apply.k:273:9
    .valid_out (/* unused */)
  );	// rope_apply.k:271:5
  rope_applyDebugView_rotate_oddExit rope_applyDebugView_rotate_oddExit_instance (	// rope_apply.k:271:5
    .clk          (clk),	// rope_apply.k:271:5
    ._ReturnValue (p0_stage8_enable ? p0_result_1 : 'x),	// rope_apply.k:271:5, :273:9
    .valid        (p0_stage8_enable),	// rope_apply.k:273:9
    .valid_out    (/* unused */)
  );	// rope_apply.k:271:5
  assign done_out = p0_stage9_enable;	// rope_apply.k:273:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// rope_apply.k:273:9
  assign fifo_wren_0 = fifo_wren_0_0;	// rope_apply.k:273:9
  assign input_rdy_0 = input_rdy_0_0;	// rope_apply.k:273:9
  assign control_state_out = control_state_out_0;	// rope_apply.k:273:9
endmodule

module rope_apply_rotate_even_BasicBlock_0(	// rope_apply.k:67:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  output wire [15:0] fifo_data_out_0,
  output wire        fifo_wren_0,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [63:0] data_in_10,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  logic        done_out_0;	// rope_apply.k:67:9
  logic [15:0] fifo_data_out_0_0;	// rope_apply.k:67:9
  logic        fifo_wren_0_0;	// rope_apply.k:67:9
  logic        input_rdy_0_0;	// rope_apply.k:67:9
  logic [7:0]  control_state_out_0;	// rope_apply.k:67:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// rope_apply.k:67:9
  always_comb begin	// rope_apply.k:67:9
    input_rdy_0_0 = _GEN;	// rope_apply.k:67:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// rope_apply.k:67:9
  end // always_comb
  reg   [15:0] p0_x_even;	// rope_apply.k:67:9
  reg   [15:0] p0_x_odd;	// rope_apply.k:67:9
  reg   [15:0] p0_cos_val;	// rope_apply.k:67:9
  reg   [15:0] p0_sin_val;	// rope_apply.k:67:9
  reg          p0_stage1_enable = 1'h0;	// rope_apply.k:67:9
  reg   [12:0] p0__prod_plus_ma32_shl_4_;	// rope_apply.k:67:9
  reg   [5:0]  p0_mb;	// rope_apply.k:67:9
  reg   [11:0] p0_prod;	// rope_apply.k:67:9
  reg   [12:0] p0__prod_plus_ma32_shl_4__0;	// rope_apply.k:67:9
  reg   [5:0]  p0_mb_0;	// rope_apply.k:67:9
  reg   [11:0] p0_prod_0;	// rope_apply.k:67:9
  reg   [13:0] p0__ma32_shl_5_;	// rope_apply.k:67:9
  reg   [13:0] p0__ma32_shl_5__0;	// rope_apply.k:67:9
  reg   [14:0] p0__ma32_shl_6_;	// rope_apply.k:67:9
  reg   [14:0] p0__ma32_shl_6__0;	// rope_apply.k:67:9
  reg          p0_mb_1;	// rope_apply.k:67:9
  reg          p0_mb_2;	// rope_apply.k:67:9
  reg   [15:0] p0__ma32_shl_7_;	// rope_apply.k:67:9
  reg   [15:0] p0__ma32_shl_7__0;	// rope_apply.k:67:9
  reg   [15:0] p0__a_exp_plus_b_exp_minus_127_plus_1_;	// rope_apply.k:67:9
  reg   [15:0] p0__a_exp_plus_b_exp_minus_127_;	// rope_apply.k:67:9
  reg   [15:0] p0__a_exp_plus_b_exp_minus_127_plus_1__0;	// rope_apply.k:67:9
  reg   [15:0] p0__a_exp_plus_b_exp_minus_127__0;	// rope_apply.k:67:9
  reg   [15:0] p0_cos_val_0;	// rope_apply.k:67:9
  reg   [15:0] p0_x_even_0;	// rope_apply.k:67:9
  reg   [15:0] p0_sin_val_0;	// rope_apply.k:67:9
  reg   [15:0] p0_x_odd_0;	// rope_apply.k:67:9
  reg          p0__b_exp_ne_0_;	// rope_apply.k:67:9
  reg          p0__a_exp_ne_0_;	// rope_apply.k:67:9
  reg          p0__b_exp_ne_0__0;	// rope_apply.k:67:9
  reg          p0__a_exp_ne_0__0;	// rope_apply.k:67:9
  reg          p0_stage2_enable = 1'h0;	// rope_apply.k:67:9
  reg          p0_prod_1;	// rope_apply.k:67:9
  reg   [15:0] p0__a_exp_plus_b_exp_minus_127_plus_1__1;	// rope_apply.k:67:9
  reg   [15:0] p0__a_exp_plus_b_exp_minus_127__1;	// rope_apply.k:67:9
  reg          p0_prod_2;	// rope_apply.k:67:9
  reg   [15:0] p0__a_exp_plus_b_exp_minus_127_plus_1__2;	// rope_apply.k:67:9
  reg   [15:0] p0__a_exp_plus_b_exp_minus_127__2;	// rope_apply.k:67:9
  reg   [15:0] p0_cos_val_1;	// rope_apply.k:67:9
  reg   [15:0] p0_x_even_1;	// rope_apply.k:67:9
  reg   [14:0] p0_prod_3;	// rope_apply.k:67:9
  reg   [15:0] p0_sin_val_1;	// rope_apply.k:67:9
  reg   [15:0] p0_x_odd_1;	// rope_apply.k:67:9
  reg   [14:0] p0_prod_4;	// rope_apply.k:67:9
  reg          p0__b_exp_ne_0__1;	// rope_apply.k:67:9
  reg          p0__a_exp_ne_0__1;	// rope_apply.k:67:9
  reg          p0__b_exp_ne_0__2;	// rope_apply.k:67:9
  reg          p0__a_exp_ne_0__2;	// rope_apply.k:67:9
  reg          p0_stage3_enable = 1'h0;	// rope_apply.k:67:9
  reg   [11:0] p0_aligned_b;	// rope_apply.k:67:9
  reg   [1:0]  p0_shift;	// rope_apply.k:67:9
  reg   [11:0] p0_aligned_a;	// rope_apply.k:67:9
  reg   [1:0]  p0_shift_0;	// rope_apply.k:67:9
  reg          p0__pa_exp_ge_pb_exp_;	// rope_apply.k:67:9
  reg   [10:0] p0__pa_mant_shl_4_;	// rope_apply.k:67:9
  reg   [10:0] p0__pb_mant_shl_4_;	// rope_apply.k:67:9
  reg          p0__pa_sign_eq_pb_sign_;	// rope_apply.k:67:9
  reg   [15:0] p0_sr_exp;	// rope_apply.k:67:9
  reg          p0_pa_sign;	// rope_apply.k:67:9
  reg          p0_pb_sign;	// rope_apply.k:67:9
  reg   [15:0] p0_p1;	// rope_apply.k:67:9
  reg          p0__pb_exp_eq_0_;	// rope_apply.k:67:9
  reg          p0__pa_exp_eq_0_;	// rope_apply.k:67:9
  reg   [15:0] p0_p2;	// rope_apply.k:67:9
  reg          p0_stage4_enable = 1'h0;	// rope_apply.k:67:9
  reg   [7:0]  p0__tmp_and_240_;	// rope_apply.k:67:9
  reg   [15:0] p0_tmp;	// rope_apply.k:67:9
  reg          p0__tmp_and_65280_ne_0_;	// rope_apply.k:67:9
  reg   [15:0] p0_sr_exp_0;	// rope_apply.k:67:9
  reg   [15:0] p0_sum;	// rope_apply.k:67:9
  reg          p0_pa_sign_0;	// rope_apply.k:67:9
  reg          p0_pb_sign_0;	// rope_apply.k:67:9
  reg          p0__aligned_a_ge_aligned_b_;	// rope_apply.k:67:9
  reg          p0__pa_sign_eq_pb_sign__0;	// rope_apply.k:67:9
  reg   [15:0] p0_p1_0;	// rope_apply.k:67:9
  reg          p0__sum_ne_0_;	// rope_apply.k:67:9
  reg          p0__pb_exp_eq_0__0;	// rope_apply.k:67:9
  reg          p0__pa_exp_eq_0__0;	// rope_apply.k:67:9
  reg   [15:0] p0_p2_0;	// rope_apply.k:67:9
  reg          p0_stage5_enable = 1'h0;	// rope_apply.k:67:9
  reg          p0__pa_exp_eq_0__1;	// rope_apply.k:67:9
  reg   [15:0] p0_p2_1;	// rope_apply.k:67:9
  reg   [15:0] p0_result;	// rope_apply.k:67:9
  reg          p0_stage6_enable = 1'h0;	// rope_apply.k:67:9
  reg   [15:0] p0_result_0;	// rope_apply.k:67:9
  reg          p0_stage7_enable = 1'h0;	// rope_apply.k:67:9
  reg   [15:0] p0_result_1;	// rope_apply.k:67:9
  reg          p0_stage8_enable = 1'h0;	// rope_apply.k:67:9
  reg   [15:0] p0_result_2;	// rope_apply.k:67:9
  reg          p0_stage9_enable = 1'h0;	// rope_apply.k:67:9
  wire         prod = p0_x_even[6] & p0_cos_val[0];	// rope_apply.k:67:9, :78:{21,33}, :79:{21,33}, :81:35, :82:{21,25}
  wire         prod_0 = p0_x_even[5] & p0_cos_val[0];	// rope_apply.k:67:9, :78:{21,33}, :79:{21,33}, :81:35, :82:{21,25}
  wire         prod_1 = p0_x_even[4] & p0_cos_val[0];	// rope_apply.k:67:9, :78:{21,33}, :79:{21,33}, :81:35, :82:{21,25}
  wire         prod_2 = p0_x_even[3] & p0_cos_val[0];	// rope_apply.k:67:9, :78:{21,33}, :79:{21,33}, :81:35, :82:{21,25}
  wire         prod_3 = p0_x_even[2] & p0_cos_val[0];	// rope_apply.k:67:9, :78:{21,33}, :79:{21,33}, :81:35, :82:{21,25}
  wire         prod_4 = p0_x_even[1] & p0_cos_val[0];	// rope_apply.k:67:9, :78:{21,33}, :79:{21,33}, :81:35, :82:{21,25}
  wire         prod_5 = p0_x_even[0] & p0_cos_val[0];	// rope_apply.k:67:9, :78:{21,33}, :79:{21,33}, :81:35, :82:{21,25}
  wire  [15:0] _a_exp_plus_b_exp_ =
    16'({8'h0, p0_x_even[14:7]} + {8'h0, p0_cos_val[14:7]});	// rope_apply.k:67:9, :95:39, :100:39
  wire         prod_6 = p0_x_odd[6] & p0_sin_val[0];	// rope_apply.k:67:9, :117:{21,33}, :118:{21,33}, :120:35, :121:{21,25}
  wire         prod_7 = p0_x_odd[5] & p0_sin_val[0];	// rope_apply.k:67:9, :117:{21,33}, :118:{21,33}, :120:35, :121:{21,25}
  wire         prod_8 = p0_x_odd[4] & p0_sin_val[0];	// rope_apply.k:67:9, :117:{21,33}, :118:{21,33}, :120:35, :121:{21,25}
  wire         prod_9 = p0_x_odd[3] & p0_sin_val[0];	// rope_apply.k:67:9, :117:{21,33}, :118:{21,33}, :120:35, :121:{21,25}
  wire         prod_10 = p0_x_odd[2] & p0_sin_val[0];	// rope_apply.k:67:9, :117:{21,33}, :118:{21,33}, :120:35, :121:{21,25}
  wire         prod_11 = p0_x_odd[1] & p0_sin_val[0];	// rope_apply.k:67:9, :117:{21,33}, :118:{21,33}, :120:35, :121:{21,25}
  wire         prod_12 = p0_x_odd[0] & p0_sin_val[0];	// rope_apply.k:67:9, :117:{21,33}, :118:{21,33}, :120:35, :121:{21,25}
  wire  [15:0] _a_exp_plus_b_exp__0 =
    16'({8'h0, p0_x_odd[14:7]} + {8'h0, p0_sin_val[14:7]});	// rope_apply.k:67:9, :134:39, :139:39
  wire  [9:0]  _prod_plus_ma32_shl_1_ =
    10'({2'h0, p0_cos_val[0], prod, prod_0, prod_1, prod_2, prod_3, prod_4, prod_5}
        + {2'h1, p0_x_even[6:0], 1'h0});	// rope_apply.k:67:9, :79:{21,33}, :82:{21,25}, :83:{51,58}
  wire  [9:0]  _prod_plus_ma32_shl_1__0 =
    10'({2'h0, p0_sin_val[0], prod_6, prod_7, prod_8, prod_9, prod_10, prod_11, prod_12}
        + {2'h1, p0_x_odd[6:0], 1'h0});	// rope_apply.k:67:9, :118:{21,33}, :121:{21,25}, :122:{51,58}
  wire         prod_13 = _prod_plus_ma32_shl_1_[9] & p0_cos_val[1];	// rope_apply.k:67:9, :79:{21,33}, :83:{21,25,51}
  wire         prod_14 = _prod_plus_ma32_shl_1_[8] & p0_cos_val[1];	// rope_apply.k:67:9, :79:{21,33}, :83:{21,25,51}
  wire         prod_15 =
    _prod_plus_ma32_shl_1_[7]
      ? p0_cos_val[0] | p0_cos_val[1]
      : p0_cos_val[0] & ~(p0_cos_val[1]);	// rope_apply.k:67:9, :79:{21,33}, :83:{21,25,51}
  wire         prod_16 =
    _prod_plus_ma32_shl_1_[6] ? prod | p0_cos_val[1] : prod & ~(p0_cos_val[1]);	// rope_apply.k:67:9, :79:{21,33}, :82:{21,25}, :83:{21,25,51}
  wire         prod_17 =
    _prod_plus_ma32_shl_1_[5] ? prod_0 | p0_cos_val[1] : prod_0 & ~(p0_cos_val[1]);	// rope_apply.k:67:9, :79:{21,33}, :82:{21,25}, :83:{21,25,51}
  wire         prod_18 =
    _prod_plus_ma32_shl_1_[4] ? prod_1 | p0_cos_val[1] : prod_1 & ~(p0_cos_val[1]);	// rope_apply.k:67:9, :79:{21,33}, :82:{21,25}, :83:{21,25,51}
  wire         prod_19 =
    _prod_plus_ma32_shl_1_[3] ? prod_2 | p0_cos_val[1] : prod_2 & ~(p0_cos_val[1]);	// rope_apply.k:67:9, :79:{21,33}, :82:{21,25}, :83:{21,25,51}
  wire         prod_20 =
    _prod_plus_ma32_shl_1_[2] ? prod_3 | p0_cos_val[1] : prod_3 & ~(p0_cos_val[1]);	// rope_apply.k:67:9, :79:{21,33}, :82:{21,25}, :83:{21,25,51}
  wire         prod_21 =
    _prod_plus_ma32_shl_1_[1] ? prod_4 | p0_cos_val[1] : prod_4 & ~(p0_cos_val[1]);	// rope_apply.k:67:9, :79:{21,33}, :82:{21,25}, :83:{21,25,51}
  wire         prod_22 =
    _prod_plus_ma32_shl_1_[0] ? prod_5 | p0_cos_val[1] : prod_5 & ~(p0_cos_val[1]);	// rope_apply.k:67:9, :79:{21,33}, :82:{21,25}, :83:{21,25,51}
  wire         prod_23 = _prod_plus_ma32_shl_1__0[9] & p0_sin_val[1];	// rope_apply.k:67:9, :118:{21,33}, :122:{21,25,51}
  wire         prod_24 = _prod_plus_ma32_shl_1__0[8] & p0_sin_val[1];	// rope_apply.k:67:9, :118:{21,33}, :122:{21,25,51}
  wire         prod_25 =
    _prod_plus_ma32_shl_1__0[7]
      ? p0_sin_val[0] | p0_sin_val[1]
      : p0_sin_val[0] & ~(p0_sin_val[1]);	// rope_apply.k:67:9, :118:{21,33}, :122:{21,25,51}
  wire         prod_26 =
    _prod_plus_ma32_shl_1__0[6] ? prod_6 | p0_sin_val[1] : prod_6 & ~(p0_sin_val[1]);	// rope_apply.k:67:9, :118:{21,33}, :121:{21,25}, :122:{21,25,51}
  wire         prod_27 =
    _prod_plus_ma32_shl_1__0[5] ? prod_7 | p0_sin_val[1] : prod_7 & ~(p0_sin_val[1]);	// rope_apply.k:67:9, :118:{21,33}, :121:{21,25}, :122:{21,25,51}
  wire         prod_28 =
    _prod_plus_ma32_shl_1__0[4] ? prod_8 | p0_sin_val[1] : prod_8 & ~(p0_sin_val[1]);	// rope_apply.k:67:9, :118:{21,33}, :121:{21,25}, :122:{21,25,51}
  wire         prod_29 =
    _prod_plus_ma32_shl_1__0[3] ? prod_9 | p0_sin_val[1] : prod_9 & ~(p0_sin_val[1]);	// rope_apply.k:67:9, :118:{21,33}, :121:{21,25}, :122:{21,25,51}
  wire         prod_30 =
    _prod_plus_ma32_shl_1__0[2] ? prod_10 | p0_sin_val[1] : prod_10 & ~(p0_sin_val[1]);	// rope_apply.k:67:9, :118:{21,33}, :121:{21,25}, :122:{21,25,51}
  wire         prod_31 =
    _prod_plus_ma32_shl_1__0[1] ? prod_11 | p0_sin_val[1] : prod_11 & ~(p0_sin_val[1]);	// rope_apply.k:67:9, :118:{21,33}, :121:{21,25}, :122:{21,25,51}
  wire         prod_32 =
    _prod_plus_ma32_shl_1__0[0] ? prod_12 | p0_sin_val[1] : prod_12 & ~(p0_sin_val[1]);	// rope_apply.k:67:9, :118:{21,33}, :121:{21,25}, :122:{21,25,51}
  wire  [10:0] _prod_plus_ma32_shl_2_ =
    11'({1'h0,
         prod_13,
         prod_14,
         prod_15,
         prod_16,
         prod_17,
         prod_18,
         prod_19,
         prod_20,
         prod_21,
         prod_22} + {2'h1, p0_x_even[6:0], 2'h0});	// rope_apply.k:67:9, :83:{21,25}, :84:{51,58}
  wire  [10:0] _prod_plus_ma32_shl_2__0 =
    11'({1'h0,
         prod_23,
         prod_24,
         prod_25,
         prod_26,
         prod_27,
         prod_28,
         prod_29,
         prod_30,
         prod_31,
         prod_32} + {2'h1, p0_x_odd[6:0], 2'h0});	// rope_apply.k:67:9, :122:{21,25}, :123:{51,58}
  wire         prod_33 = _prod_plus_ma32_shl_2_[10] & p0_cos_val[2];	// rope_apply.k:67:9, :79:{21,33}, :84:{21,25,51}
  wire         prod_34 =
    _prod_plus_ma32_shl_2_[9] ? prod_13 | p0_cos_val[2] : prod_13 & ~(p0_cos_val[2]);	// rope_apply.k:67:9, :79:{21,33}, :83:{21,25}, :84:{21,25,51}
  wire         prod_35 =
    _prod_plus_ma32_shl_2_[8] ? prod_14 | p0_cos_val[2] : prod_14 & ~(p0_cos_val[2]);	// rope_apply.k:67:9, :79:{21,33}, :83:{21,25}, :84:{21,25,51}
  wire         prod_36 =
    _prod_plus_ma32_shl_2_[7] ? prod_15 | p0_cos_val[2] : prod_15 & ~(p0_cos_val[2]);	// rope_apply.k:67:9, :79:{21,33}, :83:{21,25}, :84:{21,25,51}
  wire         prod_37 =
    _prod_plus_ma32_shl_2_[6] ? prod_16 | p0_cos_val[2] : prod_16 & ~(p0_cos_val[2]);	// rope_apply.k:67:9, :79:{21,33}, :83:{21,25}, :84:{21,25,51}
  wire         prod_38 =
    _prod_plus_ma32_shl_2_[5] ? prod_17 | p0_cos_val[2] : prod_17 & ~(p0_cos_val[2]);	// rope_apply.k:67:9, :79:{21,33}, :83:{21,25}, :84:{21,25,51}
  wire         prod_39 =
    _prod_plus_ma32_shl_2_[4] ? prod_18 | p0_cos_val[2] : prod_18 & ~(p0_cos_val[2]);	// rope_apply.k:67:9, :79:{21,33}, :83:{21,25}, :84:{21,25,51}
  wire         prod_40 =
    _prod_plus_ma32_shl_2_[3] ? prod_19 | p0_cos_val[2] : prod_19 & ~(p0_cos_val[2]);	// rope_apply.k:67:9, :79:{21,33}, :83:{21,25}, :84:{21,25,51}
  wire         prod_41 =
    _prod_plus_ma32_shl_2_[2] ? prod_20 | p0_cos_val[2] : prod_20 & ~(p0_cos_val[2]);	// rope_apply.k:67:9, :79:{21,33}, :83:{21,25}, :84:{21,25,51}
  wire         prod_42 =
    _prod_plus_ma32_shl_2_[1] ? prod_21 | p0_cos_val[2] : prod_21 & ~(p0_cos_val[2]);	// rope_apply.k:67:9, :79:{21,33}, :83:{21,25}, :84:{21,25,51}
  wire         prod_43 =
    _prod_plus_ma32_shl_2_[0] ? prod_22 | p0_cos_val[2] : prod_22 & ~(p0_cos_val[2]);	// rope_apply.k:67:9, :79:{21,33}, :83:{21,25}, :84:{21,25,51}
  wire         prod_44 = _prod_plus_ma32_shl_2__0[10] & p0_sin_val[2];	// rope_apply.k:67:9, :118:{21,33}, :123:{21,25,51}
  wire         prod_45 =
    _prod_plus_ma32_shl_2__0[9] ? prod_23 | p0_sin_val[2] : prod_23 & ~(p0_sin_val[2]);	// rope_apply.k:67:9, :118:{21,33}, :122:{21,25}, :123:{21,25,51}
  wire         prod_46 =
    _prod_plus_ma32_shl_2__0[8] ? prod_24 | p0_sin_val[2] : prod_24 & ~(p0_sin_val[2]);	// rope_apply.k:67:9, :118:{21,33}, :122:{21,25}, :123:{21,25,51}
  wire         prod_47 =
    _prod_plus_ma32_shl_2__0[7] ? prod_25 | p0_sin_val[2] : prod_25 & ~(p0_sin_val[2]);	// rope_apply.k:67:9, :118:{21,33}, :122:{21,25}, :123:{21,25,51}
  wire         prod_48 =
    _prod_plus_ma32_shl_2__0[6] ? prod_26 | p0_sin_val[2] : prod_26 & ~(p0_sin_val[2]);	// rope_apply.k:67:9, :118:{21,33}, :122:{21,25}, :123:{21,25,51}
  wire         prod_49 =
    _prod_plus_ma32_shl_2__0[5] ? prod_27 | p0_sin_val[2] : prod_27 & ~(p0_sin_val[2]);	// rope_apply.k:67:9, :118:{21,33}, :122:{21,25}, :123:{21,25,51}
  wire         prod_50 =
    _prod_plus_ma32_shl_2__0[4] ? prod_28 | p0_sin_val[2] : prod_28 & ~(p0_sin_val[2]);	// rope_apply.k:67:9, :118:{21,33}, :122:{21,25}, :123:{21,25,51}
  wire         prod_51 =
    _prod_plus_ma32_shl_2__0[3] ? prod_29 | p0_sin_val[2] : prod_29 & ~(p0_sin_val[2]);	// rope_apply.k:67:9, :118:{21,33}, :122:{21,25}, :123:{21,25,51}
  wire         prod_52 =
    _prod_plus_ma32_shl_2__0[2] ? prod_30 | p0_sin_val[2] : prod_30 & ~(p0_sin_val[2]);	// rope_apply.k:67:9, :118:{21,33}, :122:{21,25}, :123:{21,25,51}
  wire         prod_53 =
    _prod_plus_ma32_shl_2__0[1] ? prod_31 | p0_sin_val[2] : prod_31 & ~(p0_sin_val[2]);	// rope_apply.k:67:9, :118:{21,33}, :122:{21,25}, :123:{21,25,51}
  wire         prod_54 =
    _prod_plus_ma32_shl_2__0[0] ? prod_32 | p0_sin_val[2] : prod_32 & ~(p0_sin_val[2]);	// rope_apply.k:67:9, :118:{21,33}, :122:{21,25}, :123:{21,25,51}
  wire  [11:0] _prod_plus_ma32_shl_3_ =
    12'({1'h0,
         prod_33,
         prod_34,
         prod_35,
         prod_36,
         prod_37,
         prod_38,
         prod_39,
         prod_40,
         prod_41,
         prod_42,
         prod_43} + {2'h1, p0_x_even[6:0], 3'h0});	// rope_apply.k:67:9, :84:{21,25}, :85:{51,58}
  wire  [11:0] _prod_plus_ma32_shl_3__0 =
    12'({1'h0,
         prod_44,
         prod_45,
         prod_46,
         prod_47,
         prod_48,
         prod_49,
         prod_50,
         prod_51,
         prod_52,
         prod_53,
         prod_54} + {2'h1, p0_x_odd[6:0], 3'h0});	// rope_apply.k:67:9, :123:{21,25}, :124:{51,58}
  wire         prod_55 = _prod_plus_ma32_shl_3_[11] & p0_cos_val[3];	// rope_apply.k:67:9, :79:{21,33}, :85:{21,25,51}
  wire         prod_56 =
    _prod_plus_ma32_shl_3_[10] ? prod_33 | p0_cos_val[3] : prod_33 & ~(p0_cos_val[3]);	// rope_apply.k:67:9, :79:{21,33}, :84:{21,25}, :85:{21,25,51}
  wire         prod_57 =
    _prod_plus_ma32_shl_3_[9] ? prod_34 | p0_cos_val[3] : prod_34 & ~(p0_cos_val[3]);	// rope_apply.k:67:9, :79:{21,33}, :84:{21,25}, :85:{21,25,51}
  wire         prod_58 =
    _prod_plus_ma32_shl_3_[8] ? prod_35 | p0_cos_val[3] : prod_35 & ~(p0_cos_val[3]);	// rope_apply.k:67:9, :79:{21,33}, :84:{21,25}, :85:{21,25,51}
  wire         prod_59 =
    _prod_plus_ma32_shl_3_[7] ? prod_36 | p0_cos_val[3] : prod_36 & ~(p0_cos_val[3]);	// rope_apply.k:67:9, :79:{21,33}, :84:{21,25}, :85:{21,25,51}
  wire         prod_60 =
    _prod_plus_ma32_shl_3_[6] ? prod_37 | p0_cos_val[3] : prod_37 & ~(p0_cos_val[3]);	// rope_apply.k:67:9, :79:{21,33}, :84:{21,25}, :85:{21,25,51}
  wire         prod_61 =
    _prod_plus_ma32_shl_3_[5] ? prod_38 | p0_cos_val[3] : prod_38 & ~(p0_cos_val[3]);	// rope_apply.k:67:9, :79:{21,33}, :84:{21,25}, :85:{21,25,51}
  wire         prod_62 =
    _prod_plus_ma32_shl_3_[4] ? prod_39 | p0_cos_val[3] : prod_39 & ~(p0_cos_val[3]);	// rope_apply.k:67:9, :79:{21,33}, :84:{21,25}, :85:{21,25,51}
  wire         prod_63 =
    _prod_plus_ma32_shl_3_[3] ? prod_40 | p0_cos_val[3] : prod_40 & ~(p0_cos_val[3]);	// rope_apply.k:67:9, :79:{21,33}, :84:{21,25}, :85:{21,25,51}
  wire         prod_64 =
    _prod_plus_ma32_shl_3_[2] ? prod_41 | p0_cos_val[3] : prod_41 & ~(p0_cos_val[3]);	// rope_apply.k:67:9, :79:{21,33}, :84:{21,25}, :85:{21,25,51}
  wire         prod_65 =
    _prod_plus_ma32_shl_3_[1] ? prod_42 | p0_cos_val[3] : prod_42 & ~(p0_cos_val[3]);	// rope_apply.k:67:9, :79:{21,33}, :84:{21,25}, :85:{21,25,51}
  wire         prod_66 =
    _prod_plus_ma32_shl_3_[0] ? prod_43 | p0_cos_val[3] : prod_43 & ~(p0_cos_val[3]);	// rope_apply.k:67:9, :79:{21,33}, :84:{21,25}, :85:{21,25,51}
  wire         prod_67 = _prod_plus_ma32_shl_3__0[11] & p0_sin_val[3];	// rope_apply.k:67:9, :118:{21,33}, :124:{21,25,51}
  wire         prod_68 =
    _prod_plus_ma32_shl_3__0[10] ? prod_44 | p0_sin_val[3] : prod_44 & ~(p0_sin_val[3]);	// rope_apply.k:67:9, :118:{21,33}, :123:{21,25}, :124:{21,25,51}
  wire         prod_69 =
    _prod_plus_ma32_shl_3__0[9] ? prod_45 | p0_sin_val[3] : prod_45 & ~(p0_sin_val[3]);	// rope_apply.k:67:9, :118:{21,33}, :123:{21,25}, :124:{21,25,51}
  wire         prod_70 =
    _prod_plus_ma32_shl_3__0[8] ? prod_46 | p0_sin_val[3] : prod_46 & ~(p0_sin_val[3]);	// rope_apply.k:67:9, :118:{21,33}, :123:{21,25}, :124:{21,25,51}
  wire         prod_71 =
    _prod_plus_ma32_shl_3__0[7] ? prod_47 | p0_sin_val[3] : prod_47 & ~(p0_sin_val[3]);	// rope_apply.k:67:9, :118:{21,33}, :123:{21,25}, :124:{21,25,51}
  wire         prod_72 =
    _prod_plus_ma32_shl_3__0[6] ? prod_48 | p0_sin_val[3] : prod_48 & ~(p0_sin_val[3]);	// rope_apply.k:67:9, :118:{21,33}, :123:{21,25}, :124:{21,25,51}
  wire         prod_73 =
    _prod_plus_ma32_shl_3__0[5] ? prod_49 | p0_sin_val[3] : prod_49 & ~(p0_sin_val[3]);	// rope_apply.k:67:9, :118:{21,33}, :123:{21,25}, :124:{21,25,51}
  wire         prod_74 =
    _prod_plus_ma32_shl_3__0[4] ? prod_50 | p0_sin_val[3] : prod_50 & ~(p0_sin_val[3]);	// rope_apply.k:67:9, :118:{21,33}, :123:{21,25}, :124:{21,25,51}
  wire         prod_75 =
    _prod_plus_ma32_shl_3__0[3] ? prod_51 | p0_sin_val[3] : prod_51 & ~(p0_sin_val[3]);	// rope_apply.k:67:9, :118:{21,33}, :123:{21,25}, :124:{21,25,51}
  wire         prod_76 =
    _prod_plus_ma32_shl_3__0[2] ? prod_52 | p0_sin_val[3] : prod_52 & ~(p0_sin_val[3]);	// rope_apply.k:67:9, :118:{21,33}, :123:{21,25}, :124:{21,25,51}
  wire         prod_77 =
    _prod_plus_ma32_shl_3__0[1] ? prod_53 | p0_sin_val[3] : prod_53 & ~(p0_sin_val[3]);	// rope_apply.k:67:9, :118:{21,33}, :123:{21,25}, :124:{21,25,51}
  wire         prod_78 =
    _prod_plus_ma32_shl_3__0[0] ? prod_54 | p0_sin_val[3] : prod_54 & ~(p0_sin_val[3]);	// rope_apply.k:67:9, :118:{21,33}, :123:{21,25}, :124:{21,25,51}
  wire         prod_79 = p0__prod_plus_ma32_shl_4_[12] & p0_mb[4];	// rope_apply.k:67:9, :86:{21,25}
  wire         prod_80 =
    p0__prod_plus_ma32_shl_4_[11] ? p0_prod[11] | p0_mb[4] : p0_prod[11] & ~(p0_mb[4]);	// rope_apply.k:67:9, :86:{21,25}
  wire         prod_81 =
    p0__prod_plus_ma32_shl_4_[10] ? p0_prod[10] | p0_mb[4] : p0_prod[10] & ~(p0_mb[4]);	// rope_apply.k:67:9, :86:{21,25}
  wire         prod_82 =
    p0__prod_plus_ma32_shl_4_[9] ? p0_prod[9] | p0_mb[4] : p0_prod[9] & ~(p0_mb[4]);	// rope_apply.k:67:9, :86:{21,25}
  wire         prod_83 =
    p0__prod_plus_ma32_shl_4_[8] ? p0_prod[8] | p0_mb[4] : p0_prod[8] & ~(p0_mb[4]);	// rope_apply.k:67:9, :86:{21,25}
  wire         prod_84 =
    p0__prod_plus_ma32_shl_4_[7] ? p0_prod[7] | p0_mb[4] : p0_prod[7] & ~(p0_mb[4]);	// rope_apply.k:67:9, :86:{21,25}
  wire         prod_85 =
    p0__prod_plus_ma32_shl_4_[6] ? p0_prod[6] | p0_mb[4] : p0_prod[6] & ~(p0_mb[4]);	// rope_apply.k:67:9, :86:{21,25}
  wire         prod_86 =
    p0__prod_plus_ma32_shl_4_[5] ? p0_prod[5] | p0_mb[4] : p0_prod[5] & ~(p0_mb[4]);	// rope_apply.k:67:9, :86:{21,25}
  wire         prod_87 =
    p0__prod_plus_ma32_shl_4_[4] ? p0_prod[4] | p0_mb[4] : p0_prod[4] & ~(p0_mb[4]);	// rope_apply.k:67:9, :86:{21,25}
  wire         prod_88 =
    p0__prod_plus_ma32_shl_4_[3] ? p0_prod[3] | p0_mb[4] : p0_prod[3] & ~(p0_mb[4]);	// rope_apply.k:67:9, :86:{21,25}
  wire         prod_89 =
    p0__prod_plus_ma32_shl_4_[2] ? p0_prod[2] | p0_mb[4] : p0_prod[2] & ~(p0_mb[4]);	// rope_apply.k:67:9, :86:{21,25}
  wire         prod_90 =
    p0__prod_plus_ma32_shl_4_[1] ? p0_prod[1] | p0_mb[4] : p0_prod[1] & ~(p0_mb[4]);	// rope_apply.k:67:9, :86:{21,25}
  wire         prod_91 =
    p0__prod_plus_ma32_shl_4_[0] ? p0_prod[0] | p0_mb[4] : p0_prod[0] & ~(p0_mb[4]);	// rope_apply.k:67:9, :86:{21,25}
  wire         prod_92 = p0__prod_plus_ma32_shl_4__0[12] & p0_mb_0[4];	// rope_apply.k:67:9, :125:{21,25}
  wire         prod_93 =
    p0__prod_plus_ma32_shl_4__0[11]
      ? p0_prod_0[11] | p0_mb_0[4]
      : p0_prod_0[11] & ~(p0_mb_0[4]);	// rope_apply.k:67:9, :125:{21,25}
  wire         prod_94 =
    p0__prod_plus_ma32_shl_4__0[10]
      ? p0_prod_0[10] | p0_mb_0[4]
      : p0_prod_0[10] & ~(p0_mb_0[4]);	// rope_apply.k:67:9, :125:{21,25}
  wire         prod_95 =
    p0__prod_plus_ma32_shl_4__0[9]
      ? p0_prod_0[9] | p0_mb_0[4]
      : p0_prod_0[9] & ~(p0_mb_0[4]);	// rope_apply.k:67:9, :125:{21,25}
  wire         prod_96 =
    p0__prod_plus_ma32_shl_4__0[8]
      ? p0_prod_0[8] | p0_mb_0[4]
      : p0_prod_0[8] & ~(p0_mb_0[4]);	// rope_apply.k:67:9, :125:{21,25}
  wire         prod_97 =
    p0__prod_plus_ma32_shl_4__0[7]
      ? p0_prod_0[7] | p0_mb_0[4]
      : p0_prod_0[7] & ~(p0_mb_0[4]);	// rope_apply.k:67:9, :125:{21,25}
  wire         prod_98 =
    p0__prod_plus_ma32_shl_4__0[6]
      ? p0_prod_0[6] | p0_mb_0[4]
      : p0_prod_0[6] & ~(p0_mb_0[4]);	// rope_apply.k:67:9, :125:{21,25}
  wire         prod_99 =
    p0__prod_plus_ma32_shl_4__0[5]
      ? p0_prod_0[5] | p0_mb_0[4]
      : p0_prod_0[5] & ~(p0_mb_0[4]);	// rope_apply.k:67:9, :125:{21,25}
  wire         prod_100 =
    p0__prod_plus_ma32_shl_4__0[4]
      ? p0_prod_0[4] | p0_mb_0[4]
      : p0_prod_0[4] & ~(p0_mb_0[4]);	// rope_apply.k:67:9, :125:{21,25}
  wire         prod_101 =
    p0__prod_plus_ma32_shl_4__0[3]
      ? p0_prod_0[3] | p0_mb_0[4]
      : p0_prod_0[3] & ~(p0_mb_0[4]);	// rope_apply.k:67:9, :125:{21,25}
  wire         prod_102 =
    p0__prod_plus_ma32_shl_4__0[2]
      ? p0_prod_0[2] | p0_mb_0[4]
      : p0_prod_0[2] & ~(p0_mb_0[4]);	// rope_apply.k:67:9, :125:{21,25}
  wire         prod_103 =
    p0__prod_plus_ma32_shl_4__0[1]
      ? p0_prod_0[1] | p0_mb_0[4]
      : p0_prod_0[1] & ~(p0_mb_0[4]);	// rope_apply.k:67:9, :125:{21,25}
  wire         prod_104 =
    p0__prod_plus_ma32_shl_4__0[0]
      ? p0_prod_0[0] | p0_mb_0[4]
      : p0_prod_0[0] & ~(p0_mb_0[4]);	// rope_apply.k:67:9, :125:{21,25}
  wire  [13:0] _prod_plus_ma32_shl_5_ =
    14'({1'h0,
         prod_79,
         prod_80,
         prod_81,
         prod_82,
         prod_83,
         prod_84,
         prod_85,
         prod_86,
         prod_87,
         prod_88,
         prod_89,
         prod_90,
         prod_91} + p0__ma32_shl_5_);	// rope_apply.k:67:9, :86:{21,25}, :87:51
  wire  [13:0] _prod_plus_ma32_shl_5__0 =
    14'({1'h0,
         prod_92,
         prod_93,
         prod_94,
         prod_95,
         prod_96,
         prod_97,
         prod_98,
         prod_99,
         prod_100,
         prod_101,
         prod_102,
         prod_103,
         prod_104} + p0__ma32_shl_5__0);	// rope_apply.k:67:9, :125:{21,25}, :126:51
  wire         prod_105 = _prod_plus_ma32_shl_5_[13] & p0_mb[5];	// rope_apply.k:67:9, :87:{21,25,51}
  wire         prod_106 =
    _prod_plus_ma32_shl_5_[12] ? prod_79 | p0_mb[5] : prod_79 & ~(p0_mb[5]);	// rope_apply.k:67:9, :86:{21,25}, :87:{21,25,51}
  wire         prod_107 =
    _prod_plus_ma32_shl_5_[11] ? prod_80 | p0_mb[5] : prod_80 & ~(p0_mb[5]);	// rope_apply.k:67:9, :86:{21,25}, :87:{21,25,51}
  wire         prod_108 =
    _prod_plus_ma32_shl_5_[10] ? prod_81 | p0_mb[5] : prod_81 & ~(p0_mb[5]);	// rope_apply.k:67:9, :86:{21,25}, :87:{21,25,51}
  wire         prod_109 =
    _prod_plus_ma32_shl_5_[9] ? prod_82 | p0_mb[5] : prod_82 & ~(p0_mb[5]);	// rope_apply.k:67:9, :86:{21,25}, :87:{21,25,51}
  wire         prod_110 =
    _prod_plus_ma32_shl_5_[8] ? prod_83 | p0_mb[5] : prod_83 & ~(p0_mb[5]);	// rope_apply.k:67:9, :86:{21,25}, :87:{21,25,51}
  wire         prod_111 =
    _prod_plus_ma32_shl_5_[7] ? prod_84 | p0_mb[5] : prod_84 & ~(p0_mb[5]);	// rope_apply.k:67:9, :86:{21,25}, :87:{21,25,51}
  wire         prod_112 =
    _prod_plus_ma32_shl_5_[6] ? prod_85 | p0_mb[5] : prod_85 & ~(p0_mb[5]);	// rope_apply.k:67:9, :86:{21,25}, :87:{21,25,51}
  wire         prod_113 =
    _prod_plus_ma32_shl_5_[5] ? prod_86 | p0_mb[5] : prod_86 & ~(p0_mb[5]);	// rope_apply.k:67:9, :86:{21,25}, :87:{21,25,51}
  wire         prod_114 =
    _prod_plus_ma32_shl_5_[4] ? prod_87 | p0_mb[5] : prod_87 & ~(p0_mb[5]);	// rope_apply.k:67:9, :86:{21,25}, :87:{21,25,51}
  wire         prod_115 =
    _prod_plus_ma32_shl_5_[3] ? prod_88 | p0_mb[5] : prod_88 & ~(p0_mb[5]);	// rope_apply.k:67:9, :86:{21,25}, :87:{21,25,51}
  wire         prod_116 =
    _prod_plus_ma32_shl_5_[2] ? prod_89 | p0_mb[5] : prod_89 & ~(p0_mb[5]);	// rope_apply.k:67:9, :86:{21,25}, :87:{21,25,51}
  wire         prod_117 =
    _prod_plus_ma32_shl_5_[1] ? prod_90 | p0_mb[5] : prod_90 & ~(p0_mb[5]);	// rope_apply.k:67:9, :86:{21,25}, :87:{21,25,51}
  wire         prod_118 =
    _prod_plus_ma32_shl_5_[0] ? prod_91 | p0_mb[5] : prod_91 & ~(p0_mb[5]);	// rope_apply.k:67:9, :86:{21,25}, :87:{21,25,51}
  wire         prod_119 = _prod_plus_ma32_shl_5__0[13] & p0_mb_0[5];	// rope_apply.k:67:9, :126:{21,25,51}
  wire         prod_120 =
    _prod_plus_ma32_shl_5__0[12] ? prod_92 | p0_mb_0[5] : prod_92 & ~(p0_mb_0[5]);	// rope_apply.k:67:9, :125:{21,25}, :126:{21,25,51}
  wire         prod_121 =
    _prod_plus_ma32_shl_5__0[11] ? prod_93 | p0_mb_0[5] : prod_93 & ~(p0_mb_0[5]);	// rope_apply.k:67:9, :125:{21,25}, :126:{21,25,51}
  wire         prod_122 =
    _prod_plus_ma32_shl_5__0[10] ? prod_94 | p0_mb_0[5] : prod_94 & ~(p0_mb_0[5]);	// rope_apply.k:67:9, :125:{21,25}, :126:{21,25,51}
  wire         prod_123 =
    _prod_plus_ma32_shl_5__0[9] ? prod_95 | p0_mb_0[5] : prod_95 & ~(p0_mb_0[5]);	// rope_apply.k:67:9, :125:{21,25}, :126:{21,25,51}
  wire         prod_124 =
    _prod_plus_ma32_shl_5__0[8] ? prod_96 | p0_mb_0[5] : prod_96 & ~(p0_mb_0[5]);	// rope_apply.k:67:9, :125:{21,25}, :126:{21,25,51}
  wire         prod_125 =
    _prod_plus_ma32_shl_5__0[7] ? prod_97 | p0_mb_0[5] : prod_97 & ~(p0_mb_0[5]);	// rope_apply.k:67:9, :125:{21,25}, :126:{21,25,51}
  wire         prod_126 =
    _prod_plus_ma32_shl_5__0[6] ? prod_98 | p0_mb_0[5] : prod_98 & ~(p0_mb_0[5]);	// rope_apply.k:67:9, :125:{21,25}, :126:{21,25,51}
  wire         prod_127 =
    _prod_plus_ma32_shl_5__0[5] ? prod_99 | p0_mb_0[5] : prod_99 & ~(p0_mb_0[5]);	// rope_apply.k:67:9, :125:{21,25}, :126:{21,25,51}
  wire         prod_128 =
    _prod_plus_ma32_shl_5__0[4] ? prod_100 | p0_mb_0[5] : prod_100 & ~(p0_mb_0[5]);	// rope_apply.k:67:9, :125:{21,25}, :126:{21,25,51}
  wire         prod_129 =
    _prod_plus_ma32_shl_5__0[3] ? prod_101 | p0_mb_0[5] : prod_101 & ~(p0_mb_0[5]);	// rope_apply.k:67:9, :125:{21,25}, :126:{21,25,51}
  wire         prod_130 =
    _prod_plus_ma32_shl_5__0[2] ? prod_102 | p0_mb_0[5] : prod_102 & ~(p0_mb_0[5]);	// rope_apply.k:67:9, :125:{21,25}, :126:{21,25,51}
  wire         prod_131 =
    _prod_plus_ma32_shl_5__0[1] ? prod_103 | p0_mb_0[5] : prod_103 & ~(p0_mb_0[5]);	// rope_apply.k:67:9, :125:{21,25}, :126:{21,25,51}
  wire         prod_132 =
    _prod_plus_ma32_shl_5__0[0] ? prod_104 | p0_mb_0[5] : prod_104 & ~(p0_mb_0[5]);	// rope_apply.k:67:9, :125:{21,25}, :126:{21,25,51}
  wire  [14:0] _prod_plus_ma32_shl_6_ =
    15'({1'h0,
         prod_105,
         prod_106,
         prod_107,
         prod_108,
         prod_109,
         prod_110,
         prod_111,
         prod_112,
         prod_113,
         prod_114,
         prod_115,
         prod_116,
         prod_117,
         prod_118} + p0__ma32_shl_6_);	// rope_apply.k:67:9, :87:{21,25}, :88:51
  wire  [14:0] _prod_plus_ma32_shl_6__0 =
    15'({1'h0,
         prod_119,
         prod_120,
         prod_121,
         prod_122,
         prod_123,
         prod_124,
         prod_125,
         prod_126,
         prod_127,
         prod_128,
         prod_129,
         prod_130,
         prod_131,
         prod_132} + p0__ma32_shl_6__0);	// rope_apply.k:67:9, :126:{21,25}, :127:51
  wire  [15:0] _prod_plus_ma32_shl_7_ =
    16'({1'h0,
         _prod_plus_ma32_shl_6_[14] & p0_mb_1,
         _prod_plus_ma32_shl_6_[13] ? prod_105 | p0_mb_1 : prod_105 & ~p0_mb_1,
         _prod_plus_ma32_shl_6_[12] ? prod_106 | p0_mb_1 : prod_106 & ~p0_mb_1,
         _prod_plus_ma32_shl_6_[11] ? prod_107 | p0_mb_1 : prod_107 & ~p0_mb_1,
         _prod_plus_ma32_shl_6_[10] ? prod_108 | p0_mb_1 : prod_108 & ~p0_mb_1,
         _prod_plus_ma32_shl_6_[9] ? prod_109 | p0_mb_1 : prod_109 & ~p0_mb_1,
         _prod_plus_ma32_shl_6_[8] ? prod_110 | p0_mb_1 : prod_110 & ~p0_mb_1,
         _prod_plus_ma32_shl_6_[7] ? prod_111 | p0_mb_1 : prod_111 & ~p0_mb_1,
         _prod_plus_ma32_shl_6_[6] ? prod_112 | p0_mb_1 : prod_112 & ~p0_mb_1,
         _prod_plus_ma32_shl_6_[5] ? prod_113 | p0_mb_1 : prod_113 & ~p0_mb_1,
         _prod_plus_ma32_shl_6_[4] ? prod_114 | p0_mb_1 : prod_114 & ~p0_mb_1,
         _prod_plus_ma32_shl_6_[3] ? prod_115 | p0_mb_1 : prod_115 & ~p0_mb_1,
         _prod_plus_ma32_shl_6_[2] ? prod_116 | p0_mb_1 : prod_116 & ~p0_mb_1,
         _prod_plus_ma32_shl_6_[1] ? prod_117 | p0_mb_1 : prod_117 & ~p0_mb_1,
         _prod_plus_ma32_shl_6_[0] ? prod_118 | p0_mb_1 : prod_118 & ~p0_mb_1}
        + p0__ma32_shl_7_);	// rope_apply.k:67:9, :87:{21,25}, :88:{21,51}, :89:51
  wire  [15:0] _prod_plus_ma32_shl_7__0 =
    16'({1'h0,
         _prod_plus_ma32_shl_6__0[14] & p0_mb_2,
         _prod_plus_ma32_shl_6__0[13] ? prod_119 | p0_mb_2 : prod_119 & ~p0_mb_2,
         _prod_plus_ma32_shl_6__0[12] ? prod_120 | p0_mb_2 : prod_120 & ~p0_mb_2,
         _prod_plus_ma32_shl_6__0[11] ? prod_121 | p0_mb_2 : prod_121 & ~p0_mb_2,
         _prod_plus_ma32_shl_6__0[10] ? prod_122 | p0_mb_2 : prod_122 & ~p0_mb_2,
         _prod_plus_ma32_shl_6__0[9] ? prod_123 | p0_mb_2 : prod_123 & ~p0_mb_2,
         _prod_plus_ma32_shl_6__0[8] ? prod_124 | p0_mb_2 : prod_124 & ~p0_mb_2,
         _prod_plus_ma32_shl_6__0[7] ? prod_125 | p0_mb_2 : prod_125 & ~p0_mb_2,
         _prod_plus_ma32_shl_6__0[6] ? prod_126 | p0_mb_2 : prod_126 & ~p0_mb_2,
         _prod_plus_ma32_shl_6__0[5] ? prod_127 | p0_mb_2 : prod_127 & ~p0_mb_2,
         _prod_plus_ma32_shl_6__0[4] ? prod_128 | p0_mb_2 : prod_128 & ~p0_mb_2,
         _prod_plus_ma32_shl_6__0[3] ? prod_129 | p0_mb_2 : prod_129 & ~p0_mb_2,
         _prod_plus_ma32_shl_6__0[2] ? prod_130 | p0_mb_2 : prod_130 & ~p0_mb_2,
         _prod_plus_ma32_shl_6__0[1] ? prod_131 | p0_mb_2 : prod_131 & ~p0_mb_2,
         _prod_plus_ma32_shl_6__0[0] ? prod_132 | p0_mb_2 : prod_132 & ~p0_mb_2}
        + p0__ma32_shl_7__0);	// rope_apply.k:67:9, :126:{21,25}, :127:{21,51}, :128:51
  wire  [15:0] r_exp =
    p0_prod_1
      ? p0__a_exp_plus_b_exp_minus_127_plus_1__1
      : p0__a_exp_plus_b_exp_minus_127__1;	// rope_apply.k:67:9, :92:21
  wire  [15:0] r_exp_0 =
    p0_prod_2
      ? p0__a_exp_plus_b_exp_minus_127_plus_1__2
      : p0__a_exp_plus_b_exp_minus_127__2;	// rope_apply.k:67:9, :131:21
  wire         _GEN_0 = r_exp < 16'hFF & (|r_exp);	// rope_apply.k:77:{21,37,38,55}, :92:21, :94:{34,47}, :99:{34,47}, :102:{21,25,31,44}, :104:{30,45,47}
  wire         _GEN_1 = ~p0_prod_1 & _GEN_0;	// rope_apply.k:67:9, :77:{21,37,38,55}, :92:21, :94:{34,47}, :99:{34,47}, :102:{21,25}, :104:{30,45,47}
  wire         _GEN_2 = r_exp_0 < 16'hFF & (|r_exp_0);	// rope_apply.k:116:{21,37,38,39,55}, :131:21, :133:{34,47}, :138:{34,47}, :141:{21,25,31,44}, :143:{30,45,47}
  wire         _GEN_3 = ~p0_prod_2 & _GEN_2;	// rope_apply.k:67:9, :116:{21,37,38,39,55}, :131:21, :133:{34,47}, :138:{34,47}, :141:{21,25}, :143:{30,45,47}
  wire         _GEN_4 = p0__b_exp_ne_0__1 & p0__a_exp_ne_0__1;	// rope_apply.k:67:9, :75:{17,21}
  wire         p1 =
    (r_exp[8]
       ? _GEN_0
       : p0_cos_val_1[15] ? ~(p0_x_even_1[15]) & _GEN_0 : p0_x_even_1[15] & _GEN_0)
    & _GEN_4;	// rope_apply.k:67:9, :75:{17,21}, :77:{21,37,38,55}, :92:21, :94:{34,47}, :99:{34,47}, :102:{21,25}, :104:{30,45,47}
  wire         p1_0 = r_exp[7] & _GEN_0 & _GEN_4;	// rope_apply.k:75:{17,21}, :77:{21,37,38,55}, :92:21, :94:{34,47}, :99:{34,47}, :102:{21,25}, :104:{30,45,47}
  wire         p1_1 = r_exp[6] & _GEN_0 & _GEN_4;	// rope_apply.k:75:{17,21}, :77:{21,37,38,55}, :92:21, :94:{34,47}, :99:{34,47}, :102:{21,25}, :104:{30,45,47}
  wire         p1_2 = r_exp[5] & _GEN_0 & _GEN_4;	// rope_apply.k:75:{17,21}, :77:{21,37,38,55}, :92:21, :94:{34,47}, :99:{34,47}, :102:{21,25}, :104:{30,45,47}
  wire         p1_3 = r_exp[4] & _GEN_0 & _GEN_4;	// rope_apply.k:75:{17,21}, :77:{21,37,38,55}, :92:21, :94:{34,47}, :99:{34,47}, :102:{21,25}, :104:{30,45,47}
  wire         p1_4 = r_exp[3] & _GEN_0 & _GEN_4;	// rope_apply.k:75:{17,21}, :77:{21,37,38,55}, :92:21, :94:{34,47}, :99:{34,47}, :102:{21,25}, :104:{30,45,47}
  wire         p1_5 = r_exp[2] & _GEN_0 & _GEN_4;	// rope_apply.k:75:{17,21}, :77:{21,37,38,55}, :92:21, :94:{34,47}, :99:{34,47}, :102:{21,25}, :104:{30,45,47}
  wire         p1_6 = r_exp[1] & _GEN_0 & _GEN_4;	// rope_apply.k:75:{17,21}, :77:{21,37,38,55}, :92:21, :94:{34,47}, :99:{34,47}, :102:{21,25}, :104:{30,45,47}
  wire         p1_7 = r_exp[0] & _GEN_0 & _GEN_4;	// rope_apply.k:75:{17,21}, :77:{21,37,38,55}, :92:21, :94:{34,47}, :99:{34,47}, :102:{21,25}, :104:{30,45,47}
  wire         p1_8 =
    (p0_prod_3[14] ? (p0_prod_3[13] | p0_prod_1) & _GEN_0 : p0_prod_3[13] & _GEN_1)
    & _GEN_4;	// rope_apply.k:67:9, :75:{17,21}, :77:{21,37,38,55}, :92:21, :94:{34,47}, :99:{34,47}, :102:{21,25}, :104:{30,45,47}
  wire         p1_9 =
    (p0_prod_3[13] ? (p0_prod_3[12] | p0_prod_1) & _GEN_0 : p0_prod_3[12] & _GEN_1)
    & _GEN_4;	// rope_apply.k:67:9, :75:{17,21}, :77:{21,37,38,55}, :92:21, :94:{34,47}, :99:{34,47}, :102:{21,25}, :104:{30,45,47}
  wire         p1_10 =
    (p0_prod_3[12] ? (p0_prod_3[11] | p0_prod_1) & _GEN_0 : p0_prod_3[11] & _GEN_1)
    & _GEN_4;	// rope_apply.k:67:9, :75:{17,21}, :77:{21,37,38,55}, :92:21, :94:{34,47}, :99:{34,47}, :102:{21,25}, :104:{30,45,47}
  wire         p1_11 =
    (p0_prod_3[11] ? (p0_prod_3[10] | p0_prod_1) & _GEN_0 : p0_prod_3[10] & _GEN_1)
    & _GEN_4;	// rope_apply.k:67:9, :75:{17,21}, :77:{21,37,38,55}, :92:21, :94:{34,47}, :99:{34,47}, :102:{21,25}, :104:{30,45,47}
  wire         p1_12 =
    (p0_prod_3[10] ? (p0_prod_3[9] | p0_prod_1) & _GEN_0 : p0_prod_3[9] & _GEN_1)
    & _GEN_4;	// rope_apply.k:67:9, :75:{17,21}, :77:{21,37,38,55}, :92:21, :94:{34,47}, :99:{34,47}, :102:{21,25}, :104:{30,45,47}
  wire         p1_13 =
    (p0_prod_3[9] ? (p0_prod_3[8] | p0_prod_1) & _GEN_0 : p0_prod_3[8] & _GEN_1) & _GEN_4;	// rope_apply.k:67:9, :75:{17,21}, :77:{21,37,38,55}, :92:21, :94:{34,47}, :99:{34,47}, :102:{21,25}, :104:{30,45,47}
  wire         p1_14 =
    (p0_prod_3[8] ? (p0_prod_3[7] | p0_prod_1) & _GEN_0 : p0_prod_3[7] & _GEN_1) & _GEN_4;	// rope_apply.k:67:9, :75:{17,21}, :77:{21,37,38,55}, :92:21, :94:{34,47}, :99:{34,47}, :102:{21,25}, :104:{30,45,47}
  wire         _GEN_5 = p0__b_exp_ne_0__2 & p0__a_exp_ne_0__2;	// rope_apply.k:67:9, :114:{17,21}
  wire         p2 =
    (r_exp_0[8]
       ? _GEN_2
       : p0_sin_val_1[15] ? p0_x_odd_1[15] & _GEN_2 : ~(p0_x_odd_1[15]) & _GEN_2)
    & _GEN_5;	// rope_apply.k:67:9, :114:{17,21}, :116:{21,37,38,39,55}, :131:21, :133:{34,47}, :138:{34,47}, :141:{21,25}, :143:{30,45,47}
  wire         p2_0 = r_exp_0[7] & _GEN_2 & _GEN_5;	// rope_apply.k:114:{17,21}, :116:{21,37,38,39,55}, :131:21, :133:{34,47}, :138:{34,47}, :141:{21,25}, :143:{30,45,47}
  wire         p2_1 = r_exp_0[6] & _GEN_2 & _GEN_5;	// rope_apply.k:114:{17,21}, :116:{21,37,38,39,55}, :131:21, :133:{34,47}, :138:{34,47}, :141:{21,25}, :143:{30,45,47}
  wire         p2_2 = r_exp_0[5] & _GEN_2 & _GEN_5;	// rope_apply.k:114:{17,21}, :116:{21,37,38,39,55}, :131:21, :133:{34,47}, :138:{34,47}, :141:{21,25}, :143:{30,45,47}
  wire         p2_3 = r_exp_0[4] & _GEN_2 & _GEN_5;	// rope_apply.k:114:{17,21}, :116:{21,37,38,39,55}, :131:21, :133:{34,47}, :138:{34,47}, :141:{21,25}, :143:{30,45,47}
  wire         p2_4 = r_exp_0[3] & _GEN_2 & _GEN_5;	// rope_apply.k:114:{17,21}, :116:{21,37,38,39,55}, :131:21, :133:{34,47}, :138:{34,47}, :141:{21,25}, :143:{30,45,47}
  wire         p2_5 = r_exp_0[2] & _GEN_2 & _GEN_5;	// rope_apply.k:114:{17,21}, :116:{21,37,38,39,55}, :131:21, :133:{34,47}, :138:{34,47}, :141:{21,25}, :143:{30,45,47}
  wire         p2_6 = r_exp_0[1] & _GEN_2 & _GEN_5;	// rope_apply.k:114:{17,21}, :116:{21,37,38,39,55}, :131:21, :133:{34,47}, :138:{34,47}, :141:{21,25}, :143:{30,45,47}
  wire         p2_7 = r_exp_0[0] & _GEN_2 & _GEN_5;	// rope_apply.k:114:{17,21}, :116:{21,37,38,39,55}, :131:21, :133:{34,47}, :138:{34,47}, :141:{21,25}, :143:{30,45,47}
  wire         p2_8 =
    (p0_prod_4[14] ? (p0_prod_4[13] | p0_prod_2) & _GEN_2 : p0_prod_4[13] & _GEN_3)
    & _GEN_5;	// rope_apply.k:67:9, :114:{17,21}, :116:{21,37,38,39,55}, :131:21, :133:{34,47}, :138:{34,47}, :141:{21,25}, :143:{30,45,47}
  wire         p2_9 =
    (p0_prod_4[13] ? (p0_prod_4[12] | p0_prod_2) & _GEN_2 : p0_prod_4[12] & _GEN_3)
    & _GEN_5;	// rope_apply.k:67:9, :114:{17,21}, :116:{21,37,38,39,55}, :131:21, :133:{34,47}, :138:{34,47}, :141:{21,25}, :143:{30,45,47}
  wire         p2_10 =
    (p0_prod_4[12] ? (p0_prod_4[11] | p0_prod_2) & _GEN_2 : p0_prod_4[11] & _GEN_3)
    & _GEN_5;	// rope_apply.k:67:9, :114:{17,21}, :116:{21,37,38,39,55}, :131:21, :133:{34,47}, :138:{34,47}, :141:{21,25}, :143:{30,45,47}
  wire         p2_11 =
    (p0_prod_4[11] ? (p0_prod_4[10] | p0_prod_2) & _GEN_2 : p0_prod_4[10] & _GEN_3)
    & _GEN_5;	// rope_apply.k:67:9, :114:{17,21}, :116:{21,37,38,39,55}, :131:21, :133:{34,47}, :138:{34,47}, :141:{21,25}, :143:{30,45,47}
  wire         p2_12 =
    (p0_prod_4[10] ? (p0_prod_4[9] | p0_prod_2) & _GEN_2 : p0_prod_4[9] & _GEN_3)
    & _GEN_5;	// rope_apply.k:67:9, :114:{17,21}, :116:{21,37,38,39,55}, :131:21, :133:{34,47}, :138:{34,47}, :141:{21,25}, :143:{30,45,47}
  wire         p2_13 =
    (p0_prod_4[9] ? (p0_prod_4[8] | p0_prod_2) & _GEN_2 : p0_prod_4[8] & _GEN_3) & _GEN_5;	// rope_apply.k:67:9, :114:{17,21}, :116:{21,37,38,39,55}, :131:21, :133:{34,47}, :138:{34,47}, :141:{21,25}, :143:{30,45,47}
  wire         p2_14 =
    (p0_prod_4[8] ? (p0_prod_4[7] | p0_prod_2) & _GEN_2 : p0_prod_4[7] & _GEN_3) & _GEN_5;	// rope_apply.k:67:9, :114:{17,21}, :116:{21,37,38,39,55}, :131:21, :133:{34,47}, :138:{34,47}, :141:{21,25}, :143:{30,45,47}
  wire  [15:0] pa_exp = {8'h0, p1_0, p1_1, p1_2, p1_3, p1_4, p1_5, p1_6, p1_7};	// rope_apply.k:75:{17,21}, :77:{21,37,38,55}, :92:21, :94:{34,47}, :99:{34,47}, :102:{21,25}, :104:{30,45,47}, :152:{17,33}
  wire  [15:0] pb_exp = {8'h0, p2_0, p2_1, p2_2, p2_3, p2_4, p2_5, p2_6, p2_7};	// rope_apply.k:114:{17,21}, :116:{21,37,38,39,55}, :131:21, :133:{34,47}, :138:{34,47}, :141:{21,25}, :143:{30,45,47}, :153:{17,33}
  wire         _pa_exp_ge_pb_exp_ =
    {p1_0,
     p1_1,
     p1_2,
     p1_3,
     p1_4,
     p1_5,
     p1_6,
     p1_7} >= {p2_0, p2_1, p2_2, p2_3, p2_4, p2_5, p2_6, p2_7};	// rope_apply.k:75:{17,21}, :77:{21,37,38,55}, :92:21, :94:{34,47}, :99:{34,47}, :102:{21,25}, :104:{30,45,47}, :114:{17,21}, :116:{21,37,38,39,55}, :131:21, :133:{34,47}, :138:{34,47}, :141:{21,25}, :143:{30,45,47}, :152:{17,33}, :153:{17,33}, :172:25
  wire  [15:0] _pa_exp_minus_pb_exp_ = 16'(pa_exp - pb_exp);	// rope_apply.k:152:{17,33}, :153:{17,33}, :176:40
  wire  [15:0] _pb_exp_minus_pa_exp_ = 16'(pb_exp - pa_exp);	// rope_apply.k:152:{17,33}, :153:{17,33}, :188:40
  wire  [3:0]  shift = _pa_exp_minus_pb_exp_ > 16'hC ? 4'hC : _pa_exp_minus_pb_exp_[3:0];	// rope_apply.k:176:40, :177:{25,29}
  wire  [3:0]  shift_0 =
    _pb_exp_minus_pa_exp_ > 16'hC ? 4'hC : _pb_exp_minus_pa_exp_[3:0];	// rope_apply.k:188:40, :189:{25,29}
  wire         _GEN_6 = ~(shift[3]) & ~(shift[2]);	// rope_apply.k:177:25, :179:{25,29,49,61}, :180:{25,29,49,61}
  wire         _GEN_7 = ~(shift[3]) & shift[2];	// rope_apply.k:177:25, :179:{25,29,49,61}, :180:{25,29,49,61}
  wire         _GEN_8 = shift[3] ^ shift[2];	// rope_apply.k:177:25, :179:{25,29,49,61}, :180:{25,29,49,61}
  wire         _GEN_9 = shift[3] & ~(shift[2]);	// rope_apply.k:177:25, :179:{25,29,49,61}, :180:{25,29,49,61}
  wire         _GEN_10 = ~(shift_0[3]) & ~(shift_0[2]);	// rope_apply.k:189:25, :191:{25,29,49,61}, :192:{25,29,49,61}
  wire         _GEN_11 = ~(shift_0[3]) & shift_0[2];	// rope_apply.k:189:25, :191:{25,29,49,61}, :192:{25,29,49,61}
  wire         _GEN_12 = shift_0[3] ^ shift_0[2];	// rope_apply.k:189:25, :191:{25,29,49,61}, :192:{25,29,49,61}
  wire         _GEN_13 = shift_0[3] & ~(shift_0[2]);	// rope_apply.k:189:25, :191:{25,29,49,61}, :192:{25,29,49,61}
  wire         _GEN_14 = ~(p0_shift[1]) & ~(p0_shift[0]);	// rope_apply.k:67:9, :181:{25,29,49,61}, :182:{25,29,49,61}
  wire         _GEN_15 = ~(p0_shift[1]) & p0_shift[0];	// rope_apply.k:67:9, :181:{25,29,49,61}, :182:{25,29,49,61}
  wire         _GEN_16 = ~(p0_shift[1]) | ~(p0_shift[0]);	// rope_apply.k:67:9, :181:{25,29,49,61}, :182:{25,29,49,61}
  wire         _GEN_17 = p0_shift[1] ^ ~(p0_shift[0]);	// rope_apply.k:67:9, :181:{25,29,49,61}, :182:{25,29,49,61}
  wire         _GEN_18 = ~(p0_shift_0[1]) & ~(p0_shift_0[0]);	// rope_apply.k:67:9, :193:{25,29,49,61}, :194:{25,29,49,61}
  wire         _GEN_19 = ~(p0_shift_0[1]) & p0_shift_0[0];	// rope_apply.k:67:9, :193:{25,29,49,61}, :194:{25,29,49,61}
  wire         aligned_a =
    p0_aligned_a[11]
      ? (p0_aligned_a[10] ? ~(p0_shift_0[1]) : _GEN_19)
      : p0_aligned_a[10] & _GEN_18;	// rope_apply.k:67:9, :193:{25,29,49,61}, :194:{25,29,49,61}
  wire         _GEN_20 = ~(p0_shift_0[1]) | ~(p0_shift_0[0]);	// rope_apply.k:67:9, :193:{25,29,49,61}, :194:{25,29,49,61}
  wire         aligned_a_0 =
    p0_aligned_a[10]
      ? (p0_aligned_a[11]
           ? (p0_aligned_a[9] ? _GEN_20 : ^p0_shift_0)
           : p0_aligned_a[9] ? ~(p0_shift_0[1]) : _GEN_19)
      : p0_aligned_a[11]
          ? (p0_aligned_a[9] | p0_shift_0[1]) & ~(p0_shift_0[0])
          : p0_aligned_a[9] & _GEN_18;	// rope_apply.k:67:9, :193:{25,29,49,61}, :194:{25,29,49,61}
  wire         _GEN_21 = p0_shift_0[1] ^ ~(p0_shift_0[0]);	// rope_apply.k:67:9, :193:{25,29,49,61}, :194:{25,29,49,61}
  wire         aligned_a_1 =
    p0_aligned_a[11]
      ? (p0_aligned_a[9]
           ? (p0_aligned_a[10]
                ? p0_aligned_a[8] | (|p0_shift_0)
                : p0_aligned_a[8] & ~(p0_shift_0[1]) | p0_shift_0[0])
           : p0_aligned_a[10]
               ? p0_aligned_a[8] & ~(p0_shift_0[0]) | p0_shift_0[1]
               : p0_aligned_a[8] ? _GEN_21 : (&p0_shift_0))
      : p0_aligned_a[9]
          ? (p0_aligned_a[10]
               ? (p0_aligned_a[8] ? _GEN_20 : ^p0_shift_0)
               : p0_aligned_a[8] ? ~(p0_shift_0[1]) : _GEN_19)
          : p0_aligned_a[10]
              ? (p0_aligned_a[8] | p0_shift_0[1]) & ~(p0_shift_0[0])
              : p0_aligned_a[8] & _GEN_18;	// rope_apply.k:67:9, :193:{25,29,49,61}, :194:{25,29,49,61}
  wire         aligned_a_2 =
    p0_aligned_a[10]
      ? (p0_aligned_a[8]
           ? (p0_aligned_a[9]
                ? p0_aligned_a[7] | (|p0_shift_0)
                : p0_aligned_a[7] & ~(p0_shift_0[1]) | p0_shift_0[0])
           : p0_aligned_a[9]
               ? p0_aligned_a[7] & ~(p0_shift_0[0]) | p0_shift_0[1]
               : p0_aligned_a[7] ? _GEN_21 : (&p0_shift_0))
      : p0_aligned_a[8]
          ? (p0_aligned_a[9]
               ? (p0_aligned_a[7] ? _GEN_20 : ^p0_shift_0)
               : p0_aligned_a[7] ? ~(p0_shift_0[1]) : _GEN_19)
          : p0_aligned_a[9]
              ? (p0_aligned_a[7] | p0_shift_0[1]) & ~(p0_shift_0[0])
              : p0_aligned_a[7] & _GEN_18;	// rope_apply.k:67:9, :193:{25,29,49,61}, :194:{25,29,49,61}
  wire         aligned_a_3 =
    p0_aligned_a[9]
      ? (p0_aligned_a[7]
           ? (p0_aligned_a[8]
                ? p0_aligned_a[6] | (|p0_shift_0)
                : p0_aligned_a[6] & ~(p0_shift_0[1]) | p0_shift_0[0])
           : p0_aligned_a[8]
               ? p0_aligned_a[6] & ~(p0_shift_0[0]) | p0_shift_0[1]
               : p0_aligned_a[6] ? _GEN_21 : (&p0_shift_0))
      : p0_aligned_a[7]
          ? (p0_aligned_a[8]
               ? (p0_aligned_a[6] ? _GEN_20 : ^p0_shift_0)
               : p0_aligned_a[6] ? ~(p0_shift_0[1]) : _GEN_19)
          : p0_aligned_a[8]
              ? (p0_aligned_a[6] | p0_shift_0[1]) & ~(p0_shift_0[0])
              : p0_aligned_a[6] & _GEN_18;	// rope_apply.k:67:9, :193:{25,29,49,61}, :194:{25,29,49,61}
  wire         aligned_a_4 =
    p0_aligned_a[8]
      ? (p0_aligned_a[6]
           ? (p0_aligned_a[7]
                ? p0_aligned_a[5] | (|p0_shift_0)
                : p0_aligned_a[5] & ~(p0_shift_0[1]) | p0_shift_0[0])
           : p0_aligned_a[7]
               ? p0_aligned_a[5] & ~(p0_shift_0[0]) | p0_shift_0[1]
               : p0_aligned_a[5] ? _GEN_21 : (&p0_shift_0))
      : p0_aligned_a[6]
          ? (p0_aligned_a[7]
               ? (p0_aligned_a[5] ? _GEN_20 : ^p0_shift_0)
               : p0_aligned_a[5] ? ~(p0_shift_0[1]) : _GEN_19)
          : p0_aligned_a[7]
              ? (p0_aligned_a[5] | p0_shift_0[1]) & ~(p0_shift_0[0])
              : p0_aligned_a[5] & _GEN_18;	// rope_apply.k:67:9, :193:{25,29,49,61}, :194:{25,29,49,61}
  wire         aligned_a_5 =
    p0_aligned_a[7]
      ? (p0_aligned_a[5]
           ? (p0_aligned_a[6]
                ? p0_aligned_a[4] | (|p0_shift_0)
                : p0_aligned_a[4] & ~(p0_shift_0[1]) | p0_shift_0[0])
           : p0_aligned_a[6]
               ? p0_aligned_a[4] & ~(p0_shift_0[0]) | p0_shift_0[1]
               : p0_aligned_a[4] ? _GEN_21 : (&p0_shift_0))
      : p0_aligned_a[5]
          ? (p0_aligned_a[6]
               ? (p0_aligned_a[4] ? _GEN_20 : ^p0_shift_0)
               : p0_aligned_a[4] ? ~(p0_shift_0[1]) : _GEN_19)
          : p0_aligned_a[6]
              ? (p0_aligned_a[4] | p0_shift_0[1]) & ~(p0_shift_0[0])
              : p0_aligned_a[4] & _GEN_18;	// rope_apply.k:67:9, :193:{25,29,49,61}, :194:{25,29,49,61}
  wire         aligned_a_6 = p0_aligned_a[11] & _GEN_18 | p0__pa_exp_ge_pb_exp_;	// rope_apply.k:67:9, :172:21, :193:{25,29,49,61}, :194:{25,29,49,61}
  wire         aligned_a_7 =
    p0__pa_mant_shl_4_[10]
      ? aligned_a | p0__pa_exp_ge_pb_exp_
      : aligned_a & ~p0__pa_exp_ge_pb_exp_;	// rope_apply.k:67:9, :172:21, :193:{25,29,49,61}, :194:{25,29,49,61}
  wire         aligned_a_8 =
    p0__pa_mant_shl_4_[9]
      ? aligned_a_0 | p0__pa_exp_ge_pb_exp_
      : aligned_a_0 & ~p0__pa_exp_ge_pb_exp_;	// rope_apply.k:67:9, :172:21, :193:{25,29,49,61}, :194:{25,29,49,61}
  wire         aligned_a_9 =
    p0__pa_mant_shl_4_[8]
      ? aligned_a_1 | p0__pa_exp_ge_pb_exp_
      : aligned_a_1 & ~p0__pa_exp_ge_pb_exp_;	// rope_apply.k:67:9, :172:21, :193:{25,29,49,61}, :194:{25,29,49,61}
  wire         aligned_a_10 =
    p0__pa_mant_shl_4_[7]
      ? aligned_a_2 | p0__pa_exp_ge_pb_exp_
      : aligned_a_2 & ~p0__pa_exp_ge_pb_exp_;	// rope_apply.k:67:9, :172:21, :193:{25,29,49,61}, :194:{25,29,49,61}
  wire         aligned_a_11 =
    p0__pa_mant_shl_4_[6]
      ? aligned_a_3 | p0__pa_exp_ge_pb_exp_
      : aligned_a_3 & ~p0__pa_exp_ge_pb_exp_;	// rope_apply.k:67:9, :172:21, :193:{25,29,49,61}, :194:{25,29,49,61}
  wire         aligned_a_12 =
    p0__pa_mant_shl_4_[5]
      ? aligned_a_4 | p0__pa_exp_ge_pb_exp_
      : aligned_a_4 & ~p0__pa_exp_ge_pb_exp_;	// rope_apply.k:67:9, :172:21, :193:{25,29,49,61}, :194:{25,29,49,61}
  wire         aligned_a_13 =
    p0__pa_mant_shl_4_[4]
      ? aligned_a_5 | p0__pa_exp_ge_pb_exp_
      : aligned_a_5 & ~p0__pa_exp_ge_pb_exp_;	// rope_apply.k:67:9, :172:21, :193:{25,29,49,61}, :194:{25,29,49,61}
  wire         aligned_a_14 =
    (p0_aligned_a[6]
       ? (p0_aligned_a[4]
            ? (p0_aligned_a[5]
                 ? p0_aligned_a[3] | (|p0_shift_0)
                 : p0_aligned_a[3] & ~(p0_shift_0[1]) | p0_shift_0[0])
            : p0_aligned_a[5]
                ? p0_aligned_a[3] & ~(p0_shift_0[0]) | p0_shift_0[1]
                : p0_aligned_a[3] ? _GEN_21 : (&p0_shift_0))
       : p0_aligned_a[4]
           ? (p0_aligned_a[5]
                ? (p0_aligned_a[3] ? _GEN_20 : ^p0_shift_0)
                : p0_aligned_a[3] ? ~(p0_shift_0[1]) : _GEN_19)
           : p0_aligned_a[5]
               ? (p0_aligned_a[3] | p0_shift_0[1]) & ~(p0_shift_0[0])
               : p0_aligned_a[3] & _GEN_18) & ~p0__pa_exp_ge_pb_exp_;	// rope_apply.k:67:9, :172:21, :193:{25,29,49,61}, :194:{25,29,49,61}
  wire         aligned_a_15 =
    (p0_aligned_a[5]
       ? (p0_aligned_a[3]
            ? (p0_aligned_a[4]
                 ? p0_aligned_a[2] | (|p0_shift_0)
                 : p0_aligned_a[2] & ~(p0_shift_0[1]) | p0_shift_0[0])
            : p0_aligned_a[4]
                ? p0_aligned_a[2] & ~(p0_shift_0[0]) | p0_shift_0[1]
                : p0_aligned_a[2] ? _GEN_21 : (&p0_shift_0))
       : p0_aligned_a[3]
           ? (p0_aligned_a[4]
                ? (p0_aligned_a[2] ? _GEN_20 : ^p0_shift_0)
                : p0_aligned_a[2] ? ~(p0_shift_0[1]) : _GEN_19)
           : p0_aligned_a[4]
               ? (p0_aligned_a[2] | p0_shift_0[1]) & ~(p0_shift_0[0])
               : p0_aligned_a[2] & _GEN_18) & ~p0__pa_exp_ge_pb_exp_;	// rope_apply.k:67:9, :172:21, :193:{25,29,49,61}, :194:{25,29,49,61}
  wire         aligned_a_16 =
    (p0_aligned_a[4]
       ? (p0_aligned_a[2]
            ? (p0_aligned_a[3]
                 ? p0_aligned_a[1] | (|p0_shift_0)
                 : p0_aligned_a[1] & ~(p0_shift_0[1]) | p0_shift_0[0])
            : p0_aligned_a[3]
                ? p0_aligned_a[1] & ~(p0_shift_0[0]) | p0_shift_0[1]
                : p0_aligned_a[1] ? _GEN_21 : (&p0_shift_0))
       : p0_aligned_a[2]
           ? (p0_aligned_a[3]
                ? (p0_aligned_a[1] ? _GEN_20 : ^p0_shift_0)
                : p0_aligned_a[1] ? ~(p0_shift_0[1]) : _GEN_19)
           : p0_aligned_a[3]
               ? (p0_aligned_a[1] | p0_shift_0[1]) & ~(p0_shift_0[0])
               : p0_aligned_a[1] & _GEN_18) & ~p0__pa_exp_ge_pb_exp_;	// rope_apply.k:67:9, :172:21, :193:{25,29,49,61}, :194:{25,29,49,61}
  wire         aligned_a_17 =
    (p0_aligned_a[3]
       ? (p0_aligned_a[1]
            ? (p0_aligned_a[2]
                 ? p0_aligned_a[0] | (|p0_shift_0)
                 : p0_aligned_a[0] & ~(p0_shift_0[1]) | p0_shift_0[0])
            : p0_aligned_a[2]
                ? p0_aligned_a[0] & ~(p0_shift_0[0]) | p0_shift_0[1]
                : p0_aligned_a[0] ? _GEN_21 : (&p0_shift_0))
       : p0_aligned_a[1]
           ? (p0_aligned_a[2]
                ? (p0_aligned_a[0] ? _GEN_20 : ^p0_shift_0)
                : p0_aligned_a[0] ? ~(p0_shift_0[1]) : _GEN_19)
           : p0_aligned_a[2]
               ? (p0_aligned_a[0] | p0_shift_0[1]) & ~(p0_shift_0[0])
               : p0_aligned_a[0] & _GEN_18) & ~p0__pa_exp_ge_pb_exp_;	// rope_apply.k:67:9, :172:21, :193:{25,29,49,61}, :194:{25,29,49,61}
  wire  [15:0] aligned_a_18 =
    {4'h0,
     aligned_a_6,
     aligned_a_7,
     aligned_a_8,
     aligned_a_9,
     aligned_a_10,
     aligned_a_11,
     aligned_a_12,
     aligned_a_13,
     aligned_a_14,
     aligned_a_15,
     aligned_a_16,
     aligned_a_17};	// rope_apply.k:172:21
  wire         aligned_b = p0_aligned_b[11] & _GEN_14 | ~p0__pa_exp_ge_pb_exp_;	// rope_apply.k:67:9, :172:21, :181:{25,29,49,61}, :182:{25,29,49,61}
  wire         aligned_b_0 =
    (p0_aligned_b[11]
       ? (p0_aligned_b[10] ? ~(p0_shift[1]) : _GEN_15)
       : p0_aligned_b[10] & _GEN_14)
      ? p0__pb_mant_shl_4_[10] | p0__pa_exp_ge_pb_exp_
      : p0__pb_mant_shl_4_[10] & ~p0__pa_exp_ge_pb_exp_;	// rope_apply.k:67:9, :172:21, :181:{25,29,49,61}, :182:{25,29,49,61}
  wire         aligned_b_1 =
    (p0_aligned_b[10]
       ? (p0_aligned_b[11]
            ? (p0_aligned_b[9] ? _GEN_16 : ^p0_shift)
            : p0_aligned_b[9] ? ~(p0_shift[1]) : _GEN_15)
       : p0_aligned_b[11]
           ? (p0_aligned_b[9] | p0_shift[1]) & ~(p0_shift[0])
           : p0_aligned_b[9] & _GEN_14)
      ? p0__pb_mant_shl_4_[9] | p0__pa_exp_ge_pb_exp_
      : p0__pb_mant_shl_4_[9] & ~p0__pa_exp_ge_pb_exp_;	// rope_apply.k:67:9, :172:21, :181:{25,29,49,61}, :182:{25,29,49,61}
  wire         aligned_b_2 =
    (p0_aligned_b[11]
       ? (p0_aligned_b[9]
            ? (p0_aligned_b[10]
                 ? p0_aligned_b[8] | (|p0_shift)
                 : p0_aligned_b[8] & ~(p0_shift[1]) | p0_shift[0])
            : p0_aligned_b[10]
                ? p0_aligned_b[8] & ~(p0_shift[0]) | p0_shift[1]
                : p0_aligned_b[8] ? _GEN_17 : (&p0_shift))
       : p0_aligned_b[9]
           ? (p0_aligned_b[10]
                ? (p0_aligned_b[8] ? _GEN_16 : ^p0_shift)
                : p0_aligned_b[8] ? ~(p0_shift[1]) : _GEN_15)
           : p0_aligned_b[10]
               ? (p0_aligned_b[8] | p0_shift[1]) & ~(p0_shift[0])
               : p0_aligned_b[8] & _GEN_14)
      ? p0__pb_mant_shl_4_[8] | p0__pa_exp_ge_pb_exp_
      : p0__pb_mant_shl_4_[8] & ~p0__pa_exp_ge_pb_exp_;	// rope_apply.k:67:9, :172:21, :181:{25,29,49,61}, :182:{25,29,49,61}
  wire         aligned_b_3 =
    (p0_aligned_b[10]
       ? (p0_aligned_b[8]
            ? (p0_aligned_b[9]
                 ? p0_aligned_b[7] | (|p0_shift)
                 : p0_aligned_b[7] & ~(p0_shift[1]) | p0_shift[0])
            : p0_aligned_b[9]
                ? p0_aligned_b[7] & ~(p0_shift[0]) | p0_shift[1]
                : p0_aligned_b[7] ? _GEN_17 : (&p0_shift))
       : p0_aligned_b[8]
           ? (p0_aligned_b[9]
                ? (p0_aligned_b[7] ? _GEN_16 : ^p0_shift)
                : p0_aligned_b[7] ? ~(p0_shift[1]) : _GEN_15)
           : p0_aligned_b[9]
               ? (p0_aligned_b[7] | p0_shift[1]) & ~(p0_shift[0])
               : p0_aligned_b[7] & _GEN_14)
      ? p0__pb_mant_shl_4_[7] | p0__pa_exp_ge_pb_exp_
      : p0__pb_mant_shl_4_[7] & ~p0__pa_exp_ge_pb_exp_;	// rope_apply.k:67:9, :172:21, :181:{25,29,49,61}, :182:{25,29,49,61}
  wire         aligned_b_4 =
    (p0_aligned_b[9]
       ? (p0_aligned_b[7]
            ? (p0_aligned_b[8]
                 ? p0_aligned_b[6] | (|p0_shift)
                 : p0_aligned_b[6] & ~(p0_shift[1]) | p0_shift[0])
            : p0_aligned_b[8]
                ? p0_aligned_b[6] & ~(p0_shift[0]) | p0_shift[1]
                : p0_aligned_b[6] ? _GEN_17 : (&p0_shift))
       : p0_aligned_b[7]
           ? (p0_aligned_b[8]
                ? (p0_aligned_b[6] ? _GEN_16 : ^p0_shift)
                : p0_aligned_b[6] ? ~(p0_shift[1]) : _GEN_15)
           : p0_aligned_b[8]
               ? (p0_aligned_b[6] | p0_shift[1]) & ~(p0_shift[0])
               : p0_aligned_b[6] & _GEN_14)
      ? p0__pb_mant_shl_4_[6] | p0__pa_exp_ge_pb_exp_
      : p0__pb_mant_shl_4_[6] & ~p0__pa_exp_ge_pb_exp_;	// rope_apply.k:67:9, :172:21, :181:{25,29,49,61}, :182:{25,29,49,61}
  wire         aligned_b_5 =
    (p0_aligned_b[8]
       ? (p0_aligned_b[6]
            ? (p0_aligned_b[7]
                 ? p0_aligned_b[5] | (|p0_shift)
                 : p0_aligned_b[5] & ~(p0_shift[1]) | p0_shift[0])
            : p0_aligned_b[7]
                ? p0_aligned_b[5] & ~(p0_shift[0]) | p0_shift[1]
                : p0_aligned_b[5] ? _GEN_17 : (&p0_shift))
       : p0_aligned_b[6]
           ? (p0_aligned_b[7]
                ? (p0_aligned_b[5] ? _GEN_16 : ^p0_shift)
                : p0_aligned_b[5] ? ~(p0_shift[1]) : _GEN_15)
           : p0_aligned_b[7]
               ? (p0_aligned_b[5] | p0_shift[1]) & ~(p0_shift[0])
               : p0_aligned_b[5] & _GEN_14)
      ? p0__pb_mant_shl_4_[5] | p0__pa_exp_ge_pb_exp_
      : p0__pb_mant_shl_4_[5] & ~p0__pa_exp_ge_pb_exp_;	// rope_apply.k:67:9, :172:21, :181:{25,29,49,61}, :182:{25,29,49,61}
  wire         aligned_b_6 =
    (p0_aligned_b[7]
       ? (p0_aligned_b[5]
            ? (p0_aligned_b[6]
                 ? p0_aligned_b[4] | (|p0_shift)
                 : p0_aligned_b[4] & ~(p0_shift[1]) | p0_shift[0])
            : p0_aligned_b[6]
                ? p0_aligned_b[4] & ~(p0_shift[0]) | p0_shift[1]
                : p0_aligned_b[4] ? _GEN_17 : (&p0_shift))
       : p0_aligned_b[5]
           ? (p0_aligned_b[6]
                ? (p0_aligned_b[4] ? _GEN_16 : ^p0_shift)
                : p0_aligned_b[4] ? ~(p0_shift[1]) : _GEN_15)
           : p0_aligned_b[6]
               ? (p0_aligned_b[4] | p0_shift[1]) & ~(p0_shift[0])
               : p0_aligned_b[4] & _GEN_14)
      ? p0__pb_mant_shl_4_[4] | p0__pa_exp_ge_pb_exp_
      : p0__pb_mant_shl_4_[4] & ~p0__pa_exp_ge_pb_exp_;	// rope_apply.k:67:9, :172:21, :181:{25,29,49,61}, :182:{25,29,49,61}
  wire         aligned_b_7 =
    (p0_aligned_b[6]
       ? (p0_aligned_b[4]
            ? (p0_aligned_b[5]
                 ? p0_aligned_b[3] | (|p0_shift)
                 : p0_aligned_b[3] & ~(p0_shift[1]) | p0_shift[0])
            : p0_aligned_b[5]
                ? p0_aligned_b[3] & ~(p0_shift[0]) | p0_shift[1]
                : p0_aligned_b[3] ? _GEN_17 : (&p0_shift))
       : p0_aligned_b[4]
           ? (p0_aligned_b[5]
                ? (p0_aligned_b[3] ? _GEN_16 : ^p0_shift)
                : p0_aligned_b[3] ? ~(p0_shift[1]) : _GEN_15)
           : p0_aligned_b[5]
               ? (p0_aligned_b[3] | p0_shift[1]) & ~(p0_shift[0])
               : p0_aligned_b[3] & _GEN_14) & p0__pa_exp_ge_pb_exp_;	// rope_apply.k:67:9, :172:21, :181:{25,29,49,61}, :182:{25,29,49,61}
  wire         aligned_b_8 =
    (p0_aligned_b[5]
       ? (p0_aligned_b[3]
            ? (p0_aligned_b[4]
                 ? p0_aligned_b[2] | (|p0_shift)
                 : p0_aligned_b[2] & ~(p0_shift[1]) | p0_shift[0])
            : p0_aligned_b[4]
                ? p0_aligned_b[2] & ~(p0_shift[0]) | p0_shift[1]
                : p0_aligned_b[2] ? _GEN_17 : (&p0_shift))
       : p0_aligned_b[3]
           ? (p0_aligned_b[4]
                ? (p0_aligned_b[2] ? _GEN_16 : ^p0_shift)
                : p0_aligned_b[2] ? ~(p0_shift[1]) : _GEN_15)
           : p0_aligned_b[4]
               ? (p0_aligned_b[2] | p0_shift[1]) & ~(p0_shift[0])
               : p0_aligned_b[2] & _GEN_14) & p0__pa_exp_ge_pb_exp_;	// rope_apply.k:67:9, :172:21, :181:{25,29,49,61}, :182:{25,29,49,61}
  wire         aligned_b_9 =
    (p0_aligned_b[4]
       ? (p0_aligned_b[2]
            ? (p0_aligned_b[3]
                 ? p0_aligned_b[1] | (|p0_shift)
                 : p0_aligned_b[1] & ~(p0_shift[1]) | p0_shift[0])
            : p0_aligned_b[3]
                ? p0_aligned_b[1] & ~(p0_shift[0]) | p0_shift[1]
                : p0_aligned_b[1] ? _GEN_17 : (&p0_shift))
       : p0_aligned_b[2]
           ? (p0_aligned_b[3]
                ? (p0_aligned_b[1] ? _GEN_16 : ^p0_shift)
                : p0_aligned_b[1] ? ~(p0_shift[1]) : _GEN_15)
           : p0_aligned_b[3]
               ? (p0_aligned_b[1] | p0_shift[1]) & ~(p0_shift[0])
               : p0_aligned_b[1] & _GEN_14) & p0__pa_exp_ge_pb_exp_;	// rope_apply.k:67:9, :172:21, :181:{25,29,49,61}, :182:{25,29,49,61}
  wire         aligned_b_10 =
    (p0_aligned_b[3]
       ? (p0_aligned_b[1]
            ? (p0_aligned_b[2]
                 ? p0_aligned_b[0] | (|p0_shift)
                 : p0_aligned_b[0] & ~(p0_shift[1]) | p0_shift[0])
            : p0_aligned_b[2]
                ? p0_aligned_b[0] & ~(p0_shift[0]) | p0_shift[1]
                : p0_aligned_b[0] ? _GEN_17 : (&p0_shift))
       : p0_aligned_b[1]
           ? (p0_aligned_b[2]
                ? (p0_aligned_b[0] ? _GEN_16 : ^p0_shift)
                : p0_aligned_b[0] ? ~(p0_shift[1]) : _GEN_15)
           : p0_aligned_b[2]
               ? (p0_aligned_b[0] | p0_shift[1]) & ~(p0_shift[0])
               : p0_aligned_b[0] & _GEN_14) & p0__pa_exp_ge_pb_exp_;	// rope_apply.k:67:9, :172:21, :181:{25,29,49,61}, :182:{25,29,49,61}
  wire  [15:0] aligned_b_11 =
    {4'h0,
     aligned_b,
     aligned_b_0,
     aligned_b_1,
     aligned_b_2,
     aligned_b_3,
     aligned_b_4,
     aligned_b_5,
     aligned_b_6,
     aligned_b_7,
     aligned_b_8,
     aligned_b_9,
     aligned_b_10};	// rope_apply.k:172:21
  wire  [12:0] _aligned_a_plus_aligned_b_ =
    13'({1'h0,
         aligned_a_6,
         aligned_a_7,
         aligned_a_8,
         aligned_a_9,
         aligned_a_10,
         aligned_a_11,
         aligned_a_12,
         aligned_a_13,
         aligned_a_14,
         aligned_a_15,
         aligned_a_16,
         aligned_a_17}
        + {1'h0,
           aligned_b,
           aligned_b_0,
           aligned_b_1,
           aligned_b_2,
           aligned_b_3,
           aligned_b_4,
           aligned_b_5,
           aligned_b_6,
           aligned_b_7,
           aligned_b_8,
           aligned_b_9,
           aligned_b_10});	// rope_apply.k:172:21, :202:31
  wire         _aligned_a_ge_aligned_b_ =
    {aligned_a_6,
     aligned_a_7,
     aligned_a_8,
     aligned_a_9,
     aligned_a_10,
     aligned_a_11,
     aligned_a_12,
     aligned_a_13,
     aligned_a_14,
     aligned_a_15,
     aligned_a_16,
     aligned_a_17} >= {aligned_b,
                       aligned_b_0,
                       aligned_b_1,
                       aligned_b_2,
                       aligned_b_3,
                       aligned_b_4,
                       aligned_b_5,
                       aligned_b_6,
                       aligned_b_7,
                       aligned_b_8,
                       aligned_b_9,
                       aligned_b_10};	// rope_apply.k:172:21, :206:29
  wire  [15:0] _aligned_a_minus_aligned_b_ = 16'(aligned_a_18 - aligned_b_11);	// rope_apply.k:172:21, :209:35
  wire  [15:0] _aligned_b_minus_aligned_a_ = 16'(aligned_b_11 - aligned_a_18);	// rope_apply.k:172:21, :214:35
  wire         _GEN_22 = ~_aligned_a_ge_aligned_b_ & ~p0__pa_sign_eq_pb_sign_;	// rope_apply.k:67:9, :199:21, :206:{25,29}
  wire         sum =
    _aligned_a_minus_aligned_b_[15]
      ? (_aligned_b_minus_aligned_a_[15] | _aligned_a_ge_aligned_b_)
        & ~p0__pa_sign_eq_pb_sign_
      : _aligned_b_minus_aligned_a_[15] & _GEN_22;	// rope_apply.k:67:9, :199:21, :206:{25,29}, :209:35, :214:35
  wire         sum_0 =
    _aligned_a_minus_aligned_b_[14]
      ? (_aligned_b_minus_aligned_a_[14] | _aligned_a_ge_aligned_b_)
        & ~p0__pa_sign_eq_pb_sign_
      : _aligned_b_minus_aligned_a_[14] & _GEN_22;	// rope_apply.k:67:9, :199:21, :206:{25,29}, :209:35, :214:35
  wire         sum_1 =
    _aligned_a_minus_aligned_b_[13]
      ? (_aligned_b_minus_aligned_a_[13] | _aligned_a_ge_aligned_b_)
        & ~p0__pa_sign_eq_pb_sign_
      : _aligned_b_minus_aligned_a_[13] & _GEN_22;	// rope_apply.k:67:9, :199:21, :206:{25,29}, :209:35, :214:35
  wire         _GEN_23 = _aligned_a_ge_aligned_b_ | p0__pa_sign_eq_pb_sign_;	// rope_apply.k:67:9, :199:21, :206:{25,29}
  wire         sum_2 =
    _aligned_a_plus_aligned_b_[12]
      ? (_aligned_a_minus_aligned_b_[12]
           ? _aligned_b_minus_aligned_a_[12] | _GEN_23
           : _aligned_b_minus_aligned_a_[12] & ~_aligned_a_ge_aligned_b_
             | p0__pa_sign_eq_pb_sign_)
      : _aligned_a_minus_aligned_b_[12]
          ? (_aligned_b_minus_aligned_a_[12] | _aligned_a_ge_aligned_b_)
            & ~p0__pa_sign_eq_pb_sign_
          : _aligned_b_minus_aligned_a_[12] & _GEN_22;	// rope_apply.k:67:9, :199:21, :202:31, :206:{25,29}, :209:35, :214:35
  wire         sum_3 =
    _aligned_a_plus_aligned_b_[11]
      ? (_aligned_a_minus_aligned_b_[11]
           ? _aligned_b_minus_aligned_a_[11] | _GEN_23
           : _aligned_b_minus_aligned_a_[11] & ~_aligned_a_ge_aligned_b_
             | p0__pa_sign_eq_pb_sign_)
      : _aligned_a_minus_aligned_b_[11]
          ? (_aligned_b_minus_aligned_a_[11] | _aligned_a_ge_aligned_b_)
            & ~p0__pa_sign_eq_pb_sign_
          : _aligned_b_minus_aligned_a_[11] & _GEN_22;	// rope_apply.k:67:9, :199:21, :202:31, :206:{25,29}, :209:35, :214:35
  wire         sum_4 =
    _aligned_a_plus_aligned_b_[10]
      ? (_aligned_a_minus_aligned_b_[10]
           ? _aligned_b_minus_aligned_a_[10] | _GEN_23
           : _aligned_b_minus_aligned_a_[10] & ~_aligned_a_ge_aligned_b_
             | p0__pa_sign_eq_pb_sign_)
      : _aligned_a_minus_aligned_b_[10]
          ? (_aligned_b_minus_aligned_a_[10] | _aligned_a_ge_aligned_b_)
            & ~p0__pa_sign_eq_pb_sign_
          : _aligned_b_minus_aligned_a_[10] & _GEN_22;	// rope_apply.k:67:9, :199:21, :202:31, :206:{25,29}, :209:35, :214:35
  wire         sum_5 =
    _aligned_a_plus_aligned_b_[9]
      ? (_aligned_a_minus_aligned_b_[9]
           ? _aligned_b_minus_aligned_a_[9] | _GEN_23
           : _aligned_b_minus_aligned_a_[9] & ~_aligned_a_ge_aligned_b_
             | p0__pa_sign_eq_pb_sign_)
      : _aligned_a_minus_aligned_b_[9]
          ? (_aligned_b_minus_aligned_a_[9] | _aligned_a_ge_aligned_b_)
            & ~p0__pa_sign_eq_pb_sign_
          : _aligned_b_minus_aligned_a_[9] & _GEN_22;	// rope_apply.k:67:9, :199:21, :202:31, :206:{25,29}, :209:35, :214:35
  wire         sum_6 =
    _aligned_a_plus_aligned_b_[8]
      ? (_aligned_a_minus_aligned_b_[8]
           ? _aligned_b_minus_aligned_a_[8] | _GEN_23
           : _aligned_b_minus_aligned_a_[8] & ~_aligned_a_ge_aligned_b_
             | p0__pa_sign_eq_pb_sign_)
      : _aligned_a_minus_aligned_b_[8]
          ? (_aligned_b_minus_aligned_a_[8] | _aligned_a_ge_aligned_b_)
            & ~p0__pa_sign_eq_pb_sign_
          : _aligned_b_minus_aligned_a_[8] & _GEN_22;	// rope_apply.k:67:9, :199:21, :202:31, :206:{25,29}, :209:35, :214:35
  wire         sum_7 =
    _aligned_a_plus_aligned_b_[7]
      ? (_aligned_a_minus_aligned_b_[7]
           ? _aligned_b_minus_aligned_a_[7] | _GEN_23
           : _aligned_b_minus_aligned_a_[7] & ~_aligned_a_ge_aligned_b_
             | p0__pa_sign_eq_pb_sign_)
      : _aligned_a_minus_aligned_b_[7]
          ? (_aligned_b_minus_aligned_a_[7] | _aligned_a_ge_aligned_b_)
            & ~p0__pa_sign_eq_pb_sign_
          : _aligned_b_minus_aligned_a_[7] & _GEN_22;	// rope_apply.k:67:9, :199:21, :202:31, :206:{25,29}, :209:35, :214:35
  wire         sum_8 =
    _aligned_a_plus_aligned_b_[6]
      ? (_aligned_a_minus_aligned_b_[6]
           ? _aligned_b_minus_aligned_a_[6] | _GEN_23
           : _aligned_b_minus_aligned_a_[6] & ~_aligned_a_ge_aligned_b_
             | p0__pa_sign_eq_pb_sign_)
      : _aligned_a_minus_aligned_b_[6]
          ? (_aligned_b_minus_aligned_a_[6] | _aligned_a_ge_aligned_b_)
            & ~p0__pa_sign_eq_pb_sign_
          : _aligned_b_minus_aligned_a_[6] & _GEN_22;	// rope_apply.k:67:9, :199:21, :202:31, :206:{25,29}, :209:35, :214:35
  wire         sum_9 =
    _aligned_a_plus_aligned_b_[5]
      ? (_aligned_a_minus_aligned_b_[5]
           ? _aligned_b_minus_aligned_a_[5] | _GEN_23
           : _aligned_b_minus_aligned_a_[5] & ~_aligned_a_ge_aligned_b_
             | p0__pa_sign_eq_pb_sign_)
      : _aligned_a_minus_aligned_b_[5]
          ? (_aligned_b_minus_aligned_a_[5] | _aligned_a_ge_aligned_b_)
            & ~p0__pa_sign_eq_pb_sign_
          : _aligned_b_minus_aligned_a_[5] & _GEN_22;	// rope_apply.k:67:9, :199:21, :202:31, :206:{25,29}, :209:35, :214:35
  wire         sum_10 =
    _aligned_a_plus_aligned_b_[4]
      ? (_aligned_a_minus_aligned_b_[4]
           ? _aligned_b_minus_aligned_a_[4] | _GEN_23
           : _aligned_b_minus_aligned_a_[4] & ~_aligned_a_ge_aligned_b_
             | p0__pa_sign_eq_pb_sign_)
      : _aligned_a_minus_aligned_b_[4]
          ? (_aligned_b_minus_aligned_a_[4] | _aligned_a_ge_aligned_b_)
            & ~p0__pa_sign_eq_pb_sign_
          : _aligned_b_minus_aligned_a_[4] & _GEN_22;	// rope_apply.k:67:9, :199:21, :202:31, :206:{25,29}, :209:35, :214:35
  wire         sum_11 =
    _aligned_a_plus_aligned_b_[3]
      ? (_aligned_a_minus_aligned_b_[3]
           ? _aligned_b_minus_aligned_a_[3] | _GEN_23
           : _aligned_b_minus_aligned_a_[3] & ~_aligned_a_ge_aligned_b_
             | p0__pa_sign_eq_pb_sign_)
      : _aligned_a_minus_aligned_b_[3]
          ? (_aligned_b_minus_aligned_a_[3] | _aligned_a_ge_aligned_b_)
            & ~p0__pa_sign_eq_pb_sign_
          : _aligned_b_minus_aligned_a_[3] & _GEN_22;	// rope_apply.k:67:9, :199:21, :202:31, :206:{25,29}, :209:35, :214:35
  wire         sum_12 =
    _aligned_a_plus_aligned_b_[2]
      ? (_aligned_a_minus_aligned_b_[2]
           ? _aligned_b_minus_aligned_a_[2] | _GEN_23
           : _aligned_b_minus_aligned_a_[2] & ~_aligned_a_ge_aligned_b_
             | p0__pa_sign_eq_pb_sign_)
      : _aligned_a_minus_aligned_b_[2]
          ? (_aligned_b_minus_aligned_a_[2] | _aligned_a_ge_aligned_b_)
            & ~p0__pa_sign_eq_pb_sign_
          : _aligned_b_minus_aligned_a_[2] & _GEN_22;	// rope_apply.k:67:9, :199:21, :202:31, :206:{25,29}, :209:35, :214:35
  wire         sum_13 =
    _aligned_a_plus_aligned_b_[1]
      ? (_aligned_a_minus_aligned_b_[1]
           ? _aligned_b_minus_aligned_a_[1] | _GEN_23
           : _aligned_b_minus_aligned_a_[1] & ~_aligned_a_ge_aligned_b_
             | p0__pa_sign_eq_pb_sign_)
      : _aligned_a_minus_aligned_b_[1]
          ? (_aligned_b_minus_aligned_a_[1] | _aligned_a_ge_aligned_b_)
            & ~p0__pa_sign_eq_pb_sign_
          : _aligned_b_minus_aligned_a_[1] & _GEN_22;	// rope_apply.k:67:9, :199:21, :202:31, :206:{25,29}, :209:35, :214:35
  wire         sum_14 =
    _aligned_a_plus_aligned_b_[0]
      ? (_aligned_a_minus_aligned_b_[0]
           ? _aligned_b_minus_aligned_a_[0] | _GEN_23
           : _aligned_b_minus_aligned_a_[0] & ~_aligned_a_ge_aligned_b_
             | p0__pa_sign_eq_pb_sign_)
      : _aligned_a_minus_aligned_b_[0]
          ? (_aligned_b_minus_aligned_a_[0] | _aligned_a_ge_aligned_b_)
            & ~p0__pa_sign_eq_pb_sign_
          : _aligned_b_minus_aligned_a_[0] & _GEN_22;	// rope_apply.k:67:9, :199:21, :202:31, :206:{25,29}, :209:35, :214:35
  wire  [15:0] sum_15 =
    {sum,
     sum_0,
     sum_1,
     sum_2,
     sum_3,
     sum_4,
     sum_5,
     sum_6,
     sum_7,
     sum_8,
     sum_9,
     sum_10,
     sum_11,
     sum_12,
     sum_13,
     sum_14};	// rope_apply.k:199:21, :206:25
  wire  [7:0]  _GEN_24 = {sum, sum_0, sum_1, sum_2, sum_3, sum_4, sum_5, sum_6};	// rope_apply.k:199:21, :206:25, :222:29
  wire         tmp = sum ? sum_7 | (|_GEN_24) : sum_7 & ~(|_GEN_24);	// rope_apply.k:199:21, :206:25, :222:{25,29,52,58}
  wire         tmp_0 = sum_0 ? sum_8 | (|_GEN_24) : sum_8 & ~(|_GEN_24);	// rope_apply.k:199:21, :206:25, :222:{25,29,52,58}
  wire         tmp_1 = sum_1 ? sum_9 | (|_GEN_24) : sum_9 & ~(|_GEN_24);	// rope_apply.k:199:21, :206:25, :222:{25,29,52,58}
  wire         tmp_2 = sum_2 ? sum_10 | (|_GEN_24) : sum_10 & ~(|_GEN_24);	// rope_apply.k:199:21, :206:25, :222:{25,29,52,58}
  wire         tmp_3 = sum_3 ? sum_11 | (|_GEN_24) : sum_11 & ~(|_GEN_24);	// rope_apply.k:199:21, :206:25, :222:{25,29,52,58}
  wire         tmp_4 = sum_4 ? sum_12 | (|_GEN_24) : sum_12 & ~(|_GEN_24);	// rope_apply.k:199:21, :206:25, :222:{25,29,52,58}
  wire         tmp_5 = sum_5 ? sum_13 | (|_GEN_24) : sum_13 & ~(|_GEN_24);	// rope_apply.k:199:21, :206:25, :222:{25,29,52,58}
  wire         tmp_6 = sum_6 ? sum_14 | (|_GEN_24) : sum_14 & ~(|_GEN_24);	// rope_apply.k:199:21, :206:25, :222:{25,29,52,58}
  wire         tmp_7 =
    p0_tmp[7] ? p0_tmp[3] | (|p0__tmp_and_240_) : p0_tmp[3] & ~(|p0__tmp_and_240_);	// rope_apply.k:67:9, :223:{25,29,52,58}
  wire         tmp_8 =
    p0_tmp[6] ? p0_tmp[2] | (|p0__tmp_and_240_) : p0_tmp[2] & ~(|p0__tmp_and_240_);	// rope_apply.k:67:9, :223:{25,29,52,58}
  wire         pos = tmp_7 | tmp_8;	// rope_apply.k:222:25, :223:{25,52,58,74}, :224:{25,29,52,58,74}, :225:{25,29,58}
  wire         pos_0 =
    (p0_tmp[5] ? p0_tmp[1] | (|p0__tmp_and_240_) : p0_tmp[1] & ~(|p0__tmp_and_240_))
    & ~tmp_8 | tmp_7;	// rope_apply.k:67:9, :222:25, :223:{25,29,52,58,74}, :224:{25,29,52,58,74}, :225:{25,29,58}
  wire  [15:0] pos_1 = {12'h0, p0__tmp_and_65280_ne_0_, |p0__tmp_and_240_, pos, pos_0};	// rope_apply.k:67:9, :222:25, :223:{25,29,74}, :224:{25,29,52,58,74}, :225:{25,29,58}
  wire         _pos_gt_11_ = pos_1 > 16'hB;	// rope_apply.k:222:25, :223:{25,74}, :224:{25,29,52,58,74}, :225:{25,29,58}, :229:29
  wire         _pos_lt_11_ = pos_1 < 16'hB;	// rope_apply.k:222:25, :223:{25,74}, :224:{25,29,52,58,74}, :225:{25,29,58}, :234:34
  wire  [15:0] _11_minus_pos_ = 16'(16'hB - pos_1);	// rope_apply.k:222:25, :223:{25,74}, :224:{25,29,52,58,74}, :225:{25,29,58}, :236:43
  wire  [15:0] _sr_exp_plus_pos_minus_11_ = 16'(p0_sr_exp_0 + 16'(pos_1 - 16'hB));	// rope_apply.k:67:9, :222:25, :223:{25,74}, :224:{25,29,52,58,74}, :225:{25,29,58}, :231:{40,49}
  wire  [15:0] _sum_shr_pos_minus_7_ =
    p0_sum
    >> 16'({12'h0, p0__tmp_and_65280_ne_0_, |p0__tmp_and_240_, pos, pos_0} - 16'h7);	// rope_apply.k:67:9, :222:25, :223:{25,29,74}, :224:{25,29,52,58,74}, :225:{25,29,58}, :232:{38,46}
  wire         _diff_ge_sr_exp_ = _11_minus_pos_ >= p0_sr_exp_0;	// rope_apply.k:67:9, :236:43, :237:33
  wire  [15:0] _sr_exp_minus_diff_ = 16'(p0_sr_exp_0 - _11_minus_pos_);	// rope_apply.k:67:9, :236:43, :243:44
  wire         _GEN_25 = ~(_11_minus_pos_[3]) | ~(_11_minus_pos_[2]);	// rope_apply.k:236:43, :246:{29,33,62}, :247:{29,33,62}
  wire         _GEN_26 = _11_minus_pos_[3] ^ _11_minus_pos_[2];	// rope_apply.k:236:43, :246:{29,33,62}, :247:{29,33,62}
  wire         _GEN_27 = ~(_11_minus_pos_[3]) & _11_minus_pos_[2];	// rope_apply.k:236:43, :246:{29,33,62}, :247:{29,33,62}
  wire         _GEN_28 = ~(_11_minus_pos_[3]) & ~(_11_minus_pos_[2]);	// rope_apply.k:236:43, :246:{29,33,62}, :247:{29,33,62}
  wire         shifted =
    p0_sum[6]
      ? (p0_sum[2]
           ? (p0_sum[10] ? _GEN_25 : _GEN_26)
           : p0_sum[10] ? ~(_11_minus_pos_[3]) : _GEN_27)
      : p0_sum[2]
          ? (p0_sum[10] | _11_minus_pos_[3]) & ~(_11_minus_pos_[2])
          : p0_sum[10] & _GEN_28;	// rope_apply.k:67:9, :236:43, :246:{29,33,62}, :247:{29,33,62}
  wire         shifted_0 =
    p0_sum[5]
      ? (p0_sum[1]
           ? (p0_sum[9] ? _GEN_25 : _GEN_26)
           : p0_sum[9] ? ~(_11_minus_pos_[3]) : _GEN_27)
      : p0_sum[1]
          ? (p0_sum[9] | _11_minus_pos_[3]) & ~(_11_minus_pos_[2])
          : p0_sum[9] & _GEN_28;	// rope_apply.k:67:9, :236:43, :246:{29,33,62}, :247:{29,33,62}
  wire         shifted_1 =
    p0_sum[4]
      ? (p0_sum[0]
           ? (p0_sum[8] ? _GEN_25 : _GEN_26)
           : p0_sum[8] ? ~(_11_minus_pos_[3]) : _GEN_27)
      : p0_sum[0]
          ? (p0_sum[8] | _11_minus_pos_[3]) & ~(_11_minus_pos_[2])
          : p0_sum[8] & _GEN_28;	// rope_apply.k:67:9, :236:43, :246:{29,33,62}, :247:{29,33,62}
  wire         shifted_2 =
    p0_sum[3] ? (p0_sum[7] ? ~(_11_minus_pos_[3]) : _GEN_27) : p0_sum[7] & _GEN_28;	// rope_apply.k:67:9, :236:43, :246:{29,33,62}, :247:{29,33,62}
  wire         shifted_3 =
    p0_sum[2] ? (p0_sum[6] ? ~(_11_minus_pos_[3]) : _GEN_27) : p0_sum[6] & _GEN_28;	// rope_apply.k:67:9, :236:43, :246:{29,33,62}, :247:{29,33,62}
  wire         shifted_4 =
    p0_sum[1] ? (p0_sum[5] ? ~(_11_minus_pos_[3]) : _GEN_27) : p0_sum[5] & _GEN_28;	// rope_apply.k:67:9, :236:43, :246:{29,33,62}, :247:{29,33,62}
  wire         shifted_5 =
    p0_sum[0] ? (p0_sum[4] ? ~(_11_minus_pos_[3]) : _GEN_27) : p0_sum[4] & _GEN_28;	// rope_apply.k:67:9, :236:43, :246:{29,33,62}, :247:{29,33,62}
  wire         shifted_6 = p0_sum[3] & _GEN_28;	// rope_apply.k:67:9, :246:{29,33,62}, :247:{29,33,62}
  wire         shifted_7 = p0_sum[2] & _GEN_28;	// rope_apply.k:67:9, :246:{29,33,62}, :247:{29,33,62}
  wire         _GEN_29 = _11_minus_pos_[1] | _11_minus_pos_[0];	// rope_apply.k:236:43, :248:{29,33,62}, :249:{29,33,62}, :250:{29,38}
  wire         _GEN_30 = _11_minus_pos_[1] ^ ~(_11_minus_pos_[0]);	// rope_apply.k:236:43, :248:{29,33,62}, :249:{29,33,62}, :250:{29,38}
  wire         _GEN_31 = _11_minus_pos_[1] & _11_minus_pos_[0];	// rope_apply.k:236:43, :248:{29,33,62}, :249:{29,33,62}, :250:{29,38}
  wire         _GEN_32 = ~(_11_minus_pos_[1]) | ~(_11_minus_pos_[0]);	// rope_apply.k:236:43, :248:{29,33,62}, :249:{29,33,62}, :250:{29,38}
  wire         _GEN_33 = _11_minus_pos_[1] ^ _11_minus_pos_[0];	// rope_apply.k:236:43, :248:{29,33,62}, :249:{29,33,62}, :250:{29,38}
  wire         _GEN_34 = ~(_11_minus_pos_[1]) & _11_minus_pos_[0];	// rope_apply.k:236:43, :248:{29,33,62}, :249:{29,33,62}, :250:{29,38}
  wire         _GEN_35 = ~(_11_minus_pos_[1]) & ~(_11_minus_pos_[0]);	// rope_apply.k:236:43, :248:{29,33,62}, :249:{29,33,62}, :250:{29,38}
  wire         r_mant =
    shifted_2
      ? (shifted_0
           ? (shifted_1
                ? shifted | _GEN_29
                : shifted & ~(_11_minus_pos_[1]) | _11_minus_pos_[0])
           : shifted_1
               ? shifted & ~(_11_minus_pos_[0]) | _11_minus_pos_[1]
               : shifted ? _GEN_30 : _GEN_31)
      : shifted_0
          ? (shifted_1
               ? (shifted ? _GEN_32 : _GEN_33)
               : shifted ? ~(_11_minus_pos_[1]) : _GEN_34)
          : shifted_1
              ? (shifted | _11_minus_pos_[1]) & ~(_11_minus_pos_[0])
              : shifted & _GEN_35;	// rope_apply.k:236:43, :246:{29,33,62}, :247:{29,33,62}, :248:{29,33,62}, :249:{29,33,62}, :250:{29,38}
  wire         r_mant_0 =
    shifted_3
      ? (shifted_1
           ? (shifted_2
                ? shifted_0 | _GEN_29
                : shifted_0 & ~(_11_minus_pos_[1]) | _11_minus_pos_[0])
           : shifted_2
               ? shifted_0 & ~(_11_minus_pos_[0]) | _11_minus_pos_[1]
               : shifted_0 ? _GEN_30 : _GEN_31)
      : shifted_1
          ? (shifted_2
               ? (shifted_0 ? _GEN_32 : _GEN_33)
               : shifted_0 ? ~(_11_minus_pos_[1]) : _GEN_34)
          : shifted_2
              ? (shifted_0 | _11_minus_pos_[1]) & ~(_11_minus_pos_[0])
              : shifted_0 & _GEN_35;	// rope_apply.k:236:43, :246:{29,33,62}, :247:{29,33,62}, :248:{29,33,62}, :249:{29,33,62}, :250:{29,38}
  wire         r_mant_1 =
    shifted_4
      ? (shifted_2
           ? (shifted_3
                ? shifted_1 | _GEN_29
                : shifted_1 & ~(_11_minus_pos_[1]) | _11_minus_pos_[0])
           : shifted_3
               ? shifted_1 & ~(_11_minus_pos_[0]) | _11_minus_pos_[1]
               : shifted_1 ? _GEN_30 : _GEN_31)
      : shifted_2
          ? (shifted_3
               ? (shifted_1 ? _GEN_32 : _GEN_33)
               : shifted_1 ? ~(_11_minus_pos_[1]) : _GEN_34)
          : shifted_3
              ? (shifted_1 | _11_minus_pos_[1]) & ~(_11_minus_pos_[0])
              : shifted_1 & _GEN_35;	// rope_apply.k:236:43, :246:{29,33,62}, :247:{29,33,62}, :248:{29,33,62}, :249:{29,33,62}, :250:{29,38}
  wire         r_mant_2 =
    shifted_5
      ? (shifted_3
           ? (shifted_4
                ? shifted_2 | _GEN_29
                : shifted_2 & ~(_11_minus_pos_[1]) | _11_minus_pos_[0])
           : shifted_4
               ? shifted_2 & ~(_11_minus_pos_[0]) | _11_minus_pos_[1]
               : shifted_2 ? _GEN_30 : _GEN_31)
      : shifted_3
          ? (shifted_4
               ? (shifted_2 ? _GEN_32 : _GEN_33)
               : shifted_2 ? ~(_11_minus_pos_[1]) : _GEN_34)
          : shifted_4
              ? (shifted_2 | _11_minus_pos_[1]) & ~(_11_minus_pos_[0])
              : shifted_2 & _GEN_35;	// rope_apply.k:236:43, :246:{29,33,62}, :247:{29,33,62}, :248:{29,33,62}, :249:{29,33,62}, :250:{29,38}
  wire         r_mant_3 =
    shifted_6
      ? (shifted_4
           ? (shifted_5
                ? shifted_3 | _GEN_29
                : shifted_3 & ~(_11_minus_pos_[1]) | _11_minus_pos_[0])
           : shifted_5
               ? shifted_3 & ~(_11_minus_pos_[0]) | _11_minus_pos_[1]
               : shifted_3 ? _GEN_30 : _GEN_31)
      : shifted_4
          ? (shifted_5
               ? (shifted_3 ? _GEN_32 : _GEN_33)
               : shifted_3 ? ~(_11_minus_pos_[1]) : _GEN_34)
          : shifted_5
              ? (shifted_3 | _11_minus_pos_[1]) & ~(_11_minus_pos_[0])
              : shifted_3 & _GEN_35;	// rope_apply.k:236:43, :246:{29,33,62}, :247:{29,33,62}, :248:{29,33,62}, :249:{29,33,62}, :250:{29,38}
  wire         r_mant_4 =
    shifted_7
      ? (shifted_5
           ? (shifted_6
                ? shifted_4 | _GEN_29
                : shifted_4 & ~(_11_minus_pos_[1]) | _11_minus_pos_[0])
           : shifted_6
               ? shifted_4 & ~(_11_minus_pos_[0]) | _11_minus_pos_[1]
               : shifted_4 ? _GEN_30 : _GEN_31)
      : shifted_5
          ? (shifted_6
               ? (shifted_4 ? _GEN_32 : _GEN_33)
               : shifted_4 ? ~(_11_minus_pos_[1]) : _GEN_34)
          : shifted_6
              ? (shifted_4 | _11_minus_pos_[1]) & ~(_11_minus_pos_[0])
              : shifted_4 & _GEN_35;	// rope_apply.k:236:43, :246:{29,33,62}, :247:{29,33,62}, :248:{29,33,62}, :249:{29,33,62}, :250:{29,38}
  wire         r_mant_5 =
    p0_sum[1] & _GEN_28
      ? (shifted_6
           ? (shifted_7
                ? shifted_5 | _GEN_29
                : shifted_5 & ~(_11_minus_pos_[1]) | _11_minus_pos_[0])
           : shifted_7
               ? shifted_5 & ~(_11_minus_pos_[0]) | _11_minus_pos_[1]
               : shifted_5 ? _GEN_30 : _GEN_31)
      : shifted_6
          ? (shifted_7
               ? (shifted_5 ? _GEN_32 : _GEN_33)
               : shifted_5 ? ~(_11_minus_pos_[1]) : _GEN_34)
          : shifted_7
              ? (shifted_5 | _11_minus_pos_[1]) & ~(_11_minus_pos_[0])
              : shifted_5 & _GEN_35;	// rope_apply.k:67:9, :236:43, :246:{29,33,62}, :247:{29,33,62}, :248:{29,33,62}, :249:{29,33,62}, :250:{29,38}
  wire         _GEN_36 = _pos_lt_11_ | _pos_gt_11_;	// rope_apply.k:229:{25,29}, :234:{30,34}, :237:29
  wire         _GEN_37 = ~_diff_ge_sr_exp_ & _pos_lt_11_;	// rope_apply.k:229:25, :234:{30,34}, :237:{29,33}
  wire         _GEN_38 = ~_diff_ge_sr_exp_ & _pos_lt_11_ & ~_pos_gt_11_;	// rope_apply.k:229:{25,29}, :234:{30,34}, :237:{29,33}
  wire         norm_exp =
    _sr_exp_plus_pos_minus_11_[8]
      ? _sr_exp_minus_diff_[8] & _GEN_37 | _pos_gt_11_
      : _sr_exp_minus_diff_[8] & _GEN_38;	// rope_apply.k:229:{25,29}, :231:{40,49}, :234:30, :237:29, :243:44
  wire         _GEN_39 = ~_pos_lt_11_ & ~_pos_gt_11_;	// rope_apply.k:229:{25,29}, :234:{30,34}, :237:29
  wire         norm_exp_0 =
    _sr_exp_plus_pos_minus_11_[7]
      ? (~(_sr_exp_minus_diff_[7]) | _diff_ge_sr_exp_
           ? p0_sr_exp_0[7] & ~_pos_lt_11_ | _pos_gt_11_
           : p0_sr_exp_0[7] | _GEN_36)
      : ~(_sr_exp_minus_diff_[7]) | _diff_ge_sr_exp_
          ? p0_sr_exp_0[7] & _GEN_39
          : (p0_sr_exp_0[7] | _pos_lt_11_) & ~_pos_gt_11_;	// rope_apply.k:67:9, :229:{25,29}, :231:{40,49}, :234:{30,34}, :237:{29,33}, :243:44
  wire         norm_exp_1 =
    _sr_exp_plus_pos_minus_11_[6]
      ? (~(_sr_exp_minus_diff_[6]) | _diff_ge_sr_exp_
           ? p0_sr_exp_0[6] & ~_pos_lt_11_ | _pos_gt_11_
           : p0_sr_exp_0[6] | _GEN_36)
      : ~(_sr_exp_minus_diff_[6]) | _diff_ge_sr_exp_
          ? p0_sr_exp_0[6] & _GEN_39
          : (p0_sr_exp_0[6] | _pos_lt_11_) & ~_pos_gt_11_;	// rope_apply.k:67:9, :229:{25,29}, :231:{40,49}, :234:{30,34}, :237:{29,33}, :243:44
  wire         norm_exp_2 =
    _sr_exp_plus_pos_minus_11_[5]
      ? (~(_sr_exp_minus_diff_[5]) | _diff_ge_sr_exp_
           ? p0_sr_exp_0[5] & ~_pos_lt_11_ | _pos_gt_11_
           : p0_sr_exp_0[5] | _GEN_36)
      : ~(_sr_exp_minus_diff_[5]) | _diff_ge_sr_exp_
          ? p0_sr_exp_0[5] & _GEN_39
          : (p0_sr_exp_0[5] | _pos_lt_11_) & ~_pos_gt_11_;	// rope_apply.k:67:9, :229:{25,29}, :231:{40,49}, :234:{30,34}, :237:{29,33}, :243:44
  wire         norm_exp_3 =
    _sr_exp_plus_pos_minus_11_[4]
      ? (~(_sr_exp_minus_diff_[4]) | _diff_ge_sr_exp_
           ? p0_sr_exp_0[4] & ~_pos_lt_11_ | _pos_gt_11_
           : p0_sr_exp_0[4] | _GEN_36)
      : ~(_sr_exp_minus_diff_[4]) | _diff_ge_sr_exp_
          ? p0_sr_exp_0[4] & _GEN_39
          : (p0_sr_exp_0[4] | _pos_lt_11_) & ~_pos_gt_11_;	// rope_apply.k:67:9, :229:{25,29}, :231:{40,49}, :234:{30,34}, :237:{29,33}, :243:44
  wire         norm_exp_4 =
    _sr_exp_plus_pos_minus_11_[3]
      ? (~(_sr_exp_minus_diff_[3]) | _diff_ge_sr_exp_
           ? p0_sr_exp_0[3] & ~_pos_lt_11_ | _pos_gt_11_
           : p0_sr_exp_0[3] | _GEN_36)
      : ~(_sr_exp_minus_diff_[3]) | _diff_ge_sr_exp_
          ? p0_sr_exp_0[3] & _GEN_39
          : (p0_sr_exp_0[3] | _pos_lt_11_) & ~_pos_gt_11_;	// rope_apply.k:67:9, :229:{25,29}, :231:{40,49}, :234:{30,34}, :237:{29,33}, :243:44
  wire         norm_exp_5 =
    _sr_exp_plus_pos_minus_11_[2]
      ? (~(_sr_exp_minus_diff_[2]) | _diff_ge_sr_exp_
           ? p0_sr_exp_0[2] & ~_pos_lt_11_ | _pos_gt_11_
           : p0_sr_exp_0[2] | _GEN_36)
      : ~(_sr_exp_minus_diff_[2]) | _diff_ge_sr_exp_
          ? p0_sr_exp_0[2] & _GEN_39
          : (p0_sr_exp_0[2] | _pos_lt_11_) & ~_pos_gt_11_;	// rope_apply.k:67:9, :229:{25,29}, :231:{40,49}, :234:{30,34}, :237:{29,33}, :243:44
  wire         norm_exp_6 =
    _sr_exp_plus_pos_minus_11_[1]
      ? (~(_sr_exp_minus_diff_[1]) | _diff_ge_sr_exp_
           ? p0_sr_exp_0[1] & ~_pos_lt_11_ | _pos_gt_11_
           : p0_sr_exp_0[1] | _GEN_36)
      : ~(_sr_exp_minus_diff_[1]) | _diff_ge_sr_exp_
          ? p0_sr_exp_0[1] & _GEN_39
          : (p0_sr_exp_0[1] | _pos_lt_11_) & ~_pos_gt_11_;	// rope_apply.k:67:9, :229:{25,29}, :231:{40,49}, :234:{30,34}, :237:{29,33}, :243:44
  wire         norm_exp_7 =
    _sr_exp_plus_pos_minus_11_[0]
      ? (~(_sr_exp_minus_diff_[0]) | _diff_ge_sr_exp_
           ? p0_sr_exp_0[0] & ~_pos_lt_11_ | _pos_gt_11_
           : p0_sr_exp_0[0] | _GEN_36)
      : ~(_sr_exp_minus_diff_[0]) | _diff_ge_sr_exp_
          ? p0_sr_exp_0[0] & _GEN_39
          : (p0_sr_exp_0[0] | _pos_lt_11_) & ~_pos_gt_11_;	// rope_apply.k:67:9, :229:{25,29}, :231:{40,49}, :234:{30,34}, :237:{29,33}, :243:44
  wire  [15:0] norm_exp_8 =
    {_sr_exp_plus_pos_minus_11_[15]
       ? _sr_exp_minus_diff_[15] & _GEN_37 | _pos_gt_11_
       : _sr_exp_minus_diff_[15] & _GEN_38,
     _sr_exp_plus_pos_minus_11_[14]
       ? _sr_exp_minus_diff_[14] & _GEN_37 | _pos_gt_11_
       : _sr_exp_minus_diff_[14] & _GEN_38,
     _sr_exp_plus_pos_minus_11_[13]
       ? _sr_exp_minus_diff_[13] & _GEN_37 | _pos_gt_11_
       : _sr_exp_minus_diff_[13] & _GEN_38,
     _sr_exp_plus_pos_minus_11_[12]
       ? _sr_exp_minus_diff_[12] & _GEN_37 | _pos_gt_11_
       : _sr_exp_minus_diff_[12] & _GEN_38,
     _sr_exp_plus_pos_minus_11_[11]
       ? _sr_exp_minus_diff_[11] & _GEN_37 | _pos_gt_11_
       : _sr_exp_minus_diff_[11] & _GEN_38,
     _sr_exp_plus_pos_minus_11_[10]
       ? _sr_exp_minus_diff_[10] & _GEN_37 | _pos_gt_11_
       : _sr_exp_minus_diff_[10] & _GEN_38,
     _sr_exp_plus_pos_minus_11_[9]
       ? _sr_exp_minus_diff_[9] & _GEN_37 | _pos_gt_11_
       : _sr_exp_minus_diff_[9] & _GEN_38,
     norm_exp,
     norm_exp_0,
     norm_exp_1,
     norm_exp_2,
     norm_exp_3,
     norm_exp_4,
     norm_exp_5,
     norm_exp_6,
     norm_exp_7};	// rope_apply.k:229:{25,29}, :231:{40,49}, :234:30, :237:29, :243:44
  wire         _norm_exp_lt_255_ = norm_exp_8 < 16'hFF;	// rope_apply.k:229:25, :234:30, :237:29, :258:54
  wire         _sr_sign_shl_15_or_norm_exp_shl_7_or_r_mant_ =
    norm_exp
    | (p0_pa_sign_0
         ? p0_pb_sign_0 | p0__aligned_a_ge_aligned_b_ | p0__pa_sign_eq_pb_sign__0
         : p0_pb_sign_0 & ~p0__aligned_a_ge_aligned_b_ & ~p0__pa_sign_eq_pb_sign__0);	// rope_apply.k:67:9, :199:21, :206:25, :229:25, :232:{29,38}, :234:30, :237:29, :255:{29,38}, :260:{38,54,56}
  wire         _sr_sign_shl_15_or_norm_exp_shl_7_or_r_mant__0 =
    _sum_shr_pos_minus_7_[6]
      ? (r_mant ? p0_sum[10] | _GEN_36 : p0_sum[10] & ~_pos_lt_11_ | _pos_gt_11_)
      : r_mant ? (p0_sum[10] | _pos_lt_11_) & ~_pos_gt_11_ : p0_sum[10] & _GEN_39;	// rope_apply.k:67:9, :199:21, :206:25, :229:{25,29}, :232:{29,38}, :234:{30,34}, :237:29, :248:{29,33,62}, :249:{29,33,62}, :250:{29,38}, :255:{29,38}, :260:{38,54,56}
  wire         _sr_sign_shl_15_or_norm_exp_shl_7_or_r_mant__1 =
    _sum_shr_pos_minus_7_[5]
      ? (r_mant_0 ? p0_sum[9] | _GEN_36 : p0_sum[9] & ~_pos_lt_11_ | _pos_gt_11_)
      : r_mant_0 ? (p0_sum[9] | _pos_lt_11_) & ~_pos_gt_11_ : p0_sum[9] & _GEN_39;	// rope_apply.k:67:9, :199:21, :206:25, :229:{25,29}, :232:{29,38}, :234:{30,34}, :237:29, :248:{29,33,62}, :249:{29,33,62}, :250:{29,38}, :255:{29,38}, :260:{38,54,56}
  wire         _sr_sign_shl_15_or_norm_exp_shl_7_or_r_mant__2 =
    _sum_shr_pos_minus_7_[4]
      ? (r_mant_1 ? p0_sum[8] | _GEN_36 : p0_sum[8] & ~_pos_lt_11_ | _pos_gt_11_)
      : r_mant_1 ? (p0_sum[8] | _pos_lt_11_) & ~_pos_gt_11_ : p0_sum[8] & _GEN_39;	// rope_apply.k:67:9, :199:21, :206:25, :229:{25,29}, :232:{29,38}, :234:{30,34}, :237:29, :248:{29,33,62}, :249:{29,33,62}, :250:{29,38}, :255:{29,38}, :260:{38,54,56}
  wire         _sr_sign_shl_15_or_norm_exp_shl_7_or_r_mant__3 =
    _sum_shr_pos_minus_7_[3]
      ? (r_mant_2 ? p0_sum[7] | _GEN_36 : p0_sum[7] & ~_pos_lt_11_ | _pos_gt_11_)
      : r_mant_2 ? (p0_sum[7] | _pos_lt_11_) & ~_pos_gt_11_ : p0_sum[7] & _GEN_39;	// rope_apply.k:67:9, :199:21, :206:25, :229:{25,29}, :232:{29,38}, :234:{30,34}, :237:29, :248:{29,33,62}, :249:{29,33,62}, :250:{29,38}, :255:{29,38}, :260:{38,54,56}
  wire         _sr_sign_shl_15_or_norm_exp_shl_7_or_r_mant__4 =
    _sum_shr_pos_minus_7_[2]
      ? (r_mant_3 ? p0_sum[6] | _GEN_36 : p0_sum[6] & ~_pos_lt_11_ | _pos_gt_11_)
      : r_mant_3 ? (p0_sum[6] | _pos_lt_11_) & ~_pos_gt_11_ : p0_sum[6] & _GEN_39;	// rope_apply.k:67:9, :199:21, :206:25, :229:{25,29}, :232:{29,38}, :234:{30,34}, :237:29, :248:{29,33,62}, :249:{29,33,62}, :250:{29,38}, :255:{29,38}, :260:{38,54,56}
  wire         _sr_sign_shl_15_or_norm_exp_shl_7_or_r_mant__5 =
    _sum_shr_pos_minus_7_[1]
      ? (r_mant_4 ? p0_sum[5] | _GEN_36 : p0_sum[5] & ~_pos_lt_11_ | _pos_gt_11_)
      : r_mant_4 ? (p0_sum[5] | _pos_lt_11_) & ~_pos_gt_11_ : p0_sum[5] & _GEN_39;	// rope_apply.k:67:9, :199:21, :206:25, :229:{25,29}, :232:{29,38}, :234:{30,34}, :237:29, :248:{29,33,62}, :249:{29,33,62}, :250:{29,38}, :255:{29,38}, :260:{38,54,56}
  wire         _sr_sign_shl_15_or_norm_exp_shl_7_or_r_mant__6 =
    _sum_shr_pos_minus_7_[0]
      ? (r_mant_5 ? p0_sum[4] | _GEN_36 : p0_sum[4] & ~_pos_lt_11_ | _pos_gt_11_)
      : r_mant_5 ? (p0_sum[4] | _pos_lt_11_) & ~_pos_gt_11_ : p0_sum[4] & _GEN_39;	// rope_apply.k:67:9, :199:21, :206:25, :229:{25,29}, :232:{29,38}, :234:{30,34}, :237:29, :248:{29,33,62}, :249:{29,33,62}, :250:{29,38}, :255:{29,38}, :260:{38,54,56}
  wire         _GEN_40 = _norm_exp_lt_255_ & (|norm_exp_8) & p0__sum_ne_0_;	// rope_apply.k:67:9, :161:22, :218:21, :229:25, :234:30, :237:29, :258:{25,29,38,54}
  wire         _GEN_41 =
    _norm_exp_lt_255_ & (|norm_exp_8) & p0__sum_ne_0_ & ~p0__pb_exp_eq_0__0;	// rope_apply.k:67:9, :161:22, :218:21, :229:25, :234:30, :237:29, :258:{25,29,38,54}
  always @(posedge clk) begin	// rope_apply.k:67:9
    p0_x_even <= data_in_10[15:0];	// rope_apply.k:67:9
    p0_x_odd <= data_in_10[31:16];	// rope_apply.k:67:9
    p0_cos_val <= data_in_10[47:32];	// rope_apply.k:67:9
    p0_sin_val <= data_in_10[63:48];	// rope_apply.k:67:9
    if (rst)	// rope_apply.k:67:9
      p0_stage1_enable <= 1'h0;	// rope_apply.k:67:9
    else	// rope_apply.k:67:9
      p0_stage1_enable <= _GEN & input_valid_0;	// rope_apply.k:67:9
    p0__prod_plus_ma32_shl_4_ <=
      13'({1'h0,
           prod_55,
           prod_56,
           prod_57,
           prod_58,
           prod_59,
           prod_60,
           prod_61,
           prod_62,
           prod_63,
           prod_64,
           prod_65,
           prod_66} + {2'h1, p0_x_even[6:0], 4'h0});	// rope_apply.k:67:9, :85:{21,25}, :86:{51,58}
    p0_mb <= p0_cos_val[5:0];	// rope_apply.k:67:9
    p0_prod <=
      {prod_55,
       prod_56,
       prod_57,
       prod_58,
       prod_59,
       prod_60,
       prod_61,
       prod_62,
       prod_63,
       prod_64,
       prod_65,
       prod_66};	// rope_apply.k:67:9, :85:{21,25}
    p0__prod_plus_ma32_shl_4__0 <=
      13'({1'h0,
           prod_67,
           prod_68,
           prod_69,
           prod_70,
           prod_71,
           prod_72,
           prod_73,
           prod_74,
           prod_75,
           prod_76,
           prod_77,
           prod_78} + {2'h1, p0_x_odd[6:0], 4'h0});	// rope_apply.k:67:9, :124:{21,25}, :125:{51,58}
    p0_mb_0 <= p0_sin_val[5:0];	// rope_apply.k:67:9
    p0_prod_0 <=
      {prod_67,
       prod_68,
       prod_69,
       prod_70,
       prod_71,
       prod_72,
       prod_73,
       prod_74,
       prod_75,
       prod_76,
       prod_77,
       prod_78};	// rope_apply.k:67:9, :124:{21,25}
    p0__ma32_shl_5_ <= {2'h1, p0_x_even[6:0], 5'h0};	// rope_apply.k:67:9, :87:58
    p0__ma32_shl_5__0 <= {2'h1, p0_x_odd[6:0], 5'h0};	// rope_apply.k:67:9, :126:58
    p0__ma32_shl_6_ <= {2'h1, p0_x_even[6:0], 6'h0};	// rope_apply.k:67:9, :88:58
    p0__ma32_shl_6__0 <= {2'h1, p0_x_odd[6:0], 6'h0};	// rope_apply.k:67:9, :127:58
    p0_mb_1 <= p0_cos_val[6];	// rope_apply.k:67:9, :79:{21,33}
    p0_mb_2 <= p0_sin_val[6];	// rope_apply.k:67:9, :118:{21,33}
    p0__ma32_shl_7_ <= {2'h1, p0_x_even[6:0], 7'h0};	// rope_apply.k:67:9, :89:58
    p0__ma32_shl_7__0 <= {2'h1, p0_x_odd[6:0], 7'h0};	// rope_apply.k:67:9, :128:58
    p0__a_exp_plus_b_exp_minus_127_plus_1_ <= 16'(_a_exp_plus_b_exp_ - 16'h7E);	// rope_apply.k:67:9, :95:{33,39,47}, :100:39
    p0__a_exp_plus_b_exp_minus_127_ <= 16'(_a_exp_plus_b_exp_ - 16'h7F);	// rope_apply.k:67:9, :95:39, :100:{33,39}
    p0__a_exp_plus_b_exp_minus_127_plus_1__0 <= 16'(_a_exp_plus_b_exp__0 - 16'h7E);	// rope_apply.k:67:9, :134:{33,39,47}, :139:39
    p0__a_exp_plus_b_exp_minus_127__0 <= 16'(_a_exp_plus_b_exp__0 - 16'h7F);	// rope_apply.k:67:9, :134:39, :139:{33,39}
    p0_cos_val_0 <= p0_cos_val;	// rope_apply.k:67:9
    p0_x_even_0 <= p0_x_even;	// rope_apply.k:67:9
    p0_sin_val_0 <= p0_sin_val;	// rope_apply.k:67:9
    p0_x_odd_0 <= p0_x_odd;	// rope_apply.k:67:9
    p0__b_exp_ne_0_ <= |(p0_cos_val[14:7]);	// rope_apply.k:67:9, :74:{17,32}, :75:41
    p0__a_exp_ne_0_ <= |(p0_x_even[14:7]);	// rope_apply.k:67:9, :73:{17,32}, :75:27
    p0__b_exp_ne_0__0 <= |(p0_sin_val[14:7]);	// rope_apply.k:67:9, :113:{17,32}, :114:41
    p0__a_exp_ne_0__0 <= |(p0_x_odd[14:7]);	// rope_apply.k:67:9, :112:{17,32}, :114:27
    if (rst)	// rope_apply.k:67:9
      p0_stage2_enable <= 1'h0;	// rope_apply.k:67:9
    else	// rope_apply.k:67:9
      p0_stage2_enable <= p0_stage1_enable;	// rope_apply.k:67:9
    p0_prod_1 <= _prod_plus_ma32_shl_7_[15];	// rope_apply.k:67:9, :89:{21,51}
    p0__a_exp_plus_b_exp_minus_127_plus_1__1 <= p0__a_exp_plus_b_exp_minus_127_plus_1_;	// rope_apply.k:67:9
    p0__a_exp_plus_b_exp_minus_127__1 <= p0__a_exp_plus_b_exp_minus_127_;	// rope_apply.k:67:9
    p0_prod_2 <= _prod_plus_ma32_shl_7__0[15];	// rope_apply.k:67:9, :128:{21,51}
    p0__a_exp_plus_b_exp_minus_127_plus_1__2 <= p0__a_exp_plus_b_exp_minus_127_plus_1__0;	// rope_apply.k:67:9
    p0__a_exp_plus_b_exp_minus_127__2 <= p0__a_exp_plus_b_exp_minus_127__0;	// rope_apply.k:67:9
    p0_cos_val_1 <= p0_cos_val_0;	// rope_apply.k:67:9
    p0_x_even_1 <= p0_x_even_0;	// rope_apply.k:67:9
    p0_prod_3 <= _prod_plus_ma32_shl_7_[14:0];	// rope_apply.k:67:9, :89:51
    p0_sin_val_1 <= p0_sin_val_0;	// rope_apply.k:67:9
    p0_x_odd_1 <= p0_x_odd_0;	// rope_apply.k:67:9
    p0_prod_4 <= _prod_plus_ma32_shl_7__0[14:0];	// rope_apply.k:67:9, :128:51
    p0__b_exp_ne_0__1 <= p0__b_exp_ne_0_;	// rope_apply.k:67:9
    p0__a_exp_ne_0__1 <= p0__a_exp_ne_0_;	// rope_apply.k:67:9
    p0__b_exp_ne_0__2 <= p0__b_exp_ne_0__0;	// rope_apply.k:67:9
    p0__a_exp_ne_0__2 <= p0__a_exp_ne_0__0;	// rope_apply.k:67:9
    if (rst)	// rope_apply.k:67:9
      p0_stage3_enable <= 1'h0;	// rope_apply.k:67:9
    else	// rope_apply.k:67:9
      p0_stage3_enable <= p0_stage2_enable;	// rope_apply.k:67:9
    p0_aligned_b <=
      {~(shift[3]) & ~(shift[2]),
       p2_8 & _GEN_6,
       p2_9 & _GEN_6,
       p2_10 & _GEN_6,
       p2_11 ? ~(shift[3]) : _GEN_7,
       p2_8 ? (p2_12 ? ~(shift[3]) : _GEN_7) : p2_12 & _GEN_6,
       p2_9 ? (p2_13 ? ~(shift[3]) : _GEN_7) : p2_13 & _GEN_6,
       p2_10 ? (p2_14 ? ~(shift[3]) : _GEN_7) : p2_14 & _GEN_6,
       p2_11 ? _GEN_8 : _GEN_9,
       p2_12 ? (p2_8 ? _GEN_8 : _GEN_7) : p2_8 & _GEN_9,
       p2_13 ? (p2_9 ? _GEN_8 : _GEN_7) : p2_9 & _GEN_9,
       p2_14 ? (p2_10 ? _GEN_8 : _GEN_7) : p2_10 & _GEN_9};	// rope_apply.k:67:9, :114:{17,21}, :177:25, :179:{25,29,49,61}, :180:{25,29,49,61}
    p0_shift <= shift[1:0];	// rope_apply.k:67:9, :177:25
    p0_aligned_a <=
      {~(shift_0[3]) & ~(shift_0[2]),
       p1_8 & _GEN_10,
       p1_9 & _GEN_10,
       p1_10 & _GEN_10,
       p1_11 ? ~(shift_0[3]) : _GEN_11,
       p1_8 ? (p1_12 ? ~(shift_0[3]) : _GEN_11) : p1_12 & _GEN_10,
       p1_9 ? (p1_13 ? ~(shift_0[3]) : _GEN_11) : p1_13 & _GEN_10,
       p1_10 ? (p1_14 ? ~(shift_0[3]) : _GEN_11) : p1_14 & _GEN_10,
       p1_11 ? _GEN_12 : _GEN_13,
       p1_12 ? (p1_8 ? _GEN_12 : _GEN_11) : p1_8 & _GEN_13,
       p1_13 ? (p1_9 ? _GEN_12 : _GEN_11) : p1_9 & _GEN_13,
       p1_14 ? (p1_10 ? _GEN_12 : _GEN_11) : p1_10 & _GEN_13};	// rope_apply.k:67:9, :75:{17,21}, :189:25, :191:{25,29,49,61}, :192:{25,29,49,61}
    p0_shift_0 <= shift_0[1:0];	// rope_apply.k:67:9, :189:25
    p0__pa_exp_ge_pb_exp_ <= _pa_exp_ge_pb_exp_;	// rope_apply.k:67:9, :172:25
    p0__pa_mant_shl_4_ <= {p1_8, p1_9, p1_10, p1_11, p1_12, p1_13, p1_14, 4'h0};	// rope_apply.k:67:9, :75:{17,21}, :167:{21,38}, :175:37, :190:37
    p0__pb_mant_shl_4_ <= {p2_8, p2_9, p2_10, p2_11, p2_12, p2_13, p2_14, 4'h0};	// rope_apply.k:67:9, :114:{17,21}, :168:{21,38}, :178:37, :187:37
    p0__pa_sign_eq_pb_sign_ <= p1 == p2;	// rope_apply.k:67:9, :75:{17,21}, :114:{17,21}, :199:25
    p0_sr_exp <=
      {8'h0,
       p1_0 ? p2_0 | _pa_exp_ge_pb_exp_ : p2_0 & ~_pa_exp_ge_pb_exp_,
       p1_1 ? p2_1 | _pa_exp_ge_pb_exp_ : p2_1 & ~_pa_exp_ge_pb_exp_,
       p1_2 ? p2_2 | _pa_exp_ge_pb_exp_ : p2_2 & ~_pa_exp_ge_pb_exp_,
       p1_3 ? p2_3 | _pa_exp_ge_pb_exp_ : p2_3 & ~_pa_exp_ge_pb_exp_,
       p1_4 ? p2_4 | _pa_exp_ge_pb_exp_ : p2_4 & ~_pa_exp_ge_pb_exp_,
       p1_5 ? p2_5 | _pa_exp_ge_pb_exp_ : p2_5 & ~_pa_exp_ge_pb_exp_,
       p1_6 ? p2_6 | _pa_exp_ge_pb_exp_ : p2_6 & ~_pa_exp_ge_pb_exp_,
       p1_7 ? p2_7 | _pa_exp_ge_pb_exp_ : p2_7 & ~_pa_exp_ge_pb_exp_};	// rope_apply.k:67:9, :75:{17,21}, :77:{21,37,38,55}, :92:21, :94:{34,47}, :99:{34,47}, :102:{21,25}, :104:{30,45,47}, :114:{17,21}, :116:{21,37,38,39,55}, :131:21, :133:{34,47}, :138:{34,47}, :141:{21,25}, :143:{30,45,47}, :172:{21,25}
    p0_pa_sign <= p1;	// rope_apply.k:67:9, :75:{17,21}
    p0_pb_sign <= p2;	// rope_apply.k:67:9, :114:{17,21}
    p0_p1 <=
      {p1,
       p1_0,
       p1_1,
       p1_2,
       p1_3,
       p1_4,
       p1_5,
       p1_6,
       p1_7,
       p1_8,
       p1_9,
       p1_10,
       p1_11,
       p1_12,
       p1_13,
       p1_14};	// rope_apply.k:67:9, :75:{17,21}, :77:{21,37,38,55}, :92:21, :94:{34,47}, :99:{34,47}, :102:{21,25}, :104:{30,45,47}
    p0__pb_exp_eq_0_ <= {p2_0, p2_1, p2_2, p2_3, p2_4, p2_5, p2_6, p2_7} == 8'h0;	// rope_apply.k:67:9, :114:{17,21}, :116:{21,37,38,39,55}, :131:21, :133:{34,47}, :138:{34,47}, :141:{21,25}, :143:{30,45,47}, :153:{17,33}, :161:26
    p0__pa_exp_eq_0_ <= {p1_0, p1_1, p1_2, p1_3, p1_4, p1_5, p1_6, p1_7} == 8'h0;	// rope_apply.k:67:9, :75:{17,21}, :77:{21,37,38,55}, :92:21, :94:{34,47}, :99:{34,47}, :102:{21,25}, :104:{30,45,47}, :152:{17,33}, :157:21
    p0_p2 <=
      {p2,
       p2_0,
       p2_1,
       p2_2,
       p2_3,
       p2_4,
       p2_5,
       p2_6,
       p2_7,
       p2_8,
       p2_9,
       p2_10,
       p2_11,
       p2_12,
       p2_13,
       p2_14};	// rope_apply.k:67:9, :114:{17,21}, :116:{21,37,38,39,55}, :131:21, :133:{34,47}, :138:{34,47}, :141:{21,25}, :143:{30,45,47}
    if (rst)	// rope_apply.k:67:9
      p0_stage4_enable <= 1'h0;	// rope_apply.k:67:9
    else	// rope_apply.k:67:9
      p0_stage4_enable <= p0_stage3_enable;	// rope_apply.k:67:9
    p0__tmp_and_240_ <= {tmp, tmp_0, tmp_1, tmp_2, tmp_3, tmp_4, tmp_5, tmp_6} & 8'hF0;	// rope_apply.k:67:9, :222:{25,52,58}, :223:29
    p0_tmp <=
      {sum & ~(|_GEN_24),
       sum_0 & ~(|_GEN_24),
       sum_1 & ~(|_GEN_24),
       sum_2 & ~(|_GEN_24),
       sum_3 & ~(|_GEN_24),
       sum_4 & ~(|_GEN_24),
       sum_5 & ~(|_GEN_24),
       sum_6 & ~(|_GEN_24),
       tmp,
       tmp_0,
       tmp_1,
       tmp_2,
       tmp_3,
       tmp_4,
       tmp_5,
       tmp_6};	// rope_apply.k:67:9, :199:21, :206:25, :222:{25,29,52,58}
    p0__tmp_and_65280_ne_0_ <= |_GEN_24;	// rope_apply.k:67:9, :222:29
    p0_sr_exp_0 <= p0_sr_exp;	// rope_apply.k:67:9
    p0_sum <= sum_15;	// rope_apply.k:67:9, :199:21, :206:25
    p0_pa_sign_0 <= p0_pa_sign;	// rope_apply.k:67:9
    p0_pb_sign_0 <= p0_pb_sign;	// rope_apply.k:67:9
    p0__aligned_a_ge_aligned_b_ <= _aligned_a_ge_aligned_b_;	// rope_apply.k:67:9, :206:29
    p0__pa_sign_eq_pb_sign__0 <= p0__pa_sign_eq_pb_sign_;	// rope_apply.k:67:9
    p0_p1_0 <= p0_p1;	// rope_apply.k:67:9
    p0__sum_ne_0_ <= |sum_15;	// rope_apply.k:67:9, :199:21, :206:25, :218:25
    p0__pb_exp_eq_0__0 <= p0__pb_exp_eq_0_;	// rope_apply.k:67:9
    p0__pa_exp_eq_0__0 <= p0__pa_exp_eq_0_;	// rope_apply.k:67:9
    p0_p2_0 <= p0_p2;	// rope_apply.k:67:9
    if (rst)	// rope_apply.k:67:9
      p0_stage5_enable <= 1'h0;	// rope_apply.k:67:9
    else	// rope_apply.k:67:9
      p0_stage5_enable <= p0_stage4_enable;	// rope_apply.k:67:9
    p0__pa_exp_eq_0__1 <= p0__pa_exp_eq_0__0;	// rope_apply.k:67:9
    p0_p2_1 <= p0_p2_0;	// rope_apply.k:67:9
    p0_result <=
      {p0_p1_0[15]
         ? _sr_sign_shl_15_or_norm_exp_shl_7_or_r_mant_ & _GEN_40 | p0__pb_exp_eq_0__0
         : _sr_sign_shl_15_or_norm_exp_shl_7_or_r_mant_ & _GEN_41,
       p0_p1_0[14] ? norm_exp_0 & _GEN_40 | p0__pb_exp_eq_0__0 : norm_exp_0 & _GEN_41,
       p0_p1_0[13] ? norm_exp_1 & _GEN_40 | p0__pb_exp_eq_0__0 : norm_exp_1 & _GEN_41,
       p0_p1_0[12] ? norm_exp_2 & _GEN_40 | p0__pb_exp_eq_0__0 : norm_exp_2 & _GEN_41,
       p0_p1_0[11] ? norm_exp_3 & _GEN_40 | p0__pb_exp_eq_0__0 : norm_exp_3 & _GEN_41,
       p0_p1_0[10] ? norm_exp_4 & _GEN_40 | p0__pb_exp_eq_0__0 : norm_exp_4 & _GEN_41,
       p0_p1_0[9] ? norm_exp_5 & _GEN_40 | p0__pb_exp_eq_0__0 : norm_exp_5 & _GEN_41,
       p0_p1_0[8] ? norm_exp_6 & _GEN_40 | p0__pb_exp_eq_0__0 : norm_exp_6 & _GEN_41,
       p0_p1_0[7] ? norm_exp_7 & _GEN_40 | p0__pb_exp_eq_0__0 : norm_exp_7 & _GEN_41,
       p0_p1_0[6]
         ? _sr_sign_shl_15_or_norm_exp_shl_7_or_r_mant__0 & _GEN_40 | p0__pb_exp_eq_0__0
         : _sr_sign_shl_15_or_norm_exp_shl_7_or_r_mant__0 & _GEN_41,
       p0_p1_0[5]
         ? _sr_sign_shl_15_or_norm_exp_shl_7_or_r_mant__1 & _GEN_40 | p0__pb_exp_eq_0__0
         : _sr_sign_shl_15_or_norm_exp_shl_7_or_r_mant__1 & _GEN_41,
       p0_p1_0[4]
         ? _sr_sign_shl_15_or_norm_exp_shl_7_or_r_mant__2 & _GEN_40 | p0__pb_exp_eq_0__0
         : _sr_sign_shl_15_or_norm_exp_shl_7_or_r_mant__2 & _GEN_41,
       p0_p1_0[3]
         ? _sr_sign_shl_15_or_norm_exp_shl_7_or_r_mant__3 & _GEN_40 | p0__pb_exp_eq_0__0
         : _sr_sign_shl_15_or_norm_exp_shl_7_or_r_mant__3 & _GEN_41,
       p0_p1_0[2]
         ? _sr_sign_shl_15_or_norm_exp_shl_7_or_r_mant__4 & _GEN_40 | p0__pb_exp_eq_0__0
         : _sr_sign_shl_15_or_norm_exp_shl_7_or_r_mant__4 & _GEN_41,
       p0_p1_0[1]
         ? _sr_sign_shl_15_or_norm_exp_shl_7_or_r_mant__5 & _GEN_40 | p0__pb_exp_eq_0__0
         : _sr_sign_shl_15_or_norm_exp_shl_7_or_r_mant__5 & _GEN_41,
       p0_p1_0[0]
         ? _sr_sign_shl_15_or_norm_exp_shl_7_or_r_mant__6 & _GEN_40 | p0__pb_exp_eq_0__0
         : _sr_sign_shl_15_or_norm_exp_shl_7_or_r_mant__6 & _GEN_41};	// rope_apply.k:67:9, :161:22, :199:21, :206:25, :218:21, :229:25, :232:{29,38}, :234:30, :237:29, :255:{29,38}, :258:{25,29}, :260:{38,54,56}
    if (rst)	// rope_apply.k:67:9
      p0_stage6_enable <= 1'h0;	// rope_apply.k:67:9
    else	// rope_apply.k:67:9
      p0_stage6_enable <= p0_stage5_enable;	// rope_apply.k:67:9
    p0_result_0 <= p0__pa_exp_eq_0__1 ? p0_p2_1 : p0_result;	// rope_apply.k:67:9, :157:17
    if (rst)	// rope_apply.k:67:9
      p0_stage7_enable <= 1'h0;	// rope_apply.k:67:9
    else	// rope_apply.k:67:9
      p0_stage7_enable <= p0_stage6_enable;	// rope_apply.k:67:9
    p0_result_1 <= p0_result_0;	// rope_apply.k:67:9
    if (rst)	// rope_apply.k:67:9
      p0_stage8_enable <= 1'h0;	// rope_apply.k:67:9
    else	// rope_apply.k:67:9
      p0_stage8_enable <= p0_stage7_enable;	// rope_apply.k:67:9
    p0_result_2 <= p0_result_1;	// rope_apply.k:67:9
    if (rst)	// rope_apply.k:67:9
      p0_stage9_enable <= 1'h0;	// rope_apply.k:67:9
    else	// rope_apply.k:67:9
      p0_stage9_enable <= p0_stage8_enable;	// rope_apply.k:67:9
  end // always @(posedge)
  always_comb begin	// rope_apply.k:67:9
    fifo_wren_0_0 = p0_stage9_enable;	// rope_apply.k:65:5, :67:9
    fifo_data_out_0_0 = p0_result_2;	// rope_apply.k:65:5, :67:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// rope_apply.k:67:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// rope_apply.k:67:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  rope_applyDebugView_rotate_evenEntry rope_applyDebugView_rotate_evenEntry_instance (	// rope_apply.k:65:5
    .clk       (clk),	// rope_apply.k:65:5
    ._x_even   (p0_stage1_enable ? p0_x_even : 'x),	// rope_apply.k:65:5, :67:9
    ._x_odd    (p0_stage1_enable ? p0_x_odd : 'x),	// rope_apply.k:65:5, :67:9
    ._cos_val  (p0_stage1_enable ? p0_cos_val : 'x),	// rope_apply.k:65:5, :67:9
    ._sin_val  (p0_stage1_enable ? p0_sin_val : 'x),	// rope_apply.k:65:5, :67:9
    .valid     (p0_stage1_enable),	// rope_apply.k:67:9
    .valid_out (/* unused */)
  );	// rope_apply.k:65:5
  rope_applyDebugView_rotate_evenExit rope_applyDebugView_rotate_evenExit_instance (	// rope_apply.k:65:5
    .clk          (clk),	// rope_apply.k:65:5
    ._ReturnValue (p0_stage8_enable ? p0_result_1 : 'x),	// rope_apply.k:65:5, :67:9
    .valid        (p0_stage8_enable),	// rope_apply.k:67:9
    .valid_out    (/* unused */)
  );	// rope_apply.k:65:5
  assign done_out = p0_stage9_enable;	// rope_apply.k:67:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// rope_apply.k:67:9
  assign fifo_wren_0 = fifo_wren_0_0;	// rope_apply.k:67:9
  assign input_rdy_0 = input_rdy_0_0;	// rope_apply.k:67:9
  assign control_state_out = control_state_out_0;	// rope_apply.k:67:9
endmodule

module rope_apply_read_sin_forwarded_BasicBlock_0(	// rope_apply.k:54:9
  input  wire         clk,
  input  wire         rst,
  output wire         done_out,
  input  wire [255:0] global_in__sin_seg_element_0_22,
  input  wire [255:0] global_in__sin_seg_element_1_23,
  input  wire [255:0] global_in__sin_seg_element_2_24,
  input  wire [255:0] global_in__sin_seg_element_3_25,
  output wire [255:0] fifo_data_out_0,
  output wire         fifo_wren_0,
  input  wire         fifo_almost_full_in_raw_0,
  input  wire         fifo_overflow_in_0,
  input  wire [1:0]   data_in_9,
  input  wire         input_fifo_underflow_0,
  output wire         input_rdy_0,
  input  wire         input_valid_0,
  output wire [7:0]   control_state_out
);

  wire          _fifo_overflow_ffc_0_data_out;
  wire          _fifo_almostfull_ffc_0_data_out;
  wire  [255:0] global_in__sin_seg_element_0_22_0 = global_in__sin_seg_element_0_22;	// rope_apply.k:54:9
  wire  [255:0] global_in__sin_seg_element_1_23_0 = global_in__sin_seg_element_1_23;	// rope_apply.k:54:9
  wire  [255:0] global_in__sin_seg_element_2_24_0 = global_in__sin_seg_element_2_24;	// rope_apply.k:54:9
  wire  [255:0] global_in__sin_seg_element_3_25_0 = global_in__sin_seg_element_3_25;	// rope_apply.k:54:9
  logic         done_out_0;	// rope_apply.k:54:9
  logic [255:0] fifo_data_out_0_0;	// rope_apply.k:54:9
  logic         fifo_wren_0_0;	// rope_apply.k:54:9
  logic         input_rdy_0_0;	// rope_apply.k:54:9
  logic [7:0]   control_state_out_0;	// rope_apply.k:54:9
  wire          _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// rope_apply.k:54:9
  always_comb begin	// rope_apply.k:54:9
    input_rdy_0_0 = _GEN;	// rope_apply.k:54:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// rope_apply.k:54:9
  end // always_comb
  reg   [1:0]   p0_data_in_9;	// rope_apply.k:54:9
  reg           p0_stage1_enable = 1'h0;	// rope_apply.k:54:9
  wire  [255:0] _sin_seg =
    p0_data_in_9[1]
      ? (p0_data_in_9[0]
           ? global_in__sin_seg_element_3_25_0
           : global_in__sin_seg_element_2_24_0)
      : p0_data_in_9[0]
          ? global_in__sin_seg_element_1_23_0
          : global_in__sin_seg_element_0_22_0;	// rope_apply.k:54:9, :55:22
  reg   [255:0] p0__sin_seg;	// rope_apply.k:54:9
  reg           p0_stage2_enable = 1'h0;	// rope_apply.k:54:9
  always @(posedge clk) begin	// rope_apply.k:54:9
    p0_data_in_9 <= data_in_9;	// rope_apply.k:54:9
    if (rst)	// rope_apply.k:54:9
      p0_stage1_enable <= 1'h0;	// rope_apply.k:54:9
    else	// rope_apply.k:54:9
      p0_stage1_enable <= _GEN & input_valid_0;	// rope_apply.k:54:9
    p0__sin_seg <= _sin_seg;	// rope_apply.k:54:9, :55:22
    if (rst)	// rope_apply.k:54:9
      p0_stage2_enable <= 1'h0;	// rope_apply.k:54:9
    else	// rope_apply.k:54:9
      p0_stage2_enable <= p0_stage1_enable;	// rope_apply.k:54:9
  end // always @(posedge)
  always_comb begin	// rope_apply.k:54:9
    fifo_wren_0_0 = p0_stage2_enable;	// rope_apply.k:52:5, :54:9
    fifo_data_out_0_0 = p0__sin_seg;	// rope_apply.k:52:5, :54:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// rope_apply.k:54:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// rope_apply.k:54:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  rope_applyDebugView_read_sin_forwardedEntry rope_applyDebugView_read_sin_forwardedEntry_instance (	// rope_apply.k:52:5
    .clk       (clk),	// rope_apply.k:52:5
    ._phase    (p0_stage1_enable ? p0_data_in_9 : 'x),	// rope_apply.k:52:5, :54:9
    .valid     (p0_stage1_enable),	// rope_apply.k:54:9
    .valid_out (/* unused */)
  );	// rope_apply.k:52:5
  rope_applyDebugView_read_sin_forwardedExit rope_applyDebugView_read_sin_forwardedExit_instance (	// rope_apply.k:52:5
    .clk          (clk),	// rope_apply.k:52:5
    ._ReturnValue (p0_stage1_enable ? _sin_seg : 'x),	// rope_apply.k:52:5, :54:9, :55:22
    .valid        (p0_stage1_enable),	// rope_apply.k:54:9
    .valid_out    (/* unused */)
  );	// rope_apply.k:52:5
  assign done_out = p0_stage2_enable;	// rope_apply.k:54:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// rope_apply.k:54:9
  assign fifo_wren_0 = fifo_wren_0_0;	// rope_apply.k:54:9
  assign input_rdy_0 = input_rdy_0_0;	// rope_apply.k:54:9
  assign control_state_out = control_state_out_0;	// rope_apply.k:54:9
endmodule

module rope_apply_read_cos_forwarded_BasicBlock_0(	// rope_apply.k:47:9
  input  wire         clk,
  input  wire         rst,
  output wire         done_out,
  input  wire [255:0] global_in__cos_seg_element_0_18,
  input  wire [255:0] global_in__cos_seg_element_1_19,
  input  wire [255:0] global_in__cos_seg_element_2_20,
  input  wire [255:0] global_in__cos_seg_element_3_21,
  output wire [255:0] fifo_data_out_0,
  output wire         fifo_wren_0,
  input  wire         fifo_almost_full_in_raw_0,
  input  wire         fifo_overflow_in_0,
  input  wire [1:0]   data_in_8,
  input  wire         input_fifo_underflow_0,
  output wire         input_rdy_0,
  input  wire         input_valid_0,
  output wire [7:0]   control_state_out
);

  wire          _fifo_overflow_ffc_0_data_out;
  wire          _fifo_almostfull_ffc_0_data_out;
  wire  [255:0] global_in__cos_seg_element_0_18_0 = global_in__cos_seg_element_0_18;	// rope_apply.k:47:9
  wire  [255:0] global_in__cos_seg_element_1_19_0 = global_in__cos_seg_element_1_19;	// rope_apply.k:47:9
  wire  [255:0] global_in__cos_seg_element_2_20_0 = global_in__cos_seg_element_2_20;	// rope_apply.k:47:9
  wire  [255:0] global_in__cos_seg_element_3_21_0 = global_in__cos_seg_element_3_21;	// rope_apply.k:47:9
  logic         done_out_0;	// rope_apply.k:47:9
  logic [255:0] fifo_data_out_0_0;	// rope_apply.k:47:9
  logic         fifo_wren_0_0;	// rope_apply.k:47:9
  logic         input_rdy_0_0;	// rope_apply.k:47:9
  logic [7:0]   control_state_out_0;	// rope_apply.k:47:9
  wire          _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// rope_apply.k:47:9
  always_comb begin	// rope_apply.k:47:9
    input_rdy_0_0 = _GEN;	// rope_apply.k:47:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// rope_apply.k:47:9
  end // always_comb
  reg   [1:0]   p0_data_in_8;	// rope_apply.k:47:9
  reg           p0_stage1_enable = 1'h0;	// rope_apply.k:47:9
  wire  [255:0] _cos_seg =
    p0_data_in_8[1]
      ? (p0_data_in_8[0]
           ? global_in__cos_seg_element_3_21_0
           : global_in__cos_seg_element_2_20_0)
      : p0_data_in_8[0]
          ? global_in__cos_seg_element_1_19_0
          : global_in__cos_seg_element_0_18_0;	// rope_apply.k:47:9, :48:22
  reg   [255:0] p0__cos_seg;	// rope_apply.k:47:9
  reg           p0_stage2_enable = 1'h0;	// rope_apply.k:47:9
  always @(posedge clk) begin	// rope_apply.k:47:9
    p0_data_in_8 <= data_in_8;	// rope_apply.k:47:9
    if (rst)	// rope_apply.k:47:9
      p0_stage1_enable <= 1'h0;	// rope_apply.k:47:9
    else	// rope_apply.k:47:9
      p0_stage1_enable <= _GEN & input_valid_0;	// rope_apply.k:47:9
    p0__cos_seg <= _cos_seg;	// rope_apply.k:47:9, :48:22
    if (rst)	// rope_apply.k:47:9
      p0_stage2_enable <= 1'h0;	// rope_apply.k:47:9
    else	// rope_apply.k:47:9
      p0_stage2_enable <= p0_stage1_enable;	// rope_apply.k:47:9
  end // always @(posedge)
  always_comb begin	// rope_apply.k:47:9
    fifo_wren_0_0 = p0_stage2_enable;	// rope_apply.k:45:5, :47:9
    fifo_data_out_0_0 = p0__cos_seg;	// rope_apply.k:45:5, :47:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// rope_apply.k:47:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// rope_apply.k:47:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  rope_applyDebugView_read_cos_forwardedEntry rope_applyDebugView_read_cos_forwardedEntry_instance (	// rope_apply.k:45:5
    .clk       (clk),	// rope_apply.k:45:5
    ._phase    (p0_stage1_enable ? p0_data_in_8 : 'x),	// rope_apply.k:45:5, :47:9
    .valid     (p0_stage1_enable),	// rope_apply.k:47:9
    .valid_out (/* unused */)
  );	// rope_apply.k:45:5
  rope_applyDebugView_read_cos_forwardedExit rope_applyDebugView_read_cos_forwardedExit_instance (	// rope_apply.k:45:5
    .clk          (clk),	// rope_apply.k:45:5
    ._ReturnValue (p0_stage1_enable ? _cos_seg : 'x),	// rope_apply.k:45:5, :47:9, :48:22
    .valid        (p0_stage1_enable),	// rope_apply.k:47:9
    .valid_out    (/* unused */)
  );	// rope_apply.k:45:5
  assign done_out = p0_stage2_enable;	// rope_apply.k:47:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// rope_apply.k:47:9
  assign fifo_wren_0 = fifo_wren_0_0;	// rope_apply.k:47:9
  assign input_rdy_0 = input_rdy_0_0;	// rope_apply.k:47:9
  assign control_state_out = control_state_out_0;	// rope_apply.k:47:9
endmodule

module rope_apply_forward_sin_BasicBlock_0(	// rope_apply.k:40:9
  input  wire         clk,
  input  wire         rst,
  output wire         done_out,
  output wire         global_out__sin_seg_element_0_22_0_valid,
  output wire [255:0] global_out__sin_seg_element_0_22_0,
  output wire         global_out__sin_seg_element_1_23_0_valid,
  output wire [255:0] global_out__sin_seg_element_1_23_0,
  output wire         global_out__sin_seg_element_2_24_0_valid,
  output wire [255:0] global_out__sin_seg_element_2_24_0,
  output wire         global_out__sin_seg_element_3_25_0_valid,
  output wire [255:0] global_out__sin_seg_element_3_25_0,
  output wire         fifo_wren_0,
  input  wire         fifo_almost_full_in_raw_0,
  input  wire         fifo_overflow_in_0,
  input  wire [257:0] data_in_7,
  input  wire         input_fifo_underflow_0,
  output wire         input_rdy_0,
  input  wire         input_valid_0,
  output wire [7:0]   control_state_out
);

  wire          _fifo_overflow_ffc_0_data_out;
  wire          _fifo_almostfull_ffc_0_data_out;
  logic         done_out_0;	// rope_apply.k:40:9
  logic         global_out__sin_seg_element_0_22_0_valid_0;	// rope_apply.k:40:9
  logic [255:0] global_out__sin_seg_element_0_22_0_0;	// rope_apply.k:40:9
  logic         global_out__sin_seg_element_1_23_0_valid_0;	// rope_apply.k:40:9
  logic [255:0] global_out__sin_seg_element_1_23_0_0;	// rope_apply.k:40:9
  logic         global_out__sin_seg_element_2_24_0_valid_0;	// rope_apply.k:40:9
  logic [255:0] global_out__sin_seg_element_2_24_0_0;	// rope_apply.k:40:9
  logic         global_out__sin_seg_element_3_25_0_valid_0;	// rope_apply.k:40:9
  logic [255:0] global_out__sin_seg_element_3_25_0_0;	// rope_apply.k:40:9
  logic         fifo_wren_0_0;	// rope_apply.k:40:9
  logic         input_rdy_0_0;	// rope_apply.k:40:9
  logic [7:0]   control_state_out_0;	// rope_apply.k:40:9
  wire          _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// rope_apply.k:40:9
  always_comb begin	// rope_apply.k:40:9
    input_rdy_0_0 = _GEN;	// rope_apply.k:40:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// rope_apply.k:40:9
  end // always_comb
  reg   [1:0]   p0_phase;	// rope_apply.k:40:9
  reg   [255:0] p0_v;	// rope_apply.k:40:9
  reg           p0_stage1_enable = 1'h0;	// rope_apply.k:40:9
  always_comb begin	// rope_apply.k:40:9
    global_out__sin_seg_element_2_24_0_0 = p0_v;	// rope_apply.k:40:9
    global_out__sin_seg_element_2_24_0_valid_0 = p0_stage1_enable & p0_phase == 2'h2;	// rope_apply.k:40:{9,18}
    global_out__sin_seg_element_3_25_0_0 = p0_v;	// rope_apply.k:40:9
    global_out__sin_seg_element_3_25_0_valid_0 = p0_stage1_enable & (&p0_phase);	// rope_apply.k:40:{9,18}
  end // always_comb
  always_comb begin	// rope_apply.k:40:9
    global_out__sin_seg_element_0_22_0_0 = p0_v;	// rope_apply.k:40:9
    global_out__sin_seg_element_0_22_0_valid_0 = p0_stage1_enable & p0_phase == 2'h0;	// rope_apply.k:40:{9,18}
    global_out__sin_seg_element_1_23_0_0 = p0_v;	// rope_apply.k:40:9
    global_out__sin_seg_element_1_23_0_valid_0 = p0_stage1_enable & p0_phase == 2'h1;	// rope_apply.k:40:{9,18}
  end // always_comb
  reg           p0_stage2_enable = 1'h0;	// rope_apply.k:40:9
  always @(posedge clk) begin	// rope_apply.k:40:9
    p0_phase <= data_in_7[1:0];	// rope_apply.k:40:9
    p0_v <= data_in_7[257:2];	// rope_apply.k:40:9
    if (rst) begin	// rope_apply.k:40:9
      p0_stage1_enable <= 1'h0;	// rope_apply.k:40:9
      p0_stage2_enable <= 1'h0;	// rope_apply.k:40:9
    end
    else begin	// rope_apply.k:40:9
      p0_stage1_enable <= _GEN & input_valid_0;	// rope_apply.k:40:9
      p0_stage2_enable <= p0_stage1_enable;	// rope_apply.k:40:9
    end
  end // always @(posedge)
  always_comb	// rope_apply.k:40:9
    fifo_wren_0_0 = p0_stage2_enable;	// rope_apply.k:40:9, :41:9
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// rope_apply.k:40:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// rope_apply.k:40:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  rope_applyDebugView_forward_sinEntry rope_applyDebugView_forward_sinEntry_instance (	// rope_apply.k:41:9
    .clk       (clk),	// rope_apply.k:41:9
    ._phase    (p0_stage1_enable ? p0_phase : 'x),	// rope_apply.k:40:9, :41:9
    ._v        (p0_stage1_enable ? p0_v : 'x),	// rope_apply.k:40:9, :41:9
    .valid     (p0_stage1_enable),	// rope_apply.k:40:9
    .valid_out (/* unused */)
  );	// rope_apply.k:41:9
  assign done_out = p0_stage2_enable;	// rope_apply.k:40:9
  assign global_out__sin_seg_element_0_22_0_valid =
    global_out__sin_seg_element_0_22_0_valid_0;	// rope_apply.k:40:9
  assign global_out__sin_seg_element_0_22_0 = global_out__sin_seg_element_0_22_0_0;	// rope_apply.k:40:9
  assign global_out__sin_seg_element_1_23_0_valid =
    global_out__sin_seg_element_1_23_0_valid_0;	// rope_apply.k:40:9
  assign global_out__sin_seg_element_1_23_0 = global_out__sin_seg_element_1_23_0_0;	// rope_apply.k:40:9
  assign global_out__sin_seg_element_2_24_0_valid =
    global_out__sin_seg_element_2_24_0_valid_0;	// rope_apply.k:40:9
  assign global_out__sin_seg_element_2_24_0 = global_out__sin_seg_element_2_24_0_0;	// rope_apply.k:40:9
  assign global_out__sin_seg_element_3_25_0_valid =
    global_out__sin_seg_element_3_25_0_valid_0;	// rope_apply.k:40:9
  assign global_out__sin_seg_element_3_25_0 = global_out__sin_seg_element_3_25_0_0;	// rope_apply.k:40:9
  assign fifo_wren_0 = fifo_wren_0_0;	// rope_apply.k:40:9
  assign input_rdy_0 = input_rdy_0_0;	// rope_apply.k:40:9
  assign control_state_out = control_state_out_0;	// rope_apply.k:40:9
endmodule

module rope_apply_forward_cos_BasicBlock_0(	// rope_apply.k:35:9
  input  wire         clk,
  input  wire         rst,
  output wire         done_out,
  output wire         global_out__cos_seg_element_0_18_0_valid,
  output wire [255:0] global_out__cos_seg_element_0_18_0,
  output wire         global_out__cos_seg_element_1_19_0_valid,
  output wire [255:0] global_out__cos_seg_element_1_19_0,
  output wire         global_out__cos_seg_element_2_20_0_valid,
  output wire [255:0] global_out__cos_seg_element_2_20_0,
  output wire         global_out__cos_seg_element_3_21_0_valid,
  output wire [255:0] global_out__cos_seg_element_3_21_0,
  output wire         fifo_wren_0,
  input  wire         fifo_almost_full_in_raw_0,
  input  wire         fifo_overflow_in_0,
  input  wire [257:0] data_in_6,
  input  wire         input_fifo_underflow_0,
  output wire         input_rdy_0,
  input  wire         input_valid_0,
  output wire [7:0]   control_state_out
);

  wire          _fifo_overflow_ffc_0_data_out;
  wire          _fifo_almostfull_ffc_0_data_out;
  logic         done_out_0;	// rope_apply.k:35:9
  logic         global_out__cos_seg_element_0_18_0_valid_0;	// rope_apply.k:35:9
  logic [255:0] global_out__cos_seg_element_0_18_0_0;	// rope_apply.k:35:9
  logic         global_out__cos_seg_element_1_19_0_valid_0;	// rope_apply.k:35:9
  logic [255:0] global_out__cos_seg_element_1_19_0_0;	// rope_apply.k:35:9
  logic         global_out__cos_seg_element_2_20_0_valid_0;	// rope_apply.k:35:9
  logic [255:0] global_out__cos_seg_element_2_20_0_0;	// rope_apply.k:35:9
  logic         global_out__cos_seg_element_3_21_0_valid_0;	// rope_apply.k:35:9
  logic [255:0] global_out__cos_seg_element_3_21_0_0;	// rope_apply.k:35:9
  logic         fifo_wren_0_0;	// rope_apply.k:35:9
  logic         input_rdy_0_0;	// rope_apply.k:35:9
  logic [7:0]   control_state_out_0;	// rope_apply.k:35:9
  wire          _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// rope_apply.k:35:9
  always_comb begin	// rope_apply.k:35:9
    input_rdy_0_0 = _GEN;	// rope_apply.k:35:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// rope_apply.k:35:9
  end // always_comb
  reg   [1:0]   p0_phase;	// rope_apply.k:35:9
  reg   [255:0] p0_v;	// rope_apply.k:35:9
  reg           p0_stage1_enable = 1'h0;	// rope_apply.k:35:9
  always_comb begin	// rope_apply.k:35:9
    global_out__cos_seg_element_2_20_0_0 = p0_v;	// rope_apply.k:35:9
    global_out__cos_seg_element_2_20_0_valid_0 = p0_stage1_enable & p0_phase == 2'h2;	// rope_apply.k:35:{9,18}
    global_out__cos_seg_element_3_21_0_0 = p0_v;	// rope_apply.k:35:9
    global_out__cos_seg_element_3_21_0_valid_0 = p0_stage1_enable & (&p0_phase);	// rope_apply.k:35:{9,18}
  end // always_comb
  always_comb begin	// rope_apply.k:35:9
    global_out__cos_seg_element_0_18_0_0 = p0_v;	// rope_apply.k:35:9
    global_out__cos_seg_element_0_18_0_valid_0 = p0_stage1_enable & p0_phase == 2'h0;	// rope_apply.k:35:{9,18}
    global_out__cos_seg_element_1_19_0_0 = p0_v;	// rope_apply.k:35:9
    global_out__cos_seg_element_1_19_0_valid_0 = p0_stage1_enable & p0_phase == 2'h1;	// rope_apply.k:35:{9,18}
  end // always_comb
  reg           p0_stage2_enable = 1'h0;	// rope_apply.k:35:9
  always @(posedge clk) begin	// rope_apply.k:35:9
    p0_phase <= data_in_6[1:0];	// rope_apply.k:35:9
    p0_v <= data_in_6[257:2];	// rope_apply.k:35:9
    if (rst) begin	// rope_apply.k:35:9
      p0_stage1_enable <= 1'h0;	// rope_apply.k:35:9
      p0_stage2_enable <= 1'h0;	// rope_apply.k:35:9
    end
    else begin	// rope_apply.k:35:9
      p0_stage1_enable <= _GEN & input_valid_0;	// rope_apply.k:35:9
      p0_stage2_enable <= p0_stage1_enable;	// rope_apply.k:35:9
    end
  end // always @(posedge)
  always_comb	// rope_apply.k:35:9
    fifo_wren_0_0 = p0_stage2_enable;	// rope_apply.k:35:9, :36:9
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// rope_apply.k:35:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// rope_apply.k:35:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  rope_applyDebugView_forward_cosEntry rope_applyDebugView_forward_cosEntry_instance (	// rope_apply.k:36:9
    .clk       (clk),	// rope_apply.k:36:9
    ._phase    (p0_stage1_enable ? p0_phase : 'x),	// rope_apply.k:35:9, :36:9
    ._v        (p0_stage1_enable ? p0_v : 'x),	// rope_apply.k:35:9, :36:9
    .valid     (p0_stage1_enable),	// rope_apply.k:35:9
    .valid_out (/* unused */)
  );	// rope_apply.k:36:9
  assign done_out = p0_stage2_enable;	// rope_apply.k:35:9
  assign global_out__cos_seg_element_0_18_0_valid =
    global_out__cos_seg_element_0_18_0_valid_0;	// rope_apply.k:35:9
  assign global_out__cos_seg_element_0_18_0 = global_out__cos_seg_element_0_18_0_0;	// rope_apply.k:35:9
  assign global_out__cos_seg_element_1_19_0_valid =
    global_out__cos_seg_element_1_19_0_valid_0;	// rope_apply.k:35:9
  assign global_out__cos_seg_element_1_19_0 = global_out__cos_seg_element_1_19_0_0;	// rope_apply.k:35:9
  assign global_out__cos_seg_element_2_20_0_valid =
    global_out__cos_seg_element_2_20_0_valid_0;	// rope_apply.k:35:9
  assign global_out__cos_seg_element_2_20_0 = global_out__cos_seg_element_2_20_0_0;	// rope_apply.k:35:9
  assign global_out__cos_seg_element_3_21_0_valid =
    global_out__cos_seg_element_3_21_0_valid_0;	// rope_apply.k:35:9
  assign global_out__cos_seg_element_3_21_0 = global_out__cos_seg_element_3_21_0_0;	// rope_apply.k:35:9
  assign fifo_wren_0 = fifo_wren_0_0;	// rope_apply.k:35:9
  assign input_rdy_0 = input_rdy_0_0;	// rope_apply.k:35:9
  assign control_state_out = control_state_out_0;	// rope_apply.k:35:9
endmodule

module rope_apply_reg_256_w1(
  input  wire         clk,
  input  wire         input_valid_0,
  input  wire [255:0] input_0,
  output wire [255:0] value_out
);

  reg [255:0] value;
  always @(posedge clk)
    value <= input_valid_0 ? input_0 : value;
  assign value_out = value;
endmodule

module rope_apply(
  input  wire         clk,
  input  wire         rst,
  input  wire         forward_cos_valid_in,
  input  wire [1:0]   forward_cos_phase_in,
  input  wire [255:0] forward_cos_v_in,
  input  wire         forward_cos_rden_in,
  input  wire         forward_sin_valid_in,
  input  wire [1:0]   forward_sin_phase_in,
  input  wire [255:0] forward_sin_v_in,
  input  wire         forward_sin_rden_in,
  input  wire         read_cos_forwarded_valid_in,
  input  wire [1:0]   read_cos_forwarded_phase_in,
  input  wire         read_cos_forwarded_rden_in,
  input  wire         read_sin_forwarded_valid_in,
  input  wire [1:0]   read_sin_forwarded_phase_in,
  input  wire         read_sin_forwarded_rden_in,
  input  wire         rotate_even_valid_in,
  input  wire [15:0]  rotate_even_x_even_in,
  input  wire [15:0]  rotate_even_x_odd_in,
  input  wire [15:0]  rotate_even_cos_val_in,
  input  wire [15:0]  rotate_even_sin_val_in,
  input  wire         rotate_even_rden_in,
  input  wire         rotate_odd_valid_in,
  input  wire [15:0]  rotate_odd_x_even_in,
  input  wire [15:0]  rotate_odd_x_odd_in,
  input  wire [15:0]  rotate_odd_cos_val_in,
  input  wire [15:0]  rotate_odd_sin_val_in,
  input  wire         rotate_odd_rden_in,
  input  wire [2:0]   stall_rate_in,
  input  wire         stall_rate_valid_in,
  output wire         rst_and_startup_done_out,
  output wire         forward_cos_rdy_out,
  output wire         forward_cos_empty_out,
  output wire         forward_sin_rdy_out,
  output wire         forward_sin_empty_out,
  output wire         read_cos_forwarded_rdy_out,
  output wire         read_cos_forwarded_empty_out,
  output wire [255:0] read_cos_forwarded_result_out,
  output wire         read_sin_forwarded_rdy_out,
  output wire         read_sin_forwarded_empty_out,
  output wire [255:0] read_sin_forwarded_result_out,
  output wire         rotate_even_rdy_out,
  output wire         rotate_even_empty_out,
  output wire [15:0]  rotate_even_result_out,
  output wire         rotate_odd_rdy_out,
  output wire         rotate_odd_empty_out,
  output wire [15:0]  rotate_odd_result_out,
  output wire         stall_rate_supported_out
);

  wire [15:0]  _rotate_odd_BasicBlock_0Impl_fifo_data_out_0;	// rope_apply.k:273:9
  wire         _rotate_odd_BasicBlock_0Impl_fifo_wren_0;	// rope_apply.k:273:9
  wire         _rotate_odd_BasicBlock_0Impl_input_rdy_0;	// rope_apply.k:273:9
  wire [15:0]  _rotate_even_BasicBlock_0Impl_fifo_data_out_0;	// rope_apply.k:67:9
  wire         _rotate_even_BasicBlock_0Impl_fifo_wren_0;	// rope_apply.k:67:9
  wire         _rotate_even_BasicBlock_0Impl_input_rdy_0;	// rope_apply.k:67:9
  wire [255:0] _read_sin_forwarded_BasicBlock_0Impl_fifo_data_out_0;	// rope_apply.k:54:9
  wire         _read_sin_forwarded_BasicBlock_0Impl_fifo_wren_0;	// rope_apply.k:54:9
  wire         _read_sin_forwarded_BasicBlock_0Impl_input_rdy_0;	// rope_apply.k:54:9
  wire [255:0] _read_cos_forwarded_BasicBlock_0Impl_fifo_data_out_0;	// rope_apply.k:47:9
  wire         _read_cos_forwarded_BasicBlock_0Impl_fifo_wren_0;	// rope_apply.k:47:9
  wire         _read_cos_forwarded_BasicBlock_0Impl_input_rdy_0;	// rope_apply.k:47:9
  wire         _forward_sin_BasicBlock_0Impl_global_out__sin_seg_element_0_22_0_valid;	// rope_apply.k:40:9
  wire [255:0] _forward_sin_BasicBlock_0Impl_global_out__sin_seg_element_0_22_0;	// rope_apply.k:40:9
  wire         _forward_sin_BasicBlock_0Impl_global_out__sin_seg_element_1_23_0_valid;	// rope_apply.k:40:9
  wire [255:0] _forward_sin_BasicBlock_0Impl_global_out__sin_seg_element_1_23_0;	// rope_apply.k:40:9
  wire         _forward_sin_BasicBlock_0Impl_global_out__sin_seg_element_2_24_0_valid;	// rope_apply.k:40:9
  wire [255:0] _forward_sin_BasicBlock_0Impl_global_out__sin_seg_element_2_24_0;	// rope_apply.k:40:9
  wire         _forward_sin_BasicBlock_0Impl_global_out__sin_seg_element_3_25_0_valid;	// rope_apply.k:40:9
  wire [255:0] _forward_sin_BasicBlock_0Impl_global_out__sin_seg_element_3_25_0;	// rope_apply.k:40:9
  wire         _forward_sin_BasicBlock_0Impl_fifo_wren_0;	// rope_apply.k:40:9
  wire         _forward_sin_BasicBlock_0Impl_input_rdy_0;	// rope_apply.k:40:9
  wire         _forward_cos_BasicBlock_0Impl_global_out__cos_seg_element_0_18_0_valid;	// rope_apply.k:35:9
  wire [255:0] _forward_cos_BasicBlock_0Impl_global_out__cos_seg_element_0_18_0;	// rope_apply.k:35:9
  wire         _forward_cos_BasicBlock_0Impl_global_out__cos_seg_element_1_19_0_valid;	// rope_apply.k:35:9
  wire [255:0] _forward_cos_BasicBlock_0Impl_global_out__cos_seg_element_1_19_0;	// rope_apply.k:35:9
  wire         _forward_cos_BasicBlock_0Impl_global_out__cos_seg_element_2_20_0_valid;	// rope_apply.k:35:9
  wire [255:0] _forward_cos_BasicBlock_0Impl_global_out__cos_seg_element_2_20_0;	// rope_apply.k:35:9
  wire         _forward_cos_BasicBlock_0Impl_global_out__cos_seg_element_3_21_0_valid;	// rope_apply.k:35:9
  wire [255:0] _forward_cos_BasicBlock_0Impl_global_out__cos_seg_element_3_21_0;	// rope_apply.k:35:9
  wire         _forward_cos_BasicBlock_0Impl_fifo_wren_0;	// rope_apply.k:35:9
  wire         _forward_cos_BasicBlock_0Impl_input_rdy_0;	// rope_apply.k:35:9
  wire         _fifo_5_rotate_odd_Return_overflow_out;
  wire         _fifo_5_rotate_odd_Return_underflow_out;
  wire         _fifo_5_rotate_odd_Return_empty;
  wire         _fifo_5_rotate_odd_Return_full;
  wire [15:0]  _fifo_5_rotate_odd_Return_q;
  wire         _fifo_4_rotate_even_Return_overflow_out;
  wire         _fifo_4_rotate_even_Return_underflow_out;
  wire         _fifo_4_rotate_even_Return_empty;
  wire         _fifo_4_rotate_even_Return_full;
  wire [15:0]  _fifo_4_rotate_even_Return_q;
  wire         _fifo_3_read_sin_forwarded_Return_overflow_out;
  wire         _fifo_3_read_sin_forwarded_Return_underflow_out;
  wire         _fifo_3_read_sin_forwarded_Return_empty;
  wire         _fifo_3_read_sin_forwarded_Return_full;
  wire [255:0] _fifo_3_read_sin_forwarded_Return_q;
  wire         _fifo_2_read_cos_forwarded_Return_overflow_out;
  wire         _fifo_2_read_cos_forwarded_Return_underflow_out;
  wire         _fifo_2_read_cos_forwarded_Return_empty;
  wire         _fifo_2_read_cos_forwarded_Return_full;
  wire [255:0] _fifo_2_read_cos_forwarded_Return_q;
  wire         _fifo_1_forward_sin_Return_overflow_out;
  wire         _fifo_1_forward_sin_Return_underflow_out;
  wire         _fifo_1_forward_sin_Return_empty;
  wire         _fifo_1_forward_sin_Return_full;
  wire         _fifo_0_forward_cos_Return_overflow_out;
  wire         _fifo_0_forward_cos_Return_underflow_out;
  wire         _fifo_0_forward_cos_Return_empty;
  wire         _fifo_0_forward_cos_Return_full;
  wire         _has_startup_completed_delayed_5_delay_chain_data_out;
  wire         _has_startup_completed_delayed_4_delay_chain_data_out;
  wire         _has_startup_completed_delayed_3_delay_chain_data_out;
  wire         _has_startup_completed_delayed_2_delay_chain_data_out;
  wire         _has_startup_completed_delayed_1_delay_chain_data_out;
  wire         _has_startup_completed_delayed_0_delay_chain_data_out;
  wire [255:0] __sin_seg_element_3_value_out;	// rope_apply.k:28:5
  wire [255:0] __sin_seg_element_2_value_out;	// rope_apply.k:28:5
  wire [255:0] __sin_seg_element_1_value_out;	// rope_apply.k:28:5
  wire [255:0] __sin_seg_element_0_value_out;	// rope_apply.k:28:5
  wire [255:0] __cos_seg_element_3_value_out;	// rope_apply.k:27:5
  wire [255:0] __cos_seg_element_2_value_out;	// rope_apply.k:27:5
  wire [255:0] __cos_seg_element_1_value_out;	// rope_apply.k:27:5
  wire [255:0] __cos_seg_element_0_value_out;	// rope_apply.k:27:5
  wire         _reset_control_rst_and_startup_done_out;
  wire [11:0]  _reset_control_rst_delayed_out;
  wire         _reset_control_reset_sequence_finished_this_cycle_out;
  logic  stall_rate_supported_out_net;
  logic  rotate_odd_empty_out_net;
  logic [15:0] rotate_odd_result_out_net;
  logic  rotate_odd_rdy_out_net;
  logic  rotate_even_empty_out_net;
  logic [15:0] rotate_even_result_out_net;
  logic  rotate_even_rdy_out_net;
  logic  read_sin_forwarded_empty_out_net;
  logic [255:0] read_sin_forwarded_result_out_net;
  logic  read_sin_forwarded_rdy_out_net;
  logic  read_cos_forwarded_empty_out_net;
  logic [255:0] read_cos_forwarded_result_out_net;
  logic  read_cos_forwarded_rdy_out_net;
  logic  forward_sin_empty_out_net;
  logic  forward_sin_rdy_out_net;
  logic  forward_cos_empty_out_net;
  logic  forward_cos_rdy_out_net;
  logic  rst_and_startup_done_out_net;

  logic [31:0] dropped_commands;
  //synopsys translate_off
  KanagawaStringTable string_table(.clk(clk));
  //synopsys translate_on
  logic [11:0] reg_rst_delayed;
  logic combined_reset;
  assign combined_reset = rst;
  logic reset_sequence_finished_this_cycle;
  logic has_startup_completed_raw;
  logic has_mem_init_completed;
  logic has_others_completed;
  assign has_others_completed = has_startup_completed_raw;

  logic rst_and_startup_done_raw;

  logic [0:0] rst_array;
  assign rst_array[0] = combined_reset;
  logic has_startup_completed_delayed_0;

  logic has_startup_completed_delayed_1;

  logic has_startup_completed_delayed_2;

  logic has_startup_completed_delayed_3;

  logic has_startup_completed_delayed_4;

  logic has_startup_completed_delayed_5;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic overflow;
      logic underflow;
  } fifo_data_0;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic overflow;
      logic underflow;
  } fifo_data_1;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [255:0] data_in;
      logic [255:0] data_out;
      logic overflow;
      logic underflow;
  } fifo_data_2;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [255:0] data_in;
      logic [255:0] data_out;
      logic overflow;
      logic underflow;
  } fifo_data_3;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [15:0] data_in;
      logic [15:0] data_out;
      logic overflow;
      logic underflow;
  } fifo_data_4;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [15:0] data_in;
      logic [15:0] data_out;
      logic overflow;
      logic underflow;
  } fifo_data_5;

  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [257:0] data;
      logic underflow;
  } passthrough_data_6;
  assign passthrough_data_6.underflow = 1'b0;
  assign passthrough_data_6.rdy_ext = passthrough_data_6.rdy_int & !(!has_startup_completed_delayed_0);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [257:0] data;
      logic underflow;
  } passthrough_data_7;
  assign passthrough_data_7.underflow = 1'b0;
  assign passthrough_data_7.rdy_ext = passthrough_data_7.rdy_int & !(!has_startup_completed_delayed_1);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [1:0] data;
      logic underflow;
  } passthrough_data_8;
  assign passthrough_data_8.underflow = 1'b0;
  assign passthrough_data_8.rdy_ext = passthrough_data_8.rdy_int & !(!has_startup_completed_delayed_2);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [1:0] data;
      logic underflow;
  } passthrough_data_9;
  assign passthrough_data_9.underflow = 1'b0;
  assign passthrough_data_9.rdy_ext = passthrough_data_9.rdy_int & !(!has_startup_completed_delayed_3);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [63:0] data;
      logic underflow;
  } passthrough_data_10;
  assign passthrough_data_10.underflow = 1'b0;
  assign passthrough_data_10.rdy_ext = passthrough_data_10.rdy_int & !(!has_startup_completed_delayed_4);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [63:0] data;
      logic underflow;
  } passthrough_data_11;
  assign passthrough_data_11.underflow = 1'b0;
  assign passthrough_data_11.rdy_ext = passthrough_data_11.rdy_int & !(!has_startup_completed_delayed_5);
  assign forward_cos_rdy_out_net = passthrough_data_6.rdy_ext;
  assign passthrough_data_6.valid = forward_cos_rdy_out & forward_cos_valid_in;
  assign passthrough_data_6.data = { forward_cos_v_in, forward_cos_phase_in };
  assign fifo_data_0.rden = forward_cos_rden_in;
  assign forward_cos_empty_out_net = fifo_data_0.empty;
  assign forward_sin_rdy_out_net = passthrough_data_7.rdy_ext;
  assign passthrough_data_7.valid = forward_sin_rdy_out & forward_sin_valid_in;
  assign passthrough_data_7.data = { forward_sin_v_in, forward_sin_phase_in };
  assign fifo_data_1.rden = forward_sin_rden_in;
  assign forward_sin_empty_out_net = fifo_data_1.empty;
  assign read_cos_forwarded_rdy_out_net = passthrough_data_8.rdy_ext;
  assign passthrough_data_8.valid = read_cos_forwarded_rdy_out & read_cos_forwarded_valid_in;
  assign passthrough_data_8.data = { read_cos_forwarded_phase_in };
  assign fifo_data_2.rden = read_cos_forwarded_rden_in;
  assign read_cos_forwarded_result_out_net = fifo_data_2.data_out;
  assign read_cos_forwarded_empty_out_net = fifo_data_2.empty;
  assign read_sin_forwarded_rdy_out_net = passthrough_data_9.rdy_ext;
  assign passthrough_data_9.valid = read_sin_forwarded_rdy_out & read_sin_forwarded_valid_in;
  assign passthrough_data_9.data = { read_sin_forwarded_phase_in };
  assign fifo_data_3.rden = read_sin_forwarded_rden_in;
  assign read_sin_forwarded_result_out_net = fifo_data_3.data_out;
  assign read_sin_forwarded_empty_out_net = fifo_data_3.empty;
  assign rotate_even_rdy_out_net = passthrough_data_10.rdy_ext;
  assign passthrough_data_10.valid = rotate_even_rdy_out & rotate_even_valid_in;
  assign passthrough_data_10.data = { rotate_even_sin_val_in, rotate_even_cos_val_in, rotate_even_x_odd_in, rotate_even_x_even_in };
  assign fifo_data_4.rden = rotate_even_rden_in;
  assign rotate_even_result_out_net = fifo_data_4.data_out;
  assign rotate_even_empty_out_net = fifo_data_4.empty;
  assign rotate_odd_rdy_out_net = passthrough_data_11.rdy_ext;
  assign passthrough_data_11.valid = rotate_odd_rdy_out & rotate_odd_valid_in;
  assign passthrough_data_11.data = { rotate_odd_sin_val_in, rotate_odd_cos_val_in, rotate_odd_x_odd_in, rotate_odd_x_even_in };
  assign fifo_data_5.rden = rotate_odd_rden_in;
  assign rotate_odd_result_out_net = fifo_data_5.data_out;
  assign rotate_odd_empty_out_net = fifo_data_5.empty;
  always_comb begin
    rst_and_startup_done_out_net = _reset_control_rst_and_startup_done_out;
    reg_rst_delayed = _reset_control_rst_delayed_out;
    reset_sequence_finished_this_cycle = _reset_control_reset_sequence_finished_this_cycle_out;
    has_startup_completed_delayed_0 = _has_startup_completed_delayed_0_delay_chain_data_out;
    has_startup_completed_delayed_1 = _has_startup_completed_delayed_1_delay_chain_data_out;
    has_startup_completed_delayed_2 = _has_startup_completed_delayed_2_delay_chain_data_out;
    has_startup_completed_delayed_3 = _has_startup_completed_delayed_3_delay_chain_data_out;
    has_startup_completed_delayed_4 = _has_startup_completed_delayed_4_delay_chain_data_out;
    has_startup_completed_delayed_5 = _has_startup_completed_delayed_5_delay_chain_data_out;
    fifo_data_0.overflow = _fifo_0_forward_cos_Return_overflow_out;
    fifo_data_0.underflow = _fifo_0_forward_cos_Return_underflow_out;
    fifo_data_0.empty = _fifo_0_forward_cos_Return_empty;
    fifo_data_0.almost_full = _fifo_0_forward_cos_Return_full;
    fifo_data_1.overflow = _fifo_1_forward_sin_Return_overflow_out;
    fifo_data_1.underflow = _fifo_1_forward_sin_Return_underflow_out;
    fifo_data_1.empty = _fifo_1_forward_sin_Return_empty;
    fifo_data_1.almost_full = _fifo_1_forward_sin_Return_full;
    fifo_data_2.overflow = _fifo_2_read_cos_forwarded_Return_overflow_out;
    fifo_data_2.underflow = _fifo_2_read_cos_forwarded_Return_underflow_out;
    fifo_data_2.empty = _fifo_2_read_cos_forwarded_Return_empty;
    fifo_data_2.almost_full = _fifo_2_read_cos_forwarded_Return_full;
    fifo_data_2.data_out = _fifo_2_read_cos_forwarded_Return_q;
    fifo_data_3.overflow = _fifo_3_read_sin_forwarded_Return_overflow_out;
    fifo_data_3.underflow = _fifo_3_read_sin_forwarded_Return_underflow_out;
    fifo_data_3.empty = _fifo_3_read_sin_forwarded_Return_empty;
    fifo_data_3.almost_full = _fifo_3_read_sin_forwarded_Return_full;
    fifo_data_3.data_out = _fifo_3_read_sin_forwarded_Return_q;
    fifo_data_4.overflow = _fifo_4_rotate_even_Return_overflow_out;
    fifo_data_4.underflow = _fifo_4_rotate_even_Return_underflow_out;
    fifo_data_4.empty = _fifo_4_rotate_even_Return_empty;
    fifo_data_4.almost_full = _fifo_4_rotate_even_Return_full;
    fifo_data_4.data_out = _fifo_4_rotate_even_Return_q;
    fifo_data_5.overflow = _fifo_5_rotate_odd_Return_overflow_out;
    fifo_data_5.underflow = _fifo_5_rotate_odd_Return_underflow_out;
    fifo_data_5.empty = _fifo_5_rotate_odd_Return_empty;
    fifo_data_5.almost_full = _fifo_5_rotate_odd_Return_full;
    fifo_data_5.data_out = _fifo_5_rotate_odd_Return_q;
    fifo_data_0.wren = _forward_cos_BasicBlock_0Impl_fifo_wren_0;	// rope_apply.k:35:9
    passthrough_data_6.rdy_int = _forward_cos_BasicBlock_0Impl_input_rdy_0;	// rope_apply.k:35:9
    fifo_data_1.wren = _forward_sin_BasicBlock_0Impl_fifo_wren_0;	// rope_apply.k:40:9
    passthrough_data_7.rdy_int = _forward_sin_BasicBlock_0Impl_input_rdy_0;	// rope_apply.k:40:9
    fifo_data_2.data_in = _read_cos_forwarded_BasicBlock_0Impl_fifo_data_out_0;	// rope_apply.k:47:9
    fifo_data_2.wren = _read_cos_forwarded_BasicBlock_0Impl_fifo_wren_0;	// rope_apply.k:47:9
    passthrough_data_8.rdy_int = _read_cos_forwarded_BasicBlock_0Impl_input_rdy_0;	// rope_apply.k:47:9
    fifo_data_3.data_in = _read_sin_forwarded_BasicBlock_0Impl_fifo_data_out_0;	// rope_apply.k:54:9
    fifo_data_3.wren = _read_sin_forwarded_BasicBlock_0Impl_fifo_wren_0;	// rope_apply.k:54:9
    passthrough_data_9.rdy_int = _read_sin_forwarded_BasicBlock_0Impl_input_rdy_0;	// rope_apply.k:54:9
    fifo_data_4.data_in = _rotate_even_BasicBlock_0Impl_fifo_data_out_0;	// rope_apply.k:67:9
    fifo_data_4.wren = _rotate_even_BasicBlock_0Impl_fifo_wren_0;	// rope_apply.k:67:9
    passthrough_data_10.rdy_int = _rotate_even_BasicBlock_0Impl_input_rdy_0;	// rope_apply.k:67:9
    fifo_data_5.data_in = _rotate_odd_BasicBlock_0Impl_fifo_data_out_0;	// rope_apply.k:273:9
    fifo_data_5.wren = _rotate_odd_BasicBlock_0Impl_fifo_wren_0;	// rope_apply.k:273:9
    passthrough_data_11.rdy_int = _rotate_odd_BasicBlock_0Impl_input_rdy_0;	// rope_apply.k:273:9
  end // always_comb

  assign has_startup_completed_raw = 1'b1;
  assign stall_rate_supported_out_net = 1'b0;
  KanagawaResetControl #(
    .WIDTH(12),
    .DELAY_CYCLES(3),
    .FAN_OUT_LEVELS(1),
    .HOLD_CYCLES(24),
    .ADDTIONAL_LATENCY(1),
    .INIT_VAL(1)
  ) reset_control (
    .clk                                    (clk),
    .rst_in                                 (combined_reset),
    .has_others_completed_in                (has_startup_completed_raw),
    .rst_and_startup_done_out               (_reset_control_rst_and_startup_done_out),
    .rst_delayed_out                        (_reset_control_rst_delayed_out),
    .reset_sequence_finished_this_cycle_out
      (_reset_control_reset_sequence_finished_this_cycle_out)
  );
  rope_apply_reg_256_w1 _cos_seg_element_0 (	// rope_apply.k:27:5
    .clk           (clk),	// rope_apply.k:27:5
    .input_valid_0
      (_forward_cos_BasicBlock_0Impl_global_out__cos_seg_element_0_18_0_valid),	// rope_apply.k:35:9
    .input_0       (_forward_cos_BasicBlock_0Impl_global_out__cos_seg_element_0_18_0),	// rope_apply.k:35:9
    .value_out     (__cos_seg_element_0_value_out)
  );	// rope_apply.k:27:5
  rope_apply_reg_256_w1 _cos_seg_element_1 (	// rope_apply.k:27:5
    .clk           (clk),	// rope_apply.k:27:5
    .input_valid_0
      (_forward_cos_BasicBlock_0Impl_global_out__cos_seg_element_1_19_0_valid),	// rope_apply.k:35:9
    .input_0       (_forward_cos_BasicBlock_0Impl_global_out__cos_seg_element_1_19_0),	// rope_apply.k:35:9
    .value_out     (__cos_seg_element_1_value_out)
  );	// rope_apply.k:27:5
  rope_apply_reg_256_w1 _cos_seg_element_2 (	// rope_apply.k:27:5
    .clk           (clk),	// rope_apply.k:27:5
    .input_valid_0
      (_forward_cos_BasicBlock_0Impl_global_out__cos_seg_element_2_20_0_valid),	// rope_apply.k:35:9
    .input_0       (_forward_cos_BasicBlock_0Impl_global_out__cos_seg_element_2_20_0),	// rope_apply.k:35:9
    .value_out     (__cos_seg_element_2_value_out)
  );	// rope_apply.k:27:5
  rope_apply_reg_256_w1 _cos_seg_element_3 (	// rope_apply.k:27:5
    .clk           (clk),	// rope_apply.k:27:5
    .input_valid_0
      (_forward_cos_BasicBlock_0Impl_global_out__cos_seg_element_3_21_0_valid),	// rope_apply.k:35:9
    .input_0       (_forward_cos_BasicBlock_0Impl_global_out__cos_seg_element_3_21_0),	// rope_apply.k:35:9
    .value_out     (__cos_seg_element_3_value_out)
  );	// rope_apply.k:27:5
  rope_apply_reg_256_w1 _sin_seg_element_0 (	// rope_apply.k:28:5
    .clk           (clk),	// rope_apply.k:27:5
    .input_valid_0
      (_forward_sin_BasicBlock_0Impl_global_out__sin_seg_element_0_22_0_valid),	// rope_apply.k:40:9
    .input_0       (_forward_sin_BasicBlock_0Impl_global_out__sin_seg_element_0_22_0),	// rope_apply.k:40:9
    .value_out     (__sin_seg_element_0_value_out)
  );	// rope_apply.k:28:5
  rope_apply_reg_256_w1 _sin_seg_element_1 (	// rope_apply.k:28:5
    .clk           (clk),	// rope_apply.k:27:5
    .input_valid_0
      (_forward_sin_BasicBlock_0Impl_global_out__sin_seg_element_1_23_0_valid),	// rope_apply.k:40:9
    .input_0       (_forward_sin_BasicBlock_0Impl_global_out__sin_seg_element_1_23_0),	// rope_apply.k:40:9
    .value_out     (__sin_seg_element_1_value_out)
  );	// rope_apply.k:28:5
  rope_apply_reg_256_w1 _sin_seg_element_2 (	// rope_apply.k:28:5
    .clk           (clk),	// rope_apply.k:27:5
    .input_valid_0
      (_forward_sin_BasicBlock_0Impl_global_out__sin_seg_element_2_24_0_valid),	// rope_apply.k:40:9
    .input_0       (_forward_sin_BasicBlock_0Impl_global_out__sin_seg_element_2_24_0),	// rope_apply.k:40:9
    .value_out     (__sin_seg_element_2_value_out)
  );	// rope_apply.k:28:5
  rope_apply_reg_256_w1 _sin_seg_element_3 (	// rope_apply.k:28:5
    .clk           (clk),	// rope_apply.k:27:5
    .input_valid_0
      (_forward_sin_BasicBlock_0Impl_global_out__sin_seg_element_3_25_0_valid),	// rope_apply.k:40:9
    .input_0       (_forward_sin_BasicBlock_0Impl_global_out__sin_seg_element_3_25_0),	// rope_apply.k:40:9
    .value_out     (__sin_seg_element_3_value_out)
  );	// rope_apply.k:28:5
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) has_startup_completed_delayed_0_delay_chain (
    .clk      (clk),
    .data_in  (has_others_completed),
    .data_out (_has_startup_completed_delayed_0_delay_chain_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) has_startup_completed_delayed_1_delay_chain (
    .clk      (clk),
    .data_in  (has_others_completed),
    .data_out (_has_startup_completed_delayed_1_delay_chain_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) has_startup_completed_delayed_2_delay_chain (
    .clk      (clk),
    .data_in  (has_others_completed),
    .data_out (_has_startup_completed_delayed_2_delay_chain_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) has_startup_completed_delayed_3_delay_chain (
    .clk      (clk),
    .data_in  (has_others_completed),
    .data_out (_has_startup_completed_delayed_3_delay_chain_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) has_startup_completed_delayed_4_delay_chain (
    .clk      (clk),
    .data_in  (has_others_completed),
    .data_out (_has_startup_completed_delayed_4_delay_chain_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) has_startup_completed_delayed_5_delay_chain (
    .clk      (clk),
    .data_in  (has_others_completed),
    .data_out (_has_startup_completed_delayed_5_delay_chain_data_out)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(0),
    .PORT_WIDTH(1),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_0_forward_cos_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(0)
  ) fifo_0_forward_cos_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[0]),
    .overflow_out  (_fifo_0_forward_cos_Return_overflow_out),
    .underflow_out (_fifo_0_forward_cos_Return_underflow_out),
    .empty         (_fifo_0_forward_cos_Return_empty),
    .rdreq         (fifo_data_0.rden),
    .full          (_fifo_0_forward_cos_Return_full),
    .wrreq         (fifo_data_0.wren),
    .data          ('0),
    .q             (/* unused */)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(0),
    .PORT_WIDTH(1),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_1_forward_sin_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(0)
  ) fifo_1_forward_sin_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[1]),
    .overflow_out  (_fifo_1_forward_sin_Return_overflow_out),
    .underflow_out (_fifo_1_forward_sin_Return_underflow_out),
    .empty         (_fifo_1_forward_sin_Return_empty),
    .rdreq         (fifo_data_1.rden),
    .full          (_fifo_1_forward_sin_Return_full),
    .wrreq         (fifo_data_1.wren),
    .data          ('0),
    .q             (/* unused */)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(256),
    .PORT_WIDTH(256),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_2_read_cos_forwarded_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(1)
  ) fifo_2_read_cos_forwarded_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[2]),
    .overflow_out  (_fifo_2_read_cos_forwarded_Return_overflow_out),
    .underflow_out (_fifo_2_read_cos_forwarded_Return_underflow_out),
    .empty         (_fifo_2_read_cos_forwarded_Return_empty),
    .rdreq         (fifo_data_2.rden),
    .full          (_fifo_2_read_cos_forwarded_Return_full),
    .wrreq         (fifo_data_2.wren),
    .data          (fifo_data_2.data_in),
    .q             (_fifo_2_read_cos_forwarded_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(256),
    .PORT_WIDTH(256),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_3_read_sin_forwarded_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(1)
  ) fifo_3_read_sin_forwarded_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[3]),
    .overflow_out  (_fifo_3_read_sin_forwarded_Return_overflow_out),
    .underflow_out (_fifo_3_read_sin_forwarded_Return_underflow_out),
    .empty         (_fifo_3_read_sin_forwarded_Return_empty),
    .rdreq         (fifo_data_3.rden),
    .full          (_fifo_3_read_sin_forwarded_Return_full),
    .wrreq         (fifo_data_3.wren),
    .data          (fifo_data_3.data_in),
    .q             (_fifo_3_read_sin_forwarded_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(16),
    .PORT_WIDTH(16),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_4_rotate_even_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(10),
    .USE_LUTRAM(1)
  ) fifo_4_rotate_even_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[4]),
    .overflow_out  (_fifo_4_rotate_even_Return_overflow_out),
    .underflow_out (_fifo_4_rotate_even_Return_underflow_out),
    .empty         (_fifo_4_rotate_even_Return_empty),
    .rdreq         (fifo_data_4.rden),
    .full          (_fifo_4_rotate_even_Return_full),
    .wrreq         (fifo_data_4.wren),
    .data          (fifo_data_4.data_in),
    .q             (_fifo_4_rotate_even_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(16),
    .PORT_WIDTH(16),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_5_rotate_odd_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(10),
    .USE_LUTRAM(1)
  ) fifo_5_rotate_odd_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[5]),
    .overflow_out  (_fifo_5_rotate_odd_Return_overflow_out),
    .underflow_out (_fifo_5_rotate_odd_Return_underflow_out),
    .empty         (_fifo_5_rotate_odd_Return_empty),
    .rdreq         (fifo_data_5.rden),
    .full          (_fifo_5_rotate_odd_Return_full),
    .wrreq         (fifo_data_5.wren),
    .data          (fifo_data_5.data_in),
    .q             (_fifo_5_rotate_odd_Return_q)
  );
  rope_apply_forward_cos_BasicBlock_0 forward_cos_BasicBlock_0Impl (	// rope_apply.k:35:9
    .clk                                      (clk),	// rope_apply.k:35:9
    .rst                                      (reg_rst_delayed[6]),	// rope_apply.k:35:9
    .done_out                                 (/* unused */),
    .global_out__cos_seg_element_0_18_0_valid
      (_forward_cos_BasicBlock_0Impl_global_out__cos_seg_element_0_18_0_valid),
    .global_out__cos_seg_element_0_18_0
      (_forward_cos_BasicBlock_0Impl_global_out__cos_seg_element_0_18_0),
    .global_out__cos_seg_element_1_19_0_valid
      (_forward_cos_BasicBlock_0Impl_global_out__cos_seg_element_1_19_0_valid),
    .global_out__cos_seg_element_1_19_0
      (_forward_cos_BasicBlock_0Impl_global_out__cos_seg_element_1_19_0),
    .global_out__cos_seg_element_2_20_0_valid
      (_forward_cos_BasicBlock_0Impl_global_out__cos_seg_element_2_20_0_valid),
    .global_out__cos_seg_element_2_20_0
      (_forward_cos_BasicBlock_0Impl_global_out__cos_seg_element_2_20_0),
    .global_out__cos_seg_element_3_21_0_valid
      (_forward_cos_BasicBlock_0Impl_global_out__cos_seg_element_3_21_0_valid),
    .global_out__cos_seg_element_3_21_0
      (_forward_cos_BasicBlock_0Impl_global_out__cos_seg_element_3_21_0),
    .fifo_wren_0                              (_forward_cos_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0                (fifo_data_0.almost_full),	// rope_apply.k:35:9
    .fifo_overflow_in_0                       (fifo_data_0.overflow),	// rope_apply.k:35:9
    .data_in_6                                (passthrough_data_6.data),	// rope_apply.k:35:9
    .input_fifo_underflow_0                   (passthrough_data_6.underflow),	// rope_apply.k:35:9
    .input_rdy_0                              (_forward_cos_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0                            (passthrough_data_6.valid),	// rope_apply.k:35:9
    .control_state_out                        (/* unused */)
  );	// rope_apply.k:35:9
  rope_apply_forward_sin_BasicBlock_0 forward_sin_BasicBlock_0Impl (	// rope_apply.k:40:9
    .clk                                      (clk),	// rope_apply.k:40:9
    .rst                                      (reg_rst_delayed[7]),	// rope_apply.k:40:9
    .done_out                                 (/* unused */),
    .global_out__sin_seg_element_0_22_0_valid
      (_forward_sin_BasicBlock_0Impl_global_out__sin_seg_element_0_22_0_valid),
    .global_out__sin_seg_element_0_22_0
      (_forward_sin_BasicBlock_0Impl_global_out__sin_seg_element_0_22_0),
    .global_out__sin_seg_element_1_23_0_valid
      (_forward_sin_BasicBlock_0Impl_global_out__sin_seg_element_1_23_0_valid),
    .global_out__sin_seg_element_1_23_0
      (_forward_sin_BasicBlock_0Impl_global_out__sin_seg_element_1_23_0),
    .global_out__sin_seg_element_2_24_0_valid
      (_forward_sin_BasicBlock_0Impl_global_out__sin_seg_element_2_24_0_valid),
    .global_out__sin_seg_element_2_24_0
      (_forward_sin_BasicBlock_0Impl_global_out__sin_seg_element_2_24_0),
    .global_out__sin_seg_element_3_25_0_valid
      (_forward_sin_BasicBlock_0Impl_global_out__sin_seg_element_3_25_0_valid),
    .global_out__sin_seg_element_3_25_0
      (_forward_sin_BasicBlock_0Impl_global_out__sin_seg_element_3_25_0),
    .fifo_wren_0                              (_forward_sin_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0                (fifo_data_1.almost_full),	// rope_apply.k:40:9
    .fifo_overflow_in_0                       (fifo_data_1.overflow),	// rope_apply.k:40:9
    .data_in_7                                (passthrough_data_7.data),	// rope_apply.k:40:9
    .input_fifo_underflow_0                   (passthrough_data_7.underflow),	// rope_apply.k:40:9
    .input_rdy_0                              (_forward_sin_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0                            (passthrough_data_7.valid),	// rope_apply.k:40:9
    .control_state_out                        (/* unused */)
  );	// rope_apply.k:40:9
  rope_apply_read_cos_forwarded_BasicBlock_0 read_cos_forwarded_BasicBlock_0Impl (	// rope_apply.k:47:9
    .clk                             (clk),	// rope_apply.k:47:9
    .rst                             (reg_rst_delayed[8]),	// rope_apply.k:47:9
    .done_out                        (/* unused */),
    .global_in__cos_seg_element_0_18 (__cos_seg_element_0_value_out),	// rope_apply.k:27:5
    .global_in__cos_seg_element_1_19 (__cos_seg_element_1_value_out),	// rope_apply.k:27:5
    .global_in__cos_seg_element_2_20 (__cos_seg_element_2_value_out),	// rope_apply.k:27:5
    .global_in__cos_seg_element_3_21 (__cos_seg_element_3_value_out),	// rope_apply.k:27:5
    .fifo_data_out_0
      (_read_cos_forwarded_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0                     (_read_cos_forwarded_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0       (fifo_data_2.almost_full),	// rope_apply.k:47:9
    .fifo_overflow_in_0              (fifo_data_2.overflow),	// rope_apply.k:47:9
    .data_in_8                       (passthrough_data_8.data),	// rope_apply.k:47:9
    .input_fifo_underflow_0          (passthrough_data_8.underflow),	// rope_apply.k:47:9
    .input_rdy_0                     (_read_cos_forwarded_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0                   (passthrough_data_8.valid),	// rope_apply.k:47:9
    .control_state_out               (/* unused */)
  );	// rope_apply.k:47:9
  rope_apply_read_sin_forwarded_BasicBlock_0 read_sin_forwarded_BasicBlock_0Impl (	// rope_apply.k:54:9
    .clk                             (clk),	// rope_apply.k:54:9
    .rst                             (reg_rst_delayed[9]),	// rope_apply.k:54:9
    .done_out                        (/* unused */),
    .global_in__sin_seg_element_0_22 (__sin_seg_element_0_value_out),	// rope_apply.k:28:5
    .global_in__sin_seg_element_1_23 (__sin_seg_element_1_value_out),	// rope_apply.k:28:5
    .global_in__sin_seg_element_2_24 (__sin_seg_element_2_value_out),	// rope_apply.k:28:5
    .global_in__sin_seg_element_3_25 (__sin_seg_element_3_value_out),	// rope_apply.k:28:5
    .fifo_data_out_0
      (_read_sin_forwarded_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0                     (_read_sin_forwarded_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0       (fifo_data_3.almost_full),	// rope_apply.k:54:9
    .fifo_overflow_in_0              (fifo_data_3.overflow),	// rope_apply.k:54:9
    .data_in_9                       (passthrough_data_9.data),	// rope_apply.k:54:9
    .input_fifo_underflow_0          (passthrough_data_9.underflow),	// rope_apply.k:54:9
    .input_rdy_0                     (_read_sin_forwarded_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0                   (passthrough_data_9.valid),	// rope_apply.k:54:9
    .control_state_out               (/* unused */)
  );	// rope_apply.k:54:9
  rope_apply_rotate_even_BasicBlock_0 rotate_even_BasicBlock_0Impl (	// rope_apply.k:67:9
    .clk                       (clk),	// rope_apply.k:67:9
    .rst                       (reg_rst_delayed[10]),	// rope_apply.k:67:9
    .done_out                  (/* unused */),
    .fifo_data_out_0           (_rotate_even_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0               (_rotate_even_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_4.almost_full),	// rope_apply.k:67:9
    .fifo_overflow_in_0        (fifo_data_4.overflow),	// rope_apply.k:67:9
    .data_in_10                (passthrough_data_10.data),	// rope_apply.k:67:9
    .input_fifo_underflow_0    (passthrough_data_10.underflow),	// rope_apply.k:67:9
    .input_rdy_0               (_rotate_even_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_10.valid),	// rope_apply.k:67:9
    .control_state_out         (/* unused */)
  );	// rope_apply.k:67:9
  rope_apply_rotate_odd_BasicBlock_0 rotate_odd_BasicBlock_0Impl (	// rope_apply.k:273:9
    .clk                       (clk),	// rope_apply.k:273:9
    .rst                       (reg_rst_delayed[11]),	// rope_apply.k:273:9
    .done_out                  (/* unused */),
    .fifo_data_out_0           (_rotate_odd_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0               (_rotate_odd_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_5.almost_full),	// rope_apply.k:273:9
    .fifo_overflow_in_0        (fifo_data_5.overflow),	// rope_apply.k:273:9
    .data_in_11                (passthrough_data_11.data),	// rope_apply.k:273:9
    .input_fifo_underflow_0    (passthrough_data_11.underflow),	// rope_apply.k:273:9
    .input_rdy_0               (_rotate_odd_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_11.valid),	// rope_apply.k:273:9
    .control_state_out         (/* unused */)
  );	// rope_apply.k:273:9
  assign rst_and_startup_done_out = rst_and_startup_done_out_net;
  assign forward_cos_rdy_out = forward_cos_rdy_out_net;
  assign forward_cos_empty_out = forward_cos_empty_out_net;
  assign forward_sin_rdy_out = forward_sin_rdy_out_net;
  assign forward_sin_empty_out = forward_sin_empty_out_net;
  assign read_cos_forwarded_rdy_out = read_cos_forwarded_rdy_out_net;
  assign read_cos_forwarded_empty_out = read_cos_forwarded_empty_out_net;
  assign read_cos_forwarded_result_out = read_cos_forwarded_result_out_net;
  assign read_sin_forwarded_rdy_out = read_sin_forwarded_rdy_out_net;
  assign read_sin_forwarded_empty_out = read_sin_forwarded_empty_out_net;
  assign read_sin_forwarded_result_out = read_sin_forwarded_result_out_net;
  assign rotate_even_rdy_out = rotate_even_rdy_out_net;
  assign rotate_even_empty_out = rotate_even_empty_out_net;
  assign rotate_even_result_out = rotate_even_result_out_net;
  assign rotate_odd_rdy_out = rotate_odd_rdy_out_net;
  assign rotate_odd_empty_out = rotate_odd_empty_out_net;
  assign rotate_odd_result_out = rotate_odd_result_out_net;
  assign stall_rate_supported_out = stall_rate_supported_out_net;
endmodule

module rope_apply_EsiWrapper(
     input  wire                                                                                                       clk,
     input  wire                                                                                                       rst,
     input  wire [2:0]                                                                                                 stall_rate_in,
     input  wire                                                                                                       stall_rate_valid_in,
     input  wire struct packed {logic [1:0] phase; logic [255:0] v; }                                                  forward_cos_arg,
     input  wire                                                                                                       forward_cos_arg_valid,
     input  wire struct packed {logic [1:0] phase; logic [255:0] v; }                                                  forward_sin_arg,
     input  wire                                                                                                       forward_sin_arg_valid,
     input  wire struct packed {logic [1:0] phase; }                                                                   read_cos_forwarded_arg,
     input  wire                                                                                                       read_cos_forwarded_arg_valid,
     input  wire struct packed {logic [1:0] phase; }                                                                   read_sin_forwarded_arg,
     input  wire                                                                                                       read_sin_forwarded_arg_valid,
     input  wire struct packed {logic [15:0] x_even; logic [15:0] x_odd; logic [15:0] cos_val; logic [15:0] sin_val; } rotate_even_arg,
     input  wire                                                                                                       rotate_even_arg_valid,
     input  wire struct packed {logic [15:0] x_even; logic [15:0] x_odd; logic [15:0] cos_val; logic [15:0] sin_val; } rotate_odd_arg,
     input  wire                                                                                                       rotate_odd_arg_valid,
     input  wire                                                                                                       forward_cos_result_rden,
     input  wire                                                                                                       forward_sin_result_rden,
     input  wire                                                                                                       read_cos_forwarded_result_rden,
     input  wire                                                                                                       read_sin_forwarded_result_rden,
     input  wire                                                                                                       rotate_even_result_rden,
     input  wire                                                                                                       rotate_odd_result_rden,
     output wire                                                                                                       forward_cos_arg_ready,
     output wire                                                                                                       forward_sin_arg_ready,
     output wire                                                                                                       read_cos_forwarded_arg_ready,
     output wire                                                                                                       read_sin_forwarded_arg_ready,
     output wire                                                                                                       rotate_even_arg_ready,
     output wire                                                                                                       rotate_odd_arg_ready,
  // output wire /*Zero Width*/                                                                                        forward_cos_result,
     output wire                                                                                                       forward_cos_result_empty,
  // output wire /*Zero Width*/                                                                                        forward_sin_result,
     output wire                                                                                                       forward_sin_result_empty,
     output wire [255:0]                                                                                               read_cos_forwarded_result,
     output wire                                                                                                       read_cos_forwarded_result_empty,
     output wire [255:0]                                                                                               read_sin_forwarded_result,
     output wire                                                                                                       read_sin_forwarded_result_empty,
     output wire [15:0]                                                                                                rotate_even_result,
     output wire                                                                                                       rotate_even_result_empty,
     output wire [15:0]                                                                                                rotate_odd_result,
     output wire                                                                                                       rotate_odd_result_empty,
     output wire                                                                                                       rst_and_startup_done_out,
     output wire                                                                                                       stall_rate_supported_out
);

  wire [255:0] _EsiWrapped_read_cos_forwarded_result_out;
  wire [255:0] _EsiWrapped_read_sin_forwarded_result_out;
  wire [15:0]  _EsiWrapped_rotate_even_result_out;
  wire [15:0]  _EsiWrapped_rotate_odd_result_out;
  rope_apply EsiWrapped (
    .clk                           (clk),
    .rst                           (rst),
    .forward_cos_valid_in          (forward_cos_arg_valid),
    .forward_cos_phase_in          (forward_cos_arg.phase),
    .forward_cos_v_in              (forward_cos_arg.v),
    .forward_cos_rden_in           (forward_cos_result_rden),
    .forward_sin_valid_in          (forward_sin_arg_valid),
    .forward_sin_phase_in          (forward_sin_arg.phase),
    .forward_sin_v_in              (forward_sin_arg.v),
    .forward_sin_rden_in           (forward_sin_result_rden),
    .read_cos_forwarded_valid_in   (read_cos_forwarded_arg_valid),
    .read_cos_forwarded_phase_in   (read_cos_forwarded_arg.phase),
    .read_cos_forwarded_rden_in    (read_cos_forwarded_result_rden),
    .read_sin_forwarded_valid_in   (read_sin_forwarded_arg_valid),
    .read_sin_forwarded_phase_in   (read_sin_forwarded_arg.phase),
    .read_sin_forwarded_rden_in    (read_sin_forwarded_result_rden),
    .rotate_even_valid_in          (rotate_even_arg_valid),
    .rotate_even_x_even_in         (rotate_even_arg.x_even),
    .rotate_even_x_odd_in          (rotate_even_arg.x_odd),
    .rotate_even_cos_val_in        (rotate_even_arg.cos_val),
    .rotate_even_sin_val_in        (rotate_even_arg.sin_val),
    .rotate_even_rden_in           (rotate_even_result_rden),
    .rotate_odd_valid_in           (rotate_odd_arg_valid),
    .rotate_odd_x_even_in          (rotate_odd_arg.x_even),
    .rotate_odd_x_odd_in           (rotate_odd_arg.x_odd),
    .rotate_odd_cos_val_in         (rotate_odd_arg.cos_val),
    .rotate_odd_sin_val_in         (rotate_odd_arg.sin_val),
    .rotate_odd_rden_in            (rotate_odd_result_rden),
    .stall_rate_in                 (stall_rate_in),
    .stall_rate_valid_in           (stall_rate_valid_in),
    .rst_and_startup_done_out      (rst_and_startup_done_out),
    .forward_cos_rdy_out           (forward_cos_arg_ready),
    .forward_cos_empty_out         (forward_cos_result_empty),
    .forward_sin_rdy_out           (forward_sin_arg_ready),
    .forward_sin_empty_out         (forward_sin_result_empty),
    .read_cos_forwarded_rdy_out    (read_cos_forwarded_arg_ready),
    .read_cos_forwarded_empty_out  (read_cos_forwarded_result_empty),
    .read_cos_forwarded_result_out (_EsiWrapped_read_cos_forwarded_result_out),
    .read_sin_forwarded_rdy_out    (read_sin_forwarded_arg_ready),
    .read_sin_forwarded_empty_out  (read_sin_forwarded_result_empty),
    .read_sin_forwarded_result_out (_EsiWrapped_read_sin_forwarded_result_out),
    .rotate_even_rdy_out           (rotate_even_arg_ready),
    .rotate_even_empty_out         (rotate_even_result_empty),
    .rotate_even_result_out        (_EsiWrapped_rotate_even_result_out),
    .rotate_odd_rdy_out            (rotate_odd_arg_ready),
    .rotate_odd_empty_out          (rotate_odd_result_empty),
    .rotate_odd_result_out         (_EsiWrapped_rotate_odd_result_out),
    .stall_rate_supported_out      (stall_rate_supported_out)
  );
  // Zero width: assign forward_cos_result = /*Zero width*/;
  // Zero width: assign forward_sin_result = /*Zero width*/;
  assign read_cos_forwarded_result = _EsiWrapped_read_cos_forwarded_result_out;
  assign read_sin_forwarded_result = _EsiWrapped_read_sin_forwarded_result_out;
  assign rotate_even_result = _EsiWrapped_rotate_even_result_out;
  assign rotate_odd_result = _EsiWrapped_rotate_odd_result_out;
endmodule

