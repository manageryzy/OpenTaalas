
// This file was generated. Do not modify.
// kanagawa --backend=sv --import-dir=/home/mana/workspace/OpenTaalas/third-party/kanagawa/library --base-library=/home/mana/workspace/OpenTaalas/third-party/kanagawa/library/mini-base.k --output=/home/mana/workspace/OpenTaalas/rtl/generated/kanagawa/dequant --frequency=250 --register-ratio=8 --max-register-ratio=16 /home/mana/workspace/OpenTaalas/rtl/kanagawa/dequant.k

`default_nettype wire
module dequant_unitDebugView_dequantizeEntry
(
    input wire clk,
    input wire[23:0]  _accum,
    input wire[15:0]  _super_scale_bf16,
    input wire[3:0]  _sub_scale,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("dequantizeEntry time: %0t accum: %p super_scale_bf16: %p sub_scale: %p", $time, _accum, _super_scale_bf16, _sub_scale);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module dequant_unitDebugView_dequantizeExit
(
    input wire clk,
    input wire[31:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("dequantizeExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
`ifndef _TYPESCOPE_CoreModuleTypeScope
`define _TYPESCOPE_CoreModuleTypeScope
`endif // _TYPESCOPE_CoreModuleTypeScope
module dequant_unit_dequantize_BasicBlock_0(	// dequant.k:19:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  output wire [31:0] fifo_data_out_0,
  output wire        fifo_wren_0,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [43:0] data_in_1,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  logic        done_out_0;	// dequant.k:19:9
  logic [31:0] fifo_data_out_0_0;	// dequant.k:19:9
  logic        fifo_wren_0_0;	// dequant.k:19:9
  logic        input_rdy_0_0;	// dequant.k:19:9
  logic [7:0]  control_state_out_0;	// dequant.k:19:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// dequant.k:19:9
  always_comb begin	// dequant.k:19:9
    input_rdy_0_0 = _GEN;	// dequant.k:19:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// dequant.k:19:9
  end // always_comb
  reg   [23:0] p0_accum;	// dequant.k:19:9
  reg   [15:0] p0_super_scale_bf16;	// dequant.k:19:9
  reg   [3:0]  p0_sub_scale;	// dequant.k:19:9
  reg          p0_stage1_enable = 1'h0;	// dequant.k:19:9
  reg   [31:0] p0_scaled;	// dequant.k:19:9
  reg   [15:0] p0_super_scale_bf16_0;	// dequant.k:19:9
  reg          p0_stage2_enable = 1'h0;	// dequant.k:19:9
  reg   [31:0] p0_mag;	// dequant.k:19:9
  reg   [31:0] p0_tmp;	// dequant.k:19:9
  reg          p0__tmp_and_4294901760_ne_0_;	// dequant.k:19:9
  reg          p0__tmp_and_65280_ne_0_;	// dequant.k:19:9
  reg          p0__scaled_lt_0_;	// dequant.k:19:9
  reg   [15:0] p0_super_scale_bf16_1;	// dequant.k:19:9
  reg          p0_stage3_enable = 1'h0;	// dequant.k:19:9
  reg   [15:0] p0_super_scale_bf16_2;	// dequant.k:19:9
  reg   [31:0] p0_fp_accum;	// dequant.k:19:9
  reg          p0_stage4_enable = 1'h0;	// dequant.k:19:9
  reg   [31:0] p0_fp_accum_0;	// dequant.k:19:9
  reg   [31:0] p0__cast_lt_uint32_gt_super_scale_bf16_shl_16_;	// dequant.k:19:9
  reg   [20:0] p0__prod_plus_ma32_shl_8_;	// dequant.k:19:9
  reg   [10:0] p0_CastSource;	// dequant.k:19:9
  reg   [19:0] p0_prod;	// dequant.k:19:9
  reg   [10:0] p0_cast_lt_uint32_gt_ma_;	// dequant.k:19:9
  reg          p0_stage5_enable = 1'h0;	// dequant.k:19:9
  wire         prod = p0__prod_plus_ma32_shl_8_[20] & p0_CastSource[8];	// dequant.k:19:9, :105:{13,17}
  wire         prod_0 =
    p0__prod_plus_ma32_shl_8_[19]
      ? p0_prod[19] | p0_CastSource[8]
      : p0_prod[19] & ~(p0_CastSource[8]);	// dequant.k:19:9, :105:{13,17}
  wire         prod_1 =
    p0__prod_plus_ma32_shl_8_[18]
      ? p0_prod[18] | p0_CastSource[8]
      : p0_prod[18] & ~(p0_CastSource[8]);	// dequant.k:19:9, :105:{13,17}
  wire         prod_2 =
    p0__prod_plus_ma32_shl_8_[17]
      ? p0_prod[17] | p0_CastSource[8]
      : p0_prod[17] & ~(p0_CastSource[8]);	// dequant.k:19:9, :105:{13,17}
  wire         prod_3 =
    p0__prod_plus_ma32_shl_8_[16]
      ? p0_prod[16] | p0_CastSource[8]
      : p0_prod[16] & ~(p0_CastSource[8]);	// dequant.k:19:9, :105:{13,17}
  wire         prod_4 =
    p0__prod_plus_ma32_shl_8_[15]
      ? p0_prod[15] | p0_CastSource[8]
      : p0_prod[15] & ~(p0_CastSource[8]);	// dequant.k:19:9, :105:{13,17}
  wire         prod_5 =
    p0__prod_plus_ma32_shl_8_[14]
      ? p0_prod[14] | p0_CastSource[8]
      : p0_prod[14] & ~(p0_CastSource[8]);	// dequant.k:19:9, :105:{13,17}
  wire         prod_6 =
    p0__prod_plus_ma32_shl_8_[13]
      ? p0_prod[13] | p0_CastSource[8]
      : p0_prod[13] & ~(p0_CastSource[8]);	// dequant.k:19:9, :105:{13,17}
  wire         prod_7 =
    p0__prod_plus_ma32_shl_8_[12]
      ? p0_prod[12] | p0_CastSource[8]
      : p0_prod[12] & ~(p0_CastSource[8]);	// dequant.k:19:9, :105:{13,17}
  wire         prod_8 =
    p0__prod_plus_ma32_shl_8_[11]
      ? p0_prod[11] | p0_CastSource[8]
      : p0_prod[11] & ~(p0_CastSource[8]);	// dequant.k:19:9, :105:{13,17}
  wire         prod_9 =
    p0__prod_plus_ma32_shl_8_[10]
      ? p0_prod[10] | p0_CastSource[8]
      : p0_prod[10] & ~(p0_CastSource[8]);	// dequant.k:19:9, :105:{13,17}
  wire         prod_10 =
    p0__prod_plus_ma32_shl_8_[9]
      ? p0_prod[9] | p0_CastSource[8]
      : p0_prod[9] & ~(p0_CastSource[8]);	// dequant.k:19:9, :105:{13,17}
  wire         prod_11 =
    p0__prod_plus_ma32_shl_8_[8]
      ? p0_prod[8] | p0_CastSource[8]
      : p0_prod[8] & ~(p0_CastSource[8]);	// dequant.k:19:9, :105:{13,17}
  wire         prod_12 =
    p0__prod_plus_ma32_shl_8_[7]
      ? p0_prod[7] | p0_CastSource[8]
      : p0_prod[7] & ~(p0_CastSource[8]);	// dequant.k:19:9, :105:{13,17}
  wire         prod_13 =
    p0__prod_plus_ma32_shl_8_[6]
      ? p0_prod[6] | p0_CastSource[8]
      : p0_prod[6] & ~(p0_CastSource[8]);	// dequant.k:19:9, :105:{13,17}
  wire         prod_14 =
    p0__prod_plus_ma32_shl_8_[5]
      ? p0_prod[5] | p0_CastSource[8]
      : p0_prod[5] & ~(p0_CastSource[8]);	// dequant.k:19:9, :105:{13,17}
  wire         prod_15 =
    p0__prod_plus_ma32_shl_8_[4]
      ? p0_prod[4] | p0_CastSource[8]
      : p0_prod[4] & ~(p0_CastSource[8]);	// dequant.k:19:9, :105:{13,17}
  wire         prod_16 =
    p0__prod_plus_ma32_shl_8_[3]
      ? p0_prod[3] | p0_CastSource[8]
      : p0_prod[3] & ~(p0_CastSource[8]);	// dequant.k:19:9, :105:{13,17}
  wire         prod_17 =
    p0__prod_plus_ma32_shl_8_[2]
      ? p0_prod[2] | p0_CastSource[8]
      : p0_prod[2] & ~(p0_CastSource[8]);	// dequant.k:19:9, :105:{13,17}
  wire         prod_18 =
    p0__prod_plus_ma32_shl_8_[1]
      ? p0_prod[1] | p0_CastSource[8]
      : p0_prod[1] & ~(p0_CastSource[8]);	// dequant.k:19:9, :105:{13,17}
  wire         prod_19 =
    p0__prod_plus_ma32_shl_8_[0]
      ? p0_prod[0] | p0_CastSource[8]
      : p0_prod[0] & ~(p0_CastSource[8]);	// dequant.k:19:9, :105:{13,17}
  wire  [21:0] _prod_plus_ma32_shl_9_ =
    22'({1'h0,
         prod,
         prod_0,
         prod_1,
         prod_2,
         prod_3,
         prod_4,
         prod_5,
         prod_6,
         prod_7,
         prod_8,
         prod_9,
         prod_10,
         prod_11,
         prod_12,
         prod_13,
         prod_14,
         prod_15,
         prod_16,
         prod_17,
         prod_18,
         prod_19} + {2'h1, p0_cast_lt_uint32_gt_ma_, 9'h0});	// dequant.k:19:9, :105:{13,17}, :106:{44,51}
  wire  [31:0] _a_exp_plus_b_exp_minus_127_ =
    32'({24'h0, p0_fp_accum_0[30:23]}
        + 32'({24'h0, p0__cast_lt_uint32_gt_super_scale_bf16_shl_16_[30:23]} - 32'h7F));	// dequant.k:19:9, :87:{28,34}
  wire         prod_20 = _prod_plus_ma32_shl_9_[21] & p0_CastSource[9];	// dequant.k:19:9, :106:{13,17,44}
  wire         prod_21 =
    _prod_plus_ma32_shl_9_[20] ? prod | p0_CastSource[9] : prod & ~(p0_CastSource[9]);	// dequant.k:19:9, :105:{13,17}, :106:{13,17,44}
  wire         prod_22 =
    _prod_plus_ma32_shl_9_[19] ? prod_0 | p0_CastSource[9] : prod_0 & ~(p0_CastSource[9]);	// dequant.k:19:9, :105:{13,17}, :106:{13,17,44}
  wire         prod_23 =
    _prod_plus_ma32_shl_9_[18] ? prod_1 | p0_CastSource[9] : prod_1 & ~(p0_CastSource[9]);	// dequant.k:19:9, :105:{13,17}, :106:{13,17,44}
  wire         prod_24 =
    _prod_plus_ma32_shl_9_[17] ? prod_2 | p0_CastSource[9] : prod_2 & ~(p0_CastSource[9]);	// dequant.k:19:9, :105:{13,17}, :106:{13,17,44}
  wire         prod_25 =
    _prod_plus_ma32_shl_9_[16] ? prod_3 | p0_CastSource[9] : prod_3 & ~(p0_CastSource[9]);	// dequant.k:19:9, :105:{13,17}, :106:{13,17,44}
  wire         prod_26 =
    _prod_plus_ma32_shl_9_[15] ? prod_4 | p0_CastSource[9] : prod_4 & ~(p0_CastSource[9]);	// dequant.k:19:9, :105:{13,17}, :106:{13,17,44}
  wire         prod_27 =
    _prod_plus_ma32_shl_9_[14] ? prod_5 | p0_CastSource[9] : prod_5 & ~(p0_CastSource[9]);	// dequant.k:19:9, :105:{13,17}, :106:{13,17,44}
  wire         prod_28 =
    _prod_plus_ma32_shl_9_[13] ? prod_6 | p0_CastSource[9] : prod_6 & ~(p0_CastSource[9]);	// dequant.k:19:9, :105:{13,17}, :106:{13,17,44}
  wire         prod_29 =
    _prod_plus_ma32_shl_9_[12] ? prod_7 | p0_CastSource[9] : prod_7 & ~(p0_CastSource[9]);	// dequant.k:19:9, :105:{13,17}, :106:{13,17,44}
  wire         prod_30 =
    _prod_plus_ma32_shl_9_[11] ? prod_8 | p0_CastSource[9] : prod_8 & ~(p0_CastSource[9]);	// dequant.k:19:9, :105:{13,17}, :106:{13,17,44}
  wire         prod_31 =
    _prod_plus_ma32_shl_9_[10] ? prod_9 | p0_CastSource[9] : prod_9 & ~(p0_CastSource[9]);	// dequant.k:19:9, :105:{13,17}, :106:{13,17,44}
  wire         prod_32 =
    _prod_plus_ma32_shl_9_[9]
      ? prod_10 | p0_CastSource[9]
      : prod_10 & ~(p0_CastSource[9]);	// dequant.k:19:9, :105:{13,17}, :106:{13,17,44}
  wire         prod_33 =
    _prod_plus_ma32_shl_9_[8]
      ? prod_11 | p0_CastSource[9]
      : prod_11 & ~(p0_CastSource[9]);	// dequant.k:19:9, :105:{13,17}, :106:{13,17,44}
  wire         prod_34 =
    _prod_plus_ma32_shl_9_[7]
      ? prod_12 | p0_CastSource[9]
      : prod_12 & ~(p0_CastSource[9]);	// dequant.k:19:9, :105:{13,17}, :106:{13,17,44}
  wire         prod_35 =
    _prod_plus_ma32_shl_9_[6]
      ? prod_13 | p0_CastSource[9]
      : prod_13 & ~(p0_CastSource[9]);	// dequant.k:19:9, :105:{13,17}, :106:{13,17,44}
  wire         prod_36 =
    _prod_plus_ma32_shl_9_[5]
      ? prod_14 | p0_CastSource[9]
      : prod_14 & ~(p0_CastSource[9]);	// dequant.k:19:9, :105:{13,17}, :106:{13,17,44}
  wire         prod_37 =
    _prod_plus_ma32_shl_9_[4]
      ? prod_15 | p0_CastSource[9]
      : prod_15 & ~(p0_CastSource[9]);	// dequant.k:19:9, :105:{13,17}, :106:{13,17,44}
  wire         prod_38 =
    _prod_plus_ma32_shl_9_[3]
      ? prod_16 | p0_CastSource[9]
      : prod_16 & ~(p0_CastSource[9]);	// dequant.k:19:9, :105:{13,17}, :106:{13,17,44}
  wire         prod_39 =
    _prod_plus_ma32_shl_9_[2]
      ? prod_17 | p0_CastSource[9]
      : prod_17 & ~(p0_CastSource[9]);	// dequant.k:19:9, :105:{13,17}, :106:{13,17,44}
  wire         prod_40 =
    _prod_plus_ma32_shl_9_[1]
      ? prod_18 | p0_CastSource[9]
      : prod_18 & ~(p0_CastSource[9]);	// dequant.k:19:9, :105:{13,17}, :106:{13,17,44}
  wire         prod_41 =
    _prod_plus_ma32_shl_9_[0]
      ? prod_19 | p0_CastSource[9]
      : prod_19 & ~(p0_CastSource[9]);	// dequant.k:19:9, :105:{13,17}, :106:{13,17,44}
  wire  [22:0] _prod_plus_ma32_shl_10_ =
    23'({1'h0,
         prod_20,
         prod_21,
         prod_22,
         prod_23,
         prod_24,
         prod_25,
         prod_26,
         prod_27,
         prod_28,
         prod_29,
         prod_30,
         prod_31,
         prod_32,
         prod_33,
         prod_34,
         prod_35,
         prod_36,
         prod_37,
         prod_38,
         prod_39,
         prod_40,
         prod_41} + {2'h1, p0_cast_lt_uint32_gt_ma_, 10'h0});	// dequant.k:19:9, :106:{13,17}, :107:{44,51}
  wire  [32:0] _r_exp_lt_255__diff = 33'({1'h0, _a_exp_plus_b_exp_minus_127_} - 33'hFF);	// dequant.k:87:{28,34}, :121:37
  wire  [22:0] _prod_plus_ma32_shl_11_ =
    23'({_prod_plus_ma32_shl_10_[22] & p0_CastSource[10],
         _prod_plus_ma32_shl_10_[21]
           ? prod_20 | p0_CastSource[10]
           : prod_20 & ~(p0_CastSource[10]),
         _prod_plus_ma32_shl_10_[20]
           ? prod_21 | p0_CastSource[10]
           : prod_21 & ~(p0_CastSource[10]),
         _prod_plus_ma32_shl_10_[19]
           ? prod_22 | p0_CastSource[10]
           : prod_22 & ~(p0_CastSource[10]),
         _prod_plus_ma32_shl_10_[18]
           ? prod_23 | p0_CastSource[10]
           : prod_23 & ~(p0_CastSource[10]),
         _prod_plus_ma32_shl_10_[17]
           ? prod_24 | p0_CastSource[10]
           : prod_24 & ~(p0_CastSource[10]),
         _prod_plus_ma32_shl_10_[16]
           ? prod_25 | p0_CastSource[10]
           : prod_25 & ~(p0_CastSource[10]),
         _prod_plus_ma32_shl_10_[15]
           ? prod_26 | p0_CastSource[10]
           : prod_26 & ~(p0_CastSource[10]),
         _prod_plus_ma32_shl_10_[14]
           ? prod_27 | p0_CastSource[10]
           : prod_27 & ~(p0_CastSource[10]),
         _prod_plus_ma32_shl_10_[13]
           ? prod_28 | p0_CastSource[10]
           : prod_28 & ~(p0_CastSource[10]),
         _prod_plus_ma32_shl_10_[12]
           ? prod_29 | p0_CastSource[10]
           : prod_29 & ~(p0_CastSource[10]),
         _prod_plus_ma32_shl_10_[11]
           ? prod_30 | p0_CastSource[10]
           : prod_30 & ~(p0_CastSource[10]),
         _prod_plus_ma32_shl_10_[10]
           ? prod_31 | p0_CastSource[10]
           : prod_31 & ~(p0_CastSource[10]),
         _prod_plus_ma32_shl_10_[9]
           ? prod_32 | p0_CastSource[10]
           : prod_32 & ~(p0_CastSource[10]),
         _prod_plus_ma32_shl_10_[8]
           ? prod_33 | p0_CastSource[10]
           : prod_33 & ~(p0_CastSource[10]),
         _prod_plus_ma32_shl_10_[7]
           ? prod_34 | p0_CastSource[10]
           : prod_34 & ~(p0_CastSource[10]),
         _prod_plus_ma32_shl_10_[6]
           ? prod_35 | p0_CastSource[10]
           : prod_35 & ~(p0_CastSource[10]),
         _prod_plus_ma32_shl_10_[5]
           ? prod_36 | p0_CastSource[10]
           : prod_36 & ~(p0_CastSource[10]),
         _prod_plus_ma32_shl_10_[4]
           ? prod_37 | p0_CastSource[10]
           : prod_37 & ~(p0_CastSource[10]),
         _prod_plus_ma32_shl_10_[3]
           ? prod_38 | p0_CastSource[10]
           : prod_38 & ~(p0_CastSource[10]),
         _prod_plus_ma32_shl_10_[2]
           ? prod_39 | p0_CastSource[10]
           : prod_39 & ~(p0_CastSource[10]),
         _prod_plus_ma32_shl_10_[1]
           ? prod_40 | p0_CastSource[10]
           : prod_40 & ~(p0_CastSource[10]),
         _prod_plus_ma32_shl_10_[0]
           ? prod_41 | p0_CastSource[10]
           : prod_41 & ~(p0_CastSource[10])} + {1'h1, p0_cast_lt_uint32_gt_ma_, 11'h0});	// dequant.k:19:9, :106:{13,17}, :107:{13,17,44}, :108:{44,51}
  wire         _GEN_0 = _r_exp_lt_255__diff[32] & (|_a_exp_plus_b_exp_minus_127_);	// dequant.k:86:{13,29,30,49}, :87:{28,34}, :108:{13,17}, :111:13, :113:{17,26}, :118:{17,26}, :121:{13,17,23,37}, :123:{26,41,43}
  wire         _GEN_1 =
    (p0__cast_lt_uint32_gt_super_scale_bf16_shl_16_[30]
     | p0__cast_lt_uint32_gt_super_scale_bf16_shl_16_[29]
     | p0__cast_lt_uint32_gt_super_scale_bf16_shl_16_[28]
     | p0__cast_lt_uint32_gt_super_scale_bf16_shl_16_[27]
     | p0__cast_lt_uint32_gt_super_scale_bf16_shl_16_[26]
     | p0__cast_lt_uint32_gt_super_scale_bf16_shl_16_[25]
     | p0__cast_lt_uint32_gt_super_scale_bf16_shl_16_[24]
     | p0__cast_lt_uint32_gt_super_scale_bf16_shl_16_[23])
    & (p0_fp_accum_0[30] | p0_fp_accum_0[29] | p0_fp_accum_0[28] | p0_fp_accum_0[27]
       | p0_fp_accum_0[26] | p0_fp_accum_0[25] | p0_fp_accum_0[24] | p0_fp_accum_0[23]);	// dequant.k:19:9, :80:{9,24}, :81:{9,24}, :84:{9,13,19,33}
  wire  [31:0] result =
    {(_a_exp_plus_b_exp_minus_127_[8]
        ? _GEN_0
        : p0__cast_lt_uint32_gt_super_scale_bf16_shl_16_[31]
            ? ~(p0_fp_accum_0[31]) & _GEN_0
            : p0_fp_accum_0[31] & _GEN_0) & _GEN_1,
     _a_exp_plus_b_exp_minus_127_[7] & _GEN_0 & _GEN_1,
     _a_exp_plus_b_exp_minus_127_[6] & _GEN_0 & _GEN_1,
     _a_exp_plus_b_exp_minus_127_[5] & _GEN_0 & _GEN_1,
     _a_exp_plus_b_exp_minus_127_[4] & _GEN_0 & _GEN_1,
     _a_exp_plus_b_exp_minus_127_[3] & _GEN_0 & _GEN_1,
     _a_exp_plus_b_exp_minus_127_[2] & _GEN_0 & _GEN_1,
     _a_exp_plus_b_exp_minus_127_[1] & _GEN_0 & _GEN_1,
     _a_exp_plus_b_exp_minus_127_[0] & _GEN_0 & _GEN_1,
     _prod_plus_ma32_shl_11_[22] & _GEN_0 & _GEN_1,
     _prod_plus_ma32_shl_11_[21] & _GEN_0 & _GEN_1,
     _prod_plus_ma32_shl_11_[20] & _GEN_0 & _GEN_1,
     _prod_plus_ma32_shl_11_[19] & _GEN_0 & _GEN_1,
     _prod_plus_ma32_shl_11_[18] & _GEN_0 & _GEN_1,
     _prod_plus_ma32_shl_11_[17] & _GEN_0 & _GEN_1,
     _prod_plus_ma32_shl_11_[16] & _GEN_0 & _GEN_1,
     _prod_plus_ma32_shl_11_[15] & _GEN_0 & _GEN_1,
     _prod_plus_ma32_shl_11_[14] & _GEN_0 & _GEN_1,
     _prod_plus_ma32_shl_11_[13] & _GEN_0 & _GEN_1,
     _prod_plus_ma32_shl_11_[12] & _GEN_0 & _GEN_1,
     _prod_plus_ma32_shl_11_[11] & _GEN_0 & _GEN_1,
     _prod_plus_ma32_shl_11_[10] & _GEN_0 & _GEN_1,
     _prod_plus_ma32_shl_11_[9] & _GEN_0 & _GEN_1,
     _prod_plus_ma32_shl_11_[8] & _GEN_0 & _GEN_1,
     _prod_plus_ma32_shl_11_[7] & _GEN_0 & _GEN_1,
     _prod_plus_ma32_shl_11_[6] & _GEN_0 & _GEN_1,
     _prod_plus_ma32_shl_11_[5] & _GEN_0 & _GEN_1,
     _prod_plus_ma32_shl_11_[4] & _GEN_0 & _GEN_1,
     _prod_plus_ma32_shl_11_[3] & _GEN_0 & _GEN_1,
     _prod_plus_ma32_shl_11_[2] & _GEN_0 & _GEN_1,
     _prod_plus_ma32_shl_11_[1] & _GEN_0 & _GEN_1,
     _prod_plus_ma32_shl_11_[0] & _GEN_0 & _GEN_1};	// dequant.k:19:9, :84:{9,13,19,33}, :86:{13,29,30,49}, :87:{28,34}, :108:{13,17,44}, :111:13, :113:{17,26}, :118:{17,26}, :121:{13,17,23,37}, :123:{26,41,43}
  reg   [31:0] p0_result;	// dequant.k:19:9
  reg          p0_stage6_enable = 1'h0;	// dequant.k:19:9
  wire  [31:0] _scaled_plus_cast_lt_int32_gt_a_shl_1_ =
    32'({{8{p0_accum[23]}}, p0_accum} + {{7{p0_accum[23]}}, p0_accum, 1'h0});	// dequant.k:19:9, :22:{9,13,53}, :23:{44,53,54}, :24:54, :25:54, :26:54
  wire         _GEN_2 = p0_accum[23] | p0_sub_scale[0];	// dequant.k:19:{9,26,51}, :22:53, :23:{9,13,54}, :24:54, :25:54, :26:54
  wire         _GEN_3 = p0_accum[23] & ~(p0_sub_scale[0]);	// dequant.k:19:{9,26,51}, :22:53, :23:{9,13,54}, :24:54, :25:54, :26:54
  wire         scaled = _scaled_plus_cast_lt_int32_gt_a_shl_1_[31] ? _GEN_2 : _GEN_3;	// dequant.k:23:{9,13,44}
  wire         scaled_0 = _scaled_plus_cast_lt_int32_gt_a_shl_1_[30] ? _GEN_2 : _GEN_3;	// dequant.k:23:{9,13,44}
  wire         scaled_1 = _scaled_plus_cast_lt_int32_gt_a_shl_1_[29] ? _GEN_2 : _GEN_3;	// dequant.k:23:{9,13,44}
  wire         scaled_2 = _scaled_plus_cast_lt_int32_gt_a_shl_1_[28] ? _GEN_2 : _GEN_3;	// dequant.k:23:{9,13,44}
  wire         scaled_3 = _scaled_plus_cast_lt_int32_gt_a_shl_1_[27] ? _GEN_2 : _GEN_3;	// dequant.k:23:{9,13,44}
  wire         scaled_4 = _scaled_plus_cast_lt_int32_gt_a_shl_1_[26] ? _GEN_2 : _GEN_3;	// dequant.k:23:{9,13,44}
  wire         scaled_5 = _scaled_plus_cast_lt_int32_gt_a_shl_1_[25] ? _GEN_2 : _GEN_3;	// dequant.k:23:{9,13,44}
  wire         scaled_6 = _scaled_plus_cast_lt_int32_gt_a_shl_1_[24] ? _GEN_2 : _GEN_3;	// dequant.k:23:{9,13,44}
  wire         scaled_7 =
    _scaled_plus_cast_lt_int32_gt_a_shl_1_[23]
      ? p0_accum[23] | p0_sub_scale[0]
      : p0_accum[23] & ~(p0_sub_scale[0]);	// dequant.k:19:{9,26,51}, :22:{9,13}, :23:{9,13,44}
  wire         scaled_8 =
    _scaled_plus_cast_lt_int32_gt_a_shl_1_[22]
      ? p0_accum[22] | p0_sub_scale[0]
      : p0_accum[22] & ~(p0_sub_scale[0]);	// dequant.k:19:{9,26,51}, :22:{9,13}, :23:{9,13,44}
  wire         scaled_9 =
    _scaled_plus_cast_lt_int32_gt_a_shl_1_[21]
      ? p0_accum[21] | p0_sub_scale[0]
      : p0_accum[21] & ~(p0_sub_scale[0]);	// dequant.k:19:{9,26,51}, :22:{9,13}, :23:{9,13,44}
  wire         scaled_10 =
    _scaled_plus_cast_lt_int32_gt_a_shl_1_[20]
      ? p0_accum[20] | p0_sub_scale[0]
      : p0_accum[20] & ~(p0_sub_scale[0]);	// dequant.k:19:{9,26,51}, :22:{9,13}, :23:{9,13,44}
  wire         scaled_11 =
    _scaled_plus_cast_lt_int32_gt_a_shl_1_[19]
      ? p0_accum[19] | p0_sub_scale[0]
      : p0_accum[19] & ~(p0_sub_scale[0]);	// dequant.k:19:{9,26,51}, :22:{9,13}, :23:{9,13,44}
  wire         scaled_12 =
    _scaled_plus_cast_lt_int32_gt_a_shl_1_[18]
      ? p0_accum[18] | p0_sub_scale[0]
      : p0_accum[18] & ~(p0_sub_scale[0]);	// dequant.k:19:{9,26,51}, :22:{9,13}, :23:{9,13,44}
  wire         scaled_13 =
    _scaled_plus_cast_lt_int32_gt_a_shl_1_[17]
      ? p0_accum[17] | p0_sub_scale[0]
      : p0_accum[17] & ~(p0_sub_scale[0]);	// dequant.k:19:{9,26,51}, :22:{9,13}, :23:{9,13,44}
  wire         scaled_14 =
    _scaled_plus_cast_lt_int32_gt_a_shl_1_[16]
      ? p0_accum[16] | p0_sub_scale[0]
      : p0_accum[16] & ~(p0_sub_scale[0]);	// dequant.k:19:{9,26,51}, :22:{9,13}, :23:{9,13,44}
  wire         scaled_15 =
    _scaled_plus_cast_lt_int32_gt_a_shl_1_[15]
      ? p0_accum[15] | p0_sub_scale[0]
      : p0_accum[15] & ~(p0_sub_scale[0]);	// dequant.k:19:{9,26,51}, :22:{9,13}, :23:{9,13,44}
  wire         scaled_16 =
    _scaled_plus_cast_lt_int32_gt_a_shl_1_[14]
      ? p0_accum[14] | p0_sub_scale[0]
      : p0_accum[14] & ~(p0_sub_scale[0]);	// dequant.k:19:{9,26,51}, :22:{9,13}, :23:{9,13,44}
  wire         scaled_17 =
    _scaled_plus_cast_lt_int32_gt_a_shl_1_[13]
      ? p0_accum[13] | p0_sub_scale[0]
      : p0_accum[13] & ~(p0_sub_scale[0]);	// dequant.k:19:{9,26,51}, :22:{9,13}, :23:{9,13,44}
  wire         scaled_18 =
    _scaled_plus_cast_lt_int32_gt_a_shl_1_[12]
      ? p0_accum[12] | p0_sub_scale[0]
      : p0_accum[12] & ~(p0_sub_scale[0]);	// dequant.k:19:{9,26,51}, :22:{9,13}, :23:{9,13,44}
  wire         scaled_19 =
    _scaled_plus_cast_lt_int32_gt_a_shl_1_[11]
      ? p0_accum[11] | p0_sub_scale[0]
      : p0_accum[11] & ~(p0_sub_scale[0]);	// dequant.k:19:{9,26,51}, :22:{9,13}, :23:{9,13,44}
  wire         scaled_20 =
    _scaled_plus_cast_lt_int32_gt_a_shl_1_[10]
      ? p0_accum[10] | p0_sub_scale[0]
      : p0_accum[10] & ~(p0_sub_scale[0]);	// dequant.k:19:{9,26,51}, :22:{9,13}, :23:{9,13,44}
  wire         scaled_21 =
    _scaled_plus_cast_lt_int32_gt_a_shl_1_[9]
      ? p0_accum[9] | p0_sub_scale[0]
      : p0_accum[9] & ~(p0_sub_scale[0]);	// dequant.k:19:{9,26,51}, :22:{9,13}, :23:{9,13,44}
  wire         scaled_22 =
    _scaled_plus_cast_lt_int32_gt_a_shl_1_[8]
      ? p0_accum[8] | p0_sub_scale[0]
      : p0_accum[8] & ~(p0_sub_scale[0]);	// dequant.k:19:{9,26,51}, :22:{9,13}, :23:{9,13,44}
  wire         scaled_23 =
    _scaled_plus_cast_lt_int32_gt_a_shl_1_[7]
      ? p0_accum[7] | p0_sub_scale[0]
      : p0_accum[7] & ~(p0_sub_scale[0]);	// dequant.k:19:{9,26,51}, :22:{9,13}, :23:{9,13,44}
  wire         scaled_24 =
    _scaled_plus_cast_lt_int32_gt_a_shl_1_[6]
      ? p0_accum[6] | p0_sub_scale[0]
      : p0_accum[6] & ~(p0_sub_scale[0]);	// dequant.k:19:{9,26,51}, :22:{9,13}, :23:{9,13,44}
  wire         scaled_25 =
    _scaled_plus_cast_lt_int32_gt_a_shl_1_[5]
      ? p0_accum[5] | p0_sub_scale[0]
      : p0_accum[5] & ~(p0_sub_scale[0]);	// dequant.k:19:{9,26,51}, :22:{9,13}, :23:{9,13,44}
  wire         scaled_26 =
    _scaled_plus_cast_lt_int32_gt_a_shl_1_[4]
      ? p0_accum[4] | p0_sub_scale[0]
      : p0_accum[4] & ~(p0_sub_scale[0]);	// dequant.k:19:{9,26,51}, :22:{9,13}, :23:{9,13,44}
  wire         scaled_27 =
    _scaled_plus_cast_lt_int32_gt_a_shl_1_[3]
      ? p0_accum[3] | p0_sub_scale[0]
      : p0_accum[3] & ~(p0_sub_scale[0]);	// dequant.k:19:{9,26,51}, :22:{9,13}, :23:{9,13,44}
  wire         scaled_28 =
    _scaled_plus_cast_lt_int32_gt_a_shl_1_[2]
      ? p0_accum[2] | p0_sub_scale[0]
      : p0_accum[2] & ~(p0_sub_scale[0]);	// dequant.k:19:{9,26,51}, :22:{9,13}, :23:{9,13,44}
  wire         scaled_29 =
    _scaled_plus_cast_lt_int32_gt_a_shl_1_[1]
      ? p0_accum[1] | p0_sub_scale[0]
      : p0_accum[1] & ~(p0_sub_scale[0]);	// dequant.k:19:{9,26,51}, :22:{9,13}, :23:{9,13,44}
  wire         scaled_30 =
    _scaled_plus_cast_lt_int32_gt_a_shl_1_[0]
      ? p0_accum[0] | p0_sub_scale[0]
      : p0_accum[0] & ~(p0_sub_scale[0]);	// dequant.k:19:{9,26,51}, :22:{9,13}, :23:{9,13,44}
  wire  [31:0] _scaled_plus_cast_lt_int32_gt_a_shl_2_ =
    32'({scaled,
         scaled_0,
         scaled_1,
         scaled_2,
         scaled_3,
         scaled_4,
         scaled_5,
         scaled_6,
         scaled_7,
         scaled_8,
         scaled_9,
         scaled_10,
         scaled_11,
         scaled_12,
         scaled_13,
         scaled_14,
         scaled_15,
         scaled_16,
         scaled_17,
         scaled_18,
         scaled_19,
         scaled_20,
         scaled_21,
         scaled_22,
         scaled_23,
         scaled_24,
         scaled_25,
         scaled_26,
         scaled_27,
         scaled_28,
         scaled_29,
         scaled_30} + {{6{p0_accum[23]}}, p0_accum, 2'h0});	// dequant.k:19:9, :22:53, :23:{9,13,54}, :24:{44,53,54}, :25:54, :26:54
  wire         scaled_31 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[31]
      ? scaled | p0_sub_scale[1]
      : scaled & ~(p0_sub_scale[1]);	// dequant.k:19:{9,26,51}, :23:{9,13}, :24:{9,13,44}
  wire         scaled_32 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[30]
      ? scaled_0 | p0_sub_scale[1]
      : scaled_0 & ~(p0_sub_scale[1]);	// dequant.k:19:{9,26,51}, :23:{9,13}, :24:{9,13,44}
  wire         scaled_33 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[29]
      ? scaled_1 | p0_sub_scale[1]
      : scaled_1 & ~(p0_sub_scale[1]);	// dequant.k:19:{9,26,51}, :23:{9,13}, :24:{9,13,44}
  wire         scaled_34 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[28]
      ? scaled_2 | p0_sub_scale[1]
      : scaled_2 & ~(p0_sub_scale[1]);	// dequant.k:19:{9,26,51}, :23:{9,13}, :24:{9,13,44}
  wire         scaled_35 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[27]
      ? scaled_3 | p0_sub_scale[1]
      : scaled_3 & ~(p0_sub_scale[1]);	// dequant.k:19:{9,26,51}, :23:{9,13}, :24:{9,13,44}
  wire         scaled_36 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[26]
      ? scaled_4 | p0_sub_scale[1]
      : scaled_4 & ~(p0_sub_scale[1]);	// dequant.k:19:{9,26,51}, :23:{9,13}, :24:{9,13,44}
  wire         scaled_37 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[25]
      ? scaled_5 | p0_sub_scale[1]
      : scaled_5 & ~(p0_sub_scale[1]);	// dequant.k:19:{9,26,51}, :23:{9,13}, :24:{9,13,44}
  wire         scaled_38 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[24]
      ? scaled_6 | p0_sub_scale[1]
      : scaled_6 & ~(p0_sub_scale[1]);	// dequant.k:19:{9,26,51}, :23:{9,13}, :24:{9,13,44}
  wire         scaled_39 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[23]
      ? scaled_7 | p0_sub_scale[1]
      : scaled_7 & ~(p0_sub_scale[1]);	// dequant.k:19:{9,26,51}, :23:{9,13}, :24:{9,13,44}
  wire         scaled_40 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[22]
      ? scaled_8 | p0_sub_scale[1]
      : scaled_8 & ~(p0_sub_scale[1]);	// dequant.k:19:{9,26,51}, :23:{9,13}, :24:{9,13,44}
  wire         scaled_41 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[21]
      ? scaled_9 | p0_sub_scale[1]
      : scaled_9 & ~(p0_sub_scale[1]);	// dequant.k:19:{9,26,51}, :23:{9,13}, :24:{9,13,44}
  wire         scaled_42 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[20]
      ? scaled_10 | p0_sub_scale[1]
      : scaled_10 & ~(p0_sub_scale[1]);	// dequant.k:19:{9,26,51}, :23:{9,13}, :24:{9,13,44}
  wire         scaled_43 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[19]
      ? scaled_11 | p0_sub_scale[1]
      : scaled_11 & ~(p0_sub_scale[1]);	// dequant.k:19:{9,26,51}, :23:{9,13}, :24:{9,13,44}
  wire         scaled_44 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[18]
      ? scaled_12 | p0_sub_scale[1]
      : scaled_12 & ~(p0_sub_scale[1]);	// dequant.k:19:{9,26,51}, :23:{9,13}, :24:{9,13,44}
  wire         scaled_45 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[17]
      ? scaled_13 | p0_sub_scale[1]
      : scaled_13 & ~(p0_sub_scale[1]);	// dequant.k:19:{9,26,51}, :23:{9,13}, :24:{9,13,44}
  wire         scaled_46 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[16]
      ? scaled_14 | p0_sub_scale[1]
      : scaled_14 & ~(p0_sub_scale[1]);	// dequant.k:19:{9,26,51}, :23:{9,13}, :24:{9,13,44}
  wire         scaled_47 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[15]
      ? scaled_15 | p0_sub_scale[1]
      : scaled_15 & ~(p0_sub_scale[1]);	// dequant.k:19:{9,26,51}, :23:{9,13}, :24:{9,13,44}
  wire         scaled_48 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[14]
      ? scaled_16 | p0_sub_scale[1]
      : scaled_16 & ~(p0_sub_scale[1]);	// dequant.k:19:{9,26,51}, :23:{9,13}, :24:{9,13,44}
  wire         scaled_49 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[13]
      ? scaled_17 | p0_sub_scale[1]
      : scaled_17 & ~(p0_sub_scale[1]);	// dequant.k:19:{9,26,51}, :23:{9,13}, :24:{9,13,44}
  wire         scaled_50 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[12]
      ? scaled_18 | p0_sub_scale[1]
      : scaled_18 & ~(p0_sub_scale[1]);	// dequant.k:19:{9,26,51}, :23:{9,13}, :24:{9,13,44}
  wire         scaled_51 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[11]
      ? scaled_19 | p0_sub_scale[1]
      : scaled_19 & ~(p0_sub_scale[1]);	// dequant.k:19:{9,26,51}, :23:{9,13}, :24:{9,13,44}
  wire         scaled_52 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[10]
      ? scaled_20 | p0_sub_scale[1]
      : scaled_20 & ~(p0_sub_scale[1]);	// dequant.k:19:{9,26,51}, :23:{9,13}, :24:{9,13,44}
  wire         scaled_53 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[9]
      ? scaled_21 | p0_sub_scale[1]
      : scaled_21 & ~(p0_sub_scale[1]);	// dequant.k:19:{9,26,51}, :23:{9,13}, :24:{9,13,44}
  wire         scaled_54 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[8]
      ? scaled_22 | p0_sub_scale[1]
      : scaled_22 & ~(p0_sub_scale[1]);	// dequant.k:19:{9,26,51}, :23:{9,13}, :24:{9,13,44}
  wire         scaled_55 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[7]
      ? scaled_23 | p0_sub_scale[1]
      : scaled_23 & ~(p0_sub_scale[1]);	// dequant.k:19:{9,26,51}, :23:{9,13}, :24:{9,13,44}
  wire         scaled_56 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[6]
      ? scaled_24 | p0_sub_scale[1]
      : scaled_24 & ~(p0_sub_scale[1]);	// dequant.k:19:{9,26,51}, :23:{9,13}, :24:{9,13,44}
  wire         scaled_57 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[5]
      ? scaled_25 | p0_sub_scale[1]
      : scaled_25 & ~(p0_sub_scale[1]);	// dequant.k:19:{9,26,51}, :23:{9,13}, :24:{9,13,44}
  wire         scaled_58 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[4]
      ? scaled_26 | p0_sub_scale[1]
      : scaled_26 & ~(p0_sub_scale[1]);	// dequant.k:19:{9,26,51}, :23:{9,13}, :24:{9,13,44}
  wire         scaled_59 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[3]
      ? scaled_27 | p0_sub_scale[1]
      : scaled_27 & ~(p0_sub_scale[1]);	// dequant.k:19:{9,26,51}, :23:{9,13}, :24:{9,13,44}
  wire         scaled_60 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[2]
      ? scaled_28 | p0_sub_scale[1]
      : scaled_28 & ~(p0_sub_scale[1]);	// dequant.k:19:{9,26,51}, :23:{9,13}, :24:{9,13,44}
  wire         scaled_61 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[1]
      ? scaled_29 | p0_sub_scale[1]
      : scaled_29 & ~(p0_sub_scale[1]);	// dequant.k:19:{9,26,51}, :23:{9,13}, :24:{9,13,44}
  wire         scaled_62 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[0]
      ? scaled_30 | p0_sub_scale[1]
      : scaled_30 & ~(p0_sub_scale[1]);	// dequant.k:19:{9,26,51}, :23:{9,13}, :24:{9,13,44}
  wire  [31:0] _scaled_plus_cast_lt_int32_gt_a_shl_3_ =
    32'({scaled_31,
         scaled_32,
         scaled_33,
         scaled_34,
         scaled_35,
         scaled_36,
         scaled_37,
         scaled_38,
         scaled_39,
         scaled_40,
         scaled_41,
         scaled_42,
         scaled_43,
         scaled_44,
         scaled_45,
         scaled_46,
         scaled_47,
         scaled_48,
         scaled_49,
         scaled_50,
         scaled_51,
         scaled_52,
         scaled_53,
         scaled_54,
         scaled_55,
         scaled_56,
         scaled_57,
         scaled_58,
         scaled_59,
         scaled_60,
         scaled_61,
         scaled_62} + {{5{p0_accum[23]}}, p0_accum, 3'h0});	// dequant.k:19:9, :22:53, :23:54, :24:{9,13,54}, :25:{44,53,54}, :26:54
  wire         scaled_63 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[31]
      ? scaled_31 | p0_sub_scale[2]
      : scaled_31 & ~(p0_sub_scale[2]);	// dequant.k:19:{9,26,51}, :24:{9,13}, :25:{9,13,44}
  wire         scaled_64 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[30]
      ? scaled_32 | p0_sub_scale[2]
      : scaled_32 & ~(p0_sub_scale[2]);	// dequant.k:19:{9,26,51}, :24:{9,13}, :25:{9,13,44}
  wire         scaled_65 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[29]
      ? scaled_33 | p0_sub_scale[2]
      : scaled_33 & ~(p0_sub_scale[2]);	// dequant.k:19:{9,26,51}, :24:{9,13}, :25:{9,13,44}
  wire         scaled_66 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[28]
      ? scaled_34 | p0_sub_scale[2]
      : scaled_34 & ~(p0_sub_scale[2]);	// dequant.k:19:{9,26,51}, :24:{9,13}, :25:{9,13,44}
  wire         scaled_67 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[27]
      ? scaled_35 | p0_sub_scale[2]
      : scaled_35 & ~(p0_sub_scale[2]);	// dequant.k:19:{9,26,51}, :24:{9,13}, :25:{9,13,44}
  wire         scaled_68 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[26]
      ? scaled_36 | p0_sub_scale[2]
      : scaled_36 & ~(p0_sub_scale[2]);	// dequant.k:19:{9,26,51}, :24:{9,13}, :25:{9,13,44}
  wire         scaled_69 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[25]
      ? scaled_37 | p0_sub_scale[2]
      : scaled_37 & ~(p0_sub_scale[2]);	// dequant.k:19:{9,26,51}, :24:{9,13}, :25:{9,13,44}
  wire         scaled_70 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[24]
      ? scaled_38 | p0_sub_scale[2]
      : scaled_38 & ~(p0_sub_scale[2]);	// dequant.k:19:{9,26,51}, :24:{9,13}, :25:{9,13,44}
  wire         scaled_71 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[23]
      ? scaled_39 | p0_sub_scale[2]
      : scaled_39 & ~(p0_sub_scale[2]);	// dequant.k:19:{9,26,51}, :24:{9,13}, :25:{9,13,44}
  wire         scaled_72 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[22]
      ? scaled_40 | p0_sub_scale[2]
      : scaled_40 & ~(p0_sub_scale[2]);	// dequant.k:19:{9,26,51}, :24:{9,13}, :25:{9,13,44}
  wire         scaled_73 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[21]
      ? scaled_41 | p0_sub_scale[2]
      : scaled_41 & ~(p0_sub_scale[2]);	// dequant.k:19:{9,26,51}, :24:{9,13}, :25:{9,13,44}
  wire         scaled_74 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[20]
      ? scaled_42 | p0_sub_scale[2]
      : scaled_42 & ~(p0_sub_scale[2]);	// dequant.k:19:{9,26,51}, :24:{9,13}, :25:{9,13,44}
  wire         scaled_75 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[19]
      ? scaled_43 | p0_sub_scale[2]
      : scaled_43 & ~(p0_sub_scale[2]);	// dequant.k:19:{9,26,51}, :24:{9,13}, :25:{9,13,44}
  wire         scaled_76 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[18]
      ? scaled_44 | p0_sub_scale[2]
      : scaled_44 & ~(p0_sub_scale[2]);	// dequant.k:19:{9,26,51}, :24:{9,13}, :25:{9,13,44}
  wire         scaled_77 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[17]
      ? scaled_45 | p0_sub_scale[2]
      : scaled_45 & ~(p0_sub_scale[2]);	// dequant.k:19:{9,26,51}, :24:{9,13}, :25:{9,13,44}
  wire         scaled_78 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[16]
      ? scaled_46 | p0_sub_scale[2]
      : scaled_46 & ~(p0_sub_scale[2]);	// dequant.k:19:{9,26,51}, :24:{9,13}, :25:{9,13,44}
  wire         scaled_79 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[15]
      ? scaled_47 | p0_sub_scale[2]
      : scaled_47 & ~(p0_sub_scale[2]);	// dequant.k:19:{9,26,51}, :24:{9,13}, :25:{9,13,44}
  wire         scaled_80 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[14]
      ? scaled_48 | p0_sub_scale[2]
      : scaled_48 & ~(p0_sub_scale[2]);	// dequant.k:19:{9,26,51}, :24:{9,13}, :25:{9,13,44}
  wire         scaled_81 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[13]
      ? scaled_49 | p0_sub_scale[2]
      : scaled_49 & ~(p0_sub_scale[2]);	// dequant.k:19:{9,26,51}, :24:{9,13}, :25:{9,13,44}
  wire         scaled_82 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[12]
      ? scaled_50 | p0_sub_scale[2]
      : scaled_50 & ~(p0_sub_scale[2]);	// dequant.k:19:{9,26,51}, :24:{9,13}, :25:{9,13,44}
  wire         scaled_83 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[11]
      ? scaled_51 | p0_sub_scale[2]
      : scaled_51 & ~(p0_sub_scale[2]);	// dequant.k:19:{9,26,51}, :24:{9,13}, :25:{9,13,44}
  wire         scaled_84 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[10]
      ? scaled_52 | p0_sub_scale[2]
      : scaled_52 & ~(p0_sub_scale[2]);	// dequant.k:19:{9,26,51}, :24:{9,13}, :25:{9,13,44}
  wire         scaled_85 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[9]
      ? scaled_53 | p0_sub_scale[2]
      : scaled_53 & ~(p0_sub_scale[2]);	// dequant.k:19:{9,26,51}, :24:{9,13}, :25:{9,13,44}
  wire         scaled_86 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[8]
      ? scaled_54 | p0_sub_scale[2]
      : scaled_54 & ~(p0_sub_scale[2]);	// dequant.k:19:{9,26,51}, :24:{9,13}, :25:{9,13,44}
  wire         scaled_87 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[7]
      ? scaled_55 | p0_sub_scale[2]
      : scaled_55 & ~(p0_sub_scale[2]);	// dequant.k:19:{9,26,51}, :24:{9,13}, :25:{9,13,44}
  wire         scaled_88 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[6]
      ? scaled_56 | p0_sub_scale[2]
      : scaled_56 & ~(p0_sub_scale[2]);	// dequant.k:19:{9,26,51}, :24:{9,13}, :25:{9,13,44}
  wire         scaled_89 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[5]
      ? scaled_57 | p0_sub_scale[2]
      : scaled_57 & ~(p0_sub_scale[2]);	// dequant.k:19:{9,26,51}, :24:{9,13}, :25:{9,13,44}
  wire         scaled_90 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[4]
      ? scaled_58 | p0_sub_scale[2]
      : scaled_58 & ~(p0_sub_scale[2]);	// dequant.k:19:{9,26,51}, :24:{9,13}, :25:{9,13,44}
  wire         scaled_91 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[3]
      ? scaled_59 | p0_sub_scale[2]
      : scaled_59 & ~(p0_sub_scale[2]);	// dequant.k:19:{9,26,51}, :24:{9,13}, :25:{9,13,44}
  wire         scaled_92 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[2]
      ? scaled_60 | p0_sub_scale[2]
      : scaled_60 & ~(p0_sub_scale[2]);	// dequant.k:19:{9,26,51}, :24:{9,13}, :25:{9,13,44}
  wire         scaled_93 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[1]
      ? scaled_61 | p0_sub_scale[2]
      : scaled_61 & ~(p0_sub_scale[2]);	// dequant.k:19:{9,26,51}, :24:{9,13}, :25:{9,13,44}
  wire         scaled_94 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[0]
      ? scaled_62 | p0_sub_scale[2]
      : scaled_62 & ~(p0_sub_scale[2]);	// dequant.k:19:{9,26,51}, :24:{9,13}, :25:{9,13,44}
  wire  [31:0] _scaled_plus_cast_lt_int32_gt_a_shl_4_ =
    32'({scaled_63,
         scaled_64,
         scaled_65,
         scaled_66,
         scaled_67,
         scaled_68,
         scaled_69,
         scaled_70,
         scaled_71,
         scaled_72,
         scaled_73,
         scaled_74,
         scaled_75,
         scaled_76,
         scaled_77,
         scaled_78,
         scaled_79,
         scaled_80,
         scaled_81,
         scaled_82,
         scaled_83,
         scaled_84,
         scaled_85,
         scaled_86,
         scaled_87,
         scaled_88,
         scaled_89,
         scaled_90,
         scaled_91,
         scaled_92,
         scaled_93,
         scaled_94} + {{4{p0_accum[23]}}, p0_accum, 4'h0});	// dequant.k:19:9, :22:53, :23:54, :24:54, :25:{9,13,54}, :26:{44,53,54}
  wire  [31:0] CastSource = 32'(32'h0 - p0_scaled);	// dequant.k:19:9, :34:32
  wire         mag =
    CastSource[31] ? p0_scaled[31] | p0_scaled[31] : p0_scaled[31] & ~(p0_scaled[31]);	// dequant.k:19:9, :31:{9,13}, :34:{19,32}
  wire         mag_0 =
    CastSource[30] ? p0_scaled[30] | p0_scaled[31] : p0_scaled[30] & ~(p0_scaled[31]);	// dequant.k:19:9, :31:{9,13}, :34:{19,32}
  wire         mag_1 =
    CastSource[29] ? p0_scaled[29] | p0_scaled[31] : p0_scaled[29] & ~(p0_scaled[31]);	// dequant.k:19:9, :31:{9,13}, :34:{19,32}
  wire         mag_2 =
    CastSource[28] ? p0_scaled[28] | p0_scaled[31] : p0_scaled[28] & ~(p0_scaled[31]);	// dequant.k:19:9, :31:{9,13}, :34:{19,32}
  wire         mag_3 =
    CastSource[27] ? p0_scaled[27] | p0_scaled[31] : p0_scaled[27] & ~(p0_scaled[31]);	// dequant.k:19:9, :31:{9,13}, :34:{19,32}
  wire         mag_4 =
    CastSource[26] ? p0_scaled[26] | p0_scaled[31] : p0_scaled[26] & ~(p0_scaled[31]);	// dequant.k:19:9, :31:{9,13}, :34:{19,32}
  wire         mag_5 =
    CastSource[25] ? p0_scaled[25] | p0_scaled[31] : p0_scaled[25] & ~(p0_scaled[31]);	// dequant.k:19:9, :31:{9,13}, :34:{19,32}
  wire         mag_6 =
    CastSource[24] ? p0_scaled[24] | p0_scaled[31] : p0_scaled[24] & ~(p0_scaled[31]);	// dequant.k:19:9, :31:{9,13}, :34:{19,32}
  wire         mag_7 =
    CastSource[23] ? p0_scaled[23] | p0_scaled[31] : p0_scaled[23] & ~(p0_scaled[31]);	// dequant.k:19:9, :31:{9,13}, :34:{19,32}
  wire         mag_8 =
    CastSource[22] ? p0_scaled[22] | p0_scaled[31] : p0_scaled[22] & ~(p0_scaled[31]);	// dequant.k:19:9, :31:{9,13}, :34:{19,32}
  wire         mag_9 =
    CastSource[21] ? p0_scaled[21] | p0_scaled[31] : p0_scaled[21] & ~(p0_scaled[31]);	// dequant.k:19:9, :31:{9,13}, :34:{19,32}
  wire         mag_10 =
    CastSource[20] ? p0_scaled[20] | p0_scaled[31] : p0_scaled[20] & ~(p0_scaled[31]);	// dequant.k:19:9, :31:{9,13}, :34:{19,32}
  wire         mag_11 =
    CastSource[19] ? p0_scaled[19] | p0_scaled[31] : p0_scaled[19] & ~(p0_scaled[31]);	// dequant.k:19:9, :31:{9,13}, :34:{19,32}
  wire         mag_12 =
    CastSource[18] ? p0_scaled[18] | p0_scaled[31] : p0_scaled[18] & ~(p0_scaled[31]);	// dequant.k:19:9, :31:{9,13}, :34:{19,32}
  wire         mag_13 =
    CastSource[17] ? p0_scaled[17] | p0_scaled[31] : p0_scaled[17] & ~(p0_scaled[31]);	// dequant.k:19:9, :31:{9,13}, :34:{19,32}
  wire         mag_14 =
    CastSource[16] ? p0_scaled[16] | p0_scaled[31] : p0_scaled[16] & ~(p0_scaled[31]);	// dequant.k:19:9, :31:{9,13}, :34:{19,32}
  wire         mag_15 =
    CastSource[15] ? p0_scaled[15] | p0_scaled[31] : p0_scaled[15] & ~(p0_scaled[31]);	// dequant.k:19:9, :31:{9,13}, :34:{19,32}
  wire         mag_16 =
    CastSource[14] ? p0_scaled[14] | p0_scaled[31] : p0_scaled[14] & ~(p0_scaled[31]);	// dequant.k:19:9, :31:{9,13}, :34:{19,32}
  wire         mag_17 =
    CastSource[13] ? p0_scaled[13] | p0_scaled[31] : p0_scaled[13] & ~(p0_scaled[31]);	// dequant.k:19:9, :31:{9,13}, :34:{19,32}
  wire         mag_18 =
    CastSource[12] ? p0_scaled[12] | p0_scaled[31] : p0_scaled[12] & ~(p0_scaled[31]);	// dequant.k:19:9, :31:{9,13}, :34:{19,32}
  wire         mag_19 =
    CastSource[11] ? p0_scaled[11] | p0_scaled[31] : p0_scaled[11] & ~(p0_scaled[31]);	// dequant.k:19:9, :31:{9,13}, :34:{19,32}
  wire         mag_20 =
    CastSource[10] ? p0_scaled[10] | p0_scaled[31] : p0_scaled[10] & ~(p0_scaled[31]);	// dequant.k:19:9, :31:{9,13}, :34:{19,32}
  wire         mag_21 =
    CastSource[9] ? p0_scaled[9] | p0_scaled[31] : p0_scaled[9] & ~(p0_scaled[31]);	// dequant.k:19:9, :31:{9,13}, :34:{19,32}
  wire         mag_22 =
    CastSource[8] ? p0_scaled[8] | p0_scaled[31] : p0_scaled[8] & ~(p0_scaled[31]);	// dequant.k:19:9, :31:{9,13}, :34:{19,32}
  wire         mag_23 =
    CastSource[7] ? p0_scaled[7] | p0_scaled[31] : p0_scaled[7] & ~(p0_scaled[31]);	// dequant.k:19:9, :31:{9,13}, :34:{19,32}
  wire         mag_24 =
    CastSource[6] ? p0_scaled[6] | p0_scaled[31] : p0_scaled[6] & ~(p0_scaled[31]);	// dequant.k:19:9, :31:{9,13}, :34:{19,32}
  wire         mag_25 =
    CastSource[5] ? p0_scaled[5] | p0_scaled[31] : p0_scaled[5] & ~(p0_scaled[31]);	// dequant.k:19:9, :31:{9,13}, :34:{19,32}
  wire         mag_26 =
    CastSource[4] ? p0_scaled[4] | p0_scaled[31] : p0_scaled[4] & ~(p0_scaled[31]);	// dequant.k:19:9, :31:{9,13}, :34:{19,32}
  wire         mag_27 =
    CastSource[3] ? p0_scaled[3] | p0_scaled[31] : p0_scaled[3] & ~(p0_scaled[31]);	// dequant.k:19:9, :31:{9,13}, :34:{19,32}
  wire         mag_28 =
    CastSource[2] ? p0_scaled[2] | p0_scaled[31] : p0_scaled[2] & ~(p0_scaled[31]);	// dequant.k:19:9, :31:{9,13}, :34:{19,32}
  wire         mag_29 =
    CastSource[1] ? p0_scaled[1] | p0_scaled[31] : p0_scaled[1] & ~(p0_scaled[31]);	// dequant.k:19:9, :31:{9,13}, :34:{19,32}
  wire         mag_30 =
    CastSource[0] ? p0_scaled[0] | p0_scaled[31] : p0_scaled[0] & ~(p0_scaled[31]);	// dequant.k:19:9, :31:{9,13}, :34:{19,32}
  wire         _tmp_and_4294901760_ne_0_ =
    mag | mag_0 | mag_1 | mag_2 | mag_3 | mag_4 | mag_5 | mag_6 | mag_7 | mag_8 | mag_9
    | mag_10 | mag_11 | mag_12 | mag_13 | mag_14;	// dequant.k:31:9, :34:19, :47:17
  wire         tmp = mag & ~_tmp_and_4294901760_ne_0_;	// dequant.k:31:9, :34:19, :47:{13,17,44,50}
  wire         tmp_0 = mag_0 & ~_tmp_and_4294901760_ne_0_;	// dequant.k:31:9, :34:19, :47:{13,17,44,50}
  wire         tmp_1 = mag_1 & ~_tmp_and_4294901760_ne_0_;	// dequant.k:31:9, :34:19, :47:{13,17,44,50}
  wire         tmp_2 = mag_2 & ~_tmp_and_4294901760_ne_0_;	// dequant.k:31:9, :34:19, :47:{13,17,44,50}
  wire         tmp_3 = mag_3 & ~_tmp_and_4294901760_ne_0_;	// dequant.k:31:9, :34:19, :47:{13,17,44,50}
  wire         tmp_4 = mag_4 & ~_tmp_and_4294901760_ne_0_;	// dequant.k:31:9, :34:19, :47:{13,17,44,50}
  wire         tmp_5 = mag_5 & ~_tmp_and_4294901760_ne_0_;	// dequant.k:31:9, :34:19, :47:{13,17,44,50}
  wire         tmp_6 = mag_6 & ~_tmp_and_4294901760_ne_0_;	// dequant.k:31:9, :34:19, :47:{13,17,44,50}
  wire         tmp_7 = mag_7 & ~_tmp_and_4294901760_ne_0_;	// dequant.k:31:9, :34:19, :47:{13,17,44,50}
  wire         tmp_8 = mag_8 & ~_tmp_and_4294901760_ne_0_;	// dequant.k:31:9, :34:19, :47:{13,17,44,50}
  wire         tmp_9 = mag_9 & ~_tmp_and_4294901760_ne_0_;	// dequant.k:31:9, :34:19, :47:{13,17,44,50}
  wire         tmp_10 = mag_10 & ~_tmp_and_4294901760_ne_0_;	// dequant.k:31:9, :34:19, :47:{13,17,44,50}
  wire         tmp_11 = mag_11 & ~_tmp_and_4294901760_ne_0_;	// dequant.k:31:9, :34:19, :47:{13,17,44,50}
  wire         tmp_12 = mag_12 & ~_tmp_and_4294901760_ne_0_;	// dequant.k:31:9, :34:19, :47:{13,17,44,50}
  wire         tmp_13 = mag_13 & ~_tmp_and_4294901760_ne_0_;	// dequant.k:31:9, :34:19, :47:{13,17,44,50}
  wire         tmp_14 = mag_14 & ~_tmp_and_4294901760_ne_0_;	// dequant.k:31:9, :34:19, :47:{13,17,44,50}
  wire         tmp_15 =
    mag ? mag_15 | _tmp_and_4294901760_ne_0_ : mag_15 & ~_tmp_and_4294901760_ne_0_;	// dequant.k:31:9, :34:19, :47:{13,17,44,50}
  wire         tmp_16 =
    mag_0 ? mag_16 | _tmp_and_4294901760_ne_0_ : mag_16 & ~_tmp_and_4294901760_ne_0_;	// dequant.k:31:9, :34:19, :47:{13,17,44,50}
  wire         tmp_17 =
    mag_1 ? mag_17 | _tmp_and_4294901760_ne_0_ : mag_17 & ~_tmp_and_4294901760_ne_0_;	// dequant.k:31:9, :34:19, :47:{13,17,44,50}
  wire         tmp_18 =
    mag_2 ? mag_18 | _tmp_and_4294901760_ne_0_ : mag_18 & ~_tmp_and_4294901760_ne_0_;	// dequant.k:31:9, :34:19, :47:{13,17,44,50}
  wire         tmp_19 =
    mag_3 ? mag_19 | _tmp_and_4294901760_ne_0_ : mag_19 & ~_tmp_and_4294901760_ne_0_;	// dequant.k:31:9, :34:19, :47:{13,17,44,50}
  wire         tmp_20 =
    mag_4 ? mag_20 | _tmp_and_4294901760_ne_0_ : mag_20 & ~_tmp_and_4294901760_ne_0_;	// dequant.k:31:9, :34:19, :47:{13,17,44,50}
  wire         tmp_21 =
    mag_5 ? mag_21 | _tmp_and_4294901760_ne_0_ : mag_21 & ~_tmp_and_4294901760_ne_0_;	// dequant.k:31:9, :34:19, :47:{13,17,44,50}
  wire         tmp_22 =
    mag_6 ? mag_22 | _tmp_and_4294901760_ne_0_ : mag_22 & ~_tmp_and_4294901760_ne_0_;	// dequant.k:31:9, :34:19, :47:{13,17,44,50}
  wire         tmp_23 =
    mag_7 ? mag_23 | _tmp_and_4294901760_ne_0_ : mag_23 & ~_tmp_and_4294901760_ne_0_;	// dequant.k:31:9, :34:19, :47:{13,17,44,50}
  wire         tmp_24 =
    mag_8 ? mag_24 | _tmp_and_4294901760_ne_0_ : mag_24 & ~_tmp_and_4294901760_ne_0_;	// dequant.k:31:9, :34:19, :47:{13,17,44,50}
  wire         tmp_25 =
    mag_9 ? mag_25 | _tmp_and_4294901760_ne_0_ : mag_25 & ~_tmp_and_4294901760_ne_0_;	// dequant.k:31:9, :34:19, :47:{13,17,44,50}
  wire         tmp_26 =
    mag_10 ? mag_26 | _tmp_and_4294901760_ne_0_ : mag_26 & ~_tmp_and_4294901760_ne_0_;	// dequant.k:31:9, :34:19, :47:{13,17,44,50}
  wire         tmp_27 =
    mag_11 ? mag_27 | _tmp_and_4294901760_ne_0_ : mag_27 & ~_tmp_and_4294901760_ne_0_;	// dequant.k:31:9, :34:19, :47:{13,17,44,50}
  wire         tmp_28 =
    mag_12 ? mag_28 | _tmp_and_4294901760_ne_0_ : mag_28 & ~_tmp_and_4294901760_ne_0_;	// dequant.k:31:9, :34:19, :47:{13,17,44,50}
  wire         tmp_29 =
    mag_13 ? mag_29 | _tmp_and_4294901760_ne_0_ : mag_29 & ~_tmp_and_4294901760_ne_0_;	// dequant.k:31:9, :34:19, :47:{13,17,44,50}
  wire         tmp_30 =
    mag_14 ? mag_30 | _tmp_and_4294901760_ne_0_ : mag_30 & ~_tmp_and_4294901760_ne_0_;	// dequant.k:31:9, :34:19, :47:{13,17,44,50}
  wire         _tmp_and_65280_ne_0_ =
    tmp_15 | tmp_16 | tmp_17 | tmp_18 | tmp_19 | tmp_20 | tmp_21 | tmp_22;	// dequant.k:47:{13,44,50}, :48:17
  wire         _tmp_and_240_ne_0_ = p0_tmp[7] | p0_tmp[6] | p0_tmp[5] | p0_tmp[4];	// dequant.k:19:9, :49:17
  wire         tmp_31 =
    p0_tmp[7] ? p0_tmp[3] | _tmp_and_240_ne_0_ : p0_tmp[3] & ~_tmp_and_240_ne_0_;	// dequant.k:19:9, :49:{13,17,44,50}
  wire         tmp_32 =
    p0_tmp[6] ? p0_tmp[2] | _tmp_and_240_ne_0_ : p0_tmp[2] & ~_tmp_and_240_ne_0_;	// dequant.k:19:9, :49:{13,17,44,50}
  wire         pos = tmp_31 | tmp_32;	// dequant.k:47:13, :48:{13,67}, :49:{13,44,50,67}, :50:{13,17,44,50,67}, :51:{13,17,50}
  wire         pos_0 =
    (p0_tmp[5] ? p0_tmp[1] | _tmp_and_240_ne_0_ : p0_tmp[1] & ~_tmp_and_240_ne_0_)
    & ~tmp_32 | tmp_31;	// dequant.k:19:9, :47:13, :48:{13,67}, :49:{13,17,44,50,67}, :50:{13,17,44,50,67}, :51:{13,17,50}
  wire  [7:0]  _127_plus_pos_ =
    8'({3'h0,
        p0__tmp_and_4294901760_ne_0_,
        p0__tmp_and_65280_ne_0_,
        _tmp_and_240_ne_0_,
        pos,
        pos_0} + 8'h7F);	// dequant.k:19:9, :47:13, :48:{13,67}, :49:{13,17,67}, :50:{13,17,44,50,67}, :51:{13,17,50}, :53:30
  wire  [32:0] _pos_minus_23_ =
    33'({28'h0,
         p0__tmp_and_4294901760_ne_0_,
         p0__tmp_and_65280_ne_0_,
         _tmp_and_240_ne_0_,
         pos,
         pos_0} - 33'h17);	// dequant.k:19:9, :47:13, :48:{13,67}, :49:{13,17,67}, :50:{13,17,44,50,67}, :51:{13,17,50}, :59:34, :61:22
  wire  [4:0]  _23_minus_pos_ =
    5'(5'h17
       - {p0__tmp_and_4294901760_ne_0_,
          p0__tmp_and_65280_ne_0_,
          _tmp_and_240_ne_0_,
          pos,
          pos_0});	// dequant.k:19:9, :47:13, :48:{13,67}, :49:{13,17,67}, :50:{13,17,44,50,67}, :51:{13,17,50}, :64:36
  wire  [31:0] _mag_shr_pos_minus_23_ = p0_mag >> _pos_minus_23_[31:0];	// dequant.k:19:9, :59:{27,34}, :61:22
  wire         _GEN_4 = ~(_23_minus_pos_[4]) | ~(_23_minus_pos_[3]);	// dequant.k:64:36, :65:{17,21,56}, :66:{17,21,56}
  wire         _GEN_5 = _23_minus_pos_[4] ^ _23_minus_pos_[3];	// dequant.k:64:36, :65:{17,21,56}, :66:{17,21,56}
  wire         _GEN_6 = ~(_23_minus_pos_[4]) & _23_minus_pos_[3];	// dequant.k:64:36, :65:{17,21,56}, :66:{17,21,56}
  wire         _GEN_7 = ~(_23_minus_pos_[4]) & ~(_23_minus_pos_[3]);	// dequant.k:64:36, :65:{17,21,56}, :66:{17,21,56}
  wire         shifted =
    p0_mag[14]
      ? (p0_mag[6]
           ? (p0_mag[22] ? _GEN_4 : _GEN_5)
           : p0_mag[22] ? ~(_23_minus_pos_[4]) : _GEN_6)
      : p0_mag[6]
          ? (p0_mag[22] | _23_minus_pos_[4]) & ~(_23_minus_pos_[3])
          : p0_mag[22] & _GEN_7;	// dequant.k:19:9, :64:36, :65:{17,21,56}, :66:{17,21,56}
  wire         shifted_0 =
    p0_mag[13]
      ? (p0_mag[5]
           ? (p0_mag[21] ? _GEN_4 : _GEN_5)
           : p0_mag[21] ? ~(_23_minus_pos_[4]) : _GEN_6)
      : p0_mag[5]
          ? (p0_mag[21] | _23_minus_pos_[4]) & ~(_23_minus_pos_[3])
          : p0_mag[21] & _GEN_7;	// dequant.k:19:9, :64:36, :65:{17,21,56}, :66:{17,21,56}
  wire         shifted_1 =
    p0_mag[12]
      ? (p0_mag[4]
           ? (p0_mag[20] ? _GEN_4 : _GEN_5)
           : p0_mag[20] ? ~(_23_minus_pos_[4]) : _GEN_6)
      : p0_mag[4]
          ? (p0_mag[20] | _23_minus_pos_[4]) & ~(_23_minus_pos_[3])
          : p0_mag[20] & _GEN_7;	// dequant.k:19:9, :64:36, :65:{17,21,56}, :66:{17,21,56}
  wire         shifted_2 =
    p0_mag[11]
      ? (p0_mag[3]
           ? (p0_mag[19] ? _GEN_4 : _GEN_5)
           : p0_mag[19] ? ~(_23_minus_pos_[4]) : _GEN_6)
      : p0_mag[3]
          ? (p0_mag[19] | _23_minus_pos_[4]) & ~(_23_minus_pos_[3])
          : p0_mag[19] & _GEN_7;	// dequant.k:19:9, :64:36, :65:{17,21,56}, :66:{17,21,56}
  wire         shifted_3 =
    p0_mag[10]
      ? (p0_mag[2]
           ? (p0_mag[18] ? _GEN_4 : _GEN_5)
           : p0_mag[18] ? ~(_23_minus_pos_[4]) : _GEN_6)
      : p0_mag[2]
          ? (p0_mag[18] | _23_minus_pos_[4]) & ~(_23_minus_pos_[3])
          : p0_mag[18] & _GEN_7;	// dequant.k:19:9, :64:36, :65:{17,21,56}, :66:{17,21,56}
  wire         shifted_4 =
    p0_mag[9]
      ? (p0_mag[1]
           ? (p0_mag[17] ? _GEN_4 : _GEN_5)
           : p0_mag[17] ? ~(_23_minus_pos_[4]) : _GEN_6)
      : p0_mag[1]
          ? (p0_mag[17] | _23_minus_pos_[4]) & ~(_23_minus_pos_[3])
          : p0_mag[17] & _GEN_7;	// dequant.k:19:9, :64:36, :65:{17,21,56}, :66:{17,21,56}
  wire         shifted_5 =
    p0_mag[8]
      ? (p0_mag[0]
           ? (p0_mag[16] ? _GEN_4 : _GEN_5)
           : p0_mag[16] ? ~(_23_minus_pos_[4]) : _GEN_6)
      : p0_mag[0]
          ? (p0_mag[16] | _23_minus_pos_[4]) & ~(_23_minus_pos_[3])
          : p0_mag[16] & _GEN_7;	// dequant.k:19:9, :64:36, :65:{17,21,56}, :66:{17,21,56}
  wire         shifted_6 =
    p0_mag[7] ? (p0_mag[15] ? ~(_23_minus_pos_[4]) : _GEN_6) : p0_mag[15] & _GEN_7;	// dequant.k:19:9, :64:36, :65:{17,21,56}, :66:{17,21,56}
  wire         shifted_7 =
    p0_mag[6] ? (p0_mag[14] ? ~(_23_minus_pos_[4]) : _GEN_6) : p0_mag[14] & _GEN_7;	// dequant.k:19:9, :64:36, :65:{17,21,56}, :66:{17,21,56}
  wire         shifted_8 =
    p0_mag[5] ? (p0_mag[13] ? ~(_23_minus_pos_[4]) : _GEN_6) : p0_mag[13] & _GEN_7;	// dequant.k:19:9, :64:36, :65:{17,21,56}, :66:{17,21,56}
  wire         shifted_9 =
    p0_mag[4] ? (p0_mag[12] ? ~(_23_minus_pos_[4]) : _GEN_6) : p0_mag[12] & _GEN_7;	// dequant.k:19:9, :64:36, :65:{17,21,56}, :66:{17,21,56}
  wire         shifted_10 =
    p0_mag[3] ? (p0_mag[11] ? ~(_23_minus_pos_[4]) : _GEN_6) : p0_mag[11] & _GEN_7;	// dequant.k:19:9, :64:36, :65:{17,21,56}, :66:{17,21,56}
  wire         shifted_11 =
    p0_mag[2] ? (p0_mag[10] ? ~(_23_minus_pos_[4]) : _GEN_6) : p0_mag[10] & _GEN_7;	// dequant.k:19:9, :64:36, :65:{17,21,56}, :66:{17,21,56}
  wire         shifted_12 =
    p0_mag[1] ? (p0_mag[9] ? ~(_23_minus_pos_[4]) : _GEN_6) : p0_mag[9] & _GEN_7;	// dequant.k:19:9, :64:36, :65:{17,21,56}, :66:{17,21,56}
  wire         shifted_13 =
    p0_mag[0] ? (p0_mag[8] ? ~(_23_minus_pos_[4]) : _GEN_6) : p0_mag[8] & _GEN_7;	// dequant.k:19:9, :64:36, :65:{17,21,56}, :66:{17,21,56}
  wire         shifted_14 = p0_mag[7] & _GEN_7;	// dequant.k:19:9, :65:{17,21,56}, :66:{17,21,56}
  wire         shifted_15 = p0_mag[6] & _GEN_7;	// dequant.k:19:9, :65:{17,21,56}, :66:{17,21,56}
  wire         shifted_16 = p0_mag[5] & _GEN_7;	// dequant.k:19:9, :65:{17,21,56}, :66:{17,21,56}
  wire         shifted_17 = p0_mag[4] & _GEN_7;	// dequant.k:19:9, :65:{17,21,56}, :66:{17,21,56}
  wire         shifted_18 = p0_mag[3] & _GEN_7;	// dequant.k:19:9, :65:{17,21,56}, :66:{17,21,56}
  wire         shifted_19 = p0_mag[2] & _GEN_7;	// dequant.k:19:9, :65:{17,21,56}, :66:{17,21,56}
  wire         shifted_20 = p0_mag[1] & _GEN_7;	// dequant.k:19:9, :65:{17,21,56}, :66:{17,21,56}
  wire         shifted_21 = p0_mag[0] & _GEN_7;	// dequant.k:19:9, :65:{17,21,56}, :66:{17,21,56}
  wire         _GEN_8 = _23_minus_pos_[2] | _23_minus_pos_[1];	// dequant.k:64:36, :67:{17,21,56}, :68:{17,21,56}
  wire         _GEN_9 = _23_minus_pos_[2] ^ ~(_23_minus_pos_[1]);	// dequant.k:64:36, :67:{17,21,56}, :68:{17,21,56}
  wire         _GEN_10 = _23_minus_pos_[2] & _23_minus_pos_[1];	// dequant.k:64:36, :67:{17,21,56}, :68:{17,21,56}
  wire         _GEN_11 = ~(_23_minus_pos_[2]) | ~(_23_minus_pos_[1]);	// dequant.k:64:36, :67:{17,21,56}, :68:{17,21,56}
  wire         _GEN_12 = _23_minus_pos_[2] ^ _23_minus_pos_[1];	// dequant.k:64:36, :67:{17,21,56}, :68:{17,21,56}
  wire         _GEN_13 = ~(_23_minus_pos_[2]) & _23_minus_pos_[1];	// dequant.k:64:36, :67:{17,21,56}, :68:{17,21,56}
  wire         _GEN_14 = ~(_23_minus_pos_[2]) & ~(_23_minus_pos_[1]);	// dequant.k:64:36, :67:{17,21,56}, :68:{17,21,56}
  wire         shifted_22 =
    shifted_5
      ? (shifted_1
           ? (shifted_3
                ? shifted | _GEN_8
                : shifted & ~(_23_minus_pos_[2]) | _23_minus_pos_[1])
           : shifted_3
               ? shifted & ~(_23_minus_pos_[1]) | _23_minus_pos_[2]
               : shifted ? _GEN_9 : _GEN_10)
      : shifted_1
          ? (shifted_3
               ? (shifted ? _GEN_11 : _GEN_12)
               : shifted ? ~(_23_minus_pos_[2]) : _GEN_13)
          : shifted_3
              ? (shifted | _23_minus_pos_[2]) & ~(_23_minus_pos_[1])
              : shifted & _GEN_14;	// dequant.k:64:36, :65:{17,21,56}, :66:{17,21,56}, :67:{17,21,56}, :68:{17,21,56}
  wire         shifted_23 =
    shifted_6
      ? (shifted_2
           ? (shifted_4
                ? shifted_0 | _GEN_8
                : shifted_0 & ~(_23_minus_pos_[2]) | _23_minus_pos_[1])
           : shifted_4
               ? shifted_0 & ~(_23_minus_pos_[1]) | _23_minus_pos_[2]
               : shifted_0 ? _GEN_9 : _GEN_10)
      : shifted_2
          ? (shifted_4
               ? (shifted_0 ? _GEN_11 : _GEN_12)
               : shifted_0 ? ~(_23_minus_pos_[2]) : _GEN_13)
          : shifted_4
              ? (shifted_0 | _23_minus_pos_[2]) & ~(_23_minus_pos_[1])
              : shifted_0 & _GEN_14;	// dequant.k:64:36, :65:{17,21,56}, :66:{17,21,56}, :67:{17,21,56}, :68:{17,21,56}
  wire         shifted_24 =
    shifted_7
      ? (shifted_3
           ? (shifted_5
                ? shifted_1 | _GEN_8
                : shifted_1 & ~(_23_minus_pos_[2]) | _23_minus_pos_[1])
           : shifted_5
               ? shifted_1 & ~(_23_minus_pos_[1]) | _23_minus_pos_[2]
               : shifted_1 ? _GEN_9 : _GEN_10)
      : shifted_3
          ? (shifted_5
               ? (shifted_1 ? _GEN_11 : _GEN_12)
               : shifted_1 ? ~(_23_minus_pos_[2]) : _GEN_13)
          : shifted_5
              ? (shifted_1 | _23_minus_pos_[2]) & ~(_23_minus_pos_[1])
              : shifted_1 & _GEN_14;	// dequant.k:64:36, :65:{17,21,56}, :66:{17,21,56}, :67:{17,21,56}, :68:{17,21,56}
  wire         shifted_25 =
    shifted_8
      ? (shifted_4
           ? (shifted_6
                ? shifted_2 | _GEN_8
                : shifted_2 & ~(_23_minus_pos_[2]) | _23_minus_pos_[1])
           : shifted_6
               ? shifted_2 & ~(_23_minus_pos_[1]) | _23_minus_pos_[2]
               : shifted_2 ? _GEN_9 : _GEN_10)
      : shifted_4
          ? (shifted_6
               ? (shifted_2 ? _GEN_11 : _GEN_12)
               : shifted_2 ? ~(_23_minus_pos_[2]) : _GEN_13)
          : shifted_6
              ? (shifted_2 | _23_minus_pos_[2]) & ~(_23_minus_pos_[1])
              : shifted_2 & _GEN_14;	// dequant.k:64:36, :65:{17,21,56}, :66:{17,21,56}, :67:{17,21,56}, :68:{17,21,56}
  wire         shifted_26 =
    shifted_9
      ? (shifted_5
           ? (shifted_7
                ? shifted_3 | _GEN_8
                : shifted_3 & ~(_23_minus_pos_[2]) | _23_minus_pos_[1])
           : shifted_7
               ? shifted_3 & ~(_23_minus_pos_[1]) | _23_minus_pos_[2]
               : shifted_3 ? _GEN_9 : _GEN_10)
      : shifted_5
          ? (shifted_7
               ? (shifted_3 ? _GEN_11 : _GEN_12)
               : shifted_3 ? ~(_23_minus_pos_[2]) : _GEN_13)
          : shifted_7
              ? (shifted_3 | _23_minus_pos_[2]) & ~(_23_minus_pos_[1])
              : shifted_3 & _GEN_14;	// dequant.k:64:36, :65:{17,21,56}, :66:{17,21,56}, :67:{17,21,56}, :68:{17,21,56}
  wire         shifted_27 =
    shifted_10
      ? (shifted_6
           ? (shifted_8
                ? shifted_4 | _GEN_8
                : shifted_4 & ~(_23_minus_pos_[2]) | _23_minus_pos_[1])
           : shifted_8
               ? shifted_4 & ~(_23_minus_pos_[1]) | _23_minus_pos_[2]
               : shifted_4 ? _GEN_9 : _GEN_10)
      : shifted_6
          ? (shifted_8
               ? (shifted_4 ? _GEN_11 : _GEN_12)
               : shifted_4 ? ~(_23_minus_pos_[2]) : _GEN_13)
          : shifted_8
              ? (shifted_4 | _23_minus_pos_[2]) & ~(_23_minus_pos_[1])
              : shifted_4 & _GEN_14;	// dequant.k:64:36, :65:{17,21,56}, :66:{17,21,56}, :67:{17,21,56}, :68:{17,21,56}
  wire         shifted_28 =
    shifted_11
      ? (shifted_7
           ? (shifted_9
                ? shifted_5 | _GEN_8
                : shifted_5 & ~(_23_minus_pos_[2]) | _23_minus_pos_[1])
           : shifted_9
               ? shifted_5 & ~(_23_minus_pos_[1]) | _23_minus_pos_[2]
               : shifted_5 ? _GEN_9 : _GEN_10)
      : shifted_7
          ? (shifted_9
               ? (shifted_5 ? _GEN_11 : _GEN_12)
               : shifted_5 ? ~(_23_minus_pos_[2]) : _GEN_13)
          : shifted_9
              ? (shifted_5 | _23_minus_pos_[2]) & ~(_23_minus_pos_[1])
              : shifted_5 & _GEN_14;	// dequant.k:64:36, :65:{17,21,56}, :66:{17,21,56}, :67:{17,21,56}, :68:{17,21,56}
  wire         shifted_29 =
    shifted_12
      ? (shifted_8
           ? (shifted_10
                ? shifted_6 | _GEN_8
                : shifted_6 & ~(_23_minus_pos_[2]) | _23_minus_pos_[1])
           : shifted_10
               ? shifted_6 & ~(_23_minus_pos_[1]) | _23_minus_pos_[2]
               : shifted_6 ? _GEN_9 : _GEN_10)
      : shifted_8
          ? (shifted_10
               ? (shifted_6 ? _GEN_11 : _GEN_12)
               : shifted_6 ? ~(_23_minus_pos_[2]) : _GEN_13)
          : shifted_10
              ? (shifted_6 | _23_minus_pos_[2]) & ~(_23_minus_pos_[1])
              : shifted_6 & _GEN_14;	// dequant.k:64:36, :65:{17,21,56}, :66:{17,21,56}, :67:{17,21,56}, :68:{17,21,56}
  wire         shifted_30 =
    shifted_13
      ? (shifted_9
           ? (shifted_11
                ? shifted_7 | _GEN_8
                : shifted_7 & ~(_23_minus_pos_[2]) | _23_minus_pos_[1])
           : shifted_11
               ? shifted_7 & ~(_23_minus_pos_[1]) | _23_minus_pos_[2]
               : shifted_7 ? _GEN_9 : _GEN_10)
      : shifted_9
          ? (shifted_11
               ? (shifted_7 ? _GEN_11 : _GEN_12)
               : shifted_7 ? ~(_23_minus_pos_[2]) : _GEN_13)
          : shifted_11
              ? (shifted_7 | _23_minus_pos_[2]) & ~(_23_minus_pos_[1])
              : shifted_7 & _GEN_14;	// dequant.k:64:36, :65:{17,21,56}, :66:{17,21,56}, :67:{17,21,56}, :68:{17,21,56}
  wire         shifted_31 =
    shifted_14
      ? (shifted_10
           ? (shifted_12
                ? shifted_8 | _GEN_8
                : shifted_8 & ~(_23_minus_pos_[2]) | _23_minus_pos_[1])
           : shifted_12
               ? shifted_8 & ~(_23_minus_pos_[1]) | _23_minus_pos_[2]
               : shifted_8 ? _GEN_9 : _GEN_10)
      : shifted_10
          ? (shifted_12
               ? (shifted_8 ? _GEN_11 : _GEN_12)
               : shifted_8 ? ~(_23_minus_pos_[2]) : _GEN_13)
          : shifted_12
              ? (shifted_8 | _23_minus_pos_[2]) & ~(_23_minus_pos_[1])
              : shifted_8 & _GEN_14;	// dequant.k:64:36, :65:{17,21,56}, :66:{17,21,56}, :67:{17,21,56}, :68:{17,21,56}
  wire         shifted_32 =
    shifted_15
      ? (shifted_11
           ? (shifted_13
                ? shifted_9 | _GEN_8
                : shifted_9 & ~(_23_minus_pos_[2]) | _23_minus_pos_[1])
           : shifted_13
               ? shifted_9 & ~(_23_minus_pos_[1]) | _23_minus_pos_[2]
               : shifted_9 ? _GEN_9 : _GEN_10)
      : shifted_11
          ? (shifted_13
               ? (shifted_9 ? _GEN_11 : _GEN_12)
               : shifted_9 ? ~(_23_minus_pos_[2]) : _GEN_13)
          : shifted_13
              ? (shifted_9 | _23_minus_pos_[2]) & ~(_23_minus_pos_[1])
              : shifted_9 & _GEN_14;	// dequant.k:64:36, :65:{17,21,56}, :66:{17,21,56}, :67:{17,21,56}, :68:{17,21,56}
  wire         shifted_33 =
    shifted_16
      ? (shifted_12
           ? (shifted_14
                ? shifted_10 | _GEN_8
                : shifted_10 & ~(_23_minus_pos_[2]) | _23_minus_pos_[1])
           : shifted_14
               ? shifted_10 & ~(_23_minus_pos_[1]) | _23_minus_pos_[2]
               : shifted_10 ? _GEN_9 : _GEN_10)
      : shifted_12
          ? (shifted_14
               ? (shifted_10 ? _GEN_11 : _GEN_12)
               : shifted_10 ? ~(_23_minus_pos_[2]) : _GEN_13)
          : shifted_14
              ? (shifted_10 | _23_minus_pos_[2]) & ~(_23_minus_pos_[1])
              : shifted_10 & _GEN_14;	// dequant.k:64:36, :65:{17,21,56}, :66:{17,21,56}, :67:{17,21,56}, :68:{17,21,56}
  wire         shifted_34 =
    shifted_17
      ? (shifted_13
           ? (shifted_15
                ? shifted_11 | _GEN_8
                : shifted_11 & ~(_23_minus_pos_[2]) | _23_minus_pos_[1])
           : shifted_15
               ? shifted_11 & ~(_23_minus_pos_[1]) | _23_minus_pos_[2]
               : shifted_11 ? _GEN_9 : _GEN_10)
      : shifted_13
          ? (shifted_15
               ? (shifted_11 ? _GEN_11 : _GEN_12)
               : shifted_11 ? ~(_23_minus_pos_[2]) : _GEN_13)
          : shifted_15
              ? (shifted_11 | _23_minus_pos_[2]) & ~(_23_minus_pos_[1])
              : shifted_11 & _GEN_14;	// dequant.k:64:36, :65:{17,21,56}, :66:{17,21,56}, :67:{17,21,56}, :68:{17,21,56}
  wire         shifted_35 =
    shifted_18
      ? (shifted_14
           ? (shifted_16
                ? shifted_12 | _GEN_8
                : shifted_12 & ~(_23_minus_pos_[2]) | _23_minus_pos_[1])
           : shifted_16
               ? shifted_12 & ~(_23_minus_pos_[1]) | _23_minus_pos_[2]
               : shifted_12 ? _GEN_9 : _GEN_10)
      : shifted_14
          ? (shifted_16
               ? (shifted_12 ? _GEN_11 : _GEN_12)
               : shifted_12 ? ~(_23_minus_pos_[2]) : _GEN_13)
          : shifted_16
              ? (shifted_12 | _23_minus_pos_[2]) & ~(_23_minus_pos_[1])
              : shifted_12 & _GEN_14;	// dequant.k:64:36, :65:{17,21,56}, :66:{17,21,56}, :67:{17,21,56}, :68:{17,21,56}
  wire         shifted_36 =
    shifted_19
      ? (shifted_15
           ? (shifted_17
                ? shifted_13 | _GEN_8
                : shifted_13 & ~(_23_minus_pos_[2]) | _23_minus_pos_[1])
           : shifted_17
               ? shifted_13 & ~(_23_minus_pos_[1]) | _23_minus_pos_[2]
               : shifted_13 ? _GEN_9 : _GEN_10)
      : shifted_15
          ? (shifted_17
               ? (shifted_13 ? _GEN_11 : _GEN_12)
               : shifted_13 ? ~(_23_minus_pos_[2]) : _GEN_13)
          : shifted_17
              ? (shifted_13 | _23_minus_pos_[2]) & ~(_23_minus_pos_[1])
              : shifted_13 & _GEN_14;	// dequant.k:64:36, :65:{17,21,56}, :66:{17,21,56}, :67:{17,21,56}, :68:{17,21,56}
  wire         shifted_37 =
    shifted_20
      ? (shifted_16
           ? (shifted_18
                ? shifted_14 | _GEN_8
                : shifted_14 & ~(_23_minus_pos_[2]) | _23_minus_pos_[1])
           : shifted_18
               ? shifted_14 & ~(_23_minus_pos_[1]) | _23_minus_pos_[2]
               : shifted_14 ? _GEN_9 : _GEN_10)
      : shifted_16
          ? (shifted_18
               ? (shifted_14 ? _GEN_11 : _GEN_12)
               : shifted_14 ? ~(_23_minus_pos_[2]) : _GEN_13)
          : shifted_18
              ? (shifted_14 | _23_minus_pos_[2]) & ~(_23_minus_pos_[1])
              : shifted_14 & _GEN_14;	// dequant.k:64:36, :65:{17,21,56}, :66:{17,21,56}, :67:{17,21,56}, :68:{17,21,56}
  wire         shifted_38 =
    shifted_21
      ? (shifted_17
           ? (shifted_19
                ? shifted_15 | _GEN_8
                : shifted_15 & ~(_23_minus_pos_[2]) | _23_minus_pos_[1])
           : shifted_19
               ? shifted_15 & ~(_23_minus_pos_[1]) | _23_minus_pos_[2]
               : shifted_15 ? _GEN_9 : _GEN_10)
      : shifted_17
          ? (shifted_19
               ? (shifted_15 ? _GEN_11 : _GEN_12)
               : shifted_15 ? ~(_23_minus_pos_[2]) : _GEN_13)
          : shifted_19
              ? (shifted_15 | _23_minus_pos_[2]) & ~(_23_minus_pos_[1])
              : shifted_15 & _GEN_14;	// dequant.k:64:36, :65:{17,21,56}, :66:{17,21,56}, :67:{17,21,56}, :68:{17,21,56}
  wire         shifted_39 =
    shifted_18
      ? (shifted_20
           ? (shifted_16 ? _GEN_11 : _GEN_12)
           : shifted_16 ? ~(_23_minus_pos_[2]) : _GEN_13)
      : shifted_20
          ? (shifted_16 | _23_minus_pos_[2]) & ~(_23_minus_pos_[1])
          : shifted_16 & _GEN_14;	// dequant.k:64:36, :65:{17,21,56}, :66:{17,21,56}, :67:{17,21,56}, :68:{17,21,56}
  wire         shifted_40 =
    shifted_19
      ? (shifted_21
           ? (shifted_17 ? _GEN_11 : _GEN_12)
           : shifted_17 ? ~(_23_minus_pos_[2]) : _GEN_13)
      : shifted_21
          ? (shifted_17 | _23_minus_pos_[2]) & ~(_23_minus_pos_[1])
          : shifted_17 & _GEN_14;	// dequant.k:64:36, :65:{17,21,56}, :66:{17,21,56}, :67:{17,21,56}, :68:{17,21,56}
  wire         shifted_41 =
    shifted_20 ? (shifted_18 ? ~(_23_minus_pos_[2]) : _GEN_13) : shifted_18 & _GEN_14;	// dequant.k:64:36, :65:{17,21,56}, :66:{17,21,56}, :67:{17,21,56}, :68:{17,21,56}
  wire         shifted_42 =
    shifted_21 ? (shifted_19 ? ~(_23_minus_pos_[2]) : _GEN_13) : shifted_19 & _GEN_14;	// dequant.k:64:36, :65:{17,21,56}, :66:{17,21,56}, :67:{17,21,56}, :68:{17,21,56}
  wire         shifted_43 = shifted_20 & _GEN_14;	// dequant.k:65:{17,21,56}, :66:{17,21,56}, :67:{17,21,56}, :68:{17,21,56}
  wire         shifted_44 = shifted_21 & _GEN_14;	// dequant.k:65:{17,21,56}, :66:{17,21,56}, :67:{17,21,56}, :68:{17,21,56}
  wire         _GEN_15 = p0_mag[22] | _pos_minus_23_[32];	// dequant.k:19:9, :59:34, :61:{18,22}, :65:{17,21,56}, :66:{17,21,56}, :69:{17,21,56}
  wire         _GEN_16 = p0_mag[22] & ~(_pos_minus_23_[32]);	// dequant.k:19:9, :59:34, :61:{18,22}, :65:{17,21,56}, :66:{17,21,56}, :69:{17,21,56}
  wire         shifted_45 =
    shifted_23
      ? (shifted_22 | _23_minus_pos_[0] ? _GEN_15 : _GEN_16)
      : ~shifted_22 | _23_minus_pos_[0] ? _GEN_16 : _GEN_15;	// dequant.k:61:{18,22}, :64:36, :67:{17,21,56}, :68:{17,21,56}, :69:{17,21,56}
  wire         _GEN_17 = p0_mag[21] | _pos_minus_23_[32];	// dequant.k:19:9, :59:34, :61:{18,22}, :65:{17,21,56}, :66:{17,21,56}, :69:{17,21,56}
  wire         _GEN_18 = p0_mag[21] & ~(_pos_minus_23_[32]);	// dequant.k:19:9, :59:34, :61:{18,22}, :65:{17,21,56}, :66:{17,21,56}, :69:{17,21,56}
  wire         shifted_46 =
    shifted_24
      ? (shifted_23 | _23_minus_pos_[0] ? _GEN_17 : _GEN_18)
      : ~shifted_23 | _23_minus_pos_[0] ? _GEN_18 : _GEN_17;	// dequant.k:61:{18,22}, :64:36, :67:{17,21,56}, :68:{17,21,56}, :69:{17,21,56}
  wire         _GEN_19 = p0_mag[20] | _pos_minus_23_[32];	// dequant.k:19:9, :59:34, :61:{18,22}, :65:{17,21,56}, :66:{17,21,56}, :69:{17,21,56}
  wire         _GEN_20 = p0_mag[20] & ~(_pos_minus_23_[32]);	// dequant.k:19:9, :59:34, :61:{18,22}, :65:{17,21,56}, :66:{17,21,56}, :69:{17,21,56}
  wire         shifted_47 =
    shifted_25
      ? (shifted_24 | _23_minus_pos_[0] ? _GEN_19 : _GEN_20)
      : ~shifted_24 | _23_minus_pos_[0] ? _GEN_20 : _GEN_19;	// dequant.k:61:{18,22}, :64:36, :67:{17,21,56}, :68:{17,21,56}, :69:{17,21,56}
  wire         _GEN_21 = p0_mag[19] | _pos_minus_23_[32];	// dequant.k:19:9, :59:34, :61:{18,22}, :65:{17,21,56}, :66:{17,21,56}, :69:{17,21,56}
  wire         _GEN_22 = p0_mag[19] & ~(_pos_minus_23_[32]);	// dequant.k:19:9, :59:34, :61:{18,22}, :65:{17,21,56}, :66:{17,21,56}, :69:{17,21,56}
  wire         shifted_48 =
    shifted_26
      ? (shifted_25 | _23_minus_pos_[0] ? _GEN_21 : _GEN_22)
      : ~shifted_25 | _23_minus_pos_[0] ? _GEN_22 : _GEN_21;	// dequant.k:61:{18,22}, :64:36, :67:{17,21,56}, :68:{17,21,56}, :69:{17,21,56}
  wire         _GEN_23 = p0_mag[18] | _pos_minus_23_[32];	// dequant.k:19:9, :59:34, :61:{18,22}, :65:{17,21,56}, :66:{17,21,56}, :69:{17,21,56}
  wire         _GEN_24 = p0_mag[18] & ~(_pos_minus_23_[32]);	// dequant.k:19:9, :59:34, :61:{18,22}, :65:{17,21,56}, :66:{17,21,56}, :69:{17,21,56}
  wire         shifted_49 =
    shifted_27
      ? (shifted_26 | _23_minus_pos_[0] ? _GEN_23 : _GEN_24)
      : ~shifted_26 | _23_minus_pos_[0] ? _GEN_24 : _GEN_23;	// dequant.k:61:{18,22}, :64:36, :67:{17,21,56}, :68:{17,21,56}, :69:{17,21,56}
  wire         _GEN_25 = p0_mag[17] | _pos_minus_23_[32];	// dequant.k:19:9, :59:34, :61:{18,22}, :65:{17,21,56}, :66:{17,21,56}, :69:{17,21,56}
  wire         _GEN_26 = p0_mag[17] & ~(_pos_minus_23_[32]);	// dequant.k:19:9, :59:34, :61:{18,22}, :65:{17,21,56}, :66:{17,21,56}, :69:{17,21,56}
  wire         shifted_50 =
    shifted_28
      ? (shifted_27 | _23_minus_pos_[0] ? _GEN_25 : _GEN_26)
      : ~shifted_27 | _23_minus_pos_[0] ? _GEN_26 : _GEN_25;	// dequant.k:61:{18,22}, :64:36, :67:{17,21,56}, :68:{17,21,56}, :69:{17,21,56}
  wire         _GEN_27 = p0_mag[16] | _pos_minus_23_[32];	// dequant.k:19:9, :59:34, :61:{18,22}, :65:{17,21,56}, :66:{17,21,56}, :69:{17,21,56}
  wire         _GEN_28 = p0_mag[16] & ~(_pos_minus_23_[32]);	// dequant.k:19:9, :59:34, :61:{18,22}, :65:{17,21,56}, :66:{17,21,56}, :69:{17,21,56}
  wire         shifted_51 =
    shifted_29
      ? (shifted_28 | _23_minus_pos_[0] ? _GEN_27 : _GEN_28)
      : ~shifted_28 | _23_minus_pos_[0] ? _GEN_28 : _GEN_27;	// dequant.k:61:{18,22}, :64:36, :67:{17,21,56}, :68:{17,21,56}, :69:{17,21,56}
  wire         _GEN_29 = p0_mag[15] | _pos_minus_23_[32];	// dequant.k:19:9, :59:34, :61:{18,22}, :65:{17,21,56}, :66:{17,21,56}, :69:{17,21,56}
  wire         _GEN_30 = p0_mag[15] & ~(_pos_minus_23_[32]);	// dequant.k:19:9, :59:34, :61:{18,22}, :65:{17,21,56}, :66:{17,21,56}, :69:{17,21,56}
  wire         shifted_52 =
    shifted_30
      ? (shifted_29 | _23_minus_pos_[0] ? _GEN_29 : _GEN_30)
      : ~shifted_29 | _23_minus_pos_[0] ? _GEN_30 : _GEN_29;	// dequant.k:61:{18,22}, :64:36, :67:{17,21,56}, :68:{17,21,56}, :69:{17,21,56}
  wire         _GEN_31 = p0_mag[14] | _pos_minus_23_[32];	// dequant.k:19:9, :59:34, :61:{18,22}, :65:{17,21,56}, :66:{17,21,56}, :69:{17,21,56}
  wire         _GEN_32 = p0_mag[14] & ~(_pos_minus_23_[32]);	// dequant.k:19:9, :59:34, :61:{18,22}, :65:{17,21,56}, :66:{17,21,56}, :69:{17,21,56}
  wire         shifted_53 =
    shifted_31
      ? (shifted_30 | _23_minus_pos_[0] ? _GEN_31 : _GEN_32)
      : ~shifted_30 | _23_minus_pos_[0] ? _GEN_32 : _GEN_31;	// dequant.k:61:{18,22}, :64:36, :67:{17,21,56}, :68:{17,21,56}, :69:{17,21,56}
  wire         _GEN_33 = p0_mag[13] | _pos_minus_23_[32];	// dequant.k:19:9, :59:34, :61:{18,22}, :65:{17,21,56}, :66:{17,21,56}, :69:{17,21,56}
  wire         _GEN_34 = p0_mag[13] & ~(_pos_minus_23_[32]);	// dequant.k:19:9, :59:34, :61:{18,22}, :65:{17,21,56}, :66:{17,21,56}, :69:{17,21,56}
  wire         shifted_54 =
    shifted_32
      ? (shifted_31 | _23_minus_pos_[0] ? _GEN_33 : _GEN_34)
      : ~shifted_31 | _23_minus_pos_[0] ? _GEN_34 : _GEN_33;	// dequant.k:61:{18,22}, :64:36, :67:{17,21,56}, :68:{17,21,56}, :69:{17,21,56}
  wire         _GEN_35 = p0_mag[12] | _pos_minus_23_[32];	// dequant.k:19:9, :59:34, :61:{18,22}, :65:{17,21,56}, :66:{17,21,56}, :69:{17,21,56}
  wire         _GEN_36 = p0_mag[12] & ~(_pos_minus_23_[32]);	// dequant.k:19:9, :59:34, :61:{18,22}, :65:{17,21,56}, :66:{17,21,56}, :69:{17,21,56}
  wire         shifted_55 =
    shifted_33
      ? (shifted_32 | _23_minus_pos_[0] ? _GEN_35 : _GEN_36)
      : ~shifted_32 | _23_minus_pos_[0] ? _GEN_36 : _GEN_35;	// dequant.k:61:{18,22}, :64:36, :67:{17,21,56}, :68:{17,21,56}, :69:{17,21,56}
  wire         _GEN_37 = p0_mag[11] | _pos_minus_23_[32];	// dequant.k:19:9, :59:34, :61:{18,22}, :65:{17,21,56}, :66:{17,21,56}, :69:{17,21,56}
  wire         _GEN_38 = p0_mag[11] & ~(_pos_minus_23_[32]);	// dequant.k:19:9, :59:34, :61:{18,22}, :65:{17,21,56}, :66:{17,21,56}, :69:{17,21,56}
  wire         shifted_56 =
    shifted_34
      ? (shifted_33 | _23_minus_pos_[0] ? _GEN_37 : _GEN_38)
      : ~shifted_33 | _23_minus_pos_[0] ? _GEN_38 : _GEN_37;	// dequant.k:61:{18,22}, :64:36, :67:{17,21,56}, :68:{17,21,56}, :69:{17,21,56}
  wire         _GEN_39 = p0_mag[10] | _pos_minus_23_[32];	// dequant.k:19:9, :59:34, :61:{18,22}, :65:{17,21,56}, :66:{17,21,56}, :69:{17,21,56}
  wire         _GEN_40 = p0_mag[10] & ~(_pos_minus_23_[32]);	// dequant.k:19:9, :59:34, :61:{18,22}, :65:{17,21,56}, :66:{17,21,56}, :69:{17,21,56}
  wire         shifted_57 =
    shifted_35
      ? (shifted_34 | _23_minus_pos_[0] ? _GEN_39 : _GEN_40)
      : ~shifted_34 | _23_minus_pos_[0] ? _GEN_40 : _GEN_39;	// dequant.k:61:{18,22}, :64:36, :67:{17,21,56}, :68:{17,21,56}, :69:{17,21,56}
  wire         _GEN_41 = p0_mag[9] | _pos_minus_23_[32];	// dequant.k:19:9, :59:34, :61:{18,22}, :65:{17,21,56}, :66:{17,21,56}, :69:{17,21,56}
  wire         _GEN_42 = p0_mag[9] & ~(_pos_minus_23_[32]);	// dequant.k:19:9, :59:34, :61:{18,22}, :65:{17,21,56}, :66:{17,21,56}, :69:{17,21,56}
  wire         shifted_58 =
    shifted_36
      ? (shifted_35 | _23_minus_pos_[0] ? _GEN_41 : _GEN_42)
      : ~shifted_35 | _23_minus_pos_[0] ? _GEN_42 : _GEN_41;	// dequant.k:61:{18,22}, :64:36, :67:{17,21,56}, :68:{17,21,56}, :69:{17,21,56}
  wire         _GEN_43 = p0_mag[8] | _pos_minus_23_[32];	// dequant.k:19:9, :59:34, :61:{18,22}, :65:{17,21,56}, :66:{17,21,56}, :69:{17,21,56}
  wire         _GEN_44 = p0_mag[8] & ~(_pos_minus_23_[32]);	// dequant.k:19:9, :59:34, :61:{18,22}, :65:{17,21,56}, :66:{17,21,56}, :69:{17,21,56}
  wire         shifted_59 =
    shifted_37
      ? (shifted_36 | _23_minus_pos_[0] ? _GEN_43 : _GEN_44)
      : ~shifted_36 | _23_minus_pos_[0] ? _GEN_44 : _GEN_43;	// dequant.k:61:{18,22}, :64:36, :67:{17,21,56}, :68:{17,21,56}, :69:{17,21,56}
  wire         _GEN_45 = p0_mag[7] | _pos_minus_23_[32];	// dequant.k:19:9, :59:34, :61:{18,22}, :65:{17,21,56}, :66:{17,21,56}, :69:{17,21,56}
  wire         _GEN_46 = p0_mag[7] & ~(_pos_minus_23_[32]);	// dequant.k:19:9, :59:34, :61:{18,22}, :65:{17,21,56}, :66:{17,21,56}, :69:{17,21,56}
  wire         shifted_60 =
    shifted_38
      ? (shifted_37 | _23_minus_pos_[0] ? _GEN_45 : _GEN_46)
      : ~shifted_37 | _23_minus_pos_[0] ? _GEN_46 : _GEN_45;	// dequant.k:61:{18,22}, :64:36, :67:{17,21,56}, :68:{17,21,56}, :69:{17,21,56}
  wire         _GEN_47 = p0_mag[6] | _pos_minus_23_[32];	// dequant.k:19:9, :59:34, :61:{18,22}, :65:{17,21,56}, :66:{17,21,56}, :69:{17,21,56}
  wire         _GEN_48 = p0_mag[6] & ~(_pos_minus_23_[32]);	// dequant.k:19:9, :59:34, :61:{18,22}, :65:{17,21,56}, :66:{17,21,56}, :69:{17,21,56}
  wire         shifted_61 =
    shifted_39
      ? (shifted_38 | _23_minus_pos_[0] ? _GEN_47 : _GEN_48)
      : ~shifted_38 | _23_minus_pos_[0] ? _GEN_48 : _GEN_47;	// dequant.k:61:{18,22}, :64:36, :67:{17,21,56}, :68:{17,21,56}, :69:{17,21,56}
  wire         _GEN_49 = p0_mag[5] | _pos_minus_23_[32];	// dequant.k:19:9, :59:34, :61:{18,22}, :65:{17,21,56}, :66:{17,21,56}, :69:{17,21,56}
  wire         _GEN_50 = p0_mag[5] & ~(_pos_minus_23_[32]);	// dequant.k:19:9, :59:34, :61:{18,22}, :65:{17,21,56}, :66:{17,21,56}, :69:{17,21,56}
  wire         shifted_62 =
    shifted_40
      ? (shifted_39 | _23_minus_pos_[0] ? _GEN_49 : _GEN_50)
      : ~shifted_39 | _23_minus_pos_[0] ? _GEN_50 : _GEN_49;	// dequant.k:61:{18,22}, :64:36, :67:{17,21,56}, :68:{17,21,56}, :69:{17,21,56}
  wire         _GEN_51 = p0_mag[4] | _pos_minus_23_[32];	// dequant.k:19:9, :59:34, :61:{18,22}, :65:{17,21,56}, :66:{17,21,56}, :69:{17,21,56}
  wire         _GEN_52 = p0_mag[4] & ~(_pos_minus_23_[32]);	// dequant.k:19:9, :59:34, :61:{18,22}, :65:{17,21,56}, :66:{17,21,56}, :69:{17,21,56}
  wire         shifted_63 =
    shifted_41
      ? (shifted_40 | _23_minus_pos_[0] ? _GEN_51 : _GEN_52)
      : ~shifted_40 | _23_minus_pos_[0] ? _GEN_52 : _GEN_51;	// dequant.k:61:{18,22}, :64:36, :67:{17,21,56}, :68:{17,21,56}, :69:{17,21,56}
  wire         _GEN_53 = p0_mag[3] | _pos_minus_23_[32];	// dequant.k:19:9, :59:34, :61:{18,22}, :65:{17,21,56}, :66:{17,21,56}, :69:{17,21,56}
  wire         _GEN_54 = p0_mag[3] & ~(_pos_minus_23_[32]);	// dequant.k:19:9, :59:34, :61:{18,22}, :65:{17,21,56}, :66:{17,21,56}, :69:{17,21,56}
  wire         shifted_64 =
    shifted_42
      ? (shifted_41 | _23_minus_pos_[0] ? _GEN_53 : _GEN_54)
      : ~shifted_41 | _23_minus_pos_[0] ? _GEN_54 : _GEN_53;	// dequant.k:61:{18,22}, :64:36, :67:{17,21,56}, :68:{17,21,56}, :69:{17,21,56}
  wire         _GEN_55 = p0_mag[2] | _pos_minus_23_[32];	// dequant.k:19:9, :59:34, :61:{18,22}, :65:{17,21,56}, :66:{17,21,56}, :69:{17,21,56}
  wire         _GEN_56 = p0_mag[2] & ~(_pos_minus_23_[32]);	// dequant.k:19:9, :59:34, :61:{18,22}, :65:{17,21,56}, :66:{17,21,56}, :69:{17,21,56}
  wire         shifted_65 =
    shifted_43
      ? (shifted_42 | _23_minus_pos_[0] ? _GEN_55 : _GEN_56)
      : ~shifted_42 | _23_minus_pos_[0] ? _GEN_56 : _GEN_55;	// dequant.k:61:{18,22}, :64:36, :67:{17,21,56}, :68:{17,21,56}, :69:{17,21,56}
  wire         _GEN_57 = p0_mag[1] | _pos_minus_23_[32];	// dequant.k:19:9, :59:34, :61:{18,22}, :65:{17,21,56}, :66:{17,21,56}, :69:{17,21,56}
  wire         _GEN_58 = p0_mag[1] & ~(_pos_minus_23_[32]);	// dequant.k:19:9, :59:34, :61:{18,22}, :65:{17,21,56}, :66:{17,21,56}, :69:{17,21,56}
  wire         shifted_66 =
    shifted_44
      ? (shifted_43 | _23_minus_pos_[0] ? _GEN_57 : _GEN_58)
      : ~shifted_43 | _23_minus_pos_[0] ? _GEN_58 : _GEN_57;	// dequant.k:61:{18,22}, :64:36, :67:{17,21,56}, :68:{17,21,56}, :69:{17,21,56}
  wire         shifted_67 =
    ~shifted_44 | _23_minus_pos_[0]
      ? p0_mag[0] & ~(_pos_minus_23_[32])
      : p0_mag[0] | _pos_minus_23_[32];	// dequant.k:19:9, :59:34, :61:{18,22}, :64:36, :65:{17,21,56}, :66:{17,21,56}, :67:{17,21,56}, :68:{17,21,56}, :69:{17,21,56}
  wire  [32:0] _pos_gt_23__diff =
    33'(33'h17
        - {28'h0,
           p0__tmp_and_4294901760_ne_0_,
           p0__tmp_and_65280_ne_0_,
           _tmp_and_240_ne_0_,
           pos,
           pos_0});	// dequant.k:19:9, :47:13, :48:{13,67}, :49:{13,17,67}, :50:{13,17,44,50,67}, :51:{13,17,50}, :57:17
  wire         _GEN_59 = ~(_pos_gt_23__diff[32]) & (|p0_mag);	// dequant.k:19:9, :31:9, :42:{9,13}, :57:{13,17}, :71:{13,27}, :73:{24,39,41}
  wire         prod_42 = p0_fp_accum[22] & p0_super_scale_bf16_2[0];	// dequant.k:19:9, :77:29, :91:{42,43}, :96:27, :101:{13,17,44,51}
  wire         prod_43 = p0_fp_accum[21] & p0_super_scale_bf16_2[0];	// dequant.k:19:9, :77:29, :91:{42,43}, :96:27, :101:{13,17,44,51}
  wire         prod_44 = p0_fp_accum[20] & p0_super_scale_bf16_2[0];	// dequant.k:19:9, :77:29, :91:{42,43}, :96:27, :101:{13,17,44,51}
  wire         prod_45 = p0_fp_accum[19] & p0_super_scale_bf16_2[0];	// dequant.k:19:9, :77:29, :91:{42,43}, :96:27, :101:{13,17,44,51}
  wire         prod_46 = p0_fp_accum[18] & p0_super_scale_bf16_2[0];	// dequant.k:19:9, :77:29, :91:{42,43}, :96:27, :101:{13,17,44,51}
  wire         prod_47 = p0_fp_accum[17] & p0_super_scale_bf16_2[0];	// dequant.k:19:9, :77:29, :91:{42,43}, :96:27, :101:{13,17,44,51}
  wire         prod_48 = p0_fp_accum[16] & p0_super_scale_bf16_2[0];	// dequant.k:19:9, :77:29, :91:{42,43}, :96:27, :101:{13,17,44,51}
  wire         prod_49 = p0_fp_accum[15] & p0_super_scale_bf16_2[0];	// dequant.k:19:9, :77:29, :91:{42,43}, :96:27, :101:{13,17,44,51}
  wire         prod_50 = p0_fp_accum[14] & p0_super_scale_bf16_2[0];	// dequant.k:19:9, :77:29, :91:{42,43}, :96:27, :101:{13,17,44,51}
  wire         prod_51 = p0_fp_accum[13] & p0_super_scale_bf16_2[0];	// dequant.k:19:9, :77:29, :91:{42,43}, :96:27, :101:{13,17,44,51}
  wire         prod_52 = p0_fp_accum[12] & p0_super_scale_bf16_2[0];	// dequant.k:19:9, :77:29, :91:{42,43}, :96:27, :101:{13,17,44,51}
  wire  [17:0] _prod_plus_ma32_shl_5_ =
    18'({2'h0,
         p0_super_scale_bf16_2[0],
         prod_42,
         prod_43,
         prod_44,
         prod_45,
         prod_46,
         prod_47,
         prod_48,
         prod_49,
         prod_50,
         prod_51,
         prod_52,
         4'h0} + {2'h1, p0_fp_accum[22:12], 5'h0});	// dequant.k:19:9, :77:29, :101:{13,17,44,51}, :102:{44,51}
  wire         prod_53 = _prod_plus_ma32_shl_5_[17] & p0_super_scale_bf16_2[1];	// dequant.k:19:9, :77:29, :102:{13,17,44}
  wire         prod_54 = _prod_plus_ma32_shl_5_[16] & p0_super_scale_bf16_2[1];	// dequant.k:19:9, :77:29, :102:{13,17,44}
  wire         prod_55 =
    _prod_plus_ma32_shl_5_[15]
      ? p0_super_scale_bf16_2[0] | p0_super_scale_bf16_2[1]
      : p0_super_scale_bf16_2[0] & ~(p0_super_scale_bf16_2[1]);	// dequant.k:19:9, :77:29, :102:{13,17,44}
  wire         prod_56 =
    _prod_plus_ma32_shl_5_[14]
      ? prod_42 | p0_super_scale_bf16_2[1]
      : prod_42 & ~(p0_super_scale_bf16_2[1]);	// dequant.k:19:9, :77:29, :101:{13,17,44,51}, :102:{13,17,44}
  wire         prod_57 =
    _prod_plus_ma32_shl_5_[13]
      ? prod_43 | p0_super_scale_bf16_2[1]
      : prod_43 & ~(p0_super_scale_bf16_2[1]);	// dequant.k:19:9, :77:29, :101:{13,17,44,51}, :102:{13,17,44}
  wire         prod_58 =
    _prod_plus_ma32_shl_5_[12]
      ? prod_44 | p0_super_scale_bf16_2[1]
      : prod_44 & ~(p0_super_scale_bf16_2[1]);	// dequant.k:19:9, :77:29, :101:{13,17,44,51}, :102:{13,17,44}
  wire         prod_59 =
    _prod_plus_ma32_shl_5_[11]
      ? prod_45 | p0_super_scale_bf16_2[1]
      : prod_45 & ~(p0_super_scale_bf16_2[1]);	// dequant.k:19:9, :77:29, :101:{13,17,44,51}, :102:{13,17,44}
  wire         prod_60 =
    _prod_plus_ma32_shl_5_[10]
      ? prod_46 | p0_super_scale_bf16_2[1]
      : prod_46 & ~(p0_super_scale_bf16_2[1]);	// dequant.k:19:9, :77:29, :101:{13,17,44,51}, :102:{13,17,44}
  wire         prod_61 =
    _prod_plus_ma32_shl_5_[9]
      ? prod_47 | p0_super_scale_bf16_2[1]
      : prod_47 & ~(p0_super_scale_bf16_2[1]);	// dequant.k:19:9, :77:29, :101:{13,17,44,51}, :102:{13,17,44}
  wire         prod_62 =
    _prod_plus_ma32_shl_5_[8]
      ? prod_48 | p0_super_scale_bf16_2[1]
      : prod_48 & ~(p0_super_scale_bf16_2[1]);	// dequant.k:19:9, :77:29, :101:{13,17,44,51}, :102:{13,17,44}
  wire         prod_63 =
    _prod_plus_ma32_shl_5_[7]
      ? prod_49 | p0_super_scale_bf16_2[1]
      : prod_49 & ~(p0_super_scale_bf16_2[1]);	// dequant.k:19:9, :77:29, :101:{13,17,44,51}, :102:{13,17,44}
  wire         prod_64 =
    _prod_plus_ma32_shl_5_[6]
      ? prod_50 | p0_super_scale_bf16_2[1]
      : prod_50 & ~(p0_super_scale_bf16_2[1]);	// dequant.k:19:9, :77:29, :101:{13,17,44,51}, :102:{13,17,44}
  wire         prod_65 =
    _prod_plus_ma32_shl_5_[5]
      ? prod_51 | p0_super_scale_bf16_2[1]
      : prod_51 & ~(p0_super_scale_bf16_2[1]);	// dequant.k:19:9, :77:29, :101:{13,17,44,51}, :102:{13,17,44}
  wire         prod_66 =
    _prod_plus_ma32_shl_5_[4]
      ? prod_52 | p0_super_scale_bf16_2[1]
      : prod_52 & ~(p0_super_scale_bf16_2[1]);	// dequant.k:19:9, :77:29, :101:{13,17,44,51}, :102:{13,17,44}
  wire         prod_67 = _prod_plus_ma32_shl_5_[3] & p0_super_scale_bf16_2[1];	// dequant.k:19:9, :77:29, :102:{13,17,44}
  wire         prod_68 = _prod_plus_ma32_shl_5_[2] & p0_super_scale_bf16_2[1];	// dequant.k:19:9, :77:29, :102:{13,17,44}
  wire         prod_69 = _prod_plus_ma32_shl_5_[1] & p0_super_scale_bf16_2[1];	// dequant.k:19:9, :77:29, :102:{13,17,44}
  wire         prod_70 = _prod_plus_ma32_shl_5_[0] & p0_super_scale_bf16_2[1];	// dequant.k:19:9, :77:29, :102:{13,17,44}
  wire  [18:0] _prod_plus_ma32_shl_6_ =
    19'({1'h0,
         prod_53,
         prod_54,
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
         prod_66,
         prod_67,
         prod_68,
         prod_69,
         prod_70} + {2'h1, p0_fp_accum[22:12], 6'h0});	// dequant.k:19:9, :102:{13,17}, :103:{44,51}
  wire         prod_71 = _prod_plus_ma32_shl_6_[18] & p0_super_scale_bf16_2[2];	// dequant.k:19:9, :77:29, :103:{13,17,44}
  wire         prod_72 =
    _prod_plus_ma32_shl_6_[17]
      ? prod_53 | p0_super_scale_bf16_2[2]
      : prod_53 & ~(p0_super_scale_bf16_2[2]);	// dequant.k:19:9, :77:29, :102:{13,17}, :103:{13,17,44}
  wire         prod_73 =
    _prod_plus_ma32_shl_6_[16]
      ? prod_54 | p0_super_scale_bf16_2[2]
      : prod_54 & ~(p0_super_scale_bf16_2[2]);	// dequant.k:19:9, :77:29, :102:{13,17}, :103:{13,17,44}
  wire         prod_74 =
    _prod_plus_ma32_shl_6_[15]
      ? prod_55 | p0_super_scale_bf16_2[2]
      : prod_55 & ~(p0_super_scale_bf16_2[2]);	// dequant.k:19:9, :77:29, :102:{13,17}, :103:{13,17,44}
  wire         prod_75 =
    _prod_plus_ma32_shl_6_[14]
      ? prod_56 | p0_super_scale_bf16_2[2]
      : prod_56 & ~(p0_super_scale_bf16_2[2]);	// dequant.k:19:9, :77:29, :102:{13,17}, :103:{13,17,44}
  wire         prod_76 =
    _prod_plus_ma32_shl_6_[13]
      ? prod_57 | p0_super_scale_bf16_2[2]
      : prod_57 & ~(p0_super_scale_bf16_2[2]);	// dequant.k:19:9, :77:29, :102:{13,17}, :103:{13,17,44}
  wire         prod_77 =
    _prod_plus_ma32_shl_6_[12]
      ? prod_58 | p0_super_scale_bf16_2[2]
      : prod_58 & ~(p0_super_scale_bf16_2[2]);	// dequant.k:19:9, :77:29, :102:{13,17}, :103:{13,17,44}
  wire         prod_78 =
    _prod_plus_ma32_shl_6_[11]
      ? prod_59 | p0_super_scale_bf16_2[2]
      : prod_59 & ~(p0_super_scale_bf16_2[2]);	// dequant.k:19:9, :77:29, :102:{13,17}, :103:{13,17,44}
  wire         prod_79 =
    _prod_plus_ma32_shl_6_[10]
      ? prod_60 | p0_super_scale_bf16_2[2]
      : prod_60 & ~(p0_super_scale_bf16_2[2]);	// dequant.k:19:9, :77:29, :102:{13,17}, :103:{13,17,44}
  wire         prod_80 =
    _prod_plus_ma32_shl_6_[9]
      ? prod_61 | p0_super_scale_bf16_2[2]
      : prod_61 & ~(p0_super_scale_bf16_2[2]);	// dequant.k:19:9, :77:29, :102:{13,17}, :103:{13,17,44}
  wire         prod_81 =
    _prod_plus_ma32_shl_6_[8]
      ? prod_62 | p0_super_scale_bf16_2[2]
      : prod_62 & ~(p0_super_scale_bf16_2[2]);	// dequant.k:19:9, :77:29, :102:{13,17}, :103:{13,17,44}
  wire         prod_82 =
    _prod_plus_ma32_shl_6_[7]
      ? prod_63 | p0_super_scale_bf16_2[2]
      : prod_63 & ~(p0_super_scale_bf16_2[2]);	// dequant.k:19:9, :77:29, :102:{13,17}, :103:{13,17,44}
  wire         prod_83 =
    _prod_plus_ma32_shl_6_[6]
      ? prod_64 | p0_super_scale_bf16_2[2]
      : prod_64 & ~(p0_super_scale_bf16_2[2]);	// dequant.k:19:9, :77:29, :102:{13,17}, :103:{13,17,44}
  wire         prod_84 =
    _prod_plus_ma32_shl_6_[5]
      ? prod_65 | p0_super_scale_bf16_2[2]
      : prod_65 & ~(p0_super_scale_bf16_2[2]);	// dequant.k:19:9, :77:29, :102:{13,17}, :103:{13,17,44}
  wire         prod_85 =
    _prod_plus_ma32_shl_6_[4]
      ? prod_66 | p0_super_scale_bf16_2[2]
      : prod_66 & ~(p0_super_scale_bf16_2[2]);	// dequant.k:19:9, :77:29, :102:{13,17}, :103:{13,17,44}
  wire         prod_86 =
    _prod_plus_ma32_shl_6_[3]
      ? prod_67 | p0_super_scale_bf16_2[2]
      : prod_67 & ~(p0_super_scale_bf16_2[2]);	// dequant.k:19:9, :77:29, :102:{13,17}, :103:{13,17,44}
  wire         prod_87 =
    _prod_plus_ma32_shl_6_[2]
      ? prod_68 | p0_super_scale_bf16_2[2]
      : prod_68 & ~(p0_super_scale_bf16_2[2]);	// dequant.k:19:9, :77:29, :102:{13,17}, :103:{13,17,44}
  wire         prod_88 =
    _prod_plus_ma32_shl_6_[1]
      ? prod_69 | p0_super_scale_bf16_2[2]
      : prod_69 & ~(p0_super_scale_bf16_2[2]);	// dequant.k:19:9, :77:29, :102:{13,17}, :103:{13,17,44}
  wire         prod_89 =
    _prod_plus_ma32_shl_6_[0]
      ? prod_70 | p0_super_scale_bf16_2[2]
      : prod_70 & ~(p0_super_scale_bf16_2[2]);	// dequant.k:19:9, :77:29, :102:{13,17}, :103:{13,17,44}
  wire  [19:0] _prod_plus_ma32_shl_7_ =
    20'({1'h0,
         prod_71,
         prod_72,
         prod_73,
         prod_74,
         prod_75,
         prod_76,
         prod_77,
         prod_78,
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
         prod_89} + {2'h1, p0_fp_accum[22:12], 7'h0});	// dequant.k:19:9, :103:{13,17}, :104:{44,51}
  wire         prod_90 = _prod_plus_ma32_shl_7_[19] & p0_super_scale_bf16_2[3];	// dequant.k:19:9, :77:29, :104:{13,17,44}
  wire         prod_91 =
    _prod_plus_ma32_shl_7_[18]
      ? prod_71 | p0_super_scale_bf16_2[3]
      : prod_71 & ~(p0_super_scale_bf16_2[3]);	// dequant.k:19:9, :77:29, :103:{13,17}, :104:{13,17,44}
  wire         prod_92 =
    _prod_plus_ma32_shl_7_[17]
      ? prod_72 | p0_super_scale_bf16_2[3]
      : prod_72 & ~(p0_super_scale_bf16_2[3]);	// dequant.k:19:9, :77:29, :103:{13,17}, :104:{13,17,44}
  wire         prod_93 =
    _prod_plus_ma32_shl_7_[16]
      ? prod_73 | p0_super_scale_bf16_2[3]
      : prod_73 & ~(p0_super_scale_bf16_2[3]);	// dequant.k:19:9, :77:29, :103:{13,17}, :104:{13,17,44}
  wire         prod_94 =
    _prod_plus_ma32_shl_7_[15]
      ? prod_74 | p0_super_scale_bf16_2[3]
      : prod_74 & ~(p0_super_scale_bf16_2[3]);	// dequant.k:19:9, :77:29, :103:{13,17}, :104:{13,17,44}
  wire         prod_95 =
    _prod_plus_ma32_shl_7_[14]
      ? prod_75 | p0_super_scale_bf16_2[3]
      : prod_75 & ~(p0_super_scale_bf16_2[3]);	// dequant.k:19:9, :77:29, :103:{13,17}, :104:{13,17,44}
  wire         prod_96 =
    _prod_plus_ma32_shl_7_[13]
      ? prod_76 | p0_super_scale_bf16_2[3]
      : prod_76 & ~(p0_super_scale_bf16_2[3]);	// dequant.k:19:9, :77:29, :103:{13,17}, :104:{13,17,44}
  wire         prod_97 =
    _prod_plus_ma32_shl_7_[12]
      ? prod_77 | p0_super_scale_bf16_2[3]
      : prod_77 & ~(p0_super_scale_bf16_2[3]);	// dequant.k:19:9, :77:29, :103:{13,17}, :104:{13,17,44}
  wire         prod_98 =
    _prod_plus_ma32_shl_7_[11]
      ? prod_78 | p0_super_scale_bf16_2[3]
      : prod_78 & ~(p0_super_scale_bf16_2[3]);	// dequant.k:19:9, :77:29, :103:{13,17}, :104:{13,17,44}
  wire         prod_99 =
    _prod_plus_ma32_shl_7_[10]
      ? prod_79 | p0_super_scale_bf16_2[3]
      : prod_79 & ~(p0_super_scale_bf16_2[3]);	// dequant.k:19:9, :77:29, :103:{13,17}, :104:{13,17,44}
  wire         prod_100 =
    _prod_plus_ma32_shl_7_[9]
      ? prod_80 | p0_super_scale_bf16_2[3]
      : prod_80 & ~(p0_super_scale_bf16_2[3]);	// dequant.k:19:9, :77:29, :103:{13,17}, :104:{13,17,44}
  wire         prod_101 =
    _prod_plus_ma32_shl_7_[8]
      ? prod_81 | p0_super_scale_bf16_2[3]
      : prod_81 & ~(p0_super_scale_bf16_2[3]);	// dequant.k:19:9, :77:29, :103:{13,17}, :104:{13,17,44}
  wire         prod_102 =
    _prod_plus_ma32_shl_7_[7]
      ? prod_82 | p0_super_scale_bf16_2[3]
      : prod_82 & ~(p0_super_scale_bf16_2[3]);	// dequant.k:19:9, :77:29, :103:{13,17}, :104:{13,17,44}
  wire         prod_103 =
    _prod_plus_ma32_shl_7_[6]
      ? prod_83 | p0_super_scale_bf16_2[3]
      : prod_83 & ~(p0_super_scale_bf16_2[3]);	// dequant.k:19:9, :77:29, :103:{13,17}, :104:{13,17,44}
  wire         prod_104 =
    _prod_plus_ma32_shl_7_[5]
      ? prod_84 | p0_super_scale_bf16_2[3]
      : prod_84 & ~(p0_super_scale_bf16_2[3]);	// dequant.k:19:9, :77:29, :103:{13,17}, :104:{13,17,44}
  wire         prod_105 =
    _prod_plus_ma32_shl_7_[4]
      ? prod_85 | p0_super_scale_bf16_2[3]
      : prod_85 & ~(p0_super_scale_bf16_2[3]);	// dequant.k:19:9, :77:29, :103:{13,17}, :104:{13,17,44}
  wire         prod_106 =
    _prod_plus_ma32_shl_7_[3]
      ? prod_86 | p0_super_scale_bf16_2[3]
      : prod_86 & ~(p0_super_scale_bf16_2[3]);	// dequant.k:19:9, :77:29, :103:{13,17}, :104:{13,17,44}
  wire         prod_107 =
    _prod_plus_ma32_shl_7_[2]
      ? prod_87 | p0_super_scale_bf16_2[3]
      : prod_87 & ~(p0_super_scale_bf16_2[3]);	// dequant.k:19:9, :77:29, :103:{13,17}, :104:{13,17,44}
  wire         prod_108 =
    _prod_plus_ma32_shl_7_[1]
      ? prod_88 | p0_super_scale_bf16_2[3]
      : prod_88 & ~(p0_super_scale_bf16_2[3]);	// dequant.k:19:9, :77:29, :103:{13,17}, :104:{13,17,44}
  wire         prod_109 =
    _prod_plus_ma32_shl_7_[0]
      ? prod_89 | p0_super_scale_bf16_2[3]
      : prod_89 & ~(p0_super_scale_bf16_2[3]);	// dequant.k:19:9, :77:29, :103:{13,17}, :104:{13,17,44}
  always @(posedge clk) begin	// dequant.k:19:9
    p0_accum <= data_in_1[23:0];	// dequant.k:19:9
    p0_super_scale_bf16 <= data_in_1[39:24];	// dequant.k:19:9
    p0_sub_scale <= data_in_1[43:40];	// dequant.k:19:9
    if (rst)	// dequant.k:19:9
      p0_stage1_enable <= 1'h0;	// dequant.k:19:9
    else	// dequant.k:19:9
      p0_stage1_enable <= _GEN & input_valid_0;	// dequant.k:19:9
    p0_scaled <=
      {_scaled_plus_cast_lt_int32_gt_a_shl_4_[31]
         ? scaled_63 | p0_sub_scale[3]
         : scaled_63 & ~(p0_sub_scale[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[30]
         ? scaled_64 | p0_sub_scale[3]
         : scaled_64 & ~(p0_sub_scale[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[29]
         ? scaled_65 | p0_sub_scale[3]
         : scaled_65 & ~(p0_sub_scale[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[28]
         ? scaled_66 | p0_sub_scale[3]
         : scaled_66 & ~(p0_sub_scale[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[27]
         ? scaled_67 | p0_sub_scale[3]
         : scaled_67 & ~(p0_sub_scale[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[26]
         ? scaled_68 | p0_sub_scale[3]
         : scaled_68 & ~(p0_sub_scale[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[25]
         ? scaled_69 | p0_sub_scale[3]
         : scaled_69 & ~(p0_sub_scale[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[24]
         ? scaled_70 | p0_sub_scale[3]
         : scaled_70 & ~(p0_sub_scale[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[23]
         ? scaled_71 | p0_sub_scale[3]
         : scaled_71 & ~(p0_sub_scale[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[22]
         ? scaled_72 | p0_sub_scale[3]
         : scaled_72 & ~(p0_sub_scale[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[21]
         ? scaled_73 | p0_sub_scale[3]
         : scaled_73 & ~(p0_sub_scale[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[20]
         ? scaled_74 | p0_sub_scale[3]
         : scaled_74 & ~(p0_sub_scale[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[19]
         ? scaled_75 | p0_sub_scale[3]
         : scaled_75 & ~(p0_sub_scale[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[18]
         ? scaled_76 | p0_sub_scale[3]
         : scaled_76 & ~(p0_sub_scale[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[17]
         ? scaled_77 | p0_sub_scale[3]
         : scaled_77 & ~(p0_sub_scale[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[16]
         ? scaled_78 | p0_sub_scale[3]
         : scaled_78 & ~(p0_sub_scale[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[15]
         ? scaled_79 | p0_sub_scale[3]
         : scaled_79 & ~(p0_sub_scale[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[14]
         ? scaled_80 | p0_sub_scale[3]
         : scaled_80 & ~(p0_sub_scale[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[13]
         ? scaled_81 | p0_sub_scale[3]
         : scaled_81 & ~(p0_sub_scale[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[12]
         ? scaled_82 | p0_sub_scale[3]
         : scaled_82 & ~(p0_sub_scale[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[11]
         ? scaled_83 | p0_sub_scale[3]
         : scaled_83 & ~(p0_sub_scale[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[10]
         ? scaled_84 | p0_sub_scale[3]
         : scaled_84 & ~(p0_sub_scale[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[9]
         ? scaled_85 | p0_sub_scale[3]
         : scaled_85 & ~(p0_sub_scale[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[8]
         ? scaled_86 | p0_sub_scale[3]
         : scaled_86 & ~(p0_sub_scale[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[7]
         ? scaled_87 | p0_sub_scale[3]
         : scaled_87 & ~(p0_sub_scale[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[6]
         ? scaled_88 | p0_sub_scale[3]
         : scaled_88 & ~(p0_sub_scale[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[5]
         ? scaled_89 | p0_sub_scale[3]
         : scaled_89 & ~(p0_sub_scale[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[4]
         ? scaled_90 | p0_sub_scale[3]
         : scaled_90 & ~(p0_sub_scale[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[3]
         ? scaled_91 | p0_sub_scale[3]
         : scaled_91 & ~(p0_sub_scale[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[2]
         ? scaled_92 | p0_sub_scale[3]
         : scaled_92 & ~(p0_sub_scale[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[1]
         ? scaled_93 | p0_sub_scale[3]
         : scaled_93 & ~(p0_sub_scale[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[0]
         ? scaled_94 | p0_sub_scale[3]
         : scaled_94 & ~(p0_sub_scale[3])};	// dequant.k:19:{9,26,51}, :25:{9,13}, :26:{9,13,44}
    p0_super_scale_bf16_0 <= p0_super_scale_bf16;	// dequant.k:19:9
    if (rst)	// dequant.k:19:9
      p0_stage2_enable <= 1'h0;	// dequant.k:19:9
    else	// dequant.k:19:9
      p0_stage2_enable <= p0_stage1_enable;	// dequant.k:19:9
    p0_mag <=
      {mag,
       mag_0,
       mag_1,
       mag_2,
       mag_3,
       mag_4,
       mag_5,
       mag_6,
       mag_7,
       mag_8,
       mag_9,
       mag_10,
       mag_11,
       mag_12,
       mag_13,
       mag_14,
       mag_15,
       mag_16,
       mag_17,
       mag_18,
       mag_19,
       mag_20,
       mag_21,
       mag_22,
       mag_23,
       mag_24,
       mag_25,
       mag_26,
       mag_27,
       mag_28,
       mag_29,
       mag_30};	// dequant.k:19:9, :31:9, :34:19
    p0_tmp <=
      {tmp & ~_tmp_and_65280_ne_0_,
       tmp_0 & ~_tmp_and_65280_ne_0_,
       tmp_1 & ~_tmp_and_65280_ne_0_,
       tmp_2 & ~_tmp_and_65280_ne_0_,
       tmp_3 & ~_tmp_and_65280_ne_0_,
       tmp_4 & ~_tmp_and_65280_ne_0_,
       tmp_5 & ~_tmp_and_65280_ne_0_,
       tmp_6 & ~_tmp_and_65280_ne_0_,
       tmp ? tmp_7 | _tmp_and_65280_ne_0_ : tmp_7 & ~_tmp_and_65280_ne_0_,
       tmp_0 ? tmp_8 | _tmp_and_65280_ne_0_ : tmp_8 & ~_tmp_and_65280_ne_0_,
       tmp_1 ? tmp_9 | _tmp_and_65280_ne_0_ : tmp_9 & ~_tmp_and_65280_ne_0_,
       tmp_2 ? tmp_10 | _tmp_and_65280_ne_0_ : tmp_10 & ~_tmp_and_65280_ne_0_,
       tmp_3 ? tmp_11 | _tmp_and_65280_ne_0_ : tmp_11 & ~_tmp_and_65280_ne_0_,
       tmp_4 ? tmp_12 | _tmp_and_65280_ne_0_ : tmp_12 & ~_tmp_and_65280_ne_0_,
       tmp_5 ? tmp_13 | _tmp_and_65280_ne_0_ : tmp_13 & ~_tmp_and_65280_ne_0_,
       tmp_6 ? tmp_14 | _tmp_and_65280_ne_0_ : tmp_14 & ~_tmp_and_65280_ne_0_,
       tmp_7 ? _tmp_and_65280_ne_0_ : tmp_15 & ~_tmp_and_65280_ne_0_,
       tmp_8 ? _tmp_and_65280_ne_0_ : tmp_16 & ~_tmp_and_65280_ne_0_,
       tmp_9 ? _tmp_and_65280_ne_0_ : tmp_17 & ~_tmp_and_65280_ne_0_,
       tmp_10 ? _tmp_and_65280_ne_0_ : tmp_18 & ~_tmp_and_65280_ne_0_,
       tmp_11 ? _tmp_and_65280_ne_0_ : tmp_19 & ~_tmp_and_65280_ne_0_,
       tmp_12 ? _tmp_and_65280_ne_0_ : tmp_20 & ~_tmp_and_65280_ne_0_,
       tmp_13 ? _tmp_and_65280_ne_0_ : tmp_21 & ~_tmp_and_65280_ne_0_,
       tmp_14 ? _tmp_and_65280_ne_0_ : tmp_22 & ~_tmp_and_65280_ne_0_,
       tmp_15 ? tmp_23 | _tmp_and_65280_ne_0_ : tmp_23 & ~_tmp_and_65280_ne_0_,
       tmp_16 ? tmp_24 | _tmp_and_65280_ne_0_ : tmp_24 & ~_tmp_and_65280_ne_0_,
       tmp_17 ? tmp_25 | _tmp_and_65280_ne_0_ : tmp_25 & ~_tmp_and_65280_ne_0_,
       tmp_18 ? tmp_26 | _tmp_and_65280_ne_0_ : tmp_26 & ~_tmp_and_65280_ne_0_,
       tmp_19 ? tmp_27 | _tmp_and_65280_ne_0_ : tmp_27 & ~_tmp_and_65280_ne_0_,
       tmp_20 ? tmp_28 | _tmp_and_65280_ne_0_ : tmp_28 & ~_tmp_and_65280_ne_0_,
       tmp_21 ? tmp_29 | _tmp_and_65280_ne_0_ : tmp_29 & ~_tmp_and_65280_ne_0_,
       tmp_22 ? tmp_30 | _tmp_and_65280_ne_0_ : tmp_30 & ~_tmp_and_65280_ne_0_};	// dequant.k:19:9, :47:{13,44,50}, :48:{13,17,44,50}
    p0__tmp_and_4294901760_ne_0_ <= _tmp_and_4294901760_ne_0_;	// dequant.k:19:9, :47:17
    p0__tmp_and_65280_ne_0_ <= _tmp_and_65280_ne_0_;	// dequant.k:19:9, :48:17
    p0__scaled_lt_0_ <= p0_scaled[31];	// dequant.k:19:9, :31:13
    p0_super_scale_bf16_1 <= p0_super_scale_bf16_0;	// dequant.k:19:9
    if (rst)	// dequant.k:19:9
      p0_stage3_enable <= 1'h0;	// dequant.k:19:9
    else	// dequant.k:19:9
      p0_stage3_enable <= p0_stage2_enable;	// dequant.k:19:9
    p0_super_scale_bf16_2 <= p0_super_scale_bf16_1;	// dequant.k:19:9
    p0_fp_accum <=
      {p0__scaled_lt_0_ & (|p0_mag),
       _127_plus_pos_[7] & (|p0_mag),
       _127_plus_pos_[6] & (|p0_mag),
       _127_plus_pos_[5] & (|p0_mag),
       _127_plus_pos_[4] & (|p0_mag),
       _127_plus_pos_[3] & (|p0_mag),
       _127_plus_pos_[2] & (|p0_mag),
       _127_plus_pos_[1] & (|p0_mag),
       _127_plus_pos_[0] & (|p0_mag),
       _mag_shr_pos_minus_23_[22]
         ? (shifted_45 | _pos_gt_23__diff[32]) & (|p0_mag)
         : shifted_45 & _GEN_59,
       _mag_shr_pos_minus_23_[21]
         ? (shifted_46 | _pos_gt_23__diff[32]) & (|p0_mag)
         : shifted_46 & _GEN_59,
       _mag_shr_pos_minus_23_[20]
         ? (shifted_47 | _pos_gt_23__diff[32]) & (|p0_mag)
         : shifted_47 & _GEN_59,
       _mag_shr_pos_minus_23_[19]
         ? (shifted_48 | _pos_gt_23__diff[32]) & (|p0_mag)
         : shifted_48 & _GEN_59,
       _mag_shr_pos_minus_23_[18]
         ? (shifted_49 | _pos_gt_23__diff[32]) & (|p0_mag)
         : shifted_49 & _GEN_59,
       _mag_shr_pos_minus_23_[17]
         ? (shifted_50 | _pos_gt_23__diff[32]) & (|p0_mag)
         : shifted_50 & _GEN_59,
       _mag_shr_pos_minus_23_[16]
         ? (shifted_51 | _pos_gt_23__diff[32]) & (|p0_mag)
         : shifted_51 & _GEN_59,
       _mag_shr_pos_minus_23_[15]
         ? (shifted_52 | _pos_gt_23__diff[32]) & (|p0_mag)
         : shifted_52 & _GEN_59,
       _mag_shr_pos_minus_23_[14]
         ? (shifted_53 | _pos_gt_23__diff[32]) & (|p0_mag)
         : shifted_53 & _GEN_59,
       _mag_shr_pos_minus_23_[13]
         ? (shifted_54 | _pos_gt_23__diff[32]) & (|p0_mag)
         : shifted_54 & _GEN_59,
       _mag_shr_pos_minus_23_[12]
         ? (shifted_55 | _pos_gt_23__diff[32]) & (|p0_mag)
         : shifted_55 & _GEN_59,
       _mag_shr_pos_minus_23_[11]
         ? (shifted_56 | _pos_gt_23__diff[32]) & (|p0_mag)
         : shifted_56 & _GEN_59,
       _mag_shr_pos_minus_23_[10]
         ? (shifted_57 | _pos_gt_23__diff[32]) & (|p0_mag)
         : shifted_57 & _GEN_59,
       _mag_shr_pos_minus_23_[9]
         ? (shifted_58 | _pos_gt_23__diff[32]) & (|p0_mag)
         : shifted_58 & _GEN_59,
       _mag_shr_pos_minus_23_[8]
         ? (shifted_59 | _pos_gt_23__diff[32]) & (|p0_mag)
         : shifted_59 & _GEN_59,
       _mag_shr_pos_minus_23_[7]
         ? (shifted_60 | _pos_gt_23__diff[32]) & (|p0_mag)
         : shifted_60 & _GEN_59,
       _mag_shr_pos_minus_23_[6]
         ? (shifted_61 | _pos_gt_23__diff[32]) & (|p0_mag)
         : shifted_61 & _GEN_59,
       _mag_shr_pos_minus_23_[5]
         ? (shifted_62 | _pos_gt_23__diff[32]) & (|p0_mag)
         : shifted_62 & _GEN_59,
       _mag_shr_pos_minus_23_[4]
         ? (shifted_63 | _pos_gt_23__diff[32]) & (|p0_mag)
         : shifted_63 & _GEN_59,
       _mag_shr_pos_minus_23_[3]
         ? (shifted_64 | _pos_gt_23__diff[32]) & (|p0_mag)
         : shifted_64 & _GEN_59,
       _mag_shr_pos_minus_23_[2]
         ? (shifted_65 | _pos_gt_23__diff[32]) & (|p0_mag)
         : shifted_65 & _GEN_59,
       _mag_shr_pos_minus_23_[1]
         ? (shifted_66 | _pos_gt_23__diff[32]) & (|p0_mag)
         : shifted_66 & _GEN_59,
       _mag_shr_pos_minus_23_[0]
         ? (shifted_67 | _pos_gt_23__diff[32]) & (|p0_mag)
         : shifted_67 & _GEN_59};	// dequant.k:19:9, :31:9, :42:{9,13}, :53:30, :57:{13,17}, :59:27, :61:{18,22}, :69:{17,21,56}, :71:{13,27}, :73:{24,39,41}
    if (rst)	// dequant.k:19:9
      p0_stage4_enable <= 1'h0;	// dequant.k:19:9
    else	// dequant.k:19:9
      p0_stage4_enable <= p0_stage3_enable;	// dequant.k:19:9
    p0_fp_accum_0 <= p0_fp_accum;	// dequant.k:19:9
    p0__cast_lt_uint32_gt_super_scale_bf16_shl_16_ <= {p0_super_scale_bf16_2, 16'h0};	// dequant.k:19:9, :77:29
    p0__prod_plus_ma32_shl_8_ <=
      21'({1'h0,
           prod_90,
           prod_91,
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
           prod_104,
           prod_105,
           prod_106,
           prod_107,
           prod_108,
           prod_109} + {2'h1, p0_fp_accum[22:12], 8'h0});	// dequant.k:19:9, :104:{13,17}, :105:{44,51}
    p0_CastSource <= {p0_super_scale_bf16_2[6:0], 4'h0};	// dequant.k:19:9, :92:{42,43}
    p0_prod <=
      {prod_90,
       prod_91,
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
       prod_104,
       prod_105,
       prod_106,
       prod_107,
       prod_108,
       prod_109};	// dequant.k:19:9, :104:{13,17}
    p0_cast_lt_uint32_gt_ma_ <= p0_fp_accum[22:12];	// dequant.k:19:9, :91:{42,43}, :96:27
    if (rst)	// dequant.k:19:9
      p0_stage5_enable <= 1'h0;	// dequant.k:19:9
    else	// dequant.k:19:9
      p0_stage5_enable <= p0_stage4_enable;	// dequant.k:19:9
    p0_result <= result;	// dequant.k:19:9, :84:{9,13,19,33}
    if (rst)	// dequant.k:19:9
      p0_stage6_enable <= 1'h0;	// dequant.k:19:9
    else	// dequant.k:19:9
      p0_stage6_enable <= p0_stage5_enable;	// dequant.k:19:9
  end // always @(posedge)
  always_comb begin	// dequant.k:19:9
    fifo_wren_0_0 = p0_stage6_enable;	// dequant.k:14:5, :19:9
    fifo_data_out_0_0 = p0_result;	// dequant.k:14:5, :19:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// dequant.k:19:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// dequant.k:19:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  dequant_unitDebugView_dequantizeEntry dequant_unitDebugView_dequantizeEntry_instance (	// dequant.k:14:5
    .clk               (clk),	// dequant.k:14:5
    ._accum            (p0_stage1_enable ? p0_accum : 'x),	// dequant.k:14:5, :19:9
    ._super_scale_bf16 (p0_stage1_enable ? p0_super_scale_bf16 : 'x),	// dequant.k:14:5, :19:9
    ._sub_scale        (p0_stage1_enable ? p0_sub_scale : 'x),	// dequant.k:14:5, :19:9
    .valid             (p0_stage1_enable),	// dequant.k:19:9
    .valid_out         (/* unused */)
  );	// dequant.k:14:5
  dequant_unitDebugView_dequantizeExit dequant_unitDebugView_dequantizeExit_instance (	// dequant.k:14:5
    .clk          (clk),	// dequant.k:14:5
    ._ReturnValue (p0_stage5_enable ? result : 'x),	// dequant.k:14:5, :19:9, :84:{9,13,19,33}
    .valid        (p0_stage5_enable),	// dequant.k:19:9
    .valid_out    (/* unused */)
  );	// dequant.k:14:5
  assign done_out = p0_stage6_enable;	// dequant.k:19:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// dequant.k:19:9
  assign fifo_wren_0 = fifo_wren_0_0;	// dequant.k:19:9
  assign input_rdy_0 = input_rdy_0_0;	// dequant.k:19:9
  assign control_state_out = control_state_out_0;	// dequant.k:19:9
endmodule

module dequant_unit(
  input  wire        clk,
  input  wire        rst,
  input  wire        dequantize_valid_in,
  input  wire [23:0] dequantize_accum_in,
  input  wire [15:0] dequantize_super_scale_bf16_in,
  input  wire [3:0]  dequantize_sub_scale_in,
  input  wire        dequantize_rden_in,
  input  wire [2:0]  stall_rate_in,
  input  wire        stall_rate_valid_in,
  output wire        rst_and_startup_done_out,
  output wire        dequantize_rdy_out,
  output wire        dequantize_empty_out,
  output wire [31:0] dequantize_result_out,
  output wire        stall_rate_supported_out
);

  wire [31:0] _dequantize_BasicBlock_0Impl_fifo_data_out_0;	// dequant.k:19:9
  wire        _dequantize_BasicBlock_0Impl_fifo_wren_0;	// dequant.k:19:9
  wire        _dequantize_BasicBlock_0Impl_input_rdy_0;	// dequant.k:19:9
  wire        _fifo_0_dequantize_Return_overflow_out;
  wire        _fifo_0_dequantize_Return_underflow_out;
  wire        _fifo_0_dequantize_Return_empty;
  wire        _fifo_0_dequantize_Return_full;
  wire [31:0] _fifo_0_dequantize_Return_q;
  wire        _has_startup_completed_delayed_0_delay_chain_data_out;
  wire        _reset_control_rst_and_startup_done_out;
  wire [1:0]  _reset_control_rst_delayed_out;
  wire        _reset_control_reset_sequence_finished_this_cycle_out;
  logic  stall_rate_supported_out_net;
  logic  dequantize_empty_out_net;
  logic [31:0] dequantize_result_out_net;
  logic  dequantize_rdy_out_net;
  logic  rst_and_startup_done_out_net;

  logic [31:0] dropped_commands;
  //synopsys translate_off
  KanagawaStringTable string_table(.clk(clk));
  //synopsys translate_on
  logic [1:0] reg_rst_delayed;
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

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [31:0] data_in;
      logic [31:0] data_out;
      logic overflow;
      logic underflow;
  } fifo_data_0;

  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [43:0] data;
      logic underflow;
  } passthrough_data_1;
  assign passthrough_data_1.underflow = 1'b0;
  assign passthrough_data_1.rdy_ext = passthrough_data_1.rdy_int & !(!has_startup_completed_delayed_0);
  assign dequantize_rdy_out_net = passthrough_data_1.rdy_ext;
  assign passthrough_data_1.valid = dequantize_rdy_out & dequantize_valid_in;
  assign passthrough_data_1.data = { dequantize_sub_scale_in, dequantize_super_scale_bf16_in, dequantize_accum_in };
  assign fifo_data_0.rden = dequantize_rden_in;
  assign dequantize_result_out_net = fifo_data_0.data_out;
  assign dequantize_empty_out_net = fifo_data_0.empty;
  always_comb begin
    rst_and_startup_done_out_net = _reset_control_rst_and_startup_done_out;
    reg_rst_delayed = _reset_control_rst_delayed_out;
    reset_sequence_finished_this_cycle = _reset_control_reset_sequence_finished_this_cycle_out;
    has_startup_completed_delayed_0 = _has_startup_completed_delayed_0_delay_chain_data_out;
    fifo_data_0.overflow = _fifo_0_dequantize_Return_overflow_out;
    fifo_data_0.underflow = _fifo_0_dequantize_Return_underflow_out;
    fifo_data_0.empty = _fifo_0_dequantize_Return_empty;
    fifo_data_0.almost_full = _fifo_0_dequantize_Return_full;
    fifo_data_0.data_out = _fifo_0_dequantize_Return_q;
    fifo_data_0.data_in = _dequantize_BasicBlock_0Impl_fifo_data_out_0;	// dequant.k:19:9
    fifo_data_0.wren = _dequantize_BasicBlock_0Impl_fifo_wren_0;	// dequant.k:19:9
    passthrough_data_1.rdy_int = _dequantize_BasicBlock_0Impl_input_rdy_0;	// dequant.k:19:9
  end // always_comb

  assign has_startup_completed_raw = 1'b1;
  assign stall_rate_supported_out_net = 1'b0;
  KanagawaResetControl #(
    .WIDTH(2),
    .DELAY_CYCLES(3),
    .FAN_OUT_LEVELS(1),
    .HOLD_CYCLES(18),
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
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) has_startup_completed_delayed_0_delay_chain (
    .clk      (clk),
    .data_in  (has_others_completed),
    .data_out (_has_startup_completed_delayed_0_delay_chain_data_out)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(32),
    .PORT_WIDTH(32),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_0_dequantize_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(7),
    .USE_LUTRAM(1)
  ) fifo_0_dequantize_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[0]),
    .overflow_out  (_fifo_0_dequantize_Return_overflow_out),
    .underflow_out (_fifo_0_dequantize_Return_underflow_out),
    .empty         (_fifo_0_dequantize_Return_empty),
    .rdreq         (fifo_data_0.rden),
    .full          (_fifo_0_dequantize_Return_full),
    .wrreq         (fifo_data_0.wren),
    .data          (fifo_data_0.data_in),
    .q             (_fifo_0_dequantize_Return_q)
  );
  dequant_unit_dequantize_BasicBlock_0 dequantize_BasicBlock_0Impl (	// dequant.k:19:9
    .clk                       (clk),	// dequant.k:19:9
    .rst                       (reg_rst_delayed[1]),	// dequant.k:19:9
    .done_out                  (/* unused */),
    .fifo_data_out_0           (_dequantize_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0               (_dequantize_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_0.almost_full),	// dequant.k:19:9
    .fifo_overflow_in_0        (fifo_data_0.overflow),	// dequant.k:19:9
    .data_in_1                 (passthrough_data_1.data),	// dequant.k:19:9
    .input_fifo_underflow_0    (passthrough_data_1.underflow),	// dequant.k:19:9
    .input_rdy_0               (_dequantize_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_1.valid),	// dequant.k:19:9
    .control_state_out         (/* unused */)
  );	// dequant.k:19:9
  assign rst_and_startup_done_out = rst_and_startup_done_out_net;
  assign dequantize_rdy_out = dequantize_rdy_out_net;
  assign dequantize_empty_out = dequantize_empty_out_net;
  assign dequantize_result_out = dequantize_result_out_net;
  assign stall_rate_supported_out = stall_rate_supported_out_net;
endmodule

module dequant_unit_EsiWrapper(
  input  wire                                                                                            clk,
  input  wire                                                                                            rst,
  input  wire [2:0]                                                                                      stall_rate_in,
  input  wire                                                                                            stall_rate_valid_in,
  input  wire struct packed {logic [23:0] accum; logic [15:0] super_scale_bf16; logic [3:0] sub_scale; } dequantize_arg,
  input  wire                                                                                            dequantize_arg_valid,
  input  wire                                                                                            dequantize_result_rden,
  output wire                                                                                            dequantize_arg_ready,
  output wire [31:0]                                                                                     dequantize_result,
  output wire                                                                                            dequantize_result_empty,
  output wire                                                                                            rst_and_startup_done_out,
  output wire                                                                                            stall_rate_supported_out
);

  wire [31:0] _EsiWrapped_dequantize_result_out;
  dequant_unit EsiWrapped (
    .clk                            (clk),
    .rst                            (rst),
    .dequantize_valid_in            (dequantize_arg_valid),
    .dequantize_accum_in            (dequantize_arg.accum),
    .dequantize_super_scale_bf16_in (dequantize_arg.super_scale_bf16),
    .dequantize_sub_scale_in        (dequantize_arg.sub_scale),
    .dequantize_rden_in             (dequantize_result_rden),
    .stall_rate_in                  (stall_rate_in),
    .stall_rate_valid_in            (stall_rate_valid_in),
    .rst_and_startup_done_out       (rst_and_startup_done_out),
    .dequantize_rdy_out             (dequantize_arg_ready),
    .dequantize_empty_out           (dequantize_result_empty),
    .dequantize_result_out          (_EsiWrapped_dequantize_result_out),
    .stall_rate_supported_out       (stall_rate_supported_out)
  );
  assign dequantize_result = _EsiWrapped_dequantize_result_out;
endmodule

