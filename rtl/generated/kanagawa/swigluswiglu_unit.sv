
// This file was generated. Do not modify.
// kanagawa --backend=sv --import-dir=/home/mana/workspace/OpenTaalas/third-party/kanagawa/library --base-library=/home/mana/workspace/OpenTaalas/third-party/kanagawa/library/mini-base.k --output=/home/mana/workspace/OpenTaalas/rtl/generated/kanagawa/swiglu --frequency=250 --register-ratio=8 --max-register-ratio=16 /home/mana/workspace/OpenTaalas/rtl/kanagawa/swiglu.k

`default_nettype wire
module swiglu_unitDebugView_set_sigmoid_lutEntry
(
    input wire clk,
    input wire[7:0]  _index,
    input wire[15:0]  _value,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("set_sigmoid_lutEntry time: %0t index: %p value: %p", $time, _index, _value);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module swiglu_unitDebugView_lookup_sigmoidEntry
(
    input wire clk,
    input wire[7:0]  _index,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("lookup_sigmoidEntry time: %0t index: %p", $time, _index);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module swiglu_unitDebugView_lookup_sigmoidExit
(
    input wire clk,
    input wire[15:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("lookup_sigmoidExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module swiglu_unitDebugView_compute_siluEntry
(
    input wire clk,
    input wire[15:0]  _gate_bf16,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("compute_siluEntry time: %0t gate_bf16: %p", $time, _gate_bf16);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module swiglu_unitDebugView_compute_siluExit
(
    input wire clk,
    input wire[15:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("compute_siluExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module swiglu_unitDebugView_compute_swigluEntry
(
    input wire clk,
    input wire[15:0]  _gate_bf16,
    input wire[15:0]  _up_bf16,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("compute_swigluEntry time: %0t gate_bf16: %p up_bf16: %p", $time, _gate_bf16, _up_bf16);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module swiglu_unitDebugView_compute_swigluExit
(
    input wire clk,
    input wire[15:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("compute_swigluExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
`ifndef _TYPESCOPE_CoreModuleTypeScope
`define _TYPESCOPE_CoreModuleTypeScope
`endif // _TYPESCOPE_CoreModuleTypeScope
module swiglu_unit_compute_swiglu_BasicBlock_0(	// swiglu.k:101:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  input  wire [15:0] memory_read_data_in_9_2,
  output wire [7:0]  memory_read_addr_out_9_2,
  output wire        memory_rden_out_9_2,
  output wire [15:0] fifo_data_out_0,
  output wire        fifo_wren_0,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [31:0] data_in_8,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  wire  [15:0] memory_read_data_in_9_2_0 = memory_read_data_in_9_2;	// swiglu.k:101:9
  logic [15:0] data_prop_in_7_0;	// swiglu.k:101:9
  wire  [15:0] data_prop_out_7_0;	// swiglu.k:101:9
  logic        done_out_0;	// swiglu.k:101:9
  logic [7:0]  memory_read_addr_out_9_2_0;	// swiglu.k:101:9
  logic        memory_rden_out_9_2_0;	// swiglu.k:101:9
  logic [15:0] fifo_data_out_0_0;	// swiglu.k:101:9
  logic        fifo_wren_0_0;	// swiglu.k:101:9
  logic        input_rdy_0_0;	// swiglu.k:101:9
  logic [7:0]  control_state_out_0;	// swiglu.k:101:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// swiglu.k:101:9
  always_comb begin	// swiglu.k:101:9
    input_rdy_0_0 = _GEN;	// swiglu.k:101:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// swiglu.k:101:9
  end // always_comb
  reg   [15:0] p0_gate_bf16;	// swiglu.k:101:9
  reg   [15:0] p0_up_bf16;	// swiglu.k:101:9
  reg          p0_stage1_enable = 1'h0;	// swiglu.k:101:9
  always_comb begin	// swiglu.k:101:9
    memory_read_addr_out_9_2_0 = p0_gate_bf16[15:8];	// swiglu.k:101:9, :105:39, :106:26
    memory_rden_out_9_2_0 = p0_stage1_enable;	// swiglu.k:101:9, :106:26
  end // always_comb
  reg   [15:0] p0_gate_bf16_0;	// swiglu.k:101:9
  reg   [15:0] p0_up_bf16_0;	// swiglu.k:101:9
  reg          p0_stage2_enable = 1'h0;	// swiglu.k:101:9
  reg   [15:0] p0_gate_bf16_1;	// swiglu.k:101:9
  reg   [15:0] p0_up_bf16_1;	// swiglu.k:101:9
  reg          p0_stage3_enable = 1'h0;	// swiglu.k:101:9
  always_comb	// swiglu.k:101:9
    data_prop_in_7_0 = p0_up_bf16_1;	// swiglu.k:101:9
  reg   [12:0] p0__prod_plus_ma32_shl_4_;	// swiglu.k:101:9
  reg   [5:0]  p0_mb;	// swiglu.k:101:9
  reg   [11:0] p0_prod;	// swiglu.k:101:9
  reg   [13:0] p0__ma32_shl_5_;	// swiglu.k:101:9
  reg   [14:0] p0__ma32_shl_6_;	// swiglu.k:101:9
  reg          p0_mb_0;	// swiglu.k:101:9
  reg   [15:0] p0__ma32_shl_7_;	// swiglu.k:101:9
  reg   [15:0] p0__a_exp_plus_b_exp_minus_127_plus_1_;	// swiglu.k:101:9
  reg   [15:0] p0__a_exp_plus_b_exp_minus_127_;	// swiglu.k:101:9
  reg   [15:0] p0_memory_read_data_in_9_2;	// swiglu.k:101:9
  reg   [15:0] p0_gate_bf16_2;	// swiglu.k:101:9
  reg          p0__b_exp_ne_0_;	// swiglu.k:101:9
  reg          p0__a_exp_ne_0_;	// swiglu.k:101:9
  reg   [5:0]  p0_mb_1;	// swiglu.k:101:9
  reg   [15:0] p0_b_exp;	// swiglu.k:101:9
  reg          p0_mb_2;	// swiglu.k:101:9
  reg          p0__b_exp_ne_0__0;	// swiglu.k:101:9
  reg          p0_stage4_enable = 1'h0;	// swiglu.k:101:9
  reg          p0_prod_0;	// swiglu.k:101:9
  reg   [15:0] p0__a_exp_plus_b_exp_minus_127_plus_1__0;	// swiglu.k:101:9
  reg   [15:0] p0__a_exp_plus_b_exp_minus_127__0;	// swiglu.k:101:9
  reg   [15:0] p0_memory_read_data_in_9_2_0;	// swiglu.k:101:9
  reg   [15:0] p0_gate_bf16_3;	// swiglu.k:101:9
  reg   [14:0] p0_prod_1;	// swiglu.k:101:9
  reg          p0__b_exp_ne_0__1;	// swiglu.k:101:9
  reg          p0__a_exp_ne_0__0;	// swiglu.k:101:9
  reg   [5:0]  p0_mb_3;	// swiglu.k:101:9
  reg   [15:0] p0_b_exp_0;	// swiglu.k:101:9
  reg          p0_mb_4;	// swiglu.k:101:9
  reg          p0__b_exp_ne_0__2;	// swiglu.k:101:9
  reg          p0_stage5_enable = 1'h0;	// swiglu.k:101:9
  reg   [10:0] p0__prod_plus_ma32_shl_2_;	// swiglu.k:101:9
  reg   [5:0]  p0_mb_5;	// swiglu.k:101:9
  reg   [9:0]  p0_prod_2;	// swiglu.k:101:9
  reg   [11:0] p0__ma32_shl_3_;	// swiglu.k:101:9
  reg   [12:0] p0__ma32_shl_4_;	// swiglu.k:101:9
  reg   [13:0] p0__ma32_shl_5__0;	// swiglu.k:101:9
  reg   [14:0] p0__ma32_shl_6__0;	// swiglu.k:101:9
  reg          p0_mb_6;	// swiglu.k:101:9
  reg   [15:0] p0__ma32_shl_7__0;	// swiglu.k:101:9
  reg   [15:0] p0__a_exp_plus_b_exp_minus_127_plus_1__1;	// swiglu.k:101:9
  reg   [15:0] p0__a_exp_plus_b_exp_minus_127__1;	// swiglu.k:101:9
  reg   [15:0] p0_silu;	// swiglu.k:101:9
  reg          p0__b_exp_ne_0__3;	// swiglu.k:101:9
  reg          p0__a_exp_ne_0__1;	// swiglu.k:101:9
  reg          p0_stage6_enable = 1'h0;	// swiglu.k:101:9
  reg   [14:0] p0__prod_plus_ma32_shl_6_;	// swiglu.k:101:9
  reg          p0_mb_7;	// swiglu.k:101:9
  reg   [13:0] p0_prod_3;	// swiglu.k:101:9
  reg   [15:0] p0__ma32_shl_7__1;	// swiglu.k:101:9
  reg   [15:0] p0__a_exp_plus_b_exp_minus_127_plus_1__2;	// swiglu.k:101:9
  reg   [15:0] p0__a_exp_plus_b_exp_minus_127__2;	// swiglu.k:101:9
  reg   [15:0] p0_up_bf16_2;	// swiglu.k:101:9
  reg   [15:0] p0_silu_0;	// swiglu.k:101:9
  reg          p0__b_exp_ne_0__4;	// swiglu.k:101:9
  reg          p0__a_exp_ne_0__2;	// swiglu.k:101:9
  reg          p0_stage7_enable = 1'h0;	// swiglu.k:101:9
  reg   [15:0] p0_result;	// swiglu.k:101:9
  reg          p0_stage8_enable = 1'h0;	// swiglu.k:101:9
  reg   [15:0] p0_result_0;	// swiglu.k:101:9
  reg          p0_stage9_enable = 1'h0;	// swiglu.k:101:9
  reg   [15:0] p0_result_1;	// swiglu.k:101:9
  reg          p0_stage10_enable = 1'h0;	// swiglu.k:101:9
  reg   [15:0] p0_result_2;	// swiglu.k:101:9
  reg          p0_stage11_enable = 1'h0;	// swiglu.k:101:9
  wire         prod = p0_gate_bf16_1[6] & memory_read_data_in_9_2_0[0];	// swiglu.k:101:9, :116:{21,33}, :117:{21,33}, :119:35, :120:{21,25}
  wire         prod_0 = p0_gate_bf16_1[5] & memory_read_data_in_9_2_0[0];	// swiglu.k:101:9, :116:{21,33}, :117:{21,33}, :119:35, :120:{21,25}
  wire         prod_1 = p0_gate_bf16_1[4] & memory_read_data_in_9_2_0[0];	// swiglu.k:101:9, :116:{21,33}, :117:{21,33}, :119:35, :120:{21,25}
  wire         prod_2 = p0_gate_bf16_1[3] & memory_read_data_in_9_2_0[0];	// swiglu.k:101:9, :116:{21,33}, :117:{21,33}, :119:35, :120:{21,25}
  wire         prod_3 = p0_gate_bf16_1[2] & memory_read_data_in_9_2_0[0];	// swiglu.k:101:9, :116:{21,33}, :117:{21,33}, :119:35, :120:{21,25}
  wire         prod_4 = p0_gate_bf16_1[1] & memory_read_data_in_9_2_0[0];	// swiglu.k:101:9, :116:{21,33}, :117:{21,33}, :119:35, :120:{21,25}
  wire         prod_5 = p0_gate_bf16_1[0] & memory_read_data_in_9_2_0[0];	// swiglu.k:101:9, :116:{21,33}, :117:{21,33}, :119:35, :120:{21,25}
  wire  [15:0] _a_exp_plus_b_exp_ =
    16'({8'h0, p0_gate_bf16_1[14:7]} + {8'h0, memory_read_data_in_9_2_0[14:7]});	// swiglu.k:101:9, :133:39, :138:39
  wire  [9:0]  _prod_plus_ma32_shl_1_ =
    10'({2'h0,
         memory_read_data_in_9_2_0[0],
         prod,
         prod_0,
         prod_1,
         prod_2,
         prod_3,
         prod_4,
         prod_5} + {2'h1, p0_gate_bf16_1[6:0], 1'h0});	// swiglu.k:101:9, :117:{21,33}, :120:{21,25}, :121:{51,58}
  wire         prod_6 = _prod_plus_ma32_shl_1_[9] & memory_read_data_in_9_2_0[1];	// swiglu.k:101:9, :117:{21,33}, :121:{21,25,51}
  wire         prod_7 = _prod_plus_ma32_shl_1_[8] & memory_read_data_in_9_2_0[1];	// swiglu.k:101:9, :117:{21,33}, :121:{21,25,51}
  wire         prod_8 =
    _prod_plus_ma32_shl_1_[7]
      ? memory_read_data_in_9_2_0[0] | memory_read_data_in_9_2_0[1]
      : memory_read_data_in_9_2_0[0] & ~(memory_read_data_in_9_2_0[1]);	// swiglu.k:101:9, :117:{21,33}, :121:{21,25,51}
  wire         prod_9 =
    _prod_plus_ma32_shl_1_[6]
      ? prod | memory_read_data_in_9_2_0[1]
      : prod & ~(memory_read_data_in_9_2_0[1]);	// swiglu.k:101:9, :117:{21,33}, :120:{21,25}, :121:{21,25,51}
  wire         prod_10 =
    _prod_plus_ma32_shl_1_[5]
      ? prod_0 | memory_read_data_in_9_2_0[1]
      : prod_0 & ~(memory_read_data_in_9_2_0[1]);	// swiglu.k:101:9, :117:{21,33}, :120:{21,25}, :121:{21,25,51}
  wire         prod_11 =
    _prod_plus_ma32_shl_1_[4]
      ? prod_1 | memory_read_data_in_9_2_0[1]
      : prod_1 & ~(memory_read_data_in_9_2_0[1]);	// swiglu.k:101:9, :117:{21,33}, :120:{21,25}, :121:{21,25,51}
  wire         prod_12 =
    _prod_plus_ma32_shl_1_[3]
      ? prod_2 | memory_read_data_in_9_2_0[1]
      : prod_2 & ~(memory_read_data_in_9_2_0[1]);	// swiglu.k:101:9, :117:{21,33}, :120:{21,25}, :121:{21,25,51}
  wire         prod_13 =
    _prod_plus_ma32_shl_1_[2]
      ? prod_3 | memory_read_data_in_9_2_0[1]
      : prod_3 & ~(memory_read_data_in_9_2_0[1]);	// swiglu.k:101:9, :117:{21,33}, :120:{21,25}, :121:{21,25,51}
  wire         prod_14 =
    _prod_plus_ma32_shl_1_[1]
      ? prod_4 | memory_read_data_in_9_2_0[1]
      : prod_4 & ~(memory_read_data_in_9_2_0[1]);	// swiglu.k:101:9, :117:{21,33}, :120:{21,25}, :121:{21,25,51}
  wire         prod_15 =
    _prod_plus_ma32_shl_1_[0]
      ? prod_5 | memory_read_data_in_9_2_0[1]
      : prod_5 & ~(memory_read_data_in_9_2_0[1]);	// swiglu.k:101:9, :117:{21,33}, :120:{21,25}, :121:{21,25,51}
  wire  [10:0] _prod_plus_ma32_shl_2_ =
    11'({1'h0,
         prod_6,
         prod_7,
         prod_8,
         prod_9,
         prod_10,
         prod_11,
         prod_12,
         prod_13,
         prod_14,
         prod_15} + {2'h1, p0_gate_bf16_1[6:0], 2'h0});	// swiglu.k:101:9, :121:{21,25}, :122:{51,58}
  wire         prod_16 = _prod_plus_ma32_shl_2_[10] & memory_read_data_in_9_2_0[2];	// swiglu.k:101:9, :117:{21,33}, :122:{21,25,51}
  wire         prod_17 =
    _prod_plus_ma32_shl_2_[9]
      ? prod_6 | memory_read_data_in_9_2_0[2]
      : prod_6 & ~(memory_read_data_in_9_2_0[2]);	// swiglu.k:101:9, :117:{21,33}, :121:{21,25}, :122:{21,25,51}
  wire         prod_18 =
    _prod_plus_ma32_shl_2_[8]
      ? prod_7 | memory_read_data_in_9_2_0[2]
      : prod_7 & ~(memory_read_data_in_9_2_0[2]);	// swiglu.k:101:9, :117:{21,33}, :121:{21,25}, :122:{21,25,51}
  wire         prod_19 =
    _prod_plus_ma32_shl_2_[7]
      ? prod_8 | memory_read_data_in_9_2_0[2]
      : prod_8 & ~(memory_read_data_in_9_2_0[2]);	// swiglu.k:101:9, :117:{21,33}, :121:{21,25}, :122:{21,25,51}
  wire         prod_20 =
    _prod_plus_ma32_shl_2_[6]
      ? prod_9 | memory_read_data_in_9_2_0[2]
      : prod_9 & ~(memory_read_data_in_9_2_0[2]);	// swiglu.k:101:9, :117:{21,33}, :121:{21,25}, :122:{21,25,51}
  wire         prod_21 =
    _prod_plus_ma32_shl_2_[5]
      ? prod_10 | memory_read_data_in_9_2_0[2]
      : prod_10 & ~(memory_read_data_in_9_2_0[2]);	// swiglu.k:101:9, :117:{21,33}, :121:{21,25}, :122:{21,25,51}
  wire         prod_22 =
    _prod_plus_ma32_shl_2_[4]
      ? prod_11 | memory_read_data_in_9_2_0[2]
      : prod_11 & ~(memory_read_data_in_9_2_0[2]);	// swiglu.k:101:9, :117:{21,33}, :121:{21,25}, :122:{21,25,51}
  wire         prod_23 =
    _prod_plus_ma32_shl_2_[3]
      ? prod_12 | memory_read_data_in_9_2_0[2]
      : prod_12 & ~(memory_read_data_in_9_2_0[2]);	// swiglu.k:101:9, :117:{21,33}, :121:{21,25}, :122:{21,25,51}
  wire         prod_24 =
    _prod_plus_ma32_shl_2_[2]
      ? prod_13 | memory_read_data_in_9_2_0[2]
      : prod_13 & ~(memory_read_data_in_9_2_0[2]);	// swiglu.k:101:9, :117:{21,33}, :121:{21,25}, :122:{21,25,51}
  wire         prod_25 =
    _prod_plus_ma32_shl_2_[1]
      ? prod_14 | memory_read_data_in_9_2_0[2]
      : prod_14 & ~(memory_read_data_in_9_2_0[2]);	// swiglu.k:101:9, :117:{21,33}, :121:{21,25}, :122:{21,25,51}
  wire         prod_26 =
    _prod_plus_ma32_shl_2_[0]
      ? prod_15 | memory_read_data_in_9_2_0[2]
      : prod_15 & ~(memory_read_data_in_9_2_0[2]);	// swiglu.k:101:9, :117:{21,33}, :121:{21,25}, :122:{21,25,51}
  wire  [11:0] _prod_plus_ma32_shl_3_ =
    12'({1'h0,
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
         prod_26} + {2'h1, p0_gate_bf16_1[6:0], 3'h0});	// swiglu.k:101:9, :122:{21,25}, :123:{51,58}
  wire         prod_27 = _prod_plus_ma32_shl_3_[11] & memory_read_data_in_9_2_0[3];	// swiglu.k:101:9, :117:{21,33}, :123:{21,25,51}
  wire         prod_28 =
    _prod_plus_ma32_shl_3_[10]
      ? prod_16 | memory_read_data_in_9_2_0[3]
      : prod_16 & ~(memory_read_data_in_9_2_0[3]);	// swiglu.k:101:9, :117:{21,33}, :122:{21,25}, :123:{21,25,51}
  wire         prod_29 =
    _prod_plus_ma32_shl_3_[9]
      ? prod_17 | memory_read_data_in_9_2_0[3]
      : prod_17 & ~(memory_read_data_in_9_2_0[3]);	// swiglu.k:101:9, :117:{21,33}, :122:{21,25}, :123:{21,25,51}
  wire         prod_30 =
    _prod_plus_ma32_shl_3_[8]
      ? prod_18 | memory_read_data_in_9_2_0[3]
      : prod_18 & ~(memory_read_data_in_9_2_0[3]);	// swiglu.k:101:9, :117:{21,33}, :122:{21,25}, :123:{21,25,51}
  wire         prod_31 =
    _prod_plus_ma32_shl_3_[7]
      ? prod_19 | memory_read_data_in_9_2_0[3]
      : prod_19 & ~(memory_read_data_in_9_2_0[3]);	// swiglu.k:101:9, :117:{21,33}, :122:{21,25}, :123:{21,25,51}
  wire         prod_32 =
    _prod_plus_ma32_shl_3_[6]
      ? prod_20 | memory_read_data_in_9_2_0[3]
      : prod_20 & ~(memory_read_data_in_9_2_0[3]);	// swiglu.k:101:9, :117:{21,33}, :122:{21,25}, :123:{21,25,51}
  wire         prod_33 =
    _prod_plus_ma32_shl_3_[5]
      ? prod_21 | memory_read_data_in_9_2_0[3]
      : prod_21 & ~(memory_read_data_in_9_2_0[3]);	// swiglu.k:101:9, :117:{21,33}, :122:{21,25}, :123:{21,25,51}
  wire         prod_34 =
    _prod_plus_ma32_shl_3_[4]
      ? prod_22 | memory_read_data_in_9_2_0[3]
      : prod_22 & ~(memory_read_data_in_9_2_0[3]);	// swiglu.k:101:9, :117:{21,33}, :122:{21,25}, :123:{21,25,51}
  wire         prod_35 =
    _prod_plus_ma32_shl_3_[3]
      ? prod_23 | memory_read_data_in_9_2_0[3]
      : prod_23 & ~(memory_read_data_in_9_2_0[3]);	// swiglu.k:101:9, :117:{21,33}, :122:{21,25}, :123:{21,25,51}
  wire         prod_36 =
    _prod_plus_ma32_shl_3_[2]
      ? prod_24 | memory_read_data_in_9_2_0[3]
      : prod_24 & ~(memory_read_data_in_9_2_0[3]);	// swiglu.k:101:9, :117:{21,33}, :122:{21,25}, :123:{21,25,51}
  wire         prod_37 =
    _prod_plus_ma32_shl_3_[1]
      ? prod_25 | memory_read_data_in_9_2_0[3]
      : prod_25 & ~(memory_read_data_in_9_2_0[3]);	// swiglu.k:101:9, :117:{21,33}, :122:{21,25}, :123:{21,25,51}
  wire         prod_38 =
    _prod_plus_ma32_shl_3_[0]
      ? prod_26 | memory_read_data_in_9_2_0[3]
      : prod_26 & ~(memory_read_data_in_9_2_0[3]);	// swiglu.k:101:9, :117:{21,33}, :122:{21,25}, :123:{21,25,51}
  wire         prod_39 = p0__prod_plus_ma32_shl_4_[12] & p0_mb[4];	// swiglu.k:101:9, :124:{21,25}
  wire         prod_40 =
    p0__prod_plus_ma32_shl_4_[11] ? p0_prod[11] | p0_mb[4] : p0_prod[11] & ~(p0_mb[4]);	// swiglu.k:101:9, :124:{21,25}
  wire         prod_41 =
    p0__prod_plus_ma32_shl_4_[10] ? p0_prod[10] | p0_mb[4] : p0_prod[10] & ~(p0_mb[4]);	// swiglu.k:101:9, :124:{21,25}
  wire         prod_42 =
    p0__prod_plus_ma32_shl_4_[9] ? p0_prod[9] | p0_mb[4] : p0_prod[9] & ~(p0_mb[4]);	// swiglu.k:101:9, :124:{21,25}
  wire         prod_43 =
    p0__prod_plus_ma32_shl_4_[8] ? p0_prod[8] | p0_mb[4] : p0_prod[8] & ~(p0_mb[4]);	// swiglu.k:101:9, :124:{21,25}
  wire         prod_44 =
    p0__prod_plus_ma32_shl_4_[7] ? p0_prod[7] | p0_mb[4] : p0_prod[7] & ~(p0_mb[4]);	// swiglu.k:101:9, :124:{21,25}
  wire         prod_45 =
    p0__prod_plus_ma32_shl_4_[6] ? p0_prod[6] | p0_mb[4] : p0_prod[6] & ~(p0_mb[4]);	// swiglu.k:101:9, :124:{21,25}
  wire         prod_46 =
    p0__prod_plus_ma32_shl_4_[5] ? p0_prod[5] | p0_mb[4] : p0_prod[5] & ~(p0_mb[4]);	// swiglu.k:101:9, :124:{21,25}
  wire         prod_47 =
    p0__prod_plus_ma32_shl_4_[4] ? p0_prod[4] | p0_mb[4] : p0_prod[4] & ~(p0_mb[4]);	// swiglu.k:101:9, :124:{21,25}
  wire         prod_48 =
    p0__prod_plus_ma32_shl_4_[3] ? p0_prod[3] | p0_mb[4] : p0_prod[3] & ~(p0_mb[4]);	// swiglu.k:101:9, :124:{21,25}
  wire         prod_49 =
    p0__prod_plus_ma32_shl_4_[2] ? p0_prod[2] | p0_mb[4] : p0_prod[2] & ~(p0_mb[4]);	// swiglu.k:101:9, :124:{21,25}
  wire         prod_50 =
    p0__prod_plus_ma32_shl_4_[1] ? p0_prod[1] | p0_mb[4] : p0_prod[1] & ~(p0_mb[4]);	// swiglu.k:101:9, :124:{21,25}
  wire         prod_51 =
    p0__prod_plus_ma32_shl_4_[0] ? p0_prod[0] | p0_mb[4] : p0_prod[0] & ~(p0_mb[4]);	// swiglu.k:101:9, :124:{21,25}
  wire  [13:0] _prod_plus_ma32_shl_5_ =
    14'({1'h0,
         prod_39,
         prod_40,
         prod_41,
         prod_42,
         prod_43,
         prod_44,
         prod_45,
         prod_46,
         prod_47,
         prod_48,
         prod_49,
         prod_50,
         prod_51} + p0__ma32_shl_5_);	// swiglu.k:101:9, :124:{21,25}, :125:51
  wire         prod_52 = _prod_plus_ma32_shl_5_[13] & p0_mb[5];	// swiglu.k:101:9, :125:{21,25,51}
  wire         prod_53 =
    _prod_plus_ma32_shl_5_[12] ? prod_39 | p0_mb[5] : prod_39 & ~(p0_mb[5]);	// swiglu.k:101:9, :124:{21,25}, :125:{21,25,51}
  wire         prod_54 =
    _prod_plus_ma32_shl_5_[11] ? prod_40 | p0_mb[5] : prod_40 & ~(p0_mb[5]);	// swiglu.k:101:9, :124:{21,25}, :125:{21,25,51}
  wire         prod_55 =
    _prod_plus_ma32_shl_5_[10] ? prod_41 | p0_mb[5] : prod_41 & ~(p0_mb[5]);	// swiglu.k:101:9, :124:{21,25}, :125:{21,25,51}
  wire         prod_56 =
    _prod_plus_ma32_shl_5_[9] ? prod_42 | p0_mb[5] : prod_42 & ~(p0_mb[5]);	// swiglu.k:101:9, :124:{21,25}, :125:{21,25,51}
  wire         prod_57 =
    _prod_plus_ma32_shl_5_[8] ? prod_43 | p0_mb[5] : prod_43 & ~(p0_mb[5]);	// swiglu.k:101:9, :124:{21,25}, :125:{21,25,51}
  wire         prod_58 =
    _prod_plus_ma32_shl_5_[7] ? prod_44 | p0_mb[5] : prod_44 & ~(p0_mb[5]);	// swiglu.k:101:9, :124:{21,25}, :125:{21,25,51}
  wire         prod_59 =
    _prod_plus_ma32_shl_5_[6] ? prod_45 | p0_mb[5] : prod_45 & ~(p0_mb[5]);	// swiglu.k:101:9, :124:{21,25}, :125:{21,25,51}
  wire         prod_60 =
    _prod_plus_ma32_shl_5_[5] ? prod_46 | p0_mb[5] : prod_46 & ~(p0_mb[5]);	// swiglu.k:101:9, :124:{21,25}, :125:{21,25,51}
  wire         prod_61 =
    _prod_plus_ma32_shl_5_[4] ? prod_47 | p0_mb[5] : prod_47 & ~(p0_mb[5]);	// swiglu.k:101:9, :124:{21,25}, :125:{21,25,51}
  wire         prod_62 =
    _prod_plus_ma32_shl_5_[3] ? prod_48 | p0_mb[5] : prod_48 & ~(p0_mb[5]);	// swiglu.k:101:9, :124:{21,25}, :125:{21,25,51}
  wire         prod_63 =
    _prod_plus_ma32_shl_5_[2] ? prod_49 | p0_mb[5] : prod_49 & ~(p0_mb[5]);	// swiglu.k:101:9, :124:{21,25}, :125:{21,25,51}
  wire         prod_64 =
    _prod_plus_ma32_shl_5_[1] ? prod_50 | p0_mb[5] : prod_50 & ~(p0_mb[5]);	// swiglu.k:101:9, :124:{21,25}, :125:{21,25,51}
  wire         prod_65 =
    _prod_plus_ma32_shl_5_[0] ? prod_51 | p0_mb[5] : prod_51 & ~(p0_mb[5]);	// swiglu.k:101:9, :124:{21,25}, :125:{21,25,51}
  wire  [14:0] _prod_plus_ma32_shl_6_ =
    15'({1'h0,
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
         prod_65} + p0__ma32_shl_6_);	// swiglu.k:101:9, :125:{21,25}, :126:51
  wire  [15:0] _prod_plus_ma32_shl_7_ =
    16'({1'h0,
         _prod_plus_ma32_shl_6_[14] & p0_mb_0,
         _prod_plus_ma32_shl_6_[13] ? prod_52 | p0_mb_0 : prod_52 & ~p0_mb_0,
         _prod_plus_ma32_shl_6_[12] ? prod_53 | p0_mb_0 : prod_53 & ~p0_mb_0,
         _prod_plus_ma32_shl_6_[11] ? prod_54 | p0_mb_0 : prod_54 & ~p0_mb_0,
         _prod_plus_ma32_shl_6_[10] ? prod_55 | p0_mb_0 : prod_55 & ~p0_mb_0,
         _prod_plus_ma32_shl_6_[9] ? prod_56 | p0_mb_0 : prod_56 & ~p0_mb_0,
         _prod_plus_ma32_shl_6_[8] ? prod_57 | p0_mb_0 : prod_57 & ~p0_mb_0,
         _prod_plus_ma32_shl_6_[7] ? prod_58 | p0_mb_0 : prod_58 & ~p0_mb_0,
         _prod_plus_ma32_shl_6_[6] ? prod_59 | p0_mb_0 : prod_59 & ~p0_mb_0,
         _prod_plus_ma32_shl_6_[5] ? prod_60 | p0_mb_0 : prod_60 & ~p0_mb_0,
         _prod_plus_ma32_shl_6_[4] ? prod_61 | p0_mb_0 : prod_61 & ~p0_mb_0,
         _prod_plus_ma32_shl_6_[3] ? prod_62 | p0_mb_0 : prod_62 & ~p0_mb_0,
         _prod_plus_ma32_shl_6_[2] ? prod_63 | p0_mb_0 : prod_63 & ~p0_mb_0,
         _prod_plus_ma32_shl_6_[1] ? prod_64 | p0_mb_0 : prod_64 & ~p0_mb_0,
         _prod_plus_ma32_shl_6_[0] ? prod_65 | p0_mb_0 : prod_65 & ~p0_mb_0}
        + p0__ma32_shl_7_);	// swiglu.k:101:9, :125:{21,25}, :126:{21,51}, :127:51
  wire  [15:0] r_exp =
    p0_prod_0
      ? p0__a_exp_plus_b_exp_minus_127_plus_1__0
      : p0__a_exp_plus_b_exp_minus_127__0;	// swiglu.k:101:9, :130:21
  wire         _GEN_0 = r_exp < 16'hFF & (|r_exp);	// swiglu.k:115:{21,37,38,58}, :130:21, :132:{34,47}, :137:{34,47}, :140:{21,25,31,44}, :142:{32,47,49}
  wire         _GEN_1 = ~p0_prod_0 & _GEN_0;	// swiglu.k:101:9, :115:{21,37,38,58}, :130:21, :132:{34,47}, :137:{34,47}, :140:{21,25}, :142:{32,47,49}
  wire         _GEN_2 = p0__b_exp_ne_0__1 & p0__a_exp_ne_0__0;	// swiglu.k:101:9, :113:{17,21}
  wire         silu = r_exp[7] & _GEN_0 & _GEN_2;	// swiglu.k:113:{17,21}, :115:{21,37,38,58}, :130:21, :132:{34,47}, :137:{34,47}, :140:{21,25}, :142:{32,47,49}
  wire         silu_0 = r_exp[6] & _GEN_0 & _GEN_2;	// swiglu.k:113:{17,21}, :115:{21,37,38,58}, :130:21, :132:{34,47}, :137:{34,47}, :140:{21,25}, :142:{32,47,49}
  wire         silu_1 = r_exp[5] & _GEN_0 & _GEN_2;	// swiglu.k:113:{17,21}, :115:{21,37,38,58}, :130:21, :132:{34,47}, :137:{34,47}, :140:{21,25}, :142:{32,47,49}
  wire         silu_2 = r_exp[4] & _GEN_0 & _GEN_2;	// swiglu.k:113:{17,21}, :115:{21,37,38,58}, :130:21, :132:{34,47}, :137:{34,47}, :140:{21,25}, :142:{32,47,49}
  wire         silu_3 = r_exp[3] & _GEN_0 & _GEN_2;	// swiglu.k:113:{17,21}, :115:{21,37,38,58}, :130:21, :132:{34,47}, :137:{34,47}, :140:{21,25}, :142:{32,47,49}
  wire         silu_4 = r_exp[2] & _GEN_0 & _GEN_2;	// swiglu.k:113:{17,21}, :115:{21,37,38,58}, :130:21, :132:{34,47}, :137:{34,47}, :140:{21,25}, :142:{32,47,49}
  wire         silu_5 = r_exp[1] & _GEN_0 & _GEN_2;	// swiglu.k:113:{17,21}, :115:{21,37,38,58}, :130:21, :132:{34,47}, :137:{34,47}, :140:{21,25}, :142:{32,47,49}
  wire         silu_6 = r_exp[0] & _GEN_0 & _GEN_2;	// swiglu.k:113:{17,21}, :115:{21,37,38,58}, :130:21, :132:{34,47}, :137:{34,47}, :140:{21,25}, :142:{32,47,49}
  wire         silu_7 =
    (p0_prod_1[14] ? (p0_prod_1[13] | p0_prod_0) & _GEN_0 : p0_prod_1[13] & _GEN_1)
    & _GEN_2;	// swiglu.k:101:9, :113:{17,21}, :115:{21,37,38,58}, :130:21, :132:{34,47}, :137:{34,47}, :140:{21,25}, :142:{32,47,49}
  wire         silu_8 =
    (p0_prod_1[13] ? (p0_prod_1[12] | p0_prod_0) & _GEN_0 : p0_prod_1[12] & _GEN_1)
    & _GEN_2;	// swiglu.k:101:9, :113:{17,21}, :115:{21,37,38,58}, :130:21, :132:{34,47}, :137:{34,47}, :140:{21,25}, :142:{32,47,49}
  wire         silu_9 =
    (p0_prod_1[12] ? (p0_prod_1[11] | p0_prod_0) & _GEN_0 : p0_prod_1[11] & _GEN_1)
    & _GEN_2;	// swiglu.k:101:9, :113:{17,21}, :115:{21,37,38,58}, :130:21, :132:{34,47}, :137:{34,47}, :140:{21,25}, :142:{32,47,49}
  wire         silu_10 =
    (p0_prod_1[11] ? (p0_prod_1[10] | p0_prod_0) & _GEN_0 : p0_prod_1[10] & _GEN_1)
    & _GEN_2;	// swiglu.k:101:9, :113:{17,21}, :115:{21,37,38,58}, :130:21, :132:{34,47}, :137:{34,47}, :140:{21,25}, :142:{32,47,49}
  wire         silu_11 =
    (p0_prod_1[10] ? (p0_prod_1[9] | p0_prod_0) & _GEN_0 : p0_prod_1[9] & _GEN_1)
    & _GEN_2;	// swiglu.k:101:9, :113:{17,21}, :115:{21,37,38,58}, :130:21, :132:{34,47}, :137:{34,47}, :140:{21,25}, :142:{32,47,49}
  wire         silu_12 =
    (p0_prod_1[9] ? (p0_prod_1[8] | p0_prod_0) & _GEN_0 : p0_prod_1[8] & _GEN_1) & _GEN_2;	// swiglu.k:101:9, :113:{17,21}, :115:{21,37,38,58}, :130:21, :132:{34,47}, :137:{34,47}, :140:{21,25}, :142:{32,47,49}
  wire         silu_13 =
    (p0_prod_1[8] ? (p0_prod_1[7] | p0_prod_0) & _GEN_0 : p0_prod_1[7] & _GEN_1) & _GEN_2;	// swiglu.k:101:9, :113:{17,21}, :115:{21,37,38,58}, :130:21, :132:{34,47}, :137:{34,47}, :140:{21,25}, :142:{32,47,49}
  wire         prod_66 = silu_7 & p0_mb_3[0];	// swiglu.k:101:9, :113:{17,21}, :159:{21,25}
  wire         prod_67 = silu_8 & p0_mb_3[0];	// swiglu.k:101:9, :113:{17,21}, :159:{21,25}
  wire         prod_68 = silu_9 & p0_mb_3[0];	// swiglu.k:101:9, :113:{17,21}, :159:{21,25}
  wire         prod_69 = silu_10 & p0_mb_3[0];	// swiglu.k:101:9, :113:{17,21}, :159:{21,25}
  wire         prod_70 = silu_11 & p0_mb_3[0];	// swiglu.k:101:9, :113:{17,21}, :159:{21,25}
  wire         prod_71 = silu_12 & p0_mb_3[0];	// swiglu.k:101:9, :113:{17,21}, :159:{21,25}
  wire         prod_72 = silu_13 & p0_mb_3[0];	// swiglu.k:101:9, :113:{17,21}, :159:{21,25}
  wire  [15:0] _a_exp_plus_b_exp__0 =
    16'({8'h0, silu, silu_0, silu_1, silu_2, silu_3, silu_4, silu_5, silu_6}
        + p0_b_exp_0);	// swiglu.k:101:9, :113:{17,21}, :115:{21,37,38,58}, :130:21, :132:{34,47}, :137:{34,47}, :140:{21,25}, :142:{32,47,49}, :172:39, :177:39
  wire  [9:0]  _prod_plus_ma32_shl_1__0 =
    10'({2'h0, p0_mb_3[0], prod_66, prod_67, prod_68, prod_69, prod_70, prod_71, prod_72}
        + {2'h1, silu_7, silu_8, silu_9, silu_10, silu_11, silu_12, silu_13, 1'h0});	// swiglu.k:101:9, :113:{17,21}, :159:{21,25}, :160:{51,58}
  wire         prod_73 = _prod_plus_ma32_shl_1__0[9] & p0_mb_3[1];	// swiglu.k:101:9, :160:{21,25,51}
  wire         prod_74 = _prod_plus_ma32_shl_1__0[8] & p0_mb_3[1];	// swiglu.k:101:9, :160:{21,25,51}
  wire         prod_75 =
    _prod_plus_ma32_shl_1__0[7] ? p0_mb_3[0] | p0_mb_3[1] : p0_mb_3[0] & ~(p0_mb_3[1]);	// swiglu.k:101:9, :159:{21,25}, :160:{21,25,51}
  wire         prod_76 =
    _prod_plus_ma32_shl_1__0[6] ? prod_66 | p0_mb_3[1] : prod_66 & ~(p0_mb_3[1]);	// swiglu.k:101:9, :159:{21,25}, :160:{21,25,51}
  wire         prod_77 =
    _prod_plus_ma32_shl_1__0[5] ? prod_67 | p0_mb_3[1] : prod_67 & ~(p0_mb_3[1]);	// swiglu.k:101:9, :159:{21,25}, :160:{21,25,51}
  wire         prod_78 =
    _prod_plus_ma32_shl_1__0[4] ? prod_68 | p0_mb_3[1] : prod_68 & ~(p0_mb_3[1]);	// swiglu.k:101:9, :159:{21,25}, :160:{21,25,51}
  wire         prod_79 =
    _prod_plus_ma32_shl_1__0[3] ? prod_69 | p0_mb_3[1] : prod_69 & ~(p0_mb_3[1]);	// swiglu.k:101:9, :159:{21,25}, :160:{21,25,51}
  wire         prod_80 =
    _prod_plus_ma32_shl_1__0[2] ? prod_70 | p0_mb_3[1] : prod_70 & ~(p0_mb_3[1]);	// swiglu.k:101:9, :159:{21,25}, :160:{21,25,51}
  wire         prod_81 =
    _prod_plus_ma32_shl_1__0[1] ? prod_71 | p0_mb_3[1] : prod_71 & ~(p0_mb_3[1]);	// swiglu.k:101:9, :159:{21,25}, :160:{21,25,51}
  wire         prod_82 =
    _prod_plus_ma32_shl_1__0[0] ? prod_72 | p0_mb_3[1] : prod_72 & ~(p0_mb_3[1]);	// swiglu.k:101:9, :159:{21,25}, :160:{21,25,51}
  wire         prod_83 = p0__prod_plus_ma32_shl_2_[10] & p0_mb_5[2];	// swiglu.k:101:9, :161:{21,25}
  wire         prod_84 =
    p0__prod_plus_ma32_shl_2_[9]
      ? p0_prod_2[9] | p0_mb_5[2]
      : p0_prod_2[9] & ~(p0_mb_5[2]);	// swiglu.k:101:9, :161:{21,25}
  wire         prod_85 =
    p0__prod_plus_ma32_shl_2_[8]
      ? p0_prod_2[8] | p0_mb_5[2]
      : p0_prod_2[8] & ~(p0_mb_5[2]);	// swiglu.k:101:9, :161:{21,25}
  wire         prod_86 =
    p0__prod_plus_ma32_shl_2_[7]
      ? p0_prod_2[7] | p0_mb_5[2]
      : p0_prod_2[7] & ~(p0_mb_5[2]);	// swiglu.k:101:9, :161:{21,25}
  wire         prod_87 =
    p0__prod_plus_ma32_shl_2_[6]
      ? p0_prod_2[6] | p0_mb_5[2]
      : p0_prod_2[6] & ~(p0_mb_5[2]);	// swiglu.k:101:9, :161:{21,25}
  wire         prod_88 =
    p0__prod_plus_ma32_shl_2_[5]
      ? p0_prod_2[5] | p0_mb_5[2]
      : p0_prod_2[5] & ~(p0_mb_5[2]);	// swiglu.k:101:9, :161:{21,25}
  wire         prod_89 =
    p0__prod_plus_ma32_shl_2_[4]
      ? p0_prod_2[4] | p0_mb_5[2]
      : p0_prod_2[4] & ~(p0_mb_5[2]);	// swiglu.k:101:9, :161:{21,25}
  wire         prod_90 =
    p0__prod_plus_ma32_shl_2_[3]
      ? p0_prod_2[3] | p0_mb_5[2]
      : p0_prod_2[3] & ~(p0_mb_5[2]);	// swiglu.k:101:9, :161:{21,25}
  wire         prod_91 =
    p0__prod_plus_ma32_shl_2_[2]
      ? p0_prod_2[2] | p0_mb_5[2]
      : p0_prod_2[2] & ~(p0_mb_5[2]);	// swiglu.k:101:9, :161:{21,25}
  wire         prod_92 =
    p0__prod_plus_ma32_shl_2_[1]
      ? p0_prod_2[1] | p0_mb_5[2]
      : p0_prod_2[1] & ~(p0_mb_5[2]);	// swiglu.k:101:9, :161:{21,25}
  wire         prod_93 =
    p0__prod_plus_ma32_shl_2_[0]
      ? p0_prod_2[0] | p0_mb_5[2]
      : p0_prod_2[0] & ~(p0_mb_5[2]);	// swiglu.k:101:9, :161:{21,25}
  wire  [11:0] _prod_plus_ma32_shl_3__0 =
    12'({1'h0,
         prod_83,
         prod_84,
         prod_85,
         prod_86,
         prod_87,
         prod_88,
         prod_89,
         prod_90,
         prod_91,
         prod_92,
         prod_93} + p0__ma32_shl_3_);	// swiglu.k:101:9, :161:{21,25}, :162:51
  wire         prod_94 = _prod_plus_ma32_shl_3__0[11] & p0_mb_5[3];	// swiglu.k:101:9, :162:{21,25,51}
  wire         prod_95 =
    _prod_plus_ma32_shl_3__0[10] ? prod_83 | p0_mb_5[3] : prod_83 & ~(p0_mb_5[3]);	// swiglu.k:101:9, :161:{21,25}, :162:{21,25,51}
  wire         prod_96 =
    _prod_plus_ma32_shl_3__0[9] ? prod_84 | p0_mb_5[3] : prod_84 & ~(p0_mb_5[3]);	// swiglu.k:101:9, :161:{21,25}, :162:{21,25,51}
  wire         prod_97 =
    _prod_plus_ma32_shl_3__0[8] ? prod_85 | p0_mb_5[3] : prod_85 & ~(p0_mb_5[3]);	// swiglu.k:101:9, :161:{21,25}, :162:{21,25,51}
  wire         prod_98 =
    _prod_plus_ma32_shl_3__0[7] ? prod_86 | p0_mb_5[3] : prod_86 & ~(p0_mb_5[3]);	// swiglu.k:101:9, :161:{21,25}, :162:{21,25,51}
  wire         prod_99 =
    _prod_plus_ma32_shl_3__0[6] ? prod_87 | p0_mb_5[3] : prod_87 & ~(p0_mb_5[3]);	// swiglu.k:101:9, :161:{21,25}, :162:{21,25,51}
  wire         prod_100 =
    _prod_plus_ma32_shl_3__0[5] ? prod_88 | p0_mb_5[3] : prod_88 & ~(p0_mb_5[3]);	// swiglu.k:101:9, :161:{21,25}, :162:{21,25,51}
  wire         prod_101 =
    _prod_plus_ma32_shl_3__0[4] ? prod_89 | p0_mb_5[3] : prod_89 & ~(p0_mb_5[3]);	// swiglu.k:101:9, :161:{21,25}, :162:{21,25,51}
  wire         prod_102 =
    _prod_plus_ma32_shl_3__0[3] ? prod_90 | p0_mb_5[3] : prod_90 & ~(p0_mb_5[3]);	// swiglu.k:101:9, :161:{21,25}, :162:{21,25,51}
  wire         prod_103 =
    _prod_plus_ma32_shl_3__0[2] ? prod_91 | p0_mb_5[3] : prod_91 & ~(p0_mb_5[3]);	// swiglu.k:101:9, :161:{21,25}, :162:{21,25,51}
  wire         prod_104 =
    _prod_plus_ma32_shl_3__0[1] ? prod_92 | p0_mb_5[3] : prod_92 & ~(p0_mb_5[3]);	// swiglu.k:101:9, :161:{21,25}, :162:{21,25,51}
  wire         prod_105 =
    _prod_plus_ma32_shl_3__0[0] ? prod_93 | p0_mb_5[3] : prod_93 & ~(p0_mb_5[3]);	// swiglu.k:101:9, :161:{21,25}, :162:{21,25,51}
  wire  [12:0] _prod_plus_ma32_shl_4_ =
    13'({1'h0,
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
         prod_105} + p0__ma32_shl_4_);	// swiglu.k:101:9, :162:{21,25}, :163:51
  wire         prod_106 = _prod_plus_ma32_shl_4_[12] & p0_mb_5[4];	// swiglu.k:101:9, :163:{21,25,51}
  wire         prod_107 =
    _prod_plus_ma32_shl_4_[11] ? prod_94 | p0_mb_5[4] : prod_94 & ~(p0_mb_5[4]);	// swiglu.k:101:9, :162:{21,25}, :163:{21,25,51}
  wire         prod_108 =
    _prod_plus_ma32_shl_4_[10] ? prod_95 | p0_mb_5[4] : prod_95 & ~(p0_mb_5[4]);	// swiglu.k:101:9, :162:{21,25}, :163:{21,25,51}
  wire         prod_109 =
    _prod_plus_ma32_shl_4_[9] ? prod_96 | p0_mb_5[4] : prod_96 & ~(p0_mb_5[4]);	// swiglu.k:101:9, :162:{21,25}, :163:{21,25,51}
  wire         prod_110 =
    _prod_plus_ma32_shl_4_[8] ? prod_97 | p0_mb_5[4] : prod_97 & ~(p0_mb_5[4]);	// swiglu.k:101:9, :162:{21,25}, :163:{21,25,51}
  wire         prod_111 =
    _prod_plus_ma32_shl_4_[7] ? prod_98 | p0_mb_5[4] : prod_98 & ~(p0_mb_5[4]);	// swiglu.k:101:9, :162:{21,25}, :163:{21,25,51}
  wire         prod_112 =
    _prod_plus_ma32_shl_4_[6] ? prod_99 | p0_mb_5[4] : prod_99 & ~(p0_mb_5[4]);	// swiglu.k:101:9, :162:{21,25}, :163:{21,25,51}
  wire         prod_113 =
    _prod_plus_ma32_shl_4_[5] ? prod_100 | p0_mb_5[4] : prod_100 & ~(p0_mb_5[4]);	// swiglu.k:101:9, :162:{21,25}, :163:{21,25,51}
  wire         prod_114 =
    _prod_plus_ma32_shl_4_[4] ? prod_101 | p0_mb_5[4] : prod_101 & ~(p0_mb_5[4]);	// swiglu.k:101:9, :162:{21,25}, :163:{21,25,51}
  wire         prod_115 =
    _prod_plus_ma32_shl_4_[3] ? prod_102 | p0_mb_5[4] : prod_102 & ~(p0_mb_5[4]);	// swiglu.k:101:9, :162:{21,25}, :163:{21,25,51}
  wire         prod_116 =
    _prod_plus_ma32_shl_4_[2] ? prod_103 | p0_mb_5[4] : prod_103 & ~(p0_mb_5[4]);	// swiglu.k:101:9, :162:{21,25}, :163:{21,25,51}
  wire         prod_117 =
    _prod_plus_ma32_shl_4_[1] ? prod_104 | p0_mb_5[4] : prod_104 & ~(p0_mb_5[4]);	// swiglu.k:101:9, :162:{21,25}, :163:{21,25,51}
  wire         prod_118 =
    _prod_plus_ma32_shl_4_[0] ? prod_105 | p0_mb_5[4] : prod_105 & ~(p0_mb_5[4]);	// swiglu.k:101:9, :162:{21,25}, :163:{21,25,51}
  wire  [13:0] _prod_plus_ma32_shl_5__0 =
    14'({1'h0,
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
         prod_118} + p0__ma32_shl_5__0);	// swiglu.k:101:9, :163:{21,25}, :164:51
  wire         prod_119 = _prod_plus_ma32_shl_5__0[13] & p0_mb_5[5];	// swiglu.k:101:9, :164:{21,25,51}
  wire         prod_120 =
    _prod_plus_ma32_shl_5__0[12] ? prod_106 | p0_mb_5[5] : prod_106 & ~(p0_mb_5[5]);	// swiglu.k:101:9, :163:{21,25}, :164:{21,25,51}
  wire         prod_121 =
    _prod_plus_ma32_shl_5__0[11] ? prod_107 | p0_mb_5[5] : prod_107 & ~(p0_mb_5[5]);	// swiglu.k:101:9, :163:{21,25}, :164:{21,25,51}
  wire         prod_122 =
    _prod_plus_ma32_shl_5__0[10] ? prod_108 | p0_mb_5[5] : prod_108 & ~(p0_mb_5[5]);	// swiglu.k:101:9, :163:{21,25}, :164:{21,25,51}
  wire         prod_123 =
    _prod_plus_ma32_shl_5__0[9] ? prod_109 | p0_mb_5[5] : prod_109 & ~(p0_mb_5[5]);	// swiglu.k:101:9, :163:{21,25}, :164:{21,25,51}
  wire         prod_124 =
    _prod_plus_ma32_shl_5__0[8] ? prod_110 | p0_mb_5[5] : prod_110 & ~(p0_mb_5[5]);	// swiglu.k:101:9, :163:{21,25}, :164:{21,25,51}
  wire         prod_125 =
    _prod_plus_ma32_shl_5__0[7] ? prod_111 | p0_mb_5[5] : prod_111 & ~(p0_mb_5[5]);	// swiglu.k:101:9, :163:{21,25}, :164:{21,25,51}
  wire         prod_126 =
    _prod_plus_ma32_shl_5__0[6] ? prod_112 | p0_mb_5[5] : prod_112 & ~(p0_mb_5[5]);	// swiglu.k:101:9, :163:{21,25}, :164:{21,25,51}
  wire         prod_127 =
    _prod_plus_ma32_shl_5__0[5] ? prod_113 | p0_mb_5[5] : prod_113 & ~(p0_mb_5[5]);	// swiglu.k:101:9, :163:{21,25}, :164:{21,25,51}
  wire         prod_128 =
    _prod_plus_ma32_shl_5__0[4] ? prod_114 | p0_mb_5[5] : prod_114 & ~(p0_mb_5[5]);	// swiglu.k:101:9, :163:{21,25}, :164:{21,25,51}
  wire         prod_129 =
    _prod_plus_ma32_shl_5__0[3] ? prod_115 | p0_mb_5[5] : prod_115 & ~(p0_mb_5[5]);	// swiglu.k:101:9, :163:{21,25}, :164:{21,25,51}
  wire         prod_130 =
    _prod_plus_ma32_shl_5__0[2] ? prod_116 | p0_mb_5[5] : prod_116 & ~(p0_mb_5[5]);	// swiglu.k:101:9, :163:{21,25}, :164:{21,25,51}
  wire         prod_131 =
    _prod_plus_ma32_shl_5__0[1] ? prod_117 | p0_mb_5[5] : prod_117 & ~(p0_mb_5[5]);	// swiglu.k:101:9, :163:{21,25}, :164:{21,25,51}
  wire         prod_132 =
    _prod_plus_ma32_shl_5__0[0] ? prod_118 | p0_mb_5[5] : prod_118 & ~(p0_mb_5[5]);	// swiglu.k:101:9, :163:{21,25}, :164:{21,25,51}
  wire  [15:0] _prod_plus_ma32_shl_7__0 =
    16'({1'h0,
         p0__prod_plus_ma32_shl_6_[14] & p0_mb_7,
         p0__prod_plus_ma32_shl_6_[13]
           ? p0_prod_3[13] | p0_mb_7
           : p0_prod_3[13] & ~p0_mb_7,
         p0__prod_plus_ma32_shl_6_[12]
           ? p0_prod_3[12] | p0_mb_7
           : p0_prod_3[12] & ~p0_mb_7,
         p0__prod_plus_ma32_shl_6_[11]
           ? p0_prod_3[11] | p0_mb_7
           : p0_prod_3[11] & ~p0_mb_7,
         p0__prod_plus_ma32_shl_6_[10]
           ? p0_prod_3[10] | p0_mb_7
           : p0_prod_3[10] & ~p0_mb_7,
         p0__prod_plus_ma32_shl_6_[9] ? p0_prod_3[9] | p0_mb_7 : p0_prod_3[9] & ~p0_mb_7,
         p0__prod_plus_ma32_shl_6_[8] ? p0_prod_3[8] | p0_mb_7 : p0_prod_3[8] & ~p0_mb_7,
         p0__prod_plus_ma32_shl_6_[7] ? p0_prod_3[7] | p0_mb_7 : p0_prod_3[7] & ~p0_mb_7,
         p0__prod_plus_ma32_shl_6_[6] ? p0_prod_3[6] | p0_mb_7 : p0_prod_3[6] & ~p0_mb_7,
         p0__prod_plus_ma32_shl_6_[5] ? p0_prod_3[5] | p0_mb_7 : p0_prod_3[5] & ~p0_mb_7,
         p0__prod_plus_ma32_shl_6_[4] ? p0_prod_3[4] | p0_mb_7 : p0_prod_3[4] & ~p0_mb_7,
         p0__prod_plus_ma32_shl_6_[3] ? p0_prod_3[3] | p0_mb_7 : p0_prod_3[3] & ~p0_mb_7,
         p0__prod_plus_ma32_shl_6_[2] ? p0_prod_3[2] | p0_mb_7 : p0_prod_3[2] & ~p0_mb_7,
         p0__prod_plus_ma32_shl_6_[1] ? p0_prod_3[1] | p0_mb_7 : p0_prod_3[1] & ~p0_mb_7,
         p0__prod_plus_ma32_shl_6_[0] ? p0_prod_3[0] | p0_mb_7 : p0_prod_3[0] & ~p0_mb_7}
        + p0__ma32_shl_7__1);	// swiglu.k:101:9, :165:21, :166:51
  wire  [15:0] r_exp_0 =
    _prod_plus_ma32_shl_7__0[15]
      ? p0__a_exp_plus_b_exp_minus_127_plus_1__2
      : p0__a_exp_plus_b_exp_minus_127__2;	// swiglu.k:101:9, :166:{21,51}, :169:21
  wire         _GEN_3 = r_exp_0 < 16'hFF & (|r_exp_0);	// swiglu.k:154:{21,37,38,53}, :169:21, :171:{34,47}, :176:{34,47}, :179:{21,25,31,44}, :181:{34,49,51}
  wire         _GEN_4 = ~(_prod_plus_ma32_shl_7__0[15]) & _GEN_3;	// swiglu.k:154:{21,37,38,53}, :166:{21,51}, :169:21, :171:{34,47}, :176:{34,47}, :179:{21,25}, :181:{34,49,51}
  wire         _GEN_5 = p0__b_exp_ne_0__4 & p0__a_exp_ne_0__2;	// swiglu.k:101:9, :152:{17,21}
  always @(posedge clk) begin	// swiglu.k:101:9
    p0_gate_bf16 <= data_in_8[15:0];	// swiglu.k:101:9
    p0_up_bf16 <= data_in_8[31:16];	// swiglu.k:101:9
    if (rst)	// swiglu.k:101:9
      p0_stage1_enable <= 1'h0;	// swiglu.k:101:9
    else	// swiglu.k:101:9
      p0_stage1_enable <= _GEN & input_valid_0;	// swiglu.k:101:9
    p0_gate_bf16_0 <= p0_gate_bf16;	// swiglu.k:101:9
    p0_up_bf16_0 <= p0_up_bf16;	// swiglu.k:101:9
    if (rst)	// swiglu.k:101:9
      p0_stage2_enable <= 1'h0;	// swiglu.k:101:9
    else	// swiglu.k:101:9
      p0_stage2_enable <= p0_stage1_enable;	// swiglu.k:101:9
    p0_gate_bf16_1 <= p0_gate_bf16_0;	// swiglu.k:101:9
    p0_up_bf16_1 <= p0_up_bf16_0;	// swiglu.k:101:9
    if (rst)	// swiglu.k:101:9
      p0_stage3_enable <= 1'h0;	// swiglu.k:101:9
    else	// swiglu.k:101:9
      p0_stage3_enable <= p0_stage2_enable;	// swiglu.k:101:9
    p0__prod_plus_ma32_shl_4_ <=
      13'({1'h0,
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
           prod_38} + {2'h1, p0_gate_bf16_1[6:0], 4'h0});	// swiglu.k:101:9, :123:{21,25}, :124:{51,58}
    p0_mb <= memory_read_data_in_9_2_0[5:0];	// swiglu.k:101:9
    p0_prod <=
      {prod_27,
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
       prod_38};	// swiglu.k:101:9, :123:{21,25}
    p0__ma32_shl_5_ <= {2'h1, p0_gate_bf16_1[6:0], 5'h0};	// swiglu.k:101:9, :125:58
    p0__ma32_shl_6_ <= {2'h1, p0_gate_bf16_1[6:0], 6'h0};	// swiglu.k:101:9, :126:58
    p0_mb_0 <= memory_read_data_in_9_2_0[6];	// swiglu.k:101:9, :117:{21,33}
    p0__ma32_shl_7_ <= {2'h1, p0_gate_bf16_1[6:0], 7'h0};	// swiglu.k:101:9, :127:58
    p0__a_exp_plus_b_exp_minus_127_plus_1_ <= 16'(_a_exp_plus_b_exp_ - 16'h7E);	// swiglu.k:101:9, :133:{33,39,47}, :138:39
    p0__a_exp_plus_b_exp_minus_127_ <= 16'(_a_exp_plus_b_exp_ - 16'h7F);	// swiglu.k:101:9, :133:39, :138:{33,39}
    p0_memory_read_data_in_9_2 <= memory_read_data_in_9_2_0;	// swiglu.k:101:9
    p0_gate_bf16_2 <= p0_gate_bf16_1;	// swiglu.k:101:9
    p0__b_exp_ne_0_ <= |(memory_read_data_in_9_2_0[14:7]);	// swiglu.k:101:9, :112:{17,32}, :113:41
    p0__a_exp_ne_0_ <= |(p0_gate_bf16_1[14:7]);	// swiglu.k:101:9, :111:{17,32}, :113:27
    p0_mb_1 <= p0_up_bf16_1[5:0];	// swiglu.k:101:9
    p0_b_exp <= {8'h0, p0_up_bf16_1[14:7]};	// swiglu.k:101:9, :151:{17,32}
    p0_mb_2 <= p0_up_bf16_1[6];	// swiglu.k:101:9, :156:{21,33}
    p0__b_exp_ne_0__0 <= |(p0_up_bf16_1[14:7]);	// swiglu.k:101:9, :151:{17,32}, :152:41
    if (rst)	// swiglu.k:101:9
      p0_stage4_enable <= 1'h0;	// swiglu.k:101:9
    else	// swiglu.k:101:9
      p0_stage4_enable <= p0_stage3_enable;	// swiglu.k:101:9
    p0_prod_0 <= _prod_plus_ma32_shl_7_[15];	// swiglu.k:101:9, :127:{21,51}
    p0__a_exp_plus_b_exp_minus_127_plus_1__0 <= p0__a_exp_plus_b_exp_minus_127_plus_1_;	// swiglu.k:101:9
    p0__a_exp_plus_b_exp_minus_127__0 <= p0__a_exp_plus_b_exp_minus_127_;	// swiglu.k:101:9
    p0_memory_read_data_in_9_2_0 <= p0_memory_read_data_in_9_2;	// swiglu.k:101:9
    p0_gate_bf16_3 <= p0_gate_bf16_2;	// swiglu.k:101:9
    p0_prod_1 <= _prod_plus_ma32_shl_7_[14:0];	// swiglu.k:101:9, :127:51
    p0__b_exp_ne_0__1 <= p0__b_exp_ne_0_;	// swiglu.k:101:9
    p0__a_exp_ne_0__0 <= p0__a_exp_ne_0_;	// swiglu.k:101:9
    p0_mb_3 <= p0_mb_1;	// swiglu.k:101:9
    p0_b_exp_0 <= p0_b_exp;	// swiglu.k:101:9
    p0_mb_4 <= p0_mb_2;	// swiglu.k:101:9
    p0__b_exp_ne_0__2 <= p0__b_exp_ne_0__0;	// swiglu.k:101:9
    if (rst)	// swiglu.k:101:9
      p0_stage5_enable <= 1'h0;	// swiglu.k:101:9
    else	// swiglu.k:101:9
      p0_stage5_enable <= p0_stage4_enable;	// swiglu.k:101:9
    p0__prod_plus_ma32_shl_2_ <=
      11'({1'h0,
           prod_73,
           prod_74,
           prod_75,
           prod_76,
           prod_77,
           prod_78,
           prod_79,
           prod_80,
           prod_81,
           prod_82}
          + {2'h1, silu_7, silu_8, silu_9, silu_10, silu_11, silu_12, silu_13, 2'h0});	// swiglu.k:101:9, :113:{17,21}, :160:{21,25}, :161:{51,58}
    p0_mb_5 <= p0_mb_3;	// swiglu.k:101:9
    p0_prod_2 <=
      {prod_73,
       prod_74,
       prod_75,
       prod_76,
       prod_77,
       prod_78,
       prod_79,
       prod_80,
       prod_81,
       prod_82};	// swiglu.k:101:9, :160:{21,25}
    p0__ma32_shl_3_ <=
      {2'h1, silu_7, silu_8, silu_9, silu_10, silu_11, silu_12, silu_13, 3'h0};	// swiglu.k:101:9, :113:{17,21}, :162:58
    p0__ma32_shl_4_ <=
      {2'h1, silu_7, silu_8, silu_9, silu_10, silu_11, silu_12, silu_13, 4'h0};	// swiglu.k:101:9, :113:{17,21}, :163:58
    p0__ma32_shl_5__0 <=
      {2'h1, silu_7, silu_8, silu_9, silu_10, silu_11, silu_12, silu_13, 5'h0};	// swiglu.k:101:9, :113:{17,21}, :164:58
    p0__ma32_shl_6__0 <=
      {2'h1, silu_7, silu_8, silu_9, silu_10, silu_11, silu_12, silu_13, 6'h0};	// swiglu.k:101:9, :113:{17,21}, :165:58
    p0_mb_6 <= p0_mb_4;	// swiglu.k:101:9
    p0__ma32_shl_7__0 <=
      {2'h1, silu_7, silu_8, silu_9, silu_10, silu_11, silu_12, silu_13, 7'h0};	// swiglu.k:101:9, :113:{17,21}, :166:58
    p0__a_exp_plus_b_exp_minus_127_plus_1__1 <= 16'(_a_exp_plus_b_exp__0 - 16'h7E);	// swiglu.k:101:9, :172:{33,39,47}, :177:39
    p0__a_exp_plus_b_exp_minus_127__1 <= 16'(_a_exp_plus_b_exp__0 - 16'h7F);	// swiglu.k:101:9, :172:39, :177:{33,39}
    p0_silu <=
      {(r_exp[8]
          ? _GEN_0
          : p0_memory_read_data_in_9_2_0[15]
              ? ~(p0_gate_bf16_3[15]) & _GEN_0
              : p0_gate_bf16_3[15] & _GEN_0) & _GEN_2,
       silu,
       silu_0,
       silu_1,
       silu_2,
       silu_3,
       silu_4,
       silu_5,
       silu_6,
       silu_7,
       silu_8,
       silu_9,
       silu_10,
       silu_11,
       silu_12,
       silu_13};	// swiglu.k:101:9, :113:{17,21}, :115:{21,37,38,58}, :130:21, :132:{34,47}, :137:{34,47}, :140:{21,25}, :142:{32,47,49}
    p0__b_exp_ne_0__3 <= p0__b_exp_ne_0__2;	// swiglu.k:101:9
    p0__a_exp_ne_0__1 <= |{silu, silu_0, silu_1, silu_2, silu_3, silu_4, silu_5, silu_6};	// swiglu.k:101:9, :113:{17,21}, :115:{21,37,38,58}, :130:21, :132:{34,47}, :137:{34,47}, :140:{21,25}, :142:{32,47,49}, :150:{17,32}, :152:27
    if (rst)	// swiglu.k:101:9
      p0_stage6_enable <= 1'h0;	// swiglu.k:101:9
    else	// swiglu.k:101:9
      p0_stage6_enable <= p0_stage5_enable;	// swiglu.k:101:9
    p0__prod_plus_ma32_shl_6_ <=
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
           prod_132} + p0__ma32_shl_6__0);	// swiglu.k:101:9, :164:{21,25}, :165:51
    p0_mb_7 <= p0_mb_6;	// swiglu.k:101:9
    p0_prod_3 <=
      {prod_119,
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
       prod_132};	// swiglu.k:101:9, :164:{21,25}
    p0__ma32_shl_7__1 <= p0__ma32_shl_7__0;	// swiglu.k:101:9
    p0__a_exp_plus_b_exp_minus_127_plus_1__2 <= p0__a_exp_plus_b_exp_minus_127_plus_1__1;	// swiglu.k:101:9
    p0__a_exp_plus_b_exp_minus_127__2 <= p0__a_exp_plus_b_exp_minus_127__1;	// swiglu.k:101:9
    p0_up_bf16_2 <= data_prop_out_7_0;	// swiglu.k:101:9
    p0_silu_0 <= p0_silu;	// swiglu.k:101:9
    p0__b_exp_ne_0__4 <= p0__b_exp_ne_0__3;	// swiglu.k:101:9
    p0__a_exp_ne_0__2 <= p0__a_exp_ne_0__1;	// swiglu.k:101:9
    if (rst)	// swiglu.k:101:9
      p0_stage7_enable <= 1'h0;	// swiglu.k:101:9
    else	// swiglu.k:101:9
      p0_stage7_enable <= p0_stage6_enable;	// swiglu.k:101:9
    p0_result <=
      {(r_exp_0[8]
          ? _GEN_3
          : p0_up_bf16_2[15] ? ~(p0_silu_0[15]) & _GEN_3 : p0_silu_0[15] & _GEN_3)
         & _GEN_5,
       r_exp_0[7] & _GEN_3 & _GEN_5,
       r_exp_0[6] & _GEN_3 & _GEN_5,
       r_exp_0[5] & _GEN_3 & _GEN_5,
       r_exp_0[4] & _GEN_3 & _GEN_5,
       r_exp_0[3] & _GEN_3 & _GEN_5,
       r_exp_0[2] & _GEN_3 & _GEN_5,
       r_exp_0[1] & _GEN_3 & _GEN_5,
       r_exp_0[0] & _GEN_3 & _GEN_5,
       (_prod_plus_ma32_shl_7__0[14]
          ? (_prod_plus_ma32_shl_7__0[13] | _prod_plus_ma32_shl_7__0[15]) & _GEN_3
          : _prod_plus_ma32_shl_7__0[13] & _GEN_4) & _GEN_5,
       (_prod_plus_ma32_shl_7__0[13]
          ? (_prod_plus_ma32_shl_7__0[12] | _prod_plus_ma32_shl_7__0[15]) & _GEN_3
          : _prod_plus_ma32_shl_7__0[12] & _GEN_4) & _GEN_5,
       (_prod_plus_ma32_shl_7__0[12]
          ? (_prod_plus_ma32_shl_7__0[11] | _prod_plus_ma32_shl_7__0[15]) & _GEN_3
          : _prod_plus_ma32_shl_7__0[11] & _GEN_4) & _GEN_5,
       (_prod_plus_ma32_shl_7__0[11]
          ? (_prod_plus_ma32_shl_7__0[10] | _prod_plus_ma32_shl_7__0[15]) & _GEN_3
          : _prod_plus_ma32_shl_7__0[10] & _GEN_4) & _GEN_5,
       (_prod_plus_ma32_shl_7__0[10]
          ? (_prod_plus_ma32_shl_7__0[9] | _prod_plus_ma32_shl_7__0[15]) & _GEN_3
          : _prod_plus_ma32_shl_7__0[9] & _GEN_4) & _GEN_5,
       (_prod_plus_ma32_shl_7__0[9]
          ? (_prod_plus_ma32_shl_7__0[8] | _prod_plus_ma32_shl_7__0[15]) & _GEN_3
          : _prod_plus_ma32_shl_7__0[8] & _GEN_4) & _GEN_5,
       (_prod_plus_ma32_shl_7__0[8]
          ? (_prod_plus_ma32_shl_7__0[7] | _prod_plus_ma32_shl_7__0[15]) & _GEN_3
          : _prod_plus_ma32_shl_7__0[7] & _GEN_4) & _GEN_5};	// swiglu.k:101:9, :152:{17,21}, :154:{21,37,38,53}, :166:{21,51}, :169:21, :171:{34,47}, :176:{34,47}, :179:{21,25}, :181:{34,49,51}
    if (rst)	// swiglu.k:101:9
      p0_stage8_enable <= 1'h0;	// swiglu.k:101:9
    else	// swiglu.k:101:9
      p0_stage8_enable <= p0_stage7_enable;	// swiglu.k:101:9
    p0_result_0 <= p0_result;	// swiglu.k:101:9
    if (rst)	// swiglu.k:101:9
      p0_stage9_enable <= 1'h0;	// swiglu.k:101:9
    else	// swiglu.k:101:9
      p0_stage9_enable <= p0_stage8_enable;	// swiglu.k:101:9
    p0_result_1 <= p0_result_0;	// swiglu.k:101:9
    if (rst)	// swiglu.k:101:9
      p0_stage10_enable <= 1'h0;	// swiglu.k:101:9
    else	// swiglu.k:101:9
      p0_stage10_enable <= p0_stage9_enable;	// swiglu.k:101:9
    p0_result_2 <= p0_result_1;	// swiglu.k:101:9
    if (rst)	// swiglu.k:101:9
      p0_stage11_enable <= 1'h0;	// swiglu.k:101:9
    else	// swiglu.k:101:9
      p0_stage11_enable <= p0_stage10_enable;	// swiglu.k:101:9
  end // always @(posedge)
  always_comb begin	// swiglu.k:101:9
    fifo_wren_0_0 = p0_stage11_enable;	// swiglu.k:99:5, :101:9
    fifo_data_out_0_0 = p0_result_2;	// swiglu.k:99:5, :101:9
  end // always_comb
  KanagawaFixedDelayFifo #(
    .WIDTH(16),
    .DELAY(2),
    .USE_LUTRAM(1),
    .DEVICE_FAMILY("mock"),
    .USE_DSP(0)
  ) delay_fifo_7_compute_swiglu_Propagation (	// swiglu.k:101:9
    .clk      (clk),	// swiglu.k:101:9
    .rst      (rst),	// swiglu.k:101:9
    .data_in  (data_prop_in_7_0),	// swiglu.k:101:9
    .data_out (data_prop_out_7_0)
  );	// swiglu.k:101:9
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// swiglu.k:101:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// swiglu.k:101:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  swiglu_unitDebugView_compute_swigluEntry swiglu_unitDebugView_compute_swigluEntry_instance (	// swiglu.k:99:5
    .clk        (clk),	// swiglu.k:99:5
    ._gate_bf16 (p0_stage1_enable ? p0_gate_bf16 : 'x),	// swiglu.k:99:5, :101:9
    ._up_bf16   (p0_stage1_enable ? p0_up_bf16 : 'x),	// swiglu.k:99:5, :101:9
    .valid      (p0_stage1_enable),	// swiglu.k:101:9
    .valid_out  (/* unused */)
  );	// swiglu.k:99:5
  swiglu_unitDebugView_compute_swigluExit swiglu_unitDebugView_compute_swigluExit_instance (	// swiglu.k:99:5
    .clk          (clk),	// swiglu.k:99:5
    ._ReturnValue (p0_stage10_enable ? p0_result_1 : 'x),	// swiglu.k:99:5, :101:9
    .valid        (p0_stage10_enable),	// swiglu.k:101:9
    .valid_out    (/* unused */)
  );	// swiglu.k:99:5
  assign done_out = p0_stage11_enable;	// swiglu.k:101:9
  assign memory_read_addr_out_9_2 = memory_read_addr_out_9_2_0;	// swiglu.k:101:9
  assign memory_rden_out_9_2 = memory_rden_out_9_2_0;	// swiglu.k:101:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// swiglu.k:101:9
  assign fifo_wren_0 = fifo_wren_0_0;	// swiglu.k:101:9
  assign input_rdy_0 = input_rdy_0_0;	// swiglu.k:101:9
  assign control_state_out = control_state_out_0;	// swiglu.k:101:9
endmodule

module swiglu_unit_compute_silu_BasicBlock_0(	// swiglu.k:43:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  input  wire [15:0] memory_read_data_in_9_1,
  output wire [7:0]  memory_read_addr_out_9_1,
  output wire        memory_rden_out_9_1,
  output wire [15:0] fifo_data_out_0,
  output wire        fifo_wren_0,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [15:0] data_in_6,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  wire  [15:0] memory_read_data_in_9_1_0 = memory_read_data_in_9_1;	// swiglu.k:43:9
  logic        done_out_0;	// swiglu.k:43:9
  logic [7:0]  memory_read_addr_out_9_1_0;	// swiglu.k:43:9
  logic        memory_rden_out_9_1_0;	// swiglu.k:43:9
  logic [15:0] fifo_data_out_0_0;	// swiglu.k:43:9
  logic        fifo_wren_0_0;	// swiglu.k:43:9
  logic        input_rdy_0_0;	// swiglu.k:43:9
  logic [7:0]  control_state_out_0;	// swiglu.k:43:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// swiglu.k:43:9
  always_comb begin	// swiglu.k:43:9
    input_rdy_0_0 = _GEN;	// swiglu.k:43:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// swiglu.k:43:9
  end // always_comb
  reg   [15:0] p0_data_in_6;	// swiglu.k:43:9
  reg          p0_stage1_enable = 1'h0;	// swiglu.k:43:9
  always_comb begin	// swiglu.k:43:9
    memory_read_addr_out_9_1_0 = p0_data_in_6[15:8];	// swiglu.k:43:9, :46:39, :47:26
    memory_rden_out_9_1_0 = p0_stage1_enable;	// swiglu.k:43:9, :47:26
  end // always_comb
  reg   [15:0] p0_data_in_6_0;	// swiglu.k:43:9
  reg          p0_stage2_enable = 1'h0;	// swiglu.k:43:9
  reg   [15:0] p0_data_in_6_1;	// swiglu.k:43:9
  reg          p0_stage3_enable = 1'h0;	// swiglu.k:43:9
  reg   [12:0] p0__prod_plus_ma32_shl_4_;	// swiglu.k:43:9
  reg   [5:0]  p0_mb;	// swiglu.k:43:9
  reg   [11:0] p0_prod;	// swiglu.k:43:9
  reg   [13:0] p0__ma32_shl_5_;	// swiglu.k:43:9
  reg   [14:0] p0__ma32_shl_6_;	// swiglu.k:43:9
  reg          p0_mb_0;	// swiglu.k:43:9
  reg   [15:0] p0__ma32_shl_7_;	// swiglu.k:43:9
  reg   [15:0] p0__a_exp_plus_b_exp_minus_127_plus_1_;	// swiglu.k:43:9
  reg   [15:0] p0__a_exp_plus_b_exp_minus_127_;	// swiglu.k:43:9
  reg   [15:0] p0_memory_read_data_in_9_1;	// swiglu.k:43:9
  reg   [15:0] p0_data_in_6_2;	// swiglu.k:43:9
  reg          p0__b_exp_ne_0_;	// swiglu.k:43:9
  reg          p0__a_exp_ne_0_;	// swiglu.k:43:9
  reg          p0_stage4_enable = 1'h0;	// swiglu.k:43:9
  reg          p0_prod_0;	// swiglu.k:43:9
  reg   [15:0] p0__a_exp_plus_b_exp_minus_127_plus_1__0;	// swiglu.k:43:9
  reg   [15:0] p0__a_exp_plus_b_exp_minus_127__0;	// swiglu.k:43:9
  reg   [15:0] p0_memory_read_data_in_9_1_0;	// swiglu.k:43:9
  reg   [15:0] p0_data_in_6_3;	// swiglu.k:43:9
  reg   [14:0] p0_prod_1;	// swiglu.k:43:9
  reg          p0__b_exp_ne_0__0;	// swiglu.k:43:9
  reg          p0__a_exp_ne_0__0;	// swiglu.k:43:9
  reg          p0_stage5_enable = 1'h0;	// swiglu.k:43:9
  reg   [15:0] p0_result;	// swiglu.k:43:9
  reg          p0_stage6_enable = 1'h0;	// swiglu.k:43:9
  reg   [15:0] p0_result_0;	// swiglu.k:43:9
  reg          p0_stage7_enable = 1'h0;	// swiglu.k:43:9
  wire         prod = p0_data_in_6_1[6] & memory_read_data_in_9_1_0[0];	// swiglu.k:43:9, :57:{21,33}, :58:{21,33}, :60:35, :61:{21,25}
  wire         prod_0 = p0_data_in_6_1[5] & memory_read_data_in_9_1_0[0];	// swiglu.k:43:9, :57:{21,33}, :58:{21,33}, :60:35, :61:{21,25}
  wire         prod_1 = p0_data_in_6_1[4] & memory_read_data_in_9_1_0[0];	// swiglu.k:43:9, :57:{21,33}, :58:{21,33}, :60:35, :61:{21,25}
  wire         prod_2 = p0_data_in_6_1[3] & memory_read_data_in_9_1_0[0];	// swiglu.k:43:9, :57:{21,33}, :58:{21,33}, :60:35, :61:{21,25}
  wire         prod_3 = p0_data_in_6_1[2] & memory_read_data_in_9_1_0[0];	// swiglu.k:43:9, :57:{21,33}, :58:{21,33}, :60:35, :61:{21,25}
  wire         prod_4 = p0_data_in_6_1[1] & memory_read_data_in_9_1_0[0];	// swiglu.k:43:9, :57:{21,33}, :58:{21,33}, :60:35, :61:{21,25}
  wire         prod_5 = p0_data_in_6_1[0] & memory_read_data_in_9_1_0[0];	// swiglu.k:43:9, :57:{21,33}, :58:{21,33}, :60:35, :61:{21,25}
  wire  [15:0] _a_exp_plus_b_exp_ =
    16'({8'h0, p0_data_in_6_1[14:7]} + {8'h0, memory_read_data_in_9_1_0[14:7]});	// swiglu.k:43:9, :74:39, :79:39
  wire  [9:0]  _prod_plus_ma32_shl_1_ =
    10'({2'h0,
         memory_read_data_in_9_1_0[0],
         prod,
         prod_0,
         prod_1,
         prod_2,
         prod_3,
         prod_4,
         prod_5} + {2'h1, p0_data_in_6_1[6:0], 1'h0});	// swiglu.k:43:9, :58:{21,33}, :61:{21,25}, :62:{51,58}
  wire         prod_6 = _prod_plus_ma32_shl_1_[9] & memory_read_data_in_9_1_0[1];	// swiglu.k:43:9, :58:{21,33}, :62:{21,25,51}
  wire         prod_7 = _prod_plus_ma32_shl_1_[8] & memory_read_data_in_9_1_0[1];	// swiglu.k:43:9, :58:{21,33}, :62:{21,25,51}
  wire         prod_8 =
    _prod_plus_ma32_shl_1_[7]
      ? memory_read_data_in_9_1_0[0] | memory_read_data_in_9_1_0[1]
      : memory_read_data_in_9_1_0[0] & ~(memory_read_data_in_9_1_0[1]);	// swiglu.k:43:9, :58:{21,33}, :62:{21,25,51}
  wire         prod_9 =
    _prod_plus_ma32_shl_1_[6]
      ? prod | memory_read_data_in_9_1_0[1]
      : prod & ~(memory_read_data_in_9_1_0[1]);	// swiglu.k:43:9, :58:{21,33}, :61:{21,25}, :62:{21,25,51}
  wire         prod_10 =
    _prod_plus_ma32_shl_1_[5]
      ? prod_0 | memory_read_data_in_9_1_0[1]
      : prod_0 & ~(memory_read_data_in_9_1_0[1]);	// swiglu.k:43:9, :58:{21,33}, :61:{21,25}, :62:{21,25,51}
  wire         prod_11 =
    _prod_plus_ma32_shl_1_[4]
      ? prod_1 | memory_read_data_in_9_1_0[1]
      : prod_1 & ~(memory_read_data_in_9_1_0[1]);	// swiglu.k:43:9, :58:{21,33}, :61:{21,25}, :62:{21,25,51}
  wire         prod_12 =
    _prod_plus_ma32_shl_1_[3]
      ? prod_2 | memory_read_data_in_9_1_0[1]
      : prod_2 & ~(memory_read_data_in_9_1_0[1]);	// swiglu.k:43:9, :58:{21,33}, :61:{21,25}, :62:{21,25,51}
  wire         prod_13 =
    _prod_plus_ma32_shl_1_[2]
      ? prod_3 | memory_read_data_in_9_1_0[1]
      : prod_3 & ~(memory_read_data_in_9_1_0[1]);	// swiglu.k:43:9, :58:{21,33}, :61:{21,25}, :62:{21,25,51}
  wire         prod_14 =
    _prod_plus_ma32_shl_1_[1]
      ? prod_4 | memory_read_data_in_9_1_0[1]
      : prod_4 & ~(memory_read_data_in_9_1_0[1]);	// swiglu.k:43:9, :58:{21,33}, :61:{21,25}, :62:{21,25,51}
  wire         prod_15 =
    _prod_plus_ma32_shl_1_[0]
      ? prod_5 | memory_read_data_in_9_1_0[1]
      : prod_5 & ~(memory_read_data_in_9_1_0[1]);	// swiglu.k:43:9, :58:{21,33}, :61:{21,25}, :62:{21,25,51}
  wire  [10:0] _prod_plus_ma32_shl_2_ =
    11'({1'h0,
         prod_6,
         prod_7,
         prod_8,
         prod_9,
         prod_10,
         prod_11,
         prod_12,
         prod_13,
         prod_14,
         prod_15} + {2'h1, p0_data_in_6_1[6:0], 2'h0});	// swiglu.k:43:9, :62:{21,25}, :63:{51,58}
  wire         prod_16 = _prod_plus_ma32_shl_2_[10] & memory_read_data_in_9_1_0[2];	// swiglu.k:43:9, :58:{21,33}, :63:{21,25,51}
  wire         prod_17 =
    _prod_plus_ma32_shl_2_[9]
      ? prod_6 | memory_read_data_in_9_1_0[2]
      : prod_6 & ~(memory_read_data_in_9_1_0[2]);	// swiglu.k:43:9, :58:{21,33}, :62:{21,25}, :63:{21,25,51}
  wire         prod_18 =
    _prod_plus_ma32_shl_2_[8]
      ? prod_7 | memory_read_data_in_9_1_0[2]
      : prod_7 & ~(memory_read_data_in_9_1_0[2]);	// swiglu.k:43:9, :58:{21,33}, :62:{21,25}, :63:{21,25,51}
  wire         prod_19 =
    _prod_plus_ma32_shl_2_[7]
      ? prod_8 | memory_read_data_in_9_1_0[2]
      : prod_8 & ~(memory_read_data_in_9_1_0[2]);	// swiglu.k:43:9, :58:{21,33}, :62:{21,25}, :63:{21,25,51}
  wire         prod_20 =
    _prod_plus_ma32_shl_2_[6]
      ? prod_9 | memory_read_data_in_9_1_0[2]
      : prod_9 & ~(memory_read_data_in_9_1_0[2]);	// swiglu.k:43:9, :58:{21,33}, :62:{21,25}, :63:{21,25,51}
  wire         prod_21 =
    _prod_plus_ma32_shl_2_[5]
      ? prod_10 | memory_read_data_in_9_1_0[2]
      : prod_10 & ~(memory_read_data_in_9_1_0[2]);	// swiglu.k:43:9, :58:{21,33}, :62:{21,25}, :63:{21,25,51}
  wire         prod_22 =
    _prod_plus_ma32_shl_2_[4]
      ? prod_11 | memory_read_data_in_9_1_0[2]
      : prod_11 & ~(memory_read_data_in_9_1_0[2]);	// swiglu.k:43:9, :58:{21,33}, :62:{21,25}, :63:{21,25,51}
  wire         prod_23 =
    _prod_plus_ma32_shl_2_[3]
      ? prod_12 | memory_read_data_in_9_1_0[2]
      : prod_12 & ~(memory_read_data_in_9_1_0[2]);	// swiglu.k:43:9, :58:{21,33}, :62:{21,25}, :63:{21,25,51}
  wire         prod_24 =
    _prod_plus_ma32_shl_2_[2]
      ? prod_13 | memory_read_data_in_9_1_0[2]
      : prod_13 & ~(memory_read_data_in_9_1_0[2]);	// swiglu.k:43:9, :58:{21,33}, :62:{21,25}, :63:{21,25,51}
  wire         prod_25 =
    _prod_plus_ma32_shl_2_[1]
      ? prod_14 | memory_read_data_in_9_1_0[2]
      : prod_14 & ~(memory_read_data_in_9_1_0[2]);	// swiglu.k:43:9, :58:{21,33}, :62:{21,25}, :63:{21,25,51}
  wire         prod_26 =
    _prod_plus_ma32_shl_2_[0]
      ? prod_15 | memory_read_data_in_9_1_0[2]
      : prod_15 & ~(memory_read_data_in_9_1_0[2]);	// swiglu.k:43:9, :58:{21,33}, :62:{21,25}, :63:{21,25,51}
  wire  [11:0] _prod_plus_ma32_shl_3_ =
    12'({1'h0,
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
         prod_26} + {2'h1, p0_data_in_6_1[6:0], 3'h0});	// swiglu.k:43:9, :63:{21,25}, :64:{51,58}
  wire         prod_27 = _prod_plus_ma32_shl_3_[11] & memory_read_data_in_9_1_0[3];	// swiglu.k:43:9, :58:{21,33}, :64:{21,25,51}
  wire         prod_28 =
    _prod_plus_ma32_shl_3_[10]
      ? prod_16 | memory_read_data_in_9_1_0[3]
      : prod_16 & ~(memory_read_data_in_9_1_0[3]);	// swiglu.k:43:9, :58:{21,33}, :63:{21,25}, :64:{21,25,51}
  wire         prod_29 =
    _prod_plus_ma32_shl_3_[9]
      ? prod_17 | memory_read_data_in_9_1_0[3]
      : prod_17 & ~(memory_read_data_in_9_1_0[3]);	// swiglu.k:43:9, :58:{21,33}, :63:{21,25}, :64:{21,25,51}
  wire         prod_30 =
    _prod_plus_ma32_shl_3_[8]
      ? prod_18 | memory_read_data_in_9_1_0[3]
      : prod_18 & ~(memory_read_data_in_9_1_0[3]);	// swiglu.k:43:9, :58:{21,33}, :63:{21,25}, :64:{21,25,51}
  wire         prod_31 =
    _prod_plus_ma32_shl_3_[7]
      ? prod_19 | memory_read_data_in_9_1_0[3]
      : prod_19 & ~(memory_read_data_in_9_1_0[3]);	// swiglu.k:43:9, :58:{21,33}, :63:{21,25}, :64:{21,25,51}
  wire         prod_32 =
    _prod_plus_ma32_shl_3_[6]
      ? prod_20 | memory_read_data_in_9_1_0[3]
      : prod_20 & ~(memory_read_data_in_9_1_0[3]);	// swiglu.k:43:9, :58:{21,33}, :63:{21,25}, :64:{21,25,51}
  wire         prod_33 =
    _prod_plus_ma32_shl_3_[5]
      ? prod_21 | memory_read_data_in_9_1_0[3]
      : prod_21 & ~(memory_read_data_in_9_1_0[3]);	// swiglu.k:43:9, :58:{21,33}, :63:{21,25}, :64:{21,25,51}
  wire         prod_34 =
    _prod_plus_ma32_shl_3_[4]
      ? prod_22 | memory_read_data_in_9_1_0[3]
      : prod_22 & ~(memory_read_data_in_9_1_0[3]);	// swiglu.k:43:9, :58:{21,33}, :63:{21,25}, :64:{21,25,51}
  wire         prod_35 =
    _prod_plus_ma32_shl_3_[3]
      ? prod_23 | memory_read_data_in_9_1_0[3]
      : prod_23 & ~(memory_read_data_in_9_1_0[3]);	// swiglu.k:43:9, :58:{21,33}, :63:{21,25}, :64:{21,25,51}
  wire         prod_36 =
    _prod_plus_ma32_shl_3_[2]
      ? prod_24 | memory_read_data_in_9_1_0[3]
      : prod_24 & ~(memory_read_data_in_9_1_0[3]);	// swiglu.k:43:9, :58:{21,33}, :63:{21,25}, :64:{21,25,51}
  wire         prod_37 =
    _prod_plus_ma32_shl_3_[1]
      ? prod_25 | memory_read_data_in_9_1_0[3]
      : prod_25 & ~(memory_read_data_in_9_1_0[3]);	// swiglu.k:43:9, :58:{21,33}, :63:{21,25}, :64:{21,25,51}
  wire         prod_38 =
    _prod_plus_ma32_shl_3_[0]
      ? prod_26 | memory_read_data_in_9_1_0[3]
      : prod_26 & ~(memory_read_data_in_9_1_0[3]);	// swiglu.k:43:9, :58:{21,33}, :63:{21,25}, :64:{21,25,51}
  wire         prod_39 = p0__prod_plus_ma32_shl_4_[12] & p0_mb[4];	// swiglu.k:43:9, :65:{21,25}
  wire         prod_40 =
    p0__prod_plus_ma32_shl_4_[11] ? p0_prod[11] | p0_mb[4] : p0_prod[11] & ~(p0_mb[4]);	// swiglu.k:43:9, :65:{21,25}
  wire         prod_41 =
    p0__prod_plus_ma32_shl_4_[10] ? p0_prod[10] | p0_mb[4] : p0_prod[10] & ~(p0_mb[4]);	// swiglu.k:43:9, :65:{21,25}
  wire         prod_42 =
    p0__prod_plus_ma32_shl_4_[9] ? p0_prod[9] | p0_mb[4] : p0_prod[9] & ~(p0_mb[4]);	// swiglu.k:43:9, :65:{21,25}
  wire         prod_43 =
    p0__prod_plus_ma32_shl_4_[8] ? p0_prod[8] | p0_mb[4] : p0_prod[8] & ~(p0_mb[4]);	// swiglu.k:43:9, :65:{21,25}
  wire         prod_44 =
    p0__prod_plus_ma32_shl_4_[7] ? p0_prod[7] | p0_mb[4] : p0_prod[7] & ~(p0_mb[4]);	// swiglu.k:43:9, :65:{21,25}
  wire         prod_45 =
    p0__prod_plus_ma32_shl_4_[6] ? p0_prod[6] | p0_mb[4] : p0_prod[6] & ~(p0_mb[4]);	// swiglu.k:43:9, :65:{21,25}
  wire         prod_46 =
    p0__prod_plus_ma32_shl_4_[5] ? p0_prod[5] | p0_mb[4] : p0_prod[5] & ~(p0_mb[4]);	// swiglu.k:43:9, :65:{21,25}
  wire         prod_47 =
    p0__prod_plus_ma32_shl_4_[4] ? p0_prod[4] | p0_mb[4] : p0_prod[4] & ~(p0_mb[4]);	// swiglu.k:43:9, :65:{21,25}
  wire         prod_48 =
    p0__prod_plus_ma32_shl_4_[3] ? p0_prod[3] | p0_mb[4] : p0_prod[3] & ~(p0_mb[4]);	// swiglu.k:43:9, :65:{21,25}
  wire         prod_49 =
    p0__prod_plus_ma32_shl_4_[2] ? p0_prod[2] | p0_mb[4] : p0_prod[2] & ~(p0_mb[4]);	// swiglu.k:43:9, :65:{21,25}
  wire         prod_50 =
    p0__prod_plus_ma32_shl_4_[1] ? p0_prod[1] | p0_mb[4] : p0_prod[1] & ~(p0_mb[4]);	// swiglu.k:43:9, :65:{21,25}
  wire         prod_51 =
    p0__prod_plus_ma32_shl_4_[0] ? p0_prod[0] | p0_mb[4] : p0_prod[0] & ~(p0_mb[4]);	// swiglu.k:43:9, :65:{21,25}
  wire  [13:0] _prod_plus_ma32_shl_5_ =
    14'({1'h0,
         prod_39,
         prod_40,
         prod_41,
         prod_42,
         prod_43,
         prod_44,
         prod_45,
         prod_46,
         prod_47,
         prod_48,
         prod_49,
         prod_50,
         prod_51} + p0__ma32_shl_5_);	// swiglu.k:43:9, :65:{21,25}, :66:51
  wire         prod_52 = _prod_plus_ma32_shl_5_[13] & p0_mb[5];	// swiglu.k:43:9, :66:{21,25,51}
  wire         prod_53 =
    _prod_plus_ma32_shl_5_[12] ? prod_39 | p0_mb[5] : prod_39 & ~(p0_mb[5]);	// swiglu.k:43:9, :65:{21,25}, :66:{21,25,51}
  wire         prod_54 =
    _prod_plus_ma32_shl_5_[11] ? prod_40 | p0_mb[5] : prod_40 & ~(p0_mb[5]);	// swiglu.k:43:9, :65:{21,25}, :66:{21,25,51}
  wire         prod_55 =
    _prod_plus_ma32_shl_5_[10] ? prod_41 | p0_mb[5] : prod_41 & ~(p0_mb[5]);	// swiglu.k:43:9, :65:{21,25}, :66:{21,25,51}
  wire         prod_56 =
    _prod_plus_ma32_shl_5_[9] ? prod_42 | p0_mb[5] : prod_42 & ~(p0_mb[5]);	// swiglu.k:43:9, :65:{21,25}, :66:{21,25,51}
  wire         prod_57 =
    _prod_plus_ma32_shl_5_[8] ? prod_43 | p0_mb[5] : prod_43 & ~(p0_mb[5]);	// swiglu.k:43:9, :65:{21,25}, :66:{21,25,51}
  wire         prod_58 =
    _prod_plus_ma32_shl_5_[7] ? prod_44 | p0_mb[5] : prod_44 & ~(p0_mb[5]);	// swiglu.k:43:9, :65:{21,25}, :66:{21,25,51}
  wire         prod_59 =
    _prod_plus_ma32_shl_5_[6] ? prod_45 | p0_mb[5] : prod_45 & ~(p0_mb[5]);	// swiglu.k:43:9, :65:{21,25}, :66:{21,25,51}
  wire         prod_60 =
    _prod_plus_ma32_shl_5_[5] ? prod_46 | p0_mb[5] : prod_46 & ~(p0_mb[5]);	// swiglu.k:43:9, :65:{21,25}, :66:{21,25,51}
  wire         prod_61 =
    _prod_plus_ma32_shl_5_[4] ? prod_47 | p0_mb[5] : prod_47 & ~(p0_mb[5]);	// swiglu.k:43:9, :65:{21,25}, :66:{21,25,51}
  wire         prod_62 =
    _prod_plus_ma32_shl_5_[3] ? prod_48 | p0_mb[5] : prod_48 & ~(p0_mb[5]);	// swiglu.k:43:9, :65:{21,25}, :66:{21,25,51}
  wire         prod_63 =
    _prod_plus_ma32_shl_5_[2] ? prod_49 | p0_mb[5] : prod_49 & ~(p0_mb[5]);	// swiglu.k:43:9, :65:{21,25}, :66:{21,25,51}
  wire         prod_64 =
    _prod_plus_ma32_shl_5_[1] ? prod_50 | p0_mb[5] : prod_50 & ~(p0_mb[5]);	// swiglu.k:43:9, :65:{21,25}, :66:{21,25,51}
  wire         prod_65 =
    _prod_plus_ma32_shl_5_[0] ? prod_51 | p0_mb[5] : prod_51 & ~(p0_mb[5]);	// swiglu.k:43:9, :65:{21,25}, :66:{21,25,51}
  wire  [14:0] _prod_plus_ma32_shl_6_ =
    15'({1'h0,
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
         prod_65} + p0__ma32_shl_6_);	// swiglu.k:43:9, :66:{21,25}, :67:51
  wire  [15:0] _prod_plus_ma32_shl_7_ =
    16'({1'h0,
         _prod_plus_ma32_shl_6_[14] & p0_mb_0,
         _prod_plus_ma32_shl_6_[13] ? prod_52 | p0_mb_0 : prod_52 & ~p0_mb_0,
         _prod_plus_ma32_shl_6_[12] ? prod_53 | p0_mb_0 : prod_53 & ~p0_mb_0,
         _prod_plus_ma32_shl_6_[11] ? prod_54 | p0_mb_0 : prod_54 & ~p0_mb_0,
         _prod_plus_ma32_shl_6_[10] ? prod_55 | p0_mb_0 : prod_55 & ~p0_mb_0,
         _prod_plus_ma32_shl_6_[9] ? prod_56 | p0_mb_0 : prod_56 & ~p0_mb_0,
         _prod_plus_ma32_shl_6_[8] ? prod_57 | p0_mb_0 : prod_57 & ~p0_mb_0,
         _prod_plus_ma32_shl_6_[7] ? prod_58 | p0_mb_0 : prod_58 & ~p0_mb_0,
         _prod_plus_ma32_shl_6_[6] ? prod_59 | p0_mb_0 : prod_59 & ~p0_mb_0,
         _prod_plus_ma32_shl_6_[5] ? prod_60 | p0_mb_0 : prod_60 & ~p0_mb_0,
         _prod_plus_ma32_shl_6_[4] ? prod_61 | p0_mb_0 : prod_61 & ~p0_mb_0,
         _prod_plus_ma32_shl_6_[3] ? prod_62 | p0_mb_0 : prod_62 & ~p0_mb_0,
         _prod_plus_ma32_shl_6_[2] ? prod_63 | p0_mb_0 : prod_63 & ~p0_mb_0,
         _prod_plus_ma32_shl_6_[1] ? prod_64 | p0_mb_0 : prod_64 & ~p0_mb_0,
         _prod_plus_ma32_shl_6_[0] ? prod_65 | p0_mb_0 : prod_65 & ~p0_mb_0}
        + p0__ma32_shl_7_);	// swiglu.k:43:9, :66:{21,25}, :67:{21,51}, :68:51
  wire  [15:0] r_exp =
    p0_prod_0
      ? p0__a_exp_plus_b_exp_minus_127_plus_1__0
      : p0__a_exp_plus_b_exp_minus_127__0;	// swiglu.k:43:9, :71:21
  wire         _GEN_0 = r_exp < 16'hFF & (|r_exp);	// swiglu.k:56:{21,37,38,58}, :71:21, :73:{34,47}, :78:{34,47}, :81:{21,25,31,44}, :83:{34,49,51}
  wire         _GEN_1 = ~p0_prod_0 & _GEN_0;	// swiglu.k:43:9, :56:{21,37,38,58}, :71:21, :73:{34,47}, :78:{34,47}, :81:{21,25}, :83:{34,49,51}
  wire         _GEN_2 = p0__b_exp_ne_0__0 & p0__a_exp_ne_0__0;	// swiglu.k:43:9, :54:{17,21}
  always @(posedge clk) begin	// swiglu.k:43:9
    p0_data_in_6 <= data_in_6;	// swiglu.k:43:9
    if (rst)	// swiglu.k:43:9
      p0_stage1_enable <= 1'h0;	// swiglu.k:43:9
    else	// swiglu.k:43:9
      p0_stage1_enable <= _GEN & input_valid_0;	// swiglu.k:43:9
    p0_data_in_6_0 <= p0_data_in_6;	// swiglu.k:43:9
    if (rst)	// swiglu.k:43:9
      p0_stage2_enable <= 1'h0;	// swiglu.k:43:9
    else	// swiglu.k:43:9
      p0_stage2_enable <= p0_stage1_enable;	// swiglu.k:43:9
    p0_data_in_6_1 <= p0_data_in_6_0;	// swiglu.k:43:9
    if (rst)	// swiglu.k:43:9
      p0_stage3_enable <= 1'h0;	// swiglu.k:43:9
    else	// swiglu.k:43:9
      p0_stage3_enable <= p0_stage2_enable;	// swiglu.k:43:9
    p0__prod_plus_ma32_shl_4_ <=
      13'({1'h0,
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
           prod_38} + {2'h1, p0_data_in_6_1[6:0], 4'h0});	// swiglu.k:43:9, :64:{21,25}, :65:{51,58}
    p0_mb <= memory_read_data_in_9_1_0[5:0];	// swiglu.k:43:9
    p0_prod <=
      {prod_27,
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
       prod_38};	// swiglu.k:43:9, :64:{21,25}
    p0__ma32_shl_5_ <= {2'h1, p0_data_in_6_1[6:0], 5'h0};	// swiglu.k:43:9, :66:58
    p0__ma32_shl_6_ <= {2'h1, p0_data_in_6_1[6:0], 6'h0};	// swiglu.k:43:9, :67:58
    p0_mb_0 <= memory_read_data_in_9_1_0[6];	// swiglu.k:43:9, :58:{21,33}
    p0__ma32_shl_7_ <= {2'h1, p0_data_in_6_1[6:0], 7'h0};	// swiglu.k:43:9, :68:58
    p0__a_exp_plus_b_exp_minus_127_plus_1_ <= 16'(_a_exp_plus_b_exp_ - 16'h7E);	// swiglu.k:43:9, :74:{33,39,47}, :79:39
    p0__a_exp_plus_b_exp_minus_127_ <= 16'(_a_exp_plus_b_exp_ - 16'h7F);	// swiglu.k:43:9, :74:39, :79:{33,39}
    p0_memory_read_data_in_9_1 <= memory_read_data_in_9_1_0;	// swiglu.k:43:9
    p0_data_in_6_2 <= p0_data_in_6_1;	// swiglu.k:43:9
    p0__b_exp_ne_0_ <= |(memory_read_data_in_9_1_0[14:7]);	// swiglu.k:43:9, :53:{17,32}, :54:41
    p0__a_exp_ne_0_ <= |(p0_data_in_6_1[14:7]);	// swiglu.k:43:9, :52:{17,32}, :54:27
    if (rst)	// swiglu.k:43:9
      p0_stage4_enable <= 1'h0;	// swiglu.k:43:9
    else	// swiglu.k:43:9
      p0_stage4_enable <= p0_stage3_enable;	// swiglu.k:43:9
    p0_prod_0 <= _prod_plus_ma32_shl_7_[15];	// swiglu.k:43:9, :68:{21,51}
    p0__a_exp_plus_b_exp_minus_127_plus_1__0 <= p0__a_exp_plus_b_exp_minus_127_plus_1_;	// swiglu.k:43:9
    p0__a_exp_plus_b_exp_minus_127__0 <= p0__a_exp_plus_b_exp_minus_127_;	// swiglu.k:43:9
    p0_memory_read_data_in_9_1_0 <= p0_memory_read_data_in_9_1;	// swiglu.k:43:9
    p0_data_in_6_3 <= p0_data_in_6_2;	// swiglu.k:43:9
    p0_prod_1 <= _prod_plus_ma32_shl_7_[14:0];	// swiglu.k:43:9, :68:51
    p0__b_exp_ne_0__0 <= p0__b_exp_ne_0_;	// swiglu.k:43:9
    p0__a_exp_ne_0__0 <= p0__a_exp_ne_0_;	// swiglu.k:43:9
    if (rst)	// swiglu.k:43:9
      p0_stage5_enable <= 1'h0;	// swiglu.k:43:9
    else	// swiglu.k:43:9
      p0_stage5_enable <= p0_stage4_enable;	// swiglu.k:43:9
    p0_result <=
      {(r_exp[8]
          ? _GEN_0
          : p0_memory_read_data_in_9_1_0[15]
              ? ~(p0_data_in_6_3[15]) & _GEN_0
              : p0_data_in_6_3[15] & _GEN_0) & _GEN_2,
       r_exp[7] & _GEN_0 & _GEN_2,
       r_exp[6] & _GEN_0 & _GEN_2,
       r_exp[5] & _GEN_0 & _GEN_2,
       r_exp[4] & _GEN_0 & _GEN_2,
       r_exp[3] & _GEN_0 & _GEN_2,
       r_exp[2] & _GEN_0 & _GEN_2,
       r_exp[1] & _GEN_0 & _GEN_2,
       r_exp[0] & _GEN_0 & _GEN_2,
       (p0_prod_1[14] ? (p0_prod_1[13] | p0_prod_0) & _GEN_0 : p0_prod_1[13] & _GEN_1)
         & _GEN_2,
       (p0_prod_1[13] ? (p0_prod_1[12] | p0_prod_0) & _GEN_0 : p0_prod_1[12] & _GEN_1)
         & _GEN_2,
       (p0_prod_1[12] ? (p0_prod_1[11] | p0_prod_0) & _GEN_0 : p0_prod_1[11] & _GEN_1)
         & _GEN_2,
       (p0_prod_1[11] ? (p0_prod_1[10] | p0_prod_0) & _GEN_0 : p0_prod_1[10] & _GEN_1)
         & _GEN_2,
       (p0_prod_1[10] ? (p0_prod_1[9] | p0_prod_0) & _GEN_0 : p0_prod_1[9] & _GEN_1)
         & _GEN_2,
       (p0_prod_1[9] ? (p0_prod_1[8] | p0_prod_0) & _GEN_0 : p0_prod_1[8] & _GEN_1)
         & _GEN_2,
       (p0_prod_1[8] ? (p0_prod_1[7] | p0_prod_0) & _GEN_0 : p0_prod_1[7] & _GEN_1)
         & _GEN_2};	// swiglu.k:43:9, :54:{17,21}, :56:{21,37,38,58}, :71:21, :73:{34,47}, :78:{34,47}, :81:{21,25}, :83:{34,49,51}
    if (rst)	// swiglu.k:43:9
      p0_stage6_enable <= 1'h0;	// swiglu.k:43:9
    else	// swiglu.k:43:9
      p0_stage6_enable <= p0_stage5_enable;	// swiglu.k:43:9
    p0_result_0 <= p0_result;	// swiglu.k:43:9
    if (rst)	// swiglu.k:43:9
      p0_stage7_enable <= 1'h0;	// swiglu.k:43:9
    else	// swiglu.k:43:9
      p0_stage7_enable <= p0_stage6_enable;	// swiglu.k:43:9
  end // always @(posedge)
  always_comb begin	// swiglu.k:43:9
    fifo_wren_0_0 = p0_stage7_enable;	// swiglu.k:41:5, :43:9
    fifo_data_out_0_0 = p0_result_0;	// swiglu.k:41:5, :43:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// swiglu.k:43:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// swiglu.k:43:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  swiglu_unitDebugView_compute_siluEntry swiglu_unitDebugView_compute_siluEntry_instance (	// swiglu.k:41:5
    .clk        (clk),	// swiglu.k:41:5
    ._gate_bf16 (p0_stage1_enable ? p0_data_in_6 : 'x),	// swiglu.k:41:5, :43:9
    .valid      (p0_stage1_enable),	// swiglu.k:43:9
    .valid_out  (/* unused */)
  );	// swiglu.k:41:5
  swiglu_unitDebugView_compute_siluExit swiglu_unitDebugView_compute_siluExit_instance (	// swiglu.k:41:5
    .clk          (clk),	// swiglu.k:41:5
    ._ReturnValue (p0_stage6_enable ? p0_result : 'x),	// swiglu.k:41:5, :43:9
    .valid        (p0_stage6_enable),	// swiglu.k:43:9
    .valid_out    (/* unused */)
  );	// swiglu.k:41:5
  assign done_out = p0_stage7_enable;	// swiglu.k:43:9
  assign memory_read_addr_out_9_1 = memory_read_addr_out_9_1_0;	// swiglu.k:43:9
  assign memory_rden_out_9_1 = memory_rden_out_9_1_0;	// swiglu.k:43:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// swiglu.k:43:9
  assign fifo_wren_0 = fifo_wren_0_0;	// swiglu.k:43:9
  assign input_rdy_0 = input_rdy_0_0;	// swiglu.k:43:9
  assign control_state_out = control_state_out_0;	// swiglu.k:43:9
endmodule

module swiglu_unit_lookup_sigmoid_BasicBlock_0(	// swiglu.k:28:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  input  wire [15:0] memory_read_data_in_9_0,
  output wire [7:0]  memory_read_addr_out_9_0,
  output wire        memory_rden_out_9_0,
  output wire [15:0] fifo_data_out_0,
  output wire        fifo_wren_0,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [7:0]  data_in_5,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  wire  [15:0] memory_read_data_in_9_0_0 = memory_read_data_in_9_0;	// swiglu.k:28:9
  logic        done_out_0;	// swiglu.k:28:9
  logic [7:0]  memory_read_addr_out_9_0_0;	// swiglu.k:28:9
  logic        memory_rden_out_9_0_0;	// swiglu.k:28:9
  logic [15:0] fifo_data_out_0_0;	// swiglu.k:28:9
  logic        fifo_wren_0_0;	// swiglu.k:28:9
  logic        input_rdy_0_0;	// swiglu.k:28:9
  logic [7:0]  control_state_out_0;	// swiglu.k:28:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// swiglu.k:28:9
  wire         _GEN_0 = _GEN & input_valid_0;	// swiglu.k:28:9
  always_comb begin	// swiglu.k:28:9
    input_rdy_0_0 = _GEN;	// swiglu.k:28:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// swiglu.k:28:9
  end // always_comb
  always_comb begin	// swiglu.k:28:9
    memory_read_addr_out_9_0_0 = data_in_5;	// swiglu.k:31:22
    memory_rden_out_9_0_0 = _GEN_0;	// swiglu.k:28:9, :31:22
  end // always_comb
  reg   [7:0]  p0_data_in_5;	// swiglu.k:28:9
  reg          p0_stage1_enable = 1'h0;	// swiglu.k:28:9
  reg          p0_stage2_enable = 1'h0;	// swiglu.k:28:9
  reg   [15:0] p0_memory_read_data_in_9_0;	// swiglu.k:28:9
  reg          p0_stage3_enable = 1'h0;	// swiglu.k:28:9
  always @(posedge clk) begin	// swiglu.k:28:9
    p0_data_in_5 <= data_in_5;	// swiglu.k:28:9
    if (rst) begin	// swiglu.k:28:9
      p0_stage1_enable <= 1'h0;	// swiglu.k:28:9
      p0_stage2_enable <= 1'h0;	// swiglu.k:28:9
    end
    else begin	// swiglu.k:28:9
      p0_stage1_enable <= _GEN_0;	// swiglu.k:28:9
      p0_stage2_enable <= p0_stage1_enable;	// swiglu.k:28:9
    end
    p0_memory_read_data_in_9_0 <= memory_read_data_in_9_0_0;	// swiglu.k:28:9
    if (rst)	// swiglu.k:28:9
      p0_stage3_enable <= 1'h0;	// swiglu.k:28:9
    else	// swiglu.k:28:9
      p0_stage3_enable <= p0_stage2_enable;	// swiglu.k:28:9
  end // always @(posedge)
  always_comb begin	// swiglu.k:28:9
    fifo_wren_0_0 = p0_stage3_enable;	// swiglu.k:26:5, :28:9
    fifo_data_out_0_0 = p0_memory_read_data_in_9_0;	// swiglu.k:26:5, :28:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// swiglu.k:28:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// swiglu.k:28:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  swiglu_unitDebugView_lookup_sigmoidEntry swiglu_unitDebugView_lookup_sigmoidEntry_instance (	// swiglu.k:26:5
    .clk       (clk),	// swiglu.k:26:5
    ._index    (p0_stage1_enable ? p0_data_in_5 : 'x),	// swiglu.k:26:5, :28:9
    .valid     (p0_stage1_enable),	// swiglu.k:28:9
    .valid_out (/* unused */)
  );	// swiglu.k:26:5
  swiglu_unitDebugView_lookup_sigmoidExit swiglu_unitDebugView_lookup_sigmoidExit_instance (	// swiglu.k:26:5
    .clk          (clk),	// swiglu.k:26:5
    ._ReturnValue (p0_stage2_enable ? memory_read_data_in_9_0_0 : 'x),	// swiglu.k:26:5, :28:9
    .valid        (p0_stage2_enable),	// swiglu.k:28:9
    .valid_out    (/* unused */)
  );	// swiglu.k:26:5
  assign done_out = p0_stage3_enable;	// swiglu.k:28:9
  assign memory_read_addr_out_9_0 = memory_read_addr_out_9_0_0;	// swiglu.k:28:9
  assign memory_rden_out_9_0 = memory_rden_out_9_0_0;	// swiglu.k:28:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// swiglu.k:28:9
  assign fifo_wren_0 = fifo_wren_0_0;	// swiglu.k:28:9
  assign input_rdy_0 = input_rdy_0_0;	// swiglu.k:28:9
  assign control_state_out = control_state_out_0;	// swiglu.k:28:9
endmodule

module swiglu_unit_set_sigmoid_lut_BasicBlock_0(	// swiglu.k:19:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  output wire [15:0] memory_write_data_out_9_0,
  output wire [7:0]  memory_write_addr_out_9_0,
  output wire        memory_wren_9_0,
  output wire        fifo_wren_0,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [23:0] data_in_4,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  logic        done_out_0;	// swiglu.k:19:9
  logic [15:0] memory_write_data_out_9_0_0;	// swiglu.k:19:9
  logic [7:0]  memory_write_addr_out_9_0_0;	// swiglu.k:19:9
  logic        memory_wren_9_0_0;	// swiglu.k:19:9
  logic        fifo_wren_0_0;	// swiglu.k:19:9
  logic        input_rdy_0_0;	// swiglu.k:19:9
  logic [7:0]  control_state_out_0;	// swiglu.k:19:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// swiglu.k:19:9
  wire         _GEN_0 = _GEN & input_valid_0;	// swiglu.k:19:9
  always_comb begin	// swiglu.k:19:9
    input_rdy_0_0 = _GEN;	// swiglu.k:19:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// swiglu.k:19:9
  end // always_comb
  always_comb begin	// swiglu.k:19:9
    memory_wren_9_0_0 = _GEN_0;	// swiglu.k:19:9, :21:13
    memory_write_addr_out_9_0_0 = data_in_4[7:0];	// swiglu.k:21:13
    memory_write_data_out_9_0_0 = data_in_4[23:8];	// swiglu.k:21:13
  end // always_comb
  reg   [7:0]  p0_index;	// swiglu.k:19:9
  reg   [15:0] p0_value;	// swiglu.k:19:9
  reg          p0_stage1_enable = 1'h0;	// swiglu.k:19:9
  reg          p0_stage2_enable = 1'h0;	// swiglu.k:19:9
  always @(posedge clk) begin	// swiglu.k:19:9
    p0_index <= data_in_4[7:0];	// swiglu.k:19:9
    p0_value <= data_in_4[23:8];	// swiglu.k:19:9
    if (rst) begin	// swiglu.k:19:9
      p0_stage1_enable <= 1'h0;	// swiglu.k:19:9
      p0_stage2_enable <= 1'h0;	// swiglu.k:19:9
    end
    else begin	// swiglu.k:19:9
      p0_stage1_enable <= _GEN_0;	// swiglu.k:19:9
      p0_stage2_enable <= p0_stage1_enable;	// swiglu.k:19:9
    end
  end // always @(posedge)
  always_comb	// swiglu.k:19:9
    fifo_wren_0_0 = p0_stage2_enable;	// swiglu.k:19:9, :23:9
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// swiglu.k:19:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// swiglu.k:19:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  swiglu_unitDebugView_set_sigmoid_lutEntry swiglu_unitDebugView_set_sigmoid_lutEntry_instance (	// swiglu.k:23:9
    .clk       (clk),	// swiglu.k:23:9
    ._index    (p0_stage1_enable ? p0_index : 'x),	// swiglu.k:19:9, :23:9
    ._value    (p0_stage1_enable ? p0_value : 'x),	// swiglu.k:19:9, :23:9
    .valid     (p0_stage1_enable),	// swiglu.k:19:9
    .valid_out (/* unused */)
  );	// swiglu.k:23:9
  assign done_out = p0_stage2_enable;	// swiglu.k:19:9
  assign memory_write_data_out_9_0 = memory_write_data_out_9_0_0;	// swiglu.k:19:9
  assign memory_write_addr_out_9_0 = memory_write_addr_out_9_0_0;	// swiglu.k:19:9
  assign memory_wren_9_0 = memory_wren_9_0_0;	// swiglu.k:19:9
  assign fifo_wren_0 = fifo_wren_0_0;	// swiglu.k:19:9
  assign input_rdy_0 = input_rdy_0_0;	// swiglu.k:19:9
  assign control_state_out = control_state_out_0;	// swiglu.k:19:9
endmodule

module swiglu_unit__sigmoid_lut__mem_container(	// swiglu.k:13:5
  input  wire        clk,
  input  wire        rst,
  input  wire        rden_in_0,
  input  wire [7:0]  read_addr_in_0,
  input  wire        rden_in_1,
  input  wire [7:0]  read_addr_in_1,
  input  wire        rden_in_2,
  input  wire [7:0]  read_addr_in_2,
  input  wire        wren_in_0,
  input  wire [7:0]  write_addr_in_0,
  input  wire [15:0] write_data_in_0,
  output wire [15:0] read_data_out_0,
  output wire [15:0] read_data_out_1,
  output wire [15:0] read_data_out_2,
  output wire        init_completed
);

  wire [1:0][15:0] ___sigmoid_lut_2_data_out;	// swiglu.k:13:5
  wire [1:0][15:0] ___sigmoid_lut_1_data_out;	// swiglu.k:13:5
  wire [1:0][15:0] ___sigmoid_lut_0_data_out;	// swiglu.k:13:5
  wire [1:0][15:0] _GEN = {{16'h0}, {write_data_in_0}};	// swiglu.k:13:5
  wire [1:0]       _GEN_0 = {{1'h0}, {wren_in_0}};	// swiglu.k:13:5
  KanagawaSyncRam #(
    .DATA_WIDTH(16),
    .ADDR_WIDTH(8),
    .DEPTH(256),
    .MAX_DEPTH(512),
    .USE_LUTRAM(0),
    .USE_BRAM(1),
    .USE_OUTPUT_REG(1),
    .WRITE_DELAY(0),
    .USE_HARDENED_BYPASS(0),
    .TRUE_DUAL_PORT(0),
    .SUPPORTS_RW_COLLISIONS(0),
    .ECC(0),
    .INITIAL_DATA_FILE("UNUSED"),
    .DEVICE_FAMILY("mock")
  ) __sigmoid_lut_0 (	// swiglu.k:13:5
    .clk            (clk),	// swiglu.k:13:5
    .rst            (rst),
    .addr_in        ({{read_addr_in_0}, {write_addr_in_0}}),	// swiglu.k:13:5
    .ecc_status_out (/* unused */),
    .wren_in        (_GEN_0),	// swiglu.k:13:5
    .data_in        (_GEN),	// swiglu.k:13:5
    .rden_in        ({{rden_in_0}, {1'h0}}),	// swiglu.k:13:5
    .data_out       (___sigmoid_lut_0_data_out)
  );	// swiglu.k:13:5
  KanagawaSyncRam #(
    .DATA_WIDTH(16),
    .ADDR_WIDTH(8),
    .DEPTH(256),
    .MAX_DEPTH(512),
    .USE_LUTRAM(0),
    .USE_BRAM(1),
    .USE_OUTPUT_REG(1),
    .WRITE_DELAY(0),
    .USE_HARDENED_BYPASS(0),
    .TRUE_DUAL_PORT(0),
    .SUPPORTS_RW_COLLISIONS(0),
    .ECC(0),
    .INITIAL_DATA_FILE("UNUSED"),
    .DEVICE_FAMILY("mock")
  ) __sigmoid_lut_1 (	// swiglu.k:13:5
    .clk            (clk),	// swiglu.k:13:5
    .rst            (rst),
    .addr_in        ({{read_addr_in_1}, {write_addr_in_0}}),	// swiglu.k:13:5
    .ecc_status_out (/* unused */),
    .wren_in        (_GEN_0),	// swiglu.k:13:5
    .data_in        (_GEN),	// swiglu.k:13:5
    .rden_in        ({{rden_in_1}, {1'h0}}),	// swiglu.k:13:5
    .data_out       (___sigmoid_lut_1_data_out)
  );	// swiglu.k:13:5
  KanagawaSyncRam #(
    .DATA_WIDTH(16),
    .ADDR_WIDTH(8),
    .DEPTH(256),
    .MAX_DEPTH(512),
    .USE_LUTRAM(0),
    .USE_BRAM(1),
    .USE_OUTPUT_REG(1),
    .WRITE_DELAY(0),
    .USE_HARDENED_BYPASS(0),
    .TRUE_DUAL_PORT(0),
    .SUPPORTS_RW_COLLISIONS(0),
    .ECC(0),
    .INITIAL_DATA_FILE("UNUSED"),
    .DEVICE_FAMILY("mock")
  ) __sigmoid_lut_2 (	// swiglu.k:13:5
    .clk            (clk),	// swiglu.k:13:5
    .rst            (rst),
    .addr_in        ({{read_addr_in_2}, {write_addr_in_0}}),	// swiglu.k:13:5
    .ecc_status_out (/* unused */),
    .wren_in        (_GEN_0),	// swiglu.k:13:5
    .data_in        (_GEN),	// swiglu.k:13:5
    .rden_in        ({{rden_in_2}, {1'h0}}),	// swiglu.k:13:5
    .data_out       (___sigmoid_lut_2_data_out)
  );	// swiglu.k:13:5
  assign read_data_out_0 = ___sigmoid_lut_0_data_out[1'h1];	// swiglu.k:13:5
  assign read_data_out_1 = ___sigmoid_lut_1_data_out[1'h1];	// swiglu.k:13:5
  assign read_data_out_2 = ___sigmoid_lut_2_data_out[1'h1];	// swiglu.k:13:5
  assign init_completed = 1'h1;	// swiglu.k:13:5
endmodule

module swiglu_unit(
  input  wire        clk,
  input  wire        rst,
  input  wire        set_sigmoid_lut_valid_in,
  input  wire [7:0]  set_sigmoid_lut_index_in,
  input  wire [15:0] set_sigmoid_lut_value_in,
  input  wire        set_sigmoid_lut_rden_in,
  input  wire        lookup_sigmoid_valid_in,
  input  wire [7:0]  lookup_sigmoid_index_in,
  input  wire        lookup_sigmoid_rden_in,
  input  wire        compute_silu_valid_in,
  input  wire [15:0] compute_silu_gate_bf16_in,
  input  wire        compute_silu_rden_in,
  input  wire        compute_swiglu_valid_in,
  input  wire [15:0] compute_swiglu_gate_bf16_in,
  input  wire [15:0] compute_swiglu_up_bf16_in,
  input  wire        compute_swiglu_rden_in,
  input  wire [2:0]  stall_rate_in,
  input  wire        stall_rate_valid_in,
  output wire        rst_and_startup_done_out,
  output wire        set_sigmoid_lut_rdy_out,
  output wire        set_sigmoid_lut_empty_out,
  output wire        lookup_sigmoid_rdy_out,
  output wire        lookup_sigmoid_empty_out,
  output wire [15:0] lookup_sigmoid_result_out,
  output wire        compute_silu_rdy_out,
  output wire        compute_silu_empty_out,
  output wire [15:0] compute_silu_result_out,
  output wire        compute_swiglu_rdy_out,
  output wire        compute_swiglu_empty_out,
  output wire [15:0] compute_swiglu_result_out,
  output wire        stall_rate_supported_out
);

  wire [7:0]  _compute_swiglu_BasicBlock_0Impl_memory_read_addr_out_9_2;	// swiglu.k:101:9
  wire        _compute_swiglu_BasicBlock_0Impl_memory_rden_out_9_2;	// swiglu.k:101:9
  wire [15:0] _compute_swiglu_BasicBlock_0Impl_fifo_data_out_0;	// swiglu.k:101:9
  wire        _compute_swiglu_BasicBlock_0Impl_fifo_wren_0;	// swiglu.k:101:9
  wire        _compute_swiglu_BasicBlock_0Impl_input_rdy_0;	// swiglu.k:101:9
  wire [7:0]  _compute_silu_BasicBlock_0Impl_memory_read_addr_out_9_1;	// swiglu.k:43:9
  wire        _compute_silu_BasicBlock_0Impl_memory_rden_out_9_1;	// swiglu.k:43:9
  wire [15:0] _compute_silu_BasicBlock_0Impl_fifo_data_out_0;	// swiglu.k:43:9
  wire        _compute_silu_BasicBlock_0Impl_fifo_wren_0;	// swiglu.k:43:9
  wire        _compute_silu_BasicBlock_0Impl_input_rdy_0;	// swiglu.k:43:9
  wire [7:0]  _lookup_sigmoid_BasicBlock_0Impl_memory_read_addr_out_9_0;	// swiglu.k:28:9
  wire        _lookup_sigmoid_BasicBlock_0Impl_memory_rden_out_9_0;	// swiglu.k:28:9
  wire [15:0] _lookup_sigmoid_BasicBlock_0Impl_fifo_data_out_0;	// swiglu.k:28:9
  wire        _lookup_sigmoid_BasicBlock_0Impl_fifo_wren_0;	// swiglu.k:28:9
  wire        _lookup_sigmoid_BasicBlock_0Impl_input_rdy_0;	// swiglu.k:28:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_memory_write_data_out_9_0;	// swiglu.k:19:9
  wire [7:0]  _set_sigmoid_lut_BasicBlock_0Impl_memory_write_addr_out_9_0;	// swiglu.k:19:9
  wire        _set_sigmoid_lut_BasicBlock_0Impl_memory_wren_9_0;	// swiglu.k:19:9
  wire        _set_sigmoid_lut_BasicBlock_0Impl_fifo_wren_0;	// swiglu.k:19:9
  wire        _set_sigmoid_lut_BasicBlock_0Impl_input_rdy_0;	// swiglu.k:19:9
  wire        _fifo_3_compute_swiglu_Return_overflow_out;
  wire        _fifo_3_compute_swiglu_Return_underflow_out;
  wire        _fifo_3_compute_swiglu_Return_empty;
  wire        _fifo_3_compute_swiglu_Return_full;
  wire [15:0] _fifo_3_compute_swiglu_Return_q;
  wire        _fifo_2_compute_silu_Return_overflow_out;
  wire        _fifo_2_compute_silu_Return_underflow_out;
  wire        _fifo_2_compute_silu_Return_empty;
  wire        _fifo_2_compute_silu_Return_full;
  wire [15:0] _fifo_2_compute_silu_Return_q;
  wire        _fifo_1_lookup_sigmoid_Return_overflow_out;
  wire        _fifo_1_lookup_sigmoid_Return_underflow_out;
  wire        _fifo_1_lookup_sigmoid_Return_empty;
  wire        _fifo_1_lookup_sigmoid_Return_full;
  wire [15:0] _fifo_1_lookup_sigmoid_Return_q;
  wire        _fifo_0_set_sigmoid_lut_Return_overflow_out;
  wire        _fifo_0_set_sigmoid_lut_Return_underflow_out;
  wire        _fifo_0_set_sigmoid_lut_Return_empty;
  wire        _fifo_0_set_sigmoid_lut_Return_full;
  wire        _has_startup_completed_delayed_3_delay_chain_data_out;
  wire        _has_startup_completed_delayed_2_delay_chain_data_out;
  wire        _has_startup_completed_delayed_1_delay_chain_data_out;
  wire        _has_startup_completed_delayed_0_delay_chain_data_out;
  wire [15:0] __sigmoid_lut_read_data_out_0;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_read_data_out_1;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_read_data_out_2;	// swiglu.k:13:5
  wire        __sigmoid_lut_init_completed;	// swiglu.k:13:5
  wire        _reset_control_rst_and_startup_done_out;
  wire [7:0]  _reset_control_rst_delayed_out;
  wire        _reset_control_reset_sequence_finished_this_cycle_out;
  logic  stall_rate_supported_out_net;
  logic  compute_swiglu_empty_out_net;
  logic [15:0] compute_swiglu_result_out_net;
  logic  compute_swiglu_rdy_out_net;
  logic  compute_silu_empty_out_net;
  logic [15:0] compute_silu_result_out_net;
  logic  compute_silu_rdy_out_net;
  logic  lookup_sigmoid_empty_out_net;
  logic [15:0] lookup_sigmoid_result_out_net;
  logic  lookup_sigmoid_rdy_out_net;
  logic  set_sigmoid_lut_empty_out_net;
  logic  set_sigmoid_lut_rdy_out_net;
  logic  rst_and_startup_done_out_net;

  logic [31:0] dropped_commands;
  //synopsys translate_off
  KanagawaStringTable string_table(.clk(clk));
  //synopsys translate_on
  logic [7:0] reg_rst_delayed;
  logic combined_reset;
  assign combined_reset = rst;
  logic reset_sequence_finished_this_cycle;
  logic has_startup_completed_raw;
  logic has_mem_init_completed;
  wire        _GEN = has_startup_completed_raw & __sigmoid_lut_init_completed;	// swiglu.k:13:5
  logic has_others_completed;
  assign has_others_completed = _GEN;

  logic rst_and_startup_done_raw;

  logic [0:0] rst_array;
  assign rst_array[0] = combined_reset;

  logic has_startup_completed_delayed_0;

  logic has_startup_completed_delayed_1;

  logic has_startup_completed_delayed_2;

  logic has_startup_completed_delayed_3;

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
      logic [15:0] data_in;
      logic [15:0] data_out;
      logic overflow;
      logic underflow;
  } fifo_data_1;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [15:0] data_in;
      logic [15:0] data_out;
      logic overflow;
      logic underflow;
  } fifo_data_2;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [15:0] data_in;
      logic [15:0] data_out;
      logic overflow;
      logic underflow;
  } fifo_data_3;

  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [23:0] data;
      logic underflow;
  } passthrough_data_4;
  assign passthrough_data_4.underflow = 1'b0;
  assign passthrough_data_4.rdy_ext = passthrough_data_4.rdy_int & !(!has_startup_completed_delayed_0);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [7:0] data;
      logic underflow;
  } passthrough_data_5;
  assign passthrough_data_5.underflow = 1'b0;
  assign passthrough_data_5.rdy_ext = passthrough_data_5.rdy_int & !(!has_startup_completed_delayed_1);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [15:0] data;
      logic underflow;
  } passthrough_data_6;
  assign passthrough_data_6.underflow = 1'b0;
  assign passthrough_data_6.rdy_ext = passthrough_data_6.rdy_int & !(!has_startup_completed_delayed_2);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [31:0] data;
      logic underflow;
  } passthrough_data_8;
  assign passthrough_data_8.underflow = 1'b0;
  assign passthrough_data_8.rdy_ext = passthrough_data_8.rdy_int & !(!has_startup_completed_delayed_3);
  assign set_sigmoid_lut_rdy_out_net = passthrough_data_4.rdy_ext;
  assign passthrough_data_4.valid = set_sigmoid_lut_rdy_out & set_sigmoid_lut_valid_in;
  assign passthrough_data_4.data = { set_sigmoid_lut_value_in, set_sigmoid_lut_index_in };
  assign fifo_data_0.rden = set_sigmoid_lut_rden_in;
  assign set_sigmoid_lut_empty_out_net = fifo_data_0.empty;
  assign lookup_sigmoid_rdy_out_net = passthrough_data_5.rdy_ext;
  assign passthrough_data_5.valid = lookup_sigmoid_rdy_out & lookup_sigmoid_valid_in;
  assign passthrough_data_5.data = { lookup_sigmoid_index_in };
  assign fifo_data_1.rden = lookup_sigmoid_rden_in;
  assign lookup_sigmoid_result_out_net = fifo_data_1.data_out;
  assign lookup_sigmoid_empty_out_net = fifo_data_1.empty;
  assign compute_silu_rdy_out_net = passthrough_data_6.rdy_ext;
  assign passthrough_data_6.valid = compute_silu_rdy_out & compute_silu_valid_in;
  assign passthrough_data_6.data = { compute_silu_gate_bf16_in };
  assign fifo_data_2.rden = compute_silu_rden_in;
  assign compute_silu_result_out_net = fifo_data_2.data_out;
  assign compute_silu_empty_out_net = fifo_data_2.empty;
  assign compute_swiglu_rdy_out_net = passthrough_data_8.rdy_ext;
  assign passthrough_data_8.valid = compute_swiglu_rdy_out & compute_swiglu_valid_in;
  assign passthrough_data_8.data = { compute_swiglu_up_bf16_in, compute_swiglu_gate_bf16_in };
  assign fifo_data_3.rden = compute_swiglu_rden_in;
  assign compute_swiglu_result_out_net = fifo_data_3.data_out;
  assign compute_swiglu_empty_out_net = fifo_data_3.empty;
  always_comb begin
    rst_and_startup_done_out_net = _reset_control_rst_and_startup_done_out;
    reg_rst_delayed = _reset_control_rst_delayed_out;
    reset_sequence_finished_this_cycle = _reset_control_reset_sequence_finished_this_cycle_out;
    has_startup_completed_delayed_0 = _has_startup_completed_delayed_0_delay_chain_data_out;
    has_startup_completed_delayed_1 = _has_startup_completed_delayed_1_delay_chain_data_out;
    has_startup_completed_delayed_2 = _has_startup_completed_delayed_2_delay_chain_data_out;
    has_startup_completed_delayed_3 = _has_startup_completed_delayed_3_delay_chain_data_out;
    fifo_data_0.overflow = _fifo_0_set_sigmoid_lut_Return_overflow_out;
    fifo_data_0.underflow = _fifo_0_set_sigmoid_lut_Return_underflow_out;
    fifo_data_0.empty = _fifo_0_set_sigmoid_lut_Return_empty;
    fifo_data_0.almost_full = _fifo_0_set_sigmoid_lut_Return_full;
    fifo_data_1.overflow = _fifo_1_lookup_sigmoid_Return_overflow_out;
    fifo_data_1.underflow = _fifo_1_lookup_sigmoid_Return_underflow_out;
    fifo_data_1.empty = _fifo_1_lookup_sigmoid_Return_empty;
    fifo_data_1.almost_full = _fifo_1_lookup_sigmoid_Return_full;
    fifo_data_1.data_out = _fifo_1_lookup_sigmoid_Return_q;
    fifo_data_2.overflow = _fifo_2_compute_silu_Return_overflow_out;
    fifo_data_2.underflow = _fifo_2_compute_silu_Return_underflow_out;
    fifo_data_2.empty = _fifo_2_compute_silu_Return_empty;
    fifo_data_2.almost_full = _fifo_2_compute_silu_Return_full;
    fifo_data_2.data_out = _fifo_2_compute_silu_Return_q;
    fifo_data_3.overflow = _fifo_3_compute_swiglu_Return_overflow_out;
    fifo_data_3.underflow = _fifo_3_compute_swiglu_Return_underflow_out;
    fifo_data_3.empty = _fifo_3_compute_swiglu_Return_empty;
    fifo_data_3.almost_full = _fifo_3_compute_swiglu_Return_full;
    fifo_data_3.data_out = _fifo_3_compute_swiglu_Return_q;
    fifo_data_0.wren = _set_sigmoid_lut_BasicBlock_0Impl_fifo_wren_0;	// swiglu.k:19:9
    passthrough_data_4.rdy_int = _set_sigmoid_lut_BasicBlock_0Impl_input_rdy_0;	// swiglu.k:19:9
    fifo_data_1.data_in = _lookup_sigmoid_BasicBlock_0Impl_fifo_data_out_0;	// swiglu.k:28:9
    fifo_data_1.wren = _lookup_sigmoid_BasicBlock_0Impl_fifo_wren_0;	// swiglu.k:28:9
    passthrough_data_5.rdy_int = _lookup_sigmoid_BasicBlock_0Impl_input_rdy_0;	// swiglu.k:28:9
    fifo_data_2.data_in = _compute_silu_BasicBlock_0Impl_fifo_data_out_0;	// swiglu.k:43:9
    fifo_data_2.wren = _compute_silu_BasicBlock_0Impl_fifo_wren_0;	// swiglu.k:43:9
    passthrough_data_6.rdy_int = _compute_silu_BasicBlock_0Impl_input_rdy_0;	// swiglu.k:43:9
    fifo_data_3.data_in = _compute_swiglu_BasicBlock_0Impl_fifo_data_out_0;	// swiglu.k:101:9
    fifo_data_3.wren = _compute_swiglu_BasicBlock_0Impl_fifo_wren_0;	// swiglu.k:101:9
    passthrough_data_8.rdy_int = _compute_swiglu_BasicBlock_0Impl_input_rdy_0;	// swiglu.k:101:9
  end // always_comb

  assign has_startup_completed_raw = 1'b1;
  assign stall_rate_supported_out_net = 1'b0;
  KanagawaResetControl #(
    .WIDTH(8),
    .DELAY_CYCLES(3),
    .FAN_OUT_LEVELS(1),
    .HOLD_CYCLES(28),
    .ADDTIONAL_LATENCY(1),
    .INIT_VAL(1)
  ) reset_control (
    .clk                                    (clk),
    .rst_in                                 (combined_reset),
    .has_others_completed_in                (_GEN),
    .rst_and_startup_done_out               (_reset_control_rst_and_startup_done_out),
    .rst_delayed_out                        (_reset_control_rst_delayed_out),
    .reset_sequence_finished_this_cycle_out
      (_reset_control_reset_sequence_finished_this_cycle_out)
  );
  swiglu_unit__sigmoid_lut__mem_container _sigmoid_lut (	// swiglu.k:13:5
    .clk             (clk),	// swiglu.k:13:5
    .rst             (1'b0),	// swiglu.k:13:5
    .rden_in_0       (_lookup_sigmoid_BasicBlock_0Impl_memory_rden_out_9_0),	// swiglu.k:28:9
    .read_addr_in_0  (_lookup_sigmoid_BasicBlock_0Impl_memory_read_addr_out_9_0),	// swiglu.k:28:9
    .rden_in_1       (_compute_silu_BasicBlock_0Impl_memory_rden_out_9_1),	// swiglu.k:43:9
    .read_addr_in_1  (_compute_silu_BasicBlock_0Impl_memory_read_addr_out_9_1),	// swiglu.k:43:9
    .rden_in_2       (_compute_swiglu_BasicBlock_0Impl_memory_rden_out_9_2),	// swiglu.k:101:9
    .read_addr_in_2  (_compute_swiglu_BasicBlock_0Impl_memory_read_addr_out_9_2),	// swiglu.k:101:9
    .wren_in_0       (_set_sigmoid_lut_BasicBlock_0Impl_memory_wren_9_0),	// swiglu.k:19:9
    .write_addr_in_0 (_set_sigmoid_lut_BasicBlock_0Impl_memory_write_addr_out_9_0),	// swiglu.k:19:9
    .write_data_in_0 (_set_sigmoid_lut_BasicBlock_0Impl_memory_write_data_out_9_0),	// swiglu.k:19:9
    .read_data_out_0 (__sigmoid_lut_read_data_out_0),
    .read_data_out_1 (__sigmoid_lut_read_data_out_1),
    .read_data_out_2 (__sigmoid_lut_read_data_out_2),
    .init_completed  (__sigmoid_lut_init_completed)
  );	// swiglu.k:13:5
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
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(0),
    .PORT_WIDTH(1),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_0_set_sigmoid_lut_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(0)
  ) fifo_0_set_sigmoid_lut_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[0]),
    .overflow_out  (_fifo_0_set_sigmoid_lut_Return_overflow_out),
    .underflow_out (_fifo_0_set_sigmoid_lut_Return_underflow_out),
    .empty         (_fifo_0_set_sigmoid_lut_Return_empty),
    .rdreq         (fifo_data_0.rden),
    .full          (_fifo_0_set_sigmoid_lut_Return_full),
    .wrreq         (fifo_data_0.wren),
    .data          ('0),
    .q             (/* unused */)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(16),
    .PORT_WIDTH(16),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_1_lookup_sigmoid_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(4),
    .USE_LUTRAM(1)
  ) fifo_1_lookup_sigmoid_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[1]),
    .overflow_out  (_fifo_1_lookup_sigmoid_Return_overflow_out),
    .underflow_out (_fifo_1_lookup_sigmoid_Return_underflow_out),
    .empty         (_fifo_1_lookup_sigmoid_Return_empty),
    .rdreq         (fifo_data_1.rden),
    .full          (_fifo_1_lookup_sigmoid_Return_full),
    .wrreq         (fifo_data_1.wren),
    .data          (fifo_data_1.data_in),
    .q             (_fifo_1_lookup_sigmoid_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(16),
    .PORT_WIDTH(16),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_2_compute_silu_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(8),
    .USE_LUTRAM(1)
  ) fifo_2_compute_silu_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[2]),
    .overflow_out  (_fifo_2_compute_silu_Return_overflow_out),
    .underflow_out (_fifo_2_compute_silu_Return_underflow_out),
    .empty         (_fifo_2_compute_silu_Return_empty),
    .rdreq         (fifo_data_2.rden),
    .full          (_fifo_2_compute_silu_Return_full),
    .wrreq         (fifo_data_2.wren),
    .data          (fifo_data_2.data_in),
    .q             (_fifo_2_compute_silu_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(16),
    .PORT_WIDTH(16),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_3_compute_swiglu_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(12),
    .USE_LUTRAM(1)
  ) fifo_3_compute_swiglu_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[3]),
    .overflow_out  (_fifo_3_compute_swiglu_Return_overflow_out),
    .underflow_out (_fifo_3_compute_swiglu_Return_underflow_out),
    .empty         (_fifo_3_compute_swiglu_Return_empty),
    .rdreq         (fifo_data_3.rden),
    .full          (_fifo_3_compute_swiglu_Return_full),
    .wrreq         (fifo_data_3.wren),
    .data          (fifo_data_3.data_in),
    .q             (_fifo_3_compute_swiglu_Return_q)
  );
  swiglu_unit_set_sigmoid_lut_BasicBlock_0 set_sigmoid_lut_BasicBlock_0Impl (	// swiglu.k:19:9
    .clk                       (clk),	// swiglu.k:19:9
    .rst                       (reg_rst_delayed[4]),	// swiglu.k:19:9
    .done_out                  (/* unused */),
    .memory_write_data_out_9_0
      (_set_sigmoid_lut_BasicBlock_0Impl_memory_write_data_out_9_0),
    .memory_write_addr_out_9_0
      (_set_sigmoid_lut_BasicBlock_0Impl_memory_write_addr_out_9_0),
    .memory_wren_9_0           (_set_sigmoid_lut_BasicBlock_0Impl_memory_wren_9_0),
    .fifo_wren_0               (_set_sigmoid_lut_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_0.almost_full),	// swiglu.k:19:9
    .fifo_overflow_in_0        (fifo_data_0.overflow),	// swiglu.k:19:9
    .data_in_4                 (passthrough_data_4.data),	// swiglu.k:19:9
    .input_fifo_underflow_0    (passthrough_data_4.underflow),	// swiglu.k:19:9
    .input_rdy_0               (_set_sigmoid_lut_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_4.valid),	// swiglu.k:19:9
    .control_state_out         (/* unused */)
  );	// swiglu.k:19:9
  swiglu_unit_lookup_sigmoid_BasicBlock_0 lookup_sigmoid_BasicBlock_0Impl (	// swiglu.k:28:9
    .clk                       (clk),	// swiglu.k:28:9
    .rst                       (reg_rst_delayed[5]),	// swiglu.k:28:9
    .done_out                  (/* unused */),
    .memory_read_data_in_9_0   (__sigmoid_lut_read_data_out_0),	// swiglu.k:13:5
    .memory_read_addr_out_9_0
      (_lookup_sigmoid_BasicBlock_0Impl_memory_read_addr_out_9_0),
    .memory_rden_out_9_0       (_lookup_sigmoid_BasicBlock_0Impl_memory_rden_out_9_0),
    .fifo_data_out_0           (_lookup_sigmoid_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0               (_lookup_sigmoid_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_1.almost_full),	// swiglu.k:28:9
    .fifo_overflow_in_0        (fifo_data_1.overflow),	// swiglu.k:28:9
    .data_in_5                 (passthrough_data_5.data),	// swiglu.k:28:9
    .input_fifo_underflow_0    (passthrough_data_5.underflow),	// swiglu.k:28:9
    .input_rdy_0               (_lookup_sigmoid_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_5.valid),	// swiglu.k:28:9
    .control_state_out         (/* unused */)
  );	// swiglu.k:28:9
  swiglu_unit_compute_silu_BasicBlock_0 compute_silu_BasicBlock_0Impl (	// swiglu.k:43:9
    .clk                       (clk),	// swiglu.k:43:9
    .rst                       (reg_rst_delayed[6]),	// swiglu.k:43:9
    .done_out                  (/* unused */),
    .memory_read_data_in_9_1   (__sigmoid_lut_read_data_out_1),	// swiglu.k:13:5
    .memory_read_addr_out_9_1  (_compute_silu_BasicBlock_0Impl_memory_read_addr_out_9_1),
    .memory_rden_out_9_1       (_compute_silu_BasicBlock_0Impl_memory_rden_out_9_1),
    .fifo_data_out_0           (_compute_silu_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0               (_compute_silu_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_2.almost_full),	// swiglu.k:43:9
    .fifo_overflow_in_0        (fifo_data_2.overflow),	// swiglu.k:43:9
    .data_in_6                 (passthrough_data_6.data),	// swiglu.k:43:9
    .input_fifo_underflow_0    (passthrough_data_6.underflow),	// swiglu.k:43:9
    .input_rdy_0               (_compute_silu_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_6.valid),	// swiglu.k:43:9
    .control_state_out         (/* unused */)
  );	// swiglu.k:43:9
  swiglu_unit_compute_swiglu_BasicBlock_0 compute_swiglu_BasicBlock_0Impl (	// swiglu.k:101:9
    .clk                       (clk),	// swiglu.k:101:9
    .rst                       (reg_rst_delayed[7]),	// swiglu.k:101:9
    .done_out                  (/* unused */),
    .memory_read_data_in_9_2   (__sigmoid_lut_read_data_out_2),	// swiglu.k:13:5
    .memory_read_addr_out_9_2
      (_compute_swiglu_BasicBlock_0Impl_memory_read_addr_out_9_2),
    .memory_rden_out_9_2       (_compute_swiglu_BasicBlock_0Impl_memory_rden_out_9_2),
    .fifo_data_out_0           (_compute_swiglu_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0               (_compute_swiglu_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_3.almost_full),	// swiglu.k:101:9
    .fifo_overflow_in_0        (fifo_data_3.overflow),	// swiglu.k:101:9
    .data_in_8                 (passthrough_data_8.data),	// swiglu.k:101:9
    .input_fifo_underflow_0    (passthrough_data_8.underflow),	// swiglu.k:101:9
    .input_rdy_0               (_compute_swiglu_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_8.valid),	// swiglu.k:101:9
    .control_state_out         (/* unused */)
  );	// swiglu.k:101:9
  assign rst_and_startup_done_out = rst_and_startup_done_out_net;
  assign set_sigmoid_lut_rdy_out = set_sigmoid_lut_rdy_out_net;
  assign set_sigmoid_lut_empty_out = set_sigmoid_lut_empty_out_net;
  assign lookup_sigmoid_rdy_out = lookup_sigmoid_rdy_out_net;
  assign lookup_sigmoid_empty_out = lookup_sigmoid_empty_out_net;
  assign lookup_sigmoid_result_out = lookup_sigmoid_result_out_net;
  assign compute_silu_rdy_out = compute_silu_rdy_out_net;
  assign compute_silu_empty_out = compute_silu_empty_out_net;
  assign compute_silu_result_out = compute_silu_result_out_net;
  assign compute_swiglu_rdy_out = compute_swiglu_rdy_out_net;
  assign compute_swiglu_empty_out = compute_swiglu_empty_out_net;
  assign compute_swiglu_result_out = compute_swiglu_result_out_net;
  assign stall_rate_supported_out = stall_rate_supported_out_net;
endmodule

module swiglu_unit_EsiWrapper(
     input  wire                                                                clk,
     input  wire                                                                rst,
     input  wire [2:0]                                                          stall_rate_in,
     input  wire                                                                stall_rate_valid_in,
     input  wire struct packed {logic [15:0] gate_bf16; }                       compute_silu_arg,
     input  wire                                                                compute_silu_arg_valid,
     input  wire struct packed {logic [15:0] gate_bf16; logic [15:0] up_bf16; } compute_swiglu_arg,
     input  wire                                                                compute_swiglu_arg_valid,
     input  wire struct packed {logic [7:0] index; }                            lookup_sigmoid_arg,
     input  wire                                                                lookup_sigmoid_arg_valid,
     input  wire struct packed {logic [7:0] index; logic [15:0] value; }        set_sigmoid_lut_arg,
     input  wire                                                                set_sigmoid_lut_arg_valid,
     input  wire                                                                compute_silu_result_rden,
     input  wire                                                                compute_swiglu_result_rden,
     input  wire                                                                lookup_sigmoid_result_rden,
     input  wire                                                                set_sigmoid_lut_result_rden,
     output wire                                                                compute_silu_arg_ready,
     output wire                                                                compute_swiglu_arg_ready,
     output wire                                                                lookup_sigmoid_arg_ready,
     output wire                                                                set_sigmoid_lut_arg_ready,
     output wire [15:0]                                                         compute_silu_result,
     output wire                                                                compute_silu_result_empty,
     output wire [15:0]                                                         compute_swiglu_result,
     output wire                                                                compute_swiglu_result_empty,
     output wire [15:0]                                                         lookup_sigmoid_result,
     output wire                                                                lookup_sigmoid_result_empty,
  // output wire /*Zero Width*/                                                 set_sigmoid_lut_result,
     output wire                                                                set_sigmoid_lut_result_empty,
     output wire                                                                rst_and_startup_done_out,
     output wire                                                                stall_rate_supported_out
);

  wire [15:0] _EsiWrapped_lookup_sigmoid_result_out;
  wire [15:0] _EsiWrapped_compute_silu_result_out;
  wire [15:0] _EsiWrapped_compute_swiglu_result_out;
  swiglu_unit EsiWrapped (
    .clk                         (clk),
    .rst                         (rst),
    .set_sigmoid_lut_valid_in    (set_sigmoid_lut_arg_valid),
    .set_sigmoid_lut_index_in    (set_sigmoid_lut_arg.index),
    .set_sigmoid_lut_value_in    (set_sigmoid_lut_arg.value),
    .set_sigmoid_lut_rden_in     (set_sigmoid_lut_result_rden),
    .lookup_sigmoid_valid_in     (lookup_sigmoid_arg_valid),
    .lookup_sigmoid_index_in     (lookup_sigmoid_arg.index),
    .lookup_sigmoid_rden_in      (lookup_sigmoid_result_rden),
    .compute_silu_valid_in       (compute_silu_arg_valid),
    .compute_silu_gate_bf16_in   (compute_silu_arg.gate_bf16),
    .compute_silu_rden_in        (compute_silu_result_rden),
    .compute_swiglu_valid_in     (compute_swiglu_arg_valid),
    .compute_swiglu_gate_bf16_in (compute_swiglu_arg.gate_bf16),
    .compute_swiglu_up_bf16_in   (compute_swiglu_arg.up_bf16),
    .compute_swiglu_rden_in      (compute_swiglu_result_rden),
    .stall_rate_in               (stall_rate_in),
    .stall_rate_valid_in         (stall_rate_valid_in),
    .rst_and_startup_done_out    (rst_and_startup_done_out),
    .set_sigmoid_lut_rdy_out     (set_sigmoid_lut_arg_ready),
    .set_sigmoid_lut_empty_out   (set_sigmoid_lut_result_empty),
    .lookup_sigmoid_rdy_out      (lookup_sigmoid_arg_ready),
    .lookup_sigmoid_empty_out    (lookup_sigmoid_result_empty),
    .lookup_sigmoid_result_out   (_EsiWrapped_lookup_sigmoid_result_out),
    .compute_silu_rdy_out        (compute_silu_arg_ready),
    .compute_silu_empty_out      (compute_silu_result_empty),
    .compute_silu_result_out     (_EsiWrapped_compute_silu_result_out),
    .compute_swiglu_rdy_out      (compute_swiglu_arg_ready),
    .compute_swiglu_empty_out    (compute_swiglu_result_empty),
    .compute_swiglu_result_out   (_EsiWrapped_compute_swiglu_result_out),
    .stall_rate_supported_out    (stall_rate_supported_out)
  );
  assign compute_silu_result = _EsiWrapped_compute_silu_result_out;
  assign compute_swiglu_result = _EsiWrapped_compute_swiglu_result_out;
  assign lookup_sigmoid_result = _EsiWrapped_lookup_sigmoid_result_out;
  // Zero width: assign set_sigmoid_lut_result = /*Zero width*/;
endmodule

