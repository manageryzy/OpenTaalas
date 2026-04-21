
// This file was generated. Do not modify.
// kanagawa --backend=sv --import-dir=/home/mana/workspace/OpenTaalas/third-party/kanagawa/library --base-library=/home/mana/workspace/OpenTaalas/third-party/kanagawa/library/mini-base.k --output=/home/mana/workspace/OpenTaalas/rtl/generated/kanagawa/vector_unit /home/mana/workspace/OpenTaalas/rtl/kanagawa/vector_unit.k

`default_nettype wire
module vector_unitDebugView_rmsnorm_accumulateEntry
(
    input wire clk,
    input wire[15:0]  _x_bf16,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("rmsnorm_accumulateEntry time: %0t x_bf16: %p", $time, _x_bf16);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module vector_unitDebugView_rmsnorm_get_sumExit
(
    input wire clk,
    input wire[31:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("rmsnorm_get_sumExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module vector_unitDebugView_set_gamma_pre_attnEntry
(
    input wire clk,
    input wire[15:0]  _index,
    input wire[15:0]  _value,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("set_gamma_pre_attnEntry time: %0t index: %p value: %p", $time, _index, _value);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module vector_unitDebugView_get_gamma_pre_attnEntry
(
    input wire clk,
    input wire[15:0]  _index,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("get_gamma_pre_attnEntry time: %0t index: %p", $time, _index);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module vector_unitDebugView_get_gamma_pre_attnExit
(
    input wire clk,
    input wire[15:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("get_gamma_pre_attnExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module vector_unitDebugView_set_gamma_pre_mlpEntry
(
    input wire clk,
    input wire[15:0]  _index,
    input wire[15:0]  _value,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("set_gamma_pre_mlpEntry time: %0t index: %p value: %p", $time, _index, _value);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module vector_unitDebugView_get_gamma_pre_mlpEntry
(
    input wire clk,
    input wire[15:0]  _index,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("get_gamma_pre_mlpEntry time: %0t index: %p", $time, _index);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module vector_unitDebugView_get_gamma_pre_mlpExit
(
    input wire clk,
    input wire[15:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("get_gamma_pre_mlpExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module vector_unitDebugView_set_rsqrt_lutEntry
(
    input wire clk,
    input wire[7:0]  _index,
    input wire[15:0]  _value,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("set_rsqrt_lutEntry time: %0t index: %p value: %p", $time, _index, _value);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module vector_unitDebugView_lookup_rsqrtEntry
(
    input wire clk,
    input wire[7:0]  _index,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("lookup_rsqrtEntry time: %0t index: %p", $time, _index);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module vector_unitDebugView_lookup_rsqrtExit
(
    input wire clk,
    input wire[15:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("lookup_rsqrtExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module vector_unitDebugView_rope_read_cos_rowEntry
(
    input wire clk,
    input wire[11:0]  _position,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("rope_read_cos_rowEntry time: %0t position: %p", $time, _position);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module vector_unitDebugView_rope_read_cos_rowExit
(
    input wire clk,
    input wire[1023:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("rope_read_cos_rowExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module vector_unitDebugView_rope_read_sin_rowEntry
(
    input wire clk,
    input wire[11:0]  _position,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("rope_read_sin_rowEntry time: %0t position: %p", $time, _position);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module vector_unitDebugView_rope_read_sin_rowExit
(
    input wire clk,
    input wire[1023:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("rope_read_sin_rowExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module vector_unitDebugView_rope_write_cos_rowEntry
(
    input wire clk,
    input wire[11:0]  _position,
    input wire[1023:0]  _value,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("rope_write_cos_rowEntry time: %0t position: %p value: %p", $time, _position, _value);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module vector_unitDebugView_rope_write_sin_rowEntry
(
    input wire clk,
    input wire[11:0]  _position,
    input wire[1023:0]  _value,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("rope_write_sin_rowEntry time: %0t position: %p value: %p", $time, _position, _value);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module vector_unitDebugView_set_sigmoid_lutEntry
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
module vector_unitDebugView_swiglu_computeEntry
(
    input wire clk,
    input wire[15:0]  _gate_bf16,
    input wire[15:0]  _up_bf16,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("swiglu_computeEntry time: %0t gate_bf16: %p up_bf16: %p", $time, _gate_bf16, _up_bf16);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module vector_unitDebugView_swiglu_computeExit
(
    input wire clk,
    input wire[15:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("swiglu_computeExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module vector_unitDebugView_dequantizeEntry
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
module vector_unitDebugView_dequantizeExit
(
    input wire clk,
    input wire[15:0]  _ReturnValue,
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
module vector_unitDebugView_residual_addEntry
(
    input wire clk,
    input wire[15:0]  _a_bf16,
    input wire[15:0]  _b_bf16,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("residual_addEntry time: %0t a_bf16: %p b_bf16: %p", $time, _a_bf16, _b_bf16);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module vector_unitDebugView_residual_addExit
(
    input wire clk,
    input wire[15:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("residual_addExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
`ifndef _TYPESCOPE_CoreModuleTypeScope
`define _TYPESCOPE_CoreModuleTypeScope
`endif // _TYPESCOPE_CoreModuleTypeScope
module vector_unit_residual_add_BasicBlock_0(	// vector_unit.k:396:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  output wire [15:0] fifo_data_out_0,
  output wire        fifo_wren_0,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [31:0] data_in_33,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  logic        done_out_0;	// vector_unit.k:396:9
  logic [15:0] fifo_data_out_0_0;	// vector_unit.k:396:9
  logic        fifo_wren_0_0;	// vector_unit.k:396:9
  logic        input_rdy_0_0;	// vector_unit.k:396:9
  logic [7:0]  control_state_out_0;	// vector_unit.k:396:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// vector_unit.k:396:9
  always_comb begin	// vector_unit.k:396:9
    input_rdy_0_0 = _GEN;	// vector_unit.k:396:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// vector_unit.k:396:9
  end // always_comb
  reg   [15:0] p0_a_bf16;	// vector_unit.k:396:9
  reg   [15:0] p0_b_bf16;	// vector_unit.k:396:9
  reg          p0_stage1_enable = 1'h0;	// vector_unit.k:396:9
  reg   [15:0] p0_result;	// vector_unit.k:396:9
  reg          p0_stage2_enable = 1'h0;	// vector_unit.k:396:9
  reg   [15:0] p0_result_0;	// vector_unit.k:396:9
  reg          p0_stage3_enable = 1'h0;	// vector_unit.k:396:9
  wire  [15:0] a_exp = {8'h0, p0_a_bf16[14:7]};	// vector_unit.k:396:9, :399:{13,28}
  wire  [15:0] b_exp = {8'h0, p0_b_bf16[14:7]};	// vector_unit.k:396:9, :400:{13,28}
  wire         _b_exp_eq_0_ = p0_b_bf16[14:7] == 8'h0;	// vector_unit.k:396:9, :400:{13,28}, :409:22
  wire         _a_exp_ge_b_exp_ = p0_a_bf16[14:7] >= p0_b_bf16[14:7];	// vector_unit.k:396:9, :399:{13,28}, :400:{13,28}, :423:21
  wire  [15:0] _a_exp_minus_b_exp_ = 16'(a_exp - b_exp);	// vector_unit.k:399:{13,28}, :400:{13,28}, :427:36
  wire  [15:0] _b_exp_minus_a_exp_ = 16'(b_exp - a_exp);	// vector_unit.k:399:{13,28}, :400:{13,28}, :439:36
  wire         _a_sign_eq_b_sign_ = p0_a_bf16[15] == p0_b_bf16[15];	// vector_unit.k:396:9, :401:{13,29}, :402:{13,29}, :451:21
  wire         r_exp =
    p0_a_bf16[14] ? p0_b_bf16[14] | _a_exp_ge_b_exp_ : p0_b_bf16[14] & ~_a_exp_ge_b_exp_;	// vector_unit.k:396:9, :399:{13,28}, :400:{13,28}, :423:{17,21}
  wire         r_exp_0 =
    p0_a_bf16[13] ? p0_b_bf16[13] | _a_exp_ge_b_exp_ : p0_b_bf16[13] & ~_a_exp_ge_b_exp_;	// vector_unit.k:396:9, :399:{13,28}, :400:{13,28}, :423:{17,21}
  wire         r_exp_1 =
    p0_a_bf16[12] ? p0_b_bf16[12] | _a_exp_ge_b_exp_ : p0_b_bf16[12] & ~_a_exp_ge_b_exp_;	// vector_unit.k:396:9, :399:{13,28}, :400:{13,28}, :423:{17,21}
  wire         r_exp_2 =
    p0_a_bf16[11] ? p0_b_bf16[11] | _a_exp_ge_b_exp_ : p0_b_bf16[11] & ~_a_exp_ge_b_exp_;	// vector_unit.k:396:9, :399:{13,28}, :400:{13,28}, :423:{17,21}
  wire         r_exp_3 =
    p0_a_bf16[10] ? p0_b_bf16[10] | _a_exp_ge_b_exp_ : p0_b_bf16[10] & ~_a_exp_ge_b_exp_;	// vector_unit.k:396:9, :399:{13,28}, :400:{13,28}, :423:{17,21}
  wire         r_exp_4 =
    p0_a_bf16[9] ? p0_b_bf16[9] | _a_exp_ge_b_exp_ : p0_b_bf16[9] & ~_a_exp_ge_b_exp_;	// vector_unit.k:396:9, :399:{13,28}, :400:{13,28}, :423:{17,21}
  wire         r_exp_5 =
    p0_a_bf16[8] ? p0_b_bf16[8] | _a_exp_ge_b_exp_ : p0_b_bf16[8] & ~_a_exp_ge_b_exp_;	// vector_unit.k:396:9, :399:{13,28}, :400:{13,28}, :423:{17,21}
  wire         r_exp_6 =
    p0_a_bf16[7] ? p0_b_bf16[7] | _a_exp_ge_b_exp_ : p0_b_bf16[7] & ~_a_exp_ge_b_exp_;	// vector_unit.k:396:9, :399:{13,28}, :400:{13,28}, :423:{17,21}
  wire  [15:0] r_exp_7 =
    {8'h0, r_exp, r_exp_0, r_exp_1, r_exp_2, r_exp_3, r_exp_4, r_exp_5, r_exp_6};	// vector_unit.k:423:17
  wire  [3:0]  shift = _a_exp_minus_b_exp_ > 16'hC ? 4'hC : _a_exp_minus_b_exp_[3:0];	// vector_unit.k:427:36, :428:{21,25}
  wire  [3:0]  shift_0 = _b_exp_minus_a_exp_ > 16'hC ? 4'hC : _b_exp_minus_a_exp_[3:0];	// vector_unit.k:439:36, :440:{21,25}
  wire         aligned_b = ~(shift[3]) & ~(shift[2]);	// vector_unit.k:428:21, :430:{21,25,45,57}, :431:{21,25,45,57}
  wire         _GEN_0 = ~(shift[3]) & ~(shift[2]);	// vector_unit.k:428:21, :430:{21,25,45,57}, :431:{21,25,45,57}
  wire         aligned_b_0 = p0_b_bf16[6] & _GEN_0;	// vector_unit.k:396:9, :417:{17,33}, :429:33, :430:{21,25,45,57}, :431:{21,25,45,57}, :438:33
  wire         aligned_b_1 = p0_b_bf16[5] & _GEN_0;	// vector_unit.k:396:9, :417:{17,33}, :429:33, :430:{21,25,45,57}, :431:{21,25,45,57}, :438:33
  wire         aligned_b_2 = p0_b_bf16[4] & _GEN_0;	// vector_unit.k:396:9, :417:{17,33}, :429:33, :430:{21,25,45,57}, :431:{21,25,45,57}, :438:33
  wire         _GEN_1 = ~(shift[3]) & shift[2];	// vector_unit.k:428:21, :430:{21,25,45,57}, :431:{21,25,45,57}
  wire         aligned_b_3 = p0_b_bf16[3] ? ~(shift[3]) : _GEN_1;	// vector_unit.k:396:9, :417:{17,33}, :428:21, :429:33, :430:{21,25,45,57}, :431:{21,25,45,57}, :438:33
  wire         aligned_b_4 =
    p0_b_bf16[6] ? (p0_b_bf16[2] ? ~(shift[3]) : _GEN_1) : p0_b_bf16[2] & _GEN_0;	// vector_unit.k:396:9, :417:{17,33}, :428:21, :429:33, :430:{21,25,45,57}, :431:{21,25,45,57}, :438:33
  wire         aligned_b_5 =
    p0_b_bf16[5] ? (p0_b_bf16[1] ? ~(shift[3]) : _GEN_1) : p0_b_bf16[1] & _GEN_0;	// vector_unit.k:396:9, :417:{17,33}, :428:21, :429:33, :430:{21,25,45,57}, :431:{21,25,45,57}, :438:33
  wire         aligned_b_6 =
    p0_b_bf16[4] ? (p0_b_bf16[0] ? ~(shift[3]) : _GEN_1) : p0_b_bf16[0] & _GEN_0;	// vector_unit.k:396:9, :417:{17,33}, :428:21, :429:33, :430:{21,25,45,57}, :431:{21,25,45,57}, :438:33
  wire         _GEN_2 = shift[3] ^ shift[2];	// vector_unit.k:428:21, :430:{21,25,45,57}, :431:{21,25,45,57}
  wire         _GEN_3 = shift[3] & ~(shift[2]);	// vector_unit.k:428:21, :430:{21,25,45,57}, :431:{21,25,45,57}
  wire         aligned_b_7 = p0_b_bf16[3] ? _GEN_2 : _GEN_3;	// vector_unit.k:396:9, :417:{17,33}, :429:33, :430:{21,25,45,57}, :431:{21,25,45,57}, :438:33
  wire         aligned_b_8 =
    p0_b_bf16[2] ? (p0_b_bf16[6] ? _GEN_2 : _GEN_1) : p0_b_bf16[6] & _GEN_3;	// vector_unit.k:396:9, :417:{17,33}, :429:33, :430:{21,25,45,57}, :431:{21,25,45,57}, :438:33
  wire         aligned_b_9 =
    p0_b_bf16[1] ? (p0_b_bf16[5] ? _GEN_2 : _GEN_1) : p0_b_bf16[5] & _GEN_3;	// vector_unit.k:396:9, :417:{17,33}, :429:33, :430:{21,25,45,57}, :431:{21,25,45,57}, :438:33
  wire         aligned_b_10 =
    p0_b_bf16[0] ? (p0_b_bf16[4] ? _GEN_2 : _GEN_1) : p0_b_bf16[4] & _GEN_3;	// vector_unit.k:396:9, :417:{17,33}, :429:33, :430:{21,25,45,57}, :431:{21,25,45,57}, :438:33
  wire         aligned_a = ~(shift_0[3]) & ~(shift_0[2]);	// vector_unit.k:440:21, :442:{21,25,45,57}, :443:{21,25,45,57}
  wire         _GEN_4 = ~(shift_0[3]) & ~(shift_0[2]);	// vector_unit.k:440:21, :442:{21,25,45,57}, :443:{21,25,45,57}
  wire         aligned_a_0 = p0_a_bf16[6] & _GEN_4;	// vector_unit.k:396:9, :416:{17,33}, :426:33, :441:33, :442:{21,25,45,57}, :443:{21,25,45,57}
  wire         aligned_a_1 = p0_a_bf16[5] & _GEN_4;	// vector_unit.k:396:9, :416:{17,33}, :426:33, :441:33, :442:{21,25,45,57}, :443:{21,25,45,57}
  wire         aligned_a_2 = p0_a_bf16[4] & _GEN_4;	// vector_unit.k:396:9, :416:{17,33}, :426:33, :441:33, :442:{21,25,45,57}, :443:{21,25,45,57}
  wire         _GEN_5 = ~(shift_0[3]) & shift_0[2];	// vector_unit.k:440:21, :442:{21,25,45,57}, :443:{21,25,45,57}
  wire         aligned_a_3 = p0_a_bf16[3] ? ~(shift_0[3]) : _GEN_5;	// vector_unit.k:396:9, :416:{17,33}, :426:33, :440:21, :441:33, :442:{21,25,45,57}, :443:{21,25,45,57}
  wire         aligned_a_4 =
    p0_a_bf16[6] ? (p0_a_bf16[2] ? ~(shift_0[3]) : _GEN_5) : p0_a_bf16[2] & _GEN_4;	// vector_unit.k:396:9, :416:{17,33}, :426:33, :440:21, :441:33, :442:{21,25,45,57}, :443:{21,25,45,57}
  wire         aligned_a_5 =
    p0_a_bf16[5] ? (p0_a_bf16[1] ? ~(shift_0[3]) : _GEN_5) : p0_a_bf16[1] & _GEN_4;	// vector_unit.k:396:9, :416:{17,33}, :426:33, :440:21, :441:33, :442:{21,25,45,57}, :443:{21,25,45,57}
  wire         aligned_a_6 =
    p0_a_bf16[4] ? (p0_a_bf16[0] ? ~(shift_0[3]) : _GEN_5) : p0_a_bf16[0] & _GEN_4;	// vector_unit.k:396:9, :416:{17,33}, :426:33, :440:21, :441:33, :442:{21,25,45,57}, :443:{21,25,45,57}
  wire         _GEN_6 = shift_0[3] ^ shift_0[2];	// vector_unit.k:440:21, :442:{21,25,45,57}, :443:{21,25,45,57}
  wire         _GEN_7 = shift_0[3] & ~(shift_0[2]);	// vector_unit.k:440:21, :442:{21,25,45,57}, :443:{21,25,45,57}
  wire         aligned_a_7 = p0_a_bf16[3] ? _GEN_6 : _GEN_7;	// vector_unit.k:396:9, :416:{17,33}, :426:33, :441:33, :442:{21,25,45,57}, :443:{21,25,45,57}
  wire         aligned_a_8 =
    p0_a_bf16[2] ? (p0_a_bf16[6] ? _GEN_6 : _GEN_5) : p0_a_bf16[6] & _GEN_7;	// vector_unit.k:396:9, :416:{17,33}, :426:33, :441:33, :442:{21,25,45,57}, :443:{21,25,45,57}
  wire         aligned_a_9 =
    p0_a_bf16[1] ? (p0_a_bf16[5] ? _GEN_6 : _GEN_5) : p0_a_bf16[5] & _GEN_7;	// vector_unit.k:396:9, :416:{17,33}, :426:33, :441:33, :442:{21,25,45,57}, :443:{21,25,45,57}
  wire         aligned_a_10 =
    p0_a_bf16[0] ? (p0_a_bf16[4] ? _GEN_6 : _GEN_5) : p0_a_bf16[4] & _GEN_7;	// vector_unit.k:396:9, :416:{17,33}, :426:33, :441:33, :442:{21,25,45,57}, :443:{21,25,45,57}
  wire         _GEN_8 = ~(shift[1]) & ~(shift[0]);	// vector_unit.k:428:21, :432:{21,25,45,57}, :433:{21,25,45,57}
  wire         _GEN_9 = ~(shift[1]) & shift[0];	// vector_unit.k:428:21, :432:{21,25,45,57}, :433:{21,25,45,57}
  wire         _GEN_10 = ~(shift[1]) | ~(shift[0]);	// vector_unit.k:428:21, :432:{21,25,45,57}, :433:{21,25,45,57}
  wire         _GEN_11 = shift[1] ^ shift[0];	// vector_unit.k:428:21, :432:{21,25,45,57}, :433:{21,25,45,57}
  wire         _GEN_12 = shift[1] | shift[0];	// vector_unit.k:428:21, :432:{21,25,45,57}, :433:{21,25,45,57}
  wire         _GEN_13 = shift[1] ^ ~(shift[0]);	// vector_unit.k:428:21, :432:{21,25,45,57}, :433:{21,25,45,57}
  wire         _GEN_14 = shift[1] & shift[0];	// vector_unit.k:428:21, :432:{21,25,45,57}, :433:{21,25,45,57}
  wire         _GEN_15 = ~(shift_0[1]) & ~(shift_0[0]);	// vector_unit.k:440:21, :444:{21,25,45,57}, :445:{21,25,45,57}
  wire         _GEN_16 = ~(shift_0[1]) & shift_0[0];	// vector_unit.k:440:21, :444:{21,25,45,57}, :445:{21,25,45,57}
  wire         aligned_a_11 =
    aligned_a ? (aligned_a_0 ? ~(shift_0[1]) : _GEN_16) : aligned_a_0 & _GEN_15;	// vector_unit.k:440:21, :442:{21,25,45,57}, :443:{21,25,45,57}, :444:{21,25,45,57}, :445:{21,25,45,57}
  wire         _GEN_17 = ~(shift_0[1]) | ~(shift_0[0]);	// vector_unit.k:440:21, :444:{21,25,45,57}, :445:{21,25,45,57}
  wire         _GEN_18 = shift_0[1] ^ shift_0[0];	// vector_unit.k:440:21, :444:{21,25,45,57}, :445:{21,25,45,57}
  wire         aligned_a_12 =
    aligned_a_0
      ? (aligned_a
           ? (aligned_a_1 ? _GEN_17 : _GEN_18)
           : aligned_a_1 ? ~(shift_0[1]) : _GEN_16)
      : aligned_a ? (aligned_a_1 | shift_0[1]) & ~(shift_0[0]) : aligned_a_1 & _GEN_15;	// vector_unit.k:440:21, :442:{21,25,45,57}, :443:{21,25,45,57}, :444:{21,25,45,57}, :445:{21,25,45,57}
  wire         _GEN_19 = shift_0[1] | shift_0[0];	// vector_unit.k:440:21, :444:{21,25,45,57}, :445:{21,25,45,57}
  wire         _GEN_20 = shift_0[1] ^ ~(shift_0[0]);	// vector_unit.k:440:21, :444:{21,25,45,57}, :445:{21,25,45,57}
  wire         _GEN_21 = shift_0[1] & shift_0[0];	// vector_unit.k:440:21, :444:{21,25,45,57}, :445:{21,25,45,57}
  wire         aligned_a_13 =
    aligned_a
      ? (aligned_a_1
           ? (aligned_a_0
                ? aligned_a_2 | _GEN_19
                : aligned_a_2 & ~(shift_0[1]) | shift_0[0])
           : aligned_a_0
               ? aligned_a_2 & ~(shift_0[0]) | shift_0[1]
               : aligned_a_2 ? _GEN_20 : _GEN_21)
      : aligned_a_1
          ? (aligned_a_0
               ? (aligned_a_2 ? _GEN_17 : _GEN_18)
               : aligned_a_2 ? ~(shift_0[1]) : _GEN_16)
          : aligned_a_0
              ? (aligned_a_2 | shift_0[1]) & ~(shift_0[0])
              : aligned_a_2 & _GEN_15;	// vector_unit.k:440:21, :442:{21,25,45,57}, :443:{21,25,45,57}, :444:{21,25,45,57}, :445:{21,25,45,57}
  wire         aligned_a_14 =
    aligned_a_0
      ? (aligned_a_2
           ? (aligned_a_1
                ? aligned_a_3 | _GEN_19
                : aligned_a_3 & ~(shift_0[1]) | shift_0[0])
           : aligned_a_1
               ? aligned_a_3 & ~(shift_0[0]) | shift_0[1]
               : aligned_a_3 ? _GEN_20 : _GEN_21)
      : aligned_a_2
          ? (aligned_a_1
               ? (aligned_a_3 ? _GEN_17 : _GEN_18)
               : aligned_a_3 ? ~(shift_0[1]) : _GEN_16)
          : aligned_a_1
              ? (aligned_a_3 | shift_0[1]) & ~(shift_0[0])
              : aligned_a_3 & _GEN_15;	// vector_unit.k:440:21, :442:{21,25,45,57}, :443:{21,25,45,57}, :444:{21,25,45,57}, :445:{21,25,45,57}
  wire         aligned_a_15 =
    aligned_a_1
      ? (aligned_a_3
           ? (aligned_a_2
                ? aligned_a_4 | _GEN_19
                : aligned_a_4 & ~(shift_0[1]) | shift_0[0])
           : aligned_a_2
               ? aligned_a_4 & ~(shift_0[0]) | shift_0[1]
               : aligned_a_4 ? _GEN_20 : _GEN_21)
      : aligned_a_3
          ? (aligned_a_2
               ? (aligned_a_4 ? _GEN_17 : _GEN_18)
               : aligned_a_4 ? ~(shift_0[1]) : _GEN_16)
          : aligned_a_2
              ? (aligned_a_4 | shift_0[1]) & ~(shift_0[0])
              : aligned_a_4 & _GEN_15;	// vector_unit.k:440:21, :442:{21,25,45,57}, :443:{21,25,45,57}, :444:{21,25,45,57}, :445:{21,25,45,57}
  wire         aligned_a_16 =
    aligned_a_2
      ? (aligned_a_4
           ? (aligned_a_3
                ? aligned_a_5 | _GEN_19
                : aligned_a_5 & ~(shift_0[1]) | shift_0[0])
           : aligned_a_3
               ? aligned_a_5 & ~(shift_0[0]) | shift_0[1]
               : aligned_a_5 ? _GEN_20 : _GEN_21)
      : aligned_a_4
          ? (aligned_a_3
               ? (aligned_a_5 ? _GEN_17 : _GEN_18)
               : aligned_a_5 ? ~(shift_0[1]) : _GEN_16)
          : aligned_a_3
              ? (aligned_a_5 | shift_0[1]) & ~(shift_0[0])
              : aligned_a_5 & _GEN_15;	// vector_unit.k:440:21, :442:{21,25,45,57}, :443:{21,25,45,57}, :444:{21,25,45,57}, :445:{21,25,45,57}
  wire         aligned_a_17 =
    aligned_a_3
      ? (aligned_a_5
           ? (aligned_a_4
                ? aligned_a_6 | _GEN_19
                : aligned_a_6 & ~(shift_0[1]) | shift_0[0])
           : aligned_a_4
               ? aligned_a_6 & ~(shift_0[0]) | shift_0[1]
               : aligned_a_6 ? _GEN_20 : _GEN_21)
      : aligned_a_5
          ? (aligned_a_4
               ? (aligned_a_6 ? _GEN_17 : _GEN_18)
               : aligned_a_6 ? ~(shift_0[1]) : _GEN_16)
          : aligned_a_4
              ? (aligned_a_6 | shift_0[1]) & ~(shift_0[0])
              : aligned_a_6 & _GEN_15;	// vector_unit.k:440:21, :442:{21,25,45,57}, :443:{21,25,45,57}, :444:{21,25,45,57}, :445:{21,25,45,57}
  wire         aligned_a_18 = aligned_a & _GEN_15 | _a_exp_ge_b_exp_;	// vector_unit.k:423:{17,21}, :442:{21,25,45,57}, :443:{21,25,45,57}, :444:{21,25,45,57}, :445:{21,25,45,57}
  wire         aligned_a_19 =
    p0_a_bf16[6] ? aligned_a_11 | _a_exp_ge_b_exp_ : aligned_a_11 & ~_a_exp_ge_b_exp_;	// vector_unit.k:396:9, :416:{17,33}, :423:{17,21}, :426:33, :441:33, :444:{21,25,45,57}, :445:{21,25,45,57}
  wire         aligned_a_20 =
    p0_a_bf16[5] ? aligned_a_12 | _a_exp_ge_b_exp_ : aligned_a_12 & ~_a_exp_ge_b_exp_;	// vector_unit.k:396:9, :416:{17,33}, :423:{17,21}, :426:33, :441:33, :444:{21,25,45,57}, :445:{21,25,45,57}
  wire         aligned_a_21 =
    p0_a_bf16[4] ? aligned_a_13 | _a_exp_ge_b_exp_ : aligned_a_13 & ~_a_exp_ge_b_exp_;	// vector_unit.k:396:9, :416:{17,33}, :423:{17,21}, :426:33, :441:33, :444:{21,25,45,57}, :445:{21,25,45,57}
  wire         aligned_a_22 =
    p0_a_bf16[3] ? aligned_a_14 | _a_exp_ge_b_exp_ : aligned_a_14 & ~_a_exp_ge_b_exp_;	// vector_unit.k:396:9, :416:{17,33}, :423:{17,21}, :426:33, :441:33, :444:{21,25,45,57}, :445:{21,25,45,57}
  wire         aligned_a_23 =
    p0_a_bf16[2] ? aligned_a_15 | _a_exp_ge_b_exp_ : aligned_a_15 & ~_a_exp_ge_b_exp_;	// vector_unit.k:396:9, :416:{17,33}, :423:{17,21}, :426:33, :441:33, :444:{21,25,45,57}, :445:{21,25,45,57}
  wire         aligned_a_24 =
    p0_a_bf16[1] ? aligned_a_16 | _a_exp_ge_b_exp_ : aligned_a_16 & ~_a_exp_ge_b_exp_;	// vector_unit.k:396:9, :416:{17,33}, :423:{17,21}, :426:33, :441:33, :444:{21,25,45,57}, :445:{21,25,45,57}
  wire         aligned_a_25 =
    p0_a_bf16[0] ? aligned_a_17 | _a_exp_ge_b_exp_ : aligned_a_17 & ~_a_exp_ge_b_exp_;	// vector_unit.k:396:9, :416:{17,33}, :423:{17,21}, :426:33, :441:33, :444:{21,25,45,57}, :445:{21,25,45,57}
  wire         aligned_a_26 =
    (aligned_a_4
       ? (aligned_a_6
            ? (aligned_a_5
                 ? aligned_a_7 | _GEN_19
                 : aligned_a_7 & ~(shift_0[1]) | shift_0[0])
            : aligned_a_5
                ? aligned_a_7 & ~(shift_0[0]) | shift_0[1]
                : aligned_a_7 ? _GEN_20 : _GEN_21)
       : aligned_a_6
           ? (aligned_a_5
                ? (aligned_a_7 ? _GEN_17 : _GEN_18)
                : aligned_a_7 ? ~(shift_0[1]) : _GEN_16)
           : aligned_a_5
               ? (aligned_a_7 | shift_0[1]) & ~(shift_0[0])
               : aligned_a_7 & _GEN_15) & ~_a_exp_ge_b_exp_;	// vector_unit.k:423:{17,21}, :440:21, :442:{21,25,45,57}, :443:{21,25,45,57}, :444:{21,25,45,57}, :445:{21,25,45,57}
  wire         aligned_a_27 =
    (aligned_a_5
       ? (aligned_a_7
            ? (aligned_a_6
                 ? aligned_a_8 | _GEN_19
                 : aligned_a_8 & ~(shift_0[1]) | shift_0[0])
            : aligned_a_6
                ? aligned_a_8 & ~(shift_0[0]) | shift_0[1]
                : aligned_a_8 ? _GEN_20 : _GEN_21)
       : aligned_a_7
           ? (aligned_a_6
                ? (aligned_a_8 ? _GEN_17 : _GEN_18)
                : aligned_a_8 ? ~(shift_0[1]) : _GEN_16)
           : aligned_a_6
               ? (aligned_a_8 | shift_0[1]) & ~(shift_0[0])
               : aligned_a_8 & _GEN_15) & ~_a_exp_ge_b_exp_;	// vector_unit.k:423:{17,21}, :440:21, :442:{21,25,45,57}, :443:{21,25,45,57}, :444:{21,25,45,57}, :445:{21,25,45,57}
  wire         aligned_a_28 =
    (aligned_a_6
       ? (aligned_a_8
            ? (aligned_a_7
                 ? aligned_a_9 | _GEN_19
                 : aligned_a_9 & ~(shift_0[1]) | shift_0[0])
            : aligned_a_7
                ? aligned_a_9 & ~(shift_0[0]) | shift_0[1]
                : aligned_a_9 ? _GEN_20 : _GEN_21)
       : aligned_a_8
           ? (aligned_a_7
                ? (aligned_a_9 ? _GEN_17 : _GEN_18)
                : aligned_a_9 ? ~(shift_0[1]) : _GEN_16)
           : aligned_a_7
               ? (aligned_a_9 | shift_0[1]) & ~(shift_0[0])
               : aligned_a_9 & _GEN_15) & ~_a_exp_ge_b_exp_;	// vector_unit.k:423:{17,21}, :440:21, :442:{21,25,45,57}, :443:{21,25,45,57}, :444:{21,25,45,57}, :445:{21,25,45,57}
  wire         aligned_a_29 =
    (aligned_a_7
       ? (aligned_a_9
            ? (aligned_a_8
                 ? aligned_a_10 | _GEN_19
                 : aligned_a_10 & ~(shift_0[1]) | shift_0[0])
            : aligned_a_8
                ? aligned_a_10 & ~(shift_0[0]) | shift_0[1]
                : aligned_a_10 ? _GEN_20 : _GEN_21)
       : aligned_a_9
           ? (aligned_a_8
                ? (aligned_a_10 ? _GEN_17 : _GEN_18)
                : aligned_a_10 ? ~(shift_0[1]) : _GEN_16)
           : aligned_a_8
               ? (aligned_a_10 | shift_0[1]) & ~(shift_0[0])
               : aligned_a_10 & _GEN_15) & ~_a_exp_ge_b_exp_;	// vector_unit.k:423:{17,21}, :440:21, :442:{21,25,45,57}, :443:{21,25,45,57}, :444:{21,25,45,57}, :445:{21,25,45,57}
  wire  [15:0] aligned_a_30 =
    {4'h0,
     aligned_a_18,
     aligned_a_19,
     aligned_a_20,
     aligned_a_21,
     aligned_a_22,
     aligned_a_23,
     aligned_a_24,
     aligned_a_25,
     aligned_a_26,
     aligned_a_27,
     aligned_a_28,
     aligned_a_29};	// vector_unit.k:423:17
  wire         aligned_b_11 = aligned_b & _GEN_8 | ~_a_exp_ge_b_exp_;	// vector_unit.k:423:{17,21}, :430:{21,25,45,57}, :431:{21,25,45,57}, :432:{21,25,45,57}, :433:{21,25,45,57}
  wire         aligned_b_12 =
    (aligned_b ? (aligned_b_0 ? ~(shift[1]) : _GEN_9) : aligned_b_0 & _GEN_8)
      ? p0_b_bf16[6] | _a_exp_ge_b_exp_
      : p0_b_bf16[6] & ~_a_exp_ge_b_exp_;	// vector_unit.k:396:9, :417:{17,33}, :423:{17,21}, :428:21, :429:33, :430:{21,25,45,57}, :431:{21,25,45,57}, :432:{21,25,45,57}, :433:{21,25,45,57}, :438:33
  wire         aligned_b_13 =
    (aligned_b_0
       ? (aligned_b
            ? (aligned_b_1 ? _GEN_10 : _GEN_11)
            : aligned_b_1 ? ~(shift[1]) : _GEN_9)
       : aligned_b ? (aligned_b_1 | shift[1]) & ~(shift[0]) : aligned_b_1 & _GEN_8)
      ? p0_b_bf16[5] | _a_exp_ge_b_exp_
      : p0_b_bf16[5] & ~_a_exp_ge_b_exp_;	// vector_unit.k:396:9, :417:{17,33}, :423:{17,21}, :428:21, :429:33, :430:{21,25,45,57}, :431:{21,25,45,57}, :432:{21,25,45,57}, :433:{21,25,45,57}, :438:33
  wire         aligned_b_14 =
    (aligned_b
       ? (aligned_b_1
            ? (aligned_b_0 ? aligned_b_2 | _GEN_12 : aligned_b_2 & ~(shift[1]) | shift[0])
            : aligned_b_0
                ? aligned_b_2 & ~(shift[0]) | shift[1]
                : aligned_b_2 ? _GEN_13 : _GEN_14)
       : aligned_b_1
           ? (aligned_b_0
                ? (aligned_b_2 ? _GEN_10 : _GEN_11)
                : aligned_b_2 ? ~(shift[1]) : _GEN_9)
           : aligned_b_0 ? (aligned_b_2 | shift[1]) & ~(shift[0]) : aligned_b_2 & _GEN_8)
      ? p0_b_bf16[4] | _a_exp_ge_b_exp_
      : p0_b_bf16[4] & ~_a_exp_ge_b_exp_;	// vector_unit.k:396:9, :417:{17,33}, :423:{17,21}, :428:21, :429:33, :430:{21,25,45,57}, :431:{21,25,45,57}, :432:{21,25,45,57}, :433:{21,25,45,57}, :438:33
  wire         aligned_b_15 =
    (aligned_b_0
       ? (aligned_b_2
            ? (aligned_b_1 ? aligned_b_3 | _GEN_12 : aligned_b_3 & ~(shift[1]) | shift[0])
            : aligned_b_1
                ? aligned_b_3 & ~(shift[0]) | shift[1]
                : aligned_b_3 ? _GEN_13 : _GEN_14)
       : aligned_b_2
           ? (aligned_b_1
                ? (aligned_b_3 ? _GEN_10 : _GEN_11)
                : aligned_b_3 ? ~(shift[1]) : _GEN_9)
           : aligned_b_1 ? (aligned_b_3 | shift[1]) & ~(shift[0]) : aligned_b_3 & _GEN_8)
      ? p0_b_bf16[3] | _a_exp_ge_b_exp_
      : p0_b_bf16[3] & ~_a_exp_ge_b_exp_;	// vector_unit.k:396:9, :417:{17,33}, :423:{17,21}, :428:21, :429:33, :430:{21,25,45,57}, :431:{21,25,45,57}, :432:{21,25,45,57}, :433:{21,25,45,57}, :438:33
  wire         aligned_b_16 =
    (aligned_b_1
       ? (aligned_b_3
            ? (aligned_b_2 ? aligned_b_4 | _GEN_12 : aligned_b_4 & ~(shift[1]) | shift[0])
            : aligned_b_2
                ? aligned_b_4 & ~(shift[0]) | shift[1]
                : aligned_b_4 ? _GEN_13 : _GEN_14)
       : aligned_b_3
           ? (aligned_b_2
                ? (aligned_b_4 ? _GEN_10 : _GEN_11)
                : aligned_b_4 ? ~(shift[1]) : _GEN_9)
           : aligned_b_2 ? (aligned_b_4 | shift[1]) & ~(shift[0]) : aligned_b_4 & _GEN_8)
      ? p0_b_bf16[2] | _a_exp_ge_b_exp_
      : p0_b_bf16[2] & ~_a_exp_ge_b_exp_;	// vector_unit.k:396:9, :417:{17,33}, :423:{17,21}, :428:21, :429:33, :430:{21,25,45,57}, :431:{21,25,45,57}, :432:{21,25,45,57}, :433:{21,25,45,57}, :438:33
  wire         aligned_b_17 =
    (aligned_b_2
       ? (aligned_b_4
            ? (aligned_b_3 ? aligned_b_5 | _GEN_12 : aligned_b_5 & ~(shift[1]) | shift[0])
            : aligned_b_3
                ? aligned_b_5 & ~(shift[0]) | shift[1]
                : aligned_b_5 ? _GEN_13 : _GEN_14)
       : aligned_b_4
           ? (aligned_b_3
                ? (aligned_b_5 ? _GEN_10 : _GEN_11)
                : aligned_b_5 ? ~(shift[1]) : _GEN_9)
           : aligned_b_3 ? (aligned_b_5 | shift[1]) & ~(shift[0]) : aligned_b_5 & _GEN_8)
      ? p0_b_bf16[1] | _a_exp_ge_b_exp_
      : p0_b_bf16[1] & ~_a_exp_ge_b_exp_;	// vector_unit.k:396:9, :417:{17,33}, :423:{17,21}, :428:21, :429:33, :430:{21,25,45,57}, :431:{21,25,45,57}, :432:{21,25,45,57}, :433:{21,25,45,57}, :438:33
  wire         aligned_b_18 =
    (aligned_b_3
       ? (aligned_b_5
            ? (aligned_b_4 ? aligned_b_6 | _GEN_12 : aligned_b_6 & ~(shift[1]) | shift[0])
            : aligned_b_4
                ? aligned_b_6 & ~(shift[0]) | shift[1]
                : aligned_b_6 ? _GEN_13 : _GEN_14)
       : aligned_b_5
           ? (aligned_b_4
                ? (aligned_b_6 ? _GEN_10 : _GEN_11)
                : aligned_b_6 ? ~(shift[1]) : _GEN_9)
           : aligned_b_4 ? (aligned_b_6 | shift[1]) & ~(shift[0]) : aligned_b_6 & _GEN_8)
      ? p0_b_bf16[0] | _a_exp_ge_b_exp_
      : p0_b_bf16[0] & ~_a_exp_ge_b_exp_;	// vector_unit.k:396:9, :417:{17,33}, :423:{17,21}, :428:21, :429:33, :430:{21,25,45,57}, :431:{21,25,45,57}, :432:{21,25,45,57}, :433:{21,25,45,57}, :438:33
  wire         aligned_b_19 =
    (aligned_b_4
       ? (aligned_b_6
            ? (aligned_b_5 ? aligned_b_7 | _GEN_12 : aligned_b_7 & ~(shift[1]) | shift[0])
            : aligned_b_5
                ? aligned_b_7 & ~(shift[0]) | shift[1]
                : aligned_b_7 ? _GEN_13 : _GEN_14)
       : aligned_b_6
           ? (aligned_b_5
                ? (aligned_b_7 ? _GEN_10 : _GEN_11)
                : aligned_b_7 ? ~(shift[1]) : _GEN_9)
           : aligned_b_5 ? (aligned_b_7 | shift[1]) & ~(shift[0]) : aligned_b_7 & _GEN_8)
    & _a_exp_ge_b_exp_;	// vector_unit.k:423:{17,21}, :428:21, :430:{21,25,45,57}, :431:{21,25,45,57}, :432:{21,25,45,57}, :433:{21,25,45,57}
  wire         aligned_b_20 =
    (aligned_b_5
       ? (aligned_b_7
            ? (aligned_b_6 ? aligned_b_8 | _GEN_12 : aligned_b_8 & ~(shift[1]) | shift[0])
            : aligned_b_6
                ? aligned_b_8 & ~(shift[0]) | shift[1]
                : aligned_b_8 ? _GEN_13 : _GEN_14)
       : aligned_b_7
           ? (aligned_b_6
                ? (aligned_b_8 ? _GEN_10 : _GEN_11)
                : aligned_b_8 ? ~(shift[1]) : _GEN_9)
           : aligned_b_6 ? (aligned_b_8 | shift[1]) & ~(shift[0]) : aligned_b_8 & _GEN_8)
    & _a_exp_ge_b_exp_;	// vector_unit.k:423:{17,21}, :428:21, :430:{21,25,45,57}, :431:{21,25,45,57}, :432:{21,25,45,57}, :433:{21,25,45,57}
  wire         aligned_b_21 =
    (aligned_b_6
       ? (aligned_b_8
            ? (aligned_b_7 ? aligned_b_9 | _GEN_12 : aligned_b_9 & ~(shift[1]) | shift[0])
            : aligned_b_7
                ? aligned_b_9 & ~(shift[0]) | shift[1]
                : aligned_b_9 ? _GEN_13 : _GEN_14)
       : aligned_b_8
           ? (aligned_b_7
                ? (aligned_b_9 ? _GEN_10 : _GEN_11)
                : aligned_b_9 ? ~(shift[1]) : _GEN_9)
           : aligned_b_7 ? (aligned_b_9 | shift[1]) & ~(shift[0]) : aligned_b_9 & _GEN_8)
    & _a_exp_ge_b_exp_;	// vector_unit.k:423:{17,21}, :428:21, :430:{21,25,45,57}, :431:{21,25,45,57}, :432:{21,25,45,57}, :433:{21,25,45,57}
  wire         aligned_b_22 =
    (aligned_b_7
       ? (aligned_b_9
            ? (aligned_b_8
                 ? aligned_b_10 | _GEN_12
                 : aligned_b_10 & ~(shift[1]) | shift[0])
            : aligned_b_8
                ? aligned_b_10 & ~(shift[0]) | shift[1]
                : aligned_b_10 ? _GEN_13 : _GEN_14)
       : aligned_b_9
           ? (aligned_b_8
                ? (aligned_b_10 ? _GEN_10 : _GEN_11)
                : aligned_b_10 ? ~(shift[1]) : _GEN_9)
           : aligned_b_8
               ? (aligned_b_10 | shift[1]) & ~(shift[0])
               : aligned_b_10 & _GEN_8) & _a_exp_ge_b_exp_;	// vector_unit.k:423:{17,21}, :428:21, :430:{21,25,45,57}, :431:{21,25,45,57}, :432:{21,25,45,57}, :433:{21,25,45,57}
  wire  [15:0] aligned_b_23 =
    {4'h0,
     aligned_b_11,
     aligned_b_12,
     aligned_b_13,
     aligned_b_14,
     aligned_b_15,
     aligned_b_16,
     aligned_b_17,
     aligned_b_18,
     aligned_b_19,
     aligned_b_20,
     aligned_b_21,
     aligned_b_22};	// vector_unit.k:423:17
  wire  [12:0] _aligned_a_plus_aligned_b_ =
    13'({1'h0,
         aligned_a_18,
         aligned_a_19,
         aligned_a_20,
         aligned_a_21,
         aligned_a_22,
         aligned_a_23,
         aligned_a_24,
         aligned_a_25,
         aligned_a_26,
         aligned_a_27,
         aligned_a_28,
         aligned_a_29}
        + {1'h0,
           aligned_b_11,
           aligned_b_12,
           aligned_b_13,
           aligned_b_14,
           aligned_b_15,
           aligned_b_16,
           aligned_b_17,
           aligned_b_18,
           aligned_b_19,
           aligned_b_20,
           aligned_b_21,
           aligned_b_22});	// vector_unit.k:423:17, :454:27
  wire         _aligned_a_ge_aligned_b_ =
    {aligned_a_18,
     aligned_a_19,
     aligned_a_20,
     aligned_a_21,
     aligned_a_22,
     aligned_a_23,
     aligned_a_24,
     aligned_a_25,
     aligned_a_26,
     aligned_a_27,
     aligned_a_28,
     aligned_a_29} >= {aligned_b_11,
                       aligned_b_12,
                       aligned_b_13,
                       aligned_b_14,
                       aligned_b_15,
                       aligned_b_16,
                       aligned_b_17,
                       aligned_b_18,
                       aligned_b_19,
                       aligned_b_20,
                       aligned_b_21,
                       aligned_b_22};	// vector_unit.k:423:17, :458:25
  wire  [15:0] _aligned_a_minus_aligned_b_ = 16'(aligned_a_30 - aligned_b_23);	// vector_unit.k:423:17, :461:31
  wire  [15:0] _aligned_b_minus_aligned_a_ = 16'(aligned_b_23 - aligned_a_30);	// vector_unit.k:423:17, :466:31
  wire         _GEN_22 = ~_aligned_a_ge_aligned_b_ & ~_a_sign_eq_b_sign_;	// vector_unit.k:451:{17,21}, :458:{21,25}
  wire         sum =
    _aligned_a_minus_aligned_b_[15]
      ? (_aligned_b_minus_aligned_a_[15] | _aligned_a_ge_aligned_b_) & ~_a_sign_eq_b_sign_
      : _aligned_b_minus_aligned_a_[15] & _GEN_22;	// vector_unit.k:451:{17,21}, :458:{21,25}, :461:31, :466:31
  wire         sum_0 =
    _aligned_a_minus_aligned_b_[14]
      ? (_aligned_b_minus_aligned_a_[14] | _aligned_a_ge_aligned_b_) & ~_a_sign_eq_b_sign_
      : _aligned_b_minus_aligned_a_[14] & _GEN_22;	// vector_unit.k:451:{17,21}, :458:{21,25}, :461:31, :466:31
  wire         sum_1 =
    _aligned_a_minus_aligned_b_[13]
      ? (_aligned_b_minus_aligned_a_[13] | _aligned_a_ge_aligned_b_) & ~_a_sign_eq_b_sign_
      : _aligned_b_minus_aligned_a_[13] & _GEN_22;	// vector_unit.k:451:{17,21}, :458:{21,25}, :461:31, :466:31
  wire         _GEN_23 = _aligned_a_ge_aligned_b_ | _a_sign_eq_b_sign_;	// vector_unit.k:451:{17,21}, :458:{21,25}
  wire         sum_2 =
    _aligned_a_plus_aligned_b_[12]
      ? (_aligned_a_minus_aligned_b_[12]
           ? _aligned_b_minus_aligned_a_[12] | _GEN_23
           : _aligned_b_minus_aligned_a_[12] & ~_aligned_a_ge_aligned_b_
             | _a_sign_eq_b_sign_)
      : _aligned_a_minus_aligned_b_[12]
          ? (_aligned_b_minus_aligned_a_[12] | _aligned_a_ge_aligned_b_)
            & ~_a_sign_eq_b_sign_
          : _aligned_b_minus_aligned_a_[12] & _GEN_22;	// vector_unit.k:451:{17,21}, :454:27, :458:{21,25}, :461:31, :466:31
  wire         sum_3 =
    _aligned_a_plus_aligned_b_[11]
      ? (_aligned_a_minus_aligned_b_[11]
           ? _aligned_b_minus_aligned_a_[11] | _GEN_23
           : _aligned_b_minus_aligned_a_[11] & ~_aligned_a_ge_aligned_b_
             | _a_sign_eq_b_sign_)
      : _aligned_a_minus_aligned_b_[11]
          ? (_aligned_b_minus_aligned_a_[11] | _aligned_a_ge_aligned_b_)
            & ~_a_sign_eq_b_sign_
          : _aligned_b_minus_aligned_a_[11] & _GEN_22;	// vector_unit.k:451:{17,21}, :454:27, :458:{21,25}, :461:31, :466:31
  wire         sum_4 =
    _aligned_a_plus_aligned_b_[10]
      ? (_aligned_a_minus_aligned_b_[10]
           ? _aligned_b_minus_aligned_a_[10] | _GEN_23
           : _aligned_b_minus_aligned_a_[10] & ~_aligned_a_ge_aligned_b_
             | _a_sign_eq_b_sign_)
      : _aligned_a_minus_aligned_b_[10]
          ? (_aligned_b_minus_aligned_a_[10] | _aligned_a_ge_aligned_b_)
            & ~_a_sign_eq_b_sign_
          : _aligned_b_minus_aligned_a_[10] & _GEN_22;	// vector_unit.k:451:{17,21}, :454:27, :458:{21,25}, :461:31, :466:31
  wire         sum_5 =
    _aligned_a_plus_aligned_b_[9]
      ? (_aligned_a_minus_aligned_b_[9]
           ? _aligned_b_minus_aligned_a_[9] | _GEN_23
           : _aligned_b_minus_aligned_a_[9] & ~_aligned_a_ge_aligned_b_
             | _a_sign_eq_b_sign_)
      : _aligned_a_minus_aligned_b_[9]
          ? (_aligned_b_minus_aligned_a_[9] | _aligned_a_ge_aligned_b_)
            & ~_a_sign_eq_b_sign_
          : _aligned_b_minus_aligned_a_[9] & _GEN_22;	// vector_unit.k:451:{17,21}, :454:27, :458:{21,25}, :461:31, :466:31
  wire         sum_6 =
    _aligned_a_plus_aligned_b_[8]
      ? (_aligned_a_minus_aligned_b_[8]
           ? _aligned_b_minus_aligned_a_[8] | _GEN_23
           : _aligned_b_minus_aligned_a_[8] & ~_aligned_a_ge_aligned_b_
             | _a_sign_eq_b_sign_)
      : _aligned_a_minus_aligned_b_[8]
          ? (_aligned_b_minus_aligned_a_[8] | _aligned_a_ge_aligned_b_)
            & ~_a_sign_eq_b_sign_
          : _aligned_b_minus_aligned_a_[8] & _GEN_22;	// vector_unit.k:451:{17,21}, :454:27, :458:{21,25}, :461:31, :466:31
  wire         sum_7 =
    _aligned_a_plus_aligned_b_[7]
      ? (_aligned_a_minus_aligned_b_[7]
           ? _aligned_b_minus_aligned_a_[7] | _GEN_23
           : _aligned_b_minus_aligned_a_[7] & ~_aligned_a_ge_aligned_b_
             | _a_sign_eq_b_sign_)
      : _aligned_a_minus_aligned_b_[7]
          ? (_aligned_b_minus_aligned_a_[7] | _aligned_a_ge_aligned_b_)
            & ~_a_sign_eq_b_sign_
          : _aligned_b_minus_aligned_a_[7] & _GEN_22;	// vector_unit.k:451:{17,21}, :454:27, :458:{21,25}, :461:31, :466:31
  wire         sum_8 =
    _aligned_a_plus_aligned_b_[6]
      ? (_aligned_a_minus_aligned_b_[6]
           ? _aligned_b_minus_aligned_a_[6] | _GEN_23
           : _aligned_b_minus_aligned_a_[6] & ~_aligned_a_ge_aligned_b_
             | _a_sign_eq_b_sign_)
      : _aligned_a_minus_aligned_b_[6]
          ? (_aligned_b_minus_aligned_a_[6] | _aligned_a_ge_aligned_b_)
            & ~_a_sign_eq_b_sign_
          : _aligned_b_minus_aligned_a_[6] & _GEN_22;	// vector_unit.k:451:{17,21}, :454:27, :458:{21,25}, :461:31, :466:31
  wire         sum_9 =
    _aligned_a_plus_aligned_b_[5]
      ? (_aligned_a_minus_aligned_b_[5]
           ? _aligned_b_minus_aligned_a_[5] | _GEN_23
           : _aligned_b_minus_aligned_a_[5] & ~_aligned_a_ge_aligned_b_
             | _a_sign_eq_b_sign_)
      : _aligned_a_minus_aligned_b_[5]
          ? (_aligned_b_minus_aligned_a_[5] | _aligned_a_ge_aligned_b_)
            & ~_a_sign_eq_b_sign_
          : _aligned_b_minus_aligned_a_[5] & _GEN_22;	// vector_unit.k:451:{17,21}, :454:27, :458:{21,25}, :461:31, :466:31
  wire         sum_10 =
    _aligned_a_plus_aligned_b_[4]
      ? (_aligned_a_minus_aligned_b_[4]
           ? _aligned_b_minus_aligned_a_[4] | _GEN_23
           : _aligned_b_minus_aligned_a_[4] & ~_aligned_a_ge_aligned_b_
             | _a_sign_eq_b_sign_)
      : _aligned_a_minus_aligned_b_[4]
          ? (_aligned_b_minus_aligned_a_[4] | _aligned_a_ge_aligned_b_)
            & ~_a_sign_eq_b_sign_
          : _aligned_b_minus_aligned_a_[4] & _GEN_22;	// vector_unit.k:451:{17,21}, :454:27, :458:{21,25}, :461:31, :466:31
  wire         sum_11 =
    _aligned_a_plus_aligned_b_[3]
      ? (_aligned_a_minus_aligned_b_[3]
           ? _aligned_b_minus_aligned_a_[3] | _GEN_23
           : _aligned_b_minus_aligned_a_[3] & ~_aligned_a_ge_aligned_b_
             | _a_sign_eq_b_sign_)
      : _aligned_a_minus_aligned_b_[3]
          ? (_aligned_b_minus_aligned_a_[3] | _aligned_a_ge_aligned_b_)
            & ~_a_sign_eq_b_sign_
          : _aligned_b_minus_aligned_a_[3] & _GEN_22;	// vector_unit.k:451:{17,21}, :454:27, :458:{21,25}, :461:31, :466:31
  wire         sum_12 =
    _aligned_a_plus_aligned_b_[2]
      ? (_aligned_a_minus_aligned_b_[2]
           ? _aligned_b_minus_aligned_a_[2] | _GEN_23
           : _aligned_b_minus_aligned_a_[2] & ~_aligned_a_ge_aligned_b_
             | _a_sign_eq_b_sign_)
      : _aligned_a_minus_aligned_b_[2]
          ? (_aligned_b_minus_aligned_a_[2] | _aligned_a_ge_aligned_b_)
            & ~_a_sign_eq_b_sign_
          : _aligned_b_minus_aligned_a_[2] & _GEN_22;	// vector_unit.k:451:{17,21}, :454:27, :458:{21,25}, :461:31, :466:31
  wire         sum_13 =
    _aligned_a_plus_aligned_b_[1]
      ? (_aligned_a_minus_aligned_b_[1]
           ? _aligned_b_minus_aligned_a_[1] | _GEN_23
           : _aligned_b_minus_aligned_a_[1] & ~_aligned_a_ge_aligned_b_
             | _a_sign_eq_b_sign_)
      : _aligned_a_minus_aligned_b_[1]
          ? (_aligned_b_minus_aligned_a_[1] | _aligned_a_ge_aligned_b_)
            & ~_a_sign_eq_b_sign_
          : _aligned_b_minus_aligned_a_[1] & _GEN_22;	// vector_unit.k:451:{17,21}, :454:27, :458:{21,25}, :461:31, :466:31
  wire         sum_14 =
    _aligned_a_plus_aligned_b_[0]
      ? (_aligned_a_minus_aligned_b_[0]
           ? _aligned_b_minus_aligned_a_[0] | _GEN_23
           : _aligned_b_minus_aligned_a_[0] & ~_aligned_a_ge_aligned_b_
             | _a_sign_eq_b_sign_)
      : _aligned_a_minus_aligned_b_[0]
          ? (_aligned_b_minus_aligned_a_[0] | _aligned_a_ge_aligned_b_)
            & ~_a_sign_eq_b_sign_
          : _aligned_b_minus_aligned_a_[0] & _GEN_22;	// vector_unit.k:451:{17,21}, :454:27, :458:{21,25}, :461:31, :466:31
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
     sum_14};	// vector_unit.k:451:17, :458:21
  wire         _sum_eq_0_ = sum_15 == 16'h0;	// vector_unit.k:451:17, :458:21, :470:21
  wire  [7:0]  _GEN_24 = {sum, sum_0, sum_1, sum_2, sum_3, sum_4, sum_5, sum_6};	// vector_unit.k:451:17, :458:21, :480:25
  wire         tmp = sum ? sum_7 | (|_GEN_24) : sum_7 & ~(|_GEN_24);	// vector_unit.k:451:17, :458:21, :480:{21,25,48,54}
  wire         tmp_0 = sum_0 ? sum_8 | (|_GEN_24) : sum_8 & ~(|_GEN_24);	// vector_unit.k:451:17, :458:21, :480:{21,25,48,54}
  wire         tmp_1 = sum_1 ? sum_9 | (|_GEN_24) : sum_9 & ~(|_GEN_24);	// vector_unit.k:451:17, :458:21, :480:{21,25,48,54}
  wire         tmp_2 = sum_3 ? sum_11 | (|_GEN_24) : sum_11 & ~(|_GEN_24);	// vector_unit.k:451:17, :458:21, :480:{21,25,48,54}
  wire         tmp_3 = sum_4 ? sum_12 | (|_GEN_24) : sum_12 & ~(|_GEN_24);	// vector_unit.k:451:17, :458:21, :480:{21,25,48,54}
  wire         tmp_4 = sum_5 ? sum_13 | (|_GEN_24) : sum_13 & ~(|_GEN_24);	// vector_unit.k:451:17, :458:21, :480:{21,25,48,54}
  wire  [3:0]  _GEN_25 =
    {tmp, tmp_0, tmp_1, sum_2 ? sum_10 | (|_GEN_24) : sum_10 & ~(|_GEN_24)};	// vector_unit.k:451:17, :458:21, :480:{21,25,48,54}, :481:25
  wire         tmp_5 = tmp ? tmp_2 | (|_GEN_25) : tmp_2 & ~(|_GEN_25);	// vector_unit.k:480:{21,48,54}, :481:{21,25,48,54}
  wire         tmp_6 = tmp_0 ? tmp_3 | (|_GEN_25) : tmp_3 & ~(|_GEN_25);	// vector_unit.k:480:{21,48,54}, :481:{21,25,48,54}
  wire         pos = tmp_5 | tmp_6;	// vector_unit.k:480:21, :481:{21,48,54,70}, :482:{21,25,48,54,70}, :483:{21,25,54}
  wire         pos_0 =
    (tmp_1 ? tmp_4 | (|_GEN_25) : tmp_4 & ~(|_GEN_25)) & ~tmp_6 | tmp_5;	// vector_unit.k:480:{21,48,54}, :481:{21,25,48,54,70}, :482:{21,25,48,54,70}, :483:{21,25,54}
  wire  [15:0] pos_1 = {12'h0, |_GEN_24, |_GEN_25, pos, pos_0};	// vector_unit.k:480:{21,25}, :481:{21,25,70}, :482:{21,25,48,54,70}, :483:{21,25,54}
  wire         _pos_gt_11_ = pos_1 > 16'hB;	// vector_unit.k:480:21, :481:{21,70}, :482:{21,25,48,54,70}, :483:{21,25,54}, :489:25
  wire         _pos_lt_11_ = pos_1 < 16'hB;	// vector_unit.k:480:21, :481:{21,70}, :482:{21,25,48,54,70}, :483:{21,25,54}, :494:30
  wire  [15:0] _11_minus_pos_ = 16'(16'hB - pos_1);	// vector_unit.k:480:21, :481:{21,70}, :482:{21,25,48,54,70}, :483:{21,25,54}, :496:39
  wire  [15:0] _r_exp_plus_pos_minus_11_ = 16'(r_exp_7 + 16'(pos_1 - 16'hB));	// vector_unit.k:423:17, :480:21, :481:{21,70}, :482:{21,25,48,54,70}, :483:{21,25,54}, :491:{36,44}
  wire  [15:0] _sum_shr_pos_minus_7_ =
    sum_15 >> 16'({12'h0, |_GEN_24, |_GEN_25, pos, pos_0} - 16'h7);	// vector_unit.k:451:17, :458:21, :480:{21,25}, :481:{21,25,70}, :482:{21,25,48,54,70}, :483:{21,25,54}, :492:{34,42}
  wire         _diff_ge_r_exp_ = _11_minus_pos_ >= r_exp_7;	// vector_unit.k:423:17, :496:39, :497:29
  wire  [15:0] _r_exp_minus_diff_ = 16'(r_exp_7 - _11_minus_pos_);	// vector_unit.k:423:17, :496:39, :503:40
  wire         _GEN_26 = ~(_11_minus_pos_[3]) | ~(_11_minus_pos_[2]);	// vector_unit.k:496:39, :507:{25,29,58}, :508:{25,29,58}
  wire         _GEN_27 = _11_minus_pos_[3] ^ _11_minus_pos_[2];	// vector_unit.k:496:39, :507:{25,29,58}, :508:{25,29,58}
  wire         _GEN_28 = ~(_11_minus_pos_[3]) & _11_minus_pos_[2];	// vector_unit.k:496:39, :507:{25,29,58}, :508:{25,29,58}
  wire         _GEN_29 = ~(_11_minus_pos_[3]) & ~(_11_minus_pos_[2]);	// vector_unit.k:496:39, :507:{25,29,58}, :508:{25,29,58}
  wire         shifted =
    sum_8
      ? (sum_12 ? (sum_4 ? _GEN_26 : _GEN_27) : sum_4 ? ~(_11_minus_pos_[3]) : _GEN_28)
      : sum_12 ? (sum_4 | _11_minus_pos_[3]) & ~(_11_minus_pos_[2]) : sum_4 & _GEN_29;	// vector_unit.k:451:17, :458:21, :496:39, :507:{25,29,58}, :508:{25,29,58}
  wire         shifted_0 =
    sum_9
      ? (sum_13 ? (sum_5 ? _GEN_26 : _GEN_27) : sum_5 ? ~(_11_minus_pos_[3]) : _GEN_28)
      : sum_13 ? (sum_5 | _11_minus_pos_[3]) & ~(_11_minus_pos_[2]) : sum_5 & _GEN_29;	// vector_unit.k:451:17, :458:21, :496:39, :507:{25,29,58}, :508:{25,29,58}
  wire         shifted_1 =
    sum_10
      ? (sum_14 ? (sum_6 ? _GEN_26 : _GEN_27) : sum_6 ? ~(_11_minus_pos_[3]) : _GEN_28)
      : sum_14 ? (sum_6 | _11_minus_pos_[3]) & ~(_11_minus_pos_[2]) : sum_6 & _GEN_29;	// vector_unit.k:451:17, :458:21, :496:39, :507:{25,29,58}, :508:{25,29,58}
  wire         shifted_2 =
    sum_11 ? (sum_7 ? ~(_11_minus_pos_[3]) : _GEN_28) : sum_7 & _GEN_29;	// vector_unit.k:451:17, :458:21, :496:39, :507:{25,29,58}, :508:{25,29,58}
  wire         shifted_3 =
    sum_12 ? (sum_8 ? ~(_11_minus_pos_[3]) : _GEN_28) : sum_8 & _GEN_29;	// vector_unit.k:451:17, :458:21, :496:39, :507:{25,29,58}, :508:{25,29,58}
  wire         shifted_4 =
    sum_13 ? (sum_9 ? ~(_11_minus_pos_[3]) : _GEN_28) : sum_9 & _GEN_29;	// vector_unit.k:451:17, :458:21, :496:39, :507:{25,29,58}, :508:{25,29,58}
  wire         shifted_5 =
    sum_14 ? (sum_10 ? ~(_11_minus_pos_[3]) : _GEN_28) : sum_10 & _GEN_29;	// vector_unit.k:451:17, :458:21, :496:39, :507:{25,29,58}, :508:{25,29,58}
  wire         shifted_6 = sum_11 & _GEN_29;	// vector_unit.k:451:17, :458:21, :507:{25,29,58}, :508:{25,29,58}
  wire         shifted_7 = sum_12 & _GEN_29;	// vector_unit.k:451:17, :458:21, :507:{25,29,58}, :508:{25,29,58}
  wire         _GEN_30 = _11_minus_pos_[1] | _11_minus_pos_[0];	// vector_unit.k:496:39, :509:{25,29,58}, :510:{25,29,58}, :511:{25,34}
  wire         _GEN_31 = _11_minus_pos_[1] ^ ~(_11_minus_pos_[0]);	// vector_unit.k:496:39, :509:{25,29,58}, :510:{25,29,58}, :511:{25,34}
  wire         _GEN_32 = _11_minus_pos_[1] & _11_minus_pos_[0];	// vector_unit.k:496:39, :509:{25,29,58}, :510:{25,29,58}, :511:{25,34}
  wire         _GEN_33 = ~(_11_minus_pos_[1]) | ~(_11_minus_pos_[0]);	// vector_unit.k:496:39, :509:{25,29,58}, :510:{25,29,58}, :511:{25,34}
  wire         _GEN_34 = _11_minus_pos_[1] ^ _11_minus_pos_[0];	// vector_unit.k:496:39, :509:{25,29,58}, :510:{25,29,58}, :511:{25,34}
  wire         _GEN_35 = ~(_11_minus_pos_[1]) & _11_minus_pos_[0];	// vector_unit.k:496:39, :509:{25,29,58}, :510:{25,29,58}, :511:{25,34}
  wire         _GEN_36 = ~(_11_minus_pos_[1]) & ~(_11_minus_pos_[0]);	// vector_unit.k:496:39, :509:{25,29,58}, :510:{25,29,58}, :511:{25,34}
  wire         r_mant =
    shifted_2
      ? (shifted_0
           ? (shifted_1
                ? shifted | _GEN_30
                : shifted & ~(_11_minus_pos_[1]) | _11_minus_pos_[0])
           : shifted_1
               ? shifted & ~(_11_minus_pos_[0]) | _11_minus_pos_[1]
               : shifted ? _GEN_31 : _GEN_32)
      : shifted_0
          ? (shifted_1
               ? (shifted ? _GEN_33 : _GEN_34)
               : shifted ? ~(_11_minus_pos_[1]) : _GEN_35)
          : shifted_1
              ? (shifted | _11_minus_pos_[1]) & ~(_11_minus_pos_[0])
              : shifted & _GEN_36;	// vector_unit.k:496:39, :507:{25,29,58}, :508:{25,29,58}, :509:{25,29,58}, :510:{25,29,58}, :511:{25,34}
  wire         r_mant_0 =
    shifted_3
      ? (shifted_1
           ? (shifted_2
                ? shifted_0 | _GEN_30
                : shifted_0 & ~(_11_minus_pos_[1]) | _11_minus_pos_[0])
           : shifted_2
               ? shifted_0 & ~(_11_minus_pos_[0]) | _11_minus_pos_[1]
               : shifted_0 ? _GEN_31 : _GEN_32)
      : shifted_1
          ? (shifted_2
               ? (shifted_0 ? _GEN_33 : _GEN_34)
               : shifted_0 ? ~(_11_minus_pos_[1]) : _GEN_35)
          : shifted_2
              ? (shifted_0 | _11_minus_pos_[1]) & ~(_11_minus_pos_[0])
              : shifted_0 & _GEN_36;	// vector_unit.k:496:39, :507:{25,29,58}, :508:{25,29,58}, :509:{25,29,58}, :510:{25,29,58}, :511:{25,34}
  wire         r_mant_1 =
    shifted_4
      ? (shifted_2
           ? (shifted_3
                ? shifted_1 | _GEN_30
                : shifted_1 & ~(_11_minus_pos_[1]) | _11_minus_pos_[0])
           : shifted_3
               ? shifted_1 & ~(_11_minus_pos_[0]) | _11_minus_pos_[1]
               : shifted_1 ? _GEN_31 : _GEN_32)
      : shifted_2
          ? (shifted_3
               ? (shifted_1 ? _GEN_33 : _GEN_34)
               : shifted_1 ? ~(_11_minus_pos_[1]) : _GEN_35)
          : shifted_3
              ? (shifted_1 | _11_minus_pos_[1]) & ~(_11_minus_pos_[0])
              : shifted_1 & _GEN_36;	// vector_unit.k:496:39, :507:{25,29,58}, :508:{25,29,58}, :509:{25,29,58}, :510:{25,29,58}, :511:{25,34}
  wire         r_mant_2 =
    shifted_5
      ? (shifted_3
           ? (shifted_4
                ? shifted_2 | _GEN_30
                : shifted_2 & ~(_11_minus_pos_[1]) | _11_minus_pos_[0])
           : shifted_4
               ? shifted_2 & ~(_11_minus_pos_[0]) | _11_minus_pos_[1]
               : shifted_2 ? _GEN_31 : _GEN_32)
      : shifted_3
          ? (shifted_4
               ? (shifted_2 ? _GEN_33 : _GEN_34)
               : shifted_2 ? ~(_11_minus_pos_[1]) : _GEN_35)
          : shifted_4
              ? (shifted_2 | _11_minus_pos_[1]) & ~(_11_minus_pos_[0])
              : shifted_2 & _GEN_36;	// vector_unit.k:496:39, :507:{25,29,58}, :508:{25,29,58}, :509:{25,29,58}, :510:{25,29,58}, :511:{25,34}
  wire         r_mant_3 =
    shifted_6
      ? (shifted_4
           ? (shifted_5
                ? shifted_3 | _GEN_30
                : shifted_3 & ~(_11_minus_pos_[1]) | _11_minus_pos_[0])
           : shifted_5
               ? shifted_3 & ~(_11_minus_pos_[0]) | _11_minus_pos_[1]
               : shifted_3 ? _GEN_31 : _GEN_32)
      : shifted_4
          ? (shifted_5
               ? (shifted_3 ? _GEN_33 : _GEN_34)
               : shifted_3 ? ~(_11_minus_pos_[1]) : _GEN_35)
          : shifted_5
              ? (shifted_3 | _11_minus_pos_[1]) & ~(_11_minus_pos_[0])
              : shifted_3 & _GEN_36;	// vector_unit.k:496:39, :507:{25,29,58}, :508:{25,29,58}, :509:{25,29,58}, :510:{25,29,58}, :511:{25,34}
  wire         r_mant_4 =
    shifted_7
      ? (shifted_5
           ? (shifted_6
                ? shifted_4 | _GEN_30
                : shifted_4 & ~(_11_minus_pos_[1]) | _11_minus_pos_[0])
           : shifted_6
               ? shifted_4 & ~(_11_minus_pos_[0]) | _11_minus_pos_[1]
               : shifted_4 ? _GEN_31 : _GEN_32)
      : shifted_5
          ? (shifted_6
               ? (shifted_4 ? _GEN_33 : _GEN_34)
               : shifted_4 ? ~(_11_minus_pos_[1]) : _GEN_35)
          : shifted_6
              ? (shifted_4 | _11_minus_pos_[1]) & ~(_11_minus_pos_[0])
              : shifted_4 & _GEN_36;	// vector_unit.k:496:39, :507:{25,29,58}, :508:{25,29,58}, :509:{25,29,58}, :510:{25,29,58}, :511:{25,34}
  wire         r_mant_5 =
    sum_13 & _GEN_29
      ? (shifted_6
           ? (shifted_7
                ? shifted_5 | _GEN_30
                : shifted_5 & ~(_11_minus_pos_[1]) | _11_minus_pos_[0])
           : shifted_7
               ? shifted_5 & ~(_11_minus_pos_[0]) | _11_minus_pos_[1]
               : shifted_5 ? _GEN_31 : _GEN_32)
      : shifted_6
          ? (shifted_7
               ? (shifted_5 ? _GEN_33 : _GEN_34)
               : shifted_5 ? ~(_11_minus_pos_[1]) : _GEN_35)
          : shifted_7
              ? (shifted_5 | _11_minus_pos_[1]) & ~(_11_minus_pos_[0])
              : shifted_5 & _GEN_36;	// vector_unit.k:451:17, :458:21, :496:39, :507:{25,29,58}, :508:{25,29,58}, :509:{25,29,58}, :510:{25,29,58}, :511:{25,34}
  wire         _GEN_37 = _pos_lt_11_ | _pos_gt_11_;	// vector_unit.k:489:{21,25}, :494:{26,30}, :497:25
  wire         _GEN_38 = ~_diff_ge_r_exp_ & _pos_lt_11_;	// vector_unit.k:489:21, :494:{26,30}, :497:{25,29}
  wire         _GEN_39 = ~_diff_ge_r_exp_ & _pos_lt_11_ & ~_pos_gt_11_;	// vector_unit.k:489:{21,25}, :494:{26,30}, :497:{25,29}
  wire         norm_exp =
    _r_exp_plus_pos_minus_11_[8]
      ? _r_exp_minus_diff_[8] & _GEN_38 | _pos_gt_11_
      : _r_exp_minus_diff_[8] & _GEN_39;	// vector_unit.k:489:{21,25}, :491:{36,44}, :494:26, :497:25, :503:40
  wire         _GEN_40 = ~_pos_lt_11_ & ~_pos_gt_11_;	// vector_unit.k:489:{21,25}, :494:{26,30}, :497:25
  wire         norm_exp_0 =
    _r_exp_plus_pos_minus_11_[7]
      ? (~(_r_exp_minus_diff_[7]) | _diff_ge_r_exp_
           ? r_exp & ~_pos_lt_11_ | _pos_gt_11_
           : r_exp | _GEN_37)
      : ~(_r_exp_minus_diff_[7]) | _diff_ge_r_exp_
          ? r_exp & _GEN_40
          : (r_exp | _pos_lt_11_) & ~_pos_gt_11_;	// vector_unit.k:423:17, :489:{21,25}, :491:{36,44}, :494:{26,30}, :497:{25,29}, :503:40
  wire         norm_exp_1 =
    _r_exp_plus_pos_minus_11_[6]
      ? (~(_r_exp_minus_diff_[6]) | _diff_ge_r_exp_
           ? r_exp_0 & ~_pos_lt_11_ | _pos_gt_11_
           : r_exp_0 | _GEN_37)
      : ~(_r_exp_minus_diff_[6]) | _diff_ge_r_exp_
          ? r_exp_0 & _GEN_40
          : (r_exp_0 | _pos_lt_11_) & ~_pos_gt_11_;	// vector_unit.k:423:17, :489:{21,25}, :491:{36,44}, :494:{26,30}, :497:{25,29}, :503:40
  wire         norm_exp_2 =
    _r_exp_plus_pos_minus_11_[5]
      ? (~(_r_exp_minus_diff_[5]) | _diff_ge_r_exp_
           ? r_exp_1 & ~_pos_lt_11_ | _pos_gt_11_
           : r_exp_1 | _GEN_37)
      : ~(_r_exp_minus_diff_[5]) | _diff_ge_r_exp_
          ? r_exp_1 & _GEN_40
          : (r_exp_1 | _pos_lt_11_) & ~_pos_gt_11_;	// vector_unit.k:423:17, :489:{21,25}, :491:{36,44}, :494:{26,30}, :497:{25,29}, :503:40
  wire         norm_exp_3 =
    _r_exp_plus_pos_minus_11_[4]
      ? (~(_r_exp_minus_diff_[4]) | _diff_ge_r_exp_
           ? r_exp_2 & ~_pos_lt_11_ | _pos_gt_11_
           : r_exp_2 | _GEN_37)
      : ~(_r_exp_minus_diff_[4]) | _diff_ge_r_exp_
          ? r_exp_2 & _GEN_40
          : (r_exp_2 | _pos_lt_11_) & ~_pos_gt_11_;	// vector_unit.k:423:17, :489:{21,25}, :491:{36,44}, :494:{26,30}, :497:{25,29}, :503:40
  wire         norm_exp_4 =
    _r_exp_plus_pos_minus_11_[3]
      ? (~(_r_exp_minus_diff_[3]) | _diff_ge_r_exp_
           ? r_exp_3 & ~_pos_lt_11_ | _pos_gt_11_
           : r_exp_3 | _GEN_37)
      : ~(_r_exp_minus_diff_[3]) | _diff_ge_r_exp_
          ? r_exp_3 & _GEN_40
          : (r_exp_3 | _pos_lt_11_) & ~_pos_gt_11_;	// vector_unit.k:423:17, :489:{21,25}, :491:{36,44}, :494:{26,30}, :497:{25,29}, :503:40
  wire         norm_exp_5 =
    _r_exp_plus_pos_minus_11_[2]
      ? (~(_r_exp_minus_diff_[2]) | _diff_ge_r_exp_
           ? r_exp_4 & ~_pos_lt_11_ | _pos_gt_11_
           : r_exp_4 | _GEN_37)
      : ~(_r_exp_minus_diff_[2]) | _diff_ge_r_exp_
          ? r_exp_4 & _GEN_40
          : (r_exp_4 | _pos_lt_11_) & ~_pos_gt_11_;	// vector_unit.k:423:17, :489:{21,25}, :491:{36,44}, :494:{26,30}, :497:{25,29}, :503:40
  wire         norm_exp_6 =
    _r_exp_plus_pos_minus_11_[1]
      ? (~(_r_exp_minus_diff_[1]) | _diff_ge_r_exp_
           ? r_exp_5 & ~_pos_lt_11_ | _pos_gt_11_
           : r_exp_5 | _GEN_37)
      : ~(_r_exp_minus_diff_[1]) | _diff_ge_r_exp_
          ? r_exp_5 & _GEN_40
          : (r_exp_5 | _pos_lt_11_) & ~_pos_gt_11_;	// vector_unit.k:423:17, :489:{21,25}, :491:{36,44}, :494:{26,30}, :497:{25,29}, :503:40
  wire         norm_exp_7 =
    _r_exp_plus_pos_minus_11_[0]
      ? (~(_r_exp_minus_diff_[0]) | _diff_ge_r_exp_
           ? r_exp_6 & ~_pos_lt_11_ | _pos_gt_11_
           : r_exp_6 | _GEN_37)
      : ~(_r_exp_minus_diff_[0]) | _diff_ge_r_exp_
          ? r_exp_6 & _GEN_40
          : (r_exp_6 | _pos_lt_11_) & ~_pos_gt_11_;	// vector_unit.k:423:17, :489:{21,25}, :491:{36,44}, :494:{26,30}, :497:{25,29}, :503:40
  wire  [15:0] norm_exp_8 =
    {_r_exp_plus_pos_minus_11_[15]
       ? _r_exp_minus_diff_[15] & _GEN_38 | _pos_gt_11_
       : _r_exp_minus_diff_[15] & _GEN_39,
     _r_exp_plus_pos_minus_11_[14]
       ? _r_exp_minus_diff_[14] & _GEN_38 | _pos_gt_11_
       : _r_exp_minus_diff_[14] & _GEN_39,
     _r_exp_plus_pos_minus_11_[13]
       ? _r_exp_minus_diff_[13] & _GEN_38 | _pos_gt_11_
       : _r_exp_minus_diff_[13] & _GEN_39,
     _r_exp_plus_pos_minus_11_[12]
       ? _r_exp_minus_diff_[12] & _GEN_38 | _pos_gt_11_
       : _r_exp_minus_diff_[12] & _GEN_39,
     _r_exp_plus_pos_minus_11_[11]
       ? _r_exp_minus_diff_[11] & _GEN_38 | _pos_gt_11_
       : _r_exp_minus_diff_[11] & _GEN_39,
     _r_exp_plus_pos_minus_11_[10]
       ? _r_exp_minus_diff_[10] & _GEN_38 | _pos_gt_11_
       : _r_exp_minus_diff_[10] & _GEN_39,
     _r_exp_plus_pos_minus_11_[9]
       ? _r_exp_minus_diff_[9] & _GEN_38 | _pos_gt_11_
       : _r_exp_minus_diff_[9] & _GEN_39,
     norm_exp,
     norm_exp_0,
     norm_exp_1,
     norm_exp_2,
     norm_exp_3,
     norm_exp_4,
     norm_exp_5,
     norm_exp_6,
     norm_exp_7};	// vector_unit.k:489:{21,25}, :491:{36,44}, :494:26, :497:25, :503:40
  wire         _norm_exp_eq_0_ = norm_exp_8 == 16'h0;	// vector_unit.k:489:21, :494:26, :497:25, :519:34
  wire         _norm_exp_ge_255_ = norm_exp_8 > 16'hFE;	// vector_unit.k:489:21, :494:26, :497:25, :519:51
  wire         _r_sign_shl_15_or_norm_exp_shl_7_or_r_mant_ =
    norm_exp | (p0_a_bf16[15] ? p0_b_bf16[15] | _GEN_23 : p0_b_bf16[15] & _GEN_22);	// vector_unit.k:396:9, :401:{13,29}, :402:{13,29}, :451:17, :458:21, :489:21, :492:{25,34}, :494:26, :497:25, :516:{25,34}, :525:{34,49,51}
  wire         _r_sign_shl_15_or_norm_exp_shl_7_or_r_mant__0 =
    _sum_shr_pos_minus_7_[6]
      ? (r_mant ? sum_4 | _GEN_37 : sum_4 & ~_pos_lt_11_ | _pos_gt_11_)
      : r_mant ? (sum_4 | _pos_lt_11_) & ~_pos_gt_11_ : sum_4 & _GEN_40;	// vector_unit.k:451:17, :458:21, :489:{21,25}, :492:{25,34}, :494:{26,30}, :497:25, :509:{25,29,58}, :510:{25,29,58}, :511:{25,34}, :516:{25,34}, :525:{34,49,51}
  wire         _r_sign_shl_15_or_norm_exp_shl_7_or_r_mant__1 =
    _sum_shr_pos_minus_7_[5]
      ? (r_mant_0 ? sum_5 | _GEN_37 : sum_5 & ~_pos_lt_11_ | _pos_gt_11_)
      : r_mant_0 ? (sum_5 | _pos_lt_11_) & ~_pos_gt_11_ : sum_5 & _GEN_40;	// vector_unit.k:451:17, :458:21, :489:{21,25}, :492:{25,34}, :494:{26,30}, :497:25, :509:{25,29,58}, :510:{25,29,58}, :511:{25,34}, :516:{25,34}, :525:{34,49,51}
  wire         _r_sign_shl_15_or_norm_exp_shl_7_or_r_mant__2 =
    _sum_shr_pos_minus_7_[4]
      ? (r_mant_1 ? sum_6 | _GEN_37 : sum_6 & ~_pos_lt_11_ | _pos_gt_11_)
      : r_mant_1 ? (sum_6 | _pos_lt_11_) & ~_pos_gt_11_ : sum_6 & _GEN_40;	// vector_unit.k:451:17, :458:21, :489:{21,25}, :492:{25,34}, :494:{26,30}, :497:25, :509:{25,29,58}, :510:{25,29,58}, :511:{25,34}, :516:{25,34}, :525:{34,49,51}
  wire         _r_sign_shl_15_or_norm_exp_shl_7_or_r_mant__3 =
    _sum_shr_pos_minus_7_[3]
      ? (r_mant_2 ? sum_7 | _GEN_37 : sum_7 & ~_pos_lt_11_ | _pos_gt_11_)
      : r_mant_2 ? (sum_7 | _pos_lt_11_) & ~_pos_gt_11_ : sum_7 & _GEN_40;	// vector_unit.k:451:17, :458:21, :489:{21,25}, :492:{25,34}, :494:{26,30}, :497:25, :509:{25,29,58}, :510:{25,29,58}, :511:{25,34}, :516:{25,34}, :525:{34,49,51}
  wire         _r_sign_shl_15_or_norm_exp_shl_7_or_r_mant__4 =
    _sum_shr_pos_minus_7_[2]
      ? (r_mant_3 ? sum_8 | _GEN_37 : sum_8 & ~_pos_lt_11_ | _pos_gt_11_)
      : r_mant_3 ? (sum_8 | _pos_lt_11_) & ~_pos_gt_11_ : sum_8 & _GEN_40;	// vector_unit.k:451:17, :458:21, :489:{21,25}, :492:{25,34}, :494:{26,30}, :497:25, :509:{25,29,58}, :510:{25,29,58}, :511:{25,34}, :516:{25,34}, :525:{34,49,51}
  wire         _r_sign_shl_15_or_norm_exp_shl_7_or_r_mant__5 =
    _sum_shr_pos_minus_7_[1]
      ? (r_mant_4 ? sum_9 | _GEN_37 : sum_9 & ~_pos_lt_11_ | _pos_gt_11_)
      : r_mant_4 ? (sum_9 | _pos_lt_11_) & ~_pos_gt_11_ : sum_9 & _GEN_40;	// vector_unit.k:451:17, :458:21, :489:{21,25}, :492:{25,34}, :494:{26,30}, :497:25, :509:{25,29,58}, :510:{25,29,58}, :511:{25,34}, :516:{25,34}, :525:{34,49,51}
  wire         _r_sign_shl_15_or_norm_exp_shl_7_or_r_mant__6 =
    _sum_shr_pos_minus_7_[0]
      ? (r_mant_5 ? sum_10 | _GEN_37 : sum_10 & ~_pos_lt_11_ | _pos_gt_11_)
      : r_mant_5 ? (sum_10 | _pos_lt_11_) & ~_pos_gt_11_ : sum_10 & _GEN_40;	// vector_unit.k:451:17, :458:21, :489:{21,25}, :492:{25,34}, :494:{26,30}, :497:25, :509:{25,29,58}, :510:{25,29,58}, :511:{25,34}, :516:{25,34}, :525:{34,49,51}
  wire         _GEN_41 = ~_norm_exp_ge_255_ & ~_norm_exp_eq_0_ & ~_sum_eq_0_;	// vector_unit.k:409:18, :470:{17,21}, :519:{21,25,34,51}
  wire         _GEN_42 =
    ~_norm_exp_ge_255_ & ~_norm_exp_eq_0_ & ~_sum_eq_0_ & ~_b_exp_eq_0_;	// vector_unit.k:409:{18,22}, :470:{17,21}, :519:{21,25,34,51}
  always @(posedge clk) begin	// vector_unit.k:396:9
    p0_a_bf16 <= data_in_33[15:0];	// vector_unit.k:396:9
    p0_b_bf16 <= data_in_33[31:16];	// vector_unit.k:396:9
    if (rst)	// vector_unit.k:396:9
      p0_stage1_enable <= 1'h0;	// vector_unit.k:396:9
    else	// vector_unit.k:396:9
      p0_stage1_enable <= _GEN & input_valid_0;	// vector_unit.k:396:9
    p0_result <=
      p0_a_bf16[14:7] == 8'h0
        ? p0_b_bf16
        : {p0_a_bf16[15]
             ? _r_sign_shl_15_or_norm_exp_shl_7_or_r_mant_ & _GEN_41 | _b_exp_eq_0_
             : _r_sign_shl_15_or_norm_exp_shl_7_or_r_mant_ & _GEN_42,
           p0_a_bf16[14] ? norm_exp_0 & _GEN_41 | _b_exp_eq_0_ : norm_exp_0 & _GEN_42,
           p0_a_bf16[13] ? norm_exp_1 & _GEN_41 | _b_exp_eq_0_ : norm_exp_1 & _GEN_42,
           p0_a_bf16[12] ? norm_exp_2 & _GEN_41 | _b_exp_eq_0_ : norm_exp_2 & _GEN_42,
           p0_a_bf16[11] ? norm_exp_3 & _GEN_41 | _b_exp_eq_0_ : norm_exp_3 & _GEN_42,
           p0_a_bf16[10] ? norm_exp_4 & _GEN_41 | _b_exp_eq_0_ : norm_exp_4 & _GEN_42,
           p0_a_bf16[9] ? norm_exp_5 & _GEN_41 | _b_exp_eq_0_ : norm_exp_5 & _GEN_42,
           p0_a_bf16[8] ? norm_exp_6 & _GEN_41 | _b_exp_eq_0_ : norm_exp_6 & _GEN_42,
           p0_a_bf16[7] ? norm_exp_7 & _GEN_41 | _b_exp_eq_0_ : norm_exp_7 & _GEN_42,
           p0_a_bf16[6]
             ? _r_sign_shl_15_or_norm_exp_shl_7_or_r_mant__0 & _GEN_41 | _b_exp_eq_0_
             : _r_sign_shl_15_or_norm_exp_shl_7_or_r_mant__0 & _GEN_42,
           p0_a_bf16[5]
             ? _r_sign_shl_15_or_norm_exp_shl_7_or_r_mant__1 & _GEN_41 | _b_exp_eq_0_
             : _r_sign_shl_15_or_norm_exp_shl_7_or_r_mant__1 & _GEN_42,
           p0_a_bf16[4]
             ? _r_sign_shl_15_or_norm_exp_shl_7_or_r_mant__2 & _GEN_41 | _b_exp_eq_0_
             : _r_sign_shl_15_or_norm_exp_shl_7_or_r_mant__2 & _GEN_42,
           p0_a_bf16[3]
             ? _r_sign_shl_15_or_norm_exp_shl_7_or_r_mant__3 & _GEN_41 | _b_exp_eq_0_
             : _r_sign_shl_15_or_norm_exp_shl_7_or_r_mant__3 & _GEN_42,
           p0_a_bf16[2]
             ? _r_sign_shl_15_or_norm_exp_shl_7_or_r_mant__4 & _GEN_41 | _b_exp_eq_0_
             : _r_sign_shl_15_or_norm_exp_shl_7_or_r_mant__4 & _GEN_42,
           p0_a_bf16[1]
             ? _r_sign_shl_15_or_norm_exp_shl_7_or_r_mant__5 & _GEN_41 | _b_exp_eq_0_
             : _r_sign_shl_15_or_norm_exp_shl_7_or_r_mant__5 & _GEN_42,
           p0_a_bf16[0]
             ? _r_sign_shl_15_or_norm_exp_shl_7_or_r_mant__6 & _GEN_41 | _b_exp_eq_0_
             : _r_sign_shl_15_or_norm_exp_shl_7_or_r_mant__6 & _GEN_42};	// vector_unit.k:396:9, :399:{13,28}, :405:{13,17}, :409:{18,22}, :451:17, :458:21, :470:17, :489:21, :492:{25,34}, :494:26, :497:25, :516:{25,34}, :519:{21,25}, :525:{34,49,51}
    if (rst)	// vector_unit.k:396:9
      p0_stage2_enable <= 1'h0;	// vector_unit.k:396:9
    else	// vector_unit.k:396:9
      p0_stage2_enable <= p0_stage1_enable;	// vector_unit.k:396:9
    p0_result_0 <= p0_result;	// vector_unit.k:396:9
    if (rst)	// vector_unit.k:396:9
      p0_stage3_enable <= 1'h0;	// vector_unit.k:396:9
    else	// vector_unit.k:396:9
      p0_stage3_enable <= p0_stage2_enable;	// vector_unit.k:396:9
  end // always @(posedge)
  always_comb begin	// vector_unit.k:396:9
    fifo_wren_0_0 = p0_stage3_enable;	// vector_unit.k:394:5, :396:9
    fifo_data_out_0_0 = p0_result_0;	// vector_unit.k:394:5, :396:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// vector_unit.k:396:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// vector_unit.k:396:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  vector_unitDebugView_residual_addEntry vector_unitDebugView_residual_addEntry_instance (	// vector_unit.k:394:5
    .clk       (clk),	// vector_unit.k:394:5
    ._a_bf16   (p0_stage1_enable ? p0_a_bf16 : 'x),	// vector_unit.k:394:5, :396:9
    ._b_bf16   (p0_stage1_enable ? p0_b_bf16 : 'x),	// vector_unit.k:394:5, :396:9
    .valid     (p0_stage1_enable),	// vector_unit.k:396:9
    .valid_out (/* unused */)
  );	// vector_unit.k:394:5
  vector_unitDebugView_residual_addExit vector_unitDebugView_residual_addExit_instance (	// vector_unit.k:394:5
    .clk          (clk),	// vector_unit.k:394:5
    ._ReturnValue (p0_stage2_enable ? p0_result : 'x),	// vector_unit.k:394:5, :396:9
    .valid        (p0_stage2_enable),	// vector_unit.k:396:9
    .valid_out    (/* unused */)
  );	// vector_unit.k:394:5
  assign done_out = p0_stage3_enable;	// vector_unit.k:396:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// vector_unit.k:396:9
  assign fifo_wren_0 = fifo_wren_0_0;	// vector_unit.k:396:9
  assign input_rdy_0 = input_rdy_0_0;	// vector_unit.k:396:9
  assign control_state_out = control_state_out_0;	// vector_unit.k:396:9
endmodule

module vector_unit_dequantize_BasicBlock_0(	// vector_unit.k:279:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  output wire [15:0] fifo_data_out_0,
  output wire        fifo_wren_0,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [43:0] data_in_32,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  logic        done_out_0;	// vector_unit.k:279:9
  logic [15:0] fifo_data_out_0_0;	// vector_unit.k:279:9
  logic        fifo_wren_0_0;	// vector_unit.k:279:9
  logic        input_rdy_0_0;	// vector_unit.k:279:9
  logic [7:0]  control_state_out_0;	// vector_unit.k:279:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// vector_unit.k:279:9
  always_comb begin	// vector_unit.k:279:9
    input_rdy_0_0 = _GEN;	// vector_unit.k:279:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// vector_unit.k:279:9
  end // always_comb
  reg   [23:0] p0_accum;	// vector_unit.k:279:9
  reg   [15:0] p0_super_scale_bf16;	// vector_unit.k:279:9
  reg   [3:0]  p0_sub_scale;	// vector_unit.k:279:9
  reg          p0_stage1_enable = 1'h0;	// vector_unit.k:279:9
  reg   [15:0] p0_CastSource;	// vector_unit.k:279:9
  reg          p0_stage2_enable = 1'h0;	// vector_unit.k:279:9
  reg   [15:0] p0_CastSource_0;	// vector_unit.k:279:9
  reg          p0_stage3_enable = 1'h0;	// vector_unit.k:279:9
  wire  [31:0] _scaled_plus_cast_lt_int32_gt_a_shl_1_ =
    32'({{8{p0_accum[23]}}, p0_accum} + {{7{p0_accum[23]}}, p0_accum, 1'h0});	// vector_unit.k:279:9, :286:{13,17,57}, :287:{48,57,58}, :288:58, :289:58, :290:58
  wire         _GEN_0 = p0_accum[23] | p0_sub_scale[0];	// vector_unit.k:279:9, :283:{30,55}, :286:57, :287:{13,17,58}, :288:58, :289:58, :290:58
  wire         _GEN_1 = p0_accum[23] & ~(p0_sub_scale[0]);	// vector_unit.k:279:9, :283:{30,55}, :286:57, :287:{13,17,58}, :288:58, :289:58, :290:58
  wire         scaled = _scaled_plus_cast_lt_int32_gt_a_shl_1_[31] ? _GEN_0 : _GEN_1;	// vector_unit.k:287:{13,17,48}
  wire         scaled_0 = _scaled_plus_cast_lt_int32_gt_a_shl_1_[30] ? _GEN_0 : _GEN_1;	// vector_unit.k:287:{13,17,48}
  wire         scaled_1 = _scaled_plus_cast_lt_int32_gt_a_shl_1_[29] ? _GEN_0 : _GEN_1;	// vector_unit.k:287:{13,17,48}
  wire         scaled_2 = _scaled_plus_cast_lt_int32_gt_a_shl_1_[28] ? _GEN_0 : _GEN_1;	// vector_unit.k:287:{13,17,48}
  wire         scaled_3 = _scaled_plus_cast_lt_int32_gt_a_shl_1_[27] ? _GEN_0 : _GEN_1;	// vector_unit.k:287:{13,17,48}
  wire         scaled_4 = _scaled_plus_cast_lt_int32_gt_a_shl_1_[26] ? _GEN_0 : _GEN_1;	// vector_unit.k:287:{13,17,48}
  wire         scaled_5 = _scaled_plus_cast_lt_int32_gt_a_shl_1_[25] ? _GEN_0 : _GEN_1;	// vector_unit.k:287:{13,17,48}
  wire         scaled_6 = _scaled_plus_cast_lt_int32_gt_a_shl_1_[24] ? _GEN_0 : _GEN_1;	// vector_unit.k:287:{13,17,48}
  wire         scaled_7 =
    _scaled_plus_cast_lt_int32_gt_a_shl_1_[23]
      ? p0_accum[23] | p0_sub_scale[0]
      : p0_accum[23] & ~(p0_sub_scale[0]);	// vector_unit.k:279:9, :283:{30,55}, :286:{13,17}, :287:{13,17,48}
  wire         scaled_8 =
    _scaled_plus_cast_lt_int32_gt_a_shl_1_[22]
      ? p0_accum[22] | p0_sub_scale[0]
      : p0_accum[22] & ~(p0_sub_scale[0]);	// vector_unit.k:279:9, :283:{30,55}, :286:{13,17}, :287:{13,17,48}
  wire         scaled_9 =
    _scaled_plus_cast_lt_int32_gt_a_shl_1_[21]
      ? p0_accum[21] | p0_sub_scale[0]
      : p0_accum[21] & ~(p0_sub_scale[0]);	// vector_unit.k:279:9, :283:{30,55}, :286:{13,17}, :287:{13,17,48}
  wire         scaled_10 =
    _scaled_plus_cast_lt_int32_gt_a_shl_1_[20]
      ? p0_accum[20] | p0_sub_scale[0]
      : p0_accum[20] & ~(p0_sub_scale[0]);	// vector_unit.k:279:9, :283:{30,55}, :286:{13,17}, :287:{13,17,48}
  wire         scaled_11 =
    _scaled_plus_cast_lt_int32_gt_a_shl_1_[19]
      ? p0_accum[19] | p0_sub_scale[0]
      : p0_accum[19] & ~(p0_sub_scale[0]);	// vector_unit.k:279:9, :283:{30,55}, :286:{13,17}, :287:{13,17,48}
  wire         scaled_12 =
    _scaled_plus_cast_lt_int32_gt_a_shl_1_[18]
      ? p0_accum[18] | p0_sub_scale[0]
      : p0_accum[18] & ~(p0_sub_scale[0]);	// vector_unit.k:279:9, :283:{30,55}, :286:{13,17}, :287:{13,17,48}
  wire         scaled_13 =
    _scaled_plus_cast_lt_int32_gt_a_shl_1_[17]
      ? p0_accum[17] | p0_sub_scale[0]
      : p0_accum[17] & ~(p0_sub_scale[0]);	// vector_unit.k:279:9, :283:{30,55}, :286:{13,17}, :287:{13,17,48}
  wire         scaled_14 =
    _scaled_plus_cast_lt_int32_gt_a_shl_1_[16]
      ? p0_accum[16] | p0_sub_scale[0]
      : p0_accum[16] & ~(p0_sub_scale[0]);	// vector_unit.k:279:9, :283:{30,55}, :286:{13,17}, :287:{13,17,48}
  wire         scaled_15 =
    _scaled_plus_cast_lt_int32_gt_a_shl_1_[15]
      ? p0_accum[15] | p0_sub_scale[0]
      : p0_accum[15] & ~(p0_sub_scale[0]);	// vector_unit.k:279:9, :283:{30,55}, :286:{13,17}, :287:{13,17,48}
  wire         scaled_16 =
    _scaled_plus_cast_lt_int32_gt_a_shl_1_[14]
      ? p0_accum[14] | p0_sub_scale[0]
      : p0_accum[14] & ~(p0_sub_scale[0]);	// vector_unit.k:279:9, :283:{30,55}, :286:{13,17}, :287:{13,17,48}
  wire         scaled_17 =
    _scaled_plus_cast_lt_int32_gt_a_shl_1_[13]
      ? p0_accum[13] | p0_sub_scale[0]
      : p0_accum[13] & ~(p0_sub_scale[0]);	// vector_unit.k:279:9, :283:{30,55}, :286:{13,17}, :287:{13,17,48}
  wire         scaled_18 =
    _scaled_plus_cast_lt_int32_gt_a_shl_1_[12]
      ? p0_accum[12] | p0_sub_scale[0]
      : p0_accum[12] & ~(p0_sub_scale[0]);	// vector_unit.k:279:9, :283:{30,55}, :286:{13,17}, :287:{13,17,48}
  wire         scaled_19 =
    _scaled_plus_cast_lt_int32_gt_a_shl_1_[11]
      ? p0_accum[11] | p0_sub_scale[0]
      : p0_accum[11] & ~(p0_sub_scale[0]);	// vector_unit.k:279:9, :283:{30,55}, :286:{13,17}, :287:{13,17,48}
  wire         scaled_20 =
    _scaled_plus_cast_lt_int32_gt_a_shl_1_[10]
      ? p0_accum[10] | p0_sub_scale[0]
      : p0_accum[10] & ~(p0_sub_scale[0]);	// vector_unit.k:279:9, :283:{30,55}, :286:{13,17}, :287:{13,17,48}
  wire         scaled_21 =
    _scaled_plus_cast_lt_int32_gt_a_shl_1_[9]
      ? p0_accum[9] | p0_sub_scale[0]
      : p0_accum[9] & ~(p0_sub_scale[0]);	// vector_unit.k:279:9, :283:{30,55}, :286:{13,17}, :287:{13,17,48}
  wire         scaled_22 =
    _scaled_plus_cast_lt_int32_gt_a_shl_1_[8]
      ? p0_accum[8] | p0_sub_scale[0]
      : p0_accum[8] & ~(p0_sub_scale[0]);	// vector_unit.k:279:9, :283:{30,55}, :286:{13,17}, :287:{13,17,48}
  wire         scaled_23 =
    _scaled_plus_cast_lt_int32_gt_a_shl_1_[7]
      ? p0_accum[7] | p0_sub_scale[0]
      : p0_accum[7] & ~(p0_sub_scale[0]);	// vector_unit.k:279:9, :283:{30,55}, :286:{13,17}, :287:{13,17,48}
  wire         scaled_24 =
    _scaled_plus_cast_lt_int32_gt_a_shl_1_[6]
      ? p0_accum[6] | p0_sub_scale[0]
      : p0_accum[6] & ~(p0_sub_scale[0]);	// vector_unit.k:279:9, :283:{30,55}, :286:{13,17}, :287:{13,17,48}
  wire         scaled_25 =
    _scaled_plus_cast_lt_int32_gt_a_shl_1_[5]
      ? p0_accum[5] | p0_sub_scale[0]
      : p0_accum[5] & ~(p0_sub_scale[0]);	// vector_unit.k:279:9, :283:{30,55}, :286:{13,17}, :287:{13,17,48}
  wire         scaled_26 =
    _scaled_plus_cast_lt_int32_gt_a_shl_1_[4]
      ? p0_accum[4] | p0_sub_scale[0]
      : p0_accum[4] & ~(p0_sub_scale[0]);	// vector_unit.k:279:9, :283:{30,55}, :286:{13,17}, :287:{13,17,48}
  wire         scaled_27 =
    _scaled_plus_cast_lt_int32_gt_a_shl_1_[3]
      ? p0_accum[3] | p0_sub_scale[0]
      : p0_accum[3] & ~(p0_sub_scale[0]);	// vector_unit.k:279:9, :283:{30,55}, :286:{13,17}, :287:{13,17,48}
  wire         scaled_28 =
    _scaled_plus_cast_lt_int32_gt_a_shl_1_[2]
      ? p0_accum[2] | p0_sub_scale[0]
      : p0_accum[2] & ~(p0_sub_scale[0]);	// vector_unit.k:279:9, :283:{30,55}, :286:{13,17}, :287:{13,17,48}
  wire         scaled_29 =
    _scaled_plus_cast_lt_int32_gt_a_shl_1_[1]
      ? p0_accum[1] | p0_sub_scale[0]
      : p0_accum[1] & ~(p0_sub_scale[0]);	// vector_unit.k:279:9, :283:{30,55}, :286:{13,17}, :287:{13,17,48}
  wire         scaled_30 =
    _scaled_plus_cast_lt_int32_gt_a_shl_1_[0]
      ? p0_accum[0] | p0_sub_scale[0]
      : p0_accum[0] & ~(p0_sub_scale[0]);	// vector_unit.k:279:9, :283:{30,55}, :286:{13,17}, :287:{13,17,48}
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
         scaled_30} + {{6{p0_accum[23]}}, p0_accum, 2'h0});	// vector_unit.k:279:9, :286:57, :287:{13,17,58}, :288:{48,57,58}, :289:58, :290:58
  wire         scaled_31 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[31]
      ? scaled | p0_sub_scale[1]
      : scaled & ~(p0_sub_scale[1]);	// vector_unit.k:279:9, :283:{30,55}, :287:{13,17}, :288:{13,17,48}
  wire         scaled_32 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[30]
      ? scaled_0 | p0_sub_scale[1]
      : scaled_0 & ~(p0_sub_scale[1]);	// vector_unit.k:279:9, :283:{30,55}, :287:{13,17}, :288:{13,17,48}
  wire         scaled_33 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[29]
      ? scaled_1 | p0_sub_scale[1]
      : scaled_1 & ~(p0_sub_scale[1]);	// vector_unit.k:279:9, :283:{30,55}, :287:{13,17}, :288:{13,17,48}
  wire         scaled_34 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[28]
      ? scaled_2 | p0_sub_scale[1]
      : scaled_2 & ~(p0_sub_scale[1]);	// vector_unit.k:279:9, :283:{30,55}, :287:{13,17}, :288:{13,17,48}
  wire         scaled_35 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[27]
      ? scaled_3 | p0_sub_scale[1]
      : scaled_3 & ~(p0_sub_scale[1]);	// vector_unit.k:279:9, :283:{30,55}, :287:{13,17}, :288:{13,17,48}
  wire         scaled_36 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[26]
      ? scaled_4 | p0_sub_scale[1]
      : scaled_4 & ~(p0_sub_scale[1]);	// vector_unit.k:279:9, :283:{30,55}, :287:{13,17}, :288:{13,17,48}
  wire         scaled_37 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[25]
      ? scaled_5 | p0_sub_scale[1]
      : scaled_5 & ~(p0_sub_scale[1]);	// vector_unit.k:279:9, :283:{30,55}, :287:{13,17}, :288:{13,17,48}
  wire         scaled_38 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[24]
      ? scaled_6 | p0_sub_scale[1]
      : scaled_6 & ~(p0_sub_scale[1]);	// vector_unit.k:279:9, :283:{30,55}, :287:{13,17}, :288:{13,17,48}
  wire         scaled_39 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[23]
      ? scaled_7 | p0_sub_scale[1]
      : scaled_7 & ~(p0_sub_scale[1]);	// vector_unit.k:279:9, :283:{30,55}, :287:{13,17}, :288:{13,17,48}
  wire         scaled_40 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[22]
      ? scaled_8 | p0_sub_scale[1]
      : scaled_8 & ~(p0_sub_scale[1]);	// vector_unit.k:279:9, :283:{30,55}, :287:{13,17}, :288:{13,17,48}
  wire         scaled_41 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[21]
      ? scaled_9 | p0_sub_scale[1]
      : scaled_9 & ~(p0_sub_scale[1]);	// vector_unit.k:279:9, :283:{30,55}, :287:{13,17}, :288:{13,17,48}
  wire         scaled_42 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[20]
      ? scaled_10 | p0_sub_scale[1]
      : scaled_10 & ~(p0_sub_scale[1]);	// vector_unit.k:279:9, :283:{30,55}, :287:{13,17}, :288:{13,17,48}
  wire         scaled_43 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[19]
      ? scaled_11 | p0_sub_scale[1]
      : scaled_11 & ~(p0_sub_scale[1]);	// vector_unit.k:279:9, :283:{30,55}, :287:{13,17}, :288:{13,17,48}
  wire         scaled_44 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[18]
      ? scaled_12 | p0_sub_scale[1]
      : scaled_12 & ~(p0_sub_scale[1]);	// vector_unit.k:279:9, :283:{30,55}, :287:{13,17}, :288:{13,17,48}
  wire         scaled_45 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[17]
      ? scaled_13 | p0_sub_scale[1]
      : scaled_13 & ~(p0_sub_scale[1]);	// vector_unit.k:279:9, :283:{30,55}, :287:{13,17}, :288:{13,17,48}
  wire         scaled_46 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[16]
      ? scaled_14 | p0_sub_scale[1]
      : scaled_14 & ~(p0_sub_scale[1]);	// vector_unit.k:279:9, :283:{30,55}, :287:{13,17}, :288:{13,17,48}
  wire         scaled_47 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[15]
      ? scaled_15 | p0_sub_scale[1]
      : scaled_15 & ~(p0_sub_scale[1]);	// vector_unit.k:279:9, :283:{30,55}, :287:{13,17}, :288:{13,17,48}
  wire         scaled_48 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[14]
      ? scaled_16 | p0_sub_scale[1]
      : scaled_16 & ~(p0_sub_scale[1]);	// vector_unit.k:279:9, :283:{30,55}, :287:{13,17}, :288:{13,17,48}
  wire         scaled_49 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[13]
      ? scaled_17 | p0_sub_scale[1]
      : scaled_17 & ~(p0_sub_scale[1]);	// vector_unit.k:279:9, :283:{30,55}, :287:{13,17}, :288:{13,17,48}
  wire         scaled_50 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[12]
      ? scaled_18 | p0_sub_scale[1]
      : scaled_18 & ~(p0_sub_scale[1]);	// vector_unit.k:279:9, :283:{30,55}, :287:{13,17}, :288:{13,17,48}
  wire         scaled_51 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[11]
      ? scaled_19 | p0_sub_scale[1]
      : scaled_19 & ~(p0_sub_scale[1]);	// vector_unit.k:279:9, :283:{30,55}, :287:{13,17}, :288:{13,17,48}
  wire         scaled_52 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[10]
      ? scaled_20 | p0_sub_scale[1]
      : scaled_20 & ~(p0_sub_scale[1]);	// vector_unit.k:279:9, :283:{30,55}, :287:{13,17}, :288:{13,17,48}
  wire         scaled_53 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[9]
      ? scaled_21 | p0_sub_scale[1]
      : scaled_21 & ~(p0_sub_scale[1]);	// vector_unit.k:279:9, :283:{30,55}, :287:{13,17}, :288:{13,17,48}
  wire         scaled_54 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[8]
      ? scaled_22 | p0_sub_scale[1]
      : scaled_22 & ~(p0_sub_scale[1]);	// vector_unit.k:279:9, :283:{30,55}, :287:{13,17}, :288:{13,17,48}
  wire         scaled_55 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[7]
      ? scaled_23 | p0_sub_scale[1]
      : scaled_23 & ~(p0_sub_scale[1]);	// vector_unit.k:279:9, :283:{30,55}, :287:{13,17}, :288:{13,17,48}
  wire         scaled_56 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[6]
      ? scaled_24 | p0_sub_scale[1]
      : scaled_24 & ~(p0_sub_scale[1]);	// vector_unit.k:279:9, :283:{30,55}, :287:{13,17}, :288:{13,17,48}
  wire         scaled_57 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[5]
      ? scaled_25 | p0_sub_scale[1]
      : scaled_25 & ~(p0_sub_scale[1]);	// vector_unit.k:279:9, :283:{30,55}, :287:{13,17}, :288:{13,17,48}
  wire         scaled_58 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[4]
      ? scaled_26 | p0_sub_scale[1]
      : scaled_26 & ~(p0_sub_scale[1]);	// vector_unit.k:279:9, :283:{30,55}, :287:{13,17}, :288:{13,17,48}
  wire         scaled_59 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[3]
      ? scaled_27 | p0_sub_scale[1]
      : scaled_27 & ~(p0_sub_scale[1]);	// vector_unit.k:279:9, :283:{30,55}, :287:{13,17}, :288:{13,17,48}
  wire         scaled_60 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[2]
      ? scaled_28 | p0_sub_scale[1]
      : scaled_28 & ~(p0_sub_scale[1]);	// vector_unit.k:279:9, :283:{30,55}, :287:{13,17}, :288:{13,17,48}
  wire         scaled_61 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[1]
      ? scaled_29 | p0_sub_scale[1]
      : scaled_29 & ~(p0_sub_scale[1]);	// vector_unit.k:279:9, :283:{30,55}, :287:{13,17}, :288:{13,17,48}
  wire         scaled_62 =
    _scaled_plus_cast_lt_int32_gt_a_shl_2_[0]
      ? scaled_30 | p0_sub_scale[1]
      : scaled_30 & ~(p0_sub_scale[1]);	// vector_unit.k:279:9, :283:{30,55}, :287:{13,17}, :288:{13,17,48}
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
         scaled_62} + {{5{p0_accum[23]}}, p0_accum, 3'h0});	// vector_unit.k:279:9, :286:57, :287:58, :288:{13,17,58}, :289:{48,57,58}, :290:58
  wire         scaled_63 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[31]
      ? scaled_31 | p0_sub_scale[2]
      : scaled_31 & ~(p0_sub_scale[2]);	// vector_unit.k:279:9, :283:{30,55}, :288:{13,17}, :289:{13,17,48}
  wire         scaled_64 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[30]
      ? scaled_32 | p0_sub_scale[2]
      : scaled_32 & ~(p0_sub_scale[2]);	// vector_unit.k:279:9, :283:{30,55}, :288:{13,17}, :289:{13,17,48}
  wire         scaled_65 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[29]
      ? scaled_33 | p0_sub_scale[2]
      : scaled_33 & ~(p0_sub_scale[2]);	// vector_unit.k:279:9, :283:{30,55}, :288:{13,17}, :289:{13,17,48}
  wire         scaled_66 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[28]
      ? scaled_34 | p0_sub_scale[2]
      : scaled_34 & ~(p0_sub_scale[2]);	// vector_unit.k:279:9, :283:{30,55}, :288:{13,17}, :289:{13,17,48}
  wire         scaled_67 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[27]
      ? scaled_35 | p0_sub_scale[2]
      : scaled_35 & ~(p0_sub_scale[2]);	// vector_unit.k:279:9, :283:{30,55}, :288:{13,17}, :289:{13,17,48}
  wire         scaled_68 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[26]
      ? scaled_36 | p0_sub_scale[2]
      : scaled_36 & ~(p0_sub_scale[2]);	// vector_unit.k:279:9, :283:{30,55}, :288:{13,17}, :289:{13,17,48}
  wire         scaled_69 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[25]
      ? scaled_37 | p0_sub_scale[2]
      : scaled_37 & ~(p0_sub_scale[2]);	// vector_unit.k:279:9, :283:{30,55}, :288:{13,17}, :289:{13,17,48}
  wire         scaled_70 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[24]
      ? scaled_38 | p0_sub_scale[2]
      : scaled_38 & ~(p0_sub_scale[2]);	// vector_unit.k:279:9, :283:{30,55}, :288:{13,17}, :289:{13,17,48}
  wire         scaled_71 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[23]
      ? scaled_39 | p0_sub_scale[2]
      : scaled_39 & ~(p0_sub_scale[2]);	// vector_unit.k:279:9, :283:{30,55}, :288:{13,17}, :289:{13,17,48}
  wire         scaled_72 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[22]
      ? scaled_40 | p0_sub_scale[2]
      : scaled_40 & ~(p0_sub_scale[2]);	// vector_unit.k:279:9, :283:{30,55}, :288:{13,17}, :289:{13,17,48}
  wire         scaled_73 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[21]
      ? scaled_41 | p0_sub_scale[2]
      : scaled_41 & ~(p0_sub_scale[2]);	// vector_unit.k:279:9, :283:{30,55}, :288:{13,17}, :289:{13,17,48}
  wire         scaled_74 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[20]
      ? scaled_42 | p0_sub_scale[2]
      : scaled_42 & ~(p0_sub_scale[2]);	// vector_unit.k:279:9, :283:{30,55}, :288:{13,17}, :289:{13,17,48}
  wire         scaled_75 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[19]
      ? scaled_43 | p0_sub_scale[2]
      : scaled_43 & ~(p0_sub_scale[2]);	// vector_unit.k:279:9, :283:{30,55}, :288:{13,17}, :289:{13,17,48}
  wire         scaled_76 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[18]
      ? scaled_44 | p0_sub_scale[2]
      : scaled_44 & ~(p0_sub_scale[2]);	// vector_unit.k:279:9, :283:{30,55}, :288:{13,17}, :289:{13,17,48}
  wire         scaled_77 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[17]
      ? scaled_45 | p0_sub_scale[2]
      : scaled_45 & ~(p0_sub_scale[2]);	// vector_unit.k:279:9, :283:{30,55}, :288:{13,17}, :289:{13,17,48}
  wire         scaled_78 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[16]
      ? scaled_46 | p0_sub_scale[2]
      : scaled_46 & ~(p0_sub_scale[2]);	// vector_unit.k:279:9, :283:{30,55}, :288:{13,17}, :289:{13,17,48}
  wire         scaled_79 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[15]
      ? scaled_47 | p0_sub_scale[2]
      : scaled_47 & ~(p0_sub_scale[2]);	// vector_unit.k:279:9, :283:{30,55}, :288:{13,17}, :289:{13,17,48}
  wire         scaled_80 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[14]
      ? scaled_48 | p0_sub_scale[2]
      : scaled_48 & ~(p0_sub_scale[2]);	// vector_unit.k:279:9, :283:{30,55}, :288:{13,17}, :289:{13,17,48}
  wire         scaled_81 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[13]
      ? scaled_49 | p0_sub_scale[2]
      : scaled_49 & ~(p0_sub_scale[2]);	// vector_unit.k:279:9, :283:{30,55}, :288:{13,17}, :289:{13,17,48}
  wire         scaled_82 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[12]
      ? scaled_50 | p0_sub_scale[2]
      : scaled_50 & ~(p0_sub_scale[2]);	// vector_unit.k:279:9, :283:{30,55}, :288:{13,17}, :289:{13,17,48}
  wire         scaled_83 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[11]
      ? scaled_51 | p0_sub_scale[2]
      : scaled_51 & ~(p0_sub_scale[2]);	// vector_unit.k:279:9, :283:{30,55}, :288:{13,17}, :289:{13,17,48}
  wire         scaled_84 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[10]
      ? scaled_52 | p0_sub_scale[2]
      : scaled_52 & ~(p0_sub_scale[2]);	// vector_unit.k:279:9, :283:{30,55}, :288:{13,17}, :289:{13,17,48}
  wire         scaled_85 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[9]
      ? scaled_53 | p0_sub_scale[2]
      : scaled_53 & ~(p0_sub_scale[2]);	// vector_unit.k:279:9, :283:{30,55}, :288:{13,17}, :289:{13,17,48}
  wire         scaled_86 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[8]
      ? scaled_54 | p0_sub_scale[2]
      : scaled_54 & ~(p0_sub_scale[2]);	// vector_unit.k:279:9, :283:{30,55}, :288:{13,17}, :289:{13,17,48}
  wire         scaled_87 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[7]
      ? scaled_55 | p0_sub_scale[2]
      : scaled_55 & ~(p0_sub_scale[2]);	// vector_unit.k:279:9, :283:{30,55}, :288:{13,17}, :289:{13,17,48}
  wire         scaled_88 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[6]
      ? scaled_56 | p0_sub_scale[2]
      : scaled_56 & ~(p0_sub_scale[2]);	// vector_unit.k:279:9, :283:{30,55}, :288:{13,17}, :289:{13,17,48}
  wire         scaled_89 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[5]
      ? scaled_57 | p0_sub_scale[2]
      : scaled_57 & ~(p0_sub_scale[2]);	// vector_unit.k:279:9, :283:{30,55}, :288:{13,17}, :289:{13,17,48}
  wire         scaled_90 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[4]
      ? scaled_58 | p0_sub_scale[2]
      : scaled_58 & ~(p0_sub_scale[2]);	// vector_unit.k:279:9, :283:{30,55}, :288:{13,17}, :289:{13,17,48}
  wire         scaled_91 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[3]
      ? scaled_59 | p0_sub_scale[2]
      : scaled_59 & ~(p0_sub_scale[2]);	// vector_unit.k:279:9, :283:{30,55}, :288:{13,17}, :289:{13,17,48}
  wire         scaled_92 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[2]
      ? scaled_60 | p0_sub_scale[2]
      : scaled_60 & ~(p0_sub_scale[2]);	// vector_unit.k:279:9, :283:{30,55}, :288:{13,17}, :289:{13,17,48}
  wire         scaled_93 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[1]
      ? scaled_61 | p0_sub_scale[2]
      : scaled_61 & ~(p0_sub_scale[2]);	// vector_unit.k:279:9, :283:{30,55}, :288:{13,17}, :289:{13,17,48}
  wire         scaled_94 =
    _scaled_plus_cast_lt_int32_gt_a_shl_3_[0]
      ? scaled_62 | p0_sub_scale[2]
      : scaled_62 & ~(p0_sub_scale[2]);	// vector_unit.k:279:9, :283:{30,55}, :288:{13,17}, :289:{13,17,48}
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
         scaled_94} + {{4{p0_accum[23]}}, p0_accum, 4'h0});	// vector_unit.k:279:9, :286:57, :287:58, :288:58, :289:{13,17,58}, :290:{48,57,58}
  wire         scaled_95 =
    _scaled_plus_cast_lt_int32_gt_a_shl_4_[31]
      ? scaled_63 | p0_sub_scale[3]
      : scaled_63 & ~(p0_sub_scale[3]);	// vector_unit.k:279:9, :283:{30,55}, :289:{13,17}, :290:{13,17,48}
  wire         scaled_96 =
    _scaled_plus_cast_lt_int32_gt_a_shl_4_[30]
      ? scaled_64 | p0_sub_scale[3]
      : scaled_64 & ~(p0_sub_scale[3]);	// vector_unit.k:279:9, :283:{30,55}, :289:{13,17}, :290:{13,17,48}
  wire         scaled_97 =
    _scaled_plus_cast_lt_int32_gt_a_shl_4_[29]
      ? scaled_65 | p0_sub_scale[3]
      : scaled_65 & ~(p0_sub_scale[3]);	// vector_unit.k:279:9, :283:{30,55}, :289:{13,17}, :290:{13,17,48}
  wire         scaled_98 =
    _scaled_plus_cast_lt_int32_gt_a_shl_4_[28]
      ? scaled_66 | p0_sub_scale[3]
      : scaled_66 & ~(p0_sub_scale[3]);	// vector_unit.k:279:9, :283:{30,55}, :289:{13,17}, :290:{13,17,48}
  wire         scaled_99 =
    _scaled_plus_cast_lt_int32_gt_a_shl_4_[27]
      ? scaled_67 | p0_sub_scale[3]
      : scaled_67 & ~(p0_sub_scale[3]);	// vector_unit.k:279:9, :283:{30,55}, :289:{13,17}, :290:{13,17,48}
  wire         scaled_100 =
    _scaled_plus_cast_lt_int32_gt_a_shl_4_[26]
      ? scaled_68 | p0_sub_scale[3]
      : scaled_68 & ~(p0_sub_scale[3]);	// vector_unit.k:279:9, :283:{30,55}, :289:{13,17}, :290:{13,17,48}
  wire         scaled_101 =
    _scaled_plus_cast_lt_int32_gt_a_shl_4_[25]
      ? scaled_69 | p0_sub_scale[3]
      : scaled_69 & ~(p0_sub_scale[3]);	// vector_unit.k:279:9, :283:{30,55}, :289:{13,17}, :290:{13,17,48}
  wire         scaled_102 =
    _scaled_plus_cast_lt_int32_gt_a_shl_4_[24]
      ? scaled_70 | p0_sub_scale[3]
      : scaled_70 & ~(p0_sub_scale[3]);	// vector_unit.k:279:9, :283:{30,55}, :289:{13,17}, :290:{13,17,48}
  wire         scaled_103 =
    _scaled_plus_cast_lt_int32_gt_a_shl_4_[23]
      ? scaled_71 | p0_sub_scale[3]
      : scaled_71 & ~(p0_sub_scale[3]);	// vector_unit.k:279:9, :283:{30,55}, :289:{13,17}, :290:{13,17,48}
  wire         scaled_104 =
    _scaled_plus_cast_lt_int32_gt_a_shl_4_[22]
      ? scaled_72 | p0_sub_scale[3]
      : scaled_72 & ~(p0_sub_scale[3]);	// vector_unit.k:279:9, :283:{30,55}, :289:{13,17}, :290:{13,17,48}
  wire         scaled_105 =
    _scaled_plus_cast_lt_int32_gt_a_shl_4_[21]
      ? scaled_73 | p0_sub_scale[3]
      : scaled_73 & ~(p0_sub_scale[3]);	// vector_unit.k:279:9, :283:{30,55}, :289:{13,17}, :290:{13,17,48}
  wire         scaled_106 =
    _scaled_plus_cast_lt_int32_gt_a_shl_4_[20]
      ? scaled_74 | p0_sub_scale[3]
      : scaled_74 & ~(p0_sub_scale[3]);	// vector_unit.k:279:9, :283:{30,55}, :289:{13,17}, :290:{13,17,48}
  wire         scaled_107 =
    _scaled_plus_cast_lt_int32_gt_a_shl_4_[19]
      ? scaled_75 | p0_sub_scale[3]
      : scaled_75 & ~(p0_sub_scale[3]);	// vector_unit.k:279:9, :283:{30,55}, :289:{13,17}, :290:{13,17,48}
  wire         scaled_108 =
    _scaled_plus_cast_lt_int32_gt_a_shl_4_[18]
      ? scaled_76 | p0_sub_scale[3]
      : scaled_76 & ~(p0_sub_scale[3]);	// vector_unit.k:279:9, :283:{30,55}, :289:{13,17}, :290:{13,17,48}
  wire         scaled_109 =
    _scaled_plus_cast_lt_int32_gt_a_shl_4_[17]
      ? scaled_77 | p0_sub_scale[3]
      : scaled_77 & ~(p0_sub_scale[3]);	// vector_unit.k:279:9, :283:{30,55}, :289:{13,17}, :290:{13,17,48}
  wire         scaled_110 =
    _scaled_plus_cast_lt_int32_gt_a_shl_4_[16]
      ? scaled_78 | p0_sub_scale[3]
      : scaled_78 & ~(p0_sub_scale[3]);	// vector_unit.k:279:9, :283:{30,55}, :289:{13,17}, :290:{13,17,48}
  wire         scaled_111 =
    _scaled_plus_cast_lt_int32_gt_a_shl_4_[15]
      ? scaled_79 | p0_sub_scale[3]
      : scaled_79 & ~(p0_sub_scale[3]);	// vector_unit.k:279:9, :283:{30,55}, :289:{13,17}, :290:{13,17,48}
  wire         scaled_112 =
    _scaled_plus_cast_lt_int32_gt_a_shl_4_[14]
      ? scaled_80 | p0_sub_scale[3]
      : scaled_80 & ~(p0_sub_scale[3]);	// vector_unit.k:279:9, :283:{30,55}, :289:{13,17}, :290:{13,17,48}
  wire         scaled_113 =
    _scaled_plus_cast_lt_int32_gt_a_shl_4_[13]
      ? scaled_81 | p0_sub_scale[3]
      : scaled_81 & ~(p0_sub_scale[3]);	// vector_unit.k:279:9, :283:{30,55}, :289:{13,17}, :290:{13,17,48}
  wire         scaled_114 =
    _scaled_plus_cast_lt_int32_gt_a_shl_4_[12]
      ? scaled_82 | p0_sub_scale[3]
      : scaled_82 & ~(p0_sub_scale[3]);	// vector_unit.k:279:9, :283:{30,55}, :289:{13,17}, :290:{13,17,48}
  wire         scaled_115 =
    _scaled_plus_cast_lt_int32_gt_a_shl_4_[11]
      ? scaled_83 | p0_sub_scale[3]
      : scaled_83 & ~(p0_sub_scale[3]);	// vector_unit.k:279:9, :283:{30,55}, :289:{13,17}, :290:{13,17,48}
  wire         scaled_116 =
    _scaled_plus_cast_lt_int32_gt_a_shl_4_[10]
      ? scaled_84 | p0_sub_scale[3]
      : scaled_84 & ~(p0_sub_scale[3]);	// vector_unit.k:279:9, :283:{30,55}, :289:{13,17}, :290:{13,17,48}
  wire         scaled_117 =
    _scaled_plus_cast_lt_int32_gt_a_shl_4_[9]
      ? scaled_85 | p0_sub_scale[3]
      : scaled_85 & ~(p0_sub_scale[3]);	// vector_unit.k:279:9, :283:{30,55}, :289:{13,17}, :290:{13,17,48}
  wire         scaled_118 =
    _scaled_plus_cast_lt_int32_gt_a_shl_4_[8]
      ? scaled_86 | p0_sub_scale[3]
      : scaled_86 & ~(p0_sub_scale[3]);	// vector_unit.k:279:9, :283:{30,55}, :289:{13,17}, :290:{13,17,48}
  wire         scaled_119 =
    _scaled_plus_cast_lt_int32_gt_a_shl_4_[7]
      ? scaled_87 | p0_sub_scale[3]
      : scaled_87 & ~(p0_sub_scale[3]);	// vector_unit.k:279:9, :283:{30,55}, :289:{13,17}, :290:{13,17,48}
  wire         scaled_120 =
    _scaled_plus_cast_lt_int32_gt_a_shl_4_[6]
      ? scaled_88 | p0_sub_scale[3]
      : scaled_88 & ~(p0_sub_scale[3]);	// vector_unit.k:279:9, :283:{30,55}, :289:{13,17}, :290:{13,17,48}
  wire         scaled_121 =
    _scaled_plus_cast_lt_int32_gt_a_shl_4_[5]
      ? scaled_89 | p0_sub_scale[3]
      : scaled_89 & ~(p0_sub_scale[3]);	// vector_unit.k:279:9, :283:{30,55}, :289:{13,17}, :290:{13,17,48}
  wire         scaled_122 =
    _scaled_plus_cast_lt_int32_gt_a_shl_4_[4]
      ? scaled_90 | p0_sub_scale[3]
      : scaled_90 & ~(p0_sub_scale[3]);	// vector_unit.k:279:9, :283:{30,55}, :289:{13,17}, :290:{13,17,48}
  wire         scaled_123 =
    _scaled_plus_cast_lt_int32_gt_a_shl_4_[3]
      ? scaled_91 | p0_sub_scale[3]
      : scaled_91 & ~(p0_sub_scale[3]);	// vector_unit.k:279:9, :283:{30,55}, :289:{13,17}, :290:{13,17,48}
  wire         scaled_124 =
    _scaled_plus_cast_lt_int32_gt_a_shl_4_[2]
      ? scaled_92 | p0_sub_scale[3]
      : scaled_92 & ~(p0_sub_scale[3]);	// vector_unit.k:279:9, :283:{30,55}, :289:{13,17}, :290:{13,17,48}
  wire         scaled_125 =
    _scaled_plus_cast_lt_int32_gt_a_shl_4_[1]
      ? scaled_93 | p0_sub_scale[3]
      : scaled_93 & ~(p0_sub_scale[3]);	// vector_unit.k:279:9, :283:{30,55}, :289:{13,17}, :290:{13,17,48}
  wire         scaled_126 =
    _scaled_plus_cast_lt_int32_gt_a_shl_4_[0]
      ? scaled_94 | p0_sub_scale[3]
      : scaled_94 & ~(p0_sub_scale[3]);	// vector_unit.k:279:9, :283:{30,55}, :289:{13,17}, :290:{13,17,48}
  wire  [31:0] scaled_127 =
    {scaled_95,
     scaled_96,
     scaled_97,
     scaled_98,
     scaled_99,
     scaled_100,
     scaled_101,
     scaled_102,
     scaled_103,
     scaled_104,
     scaled_105,
     scaled_106,
     scaled_107,
     scaled_108,
     scaled_109,
     scaled_110,
     scaled_111,
     scaled_112,
     scaled_113,
     scaled_114,
     scaled_115,
     scaled_116,
     scaled_117,
     scaled_118,
     scaled_119,
     scaled_120,
     scaled_121,
     scaled_122,
     scaled_123,
     scaled_124,
     scaled_125,
     scaled_126};	// vector_unit.k:290:{13,17}
  wire         _scaled_lt_0_ = $signed(scaled_127) < 32'sh0;	// vector_unit.k:290:{13,17}, :295:17
  wire  [31:0] CastSource = 32'(32'h0 - scaled_127);	// vector_unit.k:290:{13,17}, :298:36
  wire         mag =
    CastSource[31] ? scaled_95 | _scaled_lt_0_ : scaled_95 & ~_scaled_lt_0_;	// vector_unit.k:290:{13,17}, :295:{13,17}, :298:{23,36}
  wire         mag_0 =
    CastSource[30] ? scaled_96 | _scaled_lt_0_ : scaled_96 & ~_scaled_lt_0_;	// vector_unit.k:290:{13,17}, :295:{13,17}, :298:{23,36}
  wire         mag_1 =
    CastSource[29] ? scaled_97 | _scaled_lt_0_ : scaled_97 & ~_scaled_lt_0_;	// vector_unit.k:290:{13,17}, :295:{13,17}, :298:{23,36}
  wire         mag_2 =
    CastSource[28] ? scaled_98 | _scaled_lt_0_ : scaled_98 & ~_scaled_lt_0_;	// vector_unit.k:290:{13,17}, :295:{13,17}, :298:{23,36}
  wire         mag_3 =
    CastSource[27] ? scaled_99 | _scaled_lt_0_ : scaled_99 & ~_scaled_lt_0_;	// vector_unit.k:290:{13,17}, :295:{13,17}, :298:{23,36}
  wire         mag_4 =
    CastSource[26] ? scaled_100 | _scaled_lt_0_ : scaled_100 & ~_scaled_lt_0_;	// vector_unit.k:290:{13,17}, :295:{13,17}, :298:{23,36}
  wire         mag_5 =
    CastSource[25] ? scaled_101 | _scaled_lt_0_ : scaled_101 & ~_scaled_lt_0_;	// vector_unit.k:290:{13,17}, :295:{13,17}, :298:{23,36}
  wire         mag_6 =
    CastSource[24] ? scaled_102 | _scaled_lt_0_ : scaled_102 & ~_scaled_lt_0_;	// vector_unit.k:290:{13,17}, :295:{13,17}, :298:{23,36}
  wire         mag_7 =
    CastSource[23] ? scaled_103 | _scaled_lt_0_ : scaled_103 & ~_scaled_lt_0_;	// vector_unit.k:290:{13,17}, :295:{13,17}, :298:{23,36}
  wire         mag_8 =
    CastSource[22] ? scaled_104 | _scaled_lt_0_ : scaled_104 & ~_scaled_lt_0_;	// vector_unit.k:290:{13,17}, :295:{13,17}, :298:{23,36}
  wire         mag_9 =
    CastSource[21] ? scaled_105 | _scaled_lt_0_ : scaled_105 & ~_scaled_lt_0_;	// vector_unit.k:290:{13,17}, :295:{13,17}, :298:{23,36}
  wire         mag_10 =
    CastSource[20] ? scaled_106 | _scaled_lt_0_ : scaled_106 & ~_scaled_lt_0_;	// vector_unit.k:290:{13,17}, :295:{13,17}, :298:{23,36}
  wire         mag_11 =
    CastSource[19] ? scaled_107 | _scaled_lt_0_ : scaled_107 & ~_scaled_lt_0_;	// vector_unit.k:290:{13,17}, :295:{13,17}, :298:{23,36}
  wire         mag_12 =
    CastSource[18] ? scaled_108 | _scaled_lt_0_ : scaled_108 & ~_scaled_lt_0_;	// vector_unit.k:290:{13,17}, :295:{13,17}, :298:{23,36}
  wire         mag_13 =
    CastSource[17] ? scaled_109 | _scaled_lt_0_ : scaled_109 & ~_scaled_lt_0_;	// vector_unit.k:290:{13,17}, :295:{13,17}, :298:{23,36}
  wire         mag_14 =
    CastSource[16] ? scaled_110 | _scaled_lt_0_ : scaled_110 & ~_scaled_lt_0_;	// vector_unit.k:290:{13,17}, :295:{13,17}, :298:{23,36}
  wire         mag_15 =
    CastSource[15] ? scaled_111 | _scaled_lt_0_ : scaled_111 & ~_scaled_lt_0_;	// vector_unit.k:290:{13,17}, :295:{13,17}, :298:{23,36}
  wire         mag_16 =
    CastSource[14] ? scaled_112 | _scaled_lt_0_ : scaled_112 & ~_scaled_lt_0_;	// vector_unit.k:290:{13,17}, :295:{13,17}, :298:{23,36}
  wire         mag_17 =
    CastSource[13] ? scaled_113 | _scaled_lt_0_ : scaled_113 & ~_scaled_lt_0_;	// vector_unit.k:290:{13,17}, :295:{13,17}, :298:{23,36}
  wire         mag_18 =
    CastSource[12] ? scaled_114 | _scaled_lt_0_ : scaled_114 & ~_scaled_lt_0_;	// vector_unit.k:290:{13,17}, :295:{13,17}, :298:{23,36}
  wire         mag_19 =
    CastSource[11] ? scaled_115 | _scaled_lt_0_ : scaled_115 & ~_scaled_lt_0_;	// vector_unit.k:290:{13,17}, :295:{13,17}, :298:{23,36}
  wire         mag_20 =
    CastSource[10] ? scaled_116 | _scaled_lt_0_ : scaled_116 & ~_scaled_lt_0_;	// vector_unit.k:290:{13,17}, :295:{13,17}, :298:{23,36}
  wire         mag_21 =
    CastSource[9] ? scaled_117 | _scaled_lt_0_ : scaled_117 & ~_scaled_lt_0_;	// vector_unit.k:290:{13,17}, :295:{13,17}, :298:{23,36}
  wire         mag_22 =
    CastSource[8] ? scaled_118 | _scaled_lt_0_ : scaled_118 & ~_scaled_lt_0_;	// vector_unit.k:290:{13,17}, :295:{13,17}, :298:{23,36}
  wire         mag_23 =
    CastSource[7] ? scaled_119 | _scaled_lt_0_ : scaled_119 & ~_scaled_lt_0_;	// vector_unit.k:290:{13,17}, :295:{13,17}, :298:{23,36}
  wire         mag_24 =
    CastSource[6] ? scaled_120 | _scaled_lt_0_ : scaled_120 & ~_scaled_lt_0_;	// vector_unit.k:290:{13,17}, :295:{13,17}, :298:{23,36}
  wire         mag_25 =
    CastSource[5] ? scaled_121 | _scaled_lt_0_ : scaled_121 & ~_scaled_lt_0_;	// vector_unit.k:290:{13,17}, :295:{13,17}, :298:{23,36}
  wire         mag_26 =
    CastSource[4] ? scaled_122 | _scaled_lt_0_ : scaled_122 & ~_scaled_lt_0_;	// vector_unit.k:290:{13,17}, :295:{13,17}, :298:{23,36}
  wire         mag_27 =
    CastSource[3] ? scaled_123 | _scaled_lt_0_ : scaled_123 & ~_scaled_lt_0_;	// vector_unit.k:290:{13,17}, :295:{13,17}, :298:{23,36}
  wire         mag_28 =
    CastSource[2] ? scaled_124 | _scaled_lt_0_ : scaled_124 & ~_scaled_lt_0_;	// vector_unit.k:290:{13,17}, :295:{13,17}, :298:{23,36}
  wire         mag_29 =
    CastSource[1] ? scaled_125 | _scaled_lt_0_ : scaled_125 & ~_scaled_lt_0_;	// vector_unit.k:290:{13,17}, :295:{13,17}, :298:{23,36}
  wire         mag_30 =
    CastSource[0] ? scaled_126 | _scaled_lt_0_ : scaled_126 & ~_scaled_lt_0_;	// vector_unit.k:290:{13,17}, :295:{13,17}, :298:{23,36}
  wire  [31:0] mag_31 =
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
     mag_30};	// vector_unit.k:295:13, :298:23
  wire  [15:0] _GEN_2 =
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
     mag_14};	// vector_unit.k:295:13, :298:23, :311:21
  wire         tmp = mag ? mag_15 | (|_GEN_2) : mag_15 & ~(|_GEN_2);	// vector_unit.k:295:13, :298:23, :311:{17,21,48,54}
  wire         tmp_0 = mag_0 ? mag_16 | (|_GEN_2) : mag_16 & ~(|_GEN_2);	// vector_unit.k:295:13, :298:23, :311:{17,21,48,54}
  wire         tmp_1 = mag_1 ? mag_17 | (|_GEN_2) : mag_17 & ~(|_GEN_2);	// vector_unit.k:295:13, :298:23, :311:{17,21,48,54}
  wire         tmp_2 = mag_2 ? mag_18 | (|_GEN_2) : mag_18 & ~(|_GEN_2);	// vector_unit.k:295:13, :298:23, :311:{17,21,48,54}
  wire         tmp_3 = mag_3 ? mag_19 | (|_GEN_2) : mag_19 & ~(|_GEN_2);	// vector_unit.k:295:13, :298:23, :311:{17,21,48,54}
  wire         tmp_4 = mag_4 ? mag_20 | (|_GEN_2) : mag_20 & ~(|_GEN_2);	// vector_unit.k:295:13, :298:23, :311:{17,21,48,54}
  wire         tmp_5 = mag_5 ? mag_21 | (|_GEN_2) : mag_21 & ~(|_GEN_2);	// vector_unit.k:295:13, :298:23, :311:{17,21,48,54}
  wire         tmp_6 = mag_7 ? mag_23 | (|_GEN_2) : mag_23 & ~(|_GEN_2);	// vector_unit.k:295:13, :298:23, :311:{17,21,48,54}
  wire         tmp_7 = mag_8 ? mag_24 | (|_GEN_2) : mag_24 & ~(|_GEN_2);	// vector_unit.k:295:13, :298:23, :311:{17,21,48,54}
  wire         tmp_8 = mag_9 ? mag_25 | (|_GEN_2) : mag_25 & ~(|_GEN_2);	// vector_unit.k:295:13, :298:23, :311:{17,21,48,54}
  wire         tmp_9 = mag_10 ? mag_26 | (|_GEN_2) : mag_26 & ~(|_GEN_2);	// vector_unit.k:295:13, :298:23, :311:{17,21,48,54}
  wire         tmp_10 = mag_11 ? mag_27 | (|_GEN_2) : mag_27 & ~(|_GEN_2);	// vector_unit.k:295:13, :298:23, :311:{17,21,48,54}
  wire         tmp_11 = mag_12 ? mag_28 | (|_GEN_2) : mag_28 & ~(|_GEN_2);	// vector_unit.k:295:13, :298:23, :311:{17,21,48,54}
  wire         tmp_12 = mag_13 ? mag_29 | (|_GEN_2) : mag_29 & ~(|_GEN_2);	// vector_unit.k:295:13, :298:23, :311:{17,21,48,54}
  wire  [7:0]  _GEN_3 =
    {tmp,
     tmp_0,
     tmp_1,
     tmp_2,
     tmp_3,
     tmp_4,
     tmp_5,
     mag_6 ? mag_22 | (|_GEN_2) : mag_22 & ~(|_GEN_2)};	// vector_unit.k:295:13, :298:23, :311:{17,21,48,54}, :312:21
  wire         tmp_13 = tmp ? tmp_6 | (|_GEN_3) : tmp_6 & ~(|_GEN_3);	// vector_unit.k:311:{17,48,54}, :312:{17,21,48,54}
  wire         tmp_14 = tmp_0 ? tmp_7 | (|_GEN_3) : tmp_7 & ~(|_GEN_3);	// vector_unit.k:311:{17,48,54}, :312:{17,21,48,54}
  wire         tmp_15 = tmp_1 ? tmp_8 | (|_GEN_3) : tmp_8 & ~(|_GEN_3);	// vector_unit.k:311:{17,48,54}, :312:{17,21,48,54}
  wire         tmp_16 = tmp_3 ? tmp_10 | (|_GEN_3) : tmp_10 & ~(|_GEN_3);	// vector_unit.k:311:{17,48,54}, :312:{17,21,48,54}
  wire         tmp_17 = tmp_4 ? tmp_11 | (|_GEN_3) : tmp_11 & ~(|_GEN_3);	// vector_unit.k:311:{17,48,54}, :312:{17,21,48,54}
  wire         tmp_18 = tmp_5 ? tmp_12 | (|_GEN_3) : tmp_12 & ~(|_GEN_3);	// vector_unit.k:311:{17,48,54}, :312:{17,21,48,54}
  wire  [3:0]  _GEN_4 =
    {tmp_13, tmp_14, tmp_15, tmp_2 ? tmp_9 | (|_GEN_3) : tmp_9 & ~(|_GEN_3)};	// vector_unit.k:311:{17,48,54}, :312:{17,21,48,54}, :313:21
  wire         tmp_19 = tmp_13 ? tmp_16 | (|_GEN_4) : tmp_16 & ~(|_GEN_4);	// vector_unit.k:312:{17,48,54}, :313:{17,21,48,54}
  wire         tmp_20 = tmp_14 ? tmp_17 | (|_GEN_4) : tmp_17 & ~(|_GEN_4);	// vector_unit.k:312:{17,48,54}, :313:{17,21,48,54}
  wire         pos = tmp_19 | tmp_20;	// vector_unit.k:311:17, :312:{17,71}, :313:{17,48,54,71}, :314:{17,21,48,54,71}, :315:{17,21,54}
  wire         pos_0 =
    (tmp_15 ? tmp_18 | (|_GEN_4) : tmp_18 & ~(|_GEN_4)) & ~tmp_20 | tmp_19;	// vector_unit.k:311:17, :312:{17,48,54,71}, :313:{17,21,48,54,71}, :314:{17,21,48,54,71}, :315:{17,21,54}
  wire  [31:0] pos_1 = {27'h0, |_GEN_2, |_GEN_3, |_GEN_4, pos, pos_0};	// vector_unit.k:311:{17,21}, :312:{17,21,71}, :313:{17,21,71}, :314:{17,21,48,54,71}, :315:{17,21,54}
  wire  [7:0]  _127_plus_pos_ = 8'({3'h0, |_GEN_2, |_GEN_3, |_GEN_4, pos, pos_0} + 8'h7F);	// vector_unit.k:311:{17,21}, :312:{17,21,71}, :313:{17,21,71}, :314:{17,21,48,54,71}, :315:{17,21,54}, :317:34
  wire         _pos_gt_23_ = pos_1 > 32'h17;	// vector_unit.k:311:17, :312:{17,71}, :313:{17,71}, :314:{17,21,48,54,71}, :315:{17,21,54}, :321:21
  wire         _pos_lt_23_ = pos_1 < 32'h17;	// vector_unit.k:311:17, :312:{17,71}, :313:{17,71}, :314:{17,21,48,54,71}, :315:{17,21,54}, :325:26
  wire  [4:0]  _23_minus_pos_ = 5'(5'h17 - {|_GEN_2, |_GEN_3, |_GEN_4, pos, pos_0});	// vector_unit.k:311:{17,21}, :312:{17,21,71}, :313:{17,21,71}, :314:{17,21,48,54,71}, :315:{17,21,54}, :327:40
  wire  [31:0] _mag_shr_pos_minus_23_ =
    mag_31 >> 32'({27'h0, |_GEN_2, |_GEN_3, |_GEN_4, pos, pos_0} - 32'h17);	// vector_unit.k:295:13, :298:23, :311:{17,21}, :312:{17,21,71}, :313:{17,21,71}, :314:{17,21,48,54,71}, :315:{17,21,54}, :323:{31,38}
  wire         _GEN_5 = ~(_23_minus_pos_[4]) | ~(_23_minus_pos_[3]);	// vector_unit.k:327:40, :328:{21,25,60}, :329:{21,25,60}
  wire         _GEN_6 = _23_minus_pos_[4] ^ _23_minus_pos_[3];	// vector_unit.k:327:40, :328:{21,25,60}, :329:{21,25,60}
  wire         _GEN_7 = ~(_23_minus_pos_[4]) & _23_minus_pos_[3];	// vector_unit.k:327:40, :328:{21,25,60}, :329:{21,25,60}
  wire         _GEN_8 = ~(_23_minus_pos_[4]) & ~(_23_minus_pos_[3]);	// vector_unit.k:327:40, :328:{21,25,60}, :329:{21,25,60}
  wire         shifted =
    mag_16
      ? (mag_24 ? (mag_8 ? _GEN_5 : _GEN_6) : mag_8 ? ~(_23_minus_pos_[4]) : _GEN_7)
      : mag_24 ? (mag_8 | _23_minus_pos_[4]) & ~(_23_minus_pos_[3]) : mag_8 & _GEN_8;	// vector_unit.k:295:13, :298:23, :327:40, :328:{21,25,60}, :329:{21,25,60}
  wire         shifted_0 =
    mag_17
      ? (mag_25 ? (mag_9 ? _GEN_5 : _GEN_6) : mag_9 ? ~(_23_minus_pos_[4]) : _GEN_7)
      : mag_25 ? (mag_9 | _23_minus_pos_[4]) & ~(_23_minus_pos_[3]) : mag_9 & _GEN_8;	// vector_unit.k:295:13, :298:23, :327:40, :328:{21,25,60}, :329:{21,25,60}
  wire         shifted_1 =
    mag_18
      ? (mag_26 ? (mag_10 ? _GEN_5 : _GEN_6) : mag_10 ? ~(_23_minus_pos_[4]) : _GEN_7)
      : mag_26 ? (mag_10 | _23_minus_pos_[4]) & ~(_23_minus_pos_[3]) : mag_10 & _GEN_8;	// vector_unit.k:295:13, :298:23, :327:40, :328:{21,25,60}, :329:{21,25,60}
  wire         shifted_2 =
    mag_19
      ? (mag_27 ? (mag_11 ? _GEN_5 : _GEN_6) : mag_11 ? ~(_23_minus_pos_[4]) : _GEN_7)
      : mag_27 ? (mag_11 | _23_minus_pos_[4]) & ~(_23_minus_pos_[3]) : mag_11 & _GEN_8;	// vector_unit.k:295:13, :298:23, :327:40, :328:{21,25,60}, :329:{21,25,60}
  wire         shifted_3 =
    mag_20
      ? (mag_28 ? (mag_12 ? _GEN_5 : _GEN_6) : mag_12 ? ~(_23_minus_pos_[4]) : _GEN_7)
      : mag_28 ? (mag_12 | _23_minus_pos_[4]) & ~(_23_minus_pos_[3]) : mag_12 & _GEN_8;	// vector_unit.k:295:13, :298:23, :327:40, :328:{21,25,60}, :329:{21,25,60}
  wire         shifted_4 =
    mag_21
      ? (mag_29 ? (mag_13 ? _GEN_5 : _GEN_6) : mag_13 ? ~(_23_minus_pos_[4]) : _GEN_7)
      : mag_29 ? (mag_13 | _23_minus_pos_[4]) & ~(_23_minus_pos_[3]) : mag_13 & _GEN_8;	// vector_unit.k:295:13, :298:23, :327:40, :328:{21,25,60}, :329:{21,25,60}
  wire         shifted_5 =
    mag_22
      ? (mag_30 ? (mag_14 ? _GEN_5 : _GEN_6) : mag_14 ? ~(_23_minus_pos_[4]) : _GEN_7)
      : mag_30 ? (mag_14 | _23_minus_pos_[4]) & ~(_23_minus_pos_[3]) : mag_14 & _GEN_8;	// vector_unit.k:295:13, :298:23, :327:40, :328:{21,25,60}, :329:{21,25,60}
  wire         shifted_6 =
    mag_23 ? (mag_15 ? ~(_23_minus_pos_[4]) : _GEN_7) : mag_15 & _GEN_8;	// vector_unit.k:295:13, :298:23, :327:40, :328:{21,25,60}, :329:{21,25,60}
  wire         shifted_7 =
    mag_24 ? (mag_16 ? ~(_23_minus_pos_[4]) : _GEN_7) : mag_16 & _GEN_8;	// vector_unit.k:295:13, :298:23, :327:40, :328:{21,25,60}, :329:{21,25,60}
  wire         shifted_8 =
    mag_25 ? (mag_17 ? ~(_23_minus_pos_[4]) : _GEN_7) : mag_17 & _GEN_8;	// vector_unit.k:295:13, :298:23, :327:40, :328:{21,25,60}, :329:{21,25,60}
  wire         shifted_9 =
    mag_26 ? (mag_18 ? ~(_23_minus_pos_[4]) : _GEN_7) : mag_18 & _GEN_8;	// vector_unit.k:295:13, :298:23, :327:40, :328:{21,25,60}, :329:{21,25,60}
  wire         shifted_10 =
    mag_27 ? (mag_19 ? ~(_23_minus_pos_[4]) : _GEN_7) : mag_19 & _GEN_8;	// vector_unit.k:295:13, :298:23, :327:40, :328:{21,25,60}, :329:{21,25,60}
  wire         shifted_11 =
    mag_28 ? (mag_20 ? ~(_23_minus_pos_[4]) : _GEN_7) : mag_20 & _GEN_8;	// vector_unit.k:295:13, :298:23, :327:40, :328:{21,25,60}, :329:{21,25,60}
  wire         shifted_12 =
    mag_29 ? (mag_21 ? ~(_23_minus_pos_[4]) : _GEN_7) : mag_21 & _GEN_8;	// vector_unit.k:295:13, :298:23, :327:40, :328:{21,25,60}, :329:{21,25,60}
  wire         shifted_13 =
    mag_30 ? (mag_22 ? ~(_23_minus_pos_[4]) : _GEN_7) : mag_22 & _GEN_8;	// vector_unit.k:295:13, :298:23, :327:40, :328:{21,25,60}, :329:{21,25,60}
  wire         shifted_14 = mag_23 & _GEN_8;	// vector_unit.k:295:13, :298:23, :328:{21,25,60}, :329:{21,25,60}
  wire         _GEN_9 = _23_minus_pos_[2] | _23_minus_pos_[1];	// vector_unit.k:327:40, :330:{21,25,60}, :331:{21,25,60}
  wire         _GEN_10 = _23_minus_pos_[2] ^ ~(_23_minus_pos_[1]);	// vector_unit.k:327:40, :330:{21,25,60}, :331:{21,25,60}
  wire         _GEN_11 = _23_minus_pos_[2] & _23_minus_pos_[1];	// vector_unit.k:327:40, :330:{21,25,60}, :331:{21,25,60}
  wire         _GEN_12 = ~(_23_minus_pos_[2]) | ~(_23_minus_pos_[1]);	// vector_unit.k:327:40, :330:{21,25,60}, :331:{21,25,60}
  wire         _GEN_13 = _23_minus_pos_[2] ^ _23_minus_pos_[1];	// vector_unit.k:327:40, :330:{21,25,60}, :331:{21,25,60}
  wire         _GEN_14 = ~(_23_minus_pos_[2]) & _23_minus_pos_[1];	// vector_unit.k:327:40, :330:{21,25,60}, :331:{21,25,60}
  wire         _GEN_15 = ~(_23_minus_pos_[2]) & ~(_23_minus_pos_[1]);	// vector_unit.k:327:40, :330:{21,25,60}, :331:{21,25,60}
  wire         shifted_15 =
    shifted_5
      ? (shifted_1
           ? (shifted_3
                ? shifted | _GEN_9
                : shifted & ~(_23_minus_pos_[2]) | _23_minus_pos_[1])
           : shifted_3
               ? shifted & ~(_23_minus_pos_[1]) | _23_minus_pos_[2]
               : shifted ? _GEN_10 : _GEN_11)
      : shifted_1
          ? (shifted_3
               ? (shifted ? _GEN_12 : _GEN_13)
               : shifted ? ~(_23_minus_pos_[2]) : _GEN_14)
          : shifted_3
              ? (shifted | _23_minus_pos_[2]) & ~(_23_minus_pos_[1])
              : shifted & _GEN_15;	// vector_unit.k:327:40, :328:{21,25,60}, :329:{21,25,60}, :330:{21,25,60}, :331:{21,25,60}
  wire         shifted_16 =
    shifted_6
      ? (shifted_2
           ? (shifted_4
                ? shifted_0 | _GEN_9
                : shifted_0 & ~(_23_minus_pos_[2]) | _23_minus_pos_[1])
           : shifted_4
               ? shifted_0 & ~(_23_minus_pos_[1]) | _23_minus_pos_[2]
               : shifted_0 ? _GEN_10 : _GEN_11)
      : shifted_2
          ? (shifted_4
               ? (shifted_0 ? _GEN_12 : _GEN_13)
               : shifted_0 ? ~(_23_minus_pos_[2]) : _GEN_14)
          : shifted_4
              ? (shifted_0 | _23_minus_pos_[2]) & ~(_23_minus_pos_[1])
              : shifted_0 & _GEN_15;	// vector_unit.k:327:40, :328:{21,25,60}, :329:{21,25,60}, :330:{21,25,60}, :331:{21,25,60}
  wire         shifted_17 =
    shifted_7
      ? (shifted_3
           ? (shifted_5
                ? shifted_1 | _GEN_9
                : shifted_1 & ~(_23_minus_pos_[2]) | _23_minus_pos_[1])
           : shifted_5
               ? shifted_1 & ~(_23_minus_pos_[1]) | _23_minus_pos_[2]
               : shifted_1 ? _GEN_10 : _GEN_11)
      : shifted_3
          ? (shifted_5
               ? (shifted_1 ? _GEN_12 : _GEN_13)
               : shifted_1 ? ~(_23_minus_pos_[2]) : _GEN_14)
          : shifted_5
              ? (shifted_1 | _23_minus_pos_[2]) & ~(_23_minus_pos_[1])
              : shifted_1 & _GEN_15;	// vector_unit.k:327:40, :328:{21,25,60}, :329:{21,25,60}, :330:{21,25,60}, :331:{21,25,60}
  wire         shifted_18 =
    shifted_8
      ? (shifted_4
           ? (shifted_6
                ? shifted_2 | _GEN_9
                : shifted_2 & ~(_23_minus_pos_[2]) | _23_minus_pos_[1])
           : shifted_6
               ? shifted_2 & ~(_23_minus_pos_[1]) | _23_minus_pos_[2]
               : shifted_2 ? _GEN_10 : _GEN_11)
      : shifted_4
          ? (shifted_6
               ? (shifted_2 ? _GEN_12 : _GEN_13)
               : shifted_2 ? ~(_23_minus_pos_[2]) : _GEN_14)
          : shifted_6
              ? (shifted_2 | _23_minus_pos_[2]) & ~(_23_minus_pos_[1])
              : shifted_2 & _GEN_15;	// vector_unit.k:327:40, :328:{21,25,60}, :329:{21,25,60}, :330:{21,25,60}, :331:{21,25,60}
  wire         shifted_19 =
    shifted_9
      ? (shifted_5
           ? (shifted_7
                ? shifted_3 | _GEN_9
                : shifted_3 & ~(_23_minus_pos_[2]) | _23_minus_pos_[1])
           : shifted_7
               ? shifted_3 & ~(_23_minus_pos_[1]) | _23_minus_pos_[2]
               : shifted_3 ? _GEN_10 : _GEN_11)
      : shifted_5
          ? (shifted_7
               ? (shifted_3 ? _GEN_12 : _GEN_13)
               : shifted_3 ? ~(_23_minus_pos_[2]) : _GEN_14)
          : shifted_7
              ? (shifted_3 | _23_minus_pos_[2]) & ~(_23_minus_pos_[1])
              : shifted_3 & _GEN_15;	// vector_unit.k:327:40, :328:{21,25,60}, :329:{21,25,60}, :330:{21,25,60}, :331:{21,25,60}
  wire         shifted_20 =
    shifted_10
      ? (shifted_6
           ? (shifted_8
                ? shifted_4 | _GEN_9
                : shifted_4 & ~(_23_minus_pos_[2]) | _23_minus_pos_[1])
           : shifted_8
               ? shifted_4 & ~(_23_minus_pos_[1]) | _23_minus_pos_[2]
               : shifted_4 ? _GEN_10 : _GEN_11)
      : shifted_6
          ? (shifted_8
               ? (shifted_4 ? _GEN_12 : _GEN_13)
               : shifted_4 ? ~(_23_minus_pos_[2]) : _GEN_14)
          : shifted_8
              ? (shifted_4 | _23_minus_pos_[2]) & ~(_23_minus_pos_[1])
              : shifted_4 & _GEN_15;	// vector_unit.k:327:40, :328:{21,25,60}, :329:{21,25,60}, :330:{21,25,60}, :331:{21,25,60}
  wire         shifted_21 =
    shifted_11
      ? (shifted_7
           ? (shifted_9
                ? shifted_5 | _GEN_9
                : shifted_5 & ~(_23_minus_pos_[2]) | _23_minus_pos_[1])
           : shifted_9
               ? shifted_5 & ~(_23_minus_pos_[1]) | _23_minus_pos_[2]
               : shifted_5 ? _GEN_10 : _GEN_11)
      : shifted_7
          ? (shifted_9
               ? (shifted_5 ? _GEN_12 : _GEN_13)
               : shifted_5 ? ~(_23_minus_pos_[2]) : _GEN_14)
          : shifted_9
              ? (shifted_5 | _23_minus_pos_[2]) & ~(_23_minus_pos_[1])
              : shifted_5 & _GEN_15;	// vector_unit.k:327:40, :328:{21,25,60}, :329:{21,25,60}, :330:{21,25,60}, :331:{21,25,60}
  wire         shifted_22 =
    shifted_12
      ? (shifted_8
           ? (shifted_10
                ? shifted_6 | _GEN_9
                : shifted_6 & ~(_23_minus_pos_[2]) | _23_minus_pos_[1])
           : shifted_10
               ? shifted_6 & ~(_23_minus_pos_[1]) | _23_minus_pos_[2]
               : shifted_6 ? _GEN_10 : _GEN_11)
      : shifted_8
          ? (shifted_10
               ? (shifted_6 ? _GEN_12 : _GEN_13)
               : shifted_6 ? ~(_23_minus_pos_[2]) : _GEN_14)
          : shifted_10
              ? (shifted_6 | _23_minus_pos_[2]) & ~(_23_minus_pos_[1])
              : shifted_6 & _GEN_15;	// vector_unit.k:327:40, :328:{21,25,60}, :329:{21,25,60}, :330:{21,25,60}, :331:{21,25,60}
  wire         shifted_23 =
    shifted_13
      ? (shifted_9
           ? (shifted_11
                ? shifted_7 | _GEN_9
                : shifted_7 & ~(_23_minus_pos_[2]) | _23_minus_pos_[1])
           : shifted_11
               ? shifted_7 & ~(_23_minus_pos_[1]) | _23_minus_pos_[2]
               : shifted_7 ? _GEN_10 : _GEN_11)
      : shifted_9
          ? (shifted_11
               ? (shifted_7 ? _GEN_12 : _GEN_13)
               : shifted_7 ? ~(_23_minus_pos_[2]) : _GEN_14)
          : shifted_11
              ? (shifted_7 | _23_minus_pos_[2]) & ~(_23_minus_pos_[1])
              : shifted_7 & _GEN_15;	// vector_unit.k:327:40, :328:{21,25,60}, :329:{21,25,60}, :330:{21,25,60}, :331:{21,25,60}
  wire         shifted_24 =
    shifted_14
      ? (shifted_10
           ? (shifted_12
                ? shifted_8 | _GEN_9
                : shifted_8 & ~(_23_minus_pos_[2]) | _23_minus_pos_[1])
           : shifted_12
               ? shifted_8 & ~(_23_minus_pos_[1]) | _23_minus_pos_[2]
               : shifted_8 ? _GEN_10 : _GEN_11)
      : shifted_10
          ? (shifted_12
               ? (shifted_8 ? _GEN_12 : _GEN_13)
               : shifted_8 ? ~(_23_minus_pos_[2]) : _GEN_14)
          : shifted_12
              ? (shifted_8 | _23_minus_pos_[2]) & ~(_23_minus_pos_[1])
              : shifted_8 & _GEN_15;	// vector_unit.k:327:40, :328:{21,25,60}, :329:{21,25,60}, :330:{21,25,60}, :331:{21,25,60}
  wire         shifted_25 =
    mag_24 & _GEN_8
      ? (shifted_11
           ? (shifted_13
                ? shifted_9 | _GEN_9
                : shifted_9 & ~(_23_minus_pos_[2]) | _23_minus_pos_[1])
           : shifted_13
               ? shifted_9 & ~(_23_minus_pos_[1]) | _23_minus_pos_[2]
               : shifted_9 ? _GEN_10 : _GEN_11)
      : shifted_11
          ? (shifted_13
               ? (shifted_9 ? _GEN_12 : _GEN_13)
               : shifted_9 ? ~(_23_minus_pos_[2]) : _GEN_14)
          : shifted_13
              ? (shifted_9 | _23_minus_pos_[2]) & ~(_23_minus_pos_[1])
              : shifted_9 & _GEN_15;	// vector_unit.k:295:13, :298:23, :327:40, :328:{21,25,60}, :329:{21,25,60}, :330:{21,25,60}, :331:{21,25,60}
  wire         _GEN_16 = mag_8 | _pos_lt_23_;	// vector_unit.k:295:13, :298:23, :325:{22,26}, :332:{21,25,60}
  wire         _GEN_17 = mag_8 & ~_pos_lt_23_;	// vector_unit.k:295:13, :298:23, :325:{22,26}, :332:{21,25,60}
  wire         shifted_26 =
    shifted_16
      ? (shifted_15 | _23_minus_pos_[0] ? _GEN_16 : _GEN_17)
      : ~shifted_15 | _23_minus_pos_[0] ? _GEN_17 : _GEN_16;	// vector_unit.k:325:22, :327:40, :330:{21,25,60}, :331:{21,25,60}, :332:{21,25,60}
  wire         _GEN_18 = mag_9 | _pos_lt_23_;	// vector_unit.k:295:13, :298:23, :325:{22,26}, :332:{21,25,60}
  wire         _GEN_19 = mag_9 & ~_pos_lt_23_;	// vector_unit.k:295:13, :298:23, :325:{22,26}, :332:{21,25,60}
  wire         shifted_27 =
    shifted_17
      ? (shifted_16 | _23_minus_pos_[0] ? _GEN_18 : _GEN_19)
      : ~shifted_16 | _23_minus_pos_[0] ? _GEN_19 : _GEN_18;	// vector_unit.k:325:22, :327:40, :330:{21,25,60}, :331:{21,25,60}, :332:{21,25,60}
  wire         _GEN_20 = mag_10 | _pos_lt_23_;	// vector_unit.k:295:13, :298:23, :325:{22,26}, :332:{21,25,60}
  wire         _GEN_21 = mag_10 & ~_pos_lt_23_;	// vector_unit.k:295:13, :298:23, :325:{22,26}, :332:{21,25,60}
  wire         shifted_28 =
    shifted_18
      ? (shifted_17 | _23_minus_pos_[0] ? _GEN_20 : _GEN_21)
      : ~shifted_17 | _23_minus_pos_[0] ? _GEN_21 : _GEN_20;	// vector_unit.k:325:22, :327:40, :330:{21,25,60}, :331:{21,25,60}, :332:{21,25,60}
  wire         _GEN_22 = mag_11 | _pos_lt_23_;	// vector_unit.k:295:13, :298:23, :325:{22,26}, :332:{21,25,60}
  wire         _GEN_23 = mag_11 & ~_pos_lt_23_;	// vector_unit.k:295:13, :298:23, :325:{22,26}, :332:{21,25,60}
  wire         shifted_29 =
    shifted_19
      ? (shifted_18 | _23_minus_pos_[0] ? _GEN_22 : _GEN_23)
      : ~shifted_18 | _23_minus_pos_[0] ? _GEN_23 : _GEN_22;	// vector_unit.k:325:22, :327:40, :330:{21,25,60}, :331:{21,25,60}, :332:{21,25,60}
  wire         _GEN_24 = mag_12 | _pos_lt_23_;	// vector_unit.k:295:13, :298:23, :325:{22,26}, :332:{21,25,60}
  wire         _GEN_25 = mag_12 & ~_pos_lt_23_;	// vector_unit.k:295:13, :298:23, :325:{22,26}, :332:{21,25,60}
  wire         shifted_30 =
    shifted_20
      ? (shifted_19 | _23_minus_pos_[0] ? _GEN_24 : _GEN_25)
      : ~shifted_19 | _23_minus_pos_[0] ? _GEN_25 : _GEN_24;	// vector_unit.k:325:22, :327:40, :330:{21,25,60}, :331:{21,25,60}, :332:{21,25,60}
  wire         _GEN_26 = mag_13 | _pos_lt_23_;	// vector_unit.k:295:13, :298:23, :325:{22,26}, :332:{21,25,60}
  wire         _GEN_27 = mag_13 & ~_pos_lt_23_;	// vector_unit.k:295:13, :298:23, :325:{22,26}, :332:{21,25,60}
  wire         shifted_31 =
    shifted_21
      ? (shifted_20 | _23_minus_pos_[0] ? _GEN_26 : _GEN_27)
      : ~shifted_20 | _23_minus_pos_[0] ? _GEN_27 : _GEN_26;	// vector_unit.k:325:22, :327:40, :330:{21,25,60}, :331:{21,25,60}, :332:{21,25,60}
  wire         _GEN_28 = mag_14 | _pos_lt_23_;	// vector_unit.k:295:13, :298:23, :325:{22,26}, :332:{21,25,60}
  wire         _GEN_29 = mag_14 & ~_pos_lt_23_;	// vector_unit.k:295:13, :298:23, :325:{22,26}, :332:{21,25,60}
  wire         shifted_32 =
    shifted_22
      ? (shifted_21 | _23_minus_pos_[0] ? _GEN_28 : _GEN_29)
      : ~shifted_21 | _23_minus_pos_[0] ? _GEN_29 : _GEN_28;	// vector_unit.k:325:22, :327:40, :330:{21,25,60}, :331:{21,25,60}, :332:{21,25,60}
  wire         _GEN_30 = mag_15 | _pos_lt_23_;	// vector_unit.k:295:13, :298:23, :325:{22,26}, :332:{21,25,60}
  wire         _GEN_31 = mag_15 & ~_pos_lt_23_;	// vector_unit.k:295:13, :298:23, :325:{22,26}, :332:{21,25,60}
  wire         shifted_33 =
    shifted_23
      ? (shifted_22 | _23_minus_pos_[0] ? _GEN_30 : _GEN_31)
      : ~shifted_22 | _23_minus_pos_[0] ? _GEN_31 : _GEN_30;	// vector_unit.k:325:22, :327:40, :330:{21,25,60}, :331:{21,25,60}, :332:{21,25,60}
  wire         _GEN_32 = mag_16 | _pos_lt_23_;	// vector_unit.k:295:13, :298:23, :325:{22,26}, :332:{21,25,60}
  wire         _GEN_33 = mag_16 & ~_pos_lt_23_;	// vector_unit.k:295:13, :298:23, :325:{22,26}, :332:{21,25,60}
  wire         shifted_34 =
    shifted_24
      ? (shifted_23 | _23_minus_pos_[0] ? _GEN_32 : _GEN_33)
      : ~shifted_23 | _23_minus_pos_[0] ? _GEN_33 : _GEN_32;	// vector_unit.k:325:22, :327:40, :330:{21,25,60}, :331:{21,25,60}, :332:{21,25,60}
  wire         _GEN_34 = mag_17 | _pos_lt_23_;	// vector_unit.k:295:13, :298:23, :325:{22,26}, :332:{21,25,60}
  wire         _GEN_35 = mag_17 & ~_pos_lt_23_;	// vector_unit.k:295:13, :298:23, :325:{22,26}, :332:{21,25,60}
  wire         shifted_35 =
    shifted_25
      ? (shifted_24 | _23_minus_pos_[0] ? _GEN_34 : _GEN_35)
      : ~shifted_24 | _23_minus_pos_[0] ? _GEN_35 : _GEN_34;	// vector_unit.k:325:22, :327:40, :330:{21,25,60}, :331:{21,25,60}, :332:{21,25,60}
  wire         _GEN_36 = mag_18 | _pos_lt_23_;	// vector_unit.k:295:13, :298:23, :325:{22,26}, :332:{21,25,60}
  wire         _GEN_37 = mag_18 & ~_pos_lt_23_;	// vector_unit.k:295:13, :298:23, :325:{22,26}, :332:{21,25,60}
  wire         shifted_36 =
    (mag_25 & _GEN_8
       ? (shifted_12
            ? (shifted_14
                 ? shifted_10 | _GEN_9
                 : shifted_10 & ~(_23_minus_pos_[2]) | _23_minus_pos_[1])
            : shifted_14
                ? shifted_10 & ~(_23_minus_pos_[1]) | _23_minus_pos_[2]
                : shifted_10 ? _GEN_10 : _GEN_11)
       : shifted_12
           ? (shifted_14
                ? (shifted_10 ? _GEN_12 : _GEN_13)
                : shifted_10 ? ~(_23_minus_pos_[2]) : _GEN_14)
           : shifted_14
               ? (shifted_10 | _23_minus_pos_[2]) & ~(_23_minus_pos_[1])
               : shifted_10 & _GEN_15)
      ? (shifted_25 | _23_minus_pos_[0] ? _GEN_36 : _GEN_37)
      : ~shifted_25 | _23_minus_pos_[0] ? _GEN_37 : _GEN_36;	// vector_unit.k:295:13, :298:23, :325:22, :327:40, :328:{21,25,60}, :329:{21,25,60}, :330:{21,25,60}, :331:{21,25,60}, :332:{21,25,60}
  wire         fp_accum = _scaled_lt_0_ & (|mag_31);	// vector_unit.k:295:{13,17}, :298:23, :306:{13,17}, :321:17, :334:{17,31}, :335:{28,43,45}
  wire         fp_accum_0 = _127_plus_pos_[7] & (|mag_31);	// vector_unit.k:295:13, :298:23, :306:{13,17}, :317:34, :321:17, :334:{17,31}, :335:{28,43,45}
  wire         fp_accum_1 = _127_plus_pos_[6] & (|mag_31);	// vector_unit.k:295:13, :298:23, :306:{13,17}, :317:34, :321:17, :334:{17,31}, :335:{28,43,45}
  wire         fp_accum_2 = _127_plus_pos_[5] & (|mag_31);	// vector_unit.k:295:13, :298:23, :306:{13,17}, :317:34, :321:17, :334:{17,31}, :335:{28,43,45}
  wire         fp_accum_3 = _127_plus_pos_[4] & (|mag_31);	// vector_unit.k:295:13, :298:23, :306:{13,17}, :317:34, :321:17, :334:{17,31}, :335:{28,43,45}
  wire         fp_accum_4 = _127_plus_pos_[3] & (|mag_31);	// vector_unit.k:295:13, :298:23, :306:{13,17}, :317:34, :321:17, :334:{17,31}, :335:{28,43,45}
  wire         fp_accum_5 = _127_plus_pos_[2] & (|mag_31);	// vector_unit.k:295:13, :298:23, :306:{13,17}, :317:34, :321:17, :334:{17,31}, :335:{28,43,45}
  wire         fp_accum_6 = _127_plus_pos_[1] & (|mag_31);	// vector_unit.k:295:13, :298:23, :306:{13,17}, :317:34, :321:17, :334:{17,31}, :335:{28,43,45}
  wire         fp_accum_7 = _127_plus_pos_[0] & (|mag_31);	// vector_unit.k:295:13, :298:23, :306:{13,17}, :317:34, :321:17, :334:{17,31}, :335:{28,43,45}
  wire         _GEN_38 = ~_pos_gt_23_ & (|mag_31);	// vector_unit.k:295:13, :298:23, :306:{13,17}, :321:{17,21}, :334:{17,31}, :335:{28,43,45}
  wire         fp_accum_8 =
    _mag_shr_pos_minus_23_[22]
      ? (shifted_26 | _pos_gt_23_) & (|mag_31)
      : shifted_26 & _GEN_38;	// vector_unit.k:295:13, :298:23, :306:{13,17}, :321:{17,21}, :323:31, :325:22, :332:{21,25,60}, :334:{17,31}, :335:{28,43,45}
  wire         fp_accum_9 =
    _mag_shr_pos_minus_23_[21]
      ? (shifted_27 | _pos_gt_23_) & (|mag_31)
      : shifted_27 & _GEN_38;	// vector_unit.k:295:13, :298:23, :306:{13,17}, :321:{17,21}, :323:31, :325:22, :332:{21,25,60}, :334:{17,31}, :335:{28,43,45}
  wire         fp_accum_10 =
    _mag_shr_pos_minus_23_[20]
      ? (shifted_28 | _pos_gt_23_) & (|mag_31)
      : shifted_28 & _GEN_38;	// vector_unit.k:295:13, :298:23, :306:{13,17}, :321:{17,21}, :323:31, :325:22, :332:{21,25,60}, :334:{17,31}, :335:{28,43,45}
  wire         fp_accum_11 =
    _mag_shr_pos_minus_23_[19]
      ? (shifted_29 | _pos_gt_23_) & (|mag_31)
      : shifted_29 & _GEN_38;	// vector_unit.k:295:13, :298:23, :306:{13,17}, :321:{17,21}, :323:31, :325:22, :332:{21,25,60}, :334:{17,31}, :335:{28,43,45}
  wire         fp_accum_12 =
    _mag_shr_pos_minus_23_[18]
      ? (shifted_30 | _pos_gt_23_) & (|mag_31)
      : shifted_30 & _GEN_38;	// vector_unit.k:295:13, :298:23, :306:{13,17}, :321:{17,21}, :323:31, :325:22, :332:{21,25,60}, :334:{17,31}, :335:{28,43,45}
  wire         fp_accum_13 =
    _mag_shr_pos_minus_23_[17]
      ? (shifted_31 | _pos_gt_23_) & (|mag_31)
      : shifted_31 & _GEN_38;	// vector_unit.k:295:13, :298:23, :306:{13,17}, :321:{17,21}, :323:31, :325:22, :332:{21,25,60}, :334:{17,31}, :335:{28,43,45}
  wire         fp_accum_14 =
    _mag_shr_pos_minus_23_[16]
      ? (shifted_32 | _pos_gt_23_) & (|mag_31)
      : shifted_32 & _GEN_38;	// vector_unit.k:295:13, :298:23, :306:{13,17}, :321:{17,21}, :323:31, :325:22, :332:{21,25,60}, :334:{17,31}, :335:{28,43,45}
  wire         fp_accum_15 =
    _mag_shr_pos_minus_23_[15]
      ? (shifted_33 | _pos_gt_23_) & (|mag_31)
      : shifted_33 & _GEN_38;	// vector_unit.k:295:13, :298:23, :306:{13,17}, :321:{17,21}, :323:31, :325:22, :332:{21,25,60}, :334:{17,31}, :335:{28,43,45}
  wire         fp_accum_16 =
    _mag_shr_pos_minus_23_[14]
      ? (shifted_34 | _pos_gt_23_) & (|mag_31)
      : shifted_34 & _GEN_38;	// vector_unit.k:295:13, :298:23, :306:{13,17}, :321:{17,21}, :323:31, :325:22, :332:{21,25,60}, :334:{17,31}, :335:{28,43,45}
  wire         fp_accum_17 =
    _mag_shr_pos_minus_23_[13]
      ? (shifted_35 | _pos_gt_23_) & (|mag_31)
      : shifted_35 & _GEN_38;	// vector_unit.k:295:13, :298:23, :306:{13,17}, :321:{17,21}, :323:31, :325:22, :332:{21,25,60}, :334:{17,31}, :335:{28,43,45}
  wire         fp_accum_18 =
    _mag_shr_pos_minus_23_[12]
      ? (shifted_36 | _pos_gt_23_) & (|mag_31)
      : shifted_36 & _GEN_38;	// vector_unit.k:295:13, :298:23, :306:{13,17}, :321:{17,21}, :323:31, :325:22, :332:{21,25,60}, :334:{17,31}, :335:{28,43,45}
  wire         prod = fp_accum_8 & p0_super_scale_bf16[0];	// vector_unit.k:279:9, :295:13, :306:13, :321:17, :334:{17,31}, :335:{28,43,45}, :339:33, :360:{17,21,50,57}
  wire         prod_0 = fp_accum_9 & p0_super_scale_bf16[0];	// vector_unit.k:279:9, :295:13, :306:13, :321:17, :334:{17,31}, :335:{28,43,45}, :339:33, :360:{17,21,50,57}
  wire         prod_1 = fp_accum_10 & p0_super_scale_bf16[0];	// vector_unit.k:279:9, :295:13, :306:13, :321:17, :334:{17,31}, :335:{28,43,45}, :339:33, :360:{17,21,50,57}
  wire         prod_2 = fp_accum_11 & p0_super_scale_bf16[0];	// vector_unit.k:279:9, :295:13, :306:13, :321:17, :334:{17,31}, :335:{28,43,45}, :339:33, :360:{17,21,50,57}
  wire         prod_3 = fp_accum_12 & p0_super_scale_bf16[0];	// vector_unit.k:279:9, :295:13, :306:13, :321:17, :334:{17,31}, :335:{28,43,45}, :339:33, :360:{17,21,50,57}
  wire         prod_4 = fp_accum_13 & p0_super_scale_bf16[0];	// vector_unit.k:279:9, :295:13, :306:13, :321:17, :334:{17,31}, :335:{28,43,45}, :339:33, :360:{17,21,50,57}
  wire         prod_5 = fp_accum_14 & p0_super_scale_bf16[0];	// vector_unit.k:279:9, :295:13, :306:13, :321:17, :334:{17,31}, :335:{28,43,45}, :339:33, :360:{17,21,50,57}
  wire         prod_6 = fp_accum_15 & p0_super_scale_bf16[0];	// vector_unit.k:279:9, :295:13, :306:13, :321:17, :334:{17,31}, :335:{28,43,45}, :339:33, :360:{17,21,50,57}
  wire         prod_7 = fp_accum_16 & p0_super_scale_bf16[0];	// vector_unit.k:279:9, :295:13, :306:13, :321:17, :334:{17,31}, :335:{28,43,45}, :339:33, :360:{17,21,50,57}
  wire         prod_8 = fp_accum_17 & p0_super_scale_bf16[0];	// vector_unit.k:279:9, :295:13, :306:13, :321:17, :334:{17,31}, :335:{28,43,45}, :339:33, :360:{17,21,50,57}
  wire         prod_9 = fp_accum_18 & p0_super_scale_bf16[0];	// vector_unit.k:279:9, :295:13, :306:13, :321:17, :334:{17,31}, :335:{28,43,45}, :339:33, :360:{17,21,50,57}
  wire  [31:0] _a_exp_plus_b_exp_minus_127_ =
    32'({24'h0,
         fp_accum_0,
         fp_accum_1,
         fp_accum_2,
         fp_accum_3,
         fp_accum_4,
         fp_accum_5,
         fp_accum_6,
         fp_accum_7} + 32'({24'h0, p0_super_scale_bf16[14:7]} - 32'h7F));	// vector_unit.k:279:9, :295:13, :306:13, :321:17, :334:{17,31}, :335:{28,43,45}, :349:{32,38}
  wire  [17:0] _prod_plus_ma32_shl_5_ =
    18'({2'h0,
         p0_super_scale_bf16[0],
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
         4'h0}
        + {2'h1,
           fp_accum_8,
           fp_accum_9,
           fp_accum_10,
           fp_accum_11,
           fp_accum_12,
           fp_accum_13,
           fp_accum_14,
           fp_accum_15,
           fp_accum_16,
           fp_accum_17,
           fp_accum_18,
           5'h0});	// vector_unit.k:279:9, :295:13, :306:13, :321:17, :334:{17,31}, :335:{28,43,45}, :339:33, :360:{17,21,50,57}, :361:{50,57}
  wire         prod_10 = _prod_plus_ma32_shl_5_[17] & p0_super_scale_bf16[1];	// vector_unit.k:279:9, :339:33, :361:{17,21,50}
  wire         prod_11 = _prod_plus_ma32_shl_5_[16] & p0_super_scale_bf16[1];	// vector_unit.k:279:9, :339:33, :361:{17,21,50}
  wire         prod_12 =
    _prod_plus_ma32_shl_5_[15]
      ? p0_super_scale_bf16[0] | p0_super_scale_bf16[1]
      : p0_super_scale_bf16[0] & ~(p0_super_scale_bf16[1]);	// vector_unit.k:279:9, :339:33, :361:{17,21,50}
  wire         prod_13 =
    _prod_plus_ma32_shl_5_[14]
      ? prod | p0_super_scale_bf16[1]
      : prod & ~(p0_super_scale_bf16[1]);	// vector_unit.k:279:9, :339:33, :360:{17,21,50,57}, :361:{17,21,50}
  wire         prod_14 =
    _prod_plus_ma32_shl_5_[13]
      ? prod_0 | p0_super_scale_bf16[1]
      : prod_0 & ~(p0_super_scale_bf16[1]);	// vector_unit.k:279:9, :339:33, :360:{17,21,50,57}, :361:{17,21,50}
  wire         prod_15 =
    _prod_plus_ma32_shl_5_[12]
      ? prod_1 | p0_super_scale_bf16[1]
      : prod_1 & ~(p0_super_scale_bf16[1]);	// vector_unit.k:279:9, :339:33, :360:{17,21,50,57}, :361:{17,21,50}
  wire         prod_16 =
    _prod_plus_ma32_shl_5_[11]
      ? prod_2 | p0_super_scale_bf16[1]
      : prod_2 & ~(p0_super_scale_bf16[1]);	// vector_unit.k:279:9, :339:33, :360:{17,21,50,57}, :361:{17,21,50}
  wire         prod_17 =
    _prod_plus_ma32_shl_5_[10]
      ? prod_3 | p0_super_scale_bf16[1]
      : prod_3 & ~(p0_super_scale_bf16[1]);	// vector_unit.k:279:9, :339:33, :360:{17,21,50,57}, :361:{17,21,50}
  wire         prod_18 =
    _prod_plus_ma32_shl_5_[9]
      ? prod_4 | p0_super_scale_bf16[1]
      : prod_4 & ~(p0_super_scale_bf16[1]);	// vector_unit.k:279:9, :339:33, :360:{17,21,50,57}, :361:{17,21,50}
  wire         prod_19 =
    _prod_plus_ma32_shl_5_[8]
      ? prod_5 | p0_super_scale_bf16[1]
      : prod_5 & ~(p0_super_scale_bf16[1]);	// vector_unit.k:279:9, :339:33, :360:{17,21,50,57}, :361:{17,21,50}
  wire         prod_20 =
    _prod_plus_ma32_shl_5_[7]
      ? prod_6 | p0_super_scale_bf16[1]
      : prod_6 & ~(p0_super_scale_bf16[1]);	// vector_unit.k:279:9, :339:33, :360:{17,21,50,57}, :361:{17,21,50}
  wire         prod_21 =
    _prod_plus_ma32_shl_5_[6]
      ? prod_7 | p0_super_scale_bf16[1]
      : prod_7 & ~(p0_super_scale_bf16[1]);	// vector_unit.k:279:9, :339:33, :360:{17,21,50,57}, :361:{17,21,50}
  wire         prod_22 =
    _prod_plus_ma32_shl_5_[5]
      ? prod_8 | p0_super_scale_bf16[1]
      : prod_8 & ~(p0_super_scale_bf16[1]);	// vector_unit.k:279:9, :339:33, :360:{17,21,50,57}, :361:{17,21,50}
  wire         prod_23 =
    _prod_plus_ma32_shl_5_[4]
      ? prod_9 | p0_super_scale_bf16[1]
      : prod_9 & ~(p0_super_scale_bf16[1]);	// vector_unit.k:279:9, :339:33, :360:{17,21,50,57}, :361:{17,21,50}
  wire         prod_24 = _prod_plus_ma32_shl_5_[3] & p0_super_scale_bf16[1];	// vector_unit.k:279:9, :339:33, :361:{17,21,50}
  wire         prod_25 = _prod_plus_ma32_shl_5_[2] & p0_super_scale_bf16[1];	// vector_unit.k:279:9, :339:33, :361:{17,21,50}
  wire         prod_26 = _prod_plus_ma32_shl_5_[1] & p0_super_scale_bf16[1];	// vector_unit.k:279:9, :339:33, :361:{17,21,50}
  wire         prod_27 = _prod_plus_ma32_shl_5_[0] & p0_super_scale_bf16[1];	// vector_unit.k:279:9, :339:33, :361:{17,21,50}
  wire  [18:0] _prod_plus_ma32_shl_6_ =
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
         prod_27}
        + {2'h1,
           fp_accum_8,
           fp_accum_9,
           fp_accum_10,
           fp_accum_11,
           fp_accum_12,
           fp_accum_13,
           fp_accum_14,
           fp_accum_15,
           fp_accum_16,
           fp_accum_17,
           fp_accum_18,
           6'h0});	// vector_unit.k:295:13, :306:13, :321:17, :334:{17,31}, :335:{28,43,45}, :361:{17,21}, :362:{50,57}
  wire         prod_28 = _prod_plus_ma32_shl_6_[18] & p0_super_scale_bf16[2];	// vector_unit.k:279:9, :339:33, :362:{17,50}
  wire         prod_29 =
    _prod_plus_ma32_shl_6_[17]
      ? prod_10 | p0_super_scale_bf16[2]
      : prod_10 & ~(p0_super_scale_bf16[2]);	// vector_unit.k:279:9, :339:33, :361:{17,21}, :362:{17,50}
  wire         prod_30 =
    _prod_plus_ma32_shl_6_[16]
      ? prod_11 | p0_super_scale_bf16[2]
      : prod_11 & ~(p0_super_scale_bf16[2]);	// vector_unit.k:279:9, :339:33, :361:{17,21}, :362:{17,50}
  wire         prod_31 =
    _prod_plus_ma32_shl_6_[15]
      ? prod_12 | p0_super_scale_bf16[2]
      : prod_12 & ~(p0_super_scale_bf16[2]);	// vector_unit.k:279:9, :339:33, :361:{17,21}, :362:{17,50}
  wire         prod_32 =
    _prod_plus_ma32_shl_6_[14]
      ? prod_13 | p0_super_scale_bf16[2]
      : prod_13 & ~(p0_super_scale_bf16[2]);	// vector_unit.k:279:9, :339:33, :361:{17,21}, :362:{17,50}
  wire         prod_33 =
    _prod_plus_ma32_shl_6_[13]
      ? prod_14 | p0_super_scale_bf16[2]
      : prod_14 & ~(p0_super_scale_bf16[2]);	// vector_unit.k:279:9, :339:33, :361:{17,21}, :362:{17,50}
  wire         prod_34 =
    _prod_plus_ma32_shl_6_[12]
      ? prod_15 | p0_super_scale_bf16[2]
      : prod_15 & ~(p0_super_scale_bf16[2]);	// vector_unit.k:279:9, :339:33, :361:{17,21}, :362:{17,50}
  wire         prod_35 =
    _prod_plus_ma32_shl_6_[11]
      ? prod_16 | p0_super_scale_bf16[2]
      : prod_16 & ~(p0_super_scale_bf16[2]);	// vector_unit.k:279:9, :339:33, :361:{17,21}, :362:{17,50}
  wire         prod_36 =
    _prod_plus_ma32_shl_6_[10]
      ? prod_17 | p0_super_scale_bf16[2]
      : prod_17 & ~(p0_super_scale_bf16[2]);	// vector_unit.k:279:9, :339:33, :361:{17,21}, :362:{17,50}
  wire         prod_37 =
    _prod_plus_ma32_shl_6_[9]
      ? prod_18 | p0_super_scale_bf16[2]
      : prod_18 & ~(p0_super_scale_bf16[2]);	// vector_unit.k:279:9, :339:33, :361:{17,21}, :362:{17,50}
  wire         prod_38 =
    _prod_plus_ma32_shl_6_[8]
      ? prod_19 | p0_super_scale_bf16[2]
      : prod_19 & ~(p0_super_scale_bf16[2]);	// vector_unit.k:279:9, :339:33, :361:{17,21}, :362:{17,50}
  wire         prod_39 =
    _prod_plus_ma32_shl_6_[7]
      ? prod_20 | p0_super_scale_bf16[2]
      : prod_20 & ~(p0_super_scale_bf16[2]);	// vector_unit.k:279:9, :339:33, :361:{17,21}, :362:{17,50}
  wire         prod_40 =
    _prod_plus_ma32_shl_6_[6]
      ? prod_21 | p0_super_scale_bf16[2]
      : prod_21 & ~(p0_super_scale_bf16[2]);	// vector_unit.k:279:9, :339:33, :361:{17,21}, :362:{17,50}
  wire         prod_41 =
    _prod_plus_ma32_shl_6_[5]
      ? prod_22 | p0_super_scale_bf16[2]
      : prod_22 & ~(p0_super_scale_bf16[2]);	// vector_unit.k:279:9, :339:33, :361:{17,21}, :362:{17,50}
  wire         prod_42 =
    _prod_plus_ma32_shl_6_[4]
      ? prod_23 | p0_super_scale_bf16[2]
      : prod_23 & ~(p0_super_scale_bf16[2]);	// vector_unit.k:279:9, :339:33, :361:{17,21}, :362:{17,50}
  wire         prod_43 =
    _prod_plus_ma32_shl_6_[3]
      ? prod_24 | p0_super_scale_bf16[2]
      : prod_24 & ~(p0_super_scale_bf16[2]);	// vector_unit.k:279:9, :339:33, :361:{17,21}, :362:{17,50}
  wire         prod_44 =
    _prod_plus_ma32_shl_6_[2]
      ? prod_25 | p0_super_scale_bf16[2]
      : prod_25 & ~(p0_super_scale_bf16[2]);	// vector_unit.k:279:9, :339:33, :361:{17,21}, :362:{17,50}
  wire         prod_45 =
    _prod_plus_ma32_shl_6_[1]
      ? prod_26 | p0_super_scale_bf16[2]
      : prod_26 & ~(p0_super_scale_bf16[2]);	// vector_unit.k:279:9, :339:33, :361:{17,21}, :362:{17,50}
  wire         prod_46 =
    _prod_plus_ma32_shl_6_[0]
      ? prod_27 | p0_super_scale_bf16[2]
      : prod_27 & ~(p0_super_scale_bf16[2]);	// vector_unit.k:279:9, :339:33, :361:{17,21}, :362:{17,50}
  wire  [19:0] _prod_plus_ma32_shl_7_ =
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
         prod_46}
        + {2'h1,
           fp_accum_8,
           fp_accum_9,
           fp_accum_10,
           fp_accum_11,
           fp_accum_12,
           fp_accum_13,
           fp_accum_14,
           fp_accum_15,
           fp_accum_16,
           fp_accum_17,
           fp_accum_18,
           7'h0});	// vector_unit.k:295:13, :306:13, :321:17, :334:{17,31}, :335:{28,43,45}, :362:17, :363:{50,57}
  wire         prod_47 = _prod_plus_ma32_shl_7_[19] & p0_super_scale_bf16[3];	// vector_unit.k:279:9, :339:33, :363:{17,50}
  wire         prod_48 =
    _prod_plus_ma32_shl_7_[18]
      ? prod_28 | p0_super_scale_bf16[3]
      : prod_28 & ~(p0_super_scale_bf16[3]);	// vector_unit.k:279:9, :339:33, :362:17, :363:{17,50}
  wire         prod_49 =
    _prod_plus_ma32_shl_7_[17]
      ? prod_29 | p0_super_scale_bf16[3]
      : prod_29 & ~(p0_super_scale_bf16[3]);	// vector_unit.k:279:9, :339:33, :362:17, :363:{17,50}
  wire         prod_50 =
    _prod_plus_ma32_shl_7_[16]
      ? prod_30 | p0_super_scale_bf16[3]
      : prod_30 & ~(p0_super_scale_bf16[3]);	// vector_unit.k:279:9, :339:33, :362:17, :363:{17,50}
  wire         prod_51 =
    _prod_plus_ma32_shl_7_[15]
      ? prod_31 | p0_super_scale_bf16[3]
      : prod_31 & ~(p0_super_scale_bf16[3]);	// vector_unit.k:279:9, :339:33, :362:17, :363:{17,50}
  wire         prod_52 =
    _prod_plus_ma32_shl_7_[14]
      ? prod_32 | p0_super_scale_bf16[3]
      : prod_32 & ~(p0_super_scale_bf16[3]);	// vector_unit.k:279:9, :339:33, :362:17, :363:{17,50}
  wire         prod_53 =
    _prod_plus_ma32_shl_7_[13]
      ? prod_33 | p0_super_scale_bf16[3]
      : prod_33 & ~(p0_super_scale_bf16[3]);	// vector_unit.k:279:9, :339:33, :362:17, :363:{17,50}
  wire         prod_54 =
    _prod_plus_ma32_shl_7_[12]
      ? prod_34 | p0_super_scale_bf16[3]
      : prod_34 & ~(p0_super_scale_bf16[3]);	// vector_unit.k:279:9, :339:33, :362:17, :363:{17,50}
  wire         prod_55 =
    _prod_plus_ma32_shl_7_[11]
      ? prod_35 | p0_super_scale_bf16[3]
      : prod_35 & ~(p0_super_scale_bf16[3]);	// vector_unit.k:279:9, :339:33, :362:17, :363:{17,50}
  wire         prod_56 =
    _prod_plus_ma32_shl_7_[10]
      ? prod_36 | p0_super_scale_bf16[3]
      : prod_36 & ~(p0_super_scale_bf16[3]);	// vector_unit.k:279:9, :339:33, :362:17, :363:{17,50}
  wire         prod_57 =
    _prod_plus_ma32_shl_7_[9]
      ? prod_37 | p0_super_scale_bf16[3]
      : prod_37 & ~(p0_super_scale_bf16[3]);	// vector_unit.k:279:9, :339:33, :362:17, :363:{17,50}
  wire         prod_58 =
    _prod_plus_ma32_shl_7_[8]
      ? prod_38 | p0_super_scale_bf16[3]
      : prod_38 & ~(p0_super_scale_bf16[3]);	// vector_unit.k:279:9, :339:33, :362:17, :363:{17,50}
  wire         prod_59 =
    _prod_plus_ma32_shl_7_[7]
      ? prod_39 | p0_super_scale_bf16[3]
      : prod_39 & ~(p0_super_scale_bf16[3]);	// vector_unit.k:279:9, :339:33, :362:17, :363:{17,50}
  wire         prod_60 =
    _prod_plus_ma32_shl_7_[6]
      ? prod_40 | p0_super_scale_bf16[3]
      : prod_40 & ~(p0_super_scale_bf16[3]);	// vector_unit.k:279:9, :339:33, :362:17, :363:{17,50}
  wire         prod_61 =
    _prod_plus_ma32_shl_7_[5]
      ? prod_41 | p0_super_scale_bf16[3]
      : prod_41 & ~(p0_super_scale_bf16[3]);	// vector_unit.k:279:9, :339:33, :362:17, :363:{17,50}
  wire         prod_62 =
    _prod_plus_ma32_shl_7_[4]
      ? prod_42 | p0_super_scale_bf16[3]
      : prod_42 & ~(p0_super_scale_bf16[3]);	// vector_unit.k:279:9, :339:33, :362:17, :363:{17,50}
  wire         prod_63 =
    _prod_plus_ma32_shl_7_[3]
      ? prod_43 | p0_super_scale_bf16[3]
      : prod_43 & ~(p0_super_scale_bf16[3]);	// vector_unit.k:279:9, :339:33, :362:17, :363:{17,50}
  wire         prod_64 =
    _prod_plus_ma32_shl_7_[2]
      ? prod_44 | p0_super_scale_bf16[3]
      : prod_44 & ~(p0_super_scale_bf16[3]);	// vector_unit.k:279:9, :339:33, :362:17, :363:{17,50}
  wire         prod_65 =
    _prod_plus_ma32_shl_7_[1]
      ? prod_45 | p0_super_scale_bf16[3]
      : prod_45 & ~(p0_super_scale_bf16[3]);	// vector_unit.k:279:9, :339:33, :362:17, :363:{17,50}
  wire         prod_66 =
    _prod_plus_ma32_shl_7_[0]
      ? prod_46 | p0_super_scale_bf16[3]
      : prod_46 & ~(p0_super_scale_bf16[3]);	// vector_unit.k:279:9, :339:33, :362:17, :363:{17,50}
  wire  [20:0] _prod_plus_ma32_shl_8_ =
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
         prod_66}
        + {2'h1,
           fp_accum_8,
           fp_accum_9,
           fp_accum_10,
           fp_accum_11,
           fp_accum_12,
           fp_accum_13,
           fp_accum_14,
           fp_accum_15,
           fp_accum_16,
           fp_accum_17,
           fp_accum_18,
           8'h0});	// vector_unit.k:295:13, :306:13, :321:17, :334:{17,31}, :335:{28,43,45}, :363:17, :364:{50,57}
  wire         prod_67 = _prod_plus_ma32_shl_8_[20] & p0_super_scale_bf16[4];	// vector_unit.k:279:9, :339:33, :364:{17,50}
  wire         prod_68 =
    _prod_plus_ma32_shl_8_[19]
      ? prod_47 | p0_super_scale_bf16[4]
      : prod_47 & ~(p0_super_scale_bf16[4]);	// vector_unit.k:279:9, :339:33, :363:17, :364:{17,50}
  wire         prod_69 =
    _prod_plus_ma32_shl_8_[18]
      ? prod_48 | p0_super_scale_bf16[4]
      : prod_48 & ~(p0_super_scale_bf16[4]);	// vector_unit.k:279:9, :339:33, :363:17, :364:{17,50}
  wire         prod_70 =
    _prod_plus_ma32_shl_8_[17]
      ? prod_49 | p0_super_scale_bf16[4]
      : prod_49 & ~(p0_super_scale_bf16[4]);	// vector_unit.k:279:9, :339:33, :363:17, :364:{17,50}
  wire         prod_71 =
    _prod_plus_ma32_shl_8_[16]
      ? prod_50 | p0_super_scale_bf16[4]
      : prod_50 & ~(p0_super_scale_bf16[4]);	// vector_unit.k:279:9, :339:33, :363:17, :364:{17,50}
  wire         prod_72 =
    _prod_plus_ma32_shl_8_[15]
      ? prod_51 | p0_super_scale_bf16[4]
      : prod_51 & ~(p0_super_scale_bf16[4]);	// vector_unit.k:279:9, :339:33, :363:17, :364:{17,50}
  wire         prod_73 =
    _prod_plus_ma32_shl_8_[14]
      ? prod_52 | p0_super_scale_bf16[4]
      : prod_52 & ~(p0_super_scale_bf16[4]);	// vector_unit.k:279:9, :339:33, :363:17, :364:{17,50}
  wire         prod_74 =
    _prod_plus_ma32_shl_8_[13]
      ? prod_53 | p0_super_scale_bf16[4]
      : prod_53 & ~(p0_super_scale_bf16[4]);	// vector_unit.k:279:9, :339:33, :363:17, :364:{17,50}
  wire         prod_75 =
    _prod_plus_ma32_shl_8_[12]
      ? prod_54 | p0_super_scale_bf16[4]
      : prod_54 & ~(p0_super_scale_bf16[4]);	// vector_unit.k:279:9, :339:33, :363:17, :364:{17,50}
  wire         prod_76 =
    _prod_plus_ma32_shl_8_[11]
      ? prod_55 | p0_super_scale_bf16[4]
      : prod_55 & ~(p0_super_scale_bf16[4]);	// vector_unit.k:279:9, :339:33, :363:17, :364:{17,50}
  wire         prod_77 =
    _prod_plus_ma32_shl_8_[10]
      ? prod_56 | p0_super_scale_bf16[4]
      : prod_56 & ~(p0_super_scale_bf16[4]);	// vector_unit.k:279:9, :339:33, :363:17, :364:{17,50}
  wire         prod_78 =
    _prod_plus_ma32_shl_8_[9]
      ? prod_57 | p0_super_scale_bf16[4]
      : prod_57 & ~(p0_super_scale_bf16[4]);	// vector_unit.k:279:9, :339:33, :363:17, :364:{17,50}
  wire         prod_79 =
    _prod_plus_ma32_shl_8_[8]
      ? prod_58 | p0_super_scale_bf16[4]
      : prod_58 & ~(p0_super_scale_bf16[4]);	// vector_unit.k:279:9, :339:33, :363:17, :364:{17,50}
  wire         prod_80 =
    _prod_plus_ma32_shl_8_[7]
      ? prod_59 | p0_super_scale_bf16[4]
      : prod_59 & ~(p0_super_scale_bf16[4]);	// vector_unit.k:279:9, :339:33, :363:17, :364:{17,50}
  wire         prod_81 =
    _prod_plus_ma32_shl_8_[6]
      ? prod_60 | p0_super_scale_bf16[4]
      : prod_60 & ~(p0_super_scale_bf16[4]);	// vector_unit.k:279:9, :339:33, :363:17, :364:{17,50}
  wire         prod_82 =
    _prod_plus_ma32_shl_8_[5]
      ? prod_61 | p0_super_scale_bf16[4]
      : prod_61 & ~(p0_super_scale_bf16[4]);	// vector_unit.k:279:9, :339:33, :363:17, :364:{17,50}
  wire         prod_83 =
    _prod_plus_ma32_shl_8_[4]
      ? prod_62 | p0_super_scale_bf16[4]
      : prod_62 & ~(p0_super_scale_bf16[4]);	// vector_unit.k:279:9, :339:33, :363:17, :364:{17,50}
  wire         prod_84 =
    _prod_plus_ma32_shl_8_[3]
      ? prod_63 | p0_super_scale_bf16[4]
      : prod_63 & ~(p0_super_scale_bf16[4]);	// vector_unit.k:279:9, :339:33, :363:17, :364:{17,50}
  wire         prod_85 =
    _prod_plus_ma32_shl_8_[2]
      ? prod_64 | p0_super_scale_bf16[4]
      : prod_64 & ~(p0_super_scale_bf16[4]);	// vector_unit.k:279:9, :339:33, :363:17, :364:{17,50}
  wire         prod_86 =
    _prod_plus_ma32_shl_8_[1]
      ? prod_65 | p0_super_scale_bf16[4]
      : prod_65 & ~(p0_super_scale_bf16[4]);	// vector_unit.k:279:9, :339:33, :363:17, :364:{17,50}
  wire         prod_87 =
    _prod_plus_ma32_shl_8_[0]
      ? prod_66 | p0_super_scale_bf16[4]
      : prod_66 & ~(p0_super_scale_bf16[4]);	// vector_unit.k:279:9, :339:33, :363:17, :364:{17,50}
  wire  [21:0] _prod_plus_ma32_shl_9_ =
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
         prod_87}
        + {2'h1,
           fp_accum_8,
           fp_accum_9,
           fp_accum_10,
           fp_accum_11,
           fp_accum_12,
           fp_accum_13,
           fp_accum_14,
           fp_accum_15,
           fp_accum_16,
           fp_accum_17,
           fp_accum_18,
           9'h0});	// vector_unit.k:295:13, :306:13, :321:17, :334:{17,31}, :335:{28,43,45}, :364:17, :365:{50,57}
  wire         prod_88 = _prod_plus_ma32_shl_9_[21] & p0_super_scale_bf16[5];	// vector_unit.k:279:9, :339:33, :365:{17,50}
  wire         prod_89 =
    _prod_plus_ma32_shl_9_[20]
      ? prod_67 | p0_super_scale_bf16[5]
      : prod_67 & ~(p0_super_scale_bf16[5]);	// vector_unit.k:279:9, :339:33, :364:17, :365:{17,50}
  wire         prod_90 =
    _prod_plus_ma32_shl_9_[19]
      ? prod_68 | p0_super_scale_bf16[5]
      : prod_68 & ~(p0_super_scale_bf16[5]);	// vector_unit.k:279:9, :339:33, :364:17, :365:{17,50}
  wire         prod_91 =
    _prod_plus_ma32_shl_9_[18]
      ? prod_69 | p0_super_scale_bf16[5]
      : prod_69 & ~(p0_super_scale_bf16[5]);	// vector_unit.k:279:9, :339:33, :364:17, :365:{17,50}
  wire         prod_92 =
    _prod_plus_ma32_shl_9_[17]
      ? prod_70 | p0_super_scale_bf16[5]
      : prod_70 & ~(p0_super_scale_bf16[5]);	// vector_unit.k:279:9, :339:33, :364:17, :365:{17,50}
  wire         prod_93 =
    _prod_plus_ma32_shl_9_[16]
      ? prod_71 | p0_super_scale_bf16[5]
      : prod_71 & ~(p0_super_scale_bf16[5]);	// vector_unit.k:279:9, :339:33, :364:17, :365:{17,50}
  wire         prod_94 =
    _prod_plus_ma32_shl_9_[15]
      ? prod_72 | p0_super_scale_bf16[5]
      : prod_72 & ~(p0_super_scale_bf16[5]);	// vector_unit.k:279:9, :339:33, :364:17, :365:{17,50}
  wire         prod_95 =
    _prod_plus_ma32_shl_9_[14]
      ? prod_73 | p0_super_scale_bf16[5]
      : prod_73 & ~(p0_super_scale_bf16[5]);	// vector_unit.k:279:9, :339:33, :364:17, :365:{17,50}
  wire         prod_96 =
    _prod_plus_ma32_shl_9_[13]
      ? prod_74 | p0_super_scale_bf16[5]
      : prod_74 & ~(p0_super_scale_bf16[5]);	// vector_unit.k:279:9, :339:33, :364:17, :365:{17,50}
  wire         prod_97 =
    _prod_plus_ma32_shl_9_[12]
      ? prod_75 | p0_super_scale_bf16[5]
      : prod_75 & ~(p0_super_scale_bf16[5]);	// vector_unit.k:279:9, :339:33, :364:17, :365:{17,50}
  wire         prod_98 =
    _prod_plus_ma32_shl_9_[11]
      ? prod_76 | p0_super_scale_bf16[5]
      : prod_76 & ~(p0_super_scale_bf16[5]);	// vector_unit.k:279:9, :339:33, :364:17, :365:{17,50}
  wire         prod_99 =
    _prod_plus_ma32_shl_9_[10]
      ? prod_77 | p0_super_scale_bf16[5]
      : prod_77 & ~(p0_super_scale_bf16[5]);	// vector_unit.k:279:9, :339:33, :364:17, :365:{17,50}
  wire         prod_100 =
    _prod_plus_ma32_shl_9_[9]
      ? prod_78 | p0_super_scale_bf16[5]
      : prod_78 & ~(p0_super_scale_bf16[5]);	// vector_unit.k:279:9, :339:33, :364:17, :365:{17,50}
  wire         prod_101 =
    _prod_plus_ma32_shl_9_[8]
      ? prod_79 | p0_super_scale_bf16[5]
      : prod_79 & ~(p0_super_scale_bf16[5]);	// vector_unit.k:279:9, :339:33, :364:17, :365:{17,50}
  wire         prod_102 =
    _prod_plus_ma32_shl_9_[7]
      ? prod_80 | p0_super_scale_bf16[5]
      : prod_80 & ~(p0_super_scale_bf16[5]);	// vector_unit.k:279:9, :339:33, :364:17, :365:{17,50}
  wire         prod_103 =
    _prod_plus_ma32_shl_9_[6]
      ? prod_81 | p0_super_scale_bf16[5]
      : prod_81 & ~(p0_super_scale_bf16[5]);	// vector_unit.k:279:9, :339:33, :364:17, :365:{17,50}
  wire         prod_104 =
    _prod_plus_ma32_shl_9_[5]
      ? prod_82 | p0_super_scale_bf16[5]
      : prod_82 & ~(p0_super_scale_bf16[5]);	// vector_unit.k:279:9, :339:33, :364:17, :365:{17,50}
  wire         prod_105 =
    _prod_plus_ma32_shl_9_[4]
      ? prod_83 | p0_super_scale_bf16[5]
      : prod_83 & ~(p0_super_scale_bf16[5]);	// vector_unit.k:279:9, :339:33, :364:17, :365:{17,50}
  wire         prod_106 =
    _prod_plus_ma32_shl_9_[3]
      ? prod_84 | p0_super_scale_bf16[5]
      : prod_84 & ~(p0_super_scale_bf16[5]);	// vector_unit.k:279:9, :339:33, :364:17, :365:{17,50}
  wire         prod_107 =
    _prod_plus_ma32_shl_9_[2]
      ? prod_85 | p0_super_scale_bf16[5]
      : prod_85 & ~(p0_super_scale_bf16[5]);	// vector_unit.k:279:9, :339:33, :364:17, :365:{17,50}
  wire         prod_108 =
    _prod_plus_ma32_shl_9_[1]
      ? prod_86 | p0_super_scale_bf16[5]
      : prod_86 & ~(p0_super_scale_bf16[5]);	// vector_unit.k:279:9, :339:33, :364:17, :365:{17,50}
  wire         prod_109 =
    _prod_plus_ma32_shl_9_[0]
      ? prod_87 | p0_super_scale_bf16[5]
      : prod_87 & ~(p0_super_scale_bf16[5]);	// vector_unit.k:279:9, :339:33, :364:17, :365:{17,50}
  wire  [22:0] _prod_plus_ma32_shl_10_ =
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
         prod_109}
        + {2'h1,
           fp_accum_8,
           fp_accum_9,
           fp_accum_10,
           fp_accum_11,
           fp_accum_12,
           fp_accum_13,
           fp_accum_14,
           fp_accum_15,
           fp_accum_16,
           fp_accum_17,
           fp_accum_18,
           10'h0});	// vector_unit.k:295:13, :306:13, :321:17, :334:{17,31}, :335:{28,43,45}, :365:17, :366:{50,57}
  wire  [22:0] _prod_plus_ma32_shl_11_ =
    23'({_prod_plus_ma32_shl_10_[22] & p0_super_scale_bf16[6],
         _prod_plus_ma32_shl_10_[21]
           ? prod_88 | p0_super_scale_bf16[6]
           : prod_88 & ~(p0_super_scale_bf16[6]),
         _prod_plus_ma32_shl_10_[20]
           ? prod_89 | p0_super_scale_bf16[6]
           : prod_89 & ~(p0_super_scale_bf16[6]),
         _prod_plus_ma32_shl_10_[19]
           ? prod_90 | p0_super_scale_bf16[6]
           : prod_90 & ~(p0_super_scale_bf16[6]),
         _prod_plus_ma32_shl_10_[18]
           ? prod_91 | p0_super_scale_bf16[6]
           : prod_91 & ~(p0_super_scale_bf16[6]),
         _prod_plus_ma32_shl_10_[17]
           ? prod_92 | p0_super_scale_bf16[6]
           : prod_92 & ~(p0_super_scale_bf16[6]),
         _prod_plus_ma32_shl_10_[16]
           ? prod_93 | p0_super_scale_bf16[6]
           : prod_93 & ~(p0_super_scale_bf16[6]),
         _prod_plus_ma32_shl_10_[15]
           ? prod_94 | p0_super_scale_bf16[6]
           : prod_94 & ~(p0_super_scale_bf16[6]),
         _prod_plus_ma32_shl_10_[14]
           ? prod_95 | p0_super_scale_bf16[6]
           : prod_95 & ~(p0_super_scale_bf16[6]),
         _prod_plus_ma32_shl_10_[13]
           ? prod_96 | p0_super_scale_bf16[6]
           : prod_96 & ~(p0_super_scale_bf16[6]),
         _prod_plus_ma32_shl_10_[12]
           ? prod_97 | p0_super_scale_bf16[6]
           : prod_97 & ~(p0_super_scale_bf16[6]),
         _prod_plus_ma32_shl_10_[11]
           ? prod_98 | p0_super_scale_bf16[6]
           : prod_98 & ~(p0_super_scale_bf16[6]),
         _prod_plus_ma32_shl_10_[10]
           ? prod_99 | p0_super_scale_bf16[6]
           : prod_99 & ~(p0_super_scale_bf16[6]),
         _prod_plus_ma32_shl_10_[9]
           ? prod_100 | p0_super_scale_bf16[6]
           : prod_100 & ~(p0_super_scale_bf16[6]),
         _prod_plus_ma32_shl_10_[8]
           ? prod_101 | p0_super_scale_bf16[6]
           : prod_101 & ~(p0_super_scale_bf16[6]),
         _prod_plus_ma32_shl_10_[7]
           ? prod_102 | p0_super_scale_bf16[6]
           : prod_102 & ~(p0_super_scale_bf16[6]),
         _prod_plus_ma32_shl_10_[6]
           ? prod_103 | p0_super_scale_bf16[6]
           : prod_103 & ~(p0_super_scale_bf16[6]),
         _prod_plus_ma32_shl_10_[5]
           ? prod_104 | p0_super_scale_bf16[6]
           : prod_104 & ~(p0_super_scale_bf16[6]),
         _prod_plus_ma32_shl_10_[4]
           ? prod_105 | p0_super_scale_bf16[6]
           : prod_105 & ~(p0_super_scale_bf16[6]),
         _prod_plus_ma32_shl_10_[3]
           ? prod_106 | p0_super_scale_bf16[6]
           : prod_106 & ~(p0_super_scale_bf16[6]),
         _prod_plus_ma32_shl_10_[2]
           ? prod_107 | p0_super_scale_bf16[6]
           : prod_107 & ~(p0_super_scale_bf16[6]),
         _prod_plus_ma32_shl_10_[1]
           ? prod_108 | p0_super_scale_bf16[6]
           : prod_108 & ~(p0_super_scale_bf16[6]),
         _prod_plus_ma32_shl_10_[0]
           ? prod_109 | p0_super_scale_bf16[6]
           : prod_109 & ~(p0_super_scale_bf16[6])}
        + {1'h1,
           fp_accum_8,
           fp_accum_9,
           fp_accum_10,
           fp_accum_11,
           fp_accum_12,
           fp_accum_13,
           fp_accum_14,
           fp_accum_15,
           fp_accum_16,
           fp_accum_17,
           fp_accum_18,
           11'h0});	// vector_unit.k:279:9, :295:13, :306:13, :321:17, :334:{17,31}, :335:{28,43,45}, :339:33, :365:17, :366:{17,50}, :367:{50,57}
  wire         _GEN_39 =
    _a_exp_plus_b_exp_minus_127_ < 32'hFF & (|_a_exp_plus_b_exp_minus_127_);	// vector_unit.k:348:{17,33,34,53}, :349:{32,38}, :367:17, :370:17, :372:{21,30}, :377:{21,30}, :380:{17,21,27,41}, :382:{35,50,52}
  wire         _GEN_40 =
    (|(p0_super_scale_bf16[14:7]))
    & (|{fp_accum_0,
         fp_accum_1,
         fp_accum_2,
         fp_accum_3,
         fp_accum_4,
         fp_accum_5,
         fp_accum_6,
         fp_accum_7});	// vector_unit.k:279:9, :295:13, :306:13, :321:17, :334:{17,31}, :335:{28,43,45}, :342:{13,28}, :343:{13,28}, :346:{13,17,23,37}, :387:35
  always @(posedge clk) begin	// vector_unit.k:279:9
    p0_accum <= data_in_32[23:0];	// vector_unit.k:279:9
    p0_super_scale_bf16 <= data_in_32[39:24];	// vector_unit.k:279:9
    p0_sub_scale <= data_in_32[43:40];	// vector_unit.k:279:9
    if (rst)	// vector_unit.k:279:9
      p0_stage1_enable <= 1'h0;	// vector_unit.k:279:9
    else	// vector_unit.k:279:9
      p0_stage1_enable <= _GEN & input_valid_0;	// vector_unit.k:279:9
    p0_CastSource <=
      {(_a_exp_plus_b_exp_minus_127_[8]
          ? _GEN_39
          : p0_super_scale_bf16[15] ? ~fp_accum & _GEN_39 : fp_accum & _GEN_39) & _GEN_40,
       _a_exp_plus_b_exp_minus_127_[7] & _GEN_39 & _GEN_40,
       _a_exp_plus_b_exp_minus_127_[6] & _GEN_39 & _GEN_40,
       _a_exp_plus_b_exp_minus_127_[5] & _GEN_39 & _GEN_40,
       _a_exp_plus_b_exp_minus_127_[4] & _GEN_39 & _GEN_40,
       _a_exp_plus_b_exp_minus_127_[3] & _GEN_39 & _GEN_40,
       _a_exp_plus_b_exp_minus_127_[2] & _GEN_39 & _GEN_40,
       _a_exp_plus_b_exp_minus_127_[1] & _GEN_39 & _GEN_40,
       _a_exp_plus_b_exp_minus_127_[0] & _GEN_39 & _GEN_40,
       _prod_plus_ma32_shl_11_[22] & _GEN_39 & _GEN_40,
       _prod_plus_ma32_shl_11_[21] & _GEN_39 & _GEN_40,
       _prod_plus_ma32_shl_11_[20] & _GEN_39 & _GEN_40,
       _prod_plus_ma32_shl_11_[19] & _GEN_39 & _GEN_40,
       _prod_plus_ma32_shl_11_[18] & _GEN_39 & _GEN_40,
       _prod_plus_ma32_shl_11_[17] & _GEN_39 & _GEN_40,
       _prod_plus_ma32_shl_11_[16] & _GEN_39 & _GEN_40};	// vector_unit.k:279:9, :295:13, :306:13, :321:17, :334:{17,31}, :335:{28,43,45}, :339:33, :346:{13,17}, :348:{17,33,34,53}, :349:{32,38}, :367:{17,50}, :370:17, :372:{21,30}, :377:{21,30}, :380:{17,21}, :382:{35,50,52}, :387:35
    if (rst)	// vector_unit.k:279:9
      p0_stage2_enable <= 1'h0;	// vector_unit.k:279:9
    else	// vector_unit.k:279:9
      p0_stage2_enable <= p0_stage1_enable;	// vector_unit.k:279:9
    p0_CastSource_0 <= p0_CastSource;	// vector_unit.k:279:9
    if (rst)	// vector_unit.k:279:9
      p0_stage3_enable <= 1'h0;	// vector_unit.k:279:9
    else	// vector_unit.k:279:9
      p0_stage3_enable <= p0_stage2_enable;	// vector_unit.k:279:9
  end // always @(posedge)
  always_comb begin	// vector_unit.k:279:9
    fifo_wren_0_0 = p0_stage3_enable;	// vector_unit.k:277:5, :279:9
    fifo_data_out_0_0 = p0_CastSource_0;	// vector_unit.k:277:5, :279:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// vector_unit.k:279:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// vector_unit.k:279:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  vector_unitDebugView_dequantizeEntry vector_unitDebugView_dequantizeEntry_instance (	// vector_unit.k:277:5
    .clk               (clk),	// vector_unit.k:277:5
    ._accum            (p0_stage1_enable ? p0_accum : 'x),	// vector_unit.k:277:5, :279:9
    ._super_scale_bf16 (p0_stage1_enable ? p0_super_scale_bf16 : 'x),	// vector_unit.k:277:5, :279:9
    ._sub_scale        (p0_stage1_enable ? p0_sub_scale : 'x),	// vector_unit.k:277:5, :279:9
    .valid             (p0_stage1_enable),	// vector_unit.k:279:9
    .valid_out         (/* unused */)
  );	// vector_unit.k:277:5
  vector_unitDebugView_dequantizeExit vector_unitDebugView_dequantizeExit_instance (	// vector_unit.k:277:5
    .clk          (clk),	// vector_unit.k:277:5
    ._ReturnValue (p0_stage2_enable ? p0_CastSource : 'x),	// vector_unit.k:277:5, :279:9
    .valid        (p0_stage2_enable),	// vector_unit.k:279:9
    .valid_out    (/* unused */)
  );	// vector_unit.k:277:5
  assign done_out = p0_stage3_enable;	// vector_unit.k:279:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// vector_unit.k:279:9
  assign fifo_wren_0 = fifo_wren_0_0;	// vector_unit.k:279:9
  assign input_rdy_0 = input_rdy_0_0;	// vector_unit.k:279:9
  assign control_state_out = control_state_out_0;	// vector_unit.k:279:9
endmodule

module vector_unit_swiglu_compute_BasicBlock_0(	// vector_unit.k:186:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  input  wire [15:0] memory_read_data_in_38_0,
  output wire [7:0]  memory_read_addr_out_38_0,
  output wire        memory_rden_out_38_0,
  output wire [15:0] fifo_data_out_0,
  output wire        fifo_wren_0,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [31:0] data_in_31,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  wire  [15:0] memory_read_data_in_38_0_0 = memory_read_data_in_38_0;	// vector_unit.k:186:9
  logic        done_out_0;	// vector_unit.k:186:9
  logic [7:0]  memory_read_addr_out_38_0_0;	// vector_unit.k:186:9
  logic        memory_rden_out_38_0_0;	// vector_unit.k:186:9
  logic [15:0] fifo_data_out_0_0;	// vector_unit.k:186:9
  logic        fifo_wren_0_0;	// vector_unit.k:186:9
  logic        input_rdy_0_0;	// vector_unit.k:186:9
  logic [7:0]  control_state_out_0;	// vector_unit.k:186:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// vector_unit.k:186:9
  always_comb begin	// vector_unit.k:186:9
    input_rdy_0_0 = _GEN;	// vector_unit.k:186:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// vector_unit.k:186:9
  end // always_comb
  reg   [15:0] p0_gate_bf16;	// vector_unit.k:186:9
  reg   [15:0] p0_up_bf16;	// vector_unit.k:186:9
  reg          p0_stage1_enable = 1'h0;	// vector_unit.k:186:9
  always_comb begin	// vector_unit.k:186:9
    memory_read_addr_out_38_0_0 = p0_gate_bf16[15:8];	// vector_unit.k:186:9, :190:39, :191:26
    memory_rden_out_38_0_0 = p0_stage1_enable;	// vector_unit.k:186:9, :191:26
  end // always_comb
  reg   [15:0] p0_gate_bf16_0;	// vector_unit.k:186:9
  reg   [15:0] p0_up_bf16_0;	// vector_unit.k:186:9
  reg          p0_stage2_enable = 1'h0;	// vector_unit.k:186:9
  reg   [15:0] p0_gate_bf16_1;	// vector_unit.k:186:9
  reg   [15:0] p0_up_bf16_1;	// vector_unit.k:186:9
  reg          p0_stage3_enable = 1'h0;	// vector_unit.k:186:9
  reg   [15:0] p0_result;	// vector_unit.k:186:9
  reg          p0_stage4_enable = 1'h0;	// vector_unit.k:186:9
  reg   [15:0] p0_result_0;	// vector_unit.k:186:9
  reg          p0_stage5_enable = 1'h0;	// vector_unit.k:186:9
  wire         prod = p0_gate_bf16_1[6] & memory_read_data_in_38_0_0[0];	// vector_unit.k:186:9, :201:{21,33}, :202:{21,33}, :204:35, :205:{21,25}
  wire         prod_0 = p0_gate_bf16_1[5] & memory_read_data_in_38_0_0[0];	// vector_unit.k:186:9, :201:{21,33}, :202:{21,33}, :204:35, :205:{21,25}
  wire         prod_1 = p0_gate_bf16_1[4] & memory_read_data_in_38_0_0[0];	// vector_unit.k:186:9, :201:{21,33}, :202:{21,33}, :204:35, :205:{21,25}
  wire         prod_2 = p0_gate_bf16_1[3] & memory_read_data_in_38_0_0[0];	// vector_unit.k:186:9, :201:{21,33}, :202:{21,33}, :204:35, :205:{21,25}
  wire         prod_3 = p0_gate_bf16_1[2] & memory_read_data_in_38_0_0[0];	// vector_unit.k:186:9, :201:{21,33}, :202:{21,33}, :204:35, :205:{21,25}
  wire         prod_4 = p0_gate_bf16_1[1] & memory_read_data_in_38_0_0[0];	// vector_unit.k:186:9, :201:{21,33}, :202:{21,33}, :204:35, :205:{21,25}
  wire         prod_5 = p0_gate_bf16_1[0] & memory_read_data_in_38_0_0[0];	// vector_unit.k:186:9, :201:{21,33}, :202:{21,33}, :204:35, :205:{21,25}
  wire  [15:0] _a_exp_plus_b_exp_ =
    16'({8'h0, p0_gate_bf16_1[14:7]} + {8'h0, memory_read_data_in_38_0_0[14:7]});	// vector_unit.k:186:9, :218:39, :223:39
  wire  [9:0]  _prod_plus_ma32_shl_1_ =
    10'({2'h0,
         memory_read_data_in_38_0_0[0],
         prod,
         prod_0,
         prod_1,
         prod_2,
         prod_3,
         prod_4,
         prod_5} + {2'h1, p0_gate_bf16_1[6:0], 1'h0});	// vector_unit.k:186:9, :202:{21,33}, :205:{21,25}, :206:{51,58}
  wire         prod_6 = _prod_plus_ma32_shl_1_[9] & memory_read_data_in_38_0_0[1];	// vector_unit.k:186:9, :202:{21,33}, :206:{21,25,51}
  wire         prod_7 = _prod_plus_ma32_shl_1_[8] & memory_read_data_in_38_0_0[1];	// vector_unit.k:186:9, :202:{21,33}, :206:{21,25,51}
  wire         prod_8 =
    _prod_plus_ma32_shl_1_[7]
      ? memory_read_data_in_38_0_0[0] | memory_read_data_in_38_0_0[1]
      : memory_read_data_in_38_0_0[0] & ~(memory_read_data_in_38_0_0[1]);	// vector_unit.k:186:9, :202:{21,33}, :206:{21,25,51}
  wire         prod_9 =
    _prod_plus_ma32_shl_1_[6]
      ? prod | memory_read_data_in_38_0_0[1]
      : prod & ~(memory_read_data_in_38_0_0[1]);	// vector_unit.k:186:9, :202:{21,33}, :205:{21,25}, :206:{21,25,51}
  wire         prod_10 =
    _prod_plus_ma32_shl_1_[5]
      ? prod_0 | memory_read_data_in_38_0_0[1]
      : prod_0 & ~(memory_read_data_in_38_0_0[1]);	// vector_unit.k:186:9, :202:{21,33}, :205:{21,25}, :206:{21,25,51}
  wire         prod_11 =
    _prod_plus_ma32_shl_1_[4]
      ? prod_1 | memory_read_data_in_38_0_0[1]
      : prod_1 & ~(memory_read_data_in_38_0_0[1]);	// vector_unit.k:186:9, :202:{21,33}, :205:{21,25}, :206:{21,25,51}
  wire         prod_12 =
    _prod_plus_ma32_shl_1_[3]
      ? prod_2 | memory_read_data_in_38_0_0[1]
      : prod_2 & ~(memory_read_data_in_38_0_0[1]);	// vector_unit.k:186:9, :202:{21,33}, :205:{21,25}, :206:{21,25,51}
  wire         prod_13 =
    _prod_plus_ma32_shl_1_[2]
      ? prod_3 | memory_read_data_in_38_0_0[1]
      : prod_3 & ~(memory_read_data_in_38_0_0[1]);	// vector_unit.k:186:9, :202:{21,33}, :205:{21,25}, :206:{21,25,51}
  wire         prod_14 =
    _prod_plus_ma32_shl_1_[1]
      ? prod_4 | memory_read_data_in_38_0_0[1]
      : prod_4 & ~(memory_read_data_in_38_0_0[1]);	// vector_unit.k:186:9, :202:{21,33}, :205:{21,25}, :206:{21,25,51}
  wire         prod_15 =
    _prod_plus_ma32_shl_1_[0]
      ? prod_5 | memory_read_data_in_38_0_0[1]
      : prod_5 & ~(memory_read_data_in_38_0_0[1]);	// vector_unit.k:186:9, :202:{21,33}, :205:{21,25}, :206:{21,25,51}
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
         prod_15} + {2'h1, p0_gate_bf16_1[6:0], 2'h0});	// vector_unit.k:186:9, :206:{21,25}, :207:{51,58}
  wire         prod_16 = _prod_plus_ma32_shl_2_[10] & memory_read_data_in_38_0_0[2];	// vector_unit.k:186:9, :202:{21,33}, :207:{21,25,51}
  wire         prod_17 =
    _prod_plus_ma32_shl_2_[9]
      ? prod_6 | memory_read_data_in_38_0_0[2]
      : prod_6 & ~(memory_read_data_in_38_0_0[2]);	// vector_unit.k:186:9, :202:{21,33}, :206:{21,25}, :207:{21,25,51}
  wire         prod_18 =
    _prod_plus_ma32_shl_2_[8]
      ? prod_7 | memory_read_data_in_38_0_0[2]
      : prod_7 & ~(memory_read_data_in_38_0_0[2]);	// vector_unit.k:186:9, :202:{21,33}, :206:{21,25}, :207:{21,25,51}
  wire         prod_19 =
    _prod_plus_ma32_shl_2_[7]
      ? prod_8 | memory_read_data_in_38_0_0[2]
      : prod_8 & ~(memory_read_data_in_38_0_0[2]);	// vector_unit.k:186:9, :202:{21,33}, :206:{21,25}, :207:{21,25,51}
  wire         prod_20 =
    _prod_plus_ma32_shl_2_[6]
      ? prod_9 | memory_read_data_in_38_0_0[2]
      : prod_9 & ~(memory_read_data_in_38_0_0[2]);	// vector_unit.k:186:9, :202:{21,33}, :206:{21,25}, :207:{21,25,51}
  wire         prod_21 =
    _prod_plus_ma32_shl_2_[5]
      ? prod_10 | memory_read_data_in_38_0_0[2]
      : prod_10 & ~(memory_read_data_in_38_0_0[2]);	// vector_unit.k:186:9, :202:{21,33}, :206:{21,25}, :207:{21,25,51}
  wire         prod_22 =
    _prod_plus_ma32_shl_2_[4]
      ? prod_11 | memory_read_data_in_38_0_0[2]
      : prod_11 & ~(memory_read_data_in_38_0_0[2]);	// vector_unit.k:186:9, :202:{21,33}, :206:{21,25}, :207:{21,25,51}
  wire         prod_23 =
    _prod_plus_ma32_shl_2_[3]
      ? prod_12 | memory_read_data_in_38_0_0[2]
      : prod_12 & ~(memory_read_data_in_38_0_0[2]);	// vector_unit.k:186:9, :202:{21,33}, :206:{21,25}, :207:{21,25,51}
  wire         prod_24 =
    _prod_plus_ma32_shl_2_[2]
      ? prod_13 | memory_read_data_in_38_0_0[2]
      : prod_13 & ~(memory_read_data_in_38_0_0[2]);	// vector_unit.k:186:9, :202:{21,33}, :206:{21,25}, :207:{21,25,51}
  wire         prod_25 =
    _prod_plus_ma32_shl_2_[1]
      ? prod_14 | memory_read_data_in_38_0_0[2]
      : prod_14 & ~(memory_read_data_in_38_0_0[2]);	// vector_unit.k:186:9, :202:{21,33}, :206:{21,25}, :207:{21,25,51}
  wire         prod_26 =
    _prod_plus_ma32_shl_2_[0]
      ? prod_15 | memory_read_data_in_38_0_0[2]
      : prod_15 & ~(memory_read_data_in_38_0_0[2]);	// vector_unit.k:186:9, :202:{21,33}, :206:{21,25}, :207:{21,25,51}
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
         prod_26} + {2'h1, p0_gate_bf16_1[6:0], 3'h0});	// vector_unit.k:186:9, :207:{21,25}, :208:{51,58}
  wire         prod_27 = _prod_plus_ma32_shl_3_[11] & memory_read_data_in_38_0_0[3];	// vector_unit.k:186:9, :202:{21,33}, :208:{21,25,51}
  wire         prod_28 =
    _prod_plus_ma32_shl_3_[10]
      ? prod_16 | memory_read_data_in_38_0_0[3]
      : prod_16 & ~(memory_read_data_in_38_0_0[3]);	// vector_unit.k:186:9, :202:{21,33}, :207:{21,25}, :208:{21,25,51}
  wire         prod_29 =
    _prod_plus_ma32_shl_3_[9]
      ? prod_17 | memory_read_data_in_38_0_0[3]
      : prod_17 & ~(memory_read_data_in_38_0_0[3]);	// vector_unit.k:186:9, :202:{21,33}, :207:{21,25}, :208:{21,25,51}
  wire         prod_30 =
    _prod_plus_ma32_shl_3_[8]
      ? prod_18 | memory_read_data_in_38_0_0[3]
      : prod_18 & ~(memory_read_data_in_38_0_0[3]);	// vector_unit.k:186:9, :202:{21,33}, :207:{21,25}, :208:{21,25,51}
  wire         prod_31 =
    _prod_plus_ma32_shl_3_[7]
      ? prod_19 | memory_read_data_in_38_0_0[3]
      : prod_19 & ~(memory_read_data_in_38_0_0[3]);	// vector_unit.k:186:9, :202:{21,33}, :207:{21,25}, :208:{21,25,51}
  wire         prod_32 =
    _prod_plus_ma32_shl_3_[6]
      ? prod_20 | memory_read_data_in_38_0_0[3]
      : prod_20 & ~(memory_read_data_in_38_0_0[3]);	// vector_unit.k:186:9, :202:{21,33}, :207:{21,25}, :208:{21,25,51}
  wire         prod_33 =
    _prod_plus_ma32_shl_3_[5]
      ? prod_21 | memory_read_data_in_38_0_0[3]
      : prod_21 & ~(memory_read_data_in_38_0_0[3]);	// vector_unit.k:186:9, :202:{21,33}, :207:{21,25}, :208:{21,25,51}
  wire         prod_34 =
    _prod_plus_ma32_shl_3_[4]
      ? prod_22 | memory_read_data_in_38_0_0[3]
      : prod_22 & ~(memory_read_data_in_38_0_0[3]);	// vector_unit.k:186:9, :202:{21,33}, :207:{21,25}, :208:{21,25,51}
  wire         prod_35 =
    _prod_plus_ma32_shl_3_[3]
      ? prod_23 | memory_read_data_in_38_0_0[3]
      : prod_23 & ~(memory_read_data_in_38_0_0[3]);	// vector_unit.k:186:9, :202:{21,33}, :207:{21,25}, :208:{21,25,51}
  wire         prod_36 =
    _prod_plus_ma32_shl_3_[2]
      ? prod_24 | memory_read_data_in_38_0_0[3]
      : prod_24 & ~(memory_read_data_in_38_0_0[3]);	// vector_unit.k:186:9, :202:{21,33}, :207:{21,25}, :208:{21,25,51}
  wire         prod_37 =
    _prod_plus_ma32_shl_3_[1]
      ? prod_25 | memory_read_data_in_38_0_0[3]
      : prod_25 & ~(memory_read_data_in_38_0_0[3]);	// vector_unit.k:186:9, :202:{21,33}, :207:{21,25}, :208:{21,25,51}
  wire         prod_38 =
    _prod_plus_ma32_shl_3_[0]
      ? prod_26 | memory_read_data_in_38_0_0[3]
      : prod_26 & ~(memory_read_data_in_38_0_0[3]);	// vector_unit.k:186:9, :202:{21,33}, :207:{21,25}, :208:{21,25,51}
  wire  [12:0] _prod_plus_ma32_shl_4_ =
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
         prod_38} + {2'h1, p0_gate_bf16_1[6:0], 4'h0});	// vector_unit.k:186:9, :208:{21,25}, :209:{51,58}
  wire         prod_39 = _prod_plus_ma32_shl_4_[12] & memory_read_data_in_38_0_0[4];	// vector_unit.k:186:9, :202:{21,33}, :209:{21,25,51}
  wire         prod_40 =
    _prod_plus_ma32_shl_4_[11]
      ? prod_27 | memory_read_data_in_38_0_0[4]
      : prod_27 & ~(memory_read_data_in_38_0_0[4]);	// vector_unit.k:186:9, :202:{21,33}, :208:{21,25}, :209:{21,25,51}
  wire         prod_41 =
    _prod_plus_ma32_shl_4_[10]
      ? prod_28 | memory_read_data_in_38_0_0[4]
      : prod_28 & ~(memory_read_data_in_38_0_0[4]);	// vector_unit.k:186:9, :202:{21,33}, :208:{21,25}, :209:{21,25,51}
  wire         prod_42 =
    _prod_plus_ma32_shl_4_[9]
      ? prod_29 | memory_read_data_in_38_0_0[4]
      : prod_29 & ~(memory_read_data_in_38_0_0[4]);	// vector_unit.k:186:9, :202:{21,33}, :208:{21,25}, :209:{21,25,51}
  wire         prod_43 =
    _prod_plus_ma32_shl_4_[8]
      ? prod_30 | memory_read_data_in_38_0_0[4]
      : prod_30 & ~(memory_read_data_in_38_0_0[4]);	// vector_unit.k:186:9, :202:{21,33}, :208:{21,25}, :209:{21,25,51}
  wire         prod_44 =
    _prod_plus_ma32_shl_4_[7]
      ? prod_31 | memory_read_data_in_38_0_0[4]
      : prod_31 & ~(memory_read_data_in_38_0_0[4]);	// vector_unit.k:186:9, :202:{21,33}, :208:{21,25}, :209:{21,25,51}
  wire         prod_45 =
    _prod_plus_ma32_shl_4_[6]
      ? prod_32 | memory_read_data_in_38_0_0[4]
      : prod_32 & ~(memory_read_data_in_38_0_0[4]);	// vector_unit.k:186:9, :202:{21,33}, :208:{21,25}, :209:{21,25,51}
  wire         prod_46 =
    _prod_plus_ma32_shl_4_[5]
      ? prod_33 | memory_read_data_in_38_0_0[4]
      : prod_33 & ~(memory_read_data_in_38_0_0[4]);	// vector_unit.k:186:9, :202:{21,33}, :208:{21,25}, :209:{21,25,51}
  wire         prod_47 =
    _prod_plus_ma32_shl_4_[4]
      ? prod_34 | memory_read_data_in_38_0_0[4]
      : prod_34 & ~(memory_read_data_in_38_0_0[4]);	// vector_unit.k:186:9, :202:{21,33}, :208:{21,25}, :209:{21,25,51}
  wire         prod_48 =
    _prod_plus_ma32_shl_4_[3]
      ? prod_35 | memory_read_data_in_38_0_0[4]
      : prod_35 & ~(memory_read_data_in_38_0_0[4]);	// vector_unit.k:186:9, :202:{21,33}, :208:{21,25}, :209:{21,25,51}
  wire         prod_49 =
    _prod_plus_ma32_shl_4_[2]
      ? prod_36 | memory_read_data_in_38_0_0[4]
      : prod_36 & ~(memory_read_data_in_38_0_0[4]);	// vector_unit.k:186:9, :202:{21,33}, :208:{21,25}, :209:{21,25,51}
  wire         prod_50 =
    _prod_plus_ma32_shl_4_[1]
      ? prod_37 | memory_read_data_in_38_0_0[4]
      : prod_37 & ~(memory_read_data_in_38_0_0[4]);	// vector_unit.k:186:9, :202:{21,33}, :208:{21,25}, :209:{21,25,51}
  wire         prod_51 =
    _prod_plus_ma32_shl_4_[0]
      ? prod_38 | memory_read_data_in_38_0_0[4]
      : prod_38 & ~(memory_read_data_in_38_0_0[4]);	// vector_unit.k:186:9, :202:{21,33}, :208:{21,25}, :209:{21,25,51}
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
         prod_51} + {2'h1, p0_gate_bf16_1[6:0], 5'h0});	// vector_unit.k:186:9, :209:{21,25}, :210:{51,58}
  wire         prod_52 = _prod_plus_ma32_shl_5_[13] & memory_read_data_in_38_0_0[5];	// vector_unit.k:186:9, :202:{21,33}, :210:{21,25,51}
  wire         prod_53 =
    _prod_plus_ma32_shl_5_[12]
      ? prod_39 | memory_read_data_in_38_0_0[5]
      : prod_39 & ~(memory_read_data_in_38_0_0[5]);	// vector_unit.k:186:9, :202:{21,33}, :209:{21,25}, :210:{21,25,51}
  wire         prod_54 =
    _prod_plus_ma32_shl_5_[11]
      ? prod_40 | memory_read_data_in_38_0_0[5]
      : prod_40 & ~(memory_read_data_in_38_0_0[5]);	// vector_unit.k:186:9, :202:{21,33}, :209:{21,25}, :210:{21,25,51}
  wire         prod_55 =
    _prod_plus_ma32_shl_5_[10]
      ? prod_41 | memory_read_data_in_38_0_0[5]
      : prod_41 & ~(memory_read_data_in_38_0_0[5]);	// vector_unit.k:186:9, :202:{21,33}, :209:{21,25}, :210:{21,25,51}
  wire         prod_56 =
    _prod_plus_ma32_shl_5_[9]
      ? prod_42 | memory_read_data_in_38_0_0[5]
      : prod_42 & ~(memory_read_data_in_38_0_0[5]);	// vector_unit.k:186:9, :202:{21,33}, :209:{21,25}, :210:{21,25,51}
  wire         prod_57 =
    _prod_plus_ma32_shl_5_[8]
      ? prod_43 | memory_read_data_in_38_0_0[5]
      : prod_43 & ~(memory_read_data_in_38_0_0[5]);	// vector_unit.k:186:9, :202:{21,33}, :209:{21,25}, :210:{21,25,51}
  wire         prod_58 =
    _prod_plus_ma32_shl_5_[7]
      ? prod_44 | memory_read_data_in_38_0_0[5]
      : prod_44 & ~(memory_read_data_in_38_0_0[5]);	// vector_unit.k:186:9, :202:{21,33}, :209:{21,25}, :210:{21,25,51}
  wire         prod_59 =
    _prod_plus_ma32_shl_5_[6]
      ? prod_45 | memory_read_data_in_38_0_0[5]
      : prod_45 & ~(memory_read_data_in_38_0_0[5]);	// vector_unit.k:186:9, :202:{21,33}, :209:{21,25}, :210:{21,25,51}
  wire         prod_60 =
    _prod_plus_ma32_shl_5_[5]
      ? prod_46 | memory_read_data_in_38_0_0[5]
      : prod_46 & ~(memory_read_data_in_38_0_0[5]);	// vector_unit.k:186:9, :202:{21,33}, :209:{21,25}, :210:{21,25,51}
  wire         prod_61 =
    _prod_plus_ma32_shl_5_[4]
      ? prod_47 | memory_read_data_in_38_0_0[5]
      : prod_47 & ~(memory_read_data_in_38_0_0[5]);	// vector_unit.k:186:9, :202:{21,33}, :209:{21,25}, :210:{21,25,51}
  wire         prod_62 =
    _prod_plus_ma32_shl_5_[3]
      ? prod_48 | memory_read_data_in_38_0_0[5]
      : prod_48 & ~(memory_read_data_in_38_0_0[5]);	// vector_unit.k:186:9, :202:{21,33}, :209:{21,25}, :210:{21,25,51}
  wire         prod_63 =
    _prod_plus_ma32_shl_5_[2]
      ? prod_49 | memory_read_data_in_38_0_0[5]
      : prod_49 & ~(memory_read_data_in_38_0_0[5]);	// vector_unit.k:186:9, :202:{21,33}, :209:{21,25}, :210:{21,25,51}
  wire         prod_64 =
    _prod_plus_ma32_shl_5_[1]
      ? prod_50 | memory_read_data_in_38_0_0[5]
      : prod_50 & ~(memory_read_data_in_38_0_0[5]);	// vector_unit.k:186:9, :202:{21,33}, :209:{21,25}, :210:{21,25,51}
  wire         prod_65 =
    _prod_plus_ma32_shl_5_[0]
      ? prod_51 | memory_read_data_in_38_0_0[5]
      : prod_51 & ~(memory_read_data_in_38_0_0[5]);	// vector_unit.k:186:9, :202:{21,33}, :209:{21,25}, :210:{21,25,51}
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
         prod_65} + {2'h1, p0_gate_bf16_1[6:0], 6'h0});	// vector_unit.k:186:9, :210:{21,25}, :211:{51,58}
  wire  [15:0] _prod_plus_ma32_shl_7_ =
    16'({1'h0,
         _prod_plus_ma32_shl_6_[14] & memory_read_data_in_38_0_0[6],
         _prod_plus_ma32_shl_6_[13]
           ? prod_52 | memory_read_data_in_38_0_0[6]
           : prod_52 & ~(memory_read_data_in_38_0_0[6]),
         _prod_plus_ma32_shl_6_[12]
           ? prod_53 | memory_read_data_in_38_0_0[6]
           : prod_53 & ~(memory_read_data_in_38_0_0[6]),
         _prod_plus_ma32_shl_6_[11]
           ? prod_54 | memory_read_data_in_38_0_0[6]
           : prod_54 & ~(memory_read_data_in_38_0_0[6]),
         _prod_plus_ma32_shl_6_[10]
           ? prod_55 | memory_read_data_in_38_0_0[6]
           : prod_55 & ~(memory_read_data_in_38_0_0[6]),
         _prod_plus_ma32_shl_6_[9]
           ? prod_56 | memory_read_data_in_38_0_0[6]
           : prod_56 & ~(memory_read_data_in_38_0_0[6]),
         _prod_plus_ma32_shl_6_[8]
           ? prod_57 | memory_read_data_in_38_0_0[6]
           : prod_57 & ~(memory_read_data_in_38_0_0[6]),
         _prod_plus_ma32_shl_6_[7]
           ? prod_58 | memory_read_data_in_38_0_0[6]
           : prod_58 & ~(memory_read_data_in_38_0_0[6]),
         _prod_plus_ma32_shl_6_[6]
           ? prod_59 | memory_read_data_in_38_0_0[6]
           : prod_59 & ~(memory_read_data_in_38_0_0[6]),
         _prod_plus_ma32_shl_6_[5]
           ? prod_60 | memory_read_data_in_38_0_0[6]
           : prod_60 & ~(memory_read_data_in_38_0_0[6]),
         _prod_plus_ma32_shl_6_[4]
           ? prod_61 | memory_read_data_in_38_0_0[6]
           : prod_61 & ~(memory_read_data_in_38_0_0[6]),
         _prod_plus_ma32_shl_6_[3]
           ? prod_62 | memory_read_data_in_38_0_0[6]
           : prod_62 & ~(memory_read_data_in_38_0_0[6]),
         _prod_plus_ma32_shl_6_[2]
           ? prod_63 | memory_read_data_in_38_0_0[6]
           : prod_63 & ~(memory_read_data_in_38_0_0[6]),
         _prod_plus_ma32_shl_6_[1]
           ? prod_64 | memory_read_data_in_38_0_0[6]
           : prod_64 & ~(memory_read_data_in_38_0_0[6]),
         _prod_plus_ma32_shl_6_[0]
           ? prod_65 | memory_read_data_in_38_0_0[6]
           : prod_65 & ~(memory_read_data_in_38_0_0[6])}
        + {2'h1, p0_gate_bf16_1[6:0], 7'h0});	// vector_unit.k:186:9, :202:{21,33}, :210:{21,25}, :211:{21,51}, :212:{51,58}
  wire  [15:0] r_exp =
    _prod_plus_ma32_shl_7_[15]
      ? 16'(_a_exp_plus_b_exp_ - 16'h7E)
      : 16'(_a_exp_plus_b_exp_ - 16'h7F);	// vector_unit.k:212:{21,51}, :215:21, :218:{33,39,47}, :223:{33,39}
  wire         _GEN_0 = r_exp < 16'hFF & (|r_exp);	// vector_unit.k:200:{21,37,38,58}, :215:21, :217:{34,47}, :222:{34,47}, :225:{21,25,31,44}, :227:{32,47,49}
  wire         _GEN_1 = ~(_prod_plus_ma32_shl_7_[15]) & _GEN_0;	// vector_unit.k:200:{21,37,38,58}, :212:{21,51}, :215:21, :217:{34,47}, :222:{34,47}, :225:{21,25}, :227:{32,47,49}
  wire         _GEN_2 = (|(memory_read_data_in_38_0_0[14:7])) & (|(p0_gate_bf16_1[14:7]));	// vector_unit.k:186:9, :196:{17,32}, :197:{17,32}, :198:{17,21,27,41}
  wire         silu =
    (r_exp[8]
       ? _GEN_0
       : memory_read_data_in_38_0_0[15]
           ? ~(p0_gate_bf16_1[15]) & _GEN_0
           : p0_gate_bf16_1[15] & _GEN_0) & _GEN_2;	// vector_unit.k:186:9, :198:{17,21}, :200:{21,37,38,58}, :215:21, :217:{34,47}, :222:{34,47}, :225:{21,25}, :227:{32,47,49}
  wire         silu_0 = r_exp[7] & _GEN_0 & _GEN_2;	// vector_unit.k:198:{17,21}, :200:{21,37,38,58}, :215:21, :217:{34,47}, :222:{34,47}, :225:{21,25}, :227:{32,47,49}
  wire         silu_1 = r_exp[6] & _GEN_0 & _GEN_2;	// vector_unit.k:198:{17,21}, :200:{21,37,38,58}, :215:21, :217:{34,47}, :222:{34,47}, :225:{21,25}, :227:{32,47,49}
  wire         silu_2 = r_exp[5] & _GEN_0 & _GEN_2;	// vector_unit.k:198:{17,21}, :200:{21,37,38,58}, :215:21, :217:{34,47}, :222:{34,47}, :225:{21,25}, :227:{32,47,49}
  wire         silu_3 = r_exp[4] & _GEN_0 & _GEN_2;	// vector_unit.k:198:{17,21}, :200:{21,37,38,58}, :215:21, :217:{34,47}, :222:{34,47}, :225:{21,25}, :227:{32,47,49}
  wire         silu_4 = r_exp[3] & _GEN_0 & _GEN_2;	// vector_unit.k:198:{17,21}, :200:{21,37,38,58}, :215:21, :217:{34,47}, :222:{34,47}, :225:{21,25}, :227:{32,47,49}
  wire         silu_5 = r_exp[2] & _GEN_0 & _GEN_2;	// vector_unit.k:198:{17,21}, :200:{21,37,38,58}, :215:21, :217:{34,47}, :222:{34,47}, :225:{21,25}, :227:{32,47,49}
  wire         silu_6 = r_exp[1] & _GEN_0 & _GEN_2;	// vector_unit.k:198:{17,21}, :200:{21,37,38,58}, :215:21, :217:{34,47}, :222:{34,47}, :225:{21,25}, :227:{32,47,49}
  wire         silu_7 = r_exp[0] & _GEN_0 & _GEN_2;	// vector_unit.k:198:{17,21}, :200:{21,37,38,58}, :215:21, :217:{34,47}, :222:{34,47}, :225:{21,25}, :227:{32,47,49}
  wire         silu_8 =
    (_prod_plus_ma32_shl_7_[14]
       ? (_prod_plus_ma32_shl_7_[13] | _prod_plus_ma32_shl_7_[15]) & _GEN_0
       : _prod_plus_ma32_shl_7_[13] & _GEN_1) & _GEN_2;	// vector_unit.k:198:{17,21}, :200:{21,37,38,58}, :212:{21,51}, :215:21, :217:{34,47}, :222:{34,47}, :225:{21,25}, :227:{32,47,49}
  wire         silu_9 =
    (_prod_plus_ma32_shl_7_[13]
       ? (_prod_plus_ma32_shl_7_[12] | _prod_plus_ma32_shl_7_[15]) & _GEN_0
       : _prod_plus_ma32_shl_7_[12] & _GEN_1) & _GEN_2;	// vector_unit.k:198:{17,21}, :200:{21,37,38,58}, :212:{21,51}, :215:21, :217:{34,47}, :222:{34,47}, :225:{21,25}, :227:{32,47,49}
  wire         silu_10 =
    (_prod_plus_ma32_shl_7_[12]
       ? (_prod_plus_ma32_shl_7_[11] | _prod_plus_ma32_shl_7_[15]) & _GEN_0
       : _prod_plus_ma32_shl_7_[11] & _GEN_1) & _GEN_2;	// vector_unit.k:198:{17,21}, :200:{21,37,38,58}, :212:{21,51}, :215:21, :217:{34,47}, :222:{34,47}, :225:{21,25}, :227:{32,47,49}
  wire         silu_11 =
    (_prod_plus_ma32_shl_7_[11]
       ? (_prod_plus_ma32_shl_7_[10] | _prod_plus_ma32_shl_7_[15]) & _GEN_0
       : _prod_plus_ma32_shl_7_[10] & _GEN_1) & _GEN_2;	// vector_unit.k:198:{17,21}, :200:{21,37,38,58}, :212:{21,51}, :215:21, :217:{34,47}, :222:{34,47}, :225:{21,25}, :227:{32,47,49}
  wire         silu_12 =
    (_prod_plus_ma32_shl_7_[10]
       ? (_prod_plus_ma32_shl_7_[9] | _prod_plus_ma32_shl_7_[15]) & _GEN_0
       : _prod_plus_ma32_shl_7_[9] & _GEN_1) & _GEN_2;	// vector_unit.k:198:{17,21}, :200:{21,37,38,58}, :212:{21,51}, :215:21, :217:{34,47}, :222:{34,47}, :225:{21,25}, :227:{32,47,49}
  wire         silu_13 =
    (_prod_plus_ma32_shl_7_[9]
       ? (_prod_plus_ma32_shl_7_[8] | _prod_plus_ma32_shl_7_[15]) & _GEN_0
       : _prod_plus_ma32_shl_7_[8] & _GEN_1) & _GEN_2;	// vector_unit.k:198:{17,21}, :200:{21,37,38,58}, :212:{21,51}, :215:21, :217:{34,47}, :222:{34,47}, :225:{21,25}, :227:{32,47,49}
  wire         silu_14 =
    (_prod_plus_ma32_shl_7_[8]
       ? (_prod_plus_ma32_shl_7_[7] | _prod_plus_ma32_shl_7_[15]) & _GEN_0
       : _prod_plus_ma32_shl_7_[7] & _GEN_1) & _GEN_2;	// vector_unit.k:198:{17,21}, :200:{21,37,38,58}, :212:{21,51}, :215:21, :217:{34,47}, :222:{34,47}, :225:{21,25}, :227:{32,47,49}
  wire         prod_66 = silu_8 & p0_up_bf16_1[0];	// vector_unit.k:186:9, :198:{17,21}, :241:{21,33}, :244:{21,25}
  wire         prod_67 = silu_9 & p0_up_bf16_1[0];	// vector_unit.k:186:9, :198:{17,21}, :241:{21,33}, :244:{21,25}
  wire         prod_68 = silu_10 & p0_up_bf16_1[0];	// vector_unit.k:186:9, :198:{17,21}, :241:{21,33}, :244:{21,25}
  wire         prod_69 = silu_11 & p0_up_bf16_1[0];	// vector_unit.k:186:9, :198:{17,21}, :241:{21,33}, :244:{21,25}
  wire         prod_70 = silu_12 & p0_up_bf16_1[0];	// vector_unit.k:186:9, :198:{17,21}, :241:{21,33}, :244:{21,25}
  wire         prod_71 = silu_13 & p0_up_bf16_1[0];	// vector_unit.k:186:9, :198:{17,21}, :241:{21,33}, :244:{21,25}
  wire         prod_72 = silu_14 & p0_up_bf16_1[0];	// vector_unit.k:186:9, :198:{17,21}, :241:{21,33}, :244:{21,25}
  wire  [15:0] _a_exp_plus_b_exp__0 =
    16'({8'h0, silu_0, silu_1, silu_2, silu_3, silu_4, silu_5, silu_6, silu_7}
        + {8'h0, p0_up_bf16_1[14:7]});	// vector_unit.k:186:9, :198:{17,21}, :200:{21,37,38,58}, :215:21, :217:{34,47}, :222:{34,47}, :225:{21,25}, :227:{32,47,49}, :257:39, :262:39
  wire  [9:0]  _prod_plus_ma32_shl_1__0 =
    10'({2'h0,
         p0_up_bf16_1[0],
         prod_66,
         prod_67,
         prod_68,
         prod_69,
         prod_70,
         prod_71,
         prod_72}
        + {2'h1, silu_8, silu_9, silu_10, silu_11, silu_12, silu_13, silu_14, 1'h0});	// vector_unit.k:186:9, :198:{17,21}, :241:{21,33}, :244:{21,25}, :245:{51,58}
  wire         prod_73 = _prod_plus_ma32_shl_1__0[9] & p0_up_bf16_1[1];	// vector_unit.k:186:9, :241:{21,33}, :245:{21,25,51}
  wire         prod_74 = _prod_plus_ma32_shl_1__0[8] & p0_up_bf16_1[1];	// vector_unit.k:186:9, :241:{21,33}, :245:{21,25,51}
  wire         prod_75 =
    _prod_plus_ma32_shl_1__0[7]
      ? p0_up_bf16_1[0] | p0_up_bf16_1[1]
      : p0_up_bf16_1[0] & ~(p0_up_bf16_1[1]);	// vector_unit.k:186:9, :241:{21,33}, :245:{21,25,51}
  wire         prod_76 =
    _prod_plus_ma32_shl_1__0[6]
      ? prod_66 | p0_up_bf16_1[1]
      : prod_66 & ~(p0_up_bf16_1[1]);	// vector_unit.k:186:9, :241:{21,33}, :244:{21,25}, :245:{21,25,51}
  wire         prod_77 =
    _prod_plus_ma32_shl_1__0[5]
      ? prod_67 | p0_up_bf16_1[1]
      : prod_67 & ~(p0_up_bf16_1[1]);	// vector_unit.k:186:9, :241:{21,33}, :244:{21,25}, :245:{21,25,51}
  wire         prod_78 =
    _prod_plus_ma32_shl_1__0[4]
      ? prod_68 | p0_up_bf16_1[1]
      : prod_68 & ~(p0_up_bf16_1[1]);	// vector_unit.k:186:9, :241:{21,33}, :244:{21,25}, :245:{21,25,51}
  wire         prod_79 =
    _prod_plus_ma32_shl_1__0[3]
      ? prod_69 | p0_up_bf16_1[1]
      : prod_69 & ~(p0_up_bf16_1[1]);	// vector_unit.k:186:9, :241:{21,33}, :244:{21,25}, :245:{21,25,51}
  wire         prod_80 =
    _prod_plus_ma32_shl_1__0[2]
      ? prod_70 | p0_up_bf16_1[1]
      : prod_70 & ~(p0_up_bf16_1[1]);	// vector_unit.k:186:9, :241:{21,33}, :244:{21,25}, :245:{21,25,51}
  wire         prod_81 =
    _prod_plus_ma32_shl_1__0[1]
      ? prod_71 | p0_up_bf16_1[1]
      : prod_71 & ~(p0_up_bf16_1[1]);	// vector_unit.k:186:9, :241:{21,33}, :244:{21,25}, :245:{21,25,51}
  wire         prod_82 =
    _prod_plus_ma32_shl_1__0[0]
      ? prod_72 | p0_up_bf16_1[1]
      : prod_72 & ~(p0_up_bf16_1[1]);	// vector_unit.k:186:9, :241:{21,33}, :244:{21,25}, :245:{21,25,51}
  wire  [10:0] _prod_plus_ma32_shl_2__0 =
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
        + {2'h1, silu_8, silu_9, silu_10, silu_11, silu_12, silu_13, silu_14, 2'h0});	// vector_unit.k:198:{17,21}, :245:{21,25}, :246:{51,58}
  wire         prod_83 = _prod_plus_ma32_shl_2__0[10] & p0_up_bf16_1[2];	// vector_unit.k:186:9, :241:{21,33}, :246:{21,25,51}
  wire         prod_84 =
    _prod_plus_ma32_shl_2__0[9]
      ? prod_73 | p0_up_bf16_1[2]
      : prod_73 & ~(p0_up_bf16_1[2]);	// vector_unit.k:186:9, :241:{21,33}, :245:{21,25}, :246:{21,25,51}
  wire         prod_85 =
    _prod_plus_ma32_shl_2__0[8]
      ? prod_74 | p0_up_bf16_1[2]
      : prod_74 & ~(p0_up_bf16_1[2]);	// vector_unit.k:186:9, :241:{21,33}, :245:{21,25}, :246:{21,25,51}
  wire         prod_86 =
    _prod_plus_ma32_shl_2__0[7]
      ? prod_75 | p0_up_bf16_1[2]
      : prod_75 & ~(p0_up_bf16_1[2]);	// vector_unit.k:186:9, :241:{21,33}, :245:{21,25}, :246:{21,25,51}
  wire         prod_87 =
    _prod_plus_ma32_shl_2__0[6]
      ? prod_76 | p0_up_bf16_1[2]
      : prod_76 & ~(p0_up_bf16_1[2]);	// vector_unit.k:186:9, :241:{21,33}, :245:{21,25}, :246:{21,25,51}
  wire         prod_88 =
    _prod_plus_ma32_shl_2__0[5]
      ? prod_77 | p0_up_bf16_1[2]
      : prod_77 & ~(p0_up_bf16_1[2]);	// vector_unit.k:186:9, :241:{21,33}, :245:{21,25}, :246:{21,25,51}
  wire         prod_89 =
    _prod_plus_ma32_shl_2__0[4]
      ? prod_78 | p0_up_bf16_1[2]
      : prod_78 & ~(p0_up_bf16_1[2]);	// vector_unit.k:186:9, :241:{21,33}, :245:{21,25}, :246:{21,25,51}
  wire         prod_90 =
    _prod_plus_ma32_shl_2__0[3]
      ? prod_79 | p0_up_bf16_1[2]
      : prod_79 & ~(p0_up_bf16_1[2]);	// vector_unit.k:186:9, :241:{21,33}, :245:{21,25}, :246:{21,25,51}
  wire         prod_91 =
    _prod_plus_ma32_shl_2__0[2]
      ? prod_80 | p0_up_bf16_1[2]
      : prod_80 & ~(p0_up_bf16_1[2]);	// vector_unit.k:186:9, :241:{21,33}, :245:{21,25}, :246:{21,25,51}
  wire         prod_92 =
    _prod_plus_ma32_shl_2__0[1]
      ? prod_81 | p0_up_bf16_1[2]
      : prod_81 & ~(p0_up_bf16_1[2]);	// vector_unit.k:186:9, :241:{21,33}, :245:{21,25}, :246:{21,25,51}
  wire         prod_93 =
    _prod_plus_ma32_shl_2__0[0]
      ? prod_82 | p0_up_bf16_1[2]
      : prod_82 & ~(p0_up_bf16_1[2]);	// vector_unit.k:186:9, :241:{21,33}, :245:{21,25}, :246:{21,25,51}
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
         prod_93}
        + {2'h1, silu_8, silu_9, silu_10, silu_11, silu_12, silu_13, silu_14, 3'h0});	// vector_unit.k:198:{17,21}, :246:{21,25}, :247:{51,58}
  wire         prod_94 = _prod_plus_ma32_shl_3__0[11] & p0_up_bf16_1[3];	// vector_unit.k:186:9, :241:{21,33}, :247:{21,25,51}
  wire         prod_95 =
    _prod_plus_ma32_shl_3__0[10]
      ? prod_83 | p0_up_bf16_1[3]
      : prod_83 & ~(p0_up_bf16_1[3]);	// vector_unit.k:186:9, :241:{21,33}, :246:{21,25}, :247:{21,25,51}
  wire         prod_96 =
    _prod_plus_ma32_shl_3__0[9]
      ? prod_84 | p0_up_bf16_1[3]
      : prod_84 & ~(p0_up_bf16_1[3]);	// vector_unit.k:186:9, :241:{21,33}, :246:{21,25}, :247:{21,25,51}
  wire         prod_97 =
    _prod_plus_ma32_shl_3__0[8]
      ? prod_85 | p0_up_bf16_1[3]
      : prod_85 & ~(p0_up_bf16_1[3]);	// vector_unit.k:186:9, :241:{21,33}, :246:{21,25}, :247:{21,25,51}
  wire         prod_98 =
    _prod_plus_ma32_shl_3__0[7]
      ? prod_86 | p0_up_bf16_1[3]
      : prod_86 & ~(p0_up_bf16_1[3]);	// vector_unit.k:186:9, :241:{21,33}, :246:{21,25}, :247:{21,25,51}
  wire         prod_99 =
    _prod_plus_ma32_shl_3__0[6]
      ? prod_87 | p0_up_bf16_1[3]
      : prod_87 & ~(p0_up_bf16_1[3]);	// vector_unit.k:186:9, :241:{21,33}, :246:{21,25}, :247:{21,25,51}
  wire         prod_100 =
    _prod_plus_ma32_shl_3__0[5]
      ? prod_88 | p0_up_bf16_1[3]
      : prod_88 & ~(p0_up_bf16_1[3]);	// vector_unit.k:186:9, :241:{21,33}, :246:{21,25}, :247:{21,25,51}
  wire         prod_101 =
    _prod_plus_ma32_shl_3__0[4]
      ? prod_89 | p0_up_bf16_1[3]
      : prod_89 & ~(p0_up_bf16_1[3]);	// vector_unit.k:186:9, :241:{21,33}, :246:{21,25}, :247:{21,25,51}
  wire         prod_102 =
    _prod_plus_ma32_shl_3__0[3]
      ? prod_90 | p0_up_bf16_1[3]
      : prod_90 & ~(p0_up_bf16_1[3]);	// vector_unit.k:186:9, :241:{21,33}, :246:{21,25}, :247:{21,25,51}
  wire         prod_103 =
    _prod_plus_ma32_shl_3__0[2]
      ? prod_91 | p0_up_bf16_1[3]
      : prod_91 & ~(p0_up_bf16_1[3]);	// vector_unit.k:186:9, :241:{21,33}, :246:{21,25}, :247:{21,25,51}
  wire         prod_104 =
    _prod_plus_ma32_shl_3__0[1]
      ? prod_92 | p0_up_bf16_1[3]
      : prod_92 & ~(p0_up_bf16_1[3]);	// vector_unit.k:186:9, :241:{21,33}, :246:{21,25}, :247:{21,25,51}
  wire         prod_105 =
    _prod_plus_ma32_shl_3__0[0]
      ? prod_93 | p0_up_bf16_1[3]
      : prod_93 & ~(p0_up_bf16_1[3]);	// vector_unit.k:186:9, :241:{21,33}, :246:{21,25}, :247:{21,25,51}
  wire  [12:0] _prod_plus_ma32_shl_4__0 =
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
         prod_105}
        + {2'h1, silu_8, silu_9, silu_10, silu_11, silu_12, silu_13, silu_14, 4'h0});	// vector_unit.k:198:{17,21}, :247:{21,25}, :248:{51,58}
  wire         prod_106 = _prod_plus_ma32_shl_4__0[12] & p0_up_bf16_1[4];	// vector_unit.k:186:9, :241:{21,33}, :248:{21,25,51}
  wire         prod_107 =
    _prod_plus_ma32_shl_4__0[11]
      ? prod_94 | p0_up_bf16_1[4]
      : prod_94 & ~(p0_up_bf16_1[4]);	// vector_unit.k:186:9, :241:{21,33}, :247:{21,25}, :248:{21,25,51}
  wire         prod_108 =
    _prod_plus_ma32_shl_4__0[10]
      ? prod_95 | p0_up_bf16_1[4]
      : prod_95 & ~(p0_up_bf16_1[4]);	// vector_unit.k:186:9, :241:{21,33}, :247:{21,25}, :248:{21,25,51}
  wire         prod_109 =
    _prod_plus_ma32_shl_4__0[9]
      ? prod_96 | p0_up_bf16_1[4]
      : prod_96 & ~(p0_up_bf16_1[4]);	// vector_unit.k:186:9, :241:{21,33}, :247:{21,25}, :248:{21,25,51}
  wire         prod_110 =
    _prod_plus_ma32_shl_4__0[8]
      ? prod_97 | p0_up_bf16_1[4]
      : prod_97 & ~(p0_up_bf16_1[4]);	// vector_unit.k:186:9, :241:{21,33}, :247:{21,25}, :248:{21,25,51}
  wire         prod_111 =
    _prod_plus_ma32_shl_4__0[7]
      ? prod_98 | p0_up_bf16_1[4]
      : prod_98 & ~(p0_up_bf16_1[4]);	// vector_unit.k:186:9, :241:{21,33}, :247:{21,25}, :248:{21,25,51}
  wire         prod_112 =
    _prod_plus_ma32_shl_4__0[6]
      ? prod_99 | p0_up_bf16_1[4]
      : prod_99 & ~(p0_up_bf16_1[4]);	// vector_unit.k:186:9, :241:{21,33}, :247:{21,25}, :248:{21,25,51}
  wire         prod_113 =
    _prod_plus_ma32_shl_4__0[5]
      ? prod_100 | p0_up_bf16_1[4]
      : prod_100 & ~(p0_up_bf16_1[4]);	// vector_unit.k:186:9, :241:{21,33}, :247:{21,25}, :248:{21,25,51}
  wire         prod_114 =
    _prod_plus_ma32_shl_4__0[4]
      ? prod_101 | p0_up_bf16_1[4]
      : prod_101 & ~(p0_up_bf16_1[4]);	// vector_unit.k:186:9, :241:{21,33}, :247:{21,25}, :248:{21,25,51}
  wire         prod_115 =
    _prod_plus_ma32_shl_4__0[3]
      ? prod_102 | p0_up_bf16_1[4]
      : prod_102 & ~(p0_up_bf16_1[4]);	// vector_unit.k:186:9, :241:{21,33}, :247:{21,25}, :248:{21,25,51}
  wire         prod_116 =
    _prod_plus_ma32_shl_4__0[2]
      ? prod_103 | p0_up_bf16_1[4]
      : prod_103 & ~(p0_up_bf16_1[4]);	// vector_unit.k:186:9, :241:{21,33}, :247:{21,25}, :248:{21,25,51}
  wire         prod_117 =
    _prod_plus_ma32_shl_4__0[1]
      ? prod_104 | p0_up_bf16_1[4]
      : prod_104 & ~(p0_up_bf16_1[4]);	// vector_unit.k:186:9, :241:{21,33}, :247:{21,25}, :248:{21,25,51}
  wire         prod_118 =
    _prod_plus_ma32_shl_4__0[0]
      ? prod_105 | p0_up_bf16_1[4]
      : prod_105 & ~(p0_up_bf16_1[4]);	// vector_unit.k:186:9, :241:{21,33}, :247:{21,25}, :248:{21,25,51}
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
         prod_118}
        + {2'h1, silu_8, silu_9, silu_10, silu_11, silu_12, silu_13, silu_14, 5'h0});	// vector_unit.k:198:{17,21}, :248:{21,25}, :249:{51,58}
  wire         prod_119 = _prod_plus_ma32_shl_5__0[13] & p0_up_bf16_1[5];	// vector_unit.k:186:9, :241:{21,33}, :249:{21,25,51}
  wire         prod_120 =
    _prod_plus_ma32_shl_5__0[12]
      ? prod_106 | p0_up_bf16_1[5]
      : prod_106 & ~(p0_up_bf16_1[5]);	// vector_unit.k:186:9, :241:{21,33}, :248:{21,25}, :249:{21,25,51}
  wire         prod_121 =
    _prod_plus_ma32_shl_5__0[11]
      ? prod_107 | p0_up_bf16_1[5]
      : prod_107 & ~(p0_up_bf16_1[5]);	// vector_unit.k:186:9, :241:{21,33}, :248:{21,25}, :249:{21,25,51}
  wire         prod_122 =
    _prod_plus_ma32_shl_5__0[10]
      ? prod_108 | p0_up_bf16_1[5]
      : prod_108 & ~(p0_up_bf16_1[5]);	// vector_unit.k:186:9, :241:{21,33}, :248:{21,25}, :249:{21,25,51}
  wire         prod_123 =
    _prod_plus_ma32_shl_5__0[9]
      ? prod_109 | p0_up_bf16_1[5]
      : prod_109 & ~(p0_up_bf16_1[5]);	// vector_unit.k:186:9, :241:{21,33}, :248:{21,25}, :249:{21,25,51}
  wire         prod_124 =
    _prod_plus_ma32_shl_5__0[8]
      ? prod_110 | p0_up_bf16_1[5]
      : prod_110 & ~(p0_up_bf16_1[5]);	// vector_unit.k:186:9, :241:{21,33}, :248:{21,25}, :249:{21,25,51}
  wire         prod_125 =
    _prod_plus_ma32_shl_5__0[7]
      ? prod_111 | p0_up_bf16_1[5]
      : prod_111 & ~(p0_up_bf16_1[5]);	// vector_unit.k:186:9, :241:{21,33}, :248:{21,25}, :249:{21,25,51}
  wire         prod_126 =
    _prod_plus_ma32_shl_5__0[6]
      ? prod_112 | p0_up_bf16_1[5]
      : prod_112 & ~(p0_up_bf16_1[5]);	// vector_unit.k:186:9, :241:{21,33}, :248:{21,25}, :249:{21,25,51}
  wire         prod_127 =
    _prod_plus_ma32_shl_5__0[5]
      ? prod_113 | p0_up_bf16_1[5]
      : prod_113 & ~(p0_up_bf16_1[5]);	// vector_unit.k:186:9, :241:{21,33}, :248:{21,25}, :249:{21,25,51}
  wire         prod_128 =
    _prod_plus_ma32_shl_5__0[4]
      ? prod_114 | p0_up_bf16_1[5]
      : prod_114 & ~(p0_up_bf16_1[5]);	// vector_unit.k:186:9, :241:{21,33}, :248:{21,25}, :249:{21,25,51}
  wire         prod_129 =
    _prod_plus_ma32_shl_5__0[3]
      ? prod_115 | p0_up_bf16_1[5]
      : prod_115 & ~(p0_up_bf16_1[5]);	// vector_unit.k:186:9, :241:{21,33}, :248:{21,25}, :249:{21,25,51}
  wire         prod_130 =
    _prod_plus_ma32_shl_5__0[2]
      ? prod_116 | p0_up_bf16_1[5]
      : prod_116 & ~(p0_up_bf16_1[5]);	// vector_unit.k:186:9, :241:{21,33}, :248:{21,25}, :249:{21,25,51}
  wire         prod_131 =
    _prod_plus_ma32_shl_5__0[1]
      ? prod_117 | p0_up_bf16_1[5]
      : prod_117 & ~(p0_up_bf16_1[5]);	// vector_unit.k:186:9, :241:{21,33}, :248:{21,25}, :249:{21,25,51}
  wire         prod_132 =
    _prod_plus_ma32_shl_5__0[0]
      ? prod_118 | p0_up_bf16_1[5]
      : prod_118 & ~(p0_up_bf16_1[5]);	// vector_unit.k:186:9, :241:{21,33}, :248:{21,25}, :249:{21,25,51}
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
         prod_132}
        + {2'h1, silu_8, silu_9, silu_10, silu_11, silu_12, silu_13, silu_14, 6'h0});	// vector_unit.k:198:{17,21}, :249:{21,25}, :250:{51,58}
  wire  [15:0] _prod_plus_ma32_shl_7__0 =
    16'({1'h0,
         _prod_plus_ma32_shl_6__0[14] & p0_up_bf16_1[6],
         _prod_plus_ma32_shl_6__0[13]
           ? prod_119 | p0_up_bf16_1[6]
           : prod_119 & ~(p0_up_bf16_1[6]),
         _prod_plus_ma32_shl_6__0[12]
           ? prod_120 | p0_up_bf16_1[6]
           : prod_120 & ~(p0_up_bf16_1[6]),
         _prod_plus_ma32_shl_6__0[11]
           ? prod_121 | p0_up_bf16_1[6]
           : prod_121 & ~(p0_up_bf16_1[6]),
         _prod_plus_ma32_shl_6__0[10]
           ? prod_122 | p0_up_bf16_1[6]
           : prod_122 & ~(p0_up_bf16_1[6]),
         _prod_plus_ma32_shl_6__0[9]
           ? prod_123 | p0_up_bf16_1[6]
           : prod_123 & ~(p0_up_bf16_1[6]),
         _prod_plus_ma32_shl_6__0[8]
           ? prod_124 | p0_up_bf16_1[6]
           : prod_124 & ~(p0_up_bf16_1[6]),
         _prod_plus_ma32_shl_6__0[7]
           ? prod_125 | p0_up_bf16_1[6]
           : prod_125 & ~(p0_up_bf16_1[6]),
         _prod_plus_ma32_shl_6__0[6]
           ? prod_126 | p0_up_bf16_1[6]
           : prod_126 & ~(p0_up_bf16_1[6]),
         _prod_plus_ma32_shl_6__0[5]
           ? prod_127 | p0_up_bf16_1[6]
           : prod_127 & ~(p0_up_bf16_1[6]),
         _prod_plus_ma32_shl_6__0[4]
           ? prod_128 | p0_up_bf16_1[6]
           : prod_128 & ~(p0_up_bf16_1[6]),
         _prod_plus_ma32_shl_6__0[3]
           ? prod_129 | p0_up_bf16_1[6]
           : prod_129 & ~(p0_up_bf16_1[6]),
         _prod_plus_ma32_shl_6__0[2]
           ? prod_130 | p0_up_bf16_1[6]
           : prod_130 & ~(p0_up_bf16_1[6]),
         _prod_plus_ma32_shl_6__0[1]
           ? prod_131 | p0_up_bf16_1[6]
           : prod_131 & ~(p0_up_bf16_1[6]),
         _prod_plus_ma32_shl_6__0[0]
           ? prod_132 | p0_up_bf16_1[6]
           : prod_132 & ~(p0_up_bf16_1[6])}
        + {2'h1, silu_8, silu_9, silu_10, silu_11, silu_12, silu_13, silu_14, 7'h0});	// vector_unit.k:186:9, :198:{17,21}, :241:{21,33}, :249:{21,25}, :250:{21,51}, :251:{51,58}
  wire  [15:0] r_exp_0 =
    _prod_plus_ma32_shl_7__0[15]
      ? 16'(_a_exp_plus_b_exp__0 - 16'h7E)
      : 16'(_a_exp_plus_b_exp__0 - 16'h7F);	// vector_unit.k:251:{21,51}, :254:21, :257:{33,39,47}, :262:{33,39}
  wire         _GEN_3 = r_exp_0 < 16'hFF & (|r_exp_0);	// vector_unit.k:239:{21,37,38,53}, :254:21, :256:{34,47}, :261:{34,47}, :264:{21,25,31,44}, :266:{34,49,51}
  wire         _GEN_4 = ~(_prod_plus_ma32_shl_7__0[15]) & _GEN_3;	// vector_unit.k:239:{21,37,38,53}, :251:{21,51}, :254:21, :256:{34,47}, :261:{34,47}, :264:{21,25}, :266:{34,49,51}
  wire         _GEN_5 =
    (|(p0_up_bf16_1[14:7]))
    & (|{silu_0, silu_1, silu_2, silu_3, silu_4, silu_5, silu_6, silu_7});	// vector_unit.k:186:9, :198:{17,21}, :200:{21,37,38,58}, :215:21, :217:{34,47}, :222:{34,47}, :225:{21,25}, :227:{32,47,49}, :235:{17,32}, :236:{17,32}, :237:{17,21,27,41}
  always @(posedge clk) begin	// vector_unit.k:186:9
    p0_gate_bf16 <= data_in_31[15:0];	// vector_unit.k:186:9
    p0_up_bf16 <= data_in_31[31:16];	// vector_unit.k:186:9
    if (rst)	// vector_unit.k:186:9
      p0_stage1_enable <= 1'h0;	// vector_unit.k:186:9
    else	// vector_unit.k:186:9
      p0_stage1_enable <= _GEN & input_valid_0;	// vector_unit.k:186:9
    p0_gate_bf16_0 <= p0_gate_bf16;	// vector_unit.k:186:9
    p0_up_bf16_0 <= p0_up_bf16;	// vector_unit.k:186:9
    if (rst)	// vector_unit.k:186:9
      p0_stage2_enable <= 1'h0;	// vector_unit.k:186:9
    else	// vector_unit.k:186:9
      p0_stage2_enable <= p0_stage1_enable;	// vector_unit.k:186:9
    p0_gate_bf16_1 <= p0_gate_bf16_0;	// vector_unit.k:186:9
    p0_up_bf16_1 <= p0_up_bf16_0;	// vector_unit.k:186:9
    if (rst)	// vector_unit.k:186:9
      p0_stage3_enable <= 1'h0;	// vector_unit.k:186:9
    else	// vector_unit.k:186:9
      p0_stage3_enable <= p0_stage2_enable;	// vector_unit.k:186:9
    p0_result <=
      {(r_exp_0[8] ? _GEN_3 : p0_up_bf16_1[15] ? ~silu & _GEN_3 : silu & _GEN_3) & _GEN_5,
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
          : _prod_plus_ma32_shl_7__0[7] & _GEN_4) & _GEN_5};	// vector_unit.k:186:9, :198:{17,21}, :237:{17,21}, :239:{21,37,38,53}, :251:{21,51}, :254:21, :256:{34,47}, :261:{34,47}, :264:{21,25}, :266:{34,49,51}
    if (rst)	// vector_unit.k:186:9
      p0_stage4_enable <= 1'h0;	// vector_unit.k:186:9
    else	// vector_unit.k:186:9
      p0_stage4_enable <= p0_stage3_enable;	// vector_unit.k:186:9
    p0_result_0 <= p0_result;	// vector_unit.k:186:9
    if (rst)	// vector_unit.k:186:9
      p0_stage5_enable <= 1'h0;	// vector_unit.k:186:9
    else	// vector_unit.k:186:9
      p0_stage5_enable <= p0_stage4_enable;	// vector_unit.k:186:9
  end // always @(posedge)
  always_comb begin	// vector_unit.k:186:9
    fifo_wren_0_0 = p0_stage5_enable;	// vector_unit.k:184:5, :186:9
    fifo_data_out_0_0 = p0_result_0;	// vector_unit.k:184:5, :186:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// vector_unit.k:186:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// vector_unit.k:186:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  vector_unitDebugView_swiglu_computeEntry vector_unitDebugView_swiglu_computeEntry_instance (	// vector_unit.k:184:5
    .clk        (clk),	// vector_unit.k:184:5
    ._gate_bf16 (p0_stage1_enable ? p0_gate_bf16 : 'x),	// vector_unit.k:184:5, :186:9
    ._up_bf16   (p0_stage1_enable ? p0_up_bf16 : 'x),	// vector_unit.k:184:5, :186:9
    .valid      (p0_stage1_enable),	// vector_unit.k:186:9
    .valid_out  (/* unused */)
  );	// vector_unit.k:184:5
  vector_unitDebugView_swiglu_computeExit vector_unitDebugView_swiglu_computeExit_instance (	// vector_unit.k:184:5
    .clk          (clk),	// vector_unit.k:184:5
    ._ReturnValue (p0_stage4_enable ? p0_result : 'x),	// vector_unit.k:184:5, :186:9
    .valid        (p0_stage4_enable),	// vector_unit.k:186:9
    .valid_out    (/* unused */)
  );	// vector_unit.k:184:5
  assign done_out = p0_stage5_enable;	// vector_unit.k:186:9
  assign memory_read_addr_out_38_0 = memory_read_addr_out_38_0_0;	// vector_unit.k:186:9
  assign memory_rden_out_38_0 = memory_rden_out_38_0_0;	// vector_unit.k:186:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// vector_unit.k:186:9
  assign fifo_wren_0 = fifo_wren_0_0;	// vector_unit.k:186:9
  assign input_rdy_0 = input_rdy_0_0;	// vector_unit.k:186:9
  assign control_state_out = control_state_out_0;	// vector_unit.k:186:9
endmodule

module vector_unit_set_sigmoid_lut_BasicBlock_0(	// vector_unit.k:178:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  output wire [15:0] memory_write_data_out_38_0,
  output wire [7:0]  memory_write_addr_out_38_0,
  output wire        memory_wren_38_0,
  output wire        fifo_wren_0,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [23:0] data_in_30,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  logic        done_out_0;	// vector_unit.k:178:9
  logic [15:0] memory_write_data_out_38_0_0;	// vector_unit.k:178:9
  logic [7:0]  memory_write_addr_out_38_0_0;	// vector_unit.k:178:9
  logic        memory_wren_38_0_0;	// vector_unit.k:178:9
  logic        fifo_wren_0_0;	// vector_unit.k:178:9
  logic        input_rdy_0_0;	// vector_unit.k:178:9
  logic [7:0]  control_state_out_0;	// vector_unit.k:178:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// vector_unit.k:178:9
  wire         _GEN_0 = _GEN & input_valid_0;	// vector_unit.k:178:9
  always_comb begin	// vector_unit.k:178:9
    input_rdy_0_0 = _GEN;	// vector_unit.k:178:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// vector_unit.k:178:9
  end // always_comb
  always_comb begin	// vector_unit.k:178:9
    memory_wren_38_0_0 = _GEN_0;	// vector_unit.k:178:9, :180:13
    memory_write_addr_out_38_0_0 = data_in_30[7:0];	// vector_unit.k:180:13
    memory_write_data_out_38_0_0 = data_in_30[23:8];	// vector_unit.k:180:13
  end // always_comb
  reg   [7:0]  p0_index;	// vector_unit.k:178:9
  reg   [15:0] p0_value;	// vector_unit.k:178:9
  reg          p0_stage1_enable = 1'h0;	// vector_unit.k:178:9
  reg          p0_stage2_enable = 1'h0;	// vector_unit.k:178:9
  always @(posedge clk) begin	// vector_unit.k:178:9
    p0_index <= data_in_30[7:0];	// vector_unit.k:178:9
    p0_value <= data_in_30[23:8];	// vector_unit.k:178:9
    if (rst) begin	// vector_unit.k:178:9
      p0_stage1_enable <= 1'h0;	// vector_unit.k:178:9
      p0_stage2_enable <= 1'h0;	// vector_unit.k:178:9
    end
    else begin	// vector_unit.k:178:9
      p0_stage1_enable <= _GEN_0;	// vector_unit.k:178:9
      p0_stage2_enable <= p0_stage1_enable;	// vector_unit.k:178:9
    end
  end // always @(posedge)
  always_comb	// vector_unit.k:178:9
    fifo_wren_0_0 = p0_stage2_enable;	// vector_unit.k:178:9, :182:9
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// vector_unit.k:178:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// vector_unit.k:178:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  vector_unitDebugView_set_sigmoid_lutEntry vector_unitDebugView_set_sigmoid_lutEntry_instance (	// vector_unit.k:182:9
    .clk       (clk),	// vector_unit.k:182:9
    ._index    (p0_stage1_enable ? p0_index : 'x),	// vector_unit.k:178:9, :182:9
    ._value    (p0_stage1_enable ? p0_value : 'x),	// vector_unit.k:178:9, :182:9
    .valid     (p0_stage1_enable),	// vector_unit.k:178:9
    .valid_out (/* unused */)
  );	// vector_unit.k:182:9
  assign done_out = p0_stage2_enable;	// vector_unit.k:178:9
  assign memory_write_data_out_38_0 = memory_write_data_out_38_0_0;	// vector_unit.k:178:9
  assign memory_write_addr_out_38_0 = memory_write_addr_out_38_0_0;	// vector_unit.k:178:9
  assign memory_wren_38_0 = memory_wren_38_0_0;	// vector_unit.k:178:9
  assign fifo_wren_0 = fifo_wren_0_0;	// vector_unit.k:178:9
  assign input_rdy_0 = input_rdy_0_0;	// vector_unit.k:178:9
  assign control_state_out = control_state_out_0;	// vector_unit.k:178:9
endmodule

module vector_unit_rope_write_sin_row_BasicBlock_0(	// vector_unit.k:171:9
  input  wire          clk,
  input  wire          rst,
  output wire          done_out,
  output wire [1023:0] memory_write_data_out_40_0,
  output wire [11:0]   memory_write_addr_out_40_0,
  output wire          memory_wren_40_0,
  output wire          fifo_wren_0,
  input  wire          fifo_almost_full_in_raw_0,
  input  wire          fifo_overflow_in_0,
  input  wire [1035:0] data_in_29,
  input  wire          input_fifo_underflow_0,
  output wire          input_rdy_0,
  input  wire          input_valid_0,
  output wire [7:0]    control_state_out
);

  wire           _fifo_overflow_ffc_0_data_out;
  wire           _fifo_almostfull_ffc_0_data_out;
  logic          done_out_0;	// vector_unit.k:171:9
  logic [1023:0] memory_write_data_out_40_0_0;	// vector_unit.k:171:9
  logic [11:0]   memory_write_addr_out_40_0_0;	// vector_unit.k:171:9
  logic          memory_wren_40_0_0;	// vector_unit.k:171:9
  logic          fifo_wren_0_0;	// vector_unit.k:171:9
  logic          input_rdy_0_0;	// vector_unit.k:171:9
  logic [7:0]    control_state_out_0;	// vector_unit.k:171:9
  wire           _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// vector_unit.k:171:9
  wire           _GEN_0 = _GEN & input_valid_0;	// vector_unit.k:171:9
  always_comb begin	// vector_unit.k:171:9
    input_rdy_0_0 = _GEN;	// vector_unit.k:171:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// vector_unit.k:171:9
  end // always_comb
  always_comb begin	// vector_unit.k:171:9
    memory_wren_40_0_0 = _GEN_0;	// vector_unit.k:171:{9,18}
    memory_write_addr_out_40_0_0 = data_in_29[11:0];	// vector_unit.k:171:18
    memory_write_data_out_40_0_0 = data_in_29[1035:12];	// vector_unit.k:171:18
  end // always_comb
  reg   [11:0]   p0_position;	// vector_unit.k:171:9
  reg   [1023:0] p0_value;	// vector_unit.k:171:9
  reg            p0_stage1_enable = 1'h0;	// vector_unit.k:171:9
  reg            p0_stage2_enable = 1'h0;	// vector_unit.k:171:9
  always @(posedge clk) begin	// vector_unit.k:171:9
    p0_position <= data_in_29[11:0];	// vector_unit.k:171:9
    p0_value <= data_in_29[1035:12];	// vector_unit.k:171:9
    if (rst) begin	// vector_unit.k:171:9
      p0_stage1_enable <= 1'h0;	// vector_unit.k:171:9
      p0_stage2_enable <= 1'h0;	// vector_unit.k:171:9
    end
    else begin	// vector_unit.k:171:9
      p0_stage1_enable <= _GEN_0;	// vector_unit.k:171:9
      p0_stage2_enable <= p0_stage1_enable;	// vector_unit.k:171:9
    end
  end // always @(posedge)
  always_comb	// vector_unit.k:171:9
    fifo_wren_0_0 = p0_stage2_enable;	// vector_unit.k:171:9, :172:9
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// vector_unit.k:171:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// vector_unit.k:171:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  vector_unitDebugView_rope_write_sin_rowEntry vector_unitDebugView_rope_write_sin_rowEntry_instance (	// vector_unit.k:172:9
    .clk       (clk),	// vector_unit.k:172:9
    ._position (p0_stage1_enable ? p0_position : 'x),	// vector_unit.k:171:9, :172:9
    ._value    (p0_stage1_enable ? p0_value : 'x),	// vector_unit.k:171:9, :172:9
    .valid     (p0_stage1_enable),	// vector_unit.k:171:9
    .valid_out (/* unused */)
  );	// vector_unit.k:172:9
  assign done_out = p0_stage2_enable;	// vector_unit.k:171:9
  assign memory_write_data_out_40_0 = memory_write_data_out_40_0_0;	// vector_unit.k:171:9
  assign memory_write_addr_out_40_0 = memory_write_addr_out_40_0_0;	// vector_unit.k:171:9
  assign memory_wren_40_0 = memory_wren_40_0_0;	// vector_unit.k:171:9
  assign fifo_wren_0 = fifo_wren_0_0;	// vector_unit.k:171:9
  assign input_rdy_0 = input_rdy_0_0;	// vector_unit.k:171:9
  assign control_state_out = control_state_out_0;	// vector_unit.k:171:9
endmodule

module vector_unit_rope_write_cos_row_BasicBlock_0(	// vector_unit.k:166:9
  input  wire          clk,
  input  wire          rst,
  output wire          done_out,
  output wire [1023:0] memory_write_data_out_39_0,
  output wire [11:0]   memory_write_addr_out_39_0,
  output wire          memory_wren_39_0,
  output wire          fifo_wren_0,
  input  wire          fifo_almost_full_in_raw_0,
  input  wire          fifo_overflow_in_0,
  input  wire [1035:0] data_in_28,
  input  wire          input_fifo_underflow_0,
  output wire          input_rdy_0,
  input  wire          input_valid_0,
  output wire [7:0]    control_state_out
);

  wire           _fifo_overflow_ffc_0_data_out;
  wire           _fifo_almostfull_ffc_0_data_out;
  logic          done_out_0;	// vector_unit.k:166:9
  logic [1023:0] memory_write_data_out_39_0_0;	// vector_unit.k:166:9
  logic [11:0]   memory_write_addr_out_39_0_0;	// vector_unit.k:166:9
  logic          memory_wren_39_0_0;	// vector_unit.k:166:9
  logic          fifo_wren_0_0;	// vector_unit.k:166:9
  logic          input_rdy_0_0;	// vector_unit.k:166:9
  logic [7:0]    control_state_out_0;	// vector_unit.k:166:9
  wire           _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// vector_unit.k:166:9
  wire           _GEN_0 = _GEN & input_valid_0;	// vector_unit.k:166:9
  always_comb begin	// vector_unit.k:166:9
    input_rdy_0_0 = _GEN;	// vector_unit.k:166:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// vector_unit.k:166:9
  end // always_comb
  always_comb begin	// vector_unit.k:166:9
    memory_wren_39_0_0 = _GEN_0;	// vector_unit.k:166:{9,18}
    memory_write_addr_out_39_0_0 = data_in_28[11:0];	// vector_unit.k:166:18
    memory_write_data_out_39_0_0 = data_in_28[1035:12];	// vector_unit.k:166:18
  end // always_comb
  reg   [11:0]   p0_position;	// vector_unit.k:166:9
  reg   [1023:0] p0_value;	// vector_unit.k:166:9
  reg            p0_stage1_enable = 1'h0;	// vector_unit.k:166:9
  reg            p0_stage2_enable = 1'h0;	// vector_unit.k:166:9
  always @(posedge clk) begin	// vector_unit.k:166:9
    p0_position <= data_in_28[11:0];	// vector_unit.k:166:9
    p0_value <= data_in_28[1035:12];	// vector_unit.k:166:9
    if (rst) begin	// vector_unit.k:166:9
      p0_stage1_enable <= 1'h0;	// vector_unit.k:166:9
      p0_stage2_enable <= 1'h0;	// vector_unit.k:166:9
    end
    else begin	// vector_unit.k:166:9
      p0_stage1_enable <= _GEN_0;	// vector_unit.k:166:9
      p0_stage2_enable <= p0_stage1_enable;	// vector_unit.k:166:9
    end
  end // always @(posedge)
  always_comb	// vector_unit.k:166:9
    fifo_wren_0_0 = p0_stage2_enable;	// vector_unit.k:166:9, :167:9
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// vector_unit.k:166:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// vector_unit.k:166:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  vector_unitDebugView_rope_write_cos_rowEntry vector_unitDebugView_rope_write_cos_rowEntry_instance (	// vector_unit.k:167:9
    .clk       (clk),	// vector_unit.k:167:9
    ._position (p0_stage1_enable ? p0_position : 'x),	// vector_unit.k:166:9, :167:9
    ._value    (p0_stage1_enable ? p0_value : 'x),	// vector_unit.k:166:9, :167:9
    .valid     (p0_stage1_enable),	// vector_unit.k:166:9
    .valid_out (/* unused */)
  );	// vector_unit.k:167:9
  assign done_out = p0_stage2_enable;	// vector_unit.k:166:9
  assign memory_write_data_out_39_0 = memory_write_data_out_39_0_0;	// vector_unit.k:166:9
  assign memory_write_addr_out_39_0 = memory_write_addr_out_39_0_0;	// vector_unit.k:166:9
  assign memory_wren_39_0 = memory_wren_39_0_0;	// vector_unit.k:166:9
  assign fifo_wren_0 = fifo_wren_0_0;	// vector_unit.k:166:9
  assign input_rdy_0 = input_rdy_0_0;	// vector_unit.k:166:9
  assign control_state_out = control_state_out_0;	// vector_unit.k:166:9
endmodule

module vector_unit_rope_read_sin_row_BasicBlock_0(	// vector_unit.k:159:9
  input  wire          clk,
  input  wire          rst,
  output wire          done_out,
  input  wire [1023:0] memory_read_data_in_40_0,
  output wire [11:0]   memory_read_addr_out_40_0,
  output wire          memory_rden_out_40_0,
  output wire [1023:0] fifo_data_out_0,
  output wire          fifo_wren_0,
  input  wire          fifo_almost_full_in_raw_0,
  input  wire          fifo_overflow_in_0,
  input  wire [11:0]   data_in_27,
  input  wire          input_fifo_underflow_0,
  output wire          input_rdy_0,
  input  wire          input_valid_0,
  output wire [7:0]    control_state_out
);

  wire           _fifo_overflow_ffc_0_data_out;
  wire           _fifo_almostfull_ffc_0_data_out;
  wire  [1023:0] memory_read_data_in_40_0_0 = memory_read_data_in_40_0;	// vector_unit.k:159:9
  logic          done_out_0;	// vector_unit.k:159:9
  logic [11:0]   memory_read_addr_out_40_0_0;	// vector_unit.k:159:9
  logic          memory_rden_out_40_0_0;	// vector_unit.k:159:9
  logic [1023:0] fifo_data_out_0_0;	// vector_unit.k:159:9
  logic          fifo_wren_0_0;	// vector_unit.k:159:9
  logic          input_rdy_0_0;	// vector_unit.k:159:9
  logic [7:0]    control_state_out_0;	// vector_unit.k:159:9
  wire           _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// vector_unit.k:159:9
  wire           _GEN_0 = _GEN & input_valid_0;	// vector_unit.k:159:9
  always_comb begin	// vector_unit.k:159:9
    input_rdy_0_0 = _GEN;	// vector_unit.k:159:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// vector_unit.k:159:9
  end // always_comb
  always_comb begin	// vector_unit.k:159:9
    memory_read_addr_out_40_0_0 = data_in_27;	// vector_unit.k:160:27
    memory_rden_out_40_0_0 = _GEN_0;	// vector_unit.k:159:9, :160:27
  end // always_comb
  reg   [11:0]   p0_data_in_27;	// vector_unit.k:159:9
  reg            p0_stage1_enable = 1'h0;	// vector_unit.k:159:9
  reg            p0_stage2_enable = 1'h0;	// vector_unit.k:159:9
  reg   [1023:0] p0_memory_read_data_in_40_0;	// vector_unit.k:159:9
  reg            p0_stage3_enable = 1'h0;	// vector_unit.k:159:9
  always @(posedge clk) begin	// vector_unit.k:159:9
    p0_data_in_27 <= data_in_27;	// vector_unit.k:159:9
    if (rst) begin	// vector_unit.k:159:9
      p0_stage1_enable <= 1'h0;	// vector_unit.k:159:9
      p0_stage2_enable <= 1'h0;	// vector_unit.k:159:9
    end
    else begin	// vector_unit.k:159:9
      p0_stage1_enable <= _GEN_0;	// vector_unit.k:159:9
      p0_stage2_enable <= p0_stage1_enable;	// vector_unit.k:159:9
    end
    p0_memory_read_data_in_40_0 <= memory_read_data_in_40_0_0;	// vector_unit.k:159:9
    if (rst)	// vector_unit.k:159:9
      p0_stage3_enable <= 1'h0;	// vector_unit.k:159:9
    else	// vector_unit.k:159:9
      p0_stage3_enable <= p0_stage2_enable;	// vector_unit.k:159:9
  end // always @(posedge)
  always_comb begin	// vector_unit.k:159:9
    fifo_wren_0_0 = p0_stage3_enable;	// vector_unit.k:157:5, :159:9
    fifo_data_out_0_0 = p0_memory_read_data_in_40_0;	// vector_unit.k:157:5, :159:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// vector_unit.k:159:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// vector_unit.k:159:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  vector_unitDebugView_rope_read_sin_rowEntry vector_unitDebugView_rope_read_sin_rowEntry_instance (	// vector_unit.k:157:5
    .clk       (clk),	// vector_unit.k:157:5
    ._position (p0_stage1_enable ? p0_data_in_27 : 'x),	// vector_unit.k:157:5, :159:9
    .valid     (p0_stage1_enable),	// vector_unit.k:159:9
    .valid_out (/* unused */)
  );	// vector_unit.k:157:5
  vector_unitDebugView_rope_read_sin_rowExit vector_unitDebugView_rope_read_sin_rowExit_instance (	// vector_unit.k:157:5
    .clk          (clk),	// vector_unit.k:157:5
    ._ReturnValue (p0_stage2_enable ? memory_read_data_in_40_0_0 : 'x),	// vector_unit.k:157:5, :159:9
    .valid        (p0_stage2_enable),	// vector_unit.k:159:9
    .valid_out    (/* unused */)
  );	// vector_unit.k:157:5
  assign done_out = p0_stage3_enable;	// vector_unit.k:159:9
  assign memory_read_addr_out_40_0 = memory_read_addr_out_40_0_0;	// vector_unit.k:159:9
  assign memory_rden_out_40_0 = memory_rden_out_40_0_0;	// vector_unit.k:159:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// vector_unit.k:159:9
  assign fifo_wren_0 = fifo_wren_0_0;	// vector_unit.k:159:9
  assign input_rdy_0 = input_rdy_0_0;	// vector_unit.k:159:9
  assign control_state_out = control_state_out_0;	// vector_unit.k:159:9
endmodule

module vector_unit_rope_read_cos_row_BasicBlock_0(	// vector_unit.k:152:9
  input  wire          clk,
  input  wire          rst,
  output wire          done_out,
  input  wire [1023:0] memory_read_data_in_39_0,
  output wire [11:0]   memory_read_addr_out_39_0,
  output wire          memory_rden_out_39_0,
  output wire [1023:0] fifo_data_out_0,
  output wire          fifo_wren_0,
  input  wire          fifo_almost_full_in_raw_0,
  input  wire          fifo_overflow_in_0,
  input  wire [11:0]   data_in_26,
  input  wire          input_fifo_underflow_0,
  output wire          input_rdy_0,
  input  wire          input_valid_0,
  output wire [7:0]    control_state_out
);

  wire           _fifo_overflow_ffc_0_data_out;
  wire           _fifo_almostfull_ffc_0_data_out;
  wire  [1023:0] memory_read_data_in_39_0_0 = memory_read_data_in_39_0;	// vector_unit.k:152:9
  logic          done_out_0;	// vector_unit.k:152:9
  logic [11:0]   memory_read_addr_out_39_0_0;	// vector_unit.k:152:9
  logic          memory_rden_out_39_0_0;	// vector_unit.k:152:9
  logic [1023:0] fifo_data_out_0_0;	// vector_unit.k:152:9
  logic          fifo_wren_0_0;	// vector_unit.k:152:9
  logic          input_rdy_0_0;	// vector_unit.k:152:9
  logic [7:0]    control_state_out_0;	// vector_unit.k:152:9
  wire           _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// vector_unit.k:152:9
  wire           _GEN_0 = _GEN & input_valid_0;	// vector_unit.k:152:9
  always_comb begin	// vector_unit.k:152:9
    input_rdy_0_0 = _GEN;	// vector_unit.k:152:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// vector_unit.k:152:9
  end // always_comb
  always_comb begin	// vector_unit.k:152:9
    memory_read_addr_out_39_0_0 = data_in_26;	// vector_unit.k:153:27
    memory_rden_out_39_0_0 = _GEN_0;	// vector_unit.k:152:9, :153:27
  end // always_comb
  reg   [11:0]   p0_data_in_26;	// vector_unit.k:152:9
  reg            p0_stage1_enable = 1'h0;	// vector_unit.k:152:9
  reg            p0_stage2_enable = 1'h0;	// vector_unit.k:152:9
  reg   [1023:0] p0_memory_read_data_in_39_0;	// vector_unit.k:152:9
  reg            p0_stage3_enable = 1'h0;	// vector_unit.k:152:9
  always @(posedge clk) begin	// vector_unit.k:152:9
    p0_data_in_26 <= data_in_26;	// vector_unit.k:152:9
    if (rst) begin	// vector_unit.k:152:9
      p0_stage1_enable <= 1'h0;	// vector_unit.k:152:9
      p0_stage2_enable <= 1'h0;	// vector_unit.k:152:9
    end
    else begin	// vector_unit.k:152:9
      p0_stage1_enable <= _GEN_0;	// vector_unit.k:152:9
      p0_stage2_enable <= p0_stage1_enable;	// vector_unit.k:152:9
    end
    p0_memory_read_data_in_39_0 <= memory_read_data_in_39_0_0;	// vector_unit.k:152:9
    if (rst)	// vector_unit.k:152:9
      p0_stage3_enable <= 1'h0;	// vector_unit.k:152:9
    else	// vector_unit.k:152:9
      p0_stage3_enable <= p0_stage2_enable;	// vector_unit.k:152:9
  end // always @(posedge)
  always_comb begin	// vector_unit.k:152:9
    fifo_wren_0_0 = p0_stage3_enable;	// vector_unit.k:150:5, :152:9
    fifo_data_out_0_0 = p0_memory_read_data_in_39_0;	// vector_unit.k:150:5, :152:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// vector_unit.k:152:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// vector_unit.k:152:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  vector_unitDebugView_rope_read_cos_rowEntry vector_unitDebugView_rope_read_cos_rowEntry_instance (	// vector_unit.k:150:5
    .clk       (clk),	// vector_unit.k:150:5
    ._position (p0_stage1_enable ? p0_data_in_26 : 'x),	// vector_unit.k:150:5, :152:9
    .valid     (p0_stage1_enable),	// vector_unit.k:152:9
    .valid_out (/* unused */)
  );	// vector_unit.k:150:5
  vector_unitDebugView_rope_read_cos_rowExit vector_unitDebugView_rope_read_cos_rowExit_instance (	// vector_unit.k:150:5
    .clk          (clk),	// vector_unit.k:150:5
    ._ReturnValue (p0_stage2_enable ? memory_read_data_in_39_0_0 : 'x),	// vector_unit.k:150:5, :152:9
    .valid        (p0_stage2_enable),	// vector_unit.k:152:9
    .valid_out    (/* unused */)
  );	// vector_unit.k:150:5
  assign done_out = p0_stage3_enable;	// vector_unit.k:152:9
  assign memory_read_addr_out_39_0 = memory_read_addr_out_39_0_0;	// vector_unit.k:152:9
  assign memory_rden_out_39_0 = memory_rden_out_39_0_0;	// vector_unit.k:152:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// vector_unit.k:152:9
  assign fifo_wren_0 = fifo_wren_0_0;	// vector_unit.k:152:9
  assign input_rdy_0 = input_rdy_0_0;	// vector_unit.k:152:9
  assign control_state_out = control_state_out_0;	// vector_unit.k:152:9
endmodule

module vector_unit_lookup_rsqrt_BasicBlock_0(	// vector_unit.k:140:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  input  wire [15:0] memory_read_data_in_37_0,
  output wire [7:0]  memory_read_addr_out_37_0,
  output wire        memory_rden_out_37_0,
  output wire [15:0] fifo_data_out_0,
  output wire        fifo_wren_0,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [7:0]  data_in_25,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  wire  [15:0] memory_read_data_in_37_0_0 = memory_read_data_in_37_0;	// vector_unit.k:140:9
  logic        done_out_0;	// vector_unit.k:140:9
  logic [7:0]  memory_read_addr_out_37_0_0;	// vector_unit.k:140:9
  logic        memory_rden_out_37_0_0;	// vector_unit.k:140:9
  logic [15:0] fifo_data_out_0_0;	// vector_unit.k:140:9
  logic        fifo_wren_0_0;	// vector_unit.k:140:9
  logic        input_rdy_0_0;	// vector_unit.k:140:9
  logic [7:0]  control_state_out_0;	// vector_unit.k:140:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// vector_unit.k:140:9
  wire         _GEN_0 = _GEN & input_valid_0;	// vector_unit.k:140:9
  always_comb begin	// vector_unit.k:140:9
    input_rdy_0_0 = _GEN;	// vector_unit.k:140:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// vector_unit.k:140:9
  end // always_comb
  always_comb begin	// vector_unit.k:140:9
    memory_read_addr_out_37_0_0 = data_in_25;	// vector_unit.k:143:22
    memory_rden_out_37_0_0 = _GEN_0;	// vector_unit.k:140:9, :143:22
  end // always_comb
  reg   [7:0]  p0_data_in_25;	// vector_unit.k:140:9
  reg          p0_stage1_enable = 1'h0;	// vector_unit.k:140:9
  reg          p0_stage2_enable = 1'h0;	// vector_unit.k:140:9
  reg   [15:0] p0_memory_read_data_in_37_0;	// vector_unit.k:140:9
  reg          p0_stage3_enable = 1'h0;	// vector_unit.k:140:9
  always @(posedge clk) begin	// vector_unit.k:140:9
    p0_data_in_25 <= data_in_25;	// vector_unit.k:140:9
    if (rst) begin	// vector_unit.k:140:9
      p0_stage1_enable <= 1'h0;	// vector_unit.k:140:9
      p0_stage2_enable <= 1'h0;	// vector_unit.k:140:9
    end
    else begin	// vector_unit.k:140:9
      p0_stage1_enable <= _GEN_0;	// vector_unit.k:140:9
      p0_stage2_enable <= p0_stage1_enable;	// vector_unit.k:140:9
    end
    p0_memory_read_data_in_37_0 <= memory_read_data_in_37_0_0;	// vector_unit.k:140:9
    if (rst)	// vector_unit.k:140:9
      p0_stage3_enable <= 1'h0;	// vector_unit.k:140:9
    else	// vector_unit.k:140:9
      p0_stage3_enable <= p0_stage2_enable;	// vector_unit.k:140:9
  end // always @(posedge)
  always_comb begin	// vector_unit.k:140:9
    fifo_wren_0_0 = p0_stage3_enable;	// vector_unit.k:138:5, :140:9
    fifo_data_out_0_0 = p0_memory_read_data_in_37_0;	// vector_unit.k:138:5, :140:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// vector_unit.k:140:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// vector_unit.k:140:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  vector_unitDebugView_lookup_rsqrtEntry vector_unitDebugView_lookup_rsqrtEntry_instance (	// vector_unit.k:138:5
    .clk       (clk),	// vector_unit.k:138:5
    ._index    (p0_stage1_enable ? p0_data_in_25 : 'x),	// vector_unit.k:138:5, :140:9
    .valid     (p0_stage1_enable),	// vector_unit.k:140:9
    .valid_out (/* unused */)
  );	// vector_unit.k:138:5
  vector_unitDebugView_lookup_rsqrtExit vector_unitDebugView_lookup_rsqrtExit_instance (	// vector_unit.k:138:5
    .clk          (clk),	// vector_unit.k:138:5
    ._ReturnValue (p0_stage2_enable ? memory_read_data_in_37_0_0 : 'x),	// vector_unit.k:138:5, :140:9
    .valid        (p0_stage2_enable),	// vector_unit.k:140:9
    .valid_out    (/* unused */)
  );	// vector_unit.k:138:5
  assign done_out = p0_stage3_enable;	// vector_unit.k:140:9
  assign memory_read_addr_out_37_0 = memory_read_addr_out_37_0_0;	// vector_unit.k:140:9
  assign memory_rden_out_37_0 = memory_rden_out_37_0_0;	// vector_unit.k:140:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// vector_unit.k:140:9
  assign fifo_wren_0 = fifo_wren_0_0;	// vector_unit.k:140:9
  assign input_rdy_0 = input_rdy_0_0;	// vector_unit.k:140:9
  assign control_state_out = control_state_out_0;	// vector_unit.k:140:9
endmodule

module vector_unit_set_rsqrt_lut_BasicBlock_0(	// vector_unit.k:132:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  output wire [15:0] memory_write_data_out_37_0,
  output wire [7:0]  memory_write_addr_out_37_0,
  output wire        memory_wren_37_0,
  output wire        fifo_wren_0,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [23:0] data_in_24,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  logic        done_out_0;	// vector_unit.k:132:9
  logic [15:0] memory_write_data_out_37_0_0;	// vector_unit.k:132:9
  logic [7:0]  memory_write_addr_out_37_0_0;	// vector_unit.k:132:9
  logic        memory_wren_37_0_0;	// vector_unit.k:132:9
  logic        fifo_wren_0_0;	// vector_unit.k:132:9
  logic        input_rdy_0_0;	// vector_unit.k:132:9
  logic [7:0]  control_state_out_0;	// vector_unit.k:132:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// vector_unit.k:132:9
  wire         _GEN_0 = _GEN & input_valid_0;	// vector_unit.k:132:9
  always_comb begin	// vector_unit.k:132:9
    input_rdy_0_0 = _GEN;	// vector_unit.k:132:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// vector_unit.k:132:9
  end // always_comb
  always_comb begin	// vector_unit.k:132:9
    memory_wren_37_0_0 = _GEN_0;	// vector_unit.k:132:9, :134:13
    memory_write_addr_out_37_0_0 = data_in_24[7:0];	// vector_unit.k:134:13
    memory_write_data_out_37_0_0 = data_in_24[23:8];	// vector_unit.k:134:13
  end // always_comb
  reg   [7:0]  p0_index;	// vector_unit.k:132:9
  reg   [15:0] p0_value;	// vector_unit.k:132:9
  reg          p0_stage1_enable = 1'h0;	// vector_unit.k:132:9
  reg          p0_stage2_enable = 1'h0;	// vector_unit.k:132:9
  always @(posedge clk) begin	// vector_unit.k:132:9
    p0_index <= data_in_24[7:0];	// vector_unit.k:132:9
    p0_value <= data_in_24[23:8];	// vector_unit.k:132:9
    if (rst) begin	// vector_unit.k:132:9
      p0_stage1_enable <= 1'h0;	// vector_unit.k:132:9
      p0_stage2_enable <= 1'h0;	// vector_unit.k:132:9
    end
    else begin	// vector_unit.k:132:9
      p0_stage1_enable <= _GEN_0;	// vector_unit.k:132:9
      p0_stage2_enable <= p0_stage1_enable;	// vector_unit.k:132:9
    end
  end // always @(posedge)
  always_comb	// vector_unit.k:132:9
    fifo_wren_0_0 = p0_stage2_enable;	// vector_unit.k:132:9, :136:9
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// vector_unit.k:132:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// vector_unit.k:132:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  vector_unitDebugView_set_rsqrt_lutEntry vector_unitDebugView_set_rsqrt_lutEntry_instance (	// vector_unit.k:136:9
    .clk       (clk),	// vector_unit.k:136:9
    ._index    (p0_stage1_enable ? p0_index : 'x),	// vector_unit.k:132:9, :136:9
    ._value    (p0_stage1_enable ? p0_value : 'x),	// vector_unit.k:132:9, :136:9
    .valid     (p0_stage1_enable),	// vector_unit.k:132:9
    .valid_out (/* unused */)
  );	// vector_unit.k:136:9
  assign done_out = p0_stage2_enable;	// vector_unit.k:132:9
  assign memory_write_data_out_37_0 = memory_write_data_out_37_0_0;	// vector_unit.k:132:9
  assign memory_write_addr_out_37_0 = memory_write_addr_out_37_0_0;	// vector_unit.k:132:9
  assign memory_wren_37_0 = memory_wren_37_0_0;	// vector_unit.k:132:9
  assign fifo_wren_0 = fifo_wren_0_0;	// vector_unit.k:132:9
  assign input_rdy_0 = input_rdy_0_0;	// vector_unit.k:132:9
  assign control_state_out = control_state_out_0;	// vector_unit.k:132:9
endmodule

module vector_unit_get_gamma_pre_mlp_BasicBlock_0(	// vector_unit.k:122:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  input  wire [15:0] memory_read_data_in_36_0,
  output wire [11:0] memory_read_addr_out_36_0,
  output wire        memory_rden_out_36_0,
  output wire [15:0] fifo_data_out_0,
  output wire        fifo_wren_0,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [15:0] data_in_23,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  wire  [15:0] memory_read_data_in_36_0_0 = memory_read_data_in_36_0;	// vector_unit.k:122:9
  logic        done_out_0;	// vector_unit.k:122:9
  logic [11:0] memory_read_addr_out_36_0_0;	// vector_unit.k:122:9
  logic        memory_rden_out_36_0_0;	// vector_unit.k:122:9
  logic [15:0] fifo_data_out_0_0;	// vector_unit.k:122:9
  logic        fifo_wren_0_0;	// vector_unit.k:122:9
  logic        input_rdy_0_0;	// vector_unit.k:122:9
  logic [7:0]  control_state_out_0;	// vector_unit.k:122:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// vector_unit.k:122:9
  wire         _GEN_0 = _GEN & input_valid_0;	// vector_unit.k:122:9
  always_comb begin	// vector_unit.k:122:9
    input_rdy_0_0 = _GEN;	// vector_unit.k:122:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// vector_unit.k:122:9
  end // always_comb
  always_comb begin	// vector_unit.k:122:9
    memory_read_addr_out_36_0_0 = data_in_23[11:0];	// vector_unit.k:125:22
    memory_rden_out_36_0_0 = _GEN_0;	// vector_unit.k:122:9, :125:22
  end // always_comb
  reg   [15:0] p0_data_in_23;	// vector_unit.k:122:9
  reg          p0_stage1_enable = 1'h0;	// vector_unit.k:122:9
  reg          p0_stage2_enable = 1'h0;	// vector_unit.k:122:9
  reg   [15:0] p0_memory_read_data_in_36_0;	// vector_unit.k:122:9
  reg          p0_stage3_enable = 1'h0;	// vector_unit.k:122:9
  always @(posedge clk) begin	// vector_unit.k:122:9
    p0_data_in_23 <= data_in_23;	// vector_unit.k:122:9
    if (rst) begin	// vector_unit.k:122:9
      p0_stage1_enable <= 1'h0;	// vector_unit.k:122:9
      p0_stage2_enable <= 1'h0;	// vector_unit.k:122:9
    end
    else begin	// vector_unit.k:122:9
      p0_stage1_enable <= _GEN_0;	// vector_unit.k:122:9
      p0_stage2_enable <= p0_stage1_enable;	// vector_unit.k:122:9
    end
    p0_memory_read_data_in_36_0 <= memory_read_data_in_36_0_0;	// vector_unit.k:122:9
    if (rst)	// vector_unit.k:122:9
      p0_stage3_enable <= 1'h0;	// vector_unit.k:122:9
    else	// vector_unit.k:122:9
      p0_stage3_enable <= p0_stage2_enable;	// vector_unit.k:122:9
  end // always @(posedge)
  always_comb begin	// vector_unit.k:122:9
    fifo_wren_0_0 = p0_stage3_enable;	// vector_unit.k:120:5, :122:9
    fifo_data_out_0_0 = p0_memory_read_data_in_36_0;	// vector_unit.k:120:5, :122:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// vector_unit.k:122:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// vector_unit.k:122:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  vector_unitDebugView_get_gamma_pre_mlpEntry vector_unitDebugView_get_gamma_pre_mlpEntry_instance (	// vector_unit.k:120:5
    .clk       (clk),	// vector_unit.k:120:5
    ._index    (p0_stage1_enable ? p0_data_in_23 : 'x),	// vector_unit.k:120:5, :122:9
    .valid     (p0_stage1_enable),	// vector_unit.k:122:9
    .valid_out (/* unused */)
  );	// vector_unit.k:120:5
  vector_unitDebugView_get_gamma_pre_mlpExit vector_unitDebugView_get_gamma_pre_mlpExit_instance (	// vector_unit.k:120:5
    .clk          (clk),	// vector_unit.k:120:5
    ._ReturnValue (p0_stage2_enable ? memory_read_data_in_36_0_0 : 'x),	// vector_unit.k:120:5, :122:9
    .valid        (p0_stage2_enable),	// vector_unit.k:122:9
    .valid_out    (/* unused */)
  );	// vector_unit.k:120:5
  assign done_out = p0_stage3_enable;	// vector_unit.k:122:9
  assign memory_read_addr_out_36_0 = memory_read_addr_out_36_0_0;	// vector_unit.k:122:9
  assign memory_rden_out_36_0 = memory_rden_out_36_0_0;	// vector_unit.k:122:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// vector_unit.k:122:9
  assign fifo_wren_0 = fifo_wren_0_0;	// vector_unit.k:122:9
  assign input_rdy_0 = input_rdy_0_0;	// vector_unit.k:122:9
  assign control_state_out = control_state_out_0;	// vector_unit.k:122:9
endmodule

module vector_unit_set_gamma_pre_mlp_BasicBlock_0(	// vector_unit.k:114:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  output wire [15:0] memory_write_data_out_36_0,
  output wire [11:0] memory_write_addr_out_36_0,
  output wire        memory_wren_36_0,
  output wire        fifo_wren_0,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [31:0] data_in_22,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  logic        done_out_0;	// vector_unit.k:114:9
  logic [15:0] memory_write_data_out_36_0_0;	// vector_unit.k:114:9
  logic [11:0] memory_write_addr_out_36_0_0;	// vector_unit.k:114:9
  logic        memory_wren_36_0_0;	// vector_unit.k:114:9
  logic        fifo_wren_0_0;	// vector_unit.k:114:9
  logic        input_rdy_0_0;	// vector_unit.k:114:9
  logic [7:0]  control_state_out_0;	// vector_unit.k:114:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// vector_unit.k:114:9
  wire         _GEN_0 = _GEN & input_valid_0;	// vector_unit.k:114:9
  always_comb begin	// vector_unit.k:114:9
    input_rdy_0_0 = _GEN;	// vector_unit.k:114:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// vector_unit.k:114:9
  end // always_comb
  always_comb begin	// vector_unit.k:114:9
    memory_wren_36_0_0 = _GEN_0;	// vector_unit.k:114:9, :116:13
    memory_write_addr_out_36_0_0 = data_in_22[11:0];	// vector_unit.k:116:13
    memory_write_data_out_36_0_0 = data_in_22[31:16];	// vector_unit.k:116:13
  end // always_comb
  reg   [15:0] p0_index;	// vector_unit.k:114:9
  reg   [15:0] p0_value;	// vector_unit.k:114:9
  reg          p0_stage1_enable = 1'h0;	// vector_unit.k:114:9
  reg          p0_stage2_enable = 1'h0;	// vector_unit.k:114:9
  always @(posedge clk) begin	// vector_unit.k:114:9
    p0_index <= data_in_22[15:0];	// vector_unit.k:114:9
    p0_value <= data_in_22[31:16];	// vector_unit.k:114:9
    if (rst) begin	// vector_unit.k:114:9
      p0_stage1_enable <= 1'h0;	// vector_unit.k:114:9
      p0_stage2_enable <= 1'h0;	// vector_unit.k:114:9
    end
    else begin	// vector_unit.k:114:9
      p0_stage1_enable <= _GEN_0;	// vector_unit.k:114:9
      p0_stage2_enable <= p0_stage1_enable;	// vector_unit.k:114:9
    end
  end // always @(posedge)
  always_comb	// vector_unit.k:114:9
    fifo_wren_0_0 = p0_stage2_enable;	// vector_unit.k:114:9, :118:9
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// vector_unit.k:114:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// vector_unit.k:114:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  vector_unitDebugView_set_gamma_pre_mlpEntry vector_unitDebugView_set_gamma_pre_mlpEntry_instance (	// vector_unit.k:118:9
    .clk       (clk),	// vector_unit.k:118:9
    ._index    (p0_stage1_enable ? p0_index : 'x),	// vector_unit.k:114:9, :118:9
    ._value    (p0_stage1_enable ? p0_value : 'x),	// vector_unit.k:114:9, :118:9
    .valid     (p0_stage1_enable),	// vector_unit.k:114:9
    .valid_out (/* unused */)
  );	// vector_unit.k:118:9
  assign done_out = p0_stage2_enable;	// vector_unit.k:114:9
  assign memory_write_data_out_36_0 = memory_write_data_out_36_0_0;	// vector_unit.k:114:9
  assign memory_write_addr_out_36_0 = memory_write_addr_out_36_0_0;	// vector_unit.k:114:9
  assign memory_wren_36_0 = memory_wren_36_0_0;	// vector_unit.k:114:9
  assign fifo_wren_0 = fifo_wren_0_0;	// vector_unit.k:114:9
  assign input_rdy_0 = input_rdy_0_0;	// vector_unit.k:114:9
  assign control_state_out = control_state_out_0;	// vector_unit.k:114:9
endmodule

module vector_unit_get_gamma_pre_attn_BasicBlock_0(	// vector_unit.k:104:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  input  wire [15:0] memory_read_data_in_35_0,
  output wire [11:0] memory_read_addr_out_35_0,
  output wire        memory_rden_out_35_0,
  output wire [15:0] fifo_data_out_0,
  output wire        fifo_wren_0,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [15:0] data_in_21,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  wire  [15:0] memory_read_data_in_35_0_0 = memory_read_data_in_35_0;	// vector_unit.k:104:9
  logic        done_out_0;	// vector_unit.k:104:9
  logic [11:0] memory_read_addr_out_35_0_0;	// vector_unit.k:104:9
  logic        memory_rden_out_35_0_0;	// vector_unit.k:104:9
  logic [15:0] fifo_data_out_0_0;	// vector_unit.k:104:9
  logic        fifo_wren_0_0;	// vector_unit.k:104:9
  logic        input_rdy_0_0;	// vector_unit.k:104:9
  logic [7:0]  control_state_out_0;	// vector_unit.k:104:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// vector_unit.k:104:9
  wire         _GEN_0 = _GEN & input_valid_0;	// vector_unit.k:104:9
  always_comb begin	// vector_unit.k:104:9
    input_rdy_0_0 = _GEN;	// vector_unit.k:104:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// vector_unit.k:104:9
  end // always_comb
  always_comb begin	// vector_unit.k:104:9
    memory_read_addr_out_35_0_0 = data_in_21[11:0];	// vector_unit.k:107:22
    memory_rden_out_35_0_0 = _GEN_0;	// vector_unit.k:104:9, :107:22
  end // always_comb
  reg   [15:0] p0_data_in_21;	// vector_unit.k:104:9
  reg          p0_stage1_enable = 1'h0;	// vector_unit.k:104:9
  reg          p0_stage2_enable = 1'h0;	// vector_unit.k:104:9
  reg   [15:0] p0_memory_read_data_in_35_0;	// vector_unit.k:104:9
  reg          p0_stage3_enable = 1'h0;	// vector_unit.k:104:9
  always @(posedge clk) begin	// vector_unit.k:104:9
    p0_data_in_21 <= data_in_21;	// vector_unit.k:104:9
    if (rst) begin	// vector_unit.k:104:9
      p0_stage1_enable <= 1'h0;	// vector_unit.k:104:9
      p0_stage2_enable <= 1'h0;	// vector_unit.k:104:9
    end
    else begin	// vector_unit.k:104:9
      p0_stage1_enable <= _GEN_0;	// vector_unit.k:104:9
      p0_stage2_enable <= p0_stage1_enable;	// vector_unit.k:104:9
    end
    p0_memory_read_data_in_35_0 <= memory_read_data_in_35_0_0;	// vector_unit.k:104:9
    if (rst)	// vector_unit.k:104:9
      p0_stage3_enable <= 1'h0;	// vector_unit.k:104:9
    else	// vector_unit.k:104:9
      p0_stage3_enable <= p0_stage2_enable;	// vector_unit.k:104:9
  end // always @(posedge)
  always_comb begin	// vector_unit.k:104:9
    fifo_wren_0_0 = p0_stage3_enable;	// vector_unit.k:102:5, :104:9
    fifo_data_out_0_0 = p0_memory_read_data_in_35_0;	// vector_unit.k:102:5, :104:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// vector_unit.k:104:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// vector_unit.k:104:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  vector_unitDebugView_get_gamma_pre_attnEntry vector_unitDebugView_get_gamma_pre_attnEntry_instance (	// vector_unit.k:102:5
    .clk       (clk),	// vector_unit.k:102:5
    ._index    (p0_stage1_enable ? p0_data_in_21 : 'x),	// vector_unit.k:102:5, :104:9
    .valid     (p0_stage1_enable),	// vector_unit.k:104:9
    .valid_out (/* unused */)
  );	// vector_unit.k:102:5
  vector_unitDebugView_get_gamma_pre_attnExit vector_unitDebugView_get_gamma_pre_attnExit_instance (	// vector_unit.k:102:5
    .clk          (clk),	// vector_unit.k:102:5
    ._ReturnValue (p0_stage2_enable ? memory_read_data_in_35_0_0 : 'x),	// vector_unit.k:102:5, :104:9
    .valid        (p0_stage2_enable),	// vector_unit.k:104:9
    .valid_out    (/* unused */)
  );	// vector_unit.k:102:5
  assign done_out = p0_stage3_enable;	// vector_unit.k:104:9
  assign memory_read_addr_out_35_0 = memory_read_addr_out_35_0_0;	// vector_unit.k:104:9
  assign memory_rden_out_35_0 = memory_rden_out_35_0_0;	// vector_unit.k:104:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// vector_unit.k:104:9
  assign fifo_wren_0 = fifo_wren_0_0;	// vector_unit.k:104:9
  assign input_rdy_0 = input_rdy_0_0;	// vector_unit.k:104:9
  assign control_state_out = control_state_out_0;	// vector_unit.k:104:9
endmodule

module vector_unit_set_gamma_pre_attn_BasicBlock_0(	// vector_unit.k:96:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  output wire [15:0] memory_write_data_out_35_0,
  output wire [11:0] memory_write_addr_out_35_0,
  output wire        memory_wren_35_0,
  output wire        fifo_wren_0,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [31:0] data_in_20,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  logic        done_out_0;	// vector_unit.k:96:9
  logic [15:0] memory_write_data_out_35_0_0;	// vector_unit.k:96:9
  logic [11:0] memory_write_addr_out_35_0_0;	// vector_unit.k:96:9
  logic        memory_wren_35_0_0;	// vector_unit.k:96:9
  logic        fifo_wren_0_0;	// vector_unit.k:96:9
  logic        input_rdy_0_0;	// vector_unit.k:96:9
  logic [7:0]  control_state_out_0;	// vector_unit.k:96:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// vector_unit.k:96:9
  wire         _GEN_0 = _GEN & input_valid_0;	// vector_unit.k:96:9
  always_comb begin	// vector_unit.k:96:9
    input_rdy_0_0 = _GEN;	// vector_unit.k:96:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// vector_unit.k:96:9
  end // always_comb
  always_comb begin	// vector_unit.k:96:9
    memory_wren_35_0_0 = _GEN_0;	// vector_unit.k:96:9, :98:13
    memory_write_addr_out_35_0_0 = data_in_20[11:0];	// vector_unit.k:98:13
    memory_write_data_out_35_0_0 = data_in_20[31:16];	// vector_unit.k:98:13
  end // always_comb
  reg   [15:0] p0_index;	// vector_unit.k:96:9
  reg   [15:0] p0_value;	// vector_unit.k:96:9
  reg          p0_stage1_enable = 1'h0;	// vector_unit.k:96:9
  reg          p0_stage2_enable = 1'h0;	// vector_unit.k:96:9
  always @(posedge clk) begin	// vector_unit.k:96:9
    p0_index <= data_in_20[15:0];	// vector_unit.k:96:9
    p0_value <= data_in_20[31:16];	// vector_unit.k:96:9
    if (rst) begin	// vector_unit.k:96:9
      p0_stage1_enable <= 1'h0;	// vector_unit.k:96:9
      p0_stage2_enable <= 1'h0;	// vector_unit.k:96:9
    end
    else begin	// vector_unit.k:96:9
      p0_stage1_enable <= _GEN_0;	// vector_unit.k:96:9
      p0_stage2_enable <= p0_stage1_enable;	// vector_unit.k:96:9
    end
  end // always @(posedge)
  always_comb	// vector_unit.k:96:9
    fifo_wren_0_0 = p0_stage2_enable;	// vector_unit.k:96:9, :100:9
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// vector_unit.k:96:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// vector_unit.k:96:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  vector_unitDebugView_set_gamma_pre_attnEntry vector_unitDebugView_set_gamma_pre_attnEntry_instance (	// vector_unit.k:100:9
    .clk       (clk),	// vector_unit.k:100:9
    ._index    (p0_stage1_enable ? p0_index : 'x),	// vector_unit.k:96:9, :100:9
    ._value    (p0_stage1_enable ? p0_value : 'x),	// vector_unit.k:96:9, :100:9
    .valid     (p0_stage1_enable),	// vector_unit.k:96:9
    .valid_out (/* unused */)
  );	// vector_unit.k:100:9
  assign done_out = p0_stage2_enable;	// vector_unit.k:96:9
  assign memory_write_data_out_35_0 = memory_write_data_out_35_0_0;	// vector_unit.k:96:9
  assign memory_write_addr_out_35_0 = memory_write_addr_out_35_0_0;	// vector_unit.k:96:9
  assign memory_wren_35_0 = memory_wren_35_0_0;	// vector_unit.k:96:9
  assign fifo_wren_0 = fifo_wren_0_0;	// vector_unit.k:96:9
  assign input_rdy_0 = input_rdy_0_0;	// vector_unit.k:96:9
  assign control_state_out = control_state_out_0;	// vector_unit.k:96:9
endmodule

module vector_unit_rmsnorm_reset_BasicBlock_0(	// vector_unit.k:87:9
  input  wire       clk,
  input  wire       rst,
  output wire       done_out,
  output wire       global_out__sum_sq_34_1_valid,
  output wire       fifo_wren_0,
  input  wire       fifo_almost_full_in_raw_0,
  input  wire       fifo_overflow_in_0,
  input  wire       input_fifo_underflow_0,
  output wire       input_rdy_0,
  input  wire       input_valid_0,
  output wire [7:0] control_state_out
);

  wire        _fifo_overflow_ffc_0_data_out;
  wire        _fifo_almostfull_ffc_0_data_out;
  logic       done_out_0;	// vector_unit.k:87:9
  logic       global_out__sum_sq_34_1_valid_0;	// vector_unit.k:87:9
  logic       fifo_wren_0_0;	// vector_unit.k:87:9
  logic       input_rdy_0_0;	// vector_unit.k:87:9
  logic [7:0] control_state_out_0;	// vector_unit.k:87:9
  wire        _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// vector_unit.k:87:9
  always_comb begin	// vector_unit.k:87:9
    input_rdy_0_0 = _GEN;	// vector_unit.k:87:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// vector_unit.k:87:9
  end // always_comb
  reg         p0_stage1_enable = 1'h0;	// vector_unit.k:87:9
  always_comb	// vector_unit.k:87:9
    global_out__sum_sq_34_1_valid_0 = p0_stage1_enable;	// vector_unit.k:87:9
  reg         p0_stage2_enable = 1'h0;	// vector_unit.k:87:9
  always @(posedge clk) begin	// vector_unit.k:87:9
    if (rst) begin	// vector_unit.k:87:9
      p0_stage1_enable <= 1'h0;	// vector_unit.k:87:9
      p0_stage2_enable <= 1'h0;	// vector_unit.k:87:9
    end
    else begin	// vector_unit.k:87:9
      p0_stage1_enable <= _GEN & input_valid_0;	// vector_unit.k:87:9
      p0_stage2_enable <= p0_stage1_enable;	// vector_unit.k:87:9
    end
  end // always @(posedge)
  always_comb	// vector_unit.k:87:9
    fifo_wren_0_0 = p0_stage2_enable;	// vector_unit.k:87:9, :92:9
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// vector_unit.k:87:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// vector_unit.k:87:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  assign done_out = p0_stage2_enable;	// vector_unit.k:87:9
  assign global_out__sum_sq_34_1_valid = global_out__sum_sq_34_1_valid_0;	// vector_unit.k:87:9
  assign fifo_wren_0 = fifo_wren_0_0;	// vector_unit.k:87:9
  assign input_rdy_0 = input_rdy_0_0;	// vector_unit.k:87:9
  assign control_state_out = control_state_out_0;	// vector_unit.k:87:9
endmodule

module vector_unit_rmsnorm_get_sum_BasicBlock_0(	// vector_unit.k:77:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  input  wire [31:0] global_in__sum_sq_34,
  output wire [31:0] fifo_data_out_0,
  output wire        fifo_wren_0,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  wire  [31:0] global_in__sum_sq_34_0 = global_in__sum_sq_34;	// vector_unit.k:77:9
  logic        done_out_0;	// vector_unit.k:77:9
  logic [31:0] fifo_data_out_0_0;	// vector_unit.k:77:9
  logic        fifo_wren_0_0;	// vector_unit.k:77:9
  logic        input_rdy_0_0;	// vector_unit.k:77:9
  logic [7:0]  control_state_out_0;	// vector_unit.k:77:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// vector_unit.k:77:9
  always_comb begin	// vector_unit.k:77:9
    input_rdy_0_0 = _GEN;	// vector_unit.k:77:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// vector_unit.k:77:9
  end // always_comb
  reg          p0_stage1_enable = 1'h0;	// vector_unit.k:77:9
  reg   [31:0] p0_global_in__sum_sq_34;	// vector_unit.k:77:9
  reg          p0_stage2_enable = 1'h0;	// vector_unit.k:77:9
  always @(posedge clk) begin	// vector_unit.k:77:9
    if (rst)	// vector_unit.k:77:9
      p0_stage1_enable <= 1'h0;	// vector_unit.k:77:9
    else	// vector_unit.k:77:9
      p0_stage1_enable <= _GEN & input_valid_0;	// vector_unit.k:77:9
    p0_global_in__sum_sq_34 <= global_in__sum_sq_34_0;	// vector_unit.k:77:9
    if (rst)	// vector_unit.k:77:9
      p0_stage2_enable <= 1'h0;	// vector_unit.k:77:9
    else	// vector_unit.k:77:9
      p0_stage2_enable <= p0_stage1_enable;	// vector_unit.k:77:9
  end // always @(posedge)
  always_comb begin	// vector_unit.k:77:9
    fifo_wren_0_0 = p0_stage2_enable;	// vector_unit.k:75:5, :77:9
    fifo_data_out_0_0 = p0_global_in__sum_sq_34;	// vector_unit.k:75:5, :77:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// vector_unit.k:77:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// vector_unit.k:77:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  vector_unitDebugView_rmsnorm_get_sumExit vector_unitDebugView_rmsnorm_get_sumExit_instance (	// vector_unit.k:75:5
    .clk          (clk),	// vector_unit.k:75:5
    ._ReturnValue (p0_stage1_enable ? global_in__sum_sq_34_0 : 'x),	// vector_unit.k:75:5, :77:9
    .valid        (p0_stage1_enable),	// vector_unit.k:77:9
    .valid_out    (/* unused */)
  );	// vector_unit.k:75:5
  assign done_out = p0_stage2_enable;	// vector_unit.k:77:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// vector_unit.k:77:9
  assign fifo_wren_0 = fifo_wren_0_0;	// vector_unit.k:77:9
  assign input_rdy_0 = input_rdy_0_0;	// vector_unit.k:77:9
  assign control_state_out = control_state_out_0;	// vector_unit.k:77:9
endmodule

module vector_unit_rmsnorm_accumulate_BasicBlock_0(	// vector_unit.k:31:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  input  wire [31:0] global_in__sum_sq_34,
  output wire        global_out__sum_sq_34_0_valid,
  output wire [31:0] global_out__sum_sq_34_0,
  output wire        fifo_wren_0,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [15:0] data_in_17,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  wire  [31:0] global_in__sum_sq_34_0 = global_in__sum_sq_34;	// vector_unit.k:31:9
  logic        done_out_0;	// vector_unit.k:31:9
  logic        global_out__sum_sq_34_0_valid_0;	// vector_unit.k:31:9
  logic [31:0] global_out__sum_sq_34_0_0;	// vector_unit.k:31:9
  logic        fifo_wren_0_0;	// vector_unit.k:31:9
  logic        input_rdy_0_0;	// vector_unit.k:31:9
  logic [7:0]  control_state_out_0;	// vector_unit.k:31:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// vector_unit.k:31:9
  always_comb begin	// vector_unit.k:31:9
    input_rdy_0_0 = _GEN;	// vector_unit.k:31:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// vector_unit.k:31:9
  end // always_comb
  reg   [15:0] p0_data_in_17;	// vector_unit.k:31:9
  reg          p0_stage1_enable = 1'h0;	// vector_unit.k:31:9
  wire  [15:0] _GEN_0 = {7'h0, p0_data_in_17[14:7], 1'h0};	// vector_unit.k:31:9, :57:39, :62:39
  wire         prod = p0_data_in_17[6] & p0_data_in_17[0];	// vector_unit.k:31:9, :40:{21,33}, :44:{21,25}
  wire         prod_0 = p0_data_in_17[5] & p0_data_in_17[0];	// vector_unit.k:31:9, :40:{21,33}, :44:{21,25}
  wire         prod_1 = p0_data_in_17[4] & p0_data_in_17[0];	// vector_unit.k:31:9, :40:{21,33}, :44:{21,25}
  wire         prod_2 = p0_data_in_17[3] & p0_data_in_17[0];	// vector_unit.k:31:9, :40:{21,33}, :44:{21,25}
  wire         prod_3 = p0_data_in_17[2] & p0_data_in_17[0];	// vector_unit.k:31:9, :40:{21,33}, :44:{21,25}
  wire         prod_4 = p0_data_in_17[1] & p0_data_in_17[0];	// vector_unit.k:31:9, :40:{21,33}, :44:{21,25}
  wire  [9:0]  _prod_plus_ma32_shl_1_ =
    10'({2'h0,
         p0_data_in_17[0],
         prod,
         prod_0,
         prod_1,
         prod_2,
         prod_3,
         prod_4,
         p0_data_in_17[0]} + {2'h1, p0_data_in_17[6:0], 1'h0});	// vector_unit.k:31:9, :40:{21,33}, :44:{21,25}, :45:{51,58}
  wire         prod_5 = _prod_plus_ma32_shl_1_[9] & p0_data_in_17[1];	// vector_unit.k:31:9, :40:{21,33}, :45:{21,25,51}
  wire         prod_6 = _prod_plus_ma32_shl_1_[8] & p0_data_in_17[1];	// vector_unit.k:31:9, :40:{21,33}, :45:{21,25,51}
  wire         prod_7 =
    _prod_plus_ma32_shl_1_[7]
      ? p0_data_in_17[0] | p0_data_in_17[1]
      : p0_data_in_17[0] & ~(p0_data_in_17[1]);	// vector_unit.k:31:9, :40:{21,33}, :45:{21,25,51}
  wire         prod_8 =
    _prod_plus_ma32_shl_1_[6] ? prod | p0_data_in_17[1] : prod & ~(p0_data_in_17[1]);	// vector_unit.k:31:9, :40:{21,33}, :44:{21,25}, :45:{21,25,51}
  wire         prod_9 =
    _prod_plus_ma32_shl_1_[5] ? prod_0 | p0_data_in_17[1] : prod_0 & ~(p0_data_in_17[1]);	// vector_unit.k:31:9, :40:{21,33}, :44:{21,25}, :45:{21,25,51}
  wire         prod_10 =
    _prod_plus_ma32_shl_1_[4] ? prod_1 | p0_data_in_17[1] : prod_1 & ~(p0_data_in_17[1]);	// vector_unit.k:31:9, :40:{21,33}, :44:{21,25}, :45:{21,25,51}
  wire         prod_11 =
    _prod_plus_ma32_shl_1_[3] ? prod_2 | p0_data_in_17[1] : prod_2 & ~(p0_data_in_17[1]);	// vector_unit.k:31:9, :40:{21,33}, :44:{21,25}, :45:{21,25,51}
  wire         prod_12 =
    _prod_plus_ma32_shl_1_[2] ? prod_3 | p0_data_in_17[1] : prod_3 & ~(p0_data_in_17[1]);	// vector_unit.k:31:9, :40:{21,33}, :44:{21,25}, :45:{21,25,51}
  wire         prod_13 =
    _prod_plus_ma32_shl_1_[1] ? prod_4 | p0_data_in_17[1] : prod_4 & ~(p0_data_in_17[1]);	// vector_unit.k:31:9, :40:{21,33}, :44:{21,25}, :45:{21,25,51}
  wire         prod_14 =
    _prod_plus_ma32_shl_1_[0]
      ? p0_data_in_17[0] | p0_data_in_17[1]
      : p0_data_in_17[0] & ~(p0_data_in_17[1]);	// vector_unit.k:31:9, :40:{21,33}, :45:{21,25,51}
  wire  [10:0] _prod_plus_ma32_shl_2_ =
    11'({1'h0,
         prod_5,
         prod_6,
         prod_7,
         prod_8,
         prod_9,
         prod_10,
         prod_11,
         prod_12,
         prod_13,
         prod_14} + {2'h1, p0_data_in_17[6:0], 2'h0});	// vector_unit.k:31:9, :45:{21,25}, :46:{51,58}
  wire         prod_15 = _prod_plus_ma32_shl_2_[10] & p0_data_in_17[2];	// vector_unit.k:31:9, :40:{21,33}, :46:{21,25,51}
  wire         prod_16 =
    _prod_plus_ma32_shl_2_[9] ? prod_5 | p0_data_in_17[2] : prod_5 & ~(p0_data_in_17[2]);	// vector_unit.k:31:9, :40:{21,33}, :45:{21,25}, :46:{21,25,51}
  wire         prod_17 =
    _prod_plus_ma32_shl_2_[8] ? prod_6 | p0_data_in_17[2] : prod_6 & ~(p0_data_in_17[2]);	// vector_unit.k:31:9, :40:{21,33}, :45:{21,25}, :46:{21,25,51}
  wire         prod_18 =
    _prod_plus_ma32_shl_2_[7] ? prod_7 | p0_data_in_17[2] : prod_7 & ~(p0_data_in_17[2]);	// vector_unit.k:31:9, :40:{21,33}, :45:{21,25}, :46:{21,25,51}
  wire         prod_19 =
    _prod_plus_ma32_shl_2_[6] ? prod_8 | p0_data_in_17[2] : prod_8 & ~(p0_data_in_17[2]);	// vector_unit.k:31:9, :40:{21,33}, :45:{21,25}, :46:{21,25,51}
  wire         prod_20 =
    _prod_plus_ma32_shl_2_[5] ? prod_9 | p0_data_in_17[2] : prod_9 & ~(p0_data_in_17[2]);	// vector_unit.k:31:9, :40:{21,33}, :45:{21,25}, :46:{21,25,51}
  wire         prod_21 =
    _prod_plus_ma32_shl_2_[4]
      ? prod_10 | p0_data_in_17[2]
      : prod_10 & ~(p0_data_in_17[2]);	// vector_unit.k:31:9, :40:{21,33}, :45:{21,25}, :46:{21,25,51}
  wire         prod_22 =
    _prod_plus_ma32_shl_2_[3]
      ? prod_11 | p0_data_in_17[2]
      : prod_11 & ~(p0_data_in_17[2]);	// vector_unit.k:31:9, :40:{21,33}, :45:{21,25}, :46:{21,25,51}
  wire         prod_23 =
    _prod_plus_ma32_shl_2_[2]
      ? prod_12 | p0_data_in_17[2]
      : prod_12 & ~(p0_data_in_17[2]);	// vector_unit.k:31:9, :40:{21,33}, :45:{21,25}, :46:{21,25,51}
  wire         prod_24 =
    _prod_plus_ma32_shl_2_[1]
      ? prod_13 | p0_data_in_17[2]
      : prod_13 & ~(p0_data_in_17[2]);	// vector_unit.k:31:9, :40:{21,33}, :45:{21,25}, :46:{21,25,51}
  wire         prod_25 =
    _prod_plus_ma32_shl_2_[0]
      ? prod_14 | p0_data_in_17[2]
      : prod_14 & ~(p0_data_in_17[2]);	// vector_unit.k:31:9, :40:{21,33}, :45:{21,25}, :46:{21,25,51}
  wire  [11:0] _prod_plus_ma32_shl_3_ =
    12'({1'h0,
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
         prod_25} + {2'h1, p0_data_in_17[6:0], 3'h0});	// vector_unit.k:31:9, :46:{21,25}, :47:{51,58}
  wire         prod_26 = _prod_plus_ma32_shl_3_[11] & p0_data_in_17[3];	// vector_unit.k:31:9, :40:{21,33}, :47:{21,25,51}
  wire         prod_27 =
    _prod_plus_ma32_shl_3_[10]
      ? prod_15 | p0_data_in_17[3]
      : prod_15 & ~(p0_data_in_17[3]);	// vector_unit.k:31:9, :40:{21,33}, :46:{21,25}, :47:{21,25,51}
  wire         prod_28 =
    _prod_plus_ma32_shl_3_[9]
      ? prod_16 | p0_data_in_17[3]
      : prod_16 & ~(p0_data_in_17[3]);	// vector_unit.k:31:9, :40:{21,33}, :46:{21,25}, :47:{21,25,51}
  wire         prod_29 =
    _prod_plus_ma32_shl_3_[8]
      ? prod_17 | p0_data_in_17[3]
      : prod_17 & ~(p0_data_in_17[3]);	// vector_unit.k:31:9, :40:{21,33}, :46:{21,25}, :47:{21,25,51}
  wire         prod_30 =
    _prod_plus_ma32_shl_3_[7]
      ? prod_18 | p0_data_in_17[3]
      : prod_18 & ~(p0_data_in_17[3]);	// vector_unit.k:31:9, :40:{21,33}, :46:{21,25}, :47:{21,25,51}
  wire         prod_31 =
    _prod_plus_ma32_shl_3_[6]
      ? prod_19 | p0_data_in_17[3]
      : prod_19 & ~(p0_data_in_17[3]);	// vector_unit.k:31:9, :40:{21,33}, :46:{21,25}, :47:{21,25,51}
  wire         prod_32 =
    _prod_plus_ma32_shl_3_[5]
      ? prod_20 | p0_data_in_17[3]
      : prod_20 & ~(p0_data_in_17[3]);	// vector_unit.k:31:9, :40:{21,33}, :46:{21,25}, :47:{21,25,51}
  wire         prod_33 =
    _prod_plus_ma32_shl_3_[4]
      ? prod_21 | p0_data_in_17[3]
      : prod_21 & ~(p0_data_in_17[3]);	// vector_unit.k:31:9, :40:{21,33}, :46:{21,25}, :47:{21,25,51}
  wire         prod_34 =
    _prod_plus_ma32_shl_3_[3]
      ? prod_22 | p0_data_in_17[3]
      : prod_22 & ~(p0_data_in_17[3]);	// vector_unit.k:31:9, :40:{21,33}, :46:{21,25}, :47:{21,25,51}
  wire         prod_35 =
    _prod_plus_ma32_shl_3_[2]
      ? prod_23 | p0_data_in_17[3]
      : prod_23 & ~(p0_data_in_17[3]);	// vector_unit.k:31:9, :40:{21,33}, :46:{21,25}, :47:{21,25,51}
  wire         prod_36 =
    _prod_plus_ma32_shl_3_[1]
      ? prod_24 | p0_data_in_17[3]
      : prod_24 & ~(p0_data_in_17[3]);	// vector_unit.k:31:9, :40:{21,33}, :46:{21,25}, :47:{21,25,51}
  wire         prod_37 =
    _prod_plus_ma32_shl_3_[0]
      ? prod_25 | p0_data_in_17[3]
      : prod_25 & ~(p0_data_in_17[3]);	// vector_unit.k:31:9, :40:{21,33}, :46:{21,25}, :47:{21,25,51}
  wire  [12:0] _prod_plus_ma32_shl_4_ =
    13'({1'h0,
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
         prod_37} + {2'h1, p0_data_in_17[6:0], 4'h0});	// vector_unit.k:31:9, :47:{21,25}, :48:{51,58}
  wire         prod_38 = _prod_plus_ma32_shl_4_[12] & p0_data_in_17[4];	// vector_unit.k:31:9, :40:{21,33}, :48:{21,25,51}
  wire         prod_39 =
    _prod_plus_ma32_shl_4_[11]
      ? prod_26 | p0_data_in_17[4]
      : prod_26 & ~(p0_data_in_17[4]);	// vector_unit.k:31:9, :40:{21,33}, :47:{21,25}, :48:{21,25,51}
  wire         prod_40 =
    _prod_plus_ma32_shl_4_[10]
      ? prod_27 | p0_data_in_17[4]
      : prod_27 & ~(p0_data_in_17[4]);	// vector_unit.k:31:9, :40:{21,33}, :47:{21,25}, :48:{21,25,51}
  wire         prod_41 =
    _prod_plus_ma32_shl_4_[9]
      ? prod_28 | p0_data_in_17[4]
      : prod_28 & ~(p0_data_in_17[4]);	// vector_unit.k:31:9, :40:{21,33}, :47:{21,25}, :48:{21,25,51}
  wire         prod_42 =
    _prod_plus_ma32_shl_4_[8]
      ? prod_29 | p0_data_in_17[4]
      : prod_29 & ~(p0_data_in_17[4]);	// vector_unit.k:31:9, :40:{21,33}, :47:{21,25}, :48:{21,25,51}
  wire         prod_43 =
    _prod_plus_ma32_shl_4_[7]
      ? prod_30 | p0_data_in_17[4]
      : prod_30 & ~(p0_data_in_17[4]);	// vector_unit.k:31:9, :40:{21,33}, :47:{21,25}, :48:{21,25,51}
  wire         prod_44 =
    _prod_plus_ma32_shl_4_[6]
      ? prod_31 | p0_data_in_17[4]
      : prod_31 & ~(p0_data_in_17[4]);	// vector_unit.k:31:9, :40:{21,33}, :47:{21,25}, :48:{21,25,51}
  wire         prod_45 =
    _prod_plus_ma32_shl_4_[5]
      ? prod_32 | p0_data_in_17[4]
      : prod_32 & ~(p0_data_in_17[4]);	// vector_unit.k:31:9, :40:{21,33}, :47:{21,25}, :48:{21,25,51}
  wire         prod_46 =
    _prod_plus_ma32_shl_4_[4]
      ? prod_33 | p0_data_in_17[4]
      : prod_33 & ~(p0_data_in_17[4]);	// vector_unit.k:31:9, :40:{21,33}, :47:{21,25}, :48:{21,25,51}
  wire         prod_47 =
    _prod_plus_ma32_shl_4_[3]
      ? prod_34 | p0_data_in_17[4]
      : prod_34 & ~(p0_data_in_17[4]);	// vector_unit.k:31:9, :40:{21,33}, :47:{21,25}, :48:{21,25,51}
  wire         prod_48 =
    _prod_plus_ma32_shl_4_[2]
      ? prod_35 | p0_data_in_17[4]
      : prod_35 & ~(p0_data_in_17[4]);	// vector_unit.k:31:9, :40:{21,33}, :47:{21,25}, :48:{21,25,51}
  wire         prod_49 =
    _prod_plus_ma32_shl_4_[1]
      ? prod_36 | p0_data_in_17[4]
      : prod_36 & ~(p0_data_in_17[4]);	// vector_unit.k:31:9, :40:{21,33}, :47:{21,25}, :48:{21,25,51}
  wire         prod_50 =
    _prod_plus_ma32_shl_4_[0]
      ? prod_37 | p0_data_in_17[4]
      : prod_37 & ~(p0_data_in_17[4]);	// vector_unit.k:31:9, :40:{21,33}, :47:{21,25}, :48:{21,25,51}
  wire  [13:0] _prod_plus_ma32_shl_5_ =
    14'({1'h0,
         prod_38,
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
         prod_50} + {2'h1, p0_data_in_17[6:0], 5'h0});	// vector_unit.k:31:9, :48:{21,25}, :49:{51,58}
  wire         prod_51 = _prod_plus_ma32_shl_5_[13] & p0_data_in_17[5];	// vector_unit.k:31:9, :40:{21,33}, :49:{21,25,51}
  wire         prod_52 =
    _prod_plus_ma32_shl_5_[12]
      ? prod_38 | p0_data_in_17[5]
      : prod_38 & ~(p0_data_in_17[5]);	// vector_unit.k:31:9, :40:{21,33}, :48:{21,25}, :49:{21,25,51}
  wire         prod_53 =
    _prod_plus_ma32_shl_5_[11]
      ? prod_39 | p0_data_in_17[5]
      : prod_39 & ~(p0_data_in_17[5]);	// vector_unit.k:31:9, :40:{21,33}, :48:{21,25}, :49:{21,25,51}
  wire         prod_54 =
    _prod_plus_ma32_shl_5_[10]
      ? prod_40 | p0_data_in_17[5]
      : prod_40 & ~(p0_data_in_17[5]);	// vector_unit.k:31:9, :40:{21,33}, :48:{21,25}, :49:{21,25,51}
  wire         prod_55 =
    _prod_plus_ma32_shl_5_[9]
      ? prod_41 | p0_data_in_17[5]
      : prod_41 & ~(p0_data_in_17[5]);	// vector_unit.k:31:9, :40:{21,33}, :48:{21,25}, :49:{21,25,51}
  wire         prod_56 =
    _prod_plus_ma32_shl_5_[8]
      ? prod_42 | p0_data_in_17[5]
      : prod_42 & ~(p0_data_in_17[5]);	// vector_unit.k:31:9, :40:{21,33}, :48:{21,25}, :49:{21,25,51}
  wire         prod_57 =
    _prod_plus_ma32_shl_5_[7]
      ? prod_43 | p0_data_in_17[5]
      : prod_43 & ~(p0_data_in_17[5]);	// vector_unit.k:31:9, :40:{21,33}, :48:{21,25}, :49:{21,25,51}
  wire         prod_58 =
    _prod_plus_ma32_shl_5_[6]
      ? prod_44 | p0_data_in_17[5]
      : prod_44 & ~(p0_data_in_17[5]);	// vector_unit.k:31:9, :40:{21,33}, :48:{21,25}, :49:{21,25,51}
  wire         prod_59 =
    _prod_plus_ma32_shl_5_[5]
      ? prod_45 | p0_data_in_17[5]
      : prod_45 & ~(p0_data_in_17[5]);	// vector_unit.k:31:9, :40:{21,33}, :48:{21,25}, :49:{21,25,51}
  wire         prod_60 =
    _prod_plus_ma32_shl_5_[4]
      ? prod_46 | p0_data_in_17[5]
      : prod_46 & ~(p0_data_in_17[5]);	// vector_unit.k:31:9, :40:{21,33}, :48:{21,25}, :49:{21,25,51}
  wire         prod_61 =
    _prod_plus_ma32_shl_5_[3]
      ? prod_47 | p0_data_in_17[5]
      : prod_47 & ~(p0_data_in_17[5]);	// vector_unit.k:31:9, :40:{21,33}, :48:{21,25}, :49:{21,25,51}
  wire         prod_62 =
    _prod_plus_ma32_shl_5_[2]
      ? prod_48 | p0_data_in_17[5]
      : prod_48 & ~(p0_data_in_17[5]);	// vector_unit.k:31:9, :40:{21,33}, :48:{21,25}, :49:{21,25,51}
  wire         prod_63 =
    _prod_plus_ma32_shl_5_[1]
      ? prod_49 | p0_data_in_17[5]
      : prod_49 & ~(p0_data_in_17[5]);	// vector_unit.k:31:9, :40:{21,33}, :48:{21,25}, :49:{21,25,51}
  wire         prod_64 =
    _prod_plus_ma32_shl_5_[0]
      ? prod_50 | p0_data_in_17[5]
      : prod_50 & ~(p0_data_in_17[5]);	// vector_unit.k:31:9, :40:{21,33}, :48:{21,25}, :49:{21,25,51}
  wire  [14:0] _prod_plus_ma32_shl_6_ =
    15'({1'h0,
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
         prod_64} + {2'h1, p0_data_in_17[6:0], 6'h0});	// vector_unit.k:31:9, :49:{21,25}, :50:{51,58}
  wire  [15:0] _prod_plus_ma32_shl_7_ =
    16'({1'h0,
         _prod_plus_ma32_shl_6_[14] & p0_data_in_17[6],
         _prod_plus_ma32_shl_6_[13]
           ? prod_51 | p0_data_in_17[6]
           : prod_51 & ~(p0_data_in_17[6]),
         _prod_plus_ma32_shl_6_[12]
           ? prod_52 | p0_data_in_17[6]
           : prod_52 & ~(p0_data_in_17[6]),
         _prod_plus_ma32_shl_6_[11]
           ? prod_53 | p0_data_in_17[6]
           : prod_53 & ~(p0_data_in_17[6]),
         _prod_plus_ma32_shl_6_[10]
           ? prod_54 | p0_data_in_17[6]
           : prod_54 & ~(p0_data_in_17[6]),
         _prod_plus_ma32_shl_6_[9]
           ? prod_55 | p0_data_in_17[6]
           : prod_55 & ~(p0_data_in_17[6]),
         _prod_plus_ma32_shl_6_[8]
           ? prod_56 | p0_data_in_17[6]
           : prod_56 & ~(p0_data_in_17[6]),
         _prod_plus_ma32_shl_6_[7]
           ? prod_57 | p0_data_in_17[6]
           : prod_57 & ~(p0_data_in_17[6]),
         _prod_plus_ma32_shl_6_[6]
           ? prod_58 | p0_data_in_17[6]
           : prod_58 & ~(p0_data_in_17[6]),
         _prod_plus_ma32_shl_6_[5]
           ? prod_59 | p0_data_in_17[6]
           : prod_59 & ~(p0_data_in_17[6]),
         _prod_plus_ma32_shl_6_[4]
           ? prod_60 | p0_data_in_17[6]
           : prod_60 & ~(p0_data_in_17[6]),
         _prod_plus_ma32_shl_6_[3]
           ? prod_61 | p0_data_in_17[6]
           : prod_61 & ~(p0_data_in_17[6]),
         _prod_plus_ma32_shl_6_[2]
           ? prod_62 | p0_data_in_17[6]
           : prod_62 & ~(p0_data_in_17[6]),
         _prod_plus_ma32_shl_6_[1]
           ? prod_63 | p0_data_in_17[6]
           : prod_63 & ~(p0_data_in_17[6]),
         _prod_plus_ma32_shl_6_[0]
           ? prod_64 | p0_data_in_17[6]
           : prod_64 & ~(p0_data_in_17[6])} + {2'h1, p0_data_in_17[6:0], 7'h0});	// vector_unit.k:31:9, :40:{21,33}, :49:{21,25}, :50:{21,51}, :51:{51,58}
  wire  [15:0] r_exp =
    _prod_plus_ma32_shl_7_[15] ? 16'(_GEN_0 - 16'h7E) : 16'(_GEN_0 - 16'h7F);	// vector_unit.k:51:{21,51}, :54:21, :57:{33,39,47}, :62:{33,39}
  wire         _GEN_1 = r_exp < 16'hFF & (|r_exp) & (|(p0_data_in_17[14:7]));	// vector_unit.k:31:9, :37:{17,32}, :38:{17,21}, :54:21, :56:{34,47}, :61:{34,47}, :64:{21,25,31,44}, :66:32, :70:33
  wire         _GEN_2 = ~(_prod_plus_ma32_shl_7_[15]) & _GEN_1;	// vector_unit.k:38:17, :51:{21,51}, :54:21, :56:{34,47}, :61:{34,47}, :64:{21,25}, :66:32, :70:33
  always_comb begin	// vector_unit.k:31:9
    global_out__sum_sq_34_0_0 =
      32'(global_in__sum_sq_34_0
          + {16'h0,
             r_exp[8] & _GEN_1,
             r_exp[7] & _GEN_1,
             r_exp[6] & _GEN_1,
             r_exp[5] & _GEN_1,
             r_exp[4] & _GEN_1,
             r_exp[3] & _GEN_1,
             r_exp[2] & _GEN_1,
             r_exp[1] & _GEN_1,
             r_exp[0] & _GEN_1,
             _prod_plus_ma32_shl_7_[14]
               ? (_prod_plus_ma32_shl_7_[13] | _prod_plus_ma32_shl_7_[15]) & _GEN_1
               : _prod_plus_ma32_shl_7_[13] & _GEN_2,
             _prod_plus_ma32_shl_7_[13]
               ? (_prod_plus_ma32_shl_7_[12] | _prod_plus_ma32_shl_7_[15]) & _GEN_1
               : _prod_plus_ma32_shl_7_[12] & _GEN_2,
             _prod_plus_ma32_shl_7_[12]
               ? (_prod_plus_ma32_shl_7_[11] | _prod_plus_ma32_shl_7_[15]) & _GEN_1
               : _prod_plus_ma32_shl_7_[11] & _GEN_2,
             _prod_plus_ma32_shl_7_[11]
               ? (_prod_plus_ma32_shl_7_[10] | _prod_plus_ma32_shl_7_[15]) & _GEN_1
               : _prod_plus_ma32_shl_7_[10] & _GEN_2,
             _prod_plus_ma32_shl_7_[10]
               ? (_prod_plus_ma32_shl_7_[9] | _prod_plus_ma32_shl_7_[15]) & _GEN_1
               : _prod_plus_ma32_shl_7_[9] & _GEN_2,
             _prod_plus_ma32_shl_7_[9]
               ? (_prod_plus_ma32_shl_7_[8] | _prod_plus_ma32_shl_7_[15]) & _GEN_1
               : _prod_plus_ma32_shl_7_[8] & _GEN_2,
             _prod_plus_ma32_shl_7_[8]
               ? (_prod_plus_ma32_shl_7_[7] | _prod_plus_ma32_shl_7_[15]) & _GEN_1
               : _prod_plus_ma32_shl_7_[7] & _GEN_2});	// vector_unit.k:31:9, :38:17, :51:{21,51}, :54:21, :56:{34,47}, :61:{34,47}, :64:{21,25}, :66:32, :70:{23,33}
    global_out__sum_sq_34_0_valid_0 = p0_stage1_enable;	// vector_unit.k:31:9
  end // always_comb
  reg          p0_stage2_enable = 1'h0;	// vector_unit.k:31:9
  always @(posedge clk) begin	// vector_unit.k:31:9
    p0_data_in_17 <= data_in_17;	// vector_unit.k:31:9
    if (rst) begin	// vector_unit.k:31:9
      p0_stage1_enable <= 1'h0;	// vector_unit.k:31:9
      p0_stage2_enable <= 1'h0;	// vector_unit.k:31:9
    end
    else begin	// vector_unit.k:31:9
      p0_stage1_enable <= _GEN & input_valid_0;	// vector_unit.k:31:9
      p0_stage2_enable <= p0_stage1_enable;	// vector_unit.k:31:9
    end
  end // always @(posedge)
  always_comb	// vector_unit.k:31:9
    fifo_wren_0_0 = p0_stage2_enable;	// vector_unit.k:31:9, :73:9
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// vector_unit.k:31:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// vector_unit.k:31:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  vector_unitDebugView_rmsnorm_accumulateEntry vector_unitDebugView_rmsnorm_accumulateEntry_instance (	// vector_unit.k:73:9
    .clk       (clk),	// vector_unit.k:73:9
    ._x_bf16   (p0_stage1_enable ? p0_data_in_17 : 'x),	// vector_unit.k:31:9, :73:9
    .valid     (p0_stage1_enable),	// vector_unit.k:31:9
    .valid_out (/* unused */)
  );	// vector_unit.k:73:9
  assign done_out = p0_stage2_enable;	// vector_unit.k:31:9
  assign global_out__sum_sq_34_0_valid = global_out__sum_sq_34_0_valid_0;	// vector_unit.k:31:9
  assign global_out__sum_sq_34_0 = global_out__sum_sq_34_0_0;	// vector_unit.k:31:9
  assign fifo_wren_0 = fifo_wren_0_0;	// vector_unit.k:31:9
  assign input_rdy_0 = input_rdy_0_0;	// vector_unit.k:31:9
  assign control_state_out = control_state_out_0;	// vector_unit.k:31:9
endmodule

module vector_unit_reg_32_w2_v_1_32_0_i_32_0(
  input  wire        clk,
  input  wire        rst,
  input  wire        input_valid_0,
  input  wire [31:0] input_0,
  input  wire        input_valid_1,
  output wire [31:0] value_out
);

  reg [31:0] value;
  always @(posedge clk) begin
    if (rst)
      value <= 32'h0;
    else
      value <= input_valid_1 ? 32'h0 : input_valid_0 ? input_0 : value;
  end // always @(posedge)
  assign value_out = value;
endmodule

module vector_unit__gamma_pre_attn__mem_container(	// vector_unit.k:15:5
  input  wire        clk,
  input  wire        rst,
  input  wire        rden_in_0,
  input  wire [11:0] read_addr_in_0,
  input  wire        wren_in_0,
  input  wire [11:0] write_addr_in_0,
  input  wire [15:0] write_data_in_0,
  output wire [15:0] read_data_out_0,
  output wire        init_completed
);

  wire [1:0][15:0] ___gamma_pre_attn_0_data_out;	// vector_unit.k:15:5
  KanagawaSyncRam #(
    .DATA_WIDTH(16),
    .ADDR_WIDTH(12),
    .DEPTH(4096),
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
  ) __gamma_pre_attn_0 (	// vector_unit.k:15:5
    .clk            (clk),	// vector_unit.k:15:5
    .rst            (rst),
    .addr_in        ({{read_addr_in_0}, {write_addr_in_0}}),	// vector_unit.k:15:5
    .ecc_status_out (/* unused */),
    .wren_in        ({{1'h0}, {wren_in_0}}),	// vector_unit.k:15:5
    .data_in        ({{16'h0}, {write_data_in_0}}),	// vector_unit.k:15:5
    .rden_in        ({{rden_in_0}, {1'h0}}),	// vector_unit.k:15:5
    .data_out       (___gamma_pre_attn_0_data_out)
  );	// vector_unit.k:15:5
  assign read_data_out_0 = ___gamma_pre_attn_0_data_out[1'h1];	// vector_unit.k:15:5
  assign init_completed = 1'h1;	// vector_unit.k:15:5
endmodule

module vector_unit__gamma_pre_mlp__mem_container(	// vector_unit.k:16:5
  input  wire        clk,
  input  wire        rst,
  input  wire        rden_in_0,
  input  wire [11:0] read_addr_in_0,
  input  wire        wren_in_0,
  input  wire [11:0] write_addr_in_0,
  input  wire [15:0] write_data_in_0,
  output wire [15:0] read_data_out_0,
  output wire        init_completed
);

  wire [1:0][15:0] ___gamma_pre_mlp_0_data_out;	// vector_unit.k:16:5
  KanagawaSyncRam #(
    .DATA_WIDTH(16),
    .ADDR_WIDTH(12),
    .DEPTH(4096),
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
  ) __gamma_pre_mlp_0 (	// vector_unit.k:16:5
    .clk            (clk),	// vector_unit.k:16:5
    .rst            (rst),
    .addr_in        ({{read_addr_in_0}, {write_addr_in_0}}),	// vector_unit.k:16:5
    .ecc_status_out (/* unused */),
    .wren_in        ({{1'h0}, {wren_in_0}}),	// vector_unit.k:16:5
    .data_in        ({{16'h0}, {write_data_in_0}}),	// vector_unit.k:16:5
    .rden_in        ({{rden_in_0}, {1'h0}}),	// vector_unit.k:16:5
    .data_out       (___gamma_pre_mlp_0_data_out)
  );	// vector_unit.k:16:5
  assign read_data_out_0 = ___gamma_pre_mlp_0_data_out[1'h1];	// vector_unit.k:16:5
  assign init_completed = 1'h1;	// vector_unit.k:16:5
endmodule

module vector_unit__rsqrt_lut__mem_container(	// vector_unit.k:17:5
  input  wire        clk,
  input  wire        rst,
  input  wire        rden_in_0,
  input  wire [7:0]  read_addr_in_0,
  input  wire        wren_in_0,
  input  wire [7:0]  write_addr_in_0,
  input  wire [15:0] write_data_in_0,
  output wire [15:0] read_data_out_0,
  output wire        init_completed
);

  wire [1:0][15:0] ___rsqrt_lut_0_data_out;	// vector_unit.k:17:5
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
  ) __rsqrt_lut_0 (	// vector_unit.k:17:5
    .clk            (clk),	// vector_unit.k:17:5
    .rst            (rst),
    .addr_in        ({{read_addr_in_0}, {write_addr_in_0}}),	// vector_unit.k:17:5
    .ecc_status_out (/* unused */),
    .wren_in        ({{1'h0}, {wren_in_0}}),	// vector_unit.k:17:5
    .data_in        ({{16'h0}, {write_data_in_0}}),	// vector_unit.k:17:5
    .rden_in        ({{rden_in_0}, {1'h0}}),	// vector_unit.k:17:5
    .data_out       (___rsqrt_lut_0_data_out)
  );	// vector_unit.k:17:5
  assign read_data_out_0 = ___rsqrt_lut_0_data_out[1'h1];	// vector_unit.k:17:5
  assign init_completed = 1'h1;	// vector_unit.k:17:5
endmodule

module vector_unit__sigmoid_lut__mem_container(	// vector_unit.k:20:5
  input  wire        clk,
  input  wire        rst,
  input  wire        rden_in_0,
  input  wire [7:0]  read_addr_in_0,
  input  wire        wren_in_0,
  input  wire [7:0]  write_addr_in_0,
  input  wire [15:0] write_data_in_0,
  output wire [15:0] read_data_out_0,
  output wire        init_completed
);

  wire [1:0][15:0] ___sigmoid_lut_0_data_out;	// vector_unit.k:20:5
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
  ) __sigmoid_lut_0 (	// vector_unit.k:20:5
    .clk            (clk),	// vector_unit.k:20:5
    .rst            (rst),
    .addr_in        ({{read_addr_in_0}, {write_addr_in_0}}),	// vector_unit.k:20:5
    .ecc_status_out (/* unused */),
    .wren_in        ({{1'h0}, {wren_in_0}}),	// vector_unit.k:20:5
    .data_in        ({{16'h0}, {write_data_in_0}}),	// vector_unit.k:20:5
    .rden_in        ({{rden_in_0}, {1'h0}}),	// vector_unit.k:20:5
    .data_out       (___sigmoid_lut_0_data_out)
  );	// vector_unit.k:20:5
  assign read_data_out_0 = ___sigmoid_lut_0_data_out[1'h1];	// vector_unit.k:20:5
  assign init_completed = 1'h1;	// vector_unit.k:20:5
endmodule

module vector_unit__cos_table__mem_container(	// vector_unit.k:23:5
  input  wire          clk,
  input  wire          rst,
  input  wire          rden_in_0,
  input  wire [11:0]   read_addr_in_0,
  input  wire          wren_in_0,
  input  wire [11:0]   write_addr_in_0,
  input  wire [1023:0] write_data_in_0,
  output wire [1023:0] read_data_out_0,
  output wire          init_completed
);

  wire [1:0][1023:0] ___cos_table_0_data_out;	// vector_unit.k:23:5
  KanagawaSyncRam #(
    .DATA_WIDTH(1024),
    .ADDR_WIDTH(12),
    .DEPTH(4096),
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
  ) __cos_table_0 (	// vector_unit.k:23:5
    .clk            (clk),	// vector_unit.k:23:5
    .rst            (rst),
    .addr_in        ({{read_addr_in_0}, {write_addr_in_0}}),	// vector_unit.k:23:5
    .ecc_status_out (/* unused */),
    .wren_in        ({{1'h0}, {wren_in_0}}),	// vector_unit.k:23:5
    .data_in        ({{1024'h0}, {write_data_in_0}}),	// vector_unit.k:23:5
    .rden_in        ({{rden_in_0}, {1'h0}}),	// vector_unit.k:23:5
    .data_out       (___cos_table_0_data_out)
  );	// vector_unit.k:23:5
  assign read_data_out_0 = ___cos_table_0_data_out[1'h1];	// vector_unit.k:23:5
  assign init_completed = 1'h1;	// vector_unit.k:23:5
endmodule

module vector_unit__sin_table__mem_container(	// vector_unit.k:24:5
  input  wire          clk,
  input  wire          rst,
  input  wire          rden_in_0,
  input  wire [11:0]   read_addr_in_0,
  input  wire          wren_in_0,
  input  wire [11:0]   write_addr_in_0,
  input  wire [1023:0] write_data_in_0,
  output wire [1023:0] read_data_out_0,
  output wire          init_completed
);

  wire [1:0][1023:0] ___sin_table_0_data_out;	// vector_unit.k:24:5
  KanagawaSyncRam #(
    .DATA_WIDTH(1024),
    .ADDR_WIDTH(12),
    .DEPTH(4096),
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
  ) __sin_table_0 (	// vector_unit.k:24:5
    .clk            (clk),	// vector_unit.k:24:5
    .rst            (rst),
    .addr_in        ({{read_addr_in_0}, {write_addr_in_0}}),	// vector_unit.k:24:5
    .ecc_status_out (/* unused */),
    .wren_in        ({{1'h0}, {wren_in_0}}),	// vector_unit.k:24:5
    .data_in        ({{1024'h0}, {write_data_in_0}}),	// vector_unit.k:24:5
    .rden_in        ({{rden_in_0}, {1'h0}}),	// vector_unit.k:24:5
    .data_out       (___sin_table_0_data_out)
  );	// vector_unit.k:24:5
  assign read_data_out_0 = ___sin_table_0_data_out[1'h1];	// vector_unit.k:24:5
  assign init_completed = 1'h1;	// vector_unit.k:24:5
endmodule

module vector_unit(
  input  wire          clk,
  input  wire          rst,
  input  wire          rmsnorm_accumulate_valid_in,
  input  wire [15:0]   rmsnorm_accumulate_x_bf16_in,
  input  wire          rmsnorm_accumulate_rden_in,
  input  wire          rmsnorm_get_sum_valid_in,
  input  wire          rmsnorm_get_sum_rden_in,
  input  wire          rmsnorm_reset_valid_in,
  input  wire          rmsnorm_reset_rden_in,
  input  wire          set_gamma_pre_attn_valid_in,
  input  wire [15:0]   set_gamma_pre_attn_index_in,
  input  wire [15:0]   set_gamma_pre_attn_value_in,
  input  wire          set_gamma_pre_attn_rden_in,
  input  wire          get_gamma_pre_attn_valid_in,
  input  wire [15:0]   get_gamma_pre_attn_index_in,
  input  wire          get_gamma_pre_attn_rden_in,
  input  wire          set_gamma_pre_mlp_valid_in,
  input  wire [15:0]   set_gamma_pre_mlp_index_in,
  input  wire [15:0]   set_gamma_pre_mlp_value_in,
  input  wire          set_gamma_pre_mlp_rden_in,
  input  wire          get_gamma_pre_mlp_valid_in,
  input  wire [15:0]   get_gamma_pre_mlp_index_in,
  input  wire          get_gamma_pre_mlp_rden_in,
  input  wire          set_rsqrt_lut_valid_in,
  input  wire [7:0]    set_rsqrt_lut_index_in,
  input  wire [15:0]   set_rsqrt_lut_value_in,
  input  wire          set_rsqrt_lut_rden_in,
  input  wire          lookup_rsqrt_valid_in,
  input  wire [7:0]    lookup_rsqrt_index_in,
  input  wire          lookup_rsqrt_rden_in,
  input  wire          rope_read_cos_row_valid_in,
  input  wire [11:0]   rope_read_cos_row_position_in,
  input  wire          rope_read_cos_row_rden_in,
  input  wire          rope_read_sin_row_valid_in,
  input  wire [11:0]   rope_read_sin_row_position_in,
  input  wire          rope_read_sin_row_rden_in,
  input  wire          rope_write_cos_row_valid_in,
  input  wire [11:0]   rope_write_cos_row_position_in,
  input  wire [1023:0] rope_write_cos_row_value_in,
  input  wire          rope_write_cos_row_rden_in,
  input  wire          rope_write_sin_row_valid_in,
  input  wire [11:0]   rope_write_sin_row_position_in,
  input  wire [1023:0] rope_write_sin_row_value_in,
  input  wire          rope_write_sin_row_rden_in,
  input  wire          set_sigmoid_lut_valid_in,
  input  wire [7:0]    set_sigmoid_lut_index_in,
  input  wire [15:0]   set_sigmoid_lut_value_in,
  input  wire          set_sigmoid_lut_rden_in,
  input  wire          swiglu_compute_valid_in,
  input  wire [15:0]   swiglu_compute_gate_bf16_in,
  input  wire [15:0]   swiglu_compute_up_bf16_in,
  input  wire          swiglu_compute_rden_in,
  input  wire          dequantize_valid_in,
  input  wire [23:0]   dequantize_accum_in,
  input  wire [15:0]   dequantize_super_scale_bf16_in,
  input  wire [3:0]    dequantize_sub_scale_in,
  input  wire          dequantize_rden_in,
  input  wire          residual_add_valid_in,
  input  wire [15:0]   residual_add_a_bf16_in,
  input  wire [15:0]   residual_add_b_bf16_in,
  input  wire          residual_add_rden_in,
  input  wire [2:0]    stall_rate_in,
  input  wire          stall_rate_valid_in,
  output wire          rst_and_startup_done_out,
  output wire          rmsnorm_accumulate_rdy_out,
  output wire          rmsnorm_accumulate_empty_out,
  output wire          rmsnorm_get_sum_rdy_out,
  output wire          rmsnorm_get_sum_empty_out,
  output wire [31:0]   rmsnorm_get_sum_result_out,
  output wire          rmsnorm_reset_rdy_out,
  output wire          rmsnorm_reset_empty_out,
  output wire          set_gamma_pre_attn_rdy_out,
  output wire          set_gamma_pre_attn_empty_out,
  output wire          get_gamma_pre_attn_rdy_out,
  output wire          get_gamma_pre_attn_empty_out,
  output wire [15:0]   get_gamma_pre_attn_result_out,
  output wire          set_gamma_pre_mlp_rdy_out,
  output wire          set_gamma_pre_mlp_empty_out,
  output wire          get_gamma_pre_mlp_rdy_out,
  output wire          get_gamma_pre_mlp_empty_out,
  output wire [15:0]   get_gamma_pre_mlp_result_out,
  output wire          set_rsqrt_lut_rdy_out,
  output wire          set_rsqrt_lut_empty_out,
  output wire          lookup_rsqrt_rdy_out,
  output wire          lookup_rsqrt_empty_out,
  output wire [15:0]   lookup_rsqrt_result_out,
  output wire          rope_read_cos_row_rdy_out,
  output wire          rope_read_cos_row_empty_out,
  output wire [1023:0] rope_read_cos_row_result_out,
  output wire          rope_read_sin_row_rdy_out,
  output wire          rope_read_sin_row_empty_out,
  output wire [1023:0] rope_read_sin_row_result_out,
  output wire          rope_write_cos_row_rdy_out,
  output wire          rope_write_cos_row_empty_out,
  output wire          rope_write_sin_row_rdy_out,
  output wire          rope_write_sin_row_empty_out,
  output wire          set_sigmoid_lut_rdy_out,
  output wire          set_sigmoid_lut_empty_out,
  output wire          swiglu_compute_rdy_out,
  output wire          swiglu_compute_empty_out,
  output wire [15:0]   swiglu_compute_result_out,
  output wire          dequantize_rdy_out,
  output wire          dequantize_empty_out,
  output wire [15:0]   dequantize_result_out,
  output wire          residual_add_rdy_out,
  output wire          residual_add_empty_out,
  output wire [15:0]   residual_add_result_out,
  output wire          stall_rate_supported_out
);

  wire [15:0]   _residual_add_BasicBlock_0Impl_fifo_data_out_0;	// vector_unit.k:396:9
  wire          _residual_add_BasicBlock_0Impl_fifo_wren_0;	// vector_unit.k:396:9
  wire          _residual_add_BasicBlock_0Impl_input_rdy_0;	// vector_unit.k:396:9
  wire [15:0]   _dequantize_BasicBlock_0Impl_fifo_data_out_0;	// vector_unit.k:279:9
  wire          _dequantize_BasicBlock_0Impl_fifo_wren_0;	// vector_unit.k:279:9
  wire          _dequantize_BasicBlock_0Impl_input_rdy_0;	// vector_unit.k:279:9
  wire [7:0]    _swiglu_compute_BasicBlock_0Impl_memory_read_addr_out_38_0;	// vector_unit.k:186:9
  wire          _swiglu_compute_BasicBlock_0Impl_memory_rden_out_38_0;	// vector_unit.k:186:9
  wire [15:0]   _swiglu_compute_BasicBlock_0Impl_fifo_data_out_0;	// vector_unit.k:186:9
  wire          _swiglu_compute_BasicBlock_0Impl_fifo_wren_0;	// vector_unit.k:186:9
  wire          _swiglu_compute_BasicBlock_0Impl_input_rdy_0;	// vector_unit.k:186:9
  wire [15:0]   _set_sigmoid_lut_BasicBlock_0Impl_memory_write_data_out_38_0;	// vector_unit.k:178:9
  wire [7:0]    _set_sigmoid_lut_BasicBlock_0Impl_memory_write_addr_out_38_0;	// vector_unit.k:178:9
  wire          _set_sigmoid_lut_BasicBlock_0Impl_memory_wren_38_0;	// vector_unit.k:178:9
  wire          _set_sigmoid_lut_BasicBlock_0Impl_fifo_wren_0;	// vector_unit.k:178:9
  wire          _set_sigmoid_lut_BasicBlock_0Impl_input_rdy_0;	// vector_unit.k:178:9
  wire [1023:0] _rope_write_sin_row_BasicBlock_0Impl_memory_write_data_out_40_0;	// vector_unit.k:171:9
  wire [11:0]   _rope_write_sin_row_BasicBlock_0Impl_memory_write_addr_out_40_0;	// vector_unit.k:171:9
  wire          _rope_write_sin_row_BasicBlock_0Impl_memory_wren_40_0;	// vector_unit.k:171:9
  wire          _rope_write_sin_row_BasicBlock_0Impl_fifo_wren_0;	// vector_unit.k:171:9
  wire          _rope_write_sin_row_BasicBlock_0Impl_input_rdy_0;	// vector_unit.k:171:9
  wire [1023:0] _rope_write_cos_row_BasicBlock_0Impl_memory_write_data_out_39_0;	// vector_unit.k:166:9
  wire [11:0]   _rope_write_cos_row_BasicBlock_0Impl_memory_write_addr_out_39_0;	// vector_unit.k:166:9
  wire          _rope_write_cos_row_BasicBlock_0Impl_memory_wren_39_0;	// vector_unit.k:166:9
  wire          _rope_write_cos_row_BasicBlock_0Impl_fifo_wren_0;	// vector_unit.k:166:9
  wire          _rope_write_cos_row_BasicBlock_0Impl_input_rdy_0;	// vector_unit.k:166:9
  wire [11:0]   _rope_read_sin_row_BasicBlock_0Impl_memory_read_addr_out_40_0;	// vector_unit.k:159:9
  wire          _rope_read_sin_row_BasicBlock_0Impl_memory_rden_out_40_0;	// vector_unit.k:159:9
  wire [1023:0] _rope_read_sin_row_BasicBlock_0Impl_fifo_data_out_0;	// vector_unit.k:159:9
  wire          _rope_read_sin_row_BasicBlock_0Impl_fifo_wren_0;	// vector_unit.k:159:9
  wire          _rope_read_sin_row_BasicBlock_0Impl_input_rdy_0;	// vector_unit.k:159:9
  wire [11:0]   _rope_read_cos_row_BasicBlock_0Impl_memory_read_addr_out_39_0;	// vector_unit.k:152:9
  wire          _rope_read_cos_row_BasicBlock_0Impl_memory_rden_out_39_0;	// vector_unit.k:152:9
  wire [1023:0] _rope_read_cos_row_BasicBlock_0Impl_fifo_data_out_0;	// vector_unit.k:152:9
  wire          _rope_read_cos_row_BasicBlock_0Impl_fifo_wren_0;	// vector_unit.k:152:9
  wire          _rope_read_cos_row_BasicBlock_0Impl_input_rdy_0;	// vector_unit.k:152:9
  wire [7:0]    _lookup_rsqrt_BasicBlock_0Impl_memory_read_addr_out_37_0;	// vector_unit.k:140:9
  wire          _lookup_rsqrt_BasicBlock_0Impl_memory_rden_out_37_0;	// vector_unit.k:140:9
  wire [15:0]   _lookup_rsqrt_BasicBlock_0Impl_fifo_data_out_0;	// vector_unit.k:140:9
  wire          _lookup_rsqrt_BasicBlock_0Impl_fifo_wren_0;	// vector_unit.k:140:9
  wire          _lookup_rsqrt_BasicBlock_0Impl_input_rdy_0;	// vector_unit.k:140:9
  wire [15:0]   _set_rsqrt_lut_BasicBlock_0Impl_memory_write_data_out_37_0;	// vector_unit.k:132:9
  wire [7:0]    _set_rsqrt_lut_BasicBlock_0Impl_memory_write_addr_out_37_0;	// vector_unit.k:132:9
  wire          _set_rsqrt_lut_BasicBlock_0Impl_memory_wren_37_0;	// vector_unit.k:132:9
  wire          _set_rsqrt_lut_BasicBlock_0Impl_fifo_wren_0;	// vector_unit.k:132:9
  wire          _set_rsqrt_lut_BasicBlock_0Impl_input_rdy_0;	// vector_unit.k:132:9
  wire [11:0]   _get_gamma_pre_mlp_BasicBlock_0Impl_memory_read_addr_out_36_0;	// vector_unit.k:122:9
  wire          _get_gamma_pre_mlp_BasicBlock_0Impl_memory_rden_out_36_0;	// vector_unit.k:122:9
  wire [15:0]   _get_gamma_pre_mlp_BasicBlock_0Impl_fifo_data_out_0;	// vector_unit.k:122:9
  wire          _get_gamma_pre_mlp_BasicBlock_0Impl_fifo_wren_0;	// vector_unit.k:122:9
  wire          _get_gamma_pre_mlp_BasicBlock_0Impl_input_rdy_0;	// vector_unit.k:122:9
  wire [15:0]   _set_gamma_pre_mlp_BasicBlock_0Impl_memory_write_data_out_36_0;	// vector_unit.k:114:9
  wire [11:0]   _set_gamma_pre_mlp_BasicBlock_0Impl_memory_write_addr_out_36_0;	// vector_unit.k:114:9
  wire          _set_gamma_pre_mlp_BasicBlock_0Impl_memory_wren_36_0;	// vector_unit.k:114:9
  wire          _set_gamma_pre_mlp_BasicBlock_0Impl_fifo_wren_0;	// vector_unit.k:114:9
  wire          _set_gamma_pre_mlp_BasicBlock_0Impl_input_rdy_0;	// vector_unit.k:114:9
  wire [11:0]   _get_gamma_pre_attn_BasicBlock_0Impl_memory_read_addr_out_35_0;	// vector_unit.k:104:9
  wire          _get_gamma_pre_attn_BasicBlock_0Impl_memory_rden_out_35_0;	// vector_unit.k:104:9
  wire [15:0]   _get_gamma_pre_attn_BasicBlock_0Impl_fifo_data_out_0;	// vector_unit.k:104:9
  wire          _get_gamma_pre_attn_BasicBlock_0Impl_fifo_wren_0;	// vector_unit.k:104:9
  wire          _get_gamma_pre_attn_BasicBlock_0Impl_input_rdy_0;	// vector_unit.k:104:9
  wire [15:0]   _set_gamma_pre_attn_BasicBlock_0Impl_memory_write_data_out_35_0;	// vector_unit.k:96:9
  wire [11:0]   _set_gamma_pre_attn_BasicBlock_0Impl_memory_write_addr_out_35_0;	// vector_unit.k:96:9
  wire          _set_gamma_pre_attn_BasicBlock_0Impl_memory_wren_35_0;	// vector_unit.k:96:9
  wire          _set_gamma_pre_attn_BasicBlock_0Impl_fifo_wren_0;	// vector_unit.k:96:9
  wire          _set_gamma_pre_attn_BasicBlock_0Impl_input_rdy_0;	// vector_unit.k:96:9
  wire          _rmsnorm_reset_BasicBlock_0Impl_global_out__sum_sq_34_1_valid;	// vector_unit.k:87:9
  wire          _rmsnorm_reset_BasicBlock_0Impl_fifo_wren_0;	// vector_unit.k:87:9
  wire          _rmsnorm_reset_BasicBlock_0Impl_input_rdy_0;	// vector_unit.k:87:9
  wire [31:0]   _rmsnorm_get_sum_BasicBlock_0Impl_fifo_data_out_0;	// vector_unit.k:77:9
  wire          _rmsnorm_get_sum_BasicBlock_0Impl_fifo_wren_0;	// vector_unit.k:77:9
  wire          _rmsnorm_get_sum_BasicBlock_0Impl_input_rdy_0;	// vector_unit.k:77:9
  wire          _rmsnorm_accumulate_BasicBlock_0Impl_global_out__sum_sq_34_0_valid;	// vector_unit.k:31:9
  wire [31:0]   _rmsnorm_accumulate_BasicBlock_0Impl_global_out__sum_sq_34_0;	// vector_unit.k:31:9
  wire          _rmsnorm_accumulate_BasicBlock_0Impl_fifo_wren_0;	// vector_unit.k:31:9
  wire          _rmsnorm_accumulate_BasicBlock_0Impl_input_rdy_0;	// vector_unit.k:31:9
  wire          _fifo_16_residual_add_Return_overflow_out;
  wire          _fifo_16_residual_add_Return_underflow_out;
  wire          _fifo_16_residual_add_Return_empty;
  wire          _fifo_16_residual_add_Return_full;
  wire [15:0]   _fifo_16_residual_add_Return_q;
  wire          _fifo_15_dequantize_Return_overflow_out;
  wire          _fifo_15_dequantize_Return_underflow_out;
  wire          _fifo_15_dequantize_Return_empty;
  wire          _fifo_15_dequantize_Return_full;
  wire [15:0]   _fifo_15_dequantize_Return_q;
  wire          _fifo_14_swiglu_compute_Return_overflow_out;
  wire          _fifo_14_swiglu_compute_Return_underflow_out;
  wire          _fifo_14_swiglu_compute_Return_empty;
  wire          _fifo_14_swiglu_compute_Return_full;
  wire [15:0]   _fifo_14_swiglu_compute_Return_q;
  wire          _fifo_13_set_sigmoid_lut_Return_overflow_out;
  wire          _fifo_13_set_sigmoid_lut_Return_underflow_out;
  wire          _fifo_13_set_sigmoid_lut_Return_empty;
  wire          _fifo_13_set_sigmoid_lut_Return_full;
  wire          _fifo_12_rope_write_sin_row_Return_overflow_out;
  wire          _fifo_12_rope_write_sin_row_Return_underflow_out;
  wire          _fifo_12_rope_write_sin_row_Return_empty;
  wire          _fifo_12_rope_write_sin_row_Return_full;
  wire          _fifo_11_rope_write_cos_row_Return_overflow_out;
  wire          _fifo_11_rope_write_cos_row_Return_underflow_out;
  wire          _fifo_11_rope_write_cos_row_Return_empty;
  wire          _fifo_11_rope_write_cos_row_Return_full;
  wire          _fifo_10_rope_read_sin_row_Return_overflow_out;
  wire          _fifo_10_rope_read_sin_row_Return_underflow_out;
  wire          _fifo_10_rope_read_sin_row_Return_empty;
  wire          _fifo_10_rope_read_sin_row_Return_full;
  wire [1023:0] _fifo_10_rope_read_sin_row_Return_q;
  wire          _fifo_9_rope_read_cos_row_Return_overflow_out;
  wire          _fifo_9_rope_read_cos_row_Return_underflow_out;
  wire          _fifo_9_rope_read_cos_row_Return_empty;
  wire          _fifo_9_rope_read_cos_row_Return_full;
  wire [1023:0] _fifo_9_rope_read_cos_row_Return_q;
  wire          _fifo_8_lookup_rsqrt_Return_overflow_out;
  wire          _fifo_8_lookup_rsqrt_Return_underflow_out;
  wire          _fifo_8_lookup_rsqrt_Return_empty;
  wire          _fifo_8_lookup_rsqrt_Return_full;
  wire [15:0]   _fifo_8_lookup_rsqrt_Return_q;
  wire          _fifo_7_set_rsqrt_lut_Return_overflow_out;
  wire          _fifo_7_set_rsqrt_lut_Return_underflow_out;
  wire          _fifo_7_set_rsqrt_lut_Return_empty;
  wire          _fifo_7_set_rsqrt_lut_Return_full;
  wire          _fifo_6_get_gamma_pre_mlp_Return_overflow_out;
  wire          _fifo_6_get_gamma_pre_mlp_Return_underflow_out;
  wire          _fifo_6_get_gamma_pre_mlp_Return_empty;
  wire          _fifo_6_get_gamma_pre_mlp_Return_full;
  wire [15:0]   _fifo_6_get_gamma_pre_mlp_Return_q;
  wire          _fifo_5_set_gamma_pre_mlp_Return_overflow_out;
  wire          _fifo_5_set_gamma_pre_mlp_Return_underflow_out;
  wire          _fifo_5_set_gamma_pre_mlp_Return_empty;
  wire          _fifo_5_set_gamma_pre_mlp_Return_full;
  wire          _fifo_4_get_gamma_pre_attn_Return_overflow_out;
  wire          _fifo_4_get_gamma_pre_attn_Return_underflow_out;
  wire          _fifo_4_get_gamma_pre_attn_Return_empty;
  wire          _fifo_4_get_gamma_pre_attn_Return_full;
  wire [15:0]   _fifo_4_get_gamma_pre_attn_Return_q;
  wire          _fifo_3_set_gamma_pre_attn_Return_overflow_out;
  wire          _fifo_3_set_gamma_pre_attn_Return_underflow_out;
  wire          _fifo_3_set_gamma_pre_attn_Return_empty;
  wire          _fifo_3_set_gamma_pre_attn_Return_full;
  wire          _fifo_2_rmsnorm_reset_Return_overflow_out;
  wire          _fifo_2_rmsnorm_reset_Return_underflow_out;
  wire          _fifo_2_rmsnorm_reset_Return_empty;
  wire          _fifo_2_rmsnorm_reset_Return_full;
  wire          _fifo_1_rmsnorm_get_sum_Return_overflow_out;
  wire          _fifo_1_rmsnorm_get_sum_Return_underflow_out;
  wire          _fifo_1_rmsnorm_get_sum_Return_empty;
  wire          _fifo_1_rmsnorm_get_sum_Return_full;
  wire [31:0]   _fifo_1_rmsnorm_get_sum_Return_q;
  wire          _fifo_0_rmsnorm_accumulate_Return_overflow_out;
  wire          _fifo_0_rmsnorm_accumulate_Return_underflow_out;
  wire          _fifo_0_rmsnorm_accumulate_Return_empty;
  wire          _fifo_0_rmsnorm_accumulate_Return_full;
  wire          _has_startup_completed_delayed_16_delay_chain_data_out;
  wire          _has_startup_completed_delayed_15_delay_chain_data_out;
  wire          _has_startup_completed_delayed_14_delay_chain_data_out;
  wire          _has_startup_completed_delayed_13_delay_chain_data_out;
  wire          _has_startup_completed_delayed_12_delay_chain_data_out;
  wire          _has_startup_completed_delayed_11_delay_chain_data_out;
  wire          _has_startup_completed_delayed_10_delay_chain_data_out;
  wire          _has_startup_completed_delayed_9_delay_chain_data_out;
  wire          _has_startup_completed_delayed_8_delay_chain_data_out;
  wire          _has_startup_completed_delayed_7_delay_chain_data_out;
  wire          _has_startup_completed_delayed_6_delay_chain_data_out;
  wire          _has_startup_completed_delayed_5_delay_chain_data_out;
  wire          _has_startup_completed_delayed_4_delay_chain_data_out;
  wire          _has_startup_completed_delayed_3_delay_chain_data_out;
  wire          _has_startup_completed_delayed_2_delay_chain_data_out;
  wire          _has_startup_completed_delayed_1_delay_chain_data_out;
  wire          _has_startup_completed_delayed_0_delay_chain_data_out;
  wire [31:0]   __sum_sq_value_out;	// vector_unit.k:13:5
  wire [1023:0] __sin_table_read_data_out_0;	// vector_unit.k:24:5
  wire          __sin_table_init_completed;	// vector_unit.k:24:5
  wire [1023:0] __cos_table_read_data_out_0;	// vector_unit.k:23:5
  wire          __cos_table_init_completed;	// vector_unit.k:23:5
  wire [15:0]   __sigmoid_lut_read_data_out_0;	// vector_unit.k:20:5
  wire          __sigmoid_lut_init_completed;	// vector_unit.k:20:5
  wire [15:0]   __rsqrt_lut_read_data_out_0;	// vector_unit.k:17:5
  wire          __rsqrt_lut_init_completed;	// vector_unit.k:17:5
  wire [15:0]   __gamma_pre_mlp_read_data_out_0;	// vector_unit.k:16:5
  wire          __gamma_pre_mlp_init_completed;	// vector_unit.k:16:5
  wire [15:0]   __gamma_pre_attn_read_data_out_0;	// vector_unit.k:15:5
  wire          __gamma_pre_attn_init_completed;	// vector_unit.k:15:5
  wire          _reset_control_rst_and_startup_done_out;
  wire [34:0]   _reset_control_rst_delayed_out;
  wire          _reset_control_reset_sequence_finished_this_cycle_out;
  logic  stall_rate_supported_out_net;
  logic  residual_add_empty_out_net;
  logic [15:0] residual_add_result_out_net;
  logic  residual_add_rdy_out_net;
  logic  dequantize_empty_out_net;
  logic [15:0] dequantize_result_out_net;
  logic  dequantize_rdy_out_net;
  logic  swiglu_compute_empty_out_net;
  logic [15:0] swiglu_compute_result_out_net;
  logic  swiglu_compute_rdy_out_net;
  logic  set_sigmoid_lut_empty_out_net;
  logic  set_sigmoid_lut_rdy_out_net;
  logic  rope_write_sin_row_empty_out_net;
  logic  rope_write_sin_row_rdy_out_net;
  logic  rope_write_cos_row_empty_out_net;
  logic  rope_write_cos_row_rdy_out_net;
  logic  rope_read_sin_row_empty_out_net;
  logic [1023:0] rope_read_sin_row_result_out_net;
  logic  rope_read_sin_row_rdy_out_net;
  logic  rope_read_cos_row_empty_out_net;
  logic [1023:0] rope_read_cos_row_result_out_net;
  logic  rope_read_cos_row_rdy_out_net;
  logic  lookup_rsqrt_empty_out_net;
  logic [15:0] lookup_rsqrt_result_out_net;
  logic  lookup_rsqrt_rdy_out_net;
  logic  set_rsqrt_lut_empty_out_net;
  logic  set_rsqrt_lut_rdy_out_net;
  logic  get_gamma_pre_mlp_empty_out_net;
  logic [15:0] get_gamma_pre_mlp_result_out_net;
  logic  get_gamma_pre_mlp_rdy_out_net;
  logic  set_gamma_pre_mlp_empty_out_net;
  logic  set_gamma_pre_mlp_rdy_out_net;
  logic  get_gamma_pre_attn_empty_out_net;
  logic [15:0] get_gamma_pre_attn_result_out_net;
  logic  get_gamma_pre_attn_rdy_out_net;
  logic  set_gamma_pre_attn_empty_out_net;
  logic  set_gamma_pre_attn_rdy_out_net;
  logic  rmsnorm_reset_empty_out_net;
  logic  rmsnorm_reset_rdy_out_net;
  logic  rmsnorm_get_sum_empty_out_net;
  logic [31:0] rmsnorm_get_sum_result_out_net;
  logic  rmsnorm_get_sum_rdy_out_net;
  logic  rmsnorm_accumulate_empty_out_net;
  logic  rmsnorm_accumulate_rdy_out_net;
  logic  rst_and_startup_done_out_net;

  logic [31:0] dropped_commands;
  //synopsys translate_off
  KanagawaStringTable string_table(.clk(clk));
  //synopsys translate_on
  logic [34:0] reg_rst_delayed;
  logic combined_reset;
  assign combined_reset = rst;
  logic reset_sequence_finished_this_cycle;
  logic has_startup_completed_raw;
  logic has_mem_init_completed;
  wire          _GEN =
    has_startup_completed_raw & __gamma_pre_attn_init_completed
    & __gamma_pre_mlp_init_completed & __rsqrt_lut_init_completed
    & __sigmoid_lut_init_completed & __cos_table_init_completed
    & __sin_table_init_completed;	// vector_unit.k:15:5, :16:5, :17:5, :20:5, :23:5, :24:5
  logic has_others_completed;
  assign has_others_completed = _GEN;

  logic rst_and_startup_done_raw;

  logic [0:0] rst_array;
  assign rst_array[0] = combined_reset;

  logic has_startup_completed_delayed_0;

  logic has_startup_completed_delayed_1;

  logic has_startup_completed_delayed_2;

  logic has_startup_completed_delayed_3;

  logic has_startup_completed_delayed_4;

  logic has_startup_completed_delayed_5;

  logic has_startup_completed_delayed_6;

  logic has_startup_completed_delayed_7;

  logic has_startup_completed_delayed_8;

  logic has_startup_completed_delayed_9;

  logic has_startup_completed_delayed_10;

  logic has_startup_completed_delayed_11;

  logic has_startup_completed_delayed_12;

  logic has_startup_completed_delayed_13;

  logic has_startup_completed_delayed_14;

  logic has_startup_completed_delayed_15;

  logic has_startup_completed_delayed_16;

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
      logic [31:0] data_in;
      logic [31:0] data_out;
      logic overflow;
      logic underflow;
  } fifo_data_1;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic overflow;
      logic underflow;
  } fifo_data_2;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
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
      logic overflow;
      logic underflow;
  } fifo_data_5;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [15:0] data_in;
      logic [15:0] data_out;
      logic overflow;
      logic underflow;
  } fifo_data_6;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic overflow;
      logic underflow;
  } fifo_data_7;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [15:0] data_in;
      logic [15:0] data_out;
      logic overflow;
      logic underflow;
  } fifo_data_8;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [1023:0] data_in;
      logic [1023:0] data_out;
      logic overflow;
      logic underflow;
  } fifo_data_9;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [1023:0] data_in;
      logic [1023:0] data_out;
      logic overflow;
      logic underflow;
  } fifo_data_10;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic overflow;
      logic underflow;
  } fifo_data_11;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic overflow;
      logic underflow;
  } fifo_data_12;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic overflow;
      logic underflow;
  } fifo_data_13;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [15:0] data_in;
      logic [15:0] data_out;
      logic overflow;
      logic underflow;
  } fifo_data_14;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [15:0] data_in;
      logic [15:0] data_out;
      logic overflow;
      logic underflow;
  } fifo_data_15;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [15:0] data_in;
      logic [15:0] data_out;
      logic overflow;
      logic underflow;
  } fifo_data_16;

  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [15:0] data;
      logic underflow;
  } passthrough_data_17;
  assign passthrough_data_17.underflow = 1'b0;
  assign passthrough_data_17.rdy_ext = passthrough_data_17.rdy_int & !(!has_startup_completed_delayed_0);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic underflow;
  } passthrough_data_18;
  assign passthrough_data_18.underflow = 1'b0;
  assign passthrough_data_18.rdy_ext = passthrough_data_18.rdy_int & !(!has_startup_completed_delayed_1);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic underflow;
  } passthrough_data_19;
  assign passthrough_data_19.underflow = 1'b0;
  assign passthrough_data_19.rdy_ext = passthrough_data_19.rdy_int & !(!has_startup_completed_delayed_2);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [31:0] data;
      logic underflow;
  } passthrough_data_20;
  assign passthrough_data_20.underflow = 1'b0;
  assign passthrough_data_20.rdy_ext = passthrough_data_20.rdy_int & !(!has_startup_completed_delayed_3);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [15:0] data;
      logic underflow;
  } passthrough_data_21;
  assign passthrough_data_21.underflow = 1'b0;
  assign passthrough_data_21.rdy_ext = passthrough_data_21.rdy_int & !(!has_startup_completed_delayed_4);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [31:0] data;
      logic underflow;
  } passthrough_data_22;
  assign passthrough_data_22.underflow = 1'b0;
  assign passthrough_data_22.rdy_ext = passthrough_data_22.rdy_int & !(!has_startup_completed_delayed_5);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [15:0] data;
      logic underflow;
  } passthrough_data_23;
  assign passthrough_data_23.underflow = 1'b0;
  assign passthrough_data_23.rdy_ext = passthrough_data_23.rdy_int & !(!has_startup_completed_delayed_6);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [23:0] data;
      logic underflow;
  } passthrough_data_24;
  assign passthrough_data_24.underflow = 1'b0;
  assign passthrough_data_24.rdy_ext = passthrough_data_24.rdy_int & !(!has_startup_completed_delayed_7);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [7:0] data;
      logic underflow;
  } passthrough_data_25;
  assign passthrough_data_25.underflow = 1'b0;
  assign passthrough_data_25.rdy_ext = passthrough_data_25.rdy_int & !(!has_startup_completed_delayed_8);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [11:0] data;
      logic underflow;
  } passthrough_data_26;
  assign passthrough_data_26.underflow = 1'b0;
  assign passthrough_data_26.rdy_ext = passthrough_data_26.rdy_int & !(!has_startup_completed_delayed_9);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [11:0] data;
      logic underflow;
  } passthrough_data_27;
  assign passthrough_data_27.underflow = 1'b0;
  assign passthrough_data_27.rdy_ext = passthrough_data_27.rdy_int & !(!has_startup_completed_delayed_10);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [1035:0] data;
      logic underflow;
  } passthrough_data_28;
  assign passthrough_data_28.underflow = 1'b0;
  assign passthrough_data_28.rdy_ext = passthrough_data_28.rdy_int & !(!has_startup_completed_delayed_11);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [1035:0] data;
      logic underflow;
  } passthrough_data_29;
  assign passthrough_data_29.underflow = 1'b0;
  assign passthrough_data_29.rdy_ext = passthrough_data_29.rdy_int & !(!has_startup_completed_delayed_12);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [23:0] data;
      logic underflow;
  } passthrough_data_30;
  assign passthrough_data_30.underflow = 1'b0;
  assign passthrough_data_30.rdy_ext = passthrough_data_30.rdy_int & !(!has_startup_completed_delayed_13);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [31:0] data;
      logic underflow;
  } passthrough_data_31;
  assign passthrough_data_31.underflow = 1'b0;
  assign passthrough_data_31.rdy_ext = passthrough_data_31.rdy_int & !(!has_startup_completed_delayed_14);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [43:0] data;
      logic underflow;
  } passthrough_data_32;
  assign passthrough_data_32.underflow = 1'b0;
  assign passthrough_data_32.rdy_ext = passthrough_data_32.rdy_int & !(!has_startup_completed_delayed_15);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [31:0] data;
      logic underflow;
  } passthrough_data_33;
  assign passthrough_data_33.underflow = 1'b0;
  assign passthrough_data_33.rdy_ext = passthrough_data_33.rdy_int & !(!has_startup_completed_delayed_16);
  assign rmsnorm_accumulate_rdy_out_net = passthrough_data_17.rdy_ext;
  assign passthrough_data_17.valid = rmsnorm_accumulate_rdy_out & rmsnorm_accumulate_valid_in;
  assign passthrough_data_17.data = { rmsnorm_accumulate_x_bf16_in };
  assign fifo_data_0.rden = rmsnorm_accumulate_rden_in;
  assign rmsnorm_accumulate_empty_out_net = fifo_data_0.empty;
  assign rmsnorm_get_sum_rdy_out_net = passthrough_data_18.rdy_ext;
  assign passthrough_data_18.valid = rmsnorm_get_sum_rdy_out & rmsnorm_get_sum_valid_in;
  assign fifo_data_1.rden = rmsnorm_get_sum_rden_in;
  assign rmsnorm_get_sum_result_out_net = fifo_data_1.data_out;
  assign rmsnorm_get_sum_empty_out_net = fifo_data_1.empty;
  assign rmsnorm_reset_rdy_out_net = passthrough_data_19.rdy_ext;
  assign passthrough_data_19.valid = rmsnorm_reset_rdy_out & rmsnorm_reset_valid_in;
  assign fifo_data_2.rden = rmsnorm_reset_rden_in;
  assign rmsnorm_reset_empty_out_net = fifo_data_2.empty;
  assign set_gamma_pre_attn_rdy_out_net = passthrough_data_20.rdy_ext;
  assign passthrough_data_20.valid = set_gamma_pre_attn_rdy_out & set_gamma_pre_attn_valid_in;
  assign passthrough_data_20.data = { set_gamma_pre_attn_value_in, set_gamma_pre_attn_index_in };
  assign fifo_data_3.rden = set_gamma_pre_attn_rden_in;
  assign set_gamma_pre_attn_empty_out_net = fifo_data_3.empty;
  assign get_gamma_pre_attn_rdy_out_net = passthrough_data_21.rdy_ext;
  assign passthrough_data_21.valid = get_gamma_pre_attn_rdy_out & get_gamma_pre_attn_valid_in;
  assign passthrough_data_21.data = { get_gamma_pre_attn_index_in };
  assign fifo_data_4.rden = get_gamma_pre_attn_rden_in;
  assign get_gamma_pre_attn_result_out_net = fifo_data_4.data_out;
  assign get_gamma_pre_attn_empty_out_net = fifo_data_4.empty;
  assign set_gamma_pre_mlp_rdy_out_net = passthrough_data_22.rdy_ext;
  assign passthrough_data_22.valid = set_gamma_pre_mlp_rdy_out & set_gamma_pre_mlp_valid_in;
  assign passthrough_data_22.data = { set_gamma_pre_mlp_value_in, set_gamma_pre_mlp_index_in };
  assign fifo_data_5.rden = set_gamma_pre_mlp_rden_in;
  assign set_gamma_pre_mlp_empty_out_net = fifo_data_5.empty;
  assign get_gamma_pre_mlp_rdy_out_net = passthrough_data_23.rdy_ext;
  assign passthrough_data_23.valid = get_gamma_pre_mlp_rdy_out & get_gamma_pre_mlp_valid_in;
  assign passthrough_data_23.data = { get_gamma_pre_mlp_index_in };
  assign fifo_data_6.rden = get_gamma_pre_mlp_rden_in;
  assign get_gamma_pre_mlp_result_out_net = fifo_data_6.data_out;
  assign get_gamma_pre_mlp_empty_out_net = fifo_data_6.empty;
  assign set_rsqrt_lut_rdy_out_net = passthrough_data_24.rdy_ext;
  assign passthrough_data_24.valid = set_rsqrt_lut_rdy_out & set_rsqrt_lut_valid_in;
  assign passthrough_data_24.data = { set_rsqrt_lut_value_in, set_rsqrt_lut_index_in };
  assign fifo_data_7.rden = set_rsqrt_lut_rden_in;
  assign set_rsqrt_lut_empty_out_net = fifo_data_7.empty;
  assign lookup_rsqrt_rdy_out_net = passthrough_data_25.rdy_ext;
  assign passthrough_data_25.valid = lookup_rsqrt_rdy_out & lookup_rsqrt_valid_in;
  assign passthrough_data_25.data = { lookup_rsqrt_index_in };
  assign fifo_data_8.rden = lookup_rsqrt_rden_in;
  assign lookup_rsqrt_result_out_net = fifo_data_8.data_out;
  assign lookup_rsqrt_empty_out_net = fifo_data_8.empty;
  assign rope_read_cos_row_rdy_out_net = passthrough_data_26.rdy_ext;
  assign passthrough_data_26.valid = rope_read_cos_row_rdy_out & rope_read_cos_row_valid_in;
  assign passthrough_data_26.data = { rope_read_cos_row_position_in };
  assign fifo_data_9.rden = rope_read_cos_row_rden_in;
  assign rope_read_cos_row_result_out_net = fifo_data_9.data_out;
  assign rope_read_cos_row_empty_out_net = fifo_data_9.empty;
  assign rope_read_sin_row_rdy_out_net = passthrough_data_27.rdy_ext;
  assign passthrough_data_27.valid = rope_read_sin_row_rdy_out & rope_read_sin_row_valid_in;
  assign passthrough_data_27.data = { rope_read_sin_row_position_in };
  assign fifo_data_10.rden = rope_read_sin_row_rden_in;
  assign rope_read_sin_row_result_out_net = fifo_data_10.data_out;
  assign rope_read_sin_row_empty_out_net = fifo_data_10.empty;
  assign rope_write_cos_row_rdy_out_net = passthrough_data_28.rdy_ext;
  assign passthrough_data_28.valid = rope_write_cos_row_rdy_out & rope_write_cos_row_valid_in;
  assign passthrough_data_28.data = { rope_write_cos_row_value_in, rope_write_cos_row_position_in };
  assign fifo_data_11.rden = rope_write_cos_row_rden_in;
  assign rope_write_cos_row_empty_out_net = fifo_data_11.empty;
  assign rope_write_sin_row_rdy_out_net = passthrough_data_29.rdy_ext;
  assign passthrough_data_29.valid = rope_write_sin_row_rdy_out & rope_write_sin_row_valid_in;
  assign passthrough_data_29.data = { rope_write_sin_row_value_in, rope_write_sin_row_position_in };
  assign fifo_data_12.rden = rope_write_sin_row_rden_in;
  assign rope_write_sin_row_empty_out_net = fifo_data_12.empty;
  assign set_sigmoid_lut_rdy_out_net = passthrough_data_30.rdy_ext;
  assign passthrough_data_30.valid = set_sigmoid_lut_rdy_out & set_sigmoid_lut_valid_in;
  assign passthrough_data_30.data = { set_sigmoid_lut_value_in, set_sigmoid_lut_index_in };
  assign fifo_data_13.rden = set_sigmoid_lut_rden_in;
  assign set_sigmoid_lut_empty_out_net = fifo_data_13.empty;
  assign swiglu_compute_rdy_out_net = passthrough_data_31.rdy_ext;
  assign passthrough_data_31.valid = swiglu_compute_rdy_out & swiglu_compute_valid_in;
  assign passthrough_data_31.data = { swiglu_compute_up_bf16_in, swiglu_compute_gate_bf16_in };
  assign fifo_data_14.rden = swiglu_compute_rden_in;
  assign swiglu_compute_result_out_net = fifo_data_14.data_out;
  assign swiglu_compute_empty_out_net = fifo_data_14.empty;
  assign dequantize_rdy_out_net = passthrough_data_32.rdy_ext;
  assign passthrough_data_32.valid = dequantize_rdy_out & dequantize_valid_in;
  assign passthrough_data_32.data = { dequantize_sub_scale_in, dequantize_super_scale_bf16_in, dequantize_accum_in };
  assign fifo_data_15.rden = dequantize_rden_in;
  assign dequantize_result_out_net = fifo_data_15.data_out;
  assign dequantize_empty_out_net = fifo_data_15.empty;
  assign residual_add_rdy_out_net = passthrough_data_33.rdy_ext;
  assign passthrough_data_33.valid = residual_add_rdy_out & residual_add_valid_in;
  assign passthrough_data_33.data = { residual_add_b_bf16_in, residual_add_a_bf16_in };
  assign fifo_data_16.rden = residual_add_rden_in;
  assign residual_add_result_out_net = fifo_data_16.data_out;
  assign residual_add_empty_out_net = fifo_data_16.empty;
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
    has_startup_completed_delayed_6 = _has_startup_completed_delayed_6_delay_chain_data_out;
    has_startup_completed_delayed_7 = _has_startup_completed_delayed_7_delay_chain_data_out;
    has_startup_completed_delayed_8 = _has_startup_completed_delayed_8_delay_chain_data_out;
    has_startup_completed_delayed_9 = _has_startup_completed_delayed_9_delay_chain_data_out;
    has_startup_completed_delayed_10 = _has_startup_completed_delayed_10_delay_chain_data_out;
    has_startup_completed_delayed_11 = _has_startup_completed_delayed_11_delay_chain_data_out;
    has_startup_completed_delayed_12 = _has_startup_completed_delayed_12_delay_chain_data_out;
    has_startup_completed_delayed_13 = _has_startup_completed_delayed_13_delay_chain_data_out;
    has_startup_completed_delayed_14 = _has_startup_completed_delayed_14_delay_chain_data_out;
    has_startup_completed_delayed_15 = _has_startup_completed_delayed_15_delay_chain_data_out;
    has_startup_completed_delayed_16 = _has_startup_completed_delayed_16_delay_chain_data_out;
    fifo_data_0.overflow = _fifo_0_rmsnorm_accumulate_Return_overflow_out;
    fifo_data_0.underflow = _fifo_0_rmsnorm_accumulate_Return_underflow_out;
    fifo_data_0.empty = _fifo_0_rmsnorm_accumulate_Return_empty;
    fifo_data_0.almost_full = _fifo_0_rmsnorm_accumulate_Return_full;
    fifo_data_1.overflow = _fifo_1_rmsnorm_get_sum_Return_overflow_out;
    fifo_data_1.underflow = _fifo_1_rmsnorm_get_sum_Return_underflow_out;
    fifo_data_1.empty = _fifo_1_rmsnorm_get_sum_Return_empty;
    fifo_data_1.almost_full = _fifo_1_rmsnorm_get_sum_Return_full;
    fifo_data_1.data_out = _fifo_1_rmsnorm_get_sum_Return_q;
    fifo_data_2.overflow = _fifo_2_rmsnorm_reset_Return_overflow_out;
    fifo_data_2.underflow = _fifo_2_rmsnorm_reset_Return_underflow_out;
    fifo_data_2.empty = _fifo_2_rmsnorm_reset_Return_empty;
    fifo_data_2.almost_full = _fifo_2_rmsnorm_reset_Return_full;
    fifo_data_3.overflow = _fifo_3_set_gamma_pre_attn_Return_overflow_out;
    fifo_data_3.underflow = _fifo_3_set_gamma_pre_attn_Return_underflow_out;
    fifo_data_3.empty = _fifo_3_set_gamma_pre_attn_Return_empty;
    fifo_data_3.almost_full = _fifo_3_set_gamma_pre_attn_Return_full;
    fifo_data_4.overflow = _fifo_4_get_gamma_pre_attn_Return_overflow_out;
    fifo_data_4.underflow = _fifo_4_get_gamma_pre_attn_Return_underflow_out;
    fifo_data_4.empty = _fifo_4_get_gamma_pre_attn_Return_empty;
    fifo_data_4.almost_full = _fifo_4_get_gamma_pre_attn_Return_full;
    fifo_data_4.data_out = _fifo_4_get_gamma_pre_attn_Return_q;
    fifo_data_5.overflow = _fifo_5_set_gamma_pre_mlp_Return_overflow_out;
    fifo_data_5.underflow = _fifo_5_set_gamma_pre_mlp_Return_underflow_out;
    fifo_data_5.empty = _fifo_5_set_gamma_pre_mlp_Return_empty;
    fifo_data_5.almost_full = _fifo_5_set_gamma_pre_mlp_Return_full;
    fifo_data_6.overflow = _fifo_6_get_gamma_pre_mlp_Return_overflow_out;
    fifo_data_6.underflow = _fifo_6_get_gamma_pre_mlp_Return_underflow_out;
    fifo_data_6.empty = _fifo_6_get_gamma_pre_mlp_Return_empty;
    fifo_data_6.almost_full = _fifo_6_get_gamma_pre_mlp_Return_full;
    fifo_data_6.data_out = _fifo_6_get_gamma_pre_mlp_Return_q;
    fifo_data_7.overflow = _fifo_7_set_rsqrt_lut_Return_overflow_out;
    fifo_data_7.underflow = _fifo_7_set_rsqrt_lut_Return_underflow_out;
    fifo_data_7.empty = _fifo_7_set_rsqrt_lut_Return_empty;
    fifo_data_7.almost_full = _fifo_7_set_rsqrt_lut_Return_full;
    fifo_data_8.overflow = _fifo_8_lookup_rsqrt_Return_overflow_out;
    fifo_data_8.underflow = _fifo_8_lookup_rsqrt_Return_underflow_out;
    fifo_data_8.empty = _fifo_8_lookup_rsqrt_Return_empty;
    fifo_data_8.almost_full = _fifo_8_lookup_rsqrt_Return_full;
    fifo_data_8.data_out = _fifo_8_lookup_rsqrt_Return_q;
    fifo_data_9.overflow = _fifo_9_rope_read_cos_row_Return_overflow_out;
    fifo_data_9.underflow = _fifo_9_rope_read_cos_row_Return_underflow_out;
    fifo_data_9.empty = _fifo_9_rope_read_cos_row_Return_empty;
    fifo_data_9.almost_full = _fifo_9_rope_read_cos_row_Return_full;
    fifo_data_9.data_out = _fifo_9_rope_read_cos_row_Return_q;
    fifo_data_10.overflow = _fifo_10_rope_read_sin_row_Return_overflow_out;
    fifo_data_10.underflow = _fifo_10_rope_read_sin_row_Return_underflow_out;
    fifo_data_10.empty = _fifo_10_rope_read_sin_row_Return_empty;
    fifo_data_10.almost_full = _fifo_10_rope_read_sin_row_Return_full;
    fifo_data_10.data_out = _fifo_10_rope_read_sin_row_Return_q;
    fifo_data_11.overflow = _fifo_11_rope_write_cos_row_Return_overflow_out;
    fifo_data_11.underflow = _fifo_11_rope_write_cos_row_Return_underflow_out;
    fifo_data_11.empty = _fifo_11_rope_write_cos_row_Return_empty;
    fifo_data_11.almost_full = _fifo_11_rope_write_cos_row_Return_full;
    fifo_data_12.overflow = _fifo_12_rope_write_sin_row_Return_overflow_out;
    fifo_data_12.underflow = _fifo_12_rope_write_sin_row_Return_underflow_out;
    fifo_data_12.empty = _fifo_12_rope_write_sin_row_Return_empty;
    fifo_data_12.almost_full = _fifo_12_rope_write_sin_row_Return_full;
    fifo_data_13.overflow = _fifo_13_set_sigmoid_lut_Return_overflow_out;
    fifo_data_13.underflow = _fifo_13_set_sigmoid_lut_Return_underflow_out;
    fifo_data_13.empty = _fifo_13_set_sigmoid_lut_Return_empty;
    fifo_data_13.almost_full = _fifo_13_set_sigmoid_lut_Return_full;
    fifo_data_14.overflow = _fifo_14_swiglu_compute_Return_overflow_out;
    fifo_data_14.underflow = _fifo_14_swiglu_compute_Return_underflow_out;
    fifo_data_14.empty = _fifo_14_swiglu_compute_Return_empty;
    fifo_data_14.almost_full = _fifo_14_swiglu_compute_Return_full;
    fifo_data_14.data_out = _fifo_14_swiglu_compute_Return_q;
    fifo_data_15.overflow = _fifo_15_dequantize_Return_overflow_out;
    fifo_data_15.underflow = _fifo_15_dequantize_Return_underflow_out;
    fifo_data_15.empty = _fifo_15_dequantize_Return_empty;
    fifo_data_15.almost_full = _fifo_15_dequantize_Return_full;
    fifo_data_15.data_out = _fifo_15_dequantize_Return_q;
    fifo_data_16.overflow = _fifo_16_residual_add_Return_overflow_out;
    fifo_data_16.underflow = _fifo_16_residual_add_Return_underflow_out;
    fifo_data_16.empty = _fifo_16_residual_add_Return_empty;
    fifo_data_16.almost_full = _fifo_16_residual_add_Return_full;
    fifo_data_16.data_out = _fifo_16_residual_add_Return_q;
    fifo_data_0.wren = _rmsnorm_accumulate_BasicBlock_0Impl_fifo_wren_0;	// vector_unit.k:31:9
    passthrough_data_17.rdy_int = _rmsnorm_accumulate_BasicBlock_0Impl_input_rdy_0;	// vector_unit.k:31:9
    fifo_data_1.data_in = _rmsnorm_get_sum_BasicBlock_0Impl_fifo_data_out_0;	// vector_unit.k:77:9
    fifo_data_1.wren = _rmsnorm_get_sum_BasicBlock_0Impl_fifo_wren_0;	// vector_unit.k:77:9
    passthrough_data_18.rdy_int = _rmsnorm_get_sum_BasicBlock_0Impl_input_rdy_0;	// vector_unit.k:77:9
    fifo_data_2.wren = _rmsnorm_reset_BasicBlock_0Impl_fifo_wren_0;	// vector_unit.k:87:9
    passthrough_data_19.rdy_int = _rmsnorm_reset_BasicBlock_0Impl_input_rdy_0;	// vector_unit.k:87:9
    fifo_data_3.wren = _set_gamma_pre_attn_BasicBlock_0Impl_fifo_wren_0;	// vector_unit.k:96:9
    passthrough_data_20.rdy_int = _set_gamma_pre_attn_BasicBlock_0Impl_input_rdy_0;	// vector_unit.k:96:9
    fifo_data_4.data_in = _get_gamma_pre_attn_BasicBlock_0Impl_fifo_data_out_0;	// vector_unit.k:104:9
    fifo_data_4.wren = _get_gamma_pre_attn_BasicBlock_0Impl_fifo_wren_0;	// vector_unit.k:104:9
    passthrough_data_21.rdy_int = _get_gamma_pre_attn_BasicBlock_0Impl_input_rdy_0;	// vector_unit.k:104:9
    fifo_data_5.wren = _set_gamma_pre_mlp_BasicBlock_0Impl_fifo_wren_0;	// vector_unit.k:114:9
    passthrough_data_22.rdy_int = _set_gamma_pre_mlp_BasicBlock_0Impl_input_rdy_0;	// vector_unit.k:114:9
    fifo_data_6.data_in = _get_gamma_pre_mlp_BasicBlock_0Impl_fifo_data_out_0;	// vector_unit.k:122:9
    fifo_data_6.wren = _get_gamma_pre_mlp_BasicBlock_0Impl_fifo_wren_0;	// vector_unit.k:122:9
    passthrough_data_23.rdy_int = _get_gamma_pre_mlp_BasicBlock_0Impl_input_rdy_0;	// vector_unit.k:122:9
    fifo_data_7.wren = _set_rsqrt_lut_BasicBlock_0Impl_fifo_wren_0;	// vector_unit.k:132:9
    passthrough_data_24.rdy_int = _set_rsqrt_lut_BasicBlock_0Impl_input_rdy_0;	// vector_unit.k:132:9
    fifo_data_8.data_in = _lookup_rsqrt_BasicBlock_0Impl_fifo_data_out_0;	// vector_unit.k:140:9
    fifo_data_8.wren = _lookup_rsqrt_BasicBlock_0Impl_fifo_wren_0;	// vector_unit.k:140:9
    passthrough_data_25.rdy_int = _lookup_rsqrt_BasicBlock_0Impl_input_rdy_0;	// vector_unit.k:140:9
    fifo_data_9.data_in = _rope_read_cos_row_BasicBlock_0Impl_fifo_data_out_0;	// vector_unit.k:152:9
    fifo_data_9.wren = _rope_read_cos_row_BasicBlock_0Impl_fifo_wren_0;	// vector_unit.k:152:9
    passthrough_data_26.rdy_int = _rope_read_cos_row_BasicBlock_0Impl_input_rdy_0;	// vector_unit.k:152:9
    fifo_data_10.data_in = _rope_read_sin_row_BasicBlock_0Impl_fifo_data_out_0;	// vector_unit.k:159:9
    fifo_data_10.wren = _rope_read_sin_row_BasicBlock_0Impl_fifo_wren_0;	// vector_unit.k:159:9
    passthrough_data_27.rdy_int = _rope_read_sin_row_BasicBlock_0Impl_input_rdy_0;	// vector_unit.k:159:9
    fifo_data_11.wren = _rope_write_cos_row_BasicBlock_0Impl_fifo_wren_0;	// vector_unit.k:166:9
    passthrough_data_28.rdy_int = _rope_write_cos_row_BasicBlock_0Impl_input_rdy_0;	// vector_unit.k:166:9
    fifo_data_12.wren = _rope_write_sin_row_BasicBlock_0Impl_fifo_wren_0;	// vector_unit.k:171:9
    passthrough_data_29.rdy_int = _rope_write_sin_row_BasicBlock_0Impl_input_rdy_0;	// vector_unit.k:171:9
    fifo_data_13.wren = _set_sigmoid_lut_BasicBlock_0Impl_fifo_wren_0;	// vector_unit.k:178:9
    passthrough_data_30.rdy_int = _set_sigmoid_lut_BasicBlock_0Impl_input_rdy_0;	// vector_unit.k:178:9
    fifo_data_14.data_in = _swiglu_compute_BasicBlock_0Impl_fifo_data_out_0;	// vector_unit.k:186:9
    fifo_data_14.wren = _swiglu_compute_BasicBlock_0Impl_fifo_wren_0;	// vector_unit.k:186:9
    passthrough_data_31.rdy_int = _swiglu_compute_BasicBlock_0Impl_input_rdy_0;	// vector_unit.k:186:9
    fifo_data_15.data_in = _dequantize_BasicBlock_0Impl_fifo_data_out_0;	// vector_unit.k:279:9
    fifo_data_15.wren = _dequantize_BasicBlock_0Impl_fifo_wren_0;	// vector_unit.k:279:9
    passthrough_data_32.rdy_int = _dequantize_BasicBlock_0Impl_input_rdy_0;	// vector_unit.k:279:9
    fifo_data_16.data_in = _residual_add_BasicBlock_0Impl_fifo_data_out_0;	// vector_unit.k:396:9
    fifo_data_16.wren = _residual_add_BasicBlock_0Impl_fifo_wren_0;	// vector_unit.k:396:9
    passthrough_data_33.rdy_int = _residual_add_BasicBlock_0Impl_input_rdy_0;	// vector_unit.k:396:9
  end // always_comb

  assign has_startup_completed_raw = 1'b1;
  assign stall_rate_supported_out_net = 1'b0;
  KanagawaResetControl #(
    .WIDTH(35),
    .DELAY_CYCLES(3),
    .FAN_OUT_LEVELS(1),
    .HOLD_CYCLES(18),
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
  vector_unit__gamma_pre_attn__mem_container _gamma_pre_attn (	// vector_unit.k:15:5
    .clk             (clk),	// vector_unit.k:15:5
    .rst             (1'b0),	// vector_unit.k:15:5
    .rden_in_0       (_get_gamma_pre_attn_BasicBlock_0Impl_memory_rden_out_35_0),	// vector_unit.k:104:9
    .read_addr_in_0  (_get_gamma_pre_attn_BasicBlock_0Impl_memory_read_addr_out_35_0),	// vector_unit.k:104:9
    .wren_in_0       (_set_gamma_pre_attn_BasicBlock_0Impl_memory_wren_35_0),	// vector_unit.k:96:9
    .write_addr_in_0 (_set_gamma_pre_attn_BasicBlock_0Impl_memory_write_addr_out_35_0),	// vector_unit.k:96:9
    .write_data_in_0 (_set_gamma_pre_attn_BasicBlock_0Impl_memory_write_data_out_35_0),	// vector_unit.k:96:9
    .read_data_out_0 (__gamma_pre_attn_read_data_out_0),
    .init_completed  (__gamma_pre_attn_init_completed)
  );	// vector_unit.k:15:5
  vector_unit__gamma_pre_mlp__mem_container _gamma_pre_mlp (	// vector_unit.k:16:5
    .clk             (clk),	// vector_unit.k:15:5
    .rst             (1'b0),	// vector_unit.k:15:5
    .rden_in_0       (_get_gamma_pre_mlp_BasicBlock_0Impl_memory_rden_out_36_0),	// vector_unit.k:122:9
    .read_addr_in_0  (_get_gamma_pre_mlp_BasicBlock_0Impl_memory_read_addr_out_36_0),	// vector_unit.k:122:9
    .wren_in_0       (_set_gamma_pre_mlp_BasicBlock_0Impl_memory_wren_36_0),	// vector_unit.k:114:9
    .write_addr_in_0 (_set_gamma_pre_mlp_BasicBlock_0Impl_memory_write_addr_out_36_0),	// vector_unit.k:114:9
    .write_data_in_0 (_set_gamma_pre_mlp_BasicBlock_0Impl_memory_write_data_out_36_0),	// vector_unit.k:114:9
    .read_data_out_0 (__gamma_pre_mlp_read_data_out_0),
    .init_completed  (__gamma_pre_mlp_init_completed)
  );	// vector_unit.k:16:5
  vector_unit__rsqrt_lut__mem_container _rsqrt_lut (	// vector_unit.k:17:5
    .clk             (clk),	// vector_unit.k:15:5
    .rst             (1'b0),	// vector_unit.k:15:5
    .rden_in_0       (_lookup_rsqrt_BasicBlock_0Impl_memory_rden_out_37_0),	// vector_unit.k:140:9
    .read_addr_in_0  (_lookup_rsqrt_BasicBlock_0Impl_memory_read_addr_out_37_0),	// vector_unit.k:140:9
    .wren_in_0       (_set_rsqrt_lut_BasicBlock_0Impl_memory_wren_37_0),	// vector_unit.k:132:9
    .write_addr_in_0 (_set_rsqrt_lut_BasicBlock_0Impl_memory_write_addr_out_37_0),	// vector_unit.k:132:9
    .write_data_in_0 (_set_rsqrt_lut_BasicBlock_0Impl_memory_write_data_out_37_0),	// vector_unit.k:132:9
    .read_data_out_0 (__rsqrt_lut_read_data_out_0),
    .init_completed  (__rsqrt_lut_init_completed)
  );	// vector_unit.k:17:5
  vector_unit__sigmoid_lut__mem_container _sigmoid_lut (	// vector_unit.k:20:5
    .clk             (clk),	// vector_unit.k:15:5
    .rst             (1'b0),	// vector_unit.k:15:5
    .rden_in_0       (_swiglu_compute_BasicBlock_0Impl_memory_rden_out_38_0),	// vector_unit.k:186:9
    .read_addr_in_0  (_swiglu_compute_BasicBlock_0Impl_memory_read_addr_out_38_0),	// vector_unit.k:186:9
    .wren_in_0       (_set_sigmoid_lut_BasicBlock_0Impl_memory_wren_38_0),	// vector_unit.k:178:9
    .write_addr_in_0 (_set_sigmoid_lut_BasicBlock_0Impl_memory_write_addr_out_38_0),	// vector_unit.k:178:9
    .write_data_in_0 (_set_sigmoid_lut_BasicBlock_0Impl_memory_write_data_out_38_0),	// vector_unit.k:178:9
    .read_data_out_0 (__sigmoid_lut_read_data_out_0),
    .init_completed  (__sigmoid_lut_init_completed)
  );	// vector_unit.k:20:5
  vector_unit__cos_table__mem_container _cos_table (	// vector_unit.k:23:5
    .clk             (clk),	// vector_unit.k:15:5
    .rst             (1'b0),	// vector_unit.k:15:5
    .rden_in_0       (_rope_read_cos_row_BasicBlock_0Impl_memory_rden_out_39_0),	// vector_unit.k:152:9
    .read_addr_in_0  (_rope_read_cos_row_BasicBlock_0Impl_memory_read_addr_out_39_0),	// vector_unit.k:152:9
    .wren_in_0       (_rope_write_cos_row_BasicBlock_0Impl_memory_wren_39_0),	// vector_unit.k:166:9
    .write_addr_in_0 (_rope_write_cos_row_BasicBlock_0Impl_memory_write_addr_out_39_0),	// vector_unit.k:166:9
    .write_data_in_0 (_rope_write_cos_row_BasicBlock_0Impl_memory_write_data_out_39_0),	// vector_unit.k:166:9
    .read_data_out_0 (__cos_table_read_data_out_0),
    .init_completed  (__cos_table_init_completed)
  );	// vector_unit.k:23:5
  vector_unit__sin_table__mem_container _sin_table (	// vector_unit.k:24:5
    .clk             (clk),	// vector_unit.k:15:5
    .rst             (1'b0),	// vector_unit.k:15:5
    .rden_in_0       (_rope_read_sin_row_BasicBlock_0Impl_memory_rden_out_40_0),	// vector_unit.k:159:9
    .read_addr_in_0  (_rope_read_sin_row_BasicBlock_0Impl_memory_read_addr_out_40_0),	// vector_unit.k:159:9
    .wren_in_0       (_rope_write_sin_row_BasicBlock_0Impl_memory_wren_40_0),	// vector_unit.k:171:9
    .write_addr_in_0 (_rope_write_sin_row_BasicBlock_0Impl_memory_write_addr_out_40_0),	// vector_unit.k:171:9
    .write_data_in_0 (_rope_write_sin_row_BasicBlock_0Impl_memory_write_data_out_40_0),	// vector_unit.k:171:9
    .read_data_out_0 (__sin_table_read_data_out_0),
    .init_completed  (__sin_table_init_completed)
  );	// vector_unit.k:24:5
  vector_unit_reg_32_w2_v_1_32_0_i_32_0 _sum_sq (	// vector_unit.k:13:5
    .clk           (clk),	// vector_unit.k:15:5
    .rst           (reg_rst_delayed[0]),	// vector_unit.k:13:5
    .input_valid_0 (_rmsnorm_accumulate_BasicBlock_0Impl_global_out__sum_sq_34_0_valid),	// vector_unit.k:31:9
    .input_0       (_rmsnorm_accumulate_BasicBlock_0Impl_global_out__sum_sq_34_0),	// vector_unit.k:31:9
    .input_valid_1 (_rmsnorm_reset_BasicBlock_0Impl_global_out__sum_sq_34_1_valid),	// vector_unit.k:87:9
    .value_out     (__sum_sq_value_out)
  );	// vector_unit.k:13:5
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
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) has_startup_completed_delayed_6_delay_chain (
    .clk      (clk),
    .data_in  (has_others_completed),
    .data_out (_has_startup_completed_delayed_6_delay_chain_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) has_startup_completed_delayed_7_delay_chain (
    .clk      (clk),
    .data_in  (has_others_completed),
    .data_out (_has_startup_completed_delayed_7_delay_chain_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) has_startup_completed_delayed_8_delay_chain (
    .clk      (clk),
    .data_in  (has_others_completed),
    .data_out (_has_startup_completed_delayed_8_delay_chain_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) has_startup_completed_delayed_9_delay_chain (
    .clk      (clk),
    .data_in  (has_others_completed),
    .data_out (_has_startup_completed_delayed_9_delay_chain_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) has_startup_completed_delayed_10_delay_chain (
    .clk      (clk),
    .data_in  (has_others_completed),
    .data_out (_has_startup_completed_delayed_10_delay_chain_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) has_startup_completed_delayed_11_delay_chain (
    .clk      (clk),
    .data_in  (has_others_completed),
    .data_out (_has_startup_completed_delayed_11_delay_chain_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) has_startup_completed_delayed_12_delay_chain (
    .clk      (clk),
    .data_in  (has_others_completed),
    .data_out (_has_startup_completed_delayed_12_delay_chain_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) has_startup_completed_delayed_13_delay_chain (
    .clk      (clk),
    .data_in  (has_others_completed),
    .data_out (_has_startup_completed_delayed_13_delay_chain_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) has_startup_completed_delayed_14_delay_chain (
    .clk      (clk),
    .data_in  (has_others_completed),
    .data_out (_has_startup_completed_delayed_14_delay_chain_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) has_startup_completed_delayed_15_delay_chain (
    .clk      (clk),
    .data_in  (has_others_completed),
    .data_out (_has_startup_completed_delayed_15_delay_chain_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) has_startup_completed_delayed_16_delay_chain (
    .clk      (clk),
    .data_in  (has_others_completed),
    .data_out (_has_startup_completed_delayed_16_delay_chain_data_out)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(0),
    .PORT_WIDTH(1),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_0_rmsnorm_accumulate_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(0)
  ) fifo_0_rmsnorm_accumulate_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[1]),
    .overflow_out  (_fifo_0_rmsnorm_accumulate_Return_overflow_out),
    .underflow_out (_fifo_0_rmsnorm_accumulate_Return_underflow_out),
    .empty         (_fifo_0_rmsnorm_accumulate_Return_empty),
    .rdreq         (fifo_data_0.rden),
    .full          (_fifo_0_rmsnorm_accumulate_Return_full),
    .wrreq         (fifo_data_0.wren),
    .data          ('0),
    .q             (/* unused */)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(32),
    .PORT_WIDTH(32),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_1_rmsnorm_get_sum_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(1)
  ) fifo_1_rmsnorm_get_sum_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[2]),
    .overflow_out  (_fifo_1_rmsnorm_get_sum_Return_overflow_out),
    .underflow_out (_fifo_1_rmsnorm_get_sum_Return_underflow_out),
    .empty         (_fifo_1_rmsnorm_get_sum_Return_empty),
    .rdreq         (fifo_data_1.rden),
    .full          (_fifo_1_rmsnorm_get_sum_Return_full),
    .wrreq         (fifo_data_1.wren),
    .data          (fifo_data_1.data_in),
    .q             (_fifo_1_rmsnorm_get_sum_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(0),
    .PORT_WIDTH(1),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_2_rmsnorm_reset_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(0)
  ) fifo_2_rmsnorm_reset_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[3]),
    .overflow_out  (_fifo_2_rmsnorm_reset_Return_overflow_out),
    .underflow_out (_fifo_2_rmsnorm_reset_Return_underflow_out),
    .empty         (_fifo_2_rmsnorm_reset_Return_empty),
    .rdreq         (fifo_data_2.rden),
    .full          (_fifo_2_rmsnorm_reset_Return_full),
    .wrreq         (fifo_data_2.wren),
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
    .AUTO_PIPELINE_GROUP("fifo_3_set_gamma_pre_attn_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(0)
  ) fifo_3_set_gamma_pre_attn_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[4]),
    .overflow_out  (_fifo_3_set_gamma_pre_attn_Return_overflow_out),
    .underflow_out (_fifo_3_set_gamma_pre_attn_Return_underflow_out),
    .empty         (_fifo_3_set_gamma_pre_attn_Return_empty),
    .rdreq         (fifo_data_3.rden),
    .full          (_fifo_3_set_gamma_pre_attn_Return_full),
    .wrreq         (fifo_data_3.wren),
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
    .AUTO_PIPELINE_GROUP("fifo_4_get_gamma_pre_attn_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(4),
    .USE_LUTRAM(1)
  ) fifo_4_get_gamma_pre_attn_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[5]),
    .overflow_out  (_fifo_4_get_gamma_pre_attn_Return_overflow_out),
    .underflow_out (_fifo_4_get_gamma_pre_attn_Return_underflow_out),
    .empty         (_fifo_4_get_gamma_pre_attn_Return_empty),
    .rdreq         (fifo_data_4.rden),
    .full          (_fifo_4_get_gamma_pre_attn_Return_full),
    .wrreq         (fifo_data_4.wren),
    .data          (fifo_data_4.data_in),
    .q             (_fifo_4_get_gamma_pre_attn_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(0),
    .PORT_WIDTH(1),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_5_set_gamma_pre_mlp_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(0)
  ) fifo_5_set_gamma_pre_mlp_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[6]),
    .overflow_out  (_fifo_5_set_gamma_pre_mlp_Return_overflow_out),
    .underflow_out (_fifo_5_set_gamma_pre_mlp_Return_underflow_out),
    .empty         (_fifo_5_set_gamma_pre_mlp_Return_empty),
    .rdreq         (fifo_data_5.rden),
    .full          (_fifo_5_set_gamma_pre_mlp_Return_full),
    .wrreq         (fifo_data_5.wren),
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
    .AUTO_PIPELINE_GROUP("fifo_6_get_gamma_pre_mlp_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(4),
    .USE_LUTRAM(1)
  ) fifo_6_get_gamma_pre_mlp_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[7]),
    .overflow_out  (_fifo_6_get_gamma_pre_mlp_Return_overflow_out),
    .underflow_out (_fifo_6_get_gamma_pre_mlp_Return_underflow_out),
    .empty         (_fifo_6_get_gamma_pre_mlp_Return_empty),
    .rdreq         (fifo_data_6.rden),
    .full          (_fifo_6_get_gamma_pre_mlp_Return_full),
    .wrreq         (fifo_data_6.wren),
    .data          (fifo_data_6.data_in),
    .q             (_fifo_6_get_gamma_pre_mlp_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(0),
    .PORT_WIDTH(1),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_7_set_rsqrt_lut_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(0)
  ) fifo_7_set_rsqrt_lut_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[8]),
    .overflow_out  (_fifo_7_set_rsqrt_lut_Return_overflow_out),
    .underflow_out (_fifo_7_set_rsqrt_lut_Return_underflow_out),
    .empty         (_fifo_7_set_rsqrt_lut_Return_empty),
    .rdreq         (fifo_data_7.rden),
    .full          (_fifo_7_set_rsqrt_lut_Return_full),
    .wrreq         (fifo_data_7.wren),
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
    .AUTO_PIPELINE_GROUP("fifo_8_lookup_rsqrt_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(4),
    .USE_LUTRAM(1)
  ) fifo_8_lookup_rsqrt_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[9]),
    .overflow_out  (_fifo_8_lookup_rsqrt_Return_overflow_out),
    .underflow_out (_fifo_8_lookup_rsqrt_Return_underflow_out),
    .empty         (_fifo_8_lookup_rsqrt_Return_empty),
    .rdreq         (fifo_data_8.rden),
    .full          (_fifo_8_lookup_rsqrt_Return_full),
    .wrreq         (fifo_data_8.wren),
    .data          (fifo_data_8.data_in),
    .q             (_fifo_8_lookup_rsqrt_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(1024),
    .PORT_WIDTH(1024),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_9_rope_read_cos_row_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(4),
    .USE_LUTRAM(1)
  ) fifo_9_rope_read_cos_row_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[10]),
    .overflow_out  (_fifo_9_rope_read_cos_row_Return_overflow_out),
    .underflow_out (_fifo_9_rope_read_cos_row_Return_underflow_out),
    .empty         (_fifo_9_rope_read_cos_row_Return_empty),
    .rdreq         (fifo_data_9.rden),
    .full          (_fifo_9_rope_read_cos_row_Return_full),
    .wrreq         (fifo_data_9.wren),
    .data          (fifo_data_9.data_in),
    .q             (_fifo_9_rope_read_cos_row_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(1024),
    .PORT_WIDTH(1024),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_10_rope_read_sin_row_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(4),
    .USE_LUTRAM(1)
  ) fifo_10_rope_read_sin_row_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[11]),
    .overflow_out  (_fifo_10_rope_read_sin_row_Return_overflow_out),
    .underflow_out (_fifo_10_rope_read_sin_row_Return_underflow_out),
    .empty         (_fifo_10_rope_read_sin_row_Return_empty),
    .rdreq         (fifo_data_10.rden),
    .full          (_fifo_10_rope_read_sin_row_Return_full),
    .wrreq         (fifo_data_10.wren),
    .data          (fifo_data_10.data_in),
    .q             (_fifo_10_rope_read_sin_row_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(0),
    .PORT_WIDTH(1),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_11_rope_write_cos_row_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(0)
  ) fifo_11_rope_write_cos_row_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[12]),
    .overflow_out  (_fifo_11_rope_write_cos_row_Return_overflow_out),
    .underflow_out (_fifo_11_rope_write_cos_row_Return_underflow_out),
    .empty         (_fifo_11_rope_write_cos_row_Return_empty),
    .rdreq         (fifo_data_11.rden),
    .full          (_fifo_11_rope_write_cos_row_Return_full),
    .wrreq         (fifo_data_11.wren),
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
    .AUTO_PIPELINE_GROUP("fifo_12_rope_write_sin_row_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(0)
  ) fifo_12_rope_write_sin_row_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[13]),
    .overflow_out  (_fifo_12_rope_write_sin_row_Return_overflow_out),
    .underflow_out (_fifo_12_rope_write_sin_row_Return_underflow_out),
    .empty         (_fifo_12_rope_write_sin_row_Return_empty),
    .rdreq         (fifo_data_12.rden),
    .full          (_fifo_12_rope_write_sin_row_Return_full),
    .wrreq         (fifo_data_12.wren),
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
    .AUTO_PIPELINE_GROUP("fifo_13_set_sigmoid_lut_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(0)
  ) fifo_13_set_sigmoid_lut_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[14]),
    .overflow_out  (_fifo_13_set_sigmoid_lut_Return_overflow_out),
    .underflow_out (_fifo_13_set_sigmoid_lut_Return_underflow_out),
    .empty         (_fifo_13_set_sigmoid_lut_Return_empty),
    .rdreq         (fifo_data_13.rden),
    .full          (_fifo_13_set_sigmoid_lut_Return_full),
    .wrreq         (fifo_data_13.wren),
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
    .AUTO_PIPELINE_GROUP("fifo_14_swiglu_compute_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(6),
    .USE_LUTRAM(1)
  ) fifo_14_swiglu_compute_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[15]),
    .overflow_out  (_fifo_14_swiglu_compute_Return_overflow_out),
    .underflow_out (_fifo_14_swiglu_compute_Return_underflow_out),
    .empty         (_fifo_14_swiglu_compute_Return_empty),
    .rdreq         (fifo_data_14.rden),
    .full          (_fifo_14_swiglu_compute_Return_full),
    .wrreq         (fifo_data_14.wren),
    .data          (fifo_data_14.data_in),
    .q             (_fifo_14_swiglu_compute_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(16),
    .PORT_WIDTH(16),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_15_dequantize_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(4),
    .USE_LUTRAM(1)
  ) fifo_15_dequantize_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[16]),
    .overflow_out  (_fifo_15_dequantize_Return_overflow_out),
    .underflow_out (_fifo_15_dequantize_Return_underflow_out),
    .empty         (_fifo_15_dequantize_Return_empty),
    .rdreq         (fifo_data_15.rden),
    .full          (_fifo_15_dequantize_Return_full),
    .wrreq         (fifo_data_15.wren),
    .data          (fifo_data_15.data_in),
    .q             (_fifo_15_dequantize_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(16),
    .PORT_WIDTH(16),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_16_residual_add_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(4),
    .USE_LUTRAM(1)
  ) fifo_16_residual_add_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[17]),
    .overflow_out  (_fifo_16_residual_add_Return_overflow_out),
    .underflow_out (_fifo_16_residual_add_Return_underflow_out),
    .empty         (_fifo_16_residual_add_Return_empty),
    .rdreq         (fifo_data_16.rden),
    .full          (_fifo_16_residual_add_Return_full),
    .wrreq         (fifo_data_16.wren),
    .data          (fifo_data_16.data_in),
    .q             (_fifo_16_residual_add_Return_q)
  );
  vector_unit_rmsnorm_accumulate_BasicBlock_0 rmsnorm_accumulate_BasicBlock_0Impl (	// vector_unit.k:31:9
    .clk                           (clk),	// vector_unit.k:31:9
    .rst                           (reg_rst_delayed[18]),	// vector_unit.k:31:9
    .done_out                      (/* unused */),
    .global_in__sum_sq_34          (__sum_sq_value_out),	// vector_unit.k:13:5
    .global_out__sum_sq_34_0_valid
      (_rmsnorm_accumulate_BasicBlock_0Impl_global_out__sum_sq_34_0_valid),
    .global_out__sum_sq_34_0
      (_rmsnorm_accumulate_BasicBlock_0Impl_global_out__sum_sq_34_0),
    .fifo_wren_0                   (_rmsnorm_accumulate_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0     (fifo_data_0.almost_full),	// vector_unit.k:31:9
    .fifo_overflow_in_0            (fifo_data_0.overflow),	// vector_unit.k:31:9
    .data_in_17                    (passthrough_data_17.data),	// vector_unit.k:31:9
    .input_fifo_underflow_0        (passthrough_data_17.underflow),	// vector_unit.k:31:9
    .input_rdy_0                   (_rmsnorm_accumulate_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0                 (passthrough_data_17.valid),	// vector_unit.k:31:9
    .control_state_out             (/* unused */)
  );	// vector_unit.k:31:9
  vector_unit_rmsnorm_get_sum_BasicBlock_0 rmsnorm_get_sum_BasicBlock_0Impl (	// vector_unit.k:77:9
    .clk                       (clk),	// vector_unit.k:77:9
    .rst                       (reg_rst_delayed[19]),	// vector_unit.k:77:9
    .done_out                  (/* unused */),
    .global_in__sum_sq_34      (__sum_sq_value_out),	// vector_unit.k:13:5
    .fifo_data_out_0           (_rmsnorm_get_sum_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0               (_rmsnorm_get_sum_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_1.almost_full),	// vector_unit.k:77:9
    .fifo_overflow_in_0        (fifo_data_1.overflow),	// vector_unit.k:77:9
    .input_fifo_underflow_0    (passthrough_data_18.underflow),	// vector_unit.k:77:9
    .input_rdy_0               (_rmsnorm_get_sum_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_18.valid),	// vector_unit.k:77:9
    .control_state_out         (/* unused */)
  );	// vector_unit.k:77:9
  vector_unit_rmsnorm_reset_BasicBlock_0 rmsnorm_reset_BasicBlock_0Impl (	// vector_unit.k:87:9
    .clk                           (clk),	// vector_unit.k:87:9
    .rst                           (reg_rst_delayed[20]),	// vector_unit.k:87:9
    .done_out                      (/* unused */),
    .global_out__sum_sq_34_1_valid
      (_rmsnorm_reset_BasicBlock_0Impl_global_out__sum_sq_34_1_valid),
    .fifo_wren_0                   (_rmsnorm_reset_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0     (fifo_data_2.almost_full),	// vector_unit.k:87:9
    .fifo_overflow_in_0            (fifo_data_2.overflow),	// vector_unit.k:87:9
    .input_fifo_underflow_0        (passthrough_data_19.underflow),	// vector_unit.k:87:9
    .input_rdy_0                   (_rmsnorm_reset_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0                 (passthrough_data_19.valid),	// vector_unit.k:87:9
    .control_state_out             (/* unused */)
  );	// vector_unit.k:87:9
  vector_unit_set_gamma_pre_attn_BasicBlock_0 set_gamma_pre_attn_BasicBlock_0Impl (	// vector_unit.k:96:9
    .clk                        (clk),	// vector_unit.k:96:9
    .rst                        (reg_rst_delayed[21]),	// vector_unit.k:96:9
    .done_out                   (/* unused */),
    .memory_write_data_out_35_0
      (_set_gamma_pre_attn_BasicBlock_0Impl_memory_write_data_out_35_0),
    .memory_write_addr_out_35_0
      (_set_gamma_pre_attn_BasicBlock_0Impl_memory_write_addr_out_35_0),
    .memory_wren_35_0           (_set_gamma_pre_attn_BasicBlock_0Impl_memory_wren_35_0),
    .fifo_wren_0                (_set_gamma_pre_attn_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0  (fifo_data_3.almost_full),	// vector_unit.k:96:9
    .fifo_overflow_in_0         (fifo_data_3.overflow),	// vector_unit.k:96:9
    .data_in_20                 (passthrough_data_20.data),	// vector_unit.k:96:9
    .input_fifo_underflow_0     (passthrough_data_20.underflow),	// vector_unit.k:96:9
    .input_rdy_0                (_set_gamma_pre_attn_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0              (passthrough_data_20.valid),	// vector_unit.k:96:9
    .control_state_out          (/* unused */)
  );	// vector_unit.k:96:9
  vector_unit_get_gamma_pre_attn_BasicBlock_0 get_gamma_pre_attn_BasicBlock_0Impl (	// vector_unit.k:104:9
    .clk                       (clk),	// vector_unit.k:104:9
    .rst                       (reg_rst_delayed[22]),	// vector_unit.k:104:9
    .done_out                  (/* unused */),
    .memory_read_data_in_35_0  (__gamma_pre_attn_read_data_out_0),	// vector_unit.k:15:5
    .memory_read_addr_out_35_0
      (_get_gamma_pre_attn_BasicBlock_0Impl_memory_read_addr_out_35_0),
    .memory_rden_out_35_0
      (_get_gamma_pre_attn_BasicBlock_0Impl_memory_rden_out_35_0),
    .fifo_data_out_0           (_get_gamma_pre_attn_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0               (_get_gamma_pre_attn_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_4.almost_full),	// vector_unit.k:104:9
    .fifo_overflow_in_0        (fifo_data_4.overflow),	// vector_unit.k:104:9
    .data_in_21                (passthrough_data_21.data),	// vector_unit.k:104:9
    .input_fifo_underflow_0    (passthrough_data_21.underflow),	// vector_unit.k:104:9
    .input_rdy_0               (_get_gamma_pre_attn_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_21.valid),	// vector_unit.k:104:9
    .control_state_out         (/* unused */)
  );	// vector_unit.k:104:9
  vector_unit_set_gamma_pre_mlp_BasicBlock_0 set_gamma_pre_mlp_BasicBlock_0Impl (	// vector_unit.k:114:9
    .clk                        (clk),	// vector_unit.k:114:9
    .rst                        (reg_rst_delayed[23]),	// vector_unit.k:114:9
    .done_out                   (/* unused */),
    .memory_write_data_out_36_0
      (_set_gamma_pre_mlp_BasicBlock_0Impl_memory_write_data_out_36_0),
    .memory_write_addr_out_36_0
      (_set_gamma_pre_mlp_BasicBlock_0Impl_memory_write_addr_out_36_0),
    .memory_wren_36_0           (_set_gamma_pre_mlp_BasicBlock_0Impl_memory_wren_36_0),
    .fifo_wren_0                (_set_gamma_pre_mlp_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0  (fifo_data_5.almost_full),	// vector_unit.k:114:9
    .fifo_overflow_in_0         (fifo_data_5.overflow),	// vector_unit.k:114:9
    .data_in_22                 (passthrough_data_22.data),	// vector_unit.k:114:9
    .input_fifo_underflow_0     (passthrough_data_22.underflow),	// vector_unit.k:114:9
    .input_rdy_0                (_set_gamma_pre_mlp_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0              (passthrough_data_22.valid),	// vector_unit.k:114:9
    .control_state_out          (/* unused */)
  );	// vector_unit.k:114:9
  vector_unit_get_gamma_pre_mlp_BasicBlock_0 get_gamma_pre_mlp_BasicBlock_0Impl (	// vector_unit.k:122:9
    .clk                       (clk),	// vector_unit.k:122:9
    .rst                       (reg_rst_delayed[24]),	// vector_unit.k:122:9
    .done_out                  (/* unused */),
    .memory_read_data_in_36_0  (__gamma_pre_mlp_read_data_out_0),	// vector_unit.k:16:5
    .memory_read_addr_out_36_0
      (_get_gamma_pre_mlp_BasicBlock_0Impl_memory_read_addr_out_36_0),
    .memory_rden_out_36_0      (_get_gamma_pre_mlp_BasicBlock_0Impl_memory_rden_out_36_0),
    .fifo_data_out_0           (_get_gamma_pre_mlp_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0               (_get_gamma_pre_mlp_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_6.almost_full),	// vector_unit.k:122:9
    .fifo_overflow_in_0        (fifo_data_6.overflow),	// vector_unit.k:122:9
    .data_in_23                (passthrough_data_23.data),	// vector_unit.k:122:9
    .input_fifo_underflow_0    (passthrough_data_23.underflow),	// vector_unit.k:122:9
    .input_rdy_0               (_get_gamma_pre_mlp_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_23.valid),	// vector_unit.k:122:9
    .control_state_out         (/* unused */)
  );	// vector_unit.k:122:9
  vector_unit_set_rsqrt_lut_BasicBlock_0 set_rsqrt_lut_BasicBlock_0Impl (	// vector_unit.k:132:9
    .clk                        (clk),	// vector_unit.k:132:9
    .rst                        (reg_rst_delayed[25]),	// vector_unit.k:132:9
    .done_out                   (/* unused */),
    .memory_write_data_out_37_0
      (_set_rsqrt_lut_BasicBlock_0Impl_memory_write_data_out_37_0),
    .memory_write_addr_out_37_0
      (_set_rsqrt_lut_BasicBlock_0Impl_memory_write_addr_out_37_0),
    .memory_wren_37_0           (_set_rsqrt_lut_BasicBlock_0Impl_memory_wren_37_0),
    .fifo_wren_0                (_set_rsqrt_lut_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0  (fifo_data_7.almost_full),	// vector_unit.k:132:9
    .fifo_overflow_in_0         (fifo_data_7.overflow),	// vector_unit.k:132:9
    .data_in_24                 (passthrough_data_24.data),	// vector_unit.k:132:9
    .input_fifo_underflow_0     (passthrough_data_24.underflow),	// vector_unit.k:132:9
    .input_rdy_0                (_set_rsqrt_lut_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0              (passthrough_data_24.valid),	// vector_unit.k:132:9
    .control_state_out          (/* unused */)
  );	// vector_unit.k:132:9
  vector_unit_lookup_rsqrt_BasicBlock_0 lookup_rsqrt_BasicBlock_0Impl (	// vector_unit.k:140:9
    .clk                       (clk),	// vector_unit.k:140:9
    .rst                       (reg_rst_delayed[26]),	// vector_unit.k:140:9
    .done_out                  (/* unused */),
    .memory_read_data_in_37_0  (__rsqrt_lut_read_data_out_0),	// vector_unit.k:17:5
    .memory_read_addr_out_37_0 (_lookup_rsqrt_BasicBlock_0Impl_memory_read_addr_out_37_0),
    .memory_rden_out_37_0      (_lookup_rsqrt_BasicBlock_0Impl_memory_rden_out_37_0),
    .fifo_data_out_0           (_lookup_rsqrt_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0               (_lookup_rsqrt_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_8.almost_full),	// vector_unit.k:140:9
    .fifo_overflow_in_0        (fifo_data_8.overflow),	// vector_unit.k:140:9
    .data_in_25                (passthrough_data_25.data),	// vector_unit.k:140:9
    .input_fifo_underflow_0    (passthrough_data_25.underflow),	// vector_unit.k:140:9
    .input_rdy_0               (_lookup_rsqrt_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_25.valid),	// vector_unit.k:140:9
    .control_state_out         (/* unused */)
  );	// vector_unit.k:140:9
  vector_unit_rope_read_cos_row_BasicBlock_0 rope_read_cos_row_BasicBlock_0Impl (	// vector_unit.k:152:9
    .clk                       (clk),	// vector_unit.k:152:9
    .rst                       (reg_rst_delayed[27]),	// vector_unit.k:152:9
    .done_out                  (/* unused */),
    .memory_read_data_in_39_0  (__cos_table_read_data_out_0),	// vector_unit.k:23:5
    .memory_read_addr_out_39_0
      (_rope_read_cos_row_BasicBlock_0Impl_memory_read_addr_out_39_0),
    .memory_rden_out_39_0      (_rope_read_cos_row_BasicBlock_0Impl_memory_rden_out_39_0),
    .fifo_data_out_0           (_rope_read_cos_row_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0               (_rope_read_cos_row_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_9.almost_full),	// vector_unit.k:152:9
    .fifo_overflow_in_0        (fifo_data_9.overflow),	// vector_unit.k:152:9
    .data_in_26                (passthrough_data_26.data),	// vector_unit.k:152:9
    .input_fifo_underflow_0    (passthrough_data_26.underflow),	// vector_unit.k:152:9
    .input_rdy_0               (_rope_read_cos_row_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_26.valid),	// vector_unit.k:152:9
    .control_state_out         (/* unused */)
  );	// vector_unit.k:152:9
  vector_unit_rope_read_sin_row_BasicBlock_0 rope_read_sin_row_BasicBlock_0Impl (	// vector_unit.k:159:9
    .clk                       (clk),	// vector_unit.k:159:9
    .rst                       (reg_rst_delayed[28]),	// vector_unit.k:159:9
    .done_out                  (/* unused */),
    .memory_read_data_in_40_0  (__sin_table_read_data_out_0),	// vector_unit.k:24:5
    .memory_read_addr_out_40_0
      (_rope_read_sin_row_BasicBlock_0Impl_memory_read_addr_out_40_0),
    .memory_rden_out_40_0      (_rope_read_sin_row_BasicBlock_0Impl_memory_rden_out_40_0),
    .fifo_data_out_0           (_rope_read_sin_row_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0               (_rope_read_sin_row_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_10.almost_full),	// vector_unit.k:159:9
    .fifo_overflow_in_0        (fifo_data_10.overflow),	// vector_unit.k:159:9
    .data_in_27                (passthrough_data_27.data),	// vector_unit.k:159:9
    .input_fifo_underflow_0    (passthrough_data_27.underflow),	// vector_unit.k:159:9
    .input_rdy_0               (_rope_read_sin_row_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_27.valid),	// vector_unit.k:159:9
    .control_state_out         (/* unused */)
  );	// vector_unit.k:159:9
  vector_unit_rope_write_cos_row_BasicBlock_0 rope_write_cos_row_BasicBlock_0Impl (	// vector_unit.k:166:9
    .clk                        (clk),	// vector_unit.k:166:9
    .rst                        (reg_rst_delayed[29]),	// vector_unit.k:166:9
    .done_out                   (/* unused */),
    .memory_write_data_out_39_0
      (_rope_write_cos_row_BasicBlock_0Impl_memory_write_data_out_39_0),
    .memory_write_addr_out_39_0
      (_rope_write_cos_row_BasicBlock_0Impl_memory_write_addr_out_39_0),
    .memory_wren_39_0           (_rope_write_cos_row_BasicBlock_0Impl_memory_wren_39_0),
    .fifo_wren_0                (_rope_write_cos_row_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0  (fifo_data_11.almost_full),	// vector_unit.k:166:9
    .fifo_overflow_in_0         (fifo_data_11.overflow),	// vector_unit.k:166:9
    .data_in_28                 (passthrough_data_28.data),	// vector_unit.k:166:9
    .input_fifo_underflow_0     (passthrough_data_28.underflow),	// vector_unit.k:166:9
    .input_rdy_0                (_rope_write_cos_row_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0              (passthrough_data_28.valid),	// vector_unit.k:166:9
    .control_state_out          (/* unused */)
  );	// vector_unit.k:166:9
  vector_unit_rope_write_sin_row_BasicBlock_0 rope_write_sin_row_BasicBlock_0Impl (	// vector_unit.k:171:9
    .clk                        (clk),	// vector_unit.k:171:9
    .rst                        (reg_rst_delayed[30]),	// vector_unit.k:171:9
    .done_out                   (/* unused */),
    .memory_write_data_out_40_0
      (_rope_write_sin_row_BasicBlock_0Impl_memory_write_data_out_40_0),
    .memory_write_addr_out_40_0
      (_rope_write_sin_row_BasicBlock_0Impl_memory_write_addr_out_40_0),
    .memory_wren_40_0           (_rope_write_sin_row_BasicBlock_0Impl_memory_wren_40_0),
    .fifo_wren_0                (_rope_write_sin_row_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0  (fifo_data_12.almost_full),	// vector_unit.k:171:9
    .fifo_overflow_in_0         (fifo_data_12.overflow),	// vector_unit.k:171:9
    .data_in_29                 (passthrough_data_29.data),	// vector_unit.k:171:9
    .input_fifo_underflow_0     (passthrough_data_29.underflow),	// vector_unit.k:171:9
    .input_rdy_0                (_rope_write_sin_row_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0              (passthrough_data_29.valid),	// vector_unit.k:171:9
    .control_state_out          (/* unused */)
  );	// vector_unit.k:171:9
  vector_unit_set_sigmoid_lut_BasicBlock_0 set_sigmoid_lut_BasicBlock_0Impl (	// vector_unit.k:178:9
    .clk                        (clk),	// vector_unit.k:178:9
    .rst                        (reg_rst_delayed[31]),	// vector_unit.k:178:9
    .done_out                   (/* unused */),
    .memory_write_data_out_38_0
      (_set_sigmoid_lut_BasicBlock_0Impl_memory_write_data_out_38_0),
    .memory_write_addr_out_38_0
      (_set_sigmoid_lut_BasicBlock_0Impl_memory_write_addr_out_38_0),
    .memory_wren_38_0           (_set_sigmoid_lut_BasicBlock_0Impl_memory_wren_38_0),
    .fifo_wren_0                (_set_sigmoid_lut_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0  (fifo_data_13.almost_full),	// vector_unit.k:178:9
    .fifo_overflow_in_0         (fifo_data_13.overflow),	// vector_unit.k:178:9
    .data_in_30                 (passthrough_data_30.data),	// vector_unit.k:178:9
    .input_fifo_underflow_0     (passthrough_data_30.underflow),	// vector_unit.k:178:9
    .input_rdy_0                (_set_sigmoid_lut_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0              (passthrough_data_30.valid),	// vector_unit.k:178:9
    .control_state_out          (/* unused */)
  );	// vector_unit.k:178:9
  vector_unit_swiglu_compute_BasicBlock_0 swiglu_compute_BasicBlock_0Impl (	// vector_unit.k:186:9
    .clk                       (clk),	// vector_unit.k:186:9
    .rst                       (reg_rst_delayed[32]),	// vector_unit.k:186:9
    .done_out                  (/* unused */),
    .memory_read_data_in_38_0  (__sigmoid_lut_read_data_out_0),	// vector_unit.k:20:5
    .memory_read_addr_out_38_0
      (_swiglu_compute_BasicBlock_0Impl_memory_read_addr_out_38_0),
    .memory_rden_out_38_0      (_swiglu_compute_BasicBlock_0Impl_memory_rden_out_38_0),
    .fifo_data_out_0           (_swiglu_compute_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0               (_swiglu_compute_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_14.almost_full),	// vector_unit.k:186:9
    .fifo_overflow_in_0        (fifo_data_14.overflow),	// vector_unit.k:186:9
    .data_in_31                (passthrough_data_31.data),	// vector_unit.k:186:9
    .input_fifo_underflow_0    (passthrough_data_31.underflow),	// vector_unit.k:186:9
    .input_rdy_0               (_swiglu_compute_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_31.valid),	// vector_unit.k:186:9
    .control_state_out         (/* unused */)
  );	// vector_unit.k:186:9
  vector_unit_dequantize_BasicBlock_0 dequantize_BasicBlock_0Impl (	// vector_unit.k:279:9
    .clk                       (clk),	// vector_unit.k:279:9
    .rst                       (reg_rst_delayed[33]),	// vector_unit.k:279:9
    .done_out                  (/* unused */),
    .fifo_data_out_0           (_dequantize_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0               (_dequantize_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_15.almost_full),	// vector_unit.k:279:9
    .fifo_overflow_in_0        (fifo_data_15.overflow),	// vector_unit.k:279:9
    .data_in_32                (passthrough_data_32.data),	// vector_unit.k:279:9
    .input_fifo_underflow_0    (passthrough_data_32.underflow),	// vector_unit.k:279:9
    .input_rdy_0               (_dequantize_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_32.valid),	// vector_unit.k:279:9
    .control_state_out         (/* unused */)
  );	// vector_unit.k:279:9
  vector_unit_residual_add_BasicBlock_0 residual_add_BasicBlock_0Impl (	// vector_unit.k:396:9
    .clk                       (clk),	// vector_unit.k:396:9
    .rst                       (reg_rst_delayed[34]),	// vector_unit.k:396:9
    .done_out                  (/* unused */),
    .fifo_data_out_0           (_residual_add_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0               (_residual_add_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_16.almost_full),	// vector_unit.k:396:9
    .fifo_overflow_in_0        (fifo_data_16.overflow),	// vector_unit.k:396:9
    .data_in_33                (passthrough_data_33.data),	// vector_unit.k:396:9
    .input_fifo_underflow_0    (passthrough_data_33.underflow),	// vector_unit.k:396:9
    .input_rdy_0               (_residual_add_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_33.valid),	// vector_unit.k:396:9
    .control_state_out         (/* unused */)
  );	// vector_unit.k:396:9
  assign rst_and_startup_done_out = rst_and_startup_done_out_net;
  assign rmsnorm_accumulate_rdy_out = rmsnorm_accumulate_rdy_out_net;
  assign rmsnorm_accumulate_empty_out = rmsnorm_accumulate_empty_out_net;
  assign rmsnorm_get_sum_rdy_out = rmsnorm_get_sum_rdy_out_net;
  assign rmsnorm_get_sum_empty_out = rmsnorm_get_sum_empty_out_net;
  assign rmsnorm_get_sum_result_out = rmsnorm_get_sum_result_out_net;
  assign rmsnorm_reset_rdy_out = rmsnorm_reset_rdy_out_net;
  assign rmsnorm_reset_empty_out = rmsnorm_reset_empty_out_net;
  assign set_gamma_pre_attn_rdy_out = set_gamma_pre_attn_rdy_out_net;
  assign set_gamma_pre_attn_empty_out = set_gamma_pre_attn_empty_out_net;
  assign get_gamma_pre_attn_rdy_out = get_gamma_pre_attn_rdy_out_net;
  assign get_gamma_pre_attn_empty_out = get_gamma_pre_attn_empty_out_net;
  assign get_gamma_pre_attn_result_out = get_gamma_pre_attn_result_out_net;
  assign set_gamma_pre_mlp_rdy_out = set_gamma_pre_mlp_rdy_out_net;
  assign set_gamma_pre_mlp_empty_out = set_gamma_pre_mlp_empty_out_net;
  assign get_gamma_pre_mlp_rdy_out = get_gamma_pre_mlp_rdy_out_net;
  assign get_gamma_pre_mlp_empty_out = get_gamma_pre_mlp_empty_out_net;
  assign get_gamma_pre_mlp_result_out = get_gamma_pre_mlp_result_out_net;
  assign set_rsqrt_lut_rdy_out = set_rsqrt_lut_rdy_out_net;
  assign set_rsqrt_lut_empty_out = set_rsqrt_lut_empty_out_net;
  assign lookup_rsqrt_rdy_out = lookup_rsqrt_rdy_out_net;
  assign lookup_rsqrt_empty_out = lookup_rsqrt_empty_out_net;
  assign lookup_rsqrt_result_out = lookup_rsqrt_result_out_net;
  assign rope_read_cos_row_rdy_out = rope_read_cos_row_rdy_out_net;
  assign rope_read_cos_row_empty_out = rope_read_cos_row_empty_out_net;
  assign rope_read_cos_row_result_out = rope_read_cos_row_result_out_net;
  assign rope_read_sin_row_rdy_out = rope_read_sin_row_rdy_out_net;
  assign rope_read_sin_row_empty_out = rope_read_sin_row_empty_out_net;
  assign rope_read_sin_row_result_out = rope_read_sin_row_result_out_net;
  assign rope_write_cos_row_rdy_out = rope_write_cos_row_rdy_out_net;
  assign rope_write_cos_row_empty_out = rope_write_cos_row_empty_out_net;
  assign rope_write_sin_row_rdy_out = rope_write_sin_row_rdy_out_net;
  assign rope_write_sin_row_empty_out = rope_write_sin_row_empty_out_net;
  assign set_sigmoid_lut_rdy_out = set_sigmoid_lut_rdy_out_net;
  assign set_sigmoid_lut_empty_out = set_sigmoid_lut_empty_out_net;
  assign swiglu_compute_rdy_out = swiglu_compute_rdy_out_net;
  assign swiglu_compute_empty_out = swiglu_compute_empty_out_net;
  assign swiglu_compute_result_out = swiglu_compute_result_out_net;
  assign dequantize_rdy_out = dequantize_rdy_out_net;
  assign dequantize_empty_out = dequantize_empty_out_net;
  assign dequantize_result_out = dequantize_result_out_net;
  assign residual_add_rdy_out = residual_add_rdy_out_net;
  assign residual_add_empty_out = residual_add_empty_out_net;
  assign residual_add_result_out = residual_add_result_out_net;
  assign stall_rate_supported_out = stall_rate_supported_out_net;
endmodule

module vector_unit_EsiWrapper(
     input  wire                                                                                            clk,
     input  wire                                                                                            rst,
     input  wire [2:0]                                                                                      stall_rate_in,
     input  wire                                                                                            stall_rate_valid_in,
     input  wire struct packed {logic [23:0] accum; logic [15:0] super_scale_bf16; logic [3:0] sub_scale; } dequantize_arg,
     input  wire                                                                                            dequantize_arg_valid,
     input  wire struct packed {logic [15:0] index; }                                                       get_gamma_pre_attn_arg,
     input  wire                                                                                            get_gamma_pre_attn_arg_valid,
     input  wire struct packed {logic [15:0] index; }                                                       get_gamma_pre_mlp_arg,
     input  wire                                                                                            get_gamma_pre_mlp_arg_valid,
     input  wire struct packed {logic [7:0] index; }                                                        lookup_rsqrt_arg,
     input  wire                                                                                            lookup_rsqrt_arg_valid,
     input  wire struct packed {logic [15:0] a_bf16; logic [15:0] b_bf16; }                                 residual_add_arg,
     input  wire                                                                                            residual_add_arg_valid,
     input  wire struct packed {logic [15:0] x_bf16; }                                                      rmsnorm_accumulate_arg,
     input  wire                                                                                            rmsnorm_accumulate_arg_valid,
  // input  wire /*Zero Width*/                                                                             rmsnorm_get_sum_arg,
     input  wire                                                                                            rmsnorm_get_sum_arg_valid,
  // input  wire /*Zero Width*/                                                                             rmsnorm_reset_arg,
     input  wire                                                                                            rmsnorm_reset_arg_valid,
     input  wire struct packed {logic [11:0] position; }                                                    rope_read_cos_row_arg,
     input  wire                                                                                            rope_read_cos_row_arg_valid,
     input  wire struct packed {logic [11:0] position; }                                                    rope_read_sin_row_arg,
     input  wire                                                                                            rope_read_sin_row_arg_valid,
     input  wire struct packed {logic [11:0] position; logic [1023:0] value; }                              rope_write_cos_row_arg,
     input  wire                                                                                            rope_write_cos_row_arg_valid,
     input  wire struct packed {logic [11:0] position; logic [1023:0] value; }                              rope_write_sin_row_arg,
     input  wire                                                                                            rope_write_sin_row_arg_valid,
     input  wire struct packed {logic [15:0] index; logic [15:0] value; }                                   set_gamma_pre_attn_arg,
     input  wire                                                                                            set_gamma_pre_attn_arg_valid,
     input  wire struct packed {logic [15:0] index; logic [15:0] value; }                                   set_gamma_pre_mlp_arg,
     input  wire                                                                                            set_gamma_pre_mlp_arg_valid,
     input  wire struct packed {logic [7:0] index; logic [15:0] value; }                                    set_rsqrt_lut_arg,
     input  wire                                                                                            set_rsqrt_lut_arg_valid,
     input  wire struct packed {logic [7:0] index; logic [15:0] value; }                                    set_sigmoid_lut_arg,
     input  wire                                                                                            set_sigmoid_lut_arg_valid,
     input  wire struct packed {logic [15:0] gate_bf16; logic [15:0] up_bf16; }                             swiglu_compute_arg,
     input  wire                                                                                            swiglu_compute_arg_valid,
     input  wire                                                                                            dequantize_result_rden,
     input  wire                                                                                            get_gamma_pre_attn_result_rden,
     input  wire                                                                                            get_gamma_pre_mlp_result_rden,
     input  wire                                                                                            lookup_rsqrt_result_rden,
     input  wire                                                                                            residual_add_result_rden,
     input  wire                                                                                            rmsnorm_accumulate_result_rden,
     input  wire                                                                                            rmsnorm_get_sum_result_rden,
     input  wire                                                                                            rmsnorm_reset_result_rden,
     input  wire                                                                                            rope_read_cos_row_result_rden,
     input  wire                                                                                            rope_read_sin_row_result_rden,
     input  wire                                                                                            rope_write_cos_row_result_rden,
     input  wire                                                                                            rope_write_sin_row_result_rden,
     input  wire                                                                                            set_gamma_pre_attn_result_rden,
     input  wire                                                                                            set_gamma_pre_mlp_result_rden,
     input  wire                                                                                            set_rsqrt_lut_result_rden,
     input  wire                                                                                            set_sigmoid_lut_result_rden,
     input  wire                                                                                            swiglu_compute_result_rden,
     output wire                                                                                            dequantize_arg_ready,
     output wire                                                                                            get_gamma_pre_attn_arg_ready,
     output wire                                                                                            get_gamma_pre_mlp_arg_ready,
     output wire                                                                                            lookup_rsqrt_arg_ready,
     output wire                                                                                            residual_add_arg_ready,
     output wire                                                                                            rmsnorm_accumulate_arg_ready,
     output wire                                                                                            rmsnorm_get_sum_arg_ready,
     output wire                                                                                            rmsnorm_reset_arg_ready,
     output wire                                                                                            rope_read_cos_row_arg_ready,
     output wire                                                                                            rope_read_sin_row_arg_ready,
     output wire                                                                                            rope_write_cos_row_arg_ready,
     output wire                                                                                            rope_write_sin_row_arg_ready,
     output wire                                                                                            set_gamma_pre_attn_arg_ready,
     output wire                                                                                            set_gamma_pre_mlp_arg_ready,
     output wire                                                                                            set_rsqrt_lut_arg_ready,
     output wire                                                                                            set_sigmoid_lut_arg_ready,
     output wire                                                                                            swiglu_compute_arg_ready,
     output wire [15:0]                                                                                     dequantize_result,
     output wire                                                                                            dequantize_result_empty,
     output wire [15:0]                                                                                     get_gamma_pre_attn_result,
     output wire                                                                                            get_gamma_pre_attn_result_empty,
     output wire [15:0]                                                                                     get_gamma_pre_mlp_result,
     output wire                                                                                            get_gamma_pre_mlp_result_empty,
     output wire [15:0]                                                                                     lookup_rsqrt_result,
     output wire                                                                                            lookup_rsqrt_result_empty,
     output wire [15:0]                                                                                     residual_add_result,
     output wire                                                                                            residual_add_result_empty,
  // output wire /*Zero Width*/                                                                             rmsnorm_accumulate_result,
     output wire                                                                                            rmsnorm_accumulate_result_empty,
     output wire [31:0]                                                                                     rmsnorm_get_sum_result,
     output wire                                                                                            rmsnorm_get_sum_result_empty,
  // output wire /*Zero Width*/                                                                             rmsnorm_reset_result,
     output wire                                                                                            rmsnorm_reset_result_empty,
     output wire [1023:0]                                                                                   rope_read_cos_row_result,
     output wire                                                                                            rope_read_cos_row_result_empty,
     output wire [1023:0]                                                                                   rope_read_sin_row_result,
     output wire                                                                                            rope_read_sin_row_result_empty,
  // output wire /*Zero Width*/                                                                             rope_write_cos_row_result,
     output wire                                                                                            rope_write_cos_row_result_empty,
  // output wire /*Zero Width*/                                                                             rope_write_sin_row_result,
     output wire                                                                                            rope_write_sin_row_result_empty,
  // output wire /*Zero Width*/                                                                             set_gamma_pre_attn_result,
     output wire                                                                                            set_gamma_pre_attn_result_empty,
  // output wire /*Zero Width*/                                                                             set_gamma_pre_mlp_result,
     output wire                                                                                            set_gamma_pre_mlp_result_empty,
  // output wire /*Zero Width*/                                                                             set_rsqrt_lut_result,
     output wire                                                                                            set_rsqrt_lut_result_empty,
  // output wire /*Zero Width*/                                                                             set_sigmoid_lut_result,
     output wire                                                                                            set_sigmoid_lut_result_empty,
     output wire [15:0]                                                                                     swiglu_compute_result,
     output wire                                                                                            swiglu_compute_result_empty,
     output wire                                                                                            rst_and_startup_done_out,
     output wire                                                                                            stall_rate_supported_out
);

  wire [31:0]   _EsiWrapped_rmsnorm_get_sum_result_out;
  wire [15:0]   _EsiWrapped_get_gamma_pre_attn_result_out;
  wire [15:0]   _EsiWrapped_get_gamma_pre_mlp_result_out;
  wire [15:0]   _EsiWrapped_lookup_rsqrt_result_out;
  wire [1023:0] _EsiWrapped_rope_read_cos_row_result_out;
  wire [1023:0] _EsiWrapped_rope_read_sin_row_result_out;
  wire [15:0]   _EsiWrapped_swiglu_compute_result_out;
  wire [15:0]   _EsiWrapped_dequantize_result_out;
  wire [15:0]   _EsiWrapped_residual_add_result_out;
  vector_unit EsiWrapped (
    .clk                            (clk),
    .rst                            (rst),
    .rmsnorm_accumulate_valid_in    (rmsnorm_accumulate_arg_valid),
    .rmsnorm_accumulate_x_bf16_in   (rmsnorm_accumulate_arg.x_bf16),
    .rmsnorm_accumulate_rden_in     (rmsnorm_accumulate_result_rden),
    .rmsnorm_get_sum_valid_in       (rmsnorm_get_sum_arg_valid),
    .rmsnorm_get_sum_rden_in        (rmsnorm_get_sum_result_rden),
    .rmsnorm_reset_valid_in         (rmsnorm_reset_arg_valid),
    .rmsnorm_reset_rden_in          (rmsnorm_reset_result_rden),
    .set_gamma_pre_attn_valid_in    (set_gamma_pre_attn_arg_valid),
    .set_gamma_pre_attn_index_in    (set_gamma_pre_attn_arg.index),
    .set_gamma_pre_attn_value_in    (set_gamma_pre_attn_arg.value),
    .set_gamma_pre_attn_rden_in     (set_gamma_pre_attn_result_rden),
    .get_gamma_pre_attn_valid_in    (get_gamma_pre_attn_arg_valid),
    .get_gamma_pre_attn_index_in    (get_gamma_pre_attn_arg.index),
    .get_gamma_pre_attn_rden_in     (get_gamma_pre_attn_result_rden),
    .set_gamma_pre_mlp_valid_in     (set_gamma_pre_mlp_arg_valid),
    .set_gamma_pre_mlp_index_in     (set_gamma_pre_mlp_arg.index),
    .set_gamma_pre_mlp_value_in     (set_gamma_pre_mlp_arg.value),
    .set_gamma_pre_mlp_rden_in      (set_gamma_pre_mlp_result_rden),
    .get_gamma_pre_mlp_valid_in     (get_gamma_pre_mlp_arg_valid),
    .get_gamma_pre_mlp_index_in     (get_gamma_pre_mlp_arg.index),
    .get_gamma_pre_mlp_rden_in      (get_gamma_pre_mlp_result_rden),
    .set_rsqrt_lut_valid_in         (set_rsqrt_lut_arg_valid),
    .set_rsqrt_lut_index_in         (set_rsqrt_lut_arg.index),
    .set_rsqrt_lut_value_in         (set_rsqrt_lut_arg.value),
    .set_rsqrt_lut_rden_in          (set_rsqrt_lut_result_rden),
    .lookup_rsqrt_valid_in          (lookup_rsqrt_arg_valid),
    .lookup_rsqrt_index_in          (lookup_rsqrt_arg.index),
    .lookup_rsqrt_rden_in           (lookup_rsqrt_result_rden),
    .rope_read_cos_row_valid_in     (rope_read_cos_row_arg_valid),
    .rope_read_cos_row_position_in  (rope_read_cos_row_arg.position),
    .rope_read_cos_row_rden_in      (rope_read_cos_row_result_rden),
    .rope_read_sin_row_valid_in     (rope_read_sin_row_arg_valid),
    .rope_read_sin_row_position_in  (rope_read_sin_row_arg.position),
    .rope_read_sin_row_rden_in      (rope_read_sin_row_result_rden),
    .rope_write_cos_row_valid_in    (rope_write_cos_row_arg_valid),
    .rope_write_cos_row_position_in (rope_write_cos_row_arg.position),
    .rope_write_cos_row_value_in    (rope_write_cos_row_arg.value),
    .rope_write_cos_row_rden_in     (rope_write_cos_row_result_rden),
    .rope_write_sin_row_valid_in    (rope_write_sin_row_arg_valid),
    .rope_write_sin_row_position_in (rope_write_sin_row_arg.position),
    .rope_write_sin_row_value_in    (rope_write_sin_row_arg.value),
    .rope_write_sin_row_rden_in     (rope_write_sin_row_result_rden),
    .set_sigmoid_lut_valid_in       (set_sigmoid_lut_arg_valid),
    .set_sigmoid_lut_index_in       (set_sigmoid_lut_arg.index),
    .set_sigmoid_lut_value_in       (set_sigmoid_lut_arg.value),
    .set_sigmoid_lut_rden_in        (set_sigmoid_lut_result_rden),
    .swiglu_compute_valid_in        (swiglu_compute_arg_valid),
    .swiglu_compute_gate_bf16_in    (swiglu_compute_arg.gate_bf16),
    .swiglu_compute_up_bf16_in      (swiglu_compute_arg.up_bf16),
    .swiglu_compute_rden_in         (swiglu_compute_result_rden),
    .dequantize_valid_in            (dequantize_arg_valid),
    .dequantize_accum_in            (dequantize_arg.accum),
    .dequantize_super_scale_bf16_in (dequantize_arg.super_scale_bf16),
    .dequantize_sub_scale_in        (dequantize_arg.sub_scale),
    .dequantize_rden_in             (dequantize_result_rden),
    .residual_add_valid_in          (residual_add_arg_valid),
    .residual_add_a_bf16_in         (residual_add_arg.a_bf16),
    .residual_add_b_bf16_in         (residual_add_arg.b_bf16),
    .residual_add_rden_in           (residual_add_result_rden),
    .stall_rate_in                  (stall_rate_in),
    .stall_rate_valid_in            (stall_rate_valid_in),
    .rst_and_startup_done_out       (rst_and_startup_done_out),
    .rmsnorm_accumulate_rdy_out     (rmsnorm_accumulate_arg_ready),
    .rmsnorm_accumulate_empty_out   (rmsnorm_accumulate_result_empty),
    .rmsnorm_get_sum_rdy_out        (rmsnorm_get_sum_arg_ready),
    .rmsnorm_get_sum_empty_out      (rmsnorm_get_sum_result_empty),
    .rmsnorm_get_sum_result_out     (_EsiWrapped_rmsnorm_get_sum_result_out),
    .rmsnorm_reset_rdy_out          (rmsnorm_reset_arg_ready),
    .rmsnorm_reset_empty_out        (rmsnorm_reset_result_empty),
    .set_gamma_pre_attn_rdy_out     (set_gamma_pre_attn_arg_ready),
    .set_gamma_pre_attn_empty_out   (set_gamma_pre_attn_result_empty),
    .get_gamma_pre_attn_rdy_out     (get_gamma_pre_attn_arg_ready),
    .get_gamma_pre_attn_empty_out   (get_gamma_pre_attn_result_empty),
    .get_gamma_pre_attn_result_out  (_EsiWrapped_get_gamma_pre_attn_result_out),
    .set_gamma_pre_mlp_rdy_out      (set_gamma_pre_mlp_arg_ready),
    .set_gamma_pre_mlp_empty_out    (set_gamma_pre_mlp_result_empty),
    .get_gamma_pre_mlp_rdy_out      (get_gamma_pre_mlp_arg_ready),
    .get_gamma_pre_mlp_empty_out    (get_gamma_pre_mlp_result_empty),
    .get_gamma_pre_mlp_result_out   (_EsiWrapped_get_gamma_pre_mlp_result_out),
    .set_rsqrt_lut_rdy_out          (set_rsqrt_lut_arg_ready),
    .set_rsqrt_lut_empty_out        (set_rsqrt_lut_result_empty),
    .lookup_rsqrt_rdy_out           (lookup_rsqrt_arg_ready),
    .lookup_rsqrt_empty_out         (lookup_rsqrt_result_empty),
    .lookup_rsqrt_result_out        (_EsiWrapped_lookup_rsqrt_result_out),
    .rope_read_cos_row_rdy_out      (rope_read_cos_row_arg_ready),
    .rope_read_cos_row_empty_out    (rope_read_cos_row_result_empty),
    .rope_read_cos_row_result_out   (_EsiWrapped_rope_read_cos_row_result_out),
    .rope_read_sin_row_rdy_out      (rope_read_sin_row_arg_ready),
    .rope_read_sin_row_empty_out    (rope_read_sin_row_result_empty),
    .rope_read_sin_row_result_out   (_EsiWrapped_rope_read_sin_row_result_out),
    .rope_write_cos_row_rdy_out     (rope_write_cos_row_arg_ready),
    .rope_write_cos_row_empty_out   (rope_write_cos_row_result_empty),
    .rope_write_sin_row_rdy_out     (rope_write_sin_row_arg_ready),
    .rope_write_sin_row_empty_out   (rope_write_sin_row_result_empty),
    .set_sigmoid_lut_rdy_out        (set_sigmoid_lut_arg_ready),
    .set_sigmoid_lut_empty_out      (set_sigmoid_lut_result_empty),
    .swiglu_compute_rdy_out         (swiglu_compute_arg_ready),
    .swiglu_compute_empty_out       (swiglu_compute_result_empty),
    .swiglu_compute_result_out      (_EsiWrapped_swiglu_compute_result_out),
    .dequantize_rdy_out             (dequantize_arg_ready),
    .dequantize_empty_out           (dequantize_result_empty),
    .dequantize_result_out          (_EsiWrapped_dequantize_result_out),
    .residual_add_rdy_out           (residual_add_arg_ready),
    .residual_add_empty_out         (residual_add_result_empty),
    .residual_add_result_out        (_EsiWrapped_residual_add_result_out),
    .stall_rate_supported_out       (stall_rate_supported_out)
  );
  assign dequantize_result = _EsiWrapped_dequantize_result_out;
  assign get_gamma_pre_attn_result = _EsiWrapped_get_gamma_pre_attn_result_out;
  assign get_gamma_pre_mlp_result = _EsiWrapped_get_gamma_pre_mlp_result_out;
  assign lookup_rsqrt_result = _EsiWrapped_lookup_rsqrt_result_out;
  assign residual_add_result = _EsiWrapped_residual_add_result_out;
  // Zero width: assign rmsnorm_accumulate_result = /*Zero width*/;
  assign rmsnorm_get_sum_result = _EsiWrapped_rmsnorm_get_sum_result_out;
  // Zero width: assign rmsnorm_reset_result = /*Zero width*/;
  assign rope_read_cos_row_result = _EsiWrapped_rope_read_cos_row_result_out;
  assign rope_read_sin_row_result = _EsiWrapped_rope_read_sin_row_result_out;
  // Zero width: assign rope_write_cos_row_result = /*Zero width*/;
  // Zero width: assign rope_write_sin_row_result = /*Zero width*/;
  // Zero width: assign set_gamma_pre_attn_result = /*Zero width*/;
  // Zero width: assign set_gamma_pre_mlp_result = /*Zero width*/;
  // Zero width: assign set_rsqrt_lut_result = /*Zero width*/;
  // Zero width: assign set_sigmoid_lut_result = /*Zero width*/;
  assign swiglu_compute_result = _EsiWrapped_swiglu_compute_result_out;
endmodule

