
// This file was generated. Do not modify.
// kanagawa --backend=sv --import-dir=/home/mana/workspace/OpenTaalas/third-party/kanagawa/library --base-library=/home/mana/workspace/OpenTaalas/third-party/kanagawa/library/mini-base.k --output=/home/mana/workspace/OpenTaalas/rtl/generated/kanagawa/dequant /home/mana/workspace/OpenTaalas/rtl/kanagawa/dequant.k

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
  input  wire [43:0] data_in_4,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  wire  [63:0] _delay_fifo_3_dequantize_Propagation_data_out;	// dequant.k:19:9
  logic [31:0] data_prop_in_3_0;	// dequant.k:19:9
  logic [31:0] data_prop_in_3_32;	// dequant.k:19:9
  wire  [31:0] data_prop_out_3_0 = _delay_fifo_3_dequantize_Propagation_data_out[31:0];	// dequant.k:19:9
  wire  [31:0] data_prop_out_3_32 = _delay_fifo_3_dequantize_Propagation_data_out[63:32];	// dequant.k:19:9
  logic [31:0] data_prop_in_2_0;	// dequant.k:19:9
  wire  [31:0] data_prop_out_2_0;	// dequant.k:19:9
  logic [15:0] data_prop_in_1_0;	// dequant.k:19:9
  wire  [15:0] data_prop_out_1_0;	// dequant.k:19:9
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
  always_comb	// dequant.k:19:9
    data_prop_in_1_0 = p0_super_scale_bf16;	// dequant.k:19:9
  reg   [31:0] p0_cast_lt_int32_gt_a_;	// dequant.k:19:9
  reg   [31:0] p0_scaled;	// dequant.k:19:9
  reg   [4:0]  p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_;	// dequant.k:19:9
  reg          p0_stage2_enable = 1'h0;	// dequant.k:19:9
  reg   [31:0] p0_cast_lt_int32_gt_a__0;	// dequant.k:19:9
  reg   [31:0] p0_scaled_0;	// dequant.k:19:9
  reg   [4:0]  p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0;	// dequant.k:19:9
  reg          p0_stage3_enable = 1'h0;	// dequant.k:19:9
  reg   [31:0] p0_cast_lt_int32_gt_a__1;	// dequant.k:19:9
  reg   [31:0] p0_scaled_1;	// dequant.k:19:9
  reg   [4:0]  p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1;	// dequant.k:19:9
  reg          p0_stage4_enable = 1'h0;	// dequant.k:19:9
  reg   [31:0] p0_scaled_2;	// dequant.k:19:9
  reg          p0_stage5_enable = 1'h0;	// dequant.k:19:9
  reg   [31:0] p0_mag;	// dequant.k:19:9
  reg          p0__scaled_lt_0_;	// dequant.k:19:9
  reg          p0_stage6_enable = 1'h0;	// dequant.k:19:9
  reg   [31:0] p0_mag_0;	// dequant.k:19:9
  reg          p0__tmp_and_4294901760_ne_0_;	// dequant.k:19:9
  reg          p0__scaled_lt_0__0;	// dequant.k:19:9
  reg          p0_stage7_enable = 1'h0;	// dequant.k:19:9
  always_comb	// dequant.k:19:9
    data_prop_in_3_0 = p0_mag_0;	// dequant.k:19:9
  reg   [3:0]  p0__tmp_and_65280_ne_0__xor_reduce;	// dequant.k:19:9
  reg   [31:0] p0_tmp;	// dequant.k:19:9
  reg          p0__tmp_and_4294901760_ne_0__0;	// dequant.k:19:9
  reg          p0__scaled_lt_0__1;	// dequant.k:19:9
  reg          p0_stage8_enable = 1'h0;	// dequant.k:19:9
  reg   [31:0] p0_tmp_0;	// dequant.k:19:9
  reg          p0__tmp_and_4294901760_ne_0__1;	// dequant.k:19:9
  reg          p0__tmp_and_65280_ne_0_;	// dequant.k:19:9
  reg          p0__scaled_lt_0__2;	// dequant.k:19:9
  reg          p0_stage9_enable = 1'h0;	// dequant.k:19:9
  reg          p0__tmp_and_4294901760_ne_0__2;	// dequant.k:19:9
  reg          p0__tmp_and_65280_ne_0__0;	// dequant.k:19:9
  reg          p0__tmp_and_240_ne_0_;	// dequant.k:19:9
  reg   [3:0]  p0_tmp_1;	// dequant.k:19:9
  reg          p0__scaled_lt_0__3;	// dequant.k:19:9
  reg          p0_stage10_enable = 1'h0;	// dequant.k:19:9
  reg   [31:0] p0_mag_1;	// dequant.k:19:9
  reg   [32:0] p0__pos_minus_23_;	// dequant.k:19:9
  reg   [4:0]  p0__23_minus_pos_;	// dequant.k:19:9
  reg   [31:0] p0_pos;	// dequant.k:19:9
  reg          p0__scaled_lt_0__4;	// dequant.k:19:9
  reg   [7:0]  p0__127_plus_pos_;	// dequant.k:19:9
  reg          p0_stage11_enable = 1'h0;	// dequant.k:19:9
  reg   [31:0] p0_pos_0;	// dequant.k:19:9
  reg   [31:0] p0_shifted;	// dequant.k:19:9
  reg          p0__23_minus_pos__0;	// dequant.k:19:9
  reg   [31:0] p0_mag_2;	// dequant.k:19:9
  reg   [32:0] p0__pos_minus_23__0;	// dequant.k:19:9
  reg          p0__scaled_lt_0__5;	// dequant.k:19:9
  reg   [1:0]  p0__mag_ne_0__xor_reduce_reduce;	// dequant.k:19:9
  reg   [7:0]  p0__127_plus_pos__0;	// dequant.k:19:9
  reg   [22:0] p0__mag_shr_pos_minus_23_;	// dequant.k:19:9
  reg          p0_stage12_enable = 1'h0;	// dequant.k:19:9
  reg   [15:0] p0_super_scale_bf16_0;	// dequant.k:19:9
  reg   [31:0] p0_fp_accum;	// dequant.k:19:9
  reg          p0_stage13_enable = 1'h0;	// dequant.k:19:9
  always_comb	// dequant.k:19:9
    data_prop_in_2_0 = p0_fp_accum;	// dequant.k:19:9
  reg   [17:0] p0__prod_plus_ma32_shl_5_;	// dequant.k:19:9
  reg   [10:0] p0_CastSource;	// dequant.k:19:9
  reg   [15:0] p0_prod;	// dequant.k:19:9
  reg   [10:0] p0_cast_lt_uint32_gt_ma_;	// dequant.k:19:9
  reg   [31:0] p0__cast_lt_uint32_gt_super_scale_bf16_shl_16_;	// dequant.k:19:9
  reg          p0_stage14_enable = 1'h0;	// dequant.k:19:9
  always_comb	// dequant.k:19:9
    data_prop_in_3_32 = p0__cast_lt_uint32_gt_super_scale_bf16_shl_16_;	// dequant.k:19:9
  reg   [18:0] p0__prod_plus_ma32_shl_6_;	// dequant.k:19:9
  reg   [10:0] p0_CastSource_0;	// dequant.k:19:9
  reg   [17:0] p0_prod_0;	// dequant.k:19:9
  reg   [10:0] p0_cast_lt_uint32_gt_ma__0;	// dequant.k:19:9
  reg          p0_stage15_enable = 1'h0;	// dequant.k:19:9
  reg   [19:0] p0__prod_plus_ma32_shl_7_;	// dequant.k:19:9
  reg   [10:0] p0_CastSource_1;	// dequant.k:19:9
  reg   [18:0] p0_prod_1;	// dequant.k:19:9
  reg   [10:0] p0_cast_lt_uint32_gt_ma__1;	// dequant.k:19:9
  reg          p0_stage16_enable = 1'h0;	// dequant.k:19:9
  reg   [20:0] p0__prod_plus_ma32_shl_8_;	// dequant.k:19:9
  reg   [10:0] p0_CastSource_2;	// dequant.k:19:9
  reg   [19:0] p0_prod_2;	// dequant.k:19:9
  reg   [10:0] p0_cast_lt_uint32_gt_ma__2;	// dequant.k:19:9
  reg          p0_stage17_enable = 1'h0;	// dequant.k:19:9
  reg   [31:0] p0_fp_accum_0;	// dequant.k:19:9
  reg   [31:0] p0__cast_lt_uint32_gt_super_scale_bf16_shl_16__0;	// dequant.k:19:9
  reg   [21:0] p0__prod_plus_ma32_shl_9_;	// dequant.k:19:9
  reg   [10:0] p0_CastSource_3;	// dequant.k:19:9
  reg   [20:0] p0_prod_3;	// dequant.k:19:9
  reg   [10:0] p0_cast_lt_uint32_gt_ma__3;	// dequant.k:19:9
  reg          p0_stage18_enable = 1'h0;	// dequant.k:19:9
  reg   [22:0] p0__prod_plus_ma32_shl_10_;	// dequant.k:19:9
  reg   [10:0] p0_CastSource_4;	// dequant.k:19:9
  reg   [21:0] p0_prod_4;	// dequant.k:19:9
  reg   [10:0] p0_cast_lt_uint32_gt_ma__4;	// dequant.k:19:9
  reg   [31:0] p0_r_exp;	// dequant.k:19:9
  reg   [31:0] p0__cast_lt_uint32_gt_super_scale_bf16_shl_16__1;	// dequant.k:19:9
  reg   [31:0] p0_fp_accum_1;	// dequant.k:19:9
  reg   [1:0]  p0__b_exp_ne_0__xor_reduce;	// dequant.k:19:9
  reg   [1:0]  p0__a_exp_ne_0__xor_reduce;	// dequant.k:19:9
  reg          p0_stage19_enable = 1'h0;	// dequant.k:19:9
  reg   [8:0]  p0_r_exp_0;	// dequant.k:19:9
  reg   [31:0] p0__cast_lt_uint32_gt_super_scale_bf16_shl_16__2;	// dequant.k:19:9
  reg   [31:0] p0_fp_accum_2;	// dequant.k:19:9
  reg   [32:0] p0__r_exp_lt_255__diff;	// dequant.k:19:9
  reg   [1:0]  p0__r_exp_ne_0__xor_reduce_reduce;	// dequant.k:19:9
  reg   [22:0] p0__prod_plus_ma32_shl_11_;	// dequant.k:19:9
  reg   [1:0]  p0__b_exp_ne_0__xor_reduce_0;	// dequant.k:19:9
  reg   [1:0]  p0__a_exp_ne_0__xor_reduce_0;	// dequant.k:19:9
  reg          p0_stage20_enable = 1'h0;	// dequant.k:19:9
  wire         _GEN_0 = p0__r_exp_lt_255__diff[32] & (|p0__r_exp_ne_0__xor_reduce_reduce);	// dequant.k:19:9, :86:{13,29,30,49}, :108:{13,17}, :111:13, :113:{17,26}, :118:{17,26}, :121:{13,17,23,37}, :123:{26,41,43}
  wire         _GEN_1 = (|p0__b_exp_ne_0__xor_reduce_0) & (|p0__a_exp_ne_0__xor_reduce_0);	// dequant.k:19:9, :84:{9,13,19,33}
  wire  [31:0] result =
    {(p0_r_exp_0[8]
        ? _GEN_0
        : p0__cast_lt_uint32_gt_super_scale_bf16_shl_16__2[31]
            ? ~(p0_fp_accum_2[31]) & _GEN_0
            : p0_fp_accum_2[31] & _GEN_0) & _GEN_1,
     p0_r_exp_0[7] & _GEN_0 & _GEN_1,
     p0_r_exp_0[6] & _GEN_0 & _GEN_1,
     p0_r_exp_0[5] & _GEN_0 & _GEN_1,
     p0_r_exp_0[4] & _GEN_0 & _GEN_1,
     p0_r_exp_0[3] & _GEN_0 & _GEN_1,
     p0_r_exp_0[2] & _GEN_0 & _GEN_1,
     p0_r_exp_0[1] & _GEN_0 & _GEN_1,
     p0_r_exp_0[0] & _GEN_0 & _GEN_1,
     p0__prod_plus_ma32_shl_11_[22] & _GEN_0 & _GEN_1,
     p0__prod_plus_ma32_shl_11_[21] & _GEN_0 & _GEN_1,
     p0__prod_plus_ma32_shl_11_[20] & _GEN_0 & _GEN_1,
     p0__prod_plus_ma32_shl_11_[19] & _GEN_0 & _GEN_1,
     p0__prod_plus_ma32_shl_11_[18] & _GEN_0 & _GEN_1,
     p0__prod_plus_ma32_shl_11_[17] & _GEN_0 & _GEN_1,
     p0__prod_plus_ma32_shl_11_[16] & _GEN_0 & _GEN_1,
     p0__prod_plus_ma32_shl_11_[15] & _GEN_0 & _GEN_1,
     p0__prod_plus_ma32_shl_11_[14] & _GEN_0 & _GEN_1,
     p0__prod_plus_ma32_shl_11_[13] & _GEN_0 & _GEN_1,
     p0__prod_plus_ma32_shl_11_[12] & _GEN_0 & _GEN_1,
     p0__prod_plus_ma32_shl_11_[11] & _GEN_0 & _GEN_1,
     p0__prod_plus_ma32_shl_11_[10] & _GEN_0 & _GEN_1,
     p0__prod_plus_ma32_shl_11_[9] & _GEN_0 & _GEN_1,
     p0__prod_plus_ma32_shl_11_[8] & _GEN_0 & _GEN_1,
     p0__prod_plus_ma32_shl_11_[7] & _GEN_0 & _GEN_1,
     p0__prod_plus_ma32_shl_11_[6] & _GEN_0 & _GEN_1,
     p0__prod_plus_ma32_shl_11_[5] & _GEN_0 & _GEN_1,
     p0__prod_plus_ma32_shl_11_[4] & _GEN_0 & _GEN_1,
     p0__prod_plus_ma32_shl_11_[3] & _GEN_0 & _GEN_1,
     p0__prod_plus_ma32_shl_11_[2] & _GEN_0 & _GEN_1,
     p0__prod_plus_ma32_shl_11_[1] & _GEN_0 & _GEN_1,
     p0__prod_plus_ma32_shl_11_[0] & _GEN_0 & _GEN_1};	// dequant.k:19:9, :84:{9,13,19,33}, :86:{13,29,30,49}, :108:{13,17}, :111:13, :113:{17,26}, :118:{17,26}, :121:{13,17,23,37}, :123:{26,41,43}
  reg   [31:0] p0_result;	// dequant.k:19:9
  reg          p0_stage21_enable = 1'h0;	// dequant.k:19:9
  wire  [31:0] _scaled_plus_cast_lt_int32_gt_a_shl_1_ =
    32'({{8{p0_accum[23]}}, p0_accum} + {{7{p0_accum[23]}}, p0_accum, 1'h0});	// dequant.k:19:9, :22:{9,13,53}, :23:{44,53,54}, :24:54, :25:54, :26:54
  wire         _GEN_2 = p0_accum[23] | p0_sub_scale[0];	// dequant.k:19:{9,26,51}, :22:53, :23:{9,13,54}, :24:54, :25:54, :26:54
  wire         _GEN_3 = p0_accum[23] & ~(p0_sub_scale[0]);	// dequant.k:19:{9,26,51}, :22:53, :23:{9,13,54}, :24:54, :25:54, :26:54
  wire  [31:0] _scaled_plus_cast_lt_int32_gt_a_shl_2_ =
    32'(p0_scaled + {p0_cast_lt_int32_gt_a_[29:0], 2'h0});	// dequant.k:19:9, :24:{44,53}
  wire  [31:0] _scaled_plus_cast_lt_int32_gt_a_shl_3_ =
    32'(p0_scaled_0 + {p0_cast_lt_int32_gt_a__0[28:0], 3'h0});	// dequant.k:19:9, :25:{44,53}
  wire  [31:0] _scaled_plus_cast_lt_int32_gt_a_shl_4_ =
    32'(p0_scaled_1 + {p0_cast_lt_int32_gt_a__1[27:0], 4'h0});	// dequant.k:19:9, :26:{44,53}
  wire  [31:0] CastSource = 32'(32'h0 - p0_scaled_2);	// dequant.k:19:9, :34:32
  wire         tmp =
    p0_mag_0[31]
      ? p0_mag_0[15] | p0__tmp_and_4294901760_ne_0_
      : p0_mag_0[15] & ~p0__tmp_and_4294901760_ne_0_;	// dequant.k:19:9, :47:{13,44,50}
  wire         tmp_0 =
    p0_mag_0[30]
      ? p0_mag_0[14] | p0__tmp_and_4294901760_ne_0_
      : p0_mag_0[14] & ~p0__tmp_and_4294901760_ne_0_;	// dequant.k:19:9, :47:{13,44,50}
  wire         tmp_1 =
    p0_mag_0[29]
      ? p0_mag_0[13] | p0__tmp_and_4294901760_ne_0_
      : p0_mag_0[13] & ~p0__tmp_and_4294901760_ne_0_;	// dequant.k:19:9, :47:{13,44,50}
  wire         tmp_2 =
    p0_mag_0[28]
      ? p0_mag_0[12] | p0__tmp_and_4294901760_ne_0_
      : p0_mag_0[12] & ~p0__tmp_and_4294901760_ne_0_;	// dequant.k:19:9, :47:{13,44,50}
  wire         tmp_3 =
    p0_mag_0[27]
      ? p0_mag_0[11] | p0__tmp_and_4294901760_ne_0_
      : p0_mag_0[11] & ~p0__tmp_and_4294901760_ne_0_;	// dequant.k:19:9, :47:{13,44,50}
  wire         tmp_4 =
    p0_mag_0[26]
      ? p0_mag_0[10] | p0__tmp_and_4294901760_ne_0_
      : p0_mag_0[10] & ~p0__tmp_and_4294901760_ne_0_;	// dequant.k:19:9, :47:{13,44,50}
  wire         tmp_5 =
    p0_mag_0[25]
      ? p0_mag_0[9] | p0__tmp_and_4294901760_ne_0_
      : p0_mag_0[9] & ~p0__tmp_and_4294901760_ne_0_;	// dequant.k:19:9, :47:{13,44,50}
  wire         tmp_6 =
    p0_mag_0[24]
      ? p0_mag_0[8] | p0__tmp_and_4294901760_ne_0_
      : p0_mag_0[8] & ~p0__tmp_and_4294901760_ne_0_;	// dequant.k:19:9, :47:{13,44,50}
  wire         _tmp_and_65280_ne_0_ =
    p0__tmp_and_65280_ne_0__xor_reduce[3] | p0__tmp_and_65280_ne_0__xor_reduce[2];	// dequant.k:19:9, :48:17
  wire         _tmp_and_240_ne_0_ = p0_tmp_0[7] | p0_tmp_0[6] | p0_tmp_0[5] | p0_tmp_0[4];	// dequant.k:19:9, :49:17
  wire         pos = p0_tmp_1[3] | p0_tmp_1[2];	// dequant.k:19:9, :47:13, :48:{13,67}, :49:{13,67}, :50:{13,17,44,50,67}, :51:{13,17,50}
  wire         pos_0 = p0_tmp_1[1] & ~(p0_tmp_1[2]) | p0_tmp_1[3];	// dequant.k:19:9, :47:13, :48:{13,67}, :49:{13,67}, :50:{13,17,44,50,67}, :51:{13,17,50}
  wire         _GEN_4 = p0__23_minus_pos_[4] | p0__23_minus_pos_[3];	// dequant.k:19:9, :65:{17,21,56}, :66:{17,21,56}
  wire         _GEN_5 = p0__23_minus_pos_[4] ^ ~(p0__23_minus_pos_[3]);	// dequant.k:19:9, :65:{17,21,56}, :66:{17,21,56}
  wire         _GEN_6 = p0__23_minus_pos_[4] & p0__23_minus_pos_[3];	// dequant.k:19:9, :65:{17,21,56}, :66:{17,21,56}
  wire         _GEN_7 = ~(p0__23_minus_pos_[4]) | ~(p0__23_minus_pos_[3]);	// dequant.k:19:9, :65:{17,21,56}, :66:{17,21,56}
  wire         _GEN_8 = p0__23_minus_pos_[4] ^ p0__23_minus_pos_[3];	// dequant.k:19:9, :65:{17,21,56}, :66:{17,21,56}
  wire         _GEN_9 = ~(p0__23_minus_pos_[4]) & p0__23_minus_pos_[3];	// dequant.k:19:9, :65:{17,21,56}, :66:{17,21,56}
  wire         _GEN_10 = ~(p0__23_minus_pos_[4]) & ~(p0__23_minus_pos_[3]);	// dequant.k:19:9, :65:{17,21,56}, :66:{17,21,56}
  wire         shifted =
    p0_mag_1[7]
      ? (p0_mag_1[23]
           ? (p0_mag_1[15]
                ? p0_mag_1[31] | _GEN_4
                : p0_mag_1[31] & ~(p0__23_minus_pos_[4]) | p0__23_minus_pos_[3])
           : p0_mag_1[15]
               ? p0_mag_1[31] & ~(p0__23_minus_pos_[3]) | p0__23_minus_pos_[4]
               : p0_mag_1[31] ? _GEN_5 : _GEN_6)
      : p0_mag_1[23]
          ? (p0_mag_1[15]
               ? (p0_mag_1[31] ? _GEN_7 : _GEN_8)
               : p0_mag_1[31] ? ~(p0__23_minus_pos_[4]) : _GEN_9)
          : p0_mag_1[15]
              ? (p0_mag_1[31] | p0__23_minus_pos_[4]) & ~(p0__23_minus_pos_[3])
              : p0_mag_1[31] & _GEN_10;	// dequant.k:19:9, :65:{17,21,56}, :66:{17,21,56}
  wire         shifted_0 =
    p0_mag_1[6]
      ? (p0_mag_1[22]
           ? (p0_mag_1[14]
                ? p0_mag_1[30] | _GEN_4
                : p0_mag_1[30] & ~(p0__23_minus_pos_[4]) | p0__23_minus_pos_[3])
           : p0_mag_1[14]
               ? p0_mag_1[30] & ~(p0__23_minus_pos_[3]) | p0__23_minus_pos_[4]
               : p0_mag_1[30] ? _GEN_5 : _GEN_6)
      : p0_mag_1[22]
          ? (p0_mag_1[14]
               ? (p0_mag_1[30] ? _GEN_7 : _GEN_8)
               : p0_mag_1[30] ? ~(p0__23_minus_pos_[4]) : _GEN_9)
          : p0_mag_1[14]
              ? (p0_mag_1[30] | p0__23_minus_pos_[4]) & ~(p0__23_minus_pos_[3])
              : p0_mag_1[30] & _GEN_10;	// dequant.k:19:9, :65:{17,21,56}, :66:{17,21,56}
  wire         shifted_1 =
    p0_mag_1[5]
      ? (p0_mag_1[21]
           ? (p0_mag_1[13]
                ? p0_mag_1[29] | _GEN_4
                : p0_mag_1[29] & ~(p0__23_minus_pos_[4]) | p0__23_minus_pos_[3])
           : p0_mag_1[13]
               ? p0_mag_1[29] & ~(p0__23_minus_pos_[3]) | p0__23_minus_pos_[4]
               : p0_mag_1[29] ? _GEN_5 : _GEN_6)
      : p0_mag_1[21]
          ? (p0_mag_1[13]
               ? (p0_mag_1[29] ? _GEN_7 : _GEN_8)
               : p0_mag_1[29] ? ~(p0__23_minus_pos_[4]) : _GEN_9)
          : p0_mag_1[13]
              ? (p0_mag_1[29] | p0__23_minus_pos_[4]) & ~(p0__23_minus_pos_[3])
              : p0_mag_1[29] & _GEN_10;	// dequant.k:19:9, :65:{17,21,56}, :66:{17,21,56}
  wire         shifted_2 =
    p0_mag_1[4]
      ? (p0_mag_1[20]
           ? (p0_mag_1[12]
                ? p0_mag_1[28] | _GEN_4
                : p0_mag_1[28] & ~(p0__23_minus_pos_[4]) | p0__23_minus_pos_[3])
           : p0_mag_1[12]
               ? p0_mag_1[28] & ~(p0__23_minus_pos_[3]) | p0__23_minus_pos_[4]
               : p0_mag_1[28] ? _GEN_5 : _GEN_6)
      : p0_mag_1[20]
          ? (p0_mag_1[12]
               ? (p0_mag_1[28] ? _GEN_7 : _GEN_8)
               : p0_mag_1[28] ? ~(p0__23_minus_pos_[4]) : _GEN_9)
          : p0_mag_1[12]
              ? (p0_mag_1[28] | p0__23_minus_pos_[4]) & ~(p0__23_minus_pos_[3])
              : p0_mag_1[28] & _GEN_10;	// dequant.k:19:9, :65:{17,21,56}, :66:{17,21,56}
  wire         shifted_3 =
    p0_mag_1[3]
      ? (p0_mag_1[19]
           ? (p0_mag_1[11]
                ? p0_mag_1[27] | _GEN_4
                : p0_mag_1[27] & ~(p0__23_minus_pos_[4]) | p0__23_minus_pos_[3])
           : p0_mag_1[11]
               ? p0_mag_1[27] & ~(p0__23_minus_pos_[3]) | p0__23_minus_pos_[4]
               : p0_mag_1[27] ? _GEN_5 : _GEN_6)
      : p0_mag_1[19]
          ? (p0_mag_1[11]
               ? (p0_mag_1[27] ? _GEN_7 : _GEN_8)
               : p0_mag_1[27] ? ~(p0__23_minus_pos_[4]) : _GEN_9)
          : p0_mag_1[11]
              ? (p0_mag_1[27] | p0__23_minus_pos_[4]) & ~(p0__23_minus_pos_[3])
              : p0_mag_1[27] & _GEN_10;	// dequant.k:19:9, :65:{17,21,56}, :66:{17,21,56}
  wire         shifted_4 =
    p0_mag_1[2]
      ? (p0_mag_1[18]
           ? (p0_mag_1[10]
                ? p0_mag_1[26] | _GEN_4
                : p0_mag_1[26] & ~(p0__23_minus_pos_[4]) | p0__23_minus_pos_[3])
           : p0_mag_1[10]
               ? p0_mag_1[26] & ~(p0__23_minus_pos_[3]) | p0__23_minus_pos_[4]
               : p0_mag_1[26] ? _GEN_5 : _GEN_6)
      : p0_mag_1[18]
          ? (p0_mag_1[10]
               ? (p0_mag_1[26] ? _GEN_7 : _GEN_8)
               : p0_mag_1[26] ? ~(p0__23_minus_pos_[4]) : _GEN_9)
          : p0_mag_1[10]
              ? (p0_mag_1[26] | p0__23_minus_pos_[4]) & ~(p0__23_minus_pos_[3])
              : p0_mag_1[26] & _GEN_10;	// dequant.k:19:9, :65:{17,21,56}, :66:{17,21,56}
  wire         shifted_5 =
    p0_mag_1[1]
      ? (p0_mag_1[17]
           ? (p0_mag_1[9]
                ? p0_mag_1[25] | _GEN_4
                : p0_mag_1[25] & ~(p0__23_minus_pos_[4]) | p0__23_minus_pos_[3])
           : p0_mag_1[9]
               ? p0_mag_1[25] & ~(p0__23_minus_pos_[3]) | p0__23_minus_pos_[4]
               : p0_mag_1[25] ? _GEN_5 : _GEN_6)
      : p0_mag_1[17]
          ? (p0_mag_1[9]
               ? (p0_mag_1[25] ? _GEN_7 : _GEN_8)
               : p0_mag_1[25] ? ~(p0__23_minus_pos_[4]) : _GEN_9)
          : p0_mag_1[9]
              ? (p0_mag_1[25] | p0__23_minus_pos_[4]) & ~(p0__23_minus_pos_[3])
              : p0_mag_1[25] & _GEN_10;	// dequant.k:19:9, :65:{17,21,56}, :66:{17,21,56}
  wire         shifted_6 =
    p0_mag_1[0]
      ? (p0_mag_1[16]
           ? (p0_mag_1[8]
                ? p0_mag_1[24] | _GEN_4
                : p0_mag_1[24] & ~(p0__23_minus_pos_[4]) | p0__23_minus_pos_[3])
           : p0_mag_1[8]
               ? p0_mag_1[24] & ~(p0__23_minus_pos_[3]) | p0__23_minus_pos_[4]
               : p0_mag_1[24] ? _GEN_5 : _GEN_6)
      : p0_mag_1[16]
          ? (p0_mag_1[8]
               ? (p0_mag_1[24] ? _GEN_7 : _GEN_8)
               : p0_mag_1[24] ? ~(p0__23_minus_pos_[4]) : _GEN_9)
          : p0_mag_1[8]
              ? (p0_mag_1[24] | p0__23_minus_pos_[4]) & ~(p0__23_minus_pos_[3])
              : p0_mag_1[24] & _GEN_10;	// dequant.k:19:9, :65:{17,21,56}, :66:{17,21,56}
  wire         shifted_7 =
    p0_mag_1[15]
      ? (p0_mag_1[7]
           ? (p0_mag_1[23] ? _GEN_7 : _GEN_8)
           : p0_mag_1[23] ? ~(p0__23_minus_pos_[4]) : _GEN_9)
      : p0_mag_1[7]
          ? (p0_mag_1[23] | p0__23_minus_pos_[4]) & ~(p0__23_minus_pos_[3])
          : p0_mag_1[23] & _GEN_10;	// dequant.k:19:9, :65:{17,21,56}, :66:{17,21,56}
  wire         shifted_8 =
    p0_mag_1[14]
      ? (p0_mag_1[6]
           ? (p0_mag_1[22] ? _GEN_7 : _GEN_8)
           : p0_mag_1[22] ? ~(p0__23_minus_pos_[4]) : _GEN_9)
      : p0_mag_1[6]
          ? (p0_mag_1[22] | p0__23_minus_pos_[4]) & ~(p0__23_minus_pos_[3])
          : p0_mag_1[22] & _GEN_10;	// dequant.k:19:9, :65:{17,21,56}, :66:{17,21,56}
  wire         shifted_9 =
    p0_mag_1[13]
      ? (p0_mag_1[5]
           ? (p0_mag_1[21] ? _GEN_7 : _GEN_8)
           : p0_mag_1[21] ? ~(p0__23_minus_pos_[4]) : _GEN_9)
      : p0_mag_1[5]
          ? (p0_mag_1[21] | p0__23_minus_pos_[4]) & ~(p0__23_minus_pos_[3])
          : p0_mag_1[21] & _GEN_10;	// dequant.k:19:9, :65:{17,21,56}, :66:{17,21,56}
  wire         shifted_10 =
    p0_mag_1[12]
      ? (p0_mag_1[4]
           ? (p0_mag_1[20] ? _GEN_7 : _GEN_8)
           : p0_mag_1[20] ? ~(p0__23_minus_pos_[4]) : _GEN_9)
      : p0_mag_1[4]
          ? (p0_mag_1[20] | p0__23_minus_pos_[4]) & ~(p0__23_minus_pos_[3])
          : p0_mag_1[20] & _GEN_10;	// dequant.k:19:9, :65:{17,21,56}, :66:{17,21,56}
  wire         shifted_11 =
    p0_mag_1[11]
      ? (p0_mag_1[3]
           ? (p0_mag_1[19] ? _GEN_7 : _GEN_8)
           : p0_mag_1[19] ? ~(p0__23_minus_pos_[4]) : _GEN_9)
      : p0_mag_1[3]
          ? (p0_mag_1[19] | p0__23_minus_pos_[4]) & ~(p0__23_minus_pos_[3])
          : p0_mag_1[19] & _GEN_10;	// dequant.k:19:9, :65:{17,21,56}, :66:{17,21,56}
  wire         shifted_12 =
    p0_mag_1[10]
      ? (p0_mag_1[2]
           ? (p0_mag_1[18] ? _GEN_7 : _GEN_8)
           : p0_mag_1[18] ? ~(p0__23_minus_pos_[4]) : _GEN_9)
      : p0_mag_1[2]
          ? (p0_mag_1[18] | p0__23_minus_pos_[4]) & ~(p0__23_minus_pos_[3])
          : p0_mag_1[18] & _GEN_10;	// dequant.k:19:9, :65:{17,21,56}, :66:{17,21,56}
  wire         shifted_13 =
    p0_mag_1[9]
      ? (p0_mag_1[1]
           ? (p0_mag_1[17] ? _GEN_7 : _GEN_8)
           : p0_mag_1[17] ? ~(p0__23_minus_pos_[4]) : _GEN_9)
      : p0_mag_1[1]
          ? (p0_mag_1[17] | p0__23_minus_pos_[4]) & ~(p0__23_minus_pos_[3])
          : p0_mag_1[17] & _GEN_10;	// dequant.k:19:9, :65:{17,21,56}, :66:{17,21,56}
  wire         shifted_14 =
    p0_mag_1[8]
      ? (p0_mag_1[0]
           ? (p0_mag_1[16] ? _GEN_7 : _GEN_8)
           : p0_mag_1[16] ? ~(p0__23_minus_pos_[4]) : _GEN_9)
      : p0_mag_1[0]
          ? (p0_mag_1[16] | p0__23_minus_pos_[4]) & ~(p0__23_minus_pos_[3])
          : p0_mag_1[16] & _GEN_10;	// dequant.k:19:9, :65:{17,21,56}, :66:{17,21,56}
  wire         shifted_15 =
    p0_mag_1[7]
      ? (p0_mag_1[15] ? ~(p0__23_minus_pos_[4]) : _GEN_9)
      : p0_mag_1[15] & _GEN_10;	// dequant.k:19:9, :65:{17,21,56}, :66:{17,21,56}
  wire         shifted_16 =
    p0_mag_1[6]
      ? (p0_mag_1[14] ? ~(p0__23_minus_pos_[4]) : _GEN_9)
      : p0_mag_1[14] & _GEN_10;	// dequant.k:19:9, :65:{17,21,56}, :66:{17,21,56}
  wire         shifted_17 =
    p0_mag_1[5]
      ? (p0_mag_1[13] ? ~(p0__23_minus_pos_[4]) : _GEN_9)
      : p0_mag_1[13] & _GEN_10;	// dequant.k:19:9, :65:{17,21,56}, :66:{17,21,56}
  wire         shifted_18 =
    p0_mag_1[4]
      ? (p0_mag_1[12] ? ~(p0__23_minus_pos_[4]) : _GEN_9)
      : p0_mag_1[12] & _GEN_10;	// dequant.k:19:9, :65:{17,21,56}, :66:{17,21,56}
  wire         shifted_19 =
    p0_mag_1[3]
      ? (p0_mag_1[11] ? ~(p0__23_minus_pos_[4]) : _GEN_9)
      : p0_mag_1[11] & _GEN_10;	// dequant.k:19:9, :65:{17,21,56}, :66:{17,21,56}
  wire         shifted_20 =
    p0_mag_1[2]
      ? (p0_mag_1[10] ? ~(p0__23_minus_pos_[4]) : _GEN_9)
      : p0_mag_1[10] & _GEN_10;	// dequant.k:19:9, :65:{17,21,56}, :66:{17,21,56}
  wire         shifted_21 =
    p0_mag_1[1]
      ? (p0_mag_1[9] ? ~(p0__23_minus_pos_[4]) : _GEN_9)
      : p0_mag_1[9] & _GEN_10;	// dequant.k:19:9, :65:{17,21,56}, :66:{17,21,56}
  wire         shifted_22 =
    p0_mag_1[0]
      ? (p0_mag_1[8] ? ~(p0__23_minus_pos_[4]) : _GEN_9)
      : p0_mag_1[8] & _GEN_10;	// dequant.k:19:9, :65:{17,21,56}, :66:{17,21,56}
  wire         shifted_23 = p0_mag_1[7] & _GEN_10;	// dequant.k:19:9, :65:{17,21,56}, :66:{17,21,56}
  wire         shifted_24 = p0_mag_1[6] & _GEN_10;	// dequant.k:19:9, :65:{17,21,56}, :66:{17,21,56}
  wire         shifted_25 = p0_mag_1[5] & _GEN_10;	// dequant.k:19:9, :65:{17,21,56}, :66:{17,21,56}
  wire         shifted_26 = p0_mag_1[4] & _GEN_10;	// dequant.k:19:9, :65:{17,21,56}, :66:{17,21,56}
  wire         shifted_27 = p0_mag_1[3] & _GEN_10;	// dequant.k:19:9, :65:{17,21,56}, :66:{17,21,56}
  wire         shifted_28 = p0_mag_1[2] & _GEN_10;	// dequant.k:19:9, :65:{17,21,56}, :66:{17,21,56}
  wire         shifted_29 = p0_mag_1[1] & _GEN_10;	// dequant.k:19:9, :65:{17,21,56}, :66:{17,21,56}
  wire         shifted_30 = p0_mag_1[0] & _GEN_10;	// dequant.k:19:9, :65:{17,21,56}, :66:{17,21,56}
  wire         _GEN_11 = p0__23_minus_pos_[2] | p0__23_minus_pos_[1];	// dequant.k:19:9, :67:{17,21,56}, :68:{17,21,56}
  wire         _GEN_12 = p0__23_minus_pos_[2] ^ ~(p0__23_minus_pos_[1]);	// dequant.k:19:9, :67:{17,21,56}, :68:{17,21,56}
  wire         _GEN_13 = p0__23_minus_pos_[2] & p0__23_minus_pos_[1];	// dequant.k:19:9, :67:{17,21,56}, :68:{17,21,56}
  wire         _GEN_14 = ~(p0__23_minus_pos_[2]) | ~(p0__23_minus_pos_[1]);	// dequant.k:19:9, :67:{17,21,56}, :68:{17,21,56}
  wire         _GEN_15 = p0__23_minus_pos_[2] ^ p0__23_minus_pos_[1];	// dequant.k:19:9, :67:{17,21,56}, :68:{17,21,56}
  wire         _GEN_16 = ~(p0__23_minus_pos_[2]) & p0__23_minus_pos_[1];	// dequant.k:19:9, :67:{17,21,56}, :68:{17,21,56}
  wire         _GEN_17 = ~(p0__23_minus_pos_[2]) & ~(p0__23_minus_pos_[1]);	// dequant.k:19:9, :67:{17,21,56}, :68:{17,21,56}
  wire         _GEN_18 = p0_mag_2[22] | p0__pos_minus_23__0[32];	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         _GEN_19 = p0_mag_2[22] & ~(p0__pos_minus_23__0[32]);	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         shifted_31 =
    p0_shifted[21]
      ? (p0_shifted[22] | p0__23_minus_pos__0 ? _GEN_18 : _GEN_19)
      : ~(p0_shifted[22]) | p0__23_minus_pos__0 ? _GEN_19 : _GEN_18;	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         _GEN_20 = p0_mag_2[21] | p0__pos_minus_23__0[32];	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         _GEN_21 = p0_mag_2[21] & ~(p0__pos_minus_23__0[32]);	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         shifted_32 =
    p0_shifted[20]
      ? (p0_shifted[21] | p0__23_minus_pos__0 ? _GEN_20 : _GEN_21)
      : ~(p0_shifted[21]) | p0__23_minus_pos__0 ? _GEN_21 : _GEN_20;	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         _GEN_22 = p0_mag_2[20] | p0__pos_minus_23__0[32];	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         _GEN_23 = p0_mag_2[20] & ~(p0__pos_minus_23__0[32]);	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         shifted_33 =
    p0_shifted[19]
      ? (p0_shifted[20] | p0__23_minus_pos__0 ? _GEN_22 : _GEN_23)
      : ~(p0_shifted[20]) | p0__23_minus_pos__0 ? _GEN_23 : _GEN_22;	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         _GEN_24 = p0_mag_2[19] | p0__pos_minus_23__0[32];	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         _GEN_25 = p0_mag_2[19] & ~(p0__pos_minus_23__0[32]);	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         shifted_34 =
    p0_shifted[18]
      ? (p0_shifted[19] | p0__23_minus_pos__0 ? _GEN_24 : _GEN_25)
      : ~(p0_shifted[19]) | p0__23_minus_pos__0 ? _GEN_25 : _GEN_24;	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         _GEN_26 = p0_mag_2[18] | p0__pos_minus_23__0[32];	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         _GEN_27 = p0_mag_2[18] & ~(p0__pos_minus_23__0[32]);	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         shifted_35 =
    p0_shifted[17]
      ? (p0_shifted[18] | p0__23_minus_pos__0 ? _GEN_26 : _GEN_27)
      : ~(p0_shifted[18]) | p0__23_minus_pos__0 ? _GEN_27 : _GEN_26;	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         _GEN_28 = p0_mag_2[17] | p0__pos_minus_23__0[32];	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         _GEN_29 = p0_mag_2[17] & ~(p0__pos_minus_23__0[32]);	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         shifted_36 =
    p0_shifted[16]
      ? (p0_shifted[17] | p0__23_minus_pos__0 ? _GEN_28 : _GEN_29)
      : ~(p0_shifted[17]) | p0__23_minus_pos__0 ? _GEN_29 : _GEN_28;	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         _GEN_30 = p0_mag_2[16] | p0__pos_minus_23__0[32];	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         _GEN_31 = p0_mag_2[16] & ~(p0__pos_minus_23__0[32]);	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         shifted_37 =
    p0_shifted[15]
      ? (p0_shifted[16] | p0__23_minus_pos__0 ? _GEN_30 : _GEN_31)
      : ~(p0_shifted[16]) | p0__23_minus_pos__0 ? _GEN_31 : _GEN_30;	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         _GEN_32 = p0_mag_2[15] | p0__pos_minus_23__0[32];	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         _GEN_33 = p0_mag_2[15] & ~(p0__pos_minus_23__0[32]);	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         shifted_38 =
    p0_shifted[14]
      ? (p0_shifted[15] | p0__23_minus_pos__0 ? _GEN_32 : _GEN_33)
      : ~(p0_shifted[15]) | p0__23_minus_pos__0 ? _GEN_33 : _GEN_32;	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         _GEN_34 = p0_mag_2[14] | p0__pos_minus_23__0[32];	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         _GEN_35 = p0_mag_2[14] & ~(p0__pos_minus_23__0[32]);	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         shifted_39 =
    p0_shifted[13]
      ? (p0_shifted[14] | p0__23_minus_pos__0 ? _GEN_34 : _GEN_35)
      : ~(p0_shifted[14]) | p0__23_minus_pos__0 ? _GEN_35 : _GEN_34;	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         _GEN_36 = p0_mag_2[13] | p0__pos_minus_23__0[32];	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         _GEN_37 = p0_mag_2[13] & ~(p0__pos_minus_23__0[32]);	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         shifted_40 =
    p0_shifted[12]
      ? (p0_shifted[13] | p0__23_minus_pos__0 ? _GEN_36 : _GEN_37)
      : ~(p0_shifted[13]) | p0__23_minus_pos__0 ? _GEN_37 : _GEN_36;	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         _GEN_38 = p0_mag_2[12] | p0__pos_minus_23__0[32];	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         _GEN_39 = p0_mag_2[12] & ~(p0__pos_minus_23__0[32]);	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         shifted_41 =
    p0_shifted[11]
      ? (p0_shifted[12] | p0__23_minus_pos__0 ? _GEN_38 : _GEN_39)
      : ~(p0_shifted[12]) | p0__23_minus_pos__0 ? _GEN_39 : _GEN_38;	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         _GEN_40 = p0_mag_2[11] | p0__pos_minus_23__0[32];	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         _GEN_41 = p0_mag_2[11] & ~(p0__pos_minus_23__0[32]);	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         shifted_42 =
    p0_shifted[10]
      ? (p0_shifted[11] | p0__23_minus_pos__0 ? _GEN_40 : _GEN_41)
      : ~(p0_shifted[11]) | p0__23_minus_pos__0 ? _GEN_41 : _GEN_40;	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         _GEN_42 = p0_mag_2[10] | p0__pos_minus_23__0[32];	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         _GEN_43 = p0_mag_2[10] & ~(p0__pos_minus_23__0[32]);	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         shifted_43 =
    p0_shifted[9]
      ? (p0_shifted[10] | p0__23_minus_pos__0 ? _GEN_42 : _GEN_43)
      : ~(p0_shifted[10]) | p0__23_minus_pos__0 ? _GEN_43 : _GEN_42;	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         _GEN_44 = p0_mag_2[9] | p0__pos_minus_23__0[32];	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         _GEN_45 = p0_mag_2[9] & ~(p0__pos_minus_23__0[32]);	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         shifted_44 =
    p0_shifted[8]
      ? (p0_shifted[9] | p0__23_minus_pos__0 ? _GEN_44 : _GEN_45)
      : ~(p0_shifted[9]) | p0__23_minus_pos__0 ? _GEN_45 : _GEN_44;	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         _GEN_46 = p0_mag_2[8] | p0__pos_minus_23__0[32];	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         _GEN_47 = p0_mag_2[8] & ~(p0__pos_minus_23__0[32]);	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         shifted_45 =
    p0_shifted[7]
      ? (p0_shifted[8] | p0__23_minus_pos__0 ? _GEN_46 : _GEN_47)
      : ~(p0_shifted[8]) | p0__23_minus_pos__0 ? _GEN_47 : _GEN_46;	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         _GEN_48 = p0_mag_2[7] | p0__pos_minus_23__0[32];	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         _GEN_49 = p0_mag_2[7] & ~(p0__pos_minus_23__0[32]);	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         shifted_46 =
    p0_shifted[6]
      ? (p0_shifted[7] | p0__23_minus_pos__0 ? _GEN_48 : _GEN_49)
      : ~(p0_shifted[7]) | p0__23_minus_pos__0 ? _GEN_49 : _GEN_48;	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         _GEN_50 = p0_mag_2[6] | p0__pos_minus_23__0[32];	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         _GEN_51 = p0_mag_2[6] & ~(p0__pos_minus_23__0[32]);	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         shifted_47 =
    p0_shifted[5]
      ? (p0_shifted[6] | p0__23_minus_pos__0 ? _GEN_50 : _GEN_51)
      : ~(p0_shifted[6]) | p0__23_minus_pos__0 ? _GEN_51 : _GEN_50;	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         _GEN_52 = p0_mag_2[5] | p0__pos_minus_23__0[32];	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         _GEN_53 = p0_mag_2[5] & ~(p0__pos_minus_23__0[32]);	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         shifted_48 =
    p0_shifted[4]
      ? (p0_shifted[5] | p0__23_minus_pos__0 ? _GEN_52 : _GEN_53)
      : ~(p0_shifted[5]) | p0__23_minus_pos__0 ? _GEN_53 : _GEN_52;	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         _GEN_54 = p0_mag_2[4] | p0__pos_minus_23__0[32];	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         _GEN_55 = p0_mag_2[4] & ~(p0__pos_minus_23__0[32]);	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         shifted_49 =
    p0_shifted[3]
      ? (p0_shifted[4] | p0__23_minus_pos__0 ? _GEN_54 : _GEN_55)
      : ~(p0_shifted[4]) | p0__23_minus_pos__0 ? _GEN_55 : _GEN_54;	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         _GEN_56 = p0_mag_2[3] | p0__pos_minus_23__0[32];	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         _GEN_57 = p0_mag_2[3] & ~(p0__pos_minus_23__0[32]);	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         shifted_50 =
    p0_shifted[2]
      ? (p0_shifted[3] | p0__23_minus_pos__0 ? _GEN_56 : _GEN_57)
      : ~(p0_shifted[3]) | p0__23_minus_pos__0 ? _GEN_57 : _GEN_56;	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         _GEN_58 = p0_mag_2[2] | p0__pos_minus_23__0[32];	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         _GEN_59 = p0_mag_2[2] & ~(p0__pos_minus_23__0[32]);	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         shifted_51 =
    p0_shifted[1]
      ? (p0_shifted[2] | p0__23_minus_pos__0 ? _GEN_58 : _GEN_59)
      : ~(p0_shifted[2]) | p0__23_minus_pos__0 ? _GEN_59 : _GEN_58;	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         _GEN_60 = p0_mag_2[1] | p0__pos_minus_23__0[32];	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         _GEN_61 = p0_mag_2[1] & ~(p0__pos_minus_23__0[32]);	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         shifted_52 =
    p0_shifted[0]
      ? (p0_shifted[1] | p0__23_minus_pos__0 ? _GEN_60 : _GEN_61)
      : ~(p0_shifted[1]) | p0__23_minus_pos__0 ? _GEN_61 : _GEN_60;	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire         shifted_53 =
    ~(p0_shifted[0]) | p0__23_minus_pos__0
      ? p0_mag_2[0] & ~(p0__pos_minus_23__0[32])
      : p0_mag_2[0] | p0__pos_minus_23__0[32];	// dequant.k:19:9, :61:{18,22}, :69:{17,21,56}
  wire  [32:0] _pos_gt_23__diff = 33'(33'h17 - {1'h0, p0_pos_0});	// dequant.k:19:9, :57:17
  wire         _GEN_62 = ~(_pos_gt_23__diff[32]) & (|p0__mag_ne_0__xor_reduce_reduce);	// dequant.k:19:9, :31:9, :42:{9,13}, :57:{13,17}, :71:{13,27}, :73:{24,39,41}
  wire         prod = p0_fp_accum[22] & p0_super_scale_bf16_0[0];	// dequant.k:19:9, :77:29, :91:{42,43}, :96:27, :101:{13,17,44,51}
  wire         prod_0 = p0_fp_accum[21] & p0_super_scale_bf16_0[0];	// dequant.k:19:9, :77:29, :91:{42,43}, :96:27, :101:{13,17,44,51}
  wire         prod_1 = p0_fp_accum[20] & p0_super_scale_bf16_0[0];	// dequant.k:19:9, :77:29, :91:{42,43}, :96:27, :101:{13,17,44,51}
  wire         prod_2 = p0_fp_accum[19] & p0_super_scale_bf16_0[0];	// dequant.k:19:9, :77:29, :91:{42,43}, :96:27, :101:{13,17,44,51}
  wire         prod_3 = p0_fp_accum[18] & p0_super_scale_bf16_0[0];	// dequant.k:19:9, :77:29, :91:{42,43}, :96:27, :101:{13,17,44,51}
  wire         prod_4 = p0_fp_accum[17] & p0_super_scale_bf16_0[0];	// dequant.k:19:9, :77:29, :91:{42,43}, :96:27, :101:{13,17,44,51}
  wire         prod_5 = p0_fp_accum[16] & p0_super_scale_bf16_0[0];	// dequant.k:19:9, :77:29, :91:{42,43}, :96:27, :101:{13,17,44,51}
  wire         prod_6 = p0_fp_accum[15] & p0_super_scale_bf16_0[0];	// dequant.k:19:9, :77:29, :91:{42,43}, :96:27, :101:{13,17,44,51}
  wire         prod_7 = p0_fp_accum[14] & p0_super_scale_bf16_0[0];	// dequant.k:19:9, :77:29, :91:{42,43}, :96:27, :101:{13,17,44,51}
  wire         prod_8 = p0_fp_accum[13] & p0_super_scale_bf16_0[0];	// dequant.k:19:9, :77:29, :91:{42,43}, :96:27, :101:{13,17,44,51}
  wire         prod_9 = p0_fp_accum[12] & p0_super_scale_bf16_0[0];	// dequant.k:19:9, :77:29, :91:{42,43}, :96:27, :101:{13,17,44,51}
  wire         prod_10 = p0__prod_plus_ma32_shl_5_[17] & p0_CastSource[5];	// dequant.k:19:9, :102:{13,17}
  wire         prod_11 = p0__prod_plus_ma32_shl_5_[16] & p0_CastSource[5];	// dequant.k:19:9, :102:{13,17}
  wire         prod_12 =
    p0__prod_plus_ma32_shl_5_[15]
      ? p0_prod[15] | p0_CastSource[5]
      : p0_prod[15] & ~(p0_CastSource[5]);	// dequant.k:19:9, :102:{13,17}
  wire         prod_13 =
    p0__prod_plus_ma32_shl_5_[14]
      ? p0_prod[14] | p0_CastSource[5]
      : p0_prod[14] & ~(p0_CastSource[5]);	// dequant.k:19:9, :102:{13,17}
  wire         prod_14 =
    p0__prod_plus_ma32_shl_5_[13]
      ? p0_prod[13] | p0_CastSource[5]
      : p0_prod[13] & ~(p0_CastSource[5]);	// dequant.k:19:9, :102:{13,17}
  wire         prod_15 =
    p0__prod_plus_ma32_shl_5_[12]
      ? p0_prod[12] | p0_CastSource[5]
      : p0_prod[12] & ~(p0_CastSource[5]);	// dequant.k:19:9, :102:{13,17}
  wire         prod_16 =
    p0__prod_plus_ma32_shl_5_[11]
      ? p0_prod[11] | p0_CastSource[5]
      : p0_prod[11] & ~(p0_CastSource[5]);	// dequant.k:19:9, :102:{13,17}
  wire         prod_17 =
    p0__prod_plus_ma32_shl_5_[10]
      ? p0_prod[10] | p0_CastSource[5]
      : p0_prod[10] & ~(p0_CastSource[5]);	// dequant.k:19:9, :102:{13,17}
  wire         prod_18 =
    p0__prod_plus_ma32_shl_5_[9]
      ? p0_prod[9] | p0_CastSource[5]
      : p0_prod[9] & ~(p0_CastSource[5]);	// dequant.k:19:9, :102:{13,17}
  wire         prod_19 =
    p0__prod_plus_ma32_shl_5_[8]
      ? p0_prod[8] | p0_CastSource[5]
      : p0_prod[8] & ~(p0_CastSource[5]);	// dequant.k:19:9, :102:{13,17}
  wire         prod_20 =
    p0__prod_plus_ma32_shl_5_[7]
      ? p0_prod[7] | p0_CastSource[5]
      : p0_prod[7] & ~(p0_CastSource[5]);	// dequant.k:19:9, :102:{13,17}
  wire         prod_21 =
    p0__prod_plus_ma32_shl_5_[6]
      ? p0_prod[6] | p0_CastSource[5]
      : p0_prod[6] & ~(p0_CastSource[5]);	// dequant.k:19:9, :102:{13,17}
  wire         prod_22 =
    p0__prod_plus_ma32_shl_5_[5]
      ? p0_prod[5] | p0_CastSource[5]
      : p0_prod[5] & ~(p0_CastSource[5]);	// dequant.k:19:9, :102:{13,17}
  wire         prod_23 =
    p0__prod_plus_ma32_shl_5_[4]
      ? p0_prod[4] | p0_CastSource[5]
      : p0_prod[4] & ~(p0_CastSource[5]);	// dequant.k:19:9, :102:{13,17}
  wire         prod_24 = p0__prod_plus_ma32_shl_5_[3] & p0_CastSource[5];	// dequant.k:19:9, :102:{13,17}
  wire         prod_25 = p0__prod_plus_ma32_shl_5_[2] & p0_CastSource[5];	// dequant.k:19:9, :102:{13,17}
  wire         prod_26 = p0__prod_plus_ma32_shl_5_[1] & p0_CastSource[5];	// dequant.k:19:9, :102:{13,17}
  wire         prod_27 = p0__prod_plus_ma32_shl_5_[0] & p0_CastSource[5];	// dequant.k:19:9, :102:{13,17}
  wire         prod_28 = p0__prod_plus_ma32_shl_6_[18] & p0_CastSource_0[6];	// dequant.k:19:9, :103:{13,17}
  wire         prod_29 =
    p0__prod_plus_ma32_shl_6_[17]
      ? p0_prod_0[17] | p0_CastSource_0[6]
      : p0_prod_0[17] & ~(p0_CastSource_0[6]);	// dequant.k:19:9, :103:{13,17}
  wire         prod_30 =
    p0__prod_plus_ma32_shl_6_[16]
      ? p0_prod_0[16] | p0_CastSource_0[6]
      : p0_prod_0[16] & ~(p0_CastSource_0[6]);	// dequant.k:19:9, :103:{13,17}
  wire         prod_31 =
    p0__prod_plus_ma32_shl_6_[15]
      ? p0_prod_0[15] | p0_CastSource_0[6]
      : p0_prod_0[15] & ~(p0_CastSource_0[6]);	// dequant.k:19:9, :103:{13,17}
  wire         prod_32 =
    p0__prod_plus_ma32_shl_6_[14]
      ? p0_prod_0[14] | p0_CastSource_0[6]
      : p0_prod_0[14] & ~(p0_CastSource_0[6]);	// dequant.k:19:9, :103:{13,17}
  wire         prod_33 =
    p0__prod_plus_ma32_shl_6_[13]
      ? p0_prod_0[13] | p0_CastSource_0[6]
      : p0_prod_0[13] & ~(p0_CastSource_0[6]);	// dequant.k:19:9, :103:{13,17}
  wire         prod_34 =
    p0__prod_plus_ma32_shl_6_[12]
      ? p0_prod_0[12] | p0_CastSource_0[6]
      : p0_prod_0[12] & ~(p0_CastSource_0[6]);	// dequant.k:19:9, :103:{13,17}
  wire         prod_35 =
    p0__prod_plus_ma32_shl_6_[11]
      ? p0_prod_0[11] | p0_CastSource_0[6]
      : p0_prod_0[11] & ~(p0_CastSource_0[6]);	// dequant.k:19:9, :103:{13,17}
  wire         prod_36 =
    p0__prod_plus_ma32_shl_6_[10]
      ? p0_prod_0[10] | p0_CastSource_0[6]
      : p0_prod_0[10] & ~(p0_CastSource_0[6]);	// dequant.k:19:9, :103:{13,17}
  wire         prod_37 =
    p0__prod_plus_ma32_shl_6_[9]
      ? p0_prod_0[9] | p0_CastSource_0[6]
      : p0_prod_0[9] & ~(p0_CastSource_0[6]);	// dequant.k:19:9, :103:{13,17}
  wire         prod_38 =
    p0__prod_plus_ma32_shl_6_[8]
      ? p0_prod_0[8] | p0_CastSource_0[6]
      : p0_prod_0[8] & ~(p0_CastSource_0[6]);	// dequant.k:19:9, :103:{13,17}
  wire         prod_39 =
    p0__prod_plus_ma32_shl_6_[7]
      ? p0_prod_0[7] | p0_CastSource_0[6]
      : p0_prod_0[7] & ~(p0_CastSource_0[6]);	// dequant.k:19:9, :103:{13,17}
  wire         prod_40 =
    p0__prod_plus_ma32_shl_6_[6]
      ? p0_prod_0[6] | p0_CastSource_0[6]
      : p0_prod_0[6] & ~(p0_CastSource_0[6]);	// dequant.k:19:9, :103:{13,17}
  wire         prod_41 =
    p0__prod_plus_ma32_shl_6_[5]
      ? p0_prod_0[5] | p0_CastSource_0[6]
      : p0_prod_0[5] & ~(p0_CastSource_0[6]);	// dequant.k:19:9, :103:{13,17}
  wire         prod_42 =
    p0__prod_plus_ma32_shl_6_[4]
      ? p0_prod_0[4] | p0_CastSource_0[6]
      : p0_prod_0[4] & ~(p0_CastSource_0[6]);	// dequant.k:19:9, :103:{13,17}
  wire         prod_43 =
    p0__prod_plus_ma32_shl_6_[3]
      ? p0_prod_0[3] | p0_CastSource_0[6]
      : p0_prod_0[3] & ~(p0_CastSource_0[6]);	// dequant.k:19:9, :103:{13,17}
  wire         prod_44 =
    p0__prod_plus_ma32_shl_6_[2]
      ? p0_prod_0[2] | p0_CastSource_0[6]
      : p0_prod_0[2] & ~(p0_CastSource_0[6]);	// dequant.k:19:9, :103:{13,17}
  wire         prod_45 =
    p0__prod_plus_ma32_shl_6_[1]
      ? p0_prod_0[1] | p0_CastSource_0[6]
      : p0_prod_0[1] & ~(p0_CastSource_0[6]);	// dequant.k:19:9, :103:{13,17}
  wire         prod_46 =
    p0__prod_plus_ma32_shl_6_[0]
      ? p0_prod_0[0] | p0_CastSource_0[6]
      : p0_prod_0[0] & ~(p0_CastSource_0[6]);	// dequant.k:19:9, :103:{13,17}
  wire         prod_47 = p0__prod_plus_ma32_shl_7_[19] & p0_CastSource_1[7];	// dequant.k:19:9, :104:{13,17}
  wire         prod_48 =
    p0__prod_plus_ma32_shl_7_[18]
      ? p0_prod_1[18] | p0_CastSource_1[7]
      : p0_prod_1[18] & ~(p0_CastSource_1[7]);	// dequant.k:19:9, :104:{13,17}
  wire         prod_49 =
    p0__prod_plus_ma32_shl_7_[17]
      ? p0_prod_1[17] | p0_CastSource_1[7]
      : p0_prod_1[17] & ~(p0_CastSource_1[7]);	// dequant.k:19:9, :104:{13,17}
  wire         prod_50 =
    p0__prod_plus_ma32_shl_7_[16]
      ? p0_prod_1[16] | p0_CastSource_1[7]
      : p0_prod_1[16] & ~(p0_CastSource_1[7]);	// dequant.k:19:9, :104:{13,17}
  wire         prod_51 =
    p0__prod_plus_ma32_shl_7_[15]
      ? p0_prod_1[15] | p0_CastSource_1[7]
      : p0_prod_1[15] & ~(p0_CastSource_1[7]);	// dequant.k:19:9, :104:{13,17}
  wire         prod_52 =
    p0__prod_plus_ma32_shl_7_[14]
      ? p0_prod_1[14] | p0_CastSource_1[7]
      : p0_prod_1[14] & ~(p0_CastSource_1[7]);	// dequant.k:19:9, :104:{13,17}
  wire         prod_53 =
    p0__prod_plus_ma32_shl_7_[13]
      ? p0_prod_1[13] | p0_CastSource_1[7]
      : p0_prod_1[13] & ~(p0_CastSource_1[7]);	// dequant.k:19:9, :104:{13,17}
  wire         prod_54 =
    p0__prod_plus_ma32_shl_7_[12]
      ? p0_prod_1[12] | p0_CastSource_1[7]
      : p0_prod_1[12] & ~(p0_CastSource_1[7]);	// dequant.k:19:9, :104:{13,17}
  wire         prod_55 =
    p0__prod_plus_ma32_shl_7_[11]
      ? p0_prod_1[11] | p0_CastSource_1[7]
      : p0_prod_1[11] & ~(p0_CastSource_1[7]);	// dequant.k:19:9, :104:{13,17}
  wire         prod_56 =
    p0__prod_plus_ma32_shl_7_[10]
      ? p0_prod_1[10] | p0_CastSource_1[7]
      : p0_prod_1[10] & ~(p0_CastSource_1[7]);	// dequant.k:19:9, :104:{13,17}
  wire         prod_57 =
    p0__prod_plus_ma32_shl_7_[9]
      ? p0_prod_1[9] | p0_CastSource_1[7]
      : p0_prod_1[9] & ~(p0_CastSource_1[7]);	// dequant.k:19:9, :104:{13,17}
  wire         prod_58 =
    p0__prod_plus_ma32_shl_7_[8]
      ? p0_prod_1[8] | p0_CastSource_1[7]
      : p0_prod_1[8] & ~(p0_CastSource_1[7]);	// dequant.k:19:9, :104:{13,17}
  wire         prod_59 =
    p0__prod_plus_ma32_shl_7_[7]
      ? p0_prod_1[7] | p0_CastSource_1[7]
      : p0_prod_1[7] & ~(p0_CastSource_1[7]);	// dequant.k:19:9, :104:{13,17}
  wire         prod_60 =
    p0__prod_plus_ma32_shl_7_[6]
      ? p0_prod_1[6] | p0_CastSource_1[7]
      : p0_prod_1[6] & ~(p0_CastSource_1[7]);	// dequant.k:19:9, :104:{13,17}
  wire         prod_61 =
    p0__prod_plus_ma32_shl_7_[5]
      ? p0_prod_1[5] | p0_CastSource_1[7]
      : p0_prod_1[5] & ~(p0_CastSource_1[7]);	// dequant.k:19:9, :104:{13,17}
  wire         prod_62 =
    p0__prod_plus_ma32_shl_7_[4]
      ? p0_prod_1[4] | p0_CastSource_1[7]
      : p0_prod_1[4] & ~(p0_CastSource_1[7]);	// dequant.k:19:9, :104:{13,17}
  wire         prod_63 =
    p0__prod_plus_ma32_shl_7_[3]
      ? p0_prod_1[3] | p0_CastSource_1[7]
      : p0_prod_1[3] & ~(p0_CastSource_1[7]);	// dequant.k:19:9, :104:{13,17}
  wire         prod_64 =
    p0__prod_plus_ma32_shl_7_[2]
      ? p0_prod_1[2] | p0_CastSource_1[7]
      : p0_prod_1[2] & ~(p0_CastSource_1[7]);	// dequant.k:19:9, :104:{13,17}
  wire         prod_65 =
    p0__prod_plus_ma32_shl_7_[1]
      ? p0_prod_1[1] | p0_CastSource_1[7]
      : p0_prod_1[1] & ~(p0_CastSource_1[7]);	// dequant.k:19:9, :104:{13,17}
  wire         prod_66 =
    p0__prod_plus_ma32_shl_7_[0]
      ? p0_prod_1[0] | p0_CastSource_1[7]
      : p0_prod_1[0] & ~(p0_CastSource_1[7]);	// dequant.k:19:9, :104:{13,17}
  wire         prod_67 = p0__prod_plus_ma32_shl_8_[20] & p0_CastSource_2[8];	// dequant.k:19:9, :105:{13,17}
  wire         prod_68 =
    p0__prod_plus_ma32_shl_8_[19]
      ? p0_prod_2[19] | p0_CastSource_2[8]
      : p0_prod_2[19] & ~(p0_CastSource_2[8]);	// dequant.k:19:9, :105:{13,17}
  wire         prod_69 =
    p0__prod_plus_ma32_shl_8_[18]
      ? p0_prod_2[18] | p0_CastSource_2[8]
      : p0_prod_2[18] & ~(p0_CastSource_2[8]);	// dequant.k:19:9, :105:{13,17}
  wire         prod_70 =
    p0__prod_plus_ma32_shl_8_[17]
      ? p0_prod_2[17] | p0_CastSource_2[8]
      : p0_prod_2[17] & ~(p0_CastSource_2[8]);	// dequant.k:19:9, :105:{13,17}
  wire         prod_71 =
    p0__prod_plus_ma32_shl_8_[16]
      ? p0_prod_2[16] | p0_CastSource_2[8]
      : p0_prod_2[16] & ~(p0_CastSource_2[8]);	// dequant.k:19:9, :105:{13,17}
  wire         prod_72 =
    p0__prod_plus_ma32_shl_8_[15]
      ? p0_prod_2[15] | p0_CastSource_2[8]
      : p0_prod_2[15] & ~(p0_CastSource_2[8]);	// dequant.k:19:9, :105:{13,17}
  wire         prod_73 =
    p0__prod_plus_ma32_shl_8_[14]
      ? p0_prod_2[14] | p0_CastSource_2[8]
      : p0_prod_2[14] & ~(p0_CastSource_2[8]);	// dequant.k:19:9, :105:{13,17}
  wire         prod_74 =
    p0__prod_plus_ma32_shl_8_[13]
      ? p0_prod_2[13] | p0_CastSource_2[8]
      : p0_prod_2[13] & ~(p0_CastSource_2[8]);	// dequant.k:19:9, :105:{13,17}
  wire         prod_75 =
    p0__prod_plus_ma32_shl_8_[12]
      ? p0_prod_2[12] | p0_CastSource_2[8]
      : p0_prod_2[12] & ~(p0_CastSource_2[8]);	// dequant.k:19:9, :105:{13,17}
  wire         prod_76 =
    p0__prod_plus_ma32_shl_8_[11]
      ? p0_prod_2[11] | p0_CastSource_2[8]
      : p0_prod_2[11] & ~(p0_CastSource_2[8]);	// dequant.k:19:9, :105:{13,17}
  wire         prod_77 =
    p0__prod_plus_ma32_shl_8_[10]
      ? p0_prod_2[10] | p0_CastSource_2[8]
      : p0_prod_2[10] & ~(p0_CastSource_2[8]);	// dequant.k:19:9, :105:{13,17}
  wire         prod_78 =
    p0__prod_plus_ma32_shl_8_[9]
      ? p0_prod_2[9] | p0_CastSource_2[8]
      : p0_prod_2[9] & ~(p0_CastSource_2[8]);	// dequant.k:19:9, :105:{13,17}
  wire         prod_79 =
    p0__prod_plus_ma32_shl_8_[8]
      ? p0_prod_2[8] | p0_CastSource_2[8]
      : p0_prod_2[8] & ~(p0_CastSource_2[8]);	// dequant.k:19:9, :105:{13,17}
  wire         prod_80 =
    p0__prod_plus_ma32_shl_8_[7]
      ? p0_prod_2[7] | p0_CastSource_2[8]
      : p0_prod_2[7] & ~(p0_CastSource_2[8]);	// dequant.k:19:9, :105:{13,17}
  wire         prod_81 =
    p0__prod_plus_ma32_shl_8_[6]
      ? p0_prod_2[6] | p0_CastSource_2[8]
      : p0_prod_2[6] & ~(p0_CastSource_2[8]);	// dequant.k:19:9, :105:{13,17}
  wire         prod_82 =
    p0__prod_plus_ma32_shl_8_[5]
      ? p0_prod_2[5] | p0_CastSource_2[8]
      : p0_prod_2[5] & ~(p0_CastSource_2[8]);	// dequant.k:19:9, :105:{13,17}
  wire         prod_83 =
    p0__prod_plus_ma32_shl_8_[4]
      ? p0_prod_2[4] | p0_CastSource_2[8]
      : p0_prod_2[4] & ~(p0_CastSource_2[8]);	// dequant.k:19:9, :105:{13,17}
  wire         prod_84 =
    p0__prod_plus_ma32_shl_8_[3]
      ? p0_prod_2[3] | p0_CastSource_2[8]
      : p0_prod_2[3] & ~(p0_CastSource_2[8]);	// dequant.k:19:9, :105:{13,17}
  wire         prod_85 =
    p0__prod_plus_ma32_shl_8_[2]
      ? p0_prod_2[2] | p0_CastSource_2[8]
      : p0_prod_2[2] & ~(p0_CastSource_2[8]);	// dequant.k:19:9, :105:{13,17}
  wire         prod_86 =
    p0__prod_plus_ma32_shl_8_[1]
      ? p0_prod_2[1] | p0_CastSource_2[8]
      : p0_prod_2[1] & ~(p0_CastSource_2[8]);	// dequant.k:19:9, :105:{13,17}
  wire         prod_87 =
    p0__prod_plus_ma32_shl_8_[0]
      ? p0_prod_2[0] | p0_CastSource_2[8]
      : p0_prod_2[0] & ~(p0_CastSource_2[8]);	// dequant.k:19:9, :105:{13,17}
  wire         prod_88 = p0__prod_plus_ma32_shl_9_[21] & p0_CastSource_3[9];	// dequant.k:19:9, :106:{13,17}
  wire         prod_89 =
    p0__prod_plus_ma32_shl_9_[20]
      ? p0_prod_3[20] | p0_CastSource_3[9]
      : p0_prod_3[20] & ~(p0_CastSource_3[9]);	// dequant.k:19:9, :106:{13,17}
  wire         prod_90 =
    p0__prod_plus_ma32_shl_9_[19]
      ? p0_prod_3[19] | p0_CastSource_3[9]
      : p0_prod_3[19] & ~(p0_CastSource_3[9]);	// dequant.k:19:9, :106:{13,17}
  wire         prod_91 =
    p0__prod_plus_ma32_shl_9_[18]
      ? p0_prod_3[18] | p0_CastSource_3[9]
      : p0_prod_3[18] & ~(p0_CastSource_3[9]);	// dequant.k:19:9, :106:{13,17}
  wire         prod_92 =
    p0__prod_plus_ma32_shl_9_[17]
      ? p0_prod_3[17] | p0_CastSource_3[9]
      : p0_prod_3[17] & ~(p0_CastSource_3[9]);	// dequant.k:19:9, :106:{13,17}
  wire         prod_93 =
    p0__prod_plus_ma32_shl_9_[16]
      ? p0_prod_3[16] | p0_CastSource_3[9]
      : p0_prod_3[16] & ~(p0_CastSource_3[9]);	// dequant.k:19:9, :106:{13,17}
  wire         prod_94 =
    p0__prod_plus_ma32_shl_9_[15]
      ? p0_prod_3[15] | p0_CastSource_3[9]
      : p0_prod_3[15] & ~(p0_CastSource_3[9]);	// dequant.k:19:9, :106:{13,17}
  wire         prod_95 =
    p0__prod_plus_ma32_shl_9_[14]
      ? p0_prod_3[14] | p0_CastSource_3[9]
      : p0_prod_3[14] & ~(p0_CastSource_3[9]);	// dequant.k:19:9, :106:{13,17}
  wire         prod_96 =
    p0__prod_plus_ma32_shl_9_[13]
      ? p0_prod_3[13] | p0_CastSource_3[9]
      : p0_prod_3[13] & ~(p0_CastSource_3[9]);	// dequant.k:19:9, :106:{13,17}
  wire         prod_97 =
    p0__prod_plus_ma32_shl_9_[12]
      ? p0_prod_3[12] | p0_CastSource_3[9]
      : p0_prod_3[12] & ~(p0_CastSource_3[9]);	// dequant.k:19:9, :106:{13,17}
  wire         prod_98 =
    p0__prod_plus_ma32_shl_9_[11]
      ? p0_prod_3[11] | p0_CastSource_3[9]
      : p0_prod_3[11] & ~(p0_CastSource_3[9]);	// dequant.k:19:9, :106:{13,17}
  wire         prod_99 =
    p0__prod_plus_ma32_shl_9_[10]
      ? p0_prod_3[10] | p0_CastSource_3[9]
      : p0_prod_3[10] & ~(p0_CastSource_3[9]);	// dequant.k:19:9, :106:{13,17}
  wire         prod_100 =
    p0__prod_plus_ma32_shl_9_[9]
      ? p0_prod_3[9] | p0_CastSource_3[9]
      : p0_prod_3[9] & ~(p0_CastSource_3[9]);	// dequant.k:19:9, :106:{13,17}
  wire         prod_101 =
    p0__prod_plus_ma32_shl_9_[8]
      ? p0_prod_3[8] | p0_CastSource_3[9]
      : p0_prod_3[8] & ~(p0_CastSource_3[9]);	// dequant.k:19:9, :106:{13,17}
  wire         prod_102 =
    p0__prod_plus_ma32_shl_9_[7]
      ? p0_prod_3[7] | p0_CastSource_3[9]
      : p0_prod_3[7] & ~(p0_CastSource_3[9]);	// dequant.k:19:9, :106:{13,17}
  wire         prod_103 =
    p0__prod_plus_ma32_shl_9_[6]
      ? p0_prod_3[6] | p0_CastSource_3[9]
      : p0_prod_3[6] & ~(p0_CastSource_3[9]);	// dequant.k:19:9, :106:{13,17}
  wire         prod_104 =
    p0__prod_plus_ma32_shl_9_[5]
      ? p0_prod_3[5] | p0_CastSource_3[9]
      : p0_prod_3[5] & ~(p0_CastSource_3[9]);	// dequant.k:19:9, :106:{13,17}
  wire         prod_105 =
    p0__prod_plus_ma32_shl_9_[4]
      ? p0_prod_3[4] | p0_CastSource_3[9]
      : p0_prod_3[4] & ~(p0_CastSource_3[9]);	// dequant.k:19:9, :106:{13,17}
  wire         prod_106 =
    p0__prod_plus_ma32_shl_9_[3]
      ? p0_prod_3[3] | p0_CastSource_3[9]
      : p0_prod_3[3] & ~(p0_CastSource_3[9]);	// dequant.k:19:9, :106:{13,17}
  wire         prod_107 =
    p0__prod_plus_ma32_shl_9_[2]
      ? p0_prod_3[2] | p0_CastSource_3[9]
      : p0_prod_3[2] & ~(p0_CastSource_3[9]);	// dequant.k:19:9, :106:{13,17}
  wire         prod_108 =
    p0__prod_plus_ma32_shl_9_[1]
      ? p0_prod_3[1] | p0_CastSource_3[9]
      : p0_prod_3[1] & ~(p0_CastSource_3[9]);	// dequant.k:19:9, :106:{13,17}
  wire         prod_109 =
    p0__prod_plus_ma32_shl_9_[0]
      ? p0_prod_3[0] | p0_CastSource_3[9]
      : p0_prod_3[0] & ~(p0_CastSource_3[9]);	// dequant.k:19:9, :106:{13,17}
  wire  [31:0] shifted_54 =
    {shifted_5
       ? (shifted_1
            ? (shifted_3
                 ? shifted | _GEN_11
                 : shifted & ~(p0__23_minus_pos_[2]) | p0__23_minus_pos_[1])
            : shifted_3
                ? shifted & ~(p0__23_minus_pos_[1]) | p0__23_minus_pos_[2]
                : shifted ? _GEN_12 : _GEN_13)
       : shifted_1
           ? (shifted_3
                ? (shifted ? _GEN_14 : _GEN_15)
                : shifted ? ~(p0__23_minus_pos_[2]) : _GEN_16)
           : shifted_3
               ? (shifted | p0__23_minus_pos_[2]) & ~(p0__23_minus_pos_[1])
               : shifted & _GEN_17,
     shifted_6
       ? (shifted_2
            ? (shifted_4
                 ? shifted_0 | _GEN_11
                 : shifted_0 & ~(p0__23_minus_pos_[2]) | p0__23_minus_pos_[1])
            : shifted_4
                ? shifted_0 & ~(p0__23_minus_pos_[1]) | p0__23_minus_pos_[2]
                : shifted_0 ? _GEN_12 : _GEN_13)
       : shifted_2
           ? (shifted_4
                ? (shifted_0 ? _GEN_14 : _GEN_15)
                : shifted_0 ? ~(p0__23_minus_pos_[2]) : _GEN_16)
           : shifted_4
               ? (shifted_0 | p0__23_minus_pos_[2]) & ~(p0__23_minus_pos_[1])
               : shifted_0 & _GEN_17,
     shifted_7
       ? (shifted_3
            ? (shifted_5
                 ? shifted_1 | _GEN_11
                 : shifted_1 & ~(p0__23_minus_pos_[2]) | p0__23_minus_pos_[1])
            : shifted_5
                ? shifted_1 & ~(p0__23_minus_pos_[1]) | p0__23_minus_pos_[2]
                : shifted_1 ? _GEN_12 : _GEN_13)
       : shifted_3
           ? (shifted_5
                ? (shifted_1 ? _GEN_14 : _GEN_15)
                : shifted_1 ? ~(p0__23_minus_pos_[2]) : _GEN_16)
           : shifted_5
               ? (shifted_1 | p0__23_minus_pos_[2]) & ~(p0__23_minus_pos_[1])
               : shifted_1 & _GEN_17,
     shifted_8
       ? (shifted_4
            ? (shifted_6
                 ? shifted_2 | _GEN_11
                 : shifted_2 & ~(p0__23_minus_pos_[2]) | p0__23_minus_pos_[1])
            : shifted_6
                ? shifted_2 & ~(p0__23_minus_pos_[1]) | p0__23_minus_pos_[2]
                : shifted_2 ? _GEN_12 : _GEN_13)
       : shifted_4
           ? (shifted_6
                ? (shifted_2 ? _GEN_14 : _GEN_15)
                : shifted_2 ? ~(p0__23_minus_pos_[2]) : _GEN_16)
           : shifted_6
               ? (shifted_2 | p0__23_minus_pos_[2]) & ~(p0__23_minus_pos_[1])
               : shifted_2 & _GEN_17,
     shifted_9
       ? (shifted_5
            ? (shifted_7
                 ? shifted_3 | _GEN_11
                 : shifted_3 & ~(p0__23_minus_pos_[2]) | p0__23_minus_pos_[1])
            : shifted_7
                ? shifted_3 & ~(p0__23_minus_pos_[1]) | p0__23_minus_pos_[2]
                : shifted_3 ? _GEN_12 : _GEN_13)
       : shifted_5
           ? (shifted_7
                ? (shifted_3 ? _GEN_14 : _GEN_15)
                : shifted_3 ? ~(p0__23_minus_pos_[2]) : _GEN_16)
           : shifted_7
               ? (shifted_3 | p0__23_minus_pos_[2]) & ~(p0__23_minus_pos_[1])
               : shifted_3 & _GEN_17,
     shifted_10
       ? (shifted_6
            ? (shifted_8
                 ? shifted_4 | _GEN_11
                 : shifted_4 & ~(p0__23_minus_pos_[2]) | p0__23_minus_pos_[1])
            : shifted_8
                ? shifted_4 & ~(p0__23_minus_pos_[1]) | p0__23_minus_pos_[2]
                : shifted_4 ? _GEN_12 : _GEN_13)
       : shifted_6
           ? (shifted_8
                ? (shifted_4 ? _GEN_14 : _GEN_15)
                : shifted_4 ? ~(p0__23_minus_pos_[2]) : _GEN_16)
           : shifted_8
               ? (shifted_4 | p0__23_minus_pos_[2]) & ~(p0__23_minus_pos_[1])
               : shifted_4 & _GEN_17,
     shifted_11
       ? (shifted_7
            ? (shifted_9
                 ? shifted_5 | _GEN_11
                 : shifted_5 & ~(p0__23_minus_pos_[2]) | p0__23_minus_pos_[1])
            : shifted_9
                ? shifted_5 & ~(p0__23_minus_pos_[1]) | p0__23_minus_pos_[2]
                : shifted_5 ? _GEN_12 : _GEN_13)
       : shifted_7
           ? (shifted_9
                ? (shifted_5 ? _GEN_14 : _GEN_15)
                : shifted_5 ? ~(p0__23_minus_pos_[2]) : _GEN_16)
           : shifted_9
               ? (shifted_5 | p0__23_minus_pos_[2]) & ~(p0__23_minus_pos_[1])
               : shifted_5 & _GEN_17,
     shifted_12
       ? (shifted_8
            ? (shifted_10
                 ? shifted_6 | _GEN_11
                 : shifted_6 & ~(p0__23_minus_pos_[2]) | p0__23_minus_pos_[1])
            : shifted_10
                ? shifted_6 & ~(p0__23_minus_pos_[1]) | p0__23_minus_pos_[2]
                : shifted_6 ? _GEN_12 : _GEN_13)
       : shifted_8
           ? (shifted_10
                ? (shifted_6 ? _GEN_14 : _GEN_15)
                : shifted_6 ? ~(p0__23_minus_pos_[2]) : _GEN_16)
           : shifted_10
               ? (shifted_6 | p0__23_minus_pos_[2]) & ~(p0__23_minus_pos_[1])
               : shifted_6 & _GEN_17,
     shifted_13
       ? (shifted_9
            ? (shifted_11
                 ? shifted_7 | _GEN_11
                 : shifted_7 & ~(p0__23_minus_pos_[2]) | p0__23_minus_pos_[1])
            : shifted_11
                ? shifted_7 & ~(p0__23_minus_pos_[1]) | p0__23_minus_pos_[2]
                : shifted_7 ? _GEN_12 : _GEN_13)
       : shifted_9
           ? (shifted_11
                ? (shifted_7 ? _GEN_14 : _GEN_15)
                : shifted_7 ? ~(p0__23_minus_pos_[2]) : _GEN_16)
           : shifted_11
               ? (shifted_7 | p0__23_minus_pos_[2]) & ~(p0__23_minus_pos_[1])
               : shifted_7 & _GEN_17,
     shifted_14
       ? (shifted_10
            ? (shifted_12
                 ? shifted_8 | _GEN_11
                 : shifted_8 & ~(p0__23_minus_pos_[2]) | p0__23_minus_pos_[1])
            : shifted_12
                ? shifted_8 & ~(p0__23_minus_pos_[1]) | p0__23_minus_pos_[2]
                : shifted_8 ? _GEN_12 : _GEN_13)
       : shifted_10
           ? (shifted_12
                ? (shifted_8 ? _GEN_14 : _GEN_15)
                : shifted_8 ? ~(p0__23_minus_pos_[2]) : _GEN_16)
           : shifted_12
               ? (shifted_8 | p0__23_minus_pos_[2]) & ~(p0__23_minus_pos_[1])
               : shifted_8 & _GEN_17,
     shifted_15
       ? (shifted_11
            ? (shifted_13
                 ? shifted_9 | _GEN_11
                 : shifted_9 & ~(p0__23_minus_pos_[2]) | p0__23_minus_pos_[1])
            : shifted_13
                ? shifted_9 & ~(p0__23_minus_pos_[1]) | p0__23_minus_pos_[2]
                : shifted_9 ? _GEN_12 : _GEN_13)
       : shifted_11
           ? (shifted_13
                ? (shifted_9 ? _GEN_14 : _GEN_15)
                : shifted_9 ? ~(p0__23_minus_pos_[2]) : _GEN_16)
           : shifted_13
               ? (shifted_9 | p0__23_minus_pos_[2]) & ~(p0__23_minus_pos_[1])
               : shifted_9 & _GEN_17,
     shifted_16
       ? (shifted_12
            ? (shifted_14
                 ? shifted_10 | _GEN_11
                 : shifted_10 & ~(p0__23_minus_pos_[2]) | p0__23_minus_pos_[1])
            : shifted_14
                ? shifted_10 & ~(p0__23_minus_pos_[1]) | p0__23_minus_pos_[2]
                : shifted_10 ? _GEN_12 : _GEN_13)
       : shifted_12
           ? (shifted_14
                ? (shifted_10 ? _GEN_14 : _GEN_15)
                : shifted_10 ? ~(p0__23_minus_pos_[2]) : _GEN_16)
           : shifted_14
               ? (shifted_10 | p0__23_minus_pos_[2]) & ~(p0__23_minus_pos_[1])
               : shifted_10 & _GEN_17,
     shifted_17
       ? (shifted_13
            ? (shifted_15
                 ? shifted_11 | _GEN_11
                 : shifted_11 & ~(p0__23_minus_pos_[2]) | p0__23_minus_pos_[1])
            : shifted_15
                ? shifted_11 & ~(p0__23_minus_pos_[1]) | p0__23_minus_pos_[2]
                : shifted_11 ? _GEN_12 : _GEN_13)
       : shifted_13
           ? (shifted_15
                ? (shifted_11 ? _GEN_14 : _GEN_15)
                : shifted_11 ? ~(p0__23_minus_pos_[2]) : _GEN_16)
           : shifted_15
               ? (shifted_11 | p0__23_minus_pos_[2]) & ~(p0__23_minus_pos_[1])
               : shifted_11 & _GEN_17,
     shifted_18
       ? (shifted_14
            ? (shifted_16
                 ? shifted_12 | _GEN_11
                 : shifted_12 & ~(p0__23_minus_pos_[2]) | p0__23_minus_pos_[1])
            : shifted_16
                ? shifted_12 & ~(p0__23_minus_pos_[1]) | p0__23_minus_pos_[2]
                : shifted_12 ? _GEN_12 : _GEN_13)
       : shifted_14
           ? (shifted_16
                ? (shifted_12 ? _GEN_14 : _GEN_15)
                : shifted_12 ? ~(p0__23_minus_pos_[2]) : _GEN_16)
           : shifted_16
               ? (shifted_12 | p0__23_minus_pos_[2]) & ~(p0__23_minus_pos_[1])
               : shifted_12 & _GEN_17,
     shifted_19
       ? (shifted_15
            ? (shifted_17
                 ? shifted_13 | _GEN_11
                 : shifted_13 & ~(p0__23_minus_pos_[2]) | p0__23_minus_pos_[1])
            : shifted_17
                ? shifted_13 & ~(p0__23_minus_pos_[1]) | p0__23_minus_pos_[2]
                : shifted_13 ? _GEN_12 : _GEN_13)
       : shifted_15
           ? (shifted_17
                ? (shifted_13 ? _GEN_14 : _GEN_15)
                : shifted_13 ? ~(p0__23_minus_pos_[2]) : _GEN_16)
           : shifted_17
               ? (shifted_13 | p0__23_minus_pos_[2]) & ~(p0__23_minus_pos_[1])
               : shifted_13 & _GEN_17,
     shifted_20
       ? (shifted_16
            ? (shifted_18
                 ? shifted_14 | _GEN_11
                 : shifted_14 & ~(p0__23_minus_pos_[2]) | p0__23_minus_pos_[1])
            : shifted_18
                ? shifted_14 & ~(p0__23_minus_pos_[1]) | p0__23_minus_pos_[2]
                : shifted_14 ? _GEN_12 : _GEN_13)
       : shifted_16
           ? (shifted_18
                ? (shifted_14 ? _GEN_14 : _GEN_15)
                : shifted_14 ? ~(p0__23_minus_pos_[2]) : _GEN_16)
           : shifted_18
               ? (shifted_14 | p0__23_minus_pos_[2]) & ~(p0__23_minus_pos_[1])
               : shifted_14 & _GEN_17,
     shifted_21
       ? (shifted_17
            ? (shifted_19
                 ? shifted_15 | _GEN_11
                 : shifted_15 & ~(p0__23_minus_pos_[2]) | p0__23_minus_pos_[1])
            : shifted_19
                ? shifted_15 & ~(p0__23_minus_pos_[1]) | p0__23_minus_pos_[2]
                : shifted_15 ? _GEN_12 : _GEN_13)
       : shifted_17
           ? (shifted_19
                ? (shifted_15 ? _GEN_14 : _GEN_15)
                : shifted_15 ? ~(p0__23_minus_pos_[2]) : _GEN_16)
           : shifted_19
               ? (shifted_15 | p0__23_minus_pos_[2]) & ~(p0__23_minus_pos_[1])
               : shifted_15 & _GEN_17,
     shifted_22
       ? (shifted_18
            ? (shifted_20
                 ? shifted_16 | _GEN_11
                 : shifted_16 & ~(p0__23_minus_pos_[2]) | p0__23_minus_pos_[1])
            : shifted_20
                ? shifted_16 & ~(p0__23_minus_pos_[1]) | p0__23_minus_pos_[2]
                : shifted_16 ? _GEN_12 : _GEN_13)
       : shifted_18
           ? (shifted_20
                ? (shifted_16 ? _GEN_14 : _GEN_15)
                : shifted_16 ? ~(p0__23_minus_pos_[2]) : _GEN_16)
           : shifted_20
               ? (shifted_16 | p0__23_minus_pos_[2]) & ~(p0__23_minus_pos_[1])
               : shifted_16 & _GEN_17,
     shifted_23
       ? (shifted_19
            ? (shifted_21
                 ? shifted_17 | _GEN_11
                 : shifted_17 & ~(p0__23_minus_pos_[2]) | p0__23_minus_pos_[1])
            : shifted_21
                ? shifted_17 & ~(p0__23_minus_pos_[1]) | p0__23_minus_pos_[2]
                : shifted_17 ? _GEN_12 : _GEN_13)
       : shifted_19
           ? (shifted_21
                ? (shifted_17 ? _GEN_14 : _GEN_15)
                : shifted_17 ? ~(p0__23_minus_pos_[2]) : _GEN_16)
           : shifted_21
               ? (shifted_17 | p0__23_minus_pos_[2]) & ~(p0__23_minus_pos_[1])
               : shifted_17 & _GEN_17,
     shifted_24
       ? (shifted_20
            ? (shifted_22
                 ? shifted_18 | _GEN_11
                 : shifted_18 & ~(p0__23_minus_pos_[2]) | p0__23_minus_pos_[1])
            : shifted_22
                ? shifted_18 & ~(p0__23_minus_pos_[1]) | p0__23_minus_pos_[2]
                : shifted_18 ? _GEN_12 : _GEN_13)
       : shifted_20
           ? (shifted_22
                ? (shifted_18 ? _GEN_14 : _GEN_15)
                : shifted_18 ? ~(p0__23_minus_pos_[2]) : _GEN_16)
           : shifted_22
               ? (shifted_18 | p0__23_minus_pos_[2]) & ~(p0__23_minus_pos_[1])
               : shifted_18 & _GEN_17,
     shifted_25
       ? (shifted_21
            ? (shifted_23
                 ? shifted_19 | _GEN_11
                 : shifted_19 & ~(p0__23_minus_pos_[2]) | p0__23_minus_pos_[1])
            : shifted_23
                ? shifted_19 & ~(p0__23_minus_pos_[1]) | p0__23_minus_pos_[2]
                : shifted_19 ? _GEN_12 : _GEN_13)
       : shifted_21
           ? (shifted_23
                ? (shifted_19 ? _GEN_14 : _GEN_15)
                : shifted_19 ? ~(p0__23_minus_pos_[2]) : _GEN_16)
           : shifted_23
               ? (shifted_19 | p0__23_minus_pos_[2]) & ~(p0__23_minus_pos_[1])
               : shifted_19 & _GEN_17,
     shifted_26
       ? (shifted_22
            ? (shifted_24
                 ? shifted_20 | _GEN_11
                 : shifted_20 & ~(p0__23_minus_pos_[2]) | p0__23_minus_pos_[1])
            : shifted_24
                ? shifted_20 & ~(p0__23_minus_pos_[1]) | p0__23_minus_pos_[2]
                : shifted_20 ? _GEN_12 : _GEN_13)
       : shifted_22
           ? (shifted_24
                ? (shifted_20 ? _GEN_14 : _GEN_15)
                : shifted_20 ? ~(p0__23_minus_pos_[2]) : _GEN_16)
           : shifted_24
               ? (shifted_20 | p0__23_minus_pos_[2]) & ~(p0__23_minus_pos_[1])
               : shifted_20 & _GEN_17,
     shifted_27
       ? (shifted_23
            ? (shifted_25
                 ? shifted_21 | _GEN_11
                 : shifted_21 & ~(p0__23_minus_pos_[2]) | p0__23_minus_pos_[1])
            : shifted_25
                ? shifted_21 & ~(p0__23_minus_pos_[1]) | p0__23_minus_pos_[2]
                : shifted_21 ? _GEN_12 : _GEN_13)
       : shifted_23
           ? (shifted_25
                ? (shifted_21 ? _GEN_14 : _GEN_15)
                : shifted_21 ? ~(p0__23_minus_pos_[2]) : _GEN_16)
           : shifted_25
               ? (shifted_21 | p0__23_minus_pos_[2]) & ~(p0__23_minus_pos_[1])
               : shifted_21 & _GEN_17,
     shifted_28
       ? (shifted_24
            ? (shifted_26
                 ? shifted_22 | _GEN_11
                 : shifted_22 & ~(p0__23_minus_pos_[2]) | p0__23_minus_pos_[1])
            : shifted_26
                ? shifted_22 & ~(p0__23_minus_pos_[1]) | p0__23_minus_pos_[2]
                : shifted_22 ? _GEN_12 : _GEN_13)
       : shifted_24
           ? (shifted_26
                ? (shifted_22 ? _GEN_14 : _GEN_15)
                : shifted_22 ? ~(p0__23_minus_pos_[2]) : _GEN_16)
           : shifted_26
               ? (shifted_22 | p0__23_minus_pos_[2]) & ~(p0__23_minus_pos_[1])
               : shifted_22 & _GEN_17,
     shifted_29
       ? (shifted_25
            ? (shifted_27
                 ? shifted_23 | _GEN_11
                 : shifted_23 & ~(p0__23_minus_pos_[2]) | p0__23_minus_pos_[1])
            : shifted_27
                ? shifted_23 & ~(p0__23_minus_pos_[1]) | p0__23_minus_pos_[2]
                : shifted_23 ? _GEN_12 : _GEN_13)
       : shifted_25
           ? (shifted_27
                ? (shifted_23 ? _GEN_14 : _GEN_15)
                : shifted_23 ? ~(p0__23_minus_pos_[2]) : _GEN_16)
           : shifted_27
               ? (shifted_23 | p0__23_minus_pos_[2]) & ~(p0__23_minus_pos_[1])
               : shifted_23 & _GEN_17,
     shifted_30
       ? (shifted_26
            ? (shifted_28
                 ? shifted_24 | _GEN_11
                 : shifted_24 & ~(p0__23_minus_pos_[2]) | p0__23_minus_pos_[1])
            : shifted_28
                ? shifted_24 & ~(p0__23_minus_pos_[1]) | p0__23_minus_pos_[2]
                : shifted_24 ? _GEN_12 : _GEN_13)
       : shifted_26
           ? (shifted_28
                ? (shifted_24 ? _GEN_14 : _GEN_15)
                : shifted_24 ? ~(p0__23_minus_pos_[2]) : _GEN_16)
           : shifted_28
               ? (shifted_24 | p0__23_minus_pos_[2]) & ~(p0__23_minus_pos_[1])
               : shifted_24 & _GEN_17,
     shifted_27
       ? (shifted_29
            ? (shifted_25 ? _GEN_14 : _GEN_15)
            : shifted_25 ? ~(p0__23_minus_pos_[2]) : _GEN_16)
       : shifted_29
           ? (shifted_25 | p0__23_minus_pos_[2]) & ~(p0__23_minus_pos_[1])
           : shifted_25 & _GEN_17,
     shifted_28
       ? (shifted_30
            ? (shifted_26 ? _GEN_14 : _GEN_15)
            : shifted_26 ? ~(p0__23_minus_pos_[2]) : _GEN_16)
       : shifted_30
           ? (shifted_26 | p0__23_minus_pos_[2]) & ~(p0__23_minus_pos_[1])
           : shifted_26 & _GEN_17,
     shifted_29 ? (shifted_27 ? ~(p0__23_minus_pos_[2]) : _GEN_16) : shifted_27 & _GEN_17,
     shifted_30 ? (shifted_28 ? ~(p0__23_minus_pos_[2]) : _GEN_16) : shifted_28 & _GEN_17,
     shifted_29 & _GEN_17,
     shifted_30 & _GEN_17};	// dequant.k:19:9, :65:{17,21,56}, :66:{17,21,56}, :67:{17,21,56}, :68:{17,21,56}
  wire  [31:0] _mag_shr_pos_minus_23_ = p0_mag_1 >> p0__pos_minus_23_[31:0];	// dequant.k:19:9, :59:27
  always @(posedge clk) begin	// dequant.k:19:9
    p0_accum <= data_in_4[23:0];	// dequant.k:19:9
    p0_super_scale_bf16 <= data_in_4[39:24];	// dequant.k:19:9
    p0_sub_scale <= data_in_4[43:40];	// dequant.k:19:9
    if (rst)	// dequant.k:19:9
      p0_stage1_enable <= 1'h0;	// dequant.k:19:9
    else	// dequant.k:19:9
      p0_stage1_enable <= _GEN & input_valid_0;	// dequant.k:19:9
    p0_cast_lt_int32_gt_a_ <= {{8{p0_accum[23]}}, p0_accum};	// dequant.k:19:9, :22:53, :23:54, :24:54, :25:54, :26:54
    p0_scaled <=
      {_scaled_plus_cast_lt_int32_gt_a_shl_1_[31] ? _GEN_2 : _GEN_3,
       _scaled_plus_cast_lt_int32_gt_a_shl_1_[30] ? _GEN_2 : _GEN_3,
       _scaled_plus_cast_lt_int32_gt_a_shl_1_[29] ? _GEN_2 : _GEN_3,
       _scaled_plus_cast_lt_int32_gt_a_shl_1_[28] ? _GEN_2 : _GEN_3,
       _scaled_plus_cast_lt_int32_gt_a_shl_1_[27] ? _GEN_2 : _GEN_3,
       _scaled_plus_cast_lt_int32_gt_a_shl_1_[26] ? _GEN_2 : _GEN_3,
       _scaled_plus_cast_lt_int32_gt_a_shl_1_[25] ? _GEN_2 : _GEN_3,
       _scaled_plus_cast_lt_int32_gt_a_shl_1_[24] ? _GEN_2 : _GEN_3,
       _scaled_plus_cast_lt_int32_gt_a_shl_1_[23]
         ? p0_accum[23] | p0_sub_scale[0]
         : p0_accum[23] & ~(p0_sub_scale[0]),
       _scaled_plus_cast_lt_int32_gt_a_shl_1_[22]
         ? p0_accum[22] | p0_sub_scale[0]
         : p0_accum[22] & ~(p0_sub_scale[0]),
       _scaled_plus_cast_lt_int32_gt_a_shl_1_[21]
         ? p0_accum[21] | p0_sub_scale[0]
         : p0_accum[21] & ~(p0_sub_scale[0]),
       _scaled_plus_cast_lt_int32_gt_a_shl_1_[20]
         ? p0_accum[20] | p0_sub_scale[0]
         : p0_accum[20] & ~(p0_sub_scale[0]),
       _scaled_plus_cast_lt_int32_gt_a_shl_1_[19]
         ? p0_accum[19] | p0_sub_scale[0]
         : p0_accum[19] & ~(p0_sub_scale[0]),
       _scaled_plus_cast_lt_int32_gt_a_shl_1_[18]
         ? p0_accum[18] | p0_sub_scale[0]
         : p0_accum[18] & ~(p0_sub_scale[0]),
       _scaled_plus_cast_lt_int32_gt_a_shl_1_[17]
         ? p0_accum[17] | p0_sub_scale[0]
         : p0_accum[17] & ~(p0_sub_scale[0]),
       _scaled_plus_cast_lt_int32_gt_a_shl_1_[16]
         ? p0_accum[16] | p0_sub_scale[0]
         : p0_accum[16] & ~(p0_sub_scale[0]),
       _scaled_plus_cast_lt_int32_gt_a_shl_1_[15]
         ? p0_accum[15] | p0_sub_scale[0]
         : p0_accum[15] & ~(p0_sub_scale[0]),
       _scaled_plus_cast_lt_int32_gt_a_shl_1_[14]
         ? p0_accum[14] | p0_sub_scale[0]
         : p0_accum[14] & ~(p0_sub_scale[0]),
       _scaled_plus_cast_lt_int32_gt_a_shl_1_[13]
         ? p0_accum[13] | p0_sub_scale[0]
         : p0_accum[13] & ~(p0_sub_scale[0]),
       _scaled_plus_cast_lt_int32_gt_a_shl_1_[12]
         ? p0_accum[12] | p0_sub_scale[0]
         : p0_accum[12] & ~(p0_sub_scale[0]),
       _scaled_plus_cast_lt_int32_gt_a_shl_1_[11]
         ? p0_accum[11] | p0_sub_scale[0]
         : p0_accum[11] & ~(p0_sub_scale[0]),
       _scaled_plus_cast_lt_int32_gt_a_shl_1_[10]
         ? p0_accum[10] | p0_sub_scale[0]
         : p0_accum[10] & ~(p0_sub_scale[0]),
       _scaled_plus_cast_lt_int32_gt_a_shl_1_[9]
         ? p0_accum[9] | p0_sub_scale[0]
         : p0_accum[9] & ~(p0_sub_scale[0]),
       _scaled_plus_cast_lt_int32_gt_a_shl_1_[8]
         ? p0_accum[8] | p0_sub_scale[0]
         : p0_accum[8] & ~(p0_sub_scale[0]),
       _scaled_plus_cast_lt_int32_gt_a_shl_1_[7]
         ? p0_accum[7] | p0_sub_scale[0]
         : p0_accum[7] & ~(p0_sub_scale[0]),
       _scaled_plus_cast_lt_int32_gt_a_shl_1_[6]
         ? p0_accum[6] | p0_sub_scale[0]
         : p0_accum[6] & ~(p0_sub_scale[0]),
       _scaled_plus_cast_lt_int32_gt_a_shl_1_[5]
         ? p0_accum[5] | p0_sub_scale[0]
         : p0_accum[5] & ~(p0_sub_scale[0]),
       _scaled_plus_cast_lt_int32_gt_a_shl_1_[4]
         ? p0_accum[4] | p0_sub_scale[0]
         : p0_accum[4] & ~(p0_sub_scale[0]),
       _scaled_plus_cast_lt_int32_gt_a_shl_1_[3]
         ? p0_accum[3] | p0_sub_scale[0]
         : p0_accum[3] & ~(p0_sub_scale[0]),
       _scaled_plus_cast_lt_int32_gt_a_shl_1_[2]
         ? p0_accum[2] | p0_sub_scale[0]
         : p0_accum[2] & ~(p0_sub_scale[0]),
       _scaled_plus_cast_lt_int32_gt_a_shl_1_[1]
         ? p0_accum[1] | p0_sub_scale[0]
         : p0_accum[1] & ~(p0_sub_scale[0]),
       _scaled_plus_cast_lt_int32_gt_a_shl_1_[0]
         ? p0_accum[0] | p0_sub_scale[0]
         : p0_accum[0] & ~(p0_sub_scale[0])};	// dequant.k:19:{9,26,51}, :22:{9,13}, :23:{9,13,44}
    p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_ <= {p0_sub_scale, 1'h1};	// dequant.k:19:{9,26,51}
    if (rst)	// dequant.k:19:9
      p0_stage2_enable <= 1'h0;	// dequant.k:19:9
    else	// dequant.k:19:9
      p0_stage2_enable <= p0_stage1_enable;	// dequant.k:19:9
    p0_cast_lt_int32_gt_a__0 <= p0_cast_lt_int32_gt_a_;	// dequant.k:19:9
    p0_scaled_0 <=
      {_scaled_plus_cast_lt_int32_gt_a_shl_2_[31]
         ? p0_scaled[31] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]
         : p0_scaled[31] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]),
       _scaled_plus_cast_lt_int32_gt_a_shl_2_[30]
         ? p0_scaled[30] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]
         : p0_scaled[30] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]),
       _scaled_plus_cast_lt_int32_gt_a_shl_2_[29]
         ? p0_scaled[29] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]
         : p0_scaled[29] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]),
       _scaled_plus_cast_lt_int32_gt_a_shl_2_[28]
         ? p0_scaled[28] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]
         : p0_scaled[28] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]),
       _scaled_plus_cast_lt_int32_gt_a_shl_2_[27]
         ? p0_scaled[27] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]
         : p0_scaled[27] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]),
       _scaled_plus_cast_lt_int32_gt_a_shl_2_[26]
         ? p0_scaled[26] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]
         : p0_scaled[26] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]),
       _scaled_plus_cast_lt_int32_gt_a_shl_2_[25]
         ? p0_scaled[25] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]
         : p0_scaled[25] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]),
       _scaled_plus_cast_lt_int32_gt_a_shl_2_[24]
         ? p0_scaled[24] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]
         : p0_scaled[24] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]),
       _scaled_plus_cast_lt_int32_gt_a_shl_2_[23]
         ? p0_scaled[23] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]
         : p0_scaled[23] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]),
       _scaled_plus_cast_lt_int32_gt_a_shl_2_[22]
         ? p0_scaled[22] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]
         : p0_scaled[22] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]),
       _scaled_plus_cast_lt_int32_gt_a_shl_2_[21]
         ? p0_scaled[21] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]
         : p0_scaled[21] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]),
       _scaled_plus_cast_lt_int32_gt_a_shl_2_[20]
         ? p0_scaled[20] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]
         : p0_scaled[20] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]),
       _scaled_plus_cast_lt_int32_gt_a_shl_2_[19]
         ? p0_scaled[19] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]
         : p0_scaled[19] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]),
       _scaled_plus_cast_lt_int32_gt_a_shl_2_[18]
         ? p0_scaled[18] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]
         : p0_scaled[18] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]),
       _scaled_plus_cast_lt_int32_gt_a_shl_2_[17]
         ? p0_scaled[17] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]
         : p0_scaled[17] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]),
       _scaled_plus_cast_lt_int32_gt_a_shl_2_[16]
         ? p0_scaled[16] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]
         : p0_scaled[16] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]),
       _scaled_plus_cast_lt_int32_gt_a_shl_2_[15]
         ? p0_scaled[15] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]
         : p0_scaled[15] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]),
       _scaled_plus_cast_lt_int32_gt_a_shl_2_[14]
         ? p0_scaled[14] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]
         : p0_scaled[14] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]),
       _scaled_plus_cast_lt_int32_gt_a_shl_2_[13]
         ? p0_scaled[13] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]
         : p0_scaled[13] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]),
       _scaled_plus_cast_lt_int32_gt_a_shl_2_[12]
         ? p0_scaled[12] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]
         : p0_scaled[12] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]),
       _scaled_plus_cast_lt_int32_gt_a_shl_2_[11]
         ? p0_scaled[11] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]
         : p0_scaled[11] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]),
       _scaled_plus_cast_lt_int32_gt_a_shl_2_[10]
         ? p0_scaled[10] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]
         : p0_scaled[10] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]),
       _scaled_plus_cast_lt_int32_gt_a_shl_2_[9]
         ? p0_scaled[9] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]
         : p0_scaled[9] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]),
       _scaled_plus_cast_lt_int32_gt_a_shl_2_[8]
         ? p0_scaled[8] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]
         : p0_scaled[8] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]),
       _scaled_plus_cast_lt_int32_gt_a_shl_2_[7]
         ? p0_scaled[7] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]
         : p0_scaled[7] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]),
       _scaled_plus_cast_lt_int32_gt_a_shl_2_[6]
         ? p0_scaled[6] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]
         : p0_scaled[6] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]),
       _scaled_plus_cast_lt_int32_gt_a_shl_2_[5]
         ? p0_scaled[5] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]
         : p0_scaled[5] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]),
       _scaled_plus_cast_lt_int32_gt_a_shl_2_[4]
         ? p0_scaled[4] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]
         : p0_scaled[4] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]),
       _scaled_plus_cast_lt_int32_gt_a_shl_2_[3]
         ? p0_scaled[3] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]
         : p0_scaled[3] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]),
       _scaled_plus_cast_lt_int32_gt_a_shl_2_[2]
         ? p0_scaled[2] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]
         : p0_scaled[2] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]),
       _scaled_plus_cast_lt_int32_gt_a_shl_2_[1]
         ? p0_scaled[1] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]
         : p0_scaled[1] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]),
       _scaled_plus_cast_lt_int32_gt_a_shl_2_[0]
         ? p0_scaled[0] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2]
         : p0_scaled[0] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_[2])};	// dequant.k:19:9, :24:{9,13,44}
    p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0 <=
      p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1_;	// dequant.k:19:9
    if (rst)	// dequant.k:19:9
      p0_stage3_enable <= 1'h0;	// dequant.k:19:9
    else	// dequant.k:19:9
      p0_stage3_enable <= p0_stage2_enable;	// dequant.k:19:9
    p0_cast_lt_int32_gt_a__1 <= p0_cast_lt_int32_gt_a__0;	// dequant.k:19:9
    p0_scaled_1 <=
      {_scaled_plus_cast_lt_int32_gt_a_shl_3_[31]
         ? p0_scaled_0[31] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]
         : p0_scaled_0[31] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_3_[30]
         ? p0_scaled_0[30] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]
         : p0_scaled_0[30] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_3_[29]
         ? p0_scaled_0[29] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]
         : p0_scaled_0[29] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_3_[28]
         ? p0_scaled_0[28] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]
         : p0_scaled_0[28] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_3_[27]
         ? p0_scaled_0[27] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]
         : p0_scaled_0[27] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_3_[26]
         ? p0_scaled_0[26] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]
         : p0_scaled_0[26] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_3_[25]
         ? p0_scaled_0[25] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]
         : p0_scaled_0[25] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_3_[24]
         ? p0_scaled_0[24] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]
         : p0_scaled_0[24] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_3_[23]
         ? p0_scaled_0[23] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]
         : p0_scaled_0[23] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_3_[22]
         ? p0_scaled_0[22] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]
         : p0_scaled_0[22] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_3_[21]
         ? p0_scaled_0[21] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]
         : p0_scaled_0[21] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_3_[20]
         ? p0_scaled_0[20] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]
         : p0_scaled_0[20] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_3_[19]
         ? p0_scaled_0[19] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]
         : p0_scaled_0[19] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_3_[18]
         ? p0_scaled_0[18] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]
         : p0_scaled_0[18] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_3_[17]
         ? p0_scaled_0[17] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]
         : p0_scaled_0[17] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_3_[16]
         ? p0_scaled_0[16] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]
         : p0_scaled_0[16] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_3_[15]
         ? p0_scaled_0[15] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]
         : p0_scaled_0[15] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_3_[14]
         ? p0_scaled_0[14] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]
         : p0_scaled_0[14] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_3_[13]
         ? p0_scaled_0[13] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]
         : p0_scaled_0[13] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_3_[12]
         ? p0_scaled_0[12] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]
         : p0_scaled_0[12] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_3_[11]
         ? p0_scaled_0[11] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]
         : p0_scaled_0[11] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_3_[10]
         ? p0_scaled_0[10] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]
         : p0_scaled_0[10] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_3_[9]
         ? p0_scaled_0[9] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]
         : p0_scaled_0[9] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_3_[8]
         ? p0_scaled_0[8] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]
         : p0_scaled_0[8] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_3_[7]
         ? p0_scaled_0[7] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]
         : p0_scaled_0[7] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_3_[6]
         ? p0_scaled_0[6] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]
         : p0_scaled_0[6] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_3_[5]
         ? p0_scaled_0[5] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]
         : p0_scaled_0[5] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_3_[4]
         ? p0_scaled_0[4] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]
         : p0_scaled_0[4] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_3_[3]
         ? p0_scaled_0[3] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]
         : p0_scaled_0[3] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_3_[2]
         ? p0_scaled_0[2] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]
         : p0_scaled_0[2] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_3_[1]
         ? p0_scaled_0[1] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]
         : p0_scaled_0[1] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]),
       _scaled_plus_cast_lt_int32_gt_a_shl_3_[0]
         ? p0_scaled_0[0] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3]
         : p0_scaled_0[0] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0[3])};	// dequant.k:19:9, :25:{9,13,44}
    p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1 <=
      p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__0;	// dequant.k:19:9
    if (rst)	// dequant.k:19:9
      p0_stage4_enable <= 1'h0;	// dequant.k:19:9
    else	// dequant.k:19:9
      p0_stage4_enable <= p0_stage3_enable;	// dequant.k:19:9
    p0_scaled_2 <=
      {_scaled_plus_cast_lt_int32_gt_a_shl_4_[31]
         ? p0_scaled_1[31] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]
         : p0_scaled_1[31] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[30]
         ? p0_scaled_1[30] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]
         : p0_scaled_1[30] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[29]
         ? p0_scaled_1[29] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]
         : p0_scaled_1[29] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[28]
         ? p0_scaled_1[28] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]
         : p0_scaled_1[28] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[27]
         ? p0_scaled_1[27] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]
         : p0_scaled_1[27] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[26]
         ? p0_scaled_1[26] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]
         : p0_scaled_1[26] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[25]
         ? p0_scaled_1[25] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]
         : p0_scaled_1[25] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[24]
         ? p0_scaled_1[24] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]
         : p0_scaled_1[24] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[23]
         ? p0_scaled_1[23] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]
         : p0_scaled_1[23] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[22]
         ? p0_scaled_1[22] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]
         : p0_scaled_1[22] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[21]
         ? p0_scaled_1[21] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]
         : p0_scaled_1[21] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[20]
         ? p0_scaled_1[20] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]
         : p0_scaled_1[20] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[19]
         ? p0_scaled_1[19] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]
         : p0_scaled_1[19] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[18]
         ? p0_scaled_1[18] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]
         : p0_scaled_1[18] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[17]
         ? p0_scaled_1[17] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]
         : p0_scaled_1[17] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[16]
         ? p0_scaled_1[16] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]
         : p0_scaled_1[16] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[15]
         ? p0_scaled_1[15] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]
         : p0_scaled_1[15] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[14]
         ? p0_scaled_1[14] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]
         : p0_scaled_1[14] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[13]
         ? p0_scaled_1[13] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]
         : p0_scaled_1[13] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[12]
         ? p0_scaled_1[12] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]
         : p0_scaled_1[12] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[11]
         ? p0_scaled_1[11] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]
         : p0_scaled_1[11] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[10]
         ? p0_scaled_1[10] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]
         : p0_scaled_1[10] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[9]
         ? p0_scaled_1[9] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]
         : p0_scaled_1[9] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[8]
         ? p0_scaled_1[8] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]
         : p0_scaled_1[8] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[7]
         ? p0_scaled_1[7] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]
         : p0_scaled_1[7] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[6]
         ? p0_scaled_1[6] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]
         : p0_scaled_1[6] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[5]
         ? p0_scaled_1[5] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]
         : p0_scaled_1[5] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[4]
         ? p0_scaled_1[4] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]
         : p0_scaled_1[4] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[3]
         ? p0_scaled_1[3] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]
         : p0_scaled_1[3] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[2]
         ? p0_scaled_1[2] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]
         : p0_scaled_1[2] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[1]
         ? p0_scaled_1[1] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]
         : p0_scaled_1[1] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]),
       _scaled_plus_cast_lt_int32_gt_a_shl_4_[0]
         ? p0_scaled_1[0] | p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4]
         : p0_scaled_1[0] & ~(p0__cast_lt_uint5_gt_sub_scale_times_2_plus_1__1[4])};	// dequant.k:19:9, :26:{9,13,44}
    if (rst)	// dequant.k:19:9
      p0_stage5_enable <= 1'h0;	// dequant.k:19:9
    else	// dequant.k:19:9
      p0_stage5_enable <= p0_stage4_enable;	// dequant.k:19:9
    p0_mag <=
      {CastSource[31]
         ? p0_scaled_2[31] | p0_scaled_2[31]
         : p0_scaled_2[31] & ~(p0_scaled_2[31]),
       CastSource[30]
         ? p0_scaled_2[30] | p0_scaled_2[31]
         : p0_scaled_2[30] & ~(p0_scaled_2[31]),
       CastSource[29]
         ? p0_scaled_2[29] | p0_scaled_2[31]
         : p0_scaled_2[29] & ~(p0_scaled_2[31]),
       CastSource[28]
         ? p0_scaled_2[28] | p0_scaled_2[31]
         : p0_scaled_2[28] & ~(p0_scaled_2[31]),
       CastSource[27]
         ? p0_scaled_2[27] | p0_scaled_2[31]
         : p0_scaled_2[27] & ~(p0_scaled_2[31]),
       CastSource[26]
         ? p0_scaled_2[26] | p0_scaled_2[31]
         : p0_scaled_2[26] & ~(p0_scaled_2[31]),
       CastSource[25]
         ? p0_scaled_2[25] | p0_scaled_2[31]
         : p0_scaled_2[25] & ~(p0_scaled_2[31]),
       CastSource[24]
         ? p0_scaled_2[24] | p0_scaled_2[31]
         : p0_scaled_2[24] & ~(p0_scaled_2[31]),
       CastSource[23]
         ? p0_scaled_2[23] | p0_scaled_2[31]
         : p0_scaled_2[23] & ~(p0_scaled_2[31]),
       CastSource[22]
         ? p0_scaled_2[22] | p0_scaled_2[31]
         : p0_scaled_2[22] & ~(p0_scaled_2[31]),
       CastSource[21]
         ? p0_scaled_2[21] | p0_scaled_2[31]
         : p0_scaled_2[21] & ~(p0_scaled_2[31]),
       CastSource[20]
         ? p0_scaled_2[20] | p0_scaled_2[31]
         : p0_scaled_2[20] & ~(p0_scaled_2[31]),
       CastSource[19]
         ? p0_scaled_2[19] | p0_scaled_2[31]
         : p0_scaled_2[19] & ~(p0_scaled_2[31]),
       CastSource[18]
         ? p0_scaled_2[18] | p0_scaled_2[31]
         : p0_scaled_2[18] & ~(p0_scaled_2[31]),
       CastSource[17]
         ? p0_scaled_2[17] | p0_scaled_2[31]
         : p0_scaled_2[17] & ~(p0_scaled_2[31]),
       CastSource[16]
         ? p0_scaled_2[16] | p0_scaled_2[31]
         : p0_scaled_2[16] & ~(p0_scaled_2[31]),
       CastSource[15]
         ? p0_scaled_2[15] | p0_scaled_2[31]
         : p0_scaled_2[15] & ~(p0_scaled_2[31]),
       CastSource[14]
         ? p0_scaled_2[14] | p0_scaled_2[31]
         : p0_scaled_2[14] & ~(p0_scaled_2[31]),
       CastSource[13]
         ? p0_scaled_2[13] | p0_scaled_2[31]
         : p0_scaled_2[13] & ~(p0_scaled_2[31]),
       CastSource[12]
         ? p0_scaled_2[12] | p0_scaled_2[31]
         : p0_scaled_2[12] & ~(p0_scaled_2[31]),
       CastSource[11]
         ? p0_scaled_2[11] | p0_scaled_2[31]
         : p0_scaled_2[11] & ~(p0_scaled_2[31]),
       CastSource[10]
         ? p0_scaled_2[10] | p0_scaled_2[31]
         : p0_scaled_2[10] & ~(p0_scaled_2[31]),
       CastSource[9]
         ? p0_scaled_2[9] | p0_scaled_2[31]
         : p0_scaled_2[9] & ~(p0_scaled_2[31]),
       CastSource[8]
         ? p0_scaled_2[8] | p0_scaled_2[31]
         : p0_scaled_2[8] & ~(p0_scaled_2[31]),
       CastSource[7]
         ? p0_scaled_2[7] | p0_scaled_2[31]
         : p0_scaled_2[7] & ~(p0_scaled_2[31]),
       CastSource[6]
         ? p0_scaled_2[6] | p0_scaled_2[31]
         : p0_scaled_2[6] & ~(p0_scaled_2[31]),
       CastSource[5]
         ? p0_scaled_2[5] | p0_scaled_2[31]
         : p0_scaled_2[5] & ~(p0_scaled_2[31]),
       CastSource[4]
         ? p0_scaled_2[4] | p0_scaled_2[31]
         : p0_scaled_2[4] & ~(p0_scaled_2[31]),
       CastSource[3]
         ? p0_scaled_2[3] | p0_scaled_2[31]
         : p0_scaled_2[3] & ~(p0_scaled_2[31]),
       CastSource[2]
         ? p0_scaled_2[2] | p0_scaled_2[31]
         : p0_scaled_2[2] & ~(p0_scaled_2[31]),
       CastSource[1]
         ? p0_scaled_2[1] | p0_scaled_2[31]
         : p0_scaled_2[1] & ~(p0_scaled_2[31]),
       CastSource[0]
         ? p0_scaled_2[0] | p0_scaled_2[31]
         : p0_scaled_2[0] & ~(p0_scaled_2[31])};	// dequant.k:19:9, :31:{9,13}, :34:{19,32}
    p0__scaled_lt_0_ <= p0_scaled_2[31];	// dequant.k:19:9, :31:13
    if (rst)	// dequant.k:19:9
      p0_stage6_enable <= 1'h0;	// dequant.k:19:9
    else	// dequant.k:19:9
      p0_stage6_enable <= p0_stage5_enable;	// dequant.k:19:9
    p0_mag_0 <= p0_mag;	// dequant.k:19:9
    p0__tmp_and_4294901760_ne_0_ <=
      p0_mag[31] | p0_mag[30] | p0_mag[29] | p0_mag[28] | p0_mag[27] | p0_mag[26]
      | p0_mag[25] | p0_mag[24] | p0_mag[23] | p0_mag[22] | p0_mag[21] | p0_mag[20]
      | p0_mag[19] | p0_mag[18] | p0_mag[17] | p0_mag[16];	// dequant.k:19:9, :47:17
    p0__scaled_lt_0__0 <= p0__scaled_lt_0_;	// dequant.k:19:9
    if (rst)	// dequant.k:19:9
      p0_stage7_enable <= 1'h0;	// dequant.k:19:9
    else	// dequant.k:19:9
      p0_stage7_enable <= p0_stage6_enable;	// dequant.k:19:9
    p0__tmp_and_65280_ne_0__xor_reduce <=
      {tmp | tmp_0 | tmp_1 | tmp_2, tmp_3 | tmp_4 | tmp_5 | tmp_6, 2'h0};	// dequant.k:19:9, :47:{13,44,50}, :48:17
    p0_tmp <=
      {p0_mag_0[31] & ~p0__tmp_and_4294901760_ne_0_,
       p0_mag_0[30] & ~p0__tmp_and_4294901760_ne_0_,
       p0_mag_0[29] & ~p0__tmp_and_4294901760_ne_0_,
       p0_mag_0[28] & ~p0__tmp_and_4294901760_ne_0_,
       p0_mag_0[27] & ~p0__tmp_and_4294901760_ne_0_,
       p0_mag_0[26] & ~p0__tmp_and_4294901760_ne_0_,
       p0_mag_0[25] & ~p0__tmp_and_4294901760_ne_0_,
       p0_mag_0[24] & ~p0__tmp_and_4294901760_ne_0_,
       p0_mag_0[23] & ~p0__tmp_and_4294901760_ne_0_,
       p0_mag_0[22] & ~p0__tmp_and_4294901760_ne_0_,
       p0_mag_0[21] & ~p0__tmp_and_4294901760_ne_0_,
       p0_mag_0[20] & ~p0__tmp_and_4294901760_ne_0_,
       p0_mag_0[19] & ~p0__tmp_and_4294901760_ne_0_,
       p0_mag_0[18] & ~p0__tmp_and_4294901760_ne_0_,
       p0_mag_0[17] & ~p0__tmp_and_4294901760_ne_0_,
       p0_mag_0[16] & ~p0__tmp_and_4294901760_ne_0_,
       tmp,
       tmp_0,
       tmp_1,
       tmp_2,
       tmp_3,
       tmp_4,
       tmp_5,
       tmp_6,
       p0_mag_0[23]
         ? p0_mag_0[7] | p0__tmp_and_4294901760_ne_0_
         : p0_mag_0[7] & ~p0__tmp_and_4294901760_ne_0_,
       p0_mag_0[22]
         ? p0_mag_0[6] | p0__tmp_and_4294901760_ne_0_
         : p0_mag_0[6] & ~p0__tmp_and_4294901760_ne_0_,
       p0_mag_0[21]
         ? p0_mag_0[5] | p0__tmp_and_4294901760_ne_0_
         : p0_mag_0[5] & ~p0__tmp_and_4294901760_ne_0_,
       p0_mag_0[20]
         ? p0_mag_0[4] | p0__tmp_and_4294901760_ne_0_
         : p0_mag_0[4] & ~p0__tmp_and_4294901760_ne_0_,
       p0_mag_0[19]
         ? p0_mag_0[3] | p0__tmp_and_4294901760_ne_0_
         : p0_mag_0[3] & ~p0__tmp_and_4294901760_ne_0_,
       p0_mag_0[18]
         ? p0_mag_0[2] | p0__tmp_and_4294901760_ne_0_
         : p0_mag_0[2] & ~p0__tmp_and_4294901760_ne_0_,
       p0_mag_0[17]
         ? p0_mag_0[1] | p0__tmp_and_4294901760_ne_0_
         : p0_mag_0[1] & ~p0__tmp_and_4294901760_ne_0_,
       p0_mag_0[16]
         ? p0_mag_0[0] | p0__tmp_and_4294901760_ne_0_
         : p0_mag_0[0] & ~p0__tmp_and_4294901760_ne_0_};	// dequant.k:19:9, :47:{13,44,50}
    p0__tmp_and_4294901760_ne_0__0 <= p0__tmp_and_4294901760_ne_0_;	// dequant.k:19:9
    p0__scaled_lt_0__1 <= p0__scaled_lt_0__0;	// dequant.k:19:9
    if (rst)	// dequant.k:19:9
      p0_stage8_enable <= 1'h0;	// dequant.k:19:9
    else	// dequant.k:19:9
      p0_stage8_enable <= p0_stage7_enable;	// dequant.k:19:9
    p0_tmp_0 <=
      {p0_tmp[31] & ~_tmp_and_65280_ne_0_,
       p0_tmp[30] & ~_tmp_and_65280_ne_0_,
       p0_tmp[29] & ~_tmp_and_65280_ne_0_,
       p0_tmp[28] & ~_tmp_and_65280_ne_0_,
       p0_tmp[27] & ~_tmp_and_65280_ne_0_,
       p0_tmp[26] & ~_tmp_and_65280_ne_0_,
       p0_tmp[25] & ~_tmp_and_65280_ne_0_,
       p0_tmp[24] & ~_tmp_and_65280_ne_0_,
       p0_tmp[31]
         ? p0_tmp[23] | _tmp_and_65280_ne_0_
         : p0_tmp[23] & ~_tmp_and_65280_ne_0_,
       p0_tmp[30]
         ? p0_tmp[22] | _tmp_and_65280_ne_0_
         : p0_tmp[22] & ~_tmp_and_65280_ne_0_,
       p0_tmp[29]
         ? p0_tmp[21] | _tmp_and_65280_ne_0_
         : p0_tmp[21] & ~_tmp_and_65280_ne_0_,
       p0_tmp[28]
         ? p0_tmp[20] | _tmp_and_65280_ne_0_
         : p0_tmp[20] & ~_tmp_and_65280_ne_0_,
       p0_tmp[27]
         ? p0_tmp[19] | _tmp_and_65280_ne_0_
         : p0_tmp[19] & ~_tmp_and_65280_ne_0_,
       p0_tmp[26]
         ? p0_tmp[18] | _tmp_and_65280_ne_0_
         : p0_tmp[18] & ~_tmp_and_65280_ne_0_,
       p0_tmp[25]
         ? p0_tmp[17] | _tmp_and_65280_ne_0_
         : p0_tmp[17] & ~_tmp_and_65280_ne_0_,
       p0_tmp[24]
         ? p0_tmp[16] | _tmp_and_65280_ne_0_
         : p0_tmp[16] & ~_tmp_and_65280_ne_0_,
       p0_tmp[23]
         ? p0_tmp[15] | _tmp_and_65280_ne_0_
         : p0_tmp[15] & ~_tmp_and_65280_ne_0_,
       p0_tmp[22]
         ? p0_tmp[14] | _tmp_and_65280_ne_0_
         : p0_tmp[14] & ~_tmp_and_65280_ne_0_,
       p0_tmp[21]
         ? p0_tmp[13] | _tmp_and_65280_ne_0_
         : p0_tmp[13] & ~_tmp_and_65280_ne_0_,
       p0_tmp[20]
         ? p0_tmp[12] | _tmp_and_65280_ne_0_
         : p0_tmp[12] & ~_tmp_and_65280_ne_0_,
       p0_tmp[19]
         ? p0_tmp[11] | _tmp_and_65280_ne_0_
         : p0_tmp[11] & ~_tmp_and_65280_ne_0_,
       p0_tmp[18]
         ? p0_tmp[10] | _tmp_and_65280_ne_0_
         : p0_tmp[10] & ~_tmp_and_65280_ne_0_,
       p0_tmp[17] ? p0_tmp[9] | _tmp_and_65280_ne_0_ : p0_tmp[9] & ~_tmp_and_65280_ne_0_,
       p0_tmp[16] ? p0_tmp[8] | _tmp_and_65280_ne_0_ : p0_tmp[8] & ~_tmp_and_65280_ne_0_,
       p0_tmp[15] ? p0_tmp[7] | _tmp_and_65280_ne_0_ : p0_tmp[7] & ~_tmp_and_65280_ne_0_,
       p0_tmp[14] ? p0_tmp[6] | _tmp_and_65280_ne_0_ : p0_tmp[6] & ~_tmp_and_65280_ne_0_,
       p0_tmp[13] ? p0_tmp[5] | _tmp_and_65280_ne_0_ : p0_tmp[5] & ~_tmp_and_65280_ne_0_,
       p0_tmp[12] ? p0_tmp[4] | _tmp_and_65280_ne_0_ : p0_tmp[4] & ~_tmp_and_65280_ne_0_,
       p0_tmp[11] ? p0_tmp[3] | _tmp_and_65280_ne_0_ : p0_tmp[3] & ~_tmp_and_65280_ne_0_,
       p0_tmp[10] ? p0_tmp[2] | _tmp_and_65280_ne_0_ : p0_tmp[2] & ~_tmp_and_65280_ne_0_,
       p0_tmp[9] ? p0_tmp[1] | _tmp_and_65280_ne_0_ : p0_tmp[1] & ~_tmp_and_65280_ne_0_,
       p0_tmp[8] ? p0_tmp[0] | _tmp_and_65280_ne_0_ : p0_tmp[0] & ~_tmp_and_65280_ne_0_};	// dequant.k:19:9, :48:{13,17,44,50}
    p0__tmp_and_4294901760_ne_0__1 <= p0__tmp_and_4294901760_ne_0__0;	// dequant.k:19:9
    p0__tmp_and_65280_ne_0_ <= _tmp_and_65280_ne_0_;	// dequant.k:19:9, :48:17
    p0__scaled_lt_0__2 <= p0__scaled_lt_0__1;	// dequant.k:19:9
    if (rst)	// dequant.k:19:9
      p0_stage9_enable <= 1'h0;	// dequant.k:19:9
    else	// dequant.k:19:9
      p0_stage9_enable <= p0_stage8_enable;	// dequant.k:19:9
    p0__tmp_and_4294901760_ne_0__2 <= p0__tmp_and_4294901760_ne_0__1;	// dequant.k:19:9
    p0__tmp_and_65280_ne_0__0 <= p0__tmp_and_65280_ne_0_;	// dequant.k:19:9
    p0__tmp_and_240_ne_0_ <= _tmp_and_240_ne_0_;	// dequant.k:19:9, :49:17
    p0_tmp_1 <=
      {p0_tmp_0[7] ? p0_tmp_0[3] | _tmp_and_240_ne_0_ : p0_tmp_0[3] & ~_tmp_and_240_ne_0_,
       p0_tmp_0[6] ? p0_tmp_0[2] | _tmp_and_240_ne_0_ : p0_tmp_0[2] & ~_tmp_and_240_ne_0_,
       p0_tmp_0[5] ? p0_tmp_0[1] | _tmp_and_240_ne_0_ : p0_tmp_0[1] & ~_tmp_and_240_ne_0_,
       p0_tmp_0[4]
         ? p0_tmp_0[0] | _tmp_and_240_ne_0_
         : p0_tmp_0[0] & ~_tmp_and_240_ne_0_};	// dequant.k:19:9, :49:{13,17,44,50}
    p0__scaled_lt_0__3 <= p0__scaled_lt_0__2;	// dequant.k:19:9
    if (rst)	// dequant.k:19:9
      p0_stage10_enable <= 1'h0;	// dequant.k:19:9
    else	// dequant.k:19:9
      p0_stage10_enable <= p0_stage9_enable;	// dequant.k:19:9
    p0_mag_1 <= data_prop_out_3_0;	// dequant.k:19:9
    p0__pos_minus_23_ <=
      33'({28'h0,
           p0__tmp_and_4294901760_ne_0__2,
           p0__tmp_and_65280_ne_0__0,
           p0__tmp_and_240_ne_0_,
           pos,
           pos_0} - 33'h17);	// dequant.k:19:9, :47:13, :48:{13,67}, :49:{13,67}, :50:{13,17,44,50,67}, :51:{13,17,50}, :59:34, :61:22
    p0__23_minus_pos_ <=
      5'(5'h17
         - {p0__tmp_and_4294901760_ne_0__2,
            p0__tmp_and_65280_ne_0__0,
            p0__tmp_and_240_ne_0_,
            pos,
            pos_0});	// dequant.k:19:9, :47:13, :48:{13,67}, :49:{13,67}, :50:{13,17,44,50,67}, :51:{13,17,50}, :64:36
    p0_pos <=
      {27'h0,
       p0__tmp_and_4294901760_ne_0__2,
       p0__tmp_and_65280_ne_0__0,
       p0__tmp_and_240_ne_0_,
       pos,
       pos_0};	// dequant.k:19:9, :47:13, :48:{13,67}, :49:{13,67}, :50:{13,17,44,50,67}, :51:{13,17,50}
    p0__scaled_lt_0__4 <= p0__scaled_lt_0__3;	// dequant.k:19:9
    p0__127_plus_pos_ <=
      8'({3'h0,
          p0__tmp_and_4294901760_ne_0__2,
          p0__tmp_and_65280_ne_0__0,
          p0__tmp_and_240_ne_0_,
          pos,
          pos_0} + 8'h7F);	// dequant.k:19:9, :47:13, :48:{13,67}, :49:{13,67}, :50:{13,17,44,50,67}, :51:{13,17,50}, :53:30
    if (rst)	// dequant.k:19:9
      p0_stage11_enable <= 1'h0;	// dequant.k:19:9
    else	// dequant.k:19:9
      p0_stage11_enable <= p0_stage10_enable;	// dequant.k:19:9
    p0_pos_0 <= p0_pos;	// dequant.k:19:9
    p0_shifted <= shifted_54;	// dequant.k:19:9, :67:{17,21,56}, :68:{17,21,56}
    p0__23_minus_pos__0 <= p0__23_minus_pos_[0];	// dequant.k:19:9
    p0_mag_2 <= p0_mag_1;	// dequant.k:19:9
    p0__pos_minus_23__0 <= p0__pos_minus_23_;	// dequant.k:19:9
    p0__scaled_lt_0__5 <= p0__scaled_lt_0__4;	// dequant.k:19:9
    p0__mag_ne_0__xor_reduce_reduce <=
      {p0_mag_1[31] | p0_mag_1[30] | p0_mag_1[29] | p0_mag_1[28] | p0_mag_1[27]
         | p0_mag_1[26] | p0_mag_1[25] | p0_mag_1[24] | p0_mag_1[23] | p0_mag_1[22]
         | p0_mag_1[21] | p0_mag_1[20] | p0_mag_1[19] | p0_mag_1[18] | p0_mag_1[17]
         | p0_mag_1[16],
       p0_mag_1[15] | p0_mag_1[14] | p0_mag_1[13] | p0_mag_1[12] | p0_mag_1[11]
         | p0_mag_1[10] | p0_mag_1[9] | p0_mag_1[8] | p0_mag_1[7] | p0_mag_1[6]
         | p0_mag_1[5] | p0_mag_1[4] | p0_mag_1[3] | p0_mag_1[2] | p0_mag_1[1]
         | p0_mag_1[0]};	// dequant.k:19:9, :42:13
    p0__127_plus_pos__0 <= p0__127_plus_pos_;	// dequant.k:19:9
    p0__mag_shr_pos_minus_23_ <= _mag_shr_pos_minus_23_[22:0];	// dequant.k:19:9, :59:27
    if (rst)	// dequant.k:19:9
      p0_stage12_enable <= 1'h0;	// dequant.k:19:9
    else	// dequant.k:19:9
      p0_stage12_enable <= p0_stage11_enable;	// dequant.k:19:9
    p0_super_scale_bf16_0 <= data_prop_out_1_0;	// dequant.k:19:9
    p0_fp_accum <=
      {p0__scaled_lt_0__5 & (|p0__mag_ne_0__xor_reduce_reduce),
       p0__127_plus_pos__0[7] & (|p0__mag_ne_0__xor_reduce_reduce),
       p0__127_plus_pos__0[6] & (|p0__mag_ne_0__xor_reduce_reduce),
       p0__127_plus_pos__0[5] & (|p0__mag_ne_0__xor_reduce_reduce),
       p0__127_plus_pos__0[4] & (|p0__mag_ne_0__xor_reduce_reduce),
       p0__127_plus_pos__0[3] & (|p0__mag_ne_0__xor_reduce_reduce),
       p0__127_plus_pos__0[2] & (|p0__mag_ne_0__xor_reduce_reduce),
       p0__127_plus_pos__0[1] & (|p0__mag_ne_0__xor_reduce_reduce),
       p0__127_plus_pos__0[0] & (|p0__mag_ne_0__xor_reduce_reduce),
       p0__mag_shr_pos_minus_23_[22]
         ? (shifted_31 | _pos_gt_23__diff[32]) & (|p0__mag_ne_0__xor_reduce_reduce)
         : shifted_31 & _GEN_62,
       p0__mag_shr_pos_minus_23_[21]
         ? (shifted_32 | _pos_gt_23__diff[32]) & (|p0__mag_ne_0__xor_reduce_reduce)
         : shifted_32 & _GEN_62,
       p0__mag_shr_pos_minus_23_[20]
         ? (shifted_33 | _pos_gt_23__diff[32]) & (|p0__mag_ne_0__xor_reduce_reduce)
         : shifted_33 & _GEN_62,
       p0__mag_shr_pos_minus_23_[19]
         ? (shifted_34 | _pos_gt_23__diff[32]) & (|p0__mag_ne_0__xor_reduce_reduce)
         : shifted_34 & _GEN_62,
       p0__mag_shr_pos_minus_23_[18]
         ? (shifted_35 | _pos_gt_23__diff[32]) & (|p0__mag_ne_0__xor_reduce_reduce)
         : shifted_35 & _GEN_62,
       p0__mag_shr_pos_minus_23_[17]
         ? (shifted_36 | _pos_gt_23__diff[32]) & (|p0__mag_ne_0__xor_reduce_reduce)
         : shifted_36 & _GEN_62,
       p0__mag_shr_pos_minus_23_[16]
         ? (shifted_37 | _pos_gt_23__diff[32]) & (|p0__mag_ne_0__xor_reduce_reduce)
         : shifted_37 & _GEN_62,
       p0__mag_shr_pos_minus_23_[15]
         ? (shifted_38 | _pos_gt_23__diff[32]) & (|p0__mag_ne_0__xor_reduce_reduce)
         : shifted_38 & _GEN_62,
       p0__mag_shr_pos_minus_23_[14]
         ? (shifted_39 | _pos_gt_23__diff[32]) & (|p0__mag_ne_0__xor_reduce_reduce)
         : shifted_39 & _GEN_62,
       p0__mag_shr_pos_minus_23_[13]
         ? (shifted_40 | _pos_gt_23__diff[32]) & (|p0__mag_ne_0__xor_reduce_reduce)
         : shifted_40 & _GEN_62,
       p0__mag_shr_pos_minus_23_[12]
         ? (shifted_41 | _pos_gt_23__diff[32]) & (|p0__mag_ne_0__xor_reduce_reduce)
         : shifted_41 & _GEN_62,
       p0__mag_shr_pos_minus_23_[11]
         ? (shifted_42 | _pos_gt_23__diff[32]) & (|p0__mag_ne_0__xor_reduce_reduce)
         : shifted_42 & _GEN_62,
       p0__mag_shr_pos_minus_23_[10]
         ? (shifted_43 | _pos_gt_23__diff[32]) & (|p0__mag_ne_0__xor_reduce_reduce)
         : shifted_43 & _GEN_62,
       p0__mag_shr_pos_minus_23_[9]
         ? (shifted_44 | _pos_gt_23__diff[32]) & (|p0__mag_ne_0__xor_reduce_reduce)
         : shifted_44 & _GEN_62,
       p0__mag_shr_pos_minus_23_[8]
         ? (shifted_45 | _pos_gt_23__diff[32]) & (|p0__mag_ne_0__xor_reduce_reduce)
         : shifted_45 & _GEN_62,
       p0__mag_shr_pos_minus_23_[7]
         ? (shifted_46 | _pos_gt_23__diff[32]) & (|p0__mag_ne_0__xor_reduce_reduce)
         : shifted_46 & _GEN_62,
       p0__mag_shr_pos_minus_23_[6]
         ? (shifted_47 | _pos_gt_23__diff[32]) & (|p0__mag_ne_0__xor_reduce_reduce)
         : shifted_47 & _GEN_62,
       p0__mag_shr_pos_minus_23_[5]
         ? (shifted_48 | _pos_gt_23__diff[32]) & (|p0__mag_ne_0__xor_reduce_reduce)
         : shifted_48 & _GEN_62,
       p0__mag_shr_pos_minus_23_[4]
         ? (shifted_49 | _pos_gt_23__diff[32]) & (|p0__mag_ne_0__xor_reduce_reduce)
         : shifted_49 & _GEN_62,
       p0__mag_shr_pos_minus_23_[3]
         ? (shifted_50 | _pos_gt_23__diff[32]) & (|p0__mag_ne_0__xor_reduce_reduce)
         : shifted_50 & _GEN_62,
       p0__mag_shr_pos_minus_23_[2]
         ? (shifted_51 | _pos_gt_23__diff[32]) & (|p0__mag_ne_0__xor_reduce_reduce)
         : shifted_51 & _GEN_62,
       p0__mag_shr_pos_minus_23_[1]
         ? (shifted_52 | _pos_gt_23__diff[32]) & (|p0__mag_ne_0__xor_reduce_reduce)
         : shifted_52 & _GEN_62,
       p0__mag_shr_pos_minus_23_[0]
         ? (shifted_53 | _pos_gt_23__diff[32]) & (|p0__mag_ne_0__xor_reduce_reduce)
         : shifted_53 & _GEN_62};	// dequant.k:19:9, :31:9, :42:{9,13}, :57:{13,17}, :61:{18,22}, :69:{17,21,56}, :71:{13,27}, :73:{24,39,41}
    if (rst)	// dequant.k:19:9
      p0_stage13_enable <= 1'h0;	// dequant.k:19:9
    else	// dequant.k:19:9
      p0_stage13_enable <= p0_stage12_enable;	// dequant.k:19:9
    p0__prod_plus_ma32_shl_5_ <=
      18'({2'h0,
           p0_super_scale_bf16_0[0],
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
           4'h0} + {2'h1, p0_fp_accum[22:12], 5'h0});	// dequant.k:19:9, :77:29, :101:{13,17,44,51}, :102:{44,51}
    p0_CastSource <= {p0_super_scale_bf16_0[6:0], 4'h0};	// dequant.k:19:9, :92:{42,43}
    p0_prod <=
      {p0_super_scale_bf16_0[0],
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
       4'h0};	// dequant.k:19:9, :77:29, :101:{13,17,44,51}
    p0_cast_lt_uint32_gt_ma_ <= p0_fp_accum[22:12];	// dequant.k:19:9, :91:{42,43}, :96:27
    p0__cast_lt_uint32_gt_super_scale_bf16_shl_16_ <= {p0_super_scale_bf16_0, 16'h0};	// dequant.k:19:9, :77:29
    if (rst)	// dequant.k:19:9
      p0_stage14_enable <= 1'h0;	// dequant.k:19:9
    else	// dequant.k:19:9
      p0_stage14_enable <= p0_stage13_enable;	// dequant.k:19:9
    p0__prod_plus_ma32_shl_6_ <=
      19'({1'h0,
           prod_10,
           prod_11,
           prod_12,
           prod_13,
           prod_14,
           prod_15,
           prod_16,
           prod_17,
           prod_18,
           prod_19,
           prod_20,
           prod_21,
           prod_22,
           prod_23,
           prod_24,
           prod_25,
           prod_26,
           prod_27} + {2'h1, p0_cast_lt_uint32_gt_ma_, 6'h0});	// dequant.k:19:9, :102:{13,17}, :103:{44,51}
    p0_CastSource_0 <= p0_CastSource;	// dequant.k:19:9
    p0_prod_0 <=
      {prod_10,
       prod_11,
       prod_12,
       prod_13,
       prod_14,
       prod_15,
       prod_16,
       prod_17,
       prod_18,
       prod_19,
       prod_20,
       prod_21,
       prod_22,
       prod_23,
       prod_24,
       prod_25,
       prod_26,
       prod_27};	// dequant.k:19:9, :102:{13,17}
    p0_cast_lt_uint32_gt_ma__0 <= p0_cast_lt_uint32_gt_ma_;	// dequant.k:19:9
    if (rst)	// dequant.k:19:9
      p0_stage15_enable <= 1'h0;	// dequant.k:19:9
    else	// dequant.k:19:9
      p0_stage15_enable <= p0_stage14_enable;	// dequant.k:19:9
    p0__prod_plus_ma32_shl_7_ <=
      20'({1'h0,
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
           prod_41,
           prod_42,
           prod_43,
           prod_44,
           prod_45,
           prod_46} + {2'h1, p0_cast_lt_uint32_gt_ma__0, 7'h0});	// dequant.k:19:9, :103:{13,17}, :104:{44,51}
    p0_CastSource_1 <= p0_CastSource_0;	// dequant.k:19:9
    p0_prod_1 <=
      {prod_28,
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
       prod_41,
       prod_42,
       prod_43,
       prod_44,
       prod_45,
       prod_46};	// dequant.k:19:9, :103:{13,17}
    p0_cast_lt_uint32_gt_ma__1 <= p0_cast_lt_uint32_gt_ma__0;	// dequant.k:19:9
    if (rst)	// dequant.k:19:9
      p0_stage16_enable <= 1'h0;	// dequant.k:19:9
    else	// dequant.k:19:9
      p0_stage16_enable <= p0_stage15_enable;	// dequant.k:19:9
    p0__prod_plus_ma32_shl_8_ <=
      21'({1'h0,
           prod_47,
           prod_48,
           prod_49,
           prod_50,
           prod_51,
           prod_52,
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
           prod_66} + {2'h1, p0_cast_lt_uint32_gt_ma__1, 8'h0});	// dequant.k:19:9, :104:{13,17}, :105:{44,51}
    p0_CastSource_2 <= p0_CastSource_1;	// dequant.k:19:9
    p0_prod_2 <=
      {prod_47,
       prod_48,
       prod_49,
       prod_50,
       prod_51,
       prod_52,
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
       prod_66};	// dequant.k:19:9, :104:{13,17}
    p0_cast_lt_uint32_gt_ma__2 <= p0_cast_lt_uint32_gt_ma__1;	// dequant.k:19:9
    if (rst)	// dequant.k:19:9
      p0_stage17_enable <= 1'h0;	// dequant.k:19:9
    else	// dequant.k:19:9
      p0_stage17_enable <= p0_stage16_enable;	// dequant.k:19:9
    p0_fp_accum_0 <= data_prop_out_2_0;	// dequant.k:19:9
    p0__cast_lt_uint32_gt_super_scale_bf16_shl_16__0 <= data_prop_out_3_32;	// dequant.k:19:9
    p0__prod_plus_ma32_shl_9_ <=
      22'({1'h0,
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
           prod_78,
           prod_79,
           prod_80,
           prod_81,
           prod_82,
           prod_83,
           prod_84,
           prod_85,
           prod_86,
           prod_87} + {2'h1, p0_cast_lt_uint32_gt_ma__2, 9'h0});	// dequant.k:19:9, :105:{13,17}, :106:{44,51}
    p0_CastSource_3 <= p0_CastSource_2;	// dequant.k:19:9
    p0_prod_3 <=
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
       prod_78,
       prod_79,
       prod_80,
       prod_81,
       prod_82,
       prod_83,
       prod_84,
       prod_85,
       prod_86,
       prod_87};	// dequant.k:19:9, :105:{13,17}
    p0_cast_lt_uint32_gt_ma__3 <= p0_cast_lt_uint32_gt_ma__2;	// dequant.k:19:9
    if (rst)	// dequant.k:19:9
      p0_stage18_enable <= 1'h0;	// dequant.k:19:9
    else	// dequant.k:19:9
      p0_stage18_enable <= p0_stage17_enable;	// dequant.k:19:9
    p0__prod_plus_ma32_shl_10_ <=
      23'({1'h0,
           prod_88,
           prod_89,
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
           prod_109} + {2'h1, p0_cast_lt_uint32_gt_ma__3, 10'h0});	// dequant.k:19:9, :106:{13,17}, :107:{44,51}
    p0_CastSource_4 <= p0_CastSource_3;	// dequant.k:19:9
    p0_prod_4 <=
      {prod_88,
       prod_89,
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
       prod_109};	// dequant.k:19:9, :106:{13,17}
    p0_cast_lt_uint32_gt_ma__4 <= p0_cast_lt_uint32_gt_ma__3;	// dequant.k:19:9
    p0_r_exp <=
      32'({24'h0, p0_fp_accum_0[30:23]}
          + 32'({24'h0, p0__cast_lt_uint32_gt_super_scale_bf16_shl_16__0[30:23]}
                - 32'h7F));	// dequant.k:19:9, :87:{28,34}
    p0__cast_lt_uint32_gt_super_scale_bf16_shl_16__1 <=
      p0__cast_lt_uint32_gt_super_scale_bf16_shl_16__0;	// dequant.k:19:9
    p0_fp_accum_1 <= p0_fp_accum_0;	// dequant.k:19:9
    p0__b_exp_ne_0__xor_reduce <=
      {p0__cast_lt_uint32_gt_super_scale_bf16_shl_16__0[30]
         | p0__cast_lt_uint32_gt_super_scale_bf16_shl_16__0[29]
         | p0__cast_lt_uint32_gt_super_scale_bf16_shl_16__0[28]
         | p0__cast_lt_uint32_gt_super_scale_bf16_shl_16__0[27],
       p0__cast_lt_uint32_gt_super_scale_bf16_shl_16__0[26]
         | p0__cast_lt_uint32_gt_super_scale_bf16_shl_16__0[25]
         | p0__cast_lt_uint32_gt_super_scale_bf16_shl_16__0[24]
         | p0__cast_lt_uint32_gt_super_scale_bf16_shl_16__0[23]};	// dequant.k:19:9, :81:{9,24}, :84:33
    p0__a_exp_ne_0__xor_reduce <=
      {p0_fp_accum_0[30] | p0_fp_accum_0[29] | p0_fp_accum_0[28] | p0_fp_accum_0[27],
       p0_fp_accum_0[26] | p0_fp_accum_0[25] | p0_fp_accum_0[24] | p0_fp_accum_0[23]};	// dequant.k:19:9, :80:{9,24}, :84:19
    if (rst)	// dequant.k:19:9
      p0_stage19_enable <= 1'h0;	// dequant.k:19:9
    else	// dequant.k:19:9
      p0_stage19_enable <= p0_stage18_enable;	// dequant.k:19:9
    p0_r_exp_0 <= p0_r_exp[8:0];	// dequant.k:19:9
    p0__cast_lt_uint32_gt_super_scale_bf16_shl_16__2 <=
      p0__cast_lt_uint32_gt_super_scale_bf16_shl_16__1;	// dequant.k:19:9
    p0_fp_accum_2 <= p0_fp_accum_1;	// dequant.k:19:9
    p0__r_exp_lt_255__diff <= 33'({1'h0, p0_r_exp} - 33'hFF);	// dequant.k:19:9, :121:37
    p0__r_exp_ne_0__xor_reduce_reduce <=
      {p0_r_exp[31] | p0_r_exp[30] | p0_r_exp[29] | p0_r_exp[28] | p0_r_exp[27]
         | p0_r_exp[26] | p0_r_exp[25] | p0_r_exp[24] | p0_r_exp[23] | p0_r_exp[22]
         | p0_r_exp[21] | p0_r_exp[20] | p0_r_exp[19] | p0_r_exp[18] | p0_r_exp[17]
         | p0_r_exp[16],
       p0_r_exp[15] | p0_r_exp[14] | p0_r_exp[13] | p0_r_exp[12] | p0_r_exp[11]
         | p0_r_exp[10] | p0_r_exp[9] | p0_r_exp[8] | p0_r_exp[7] | p0_r_exp[6]
         | p0_r_exp[5] | p0_r_exp[4] | p0_r_exp[3] | p0_r_exp[2] | p0_r_exp[1]
         | p0_r_exp[0]};	// dequant.k:19:9, :121:23
    p0__prod_plus_ma32_shl_11_ <=
      23'({p0__prod_plus_ma32_shl_10_[22] & p0_CastSource_4[10],
           p0__prod_plus_ma32_shl_10_[21]
             ? p0_prod_4[21] | p0_CastSource_4[10]
             : p0_prod_4[21] & ~(p0_CastSource_4[10]),
           p0__prod_plus_ma32_shl_10_[20]
             ? p0_prod_4[20] | p0_CastSource_4[10]
             : p0_prod_4[20] & ~(p0_CastSource_4[10]),
           p0__prod_plus_ma32_shl_10_[19]
             ? p0_prod_4[19] | p0_CastSource_4[10]
             : p0_prod_4[19] & ~(p0_CastSource_4[10]),
           p0__prod_plus_ma32_shl_10_[18]
             ? p0_prod_4[18] | p0_CastSource_4[10]
             : p0_prod_4[18] & ~(p0_CastSource_4[10]),
           p0__prod_plus_ma32_shl_10_[17]
             ? p0_prod_4[17] | p0_CastSource_4[10]
             : p0_prod_4[17] & ~(p0_CastSource_4[10]),
           p0__prod_plus_ma32_shl_10_[16]
             ? p0_prod_4[16] | p0_CastSource_4[10]
             : p0_prod_4[16] & ~(p0_CastSource_4[10]),
           p0__prod_plus_ma32_shl_10_[15]
             ? p0_prod_4[15] | p0_CastSource_4[10]
             : p0_prod_4[15] & ~(p0_CastSource_4[10]),
           p0__prod_plus_ma32_shl_10_[14]
             ? p0_prod_4[14] | p0_CastSource_4[10]
             : p0_prod_4[14] & ~(p0_CastSource_4[10]),
           p0__prod_plus_ma32_shl_10_[13]
             ? p0_prod_4[13] | p0_CastSource_4[10]
             : p0_prod_4[13] & ~(p0_CastSource_4[10]),
           p0__prod_plus_ma32_shl_10_[12]
             ? p0_prod_4[12] | p0_CastSource_4[10]
             : p0_prod_4[12] & ~(p0_CastSource_4[10]),
           p0__prod_plus_ma32_shl_10_[11]
             ? p0_prod_4[11] | p0_CastSource_4[10]
             : p0_prod_4[11] & ~(p0_CastSource_4[10]),
           p0__prod_plus_ma32_shl_10_[10]
             ? p0_prod_4[10] | p0_CastSource_4[10]
             : p0_prod_4[10] & ~(p0_CastSource_4[10]),
           p0__prod_plus_ma32_shl_10_[9]
             ? p0_prod_4[9] | p0_CastSource_4[10]
             : p0_prod_4[9] & ~(p0_CastSource_4[10]),
           p0__prod_plus_ma32_shl_10_[8]
             ? p0_prod_4[8] | p0_CastSource_4[10]
             : p0_prod_4[8] & ~(p0_CastSource_4[10]),
           p0__prod_plus_ma32_shl_10_[7]
             ? p0_prod_4[7] | p0_CastSource_4[10]
             : p0_prod_4[7] & ~(p0_CastSource_4[10]),
           p0__prod_plus_ma32_shl_10_[6]
             ? p0_prod_4[6] | p0_CastSource_4[10]
             : p0_prod_4[6] & ~(p0_CastSource_4[10]),
           p0__prod_plus_ma32_shl_10_[5]
             ? p0_prod_4[5] | p0_CastSource_4[10]
             : p0_prod_4[5] & ~(p0_CastSource_4[10]),
           p0__prod_plus_ma32_shl_10_[4]
             ? p0_prod_4[4] | p0_CastSource_4[10]
             : p0_prod_4[4] & ~(p0_CastSource_4[10]),
           p0__prod_plus_ma32_shl_10_[3]
             ? p0_prod_4[3] | p0_CastSource_4[10]
             : p0_prod_4[3] & ~(p0_CastSource_4[10]),
           p0__prod_plus_ma32_shl_10_[2]
             ? p0_prod_4[2] | p0_CastSource_4[10]
             : p0_prod_4[2] & ~(p0_CastSource_4[10]),
           p0__prod_plus_ma32_shl_10_[1]
             ? p0_prod_4[1] | p0_CastSource_4[10]
             : p0_prod_4[1] & ~(p0_CastSource_4[10]),
           p0__prod_plus_ma32_shl_10_[0]
             ? p0_prod_4[0] | p0_CastSource_4[10]
             : p0_prod_4[0] & ~(p0_CastSource_4[10])}
          + {1'h1, p0_cast_lt_uint32_gt_ma__4, 11'h0});	// dequant.k:19:9, :107:{13,17}, :108:{44,51}
    p0__b_exp_ne_0__xor_reduce_0 <= p0__b_exp_ne_0__xor_reduce;	// dequant.k:19:9
    p0__a_exp_ne_0__xor_reduce_0 <= p0__a_exp_ne_0__xor_reduce;	// dequant.k:19:9
    if (rst)	// dequant.k:19:9
      p0_stage20_enable <= 1'h0;	// dequant.k:19:9
    else	// dequant.k:19:9
      p0_stage20_enable <= p0_stage19_enable;	// dequant.k:19:9
    p0_result <= result;	// dequant.k:19:9, :84:{9,13,19,33}
    if (rst)	// dequant.k:19:9
      p0_stage21_enable <= 1'h0;	// dequant.k:19:9
    else	// dequant.k:19:9
      p0_stage21_enable <= p0_stage20_enable;	// dequant.k:19:9
  end // always @(posedge)
  always_comb begin	// dequant.k:19:9
    fifo_wren_0_0 = p0_stage21_enable;	// dequant.k:14:5, :19:9
    fifo_data_out_0_0 = p0_result;	// dequant.k:14:5, :19:9
  end // always_comb
  KanagawaFixedDelayFifo #(
    .WIDTH(64),
    .DELAY(2),
    .USE_LUTRAM(1),
    .DEVICE_FAMILY("mock"),
    .USE_DSP(0)
  ) delay_fifo_3_dequantize_Propagation (	// dequant.k:19:9
    .clk      (clk),	// dequant.k:19:9
    .rst      (rst),	// dequant.k:19:9
    .data_in  ({data_prop_in_3_32, data_prop_in_3_0}),	// dequant.k:19:9
    .data_out (_delay_fifo_3_dequantize_Propagation_data_out)
  );	// dequant.k:19:9
  KanagawaFixedDelayFifo #(
    .WIDTH(32),
    .DELAY(3),
    .USE_LUTRAM(1),
    .DEVICE_FAMILY("mock"),
    .USE_DSP(0)
  ) delay_fifo_2_dequantize_Propagation (	// dequant.k:19:9
    .clk      (clk),	// dequant.k:19:9
    .rst      (rst),	// dequant.k:19:9
    .data_in  (data_prop_in_2_0),	// dequant.k:19:9
    .data_out (data_prop_out_2_0)
  );	// dequant.k:19:9
  KanagawaFixedDelayFifo #(
    .WIDTH(16),
    .DELAY(10),
    .USE_LUTRAM(1),
    .DEVICE_FAMILY("mock"),
    .USE_DSP(0)
  ) delay_fifo_1_dequantize_Propagation (	// dequant.k:19:9
    .clk      (clk),	// dequant.k:19:9
    .rst      (rst),	// dequant.k:19:9
    .data_in  (data_prop_in_1_0),	// dequant.k:19:9
    .data_out (data_prop_out_1_0)
  );	// dequant.k:19:9
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
    ._ReturnValue (p0_stage20_enable ? result : 'x),	// dequant.k:14:5, :19:9, :84:{9,13,19,33}
    .valid        (p0_stage20_enable),	// dequant.k:19:9
    .valid_out    (/* unused */)
  );	// dequant.k:14:5
  assign done_out = p0_stage21_enable;	// dequant.k:19:9
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
  } passthrough_data_4;
  assign passthrough_data_4.underflow = 1'b0;
  assign passthrough_data_4.rdy_ext = passthrough_data_4.rdy_int & !(!has_startup_completed_delayed_0);
  assign dequantize_rdy_out_net = passthrough_data_4.rdy_ext;
  assign passthrough_data_4.valid = dequantize_rdy_out & dequantize_valid_in;
  assign passthrough_data_4.data = { dequantize_sub_scale_in, dequantize_super_scale_bf16_in, dequantize_accum_in };
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
    passthrough_data_4.rdy_int = _dequantize_BasicBlock_0Impl_input_rdy_0;	// dequant.k:19:9
  end // always_comb

  assign has_startup_completed_raw = 1'b1;
  assign stall_rate_supported_out_net = 1'b0;
  KanagawaResetControl #(
    .WIDTH(2),
    .DELAY_CYCLES(3),
    .FAN_OUT_LEVELS(1),
    .HOLD_CYCLES(48),
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
    .DEPTH(64),
    .ALMOSTFULL_ENTRIES(22),
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
    .data_in_4                 (passthrough_data_4.data),	// dequant.k:19:9
    .input_fifo_underflow_0    (passthrough_data_4.underflow),	// dequant.k:19:9
    .input_rdy_0               (_dequantize_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_4.valid),	// dequant.k:19:9
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

