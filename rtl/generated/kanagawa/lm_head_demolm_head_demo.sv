
// This file was generated. Do not modify.
// kanagawa --backend=sv --import-dir=third-party/kanagawa/library --base-library=third-party/kanagawa/library/mini-base.k --output=rtl/generated/kanagawa/lm_head_demo rtl/kanagawa/lm_head_demo.k

`default_nettype wire
module lm_head_demoDebugView_read_weight_chunkEntry
(
    input wire clk,
    input wire[15:0]  _addr,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("read_weight_chunkEntry time: %0t addr: %p", $time, _addr);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module lm_head_demoDebugView_read_weight_chunkExit
(
    input wire clk,
    input wire[191:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("read_weight_chunkExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module lm_head_demoDebugView_write_weight_chunkEntry
(
    input wire clk,
    input wire[15:0]  _addr,
    input wire[191:0]  _value,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("write_weight_chunkEntry time: %0t addr: %p value: %p", $time, _addr, _value);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module lm_head_demoDebugView_set_bank_scaleEntry
(
    input wire clk,
    input wire[7:0]  _value,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("set_bank_scaleEntry time: %0t value: %p", $time, _value);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module lm_head_demoDebugView_set_tensor_scaleEntry
(
    input wire clk,
    input wire[31:0]  _value,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("set_tensor_scaleEntry time: %0t value: %p", $time, _value);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module lm_head_demoDebugView_update_argmaxEntry
(
    input wire clk,
    input wire[9:0]  _token_idx,
    input wire[31:0]  _score,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("update_argmaxEntry time: %0t token_idx: %p score: %p", $time, _token_idx, _score);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module lm_head_demoDebugView_get_best_tokenExit
(
    input wire clk,
    input wire[9:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("get_best_tokenExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
`ifndef _TYPESCOPE_CoreModuleTypeScope
`define _TYPESCOPE_CoreModuleTypeScope
`endif // _TYPESCOPE_CoreModuleTypeScope
module lm_head_demo_reset_argmax_BasicBlock_0(	// lm_head_demo.k:78:9
  input  wire       clk,
  input  wire       rst,
  output wire       done_out,
  output wire       global_out__best_score_10_1_valid,
  output wire       global_out__best_token_11_1_valid,
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
  logic       done_out_0;	// lm_head_demo.k:78:9
  logic       global_out__best_score_10_1_valid_0;	// lm_head_demo.k:78:9
  logic       global_out__best_token_11_1_valid_0;	// lm_head_demo.k:78:9
  logic       fifo_wren_0_0;	// lm_head_demo.k:78:9
  logic       input_rdy_0_0;	// lm_head_demo.k:78:9
  logic [7:0] control_state_out_0;	// lm_head_demo.k:78:9
  wire        _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// lm_head_demo.k:78:9
  always_comb begin	// lm_head_demo.k:78:9
    input_rdy_0_0 = _GEN;	// lm_head_demo.k:78:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// lm_head_demo.k:78:9
  end // always_comb
  reg         p0_stage1_enable = 1'h0;	// lm_head_demo.k:78:9
  always_comb begin	// lm_head_demo.k:78:9
    global_out__best_score_10_1_valid_0 = p0_stage1_enable;	// lm_head_demo.k:78:9
    global_out__best_token_11_1_valid_0 = p0_stage1_enable;	// lm_head_demo.k:78:9
  end // always_comb
  reg         p0_stage2_enable = 1'h0;	// lm_head_demo.k:78:9
  always @(posedge clk) begin	// lm_head_demo.k:78:9
    if (rst) begin	// lm_head_demo.k:78:9
      p0_stage1_enable <= 1'h0;	// lm_head_demo.k:78:9
      p0_stage2_enable <= 1'h0;	// lm_head_demo.k:78:9
    end
    else begin	// lm_head_demo.k:78:9
      p0_stage1_enable <= _GEN & input_valid_0;	// lm_head_demo.k:78:9
      p0_stage2_enable <= p0_stage1_enable;	// lm_head_demo.k:78:9
    end
  end // always @(posedge)
  always_comb	// lm_head_demo.k:78:9
    fifo_wren_0_0 = p0_stage2_enable;	// lm_head_demo.k:78:9, :83:9
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// lm_head_demo.k:78:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// lm_head_demo.k:78:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  assign done_out = p0_stage2_enable;	// lm_head_demo.k:78:9
  assign global_out__best_score_10_1_valid = global_out__best_score_10_1_valid_0;	// lm_head_demo.k:78:9
  assign global_out__best_token_11_1_valid = global_out__best_token_11_1_valid_0;	// lm_head_demo.k:78:9
  assign fifo_wren_0 = fifo_wren_0_0;	// lm_head_demo.k:78:9
  assign input_rdy_0 = input_rdy_0_0;	// lm_head_demo.k:78:9
  assign control_state_out = control_state_out_0;	// lm_head_demo.k:78:9
endmodule

module lm_head_demo_get_best_token_BasicBlock_0(	// lm_head_demo.k:70:9
  input  wire       clk,
  input  wire       rst,
  output wire       done_out,
  input  wire [9:0] global_in__best_token_11,
  output wire [9:0] fifo_data_out_0,
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
  wire  [9:0] global_in__best_token_11_0 = global_in__best_token_11;	// lm_head_demo.k:70:9
  logic       done_out_0;	// lm_head_demo.k:70:9
  logic [9:0] fifo_data_out_0_0;	// lm_head_demo.k:70:9
  logic       fifo_wren_0_0;	// lm_head_demo.k:70:9
  logic       input_rdy_0_0;	// lm_head_demo.k:70:9
  logic [7:0] control_state_out_0;	// lm_head_demo.k:70:9
  wire        _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// lm_head_demo.k:70:9
  always_comb begin	// lm_head_demo.k:70:9
    input_rdy_0_0 = _GEN;	// lm_head_demo.k:70:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// lm_head_demo.k:70:9
  end // always_comb
  reg         p0_stage1_enable = 1'h0;	// lm_head_demo.k:70:9
  reg   [9:0] p0_global_in__best_token_11;	// lm_head_demo.k:70:9
  reg         p0_stage2_enable = 1'h0;	// lm_head_demo.k:70:9
  always @(posedge clk) begin	// lm_head_demo.k:70:9
    if (rst)	// lm_head_demo.k:70:9
      p0_stage1_enable <= 1'h0;	// lm_head_demo.k:70:9
    else	// lm_head_demo.k:70:9
      p0_stage1_enable <= _GEN & input_valid_0;	// lm_head_demo.k:70:9
    p0_global_in__best_token_11 <= global_in__best_token_11_0;	// lm_head_demo.k:70:9
    if (rst)	// lm_head_demo.k:70:9
      p0_stage2_enable <= 1'h0;	// lm_head_demo.k:70:9
    else	// lm_head_demo.k:70:9
      p0_stage2_enable <= p0_stage1_enable;	// lm_head_demo.k:70:9
  end // always @(posedge)
  always_comb begin	// lm_head_demo.k:70:9
    fifo_wren_0_0 = p0_stage2_enable;	// lm_head_demo.k:68:5, :70:9
    fifo_data_out_0_0 = p0_global_in__best_token_11;	// lm_head_demo.k:68:5, :70:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// lm_head_demo.k:70:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// lm_head_demo.k:70:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  lm_head_demoDebugView_get_best_tokenExit lm_head_demoDebugView_get_best_tokenExit_instance (	// lm_head_demo.k:68:5
    .clk          (clk),	// lm_head_demo.k:68:5
    ._ReturnValue (p0_stage1_enable ? global_in__best_token_11_0 : 'x),	// lm_head_demo.k:68:5, :70:9
    .valid        (p0_stage1_enable),	// lm_head_demo.k:70:9
    .valid_out    (/* unused */)
  );	// lm_head_demo.k:68:5
  assign done_out = p0_stage2_enable;	// lm_head_demo.k:70:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// lm_head_demo.k:70:9
  assign fifo_wren_0 = fifo_wren_0_0;	// lm_head_demo.k:70:9
  assign input_rdy_0 = input_rdy_0_0;	// lm_head_demo.k:70:9
  assign control_state_out = control_state_out_0;	// lm_head_demo.k:70:9
endmodule

module lm_head_demo_update_argmax_BasicBlock_0(	// lm_head_demo.k:57:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  input  wire [31:0] global_in__best_score_10,
  output wire        global_out__best_score_10_0_valid,
  output wire [31:0] global_out__best_score_10_0,
  output wire        global_out__best_token_11_0_valid,
  output wire [9:0]  global_out__best_token_11_0,
  output wire        fifo_wren_0,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [41:0] data_in_11,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  wire  [31:0] global_in__best_score_10_0 = global_in__best_score_10;	// lm_head_demo.k:57:9
  logic        done_out_0;	// lm_head_demo.k:57:9
  logic        global_out__best_score_10_0_valid_0;	// lm_head_demo.k:57:9
  logic [31:0] global_out__best_score_10_0_0;	// lm_head_demo.k:57:9
  logic        global_out__best_token_11_0_valid_0;	// lm_head_demo.k:57:9
  logic [9:0]  global_out__best_token_11_0_0;	// lm_head_demo.k:57:9
  logic        fifo_wren_0_0;	// lm_head_demo.k:57:9
  logic        input_rdy_0_0;	// lm_head_demo.k:57:9
  logic [7:0]  control_state_out_0;	// lm_head_demo.k:57:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// lm_head_demo.k:57:9
  always_comb begin	// lm_head_demo.k:57:9
    input_rdy_0_0 = _GEN;	// lm_head_demo.k:57:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// lm_head_demo.k:57:9
  end // always_comb
  reg   [9:0]  p0_token_idx;	// lm_head_demo.k:57:9
  reg   [31:0] p0_score;	// lm_head_demo.k:57:9
  reg          p0_stage1_enable = 1'h0;	// lm_head_demo.k:57:9
  wire         _GEN_0 =
    p0_stage1_enable & $signed(p0_score) > $signed(global_in__best_score_10_0);	// lm_head_demo.k:57:9, :59:17
  always_comb begin	// lm_head_demo.k:57:9
    global_out__best_score_10_0_0 = p0_score;	// lm_head_demo.k:57:9
    global_out__best_score_10_0_valid_0 = _GEN_0;	// lm_head_demo.k:57:9
    global_out__best_token_11_0_0 = p0_token_idx;	// lm_head_demo.k:57:9
    global_out__best_token_11_0_valid_0 = _GEN_0;	// lm_head_demo.k:57:9
  end // always_comb
  reg          p0_stage2_enable = 1'h0;	// lm_head_demo.k:57:9
  always @(posedge clk) begin	// lm_head_demo.k:57:9
    p0_token_idx <= data_in_11[9:0];	// lm_head_demo.k:57:9
    p0_score <= data_in_11[41:10];	// lm_head_demo.k:57:9
    if (rst) begin	// lm_head_demo.k:57:9
      p0_stage1_enable <= 1'h0;	// lm_head_demo.k:57:9
      p0_stage2_enable <= 1'h0;	// lm_head_demo.k:57:9
    end
    else begin	// lm_head_demo.k:57:9
      p0_stage1_enable <= _GEN & input_valid_0;	// lm_head_demo.k:57:9
      p0_stage2_enable <= p0_stage1_enable;	// lm_head_demo.k:57:9
    end
  end // always @(posedge)
  always_comb	// lm_head_demo.k:57:9
    fifo_wren_0_0 = p0_stage2_enable;	// lm_head_demo.k:57:9, :65:9
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// lm_head_demo.k:57:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// lm_head_demo.k:57:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  lm_head_demoDebugView_update_argmaxEntry lm_head_demoDebugView_update_argmaxEntry_instance (	// lm_head_demo.k:65:9
    .clk        (clk),	// lm_head_demo.k:65:9
    ._token_idx (p0_stage1_enable ? p0_token_idx : 'x),	// lm_head_demo.k:57:9, :65:9
    ._score     (p0_stage1_enable ? p0_score : 'x),	// lm_head_demo.k:57:9, :65:9
    .valid      (p0_stage1_enable),	// lm_head_demo.k:57:9
    .valid_out  (/* unused */)
  );	// lm_head_demo.k:65:9
  assign done_out = p0_stage2_enable;	// lm_head_demo.k:57:9
  assign global_out__best_score_10_0_valid = global_out__best_score_10_0_valid_0;	// lm_head_demo.k:57:9
  assign global_out__best_score_10_0 = global_out__best_score_10_0_0;	// lm_head_demo.k:57:9
  assign global_out__best_token_11_0_valid = global_out__best_token_11_0_valid_0;	// lm_head_demo.k:57:9
  assign global_out__best_token_11_0 = global_out__best_token_11_0_0;	// lm_head_demo.k:57:9
  assign fifo_wren_0 = fifo_wren_0_0;	// lm_head_demo.k:57:9
  assign input_rdy_0 = input_rdy_0_0;	// lm_head_demo.k:57:9
  assign control_state_out = control_state_out_0;	// lm_head_demo.k:57:9
endmodule

module lm_head_demo_set_tensor_scale_BasicBlock_0(	// lm_head_demo.k:51:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  output wire        fifo_wren_0,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [31:0] data_in_10,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  logic        done_out_0;	// lm_head_demo.k:51:9
  logic        fifo_wren_0_0;	// lm_head_demo.k:51:9
  logic        input_rdy_0_0;	// lm_head_demo.k:51:9
  logic [7:0]  control_state_out_0;	// lm_head_demo.k:51:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// lm_head_demo.k:51:9
  always_comb begin	// lm_head_demo.k:51:9
    input_rdy_0_0 = _GEN;	// lm_head_demo.k:51:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// lm_head_demo.k:51:9
  end // always_comb
  reg   [31:0] p0_data_in_10;	// lm_head_demo.k:51:9
  reg          p0_stage1_enable = 1'h0;	// lm_head_demo.k:51:9
  reg          p0_stage2_enable = 1'h0;	// lm_head_demo.k:51:9
  always @(posedge clk) begin	// lm_head_demo.k:51:9
    p0_data_in_10 <= data_in_10;	// lm_head_demo.k:51:9
    if (rst) begin	// lm_head_demo.k:51:9
      p0_stage1_enable <= 1'h0;	// lm_head_demo.k:51:9
      p0_stage2_enable <= 1'h0;	// lm_head_demo.k:51:9
    end
    else begin	// lm_head_demo.k:51:9
      p0_stage1_enable <= _GEN & input_valid_0;	// lm_head_demo.k:51:9
      p0_stage2_enable <= p0_stage1_enable;	// lm_head_demo.k:51:9
    end
  end // always @(posedge)
  always_comb	// lm_head_demo.k:51:9
    fifo_wren_0_0 = p0_stage2_enable;	// lm_head_demo.k:51:9, :52:9
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// lm_head_demo.k:51:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// lm_head_demo.k:51:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  lm_head_demoDebugView_set_tensor_scaleEntry lm_head_demoDebugView_set_tensor_scaleEntry_instance (	// lm_head_demo.k:52:9
    .clk       (clk),	// lm_head_demo.k:52:9
    ._value    (p0_stage1_enable ? p0_data_in_10 : 'x),	// lm_head_demo.k:51:9, :52:9
    .valid     (p0_stage1_enable),	// lm_head_demo.k:51:9
    .valid_out (/* unused */)
  );	// lm_head_demo.k:52:9
  assign done_out = p0_stage2_enable;	// lm_head_demo.k:51:9
  assign fifo_wren_0 = fifo_wren_0_0;	// lm_head_demo.k:51:9
  assign input_rdy_0 = input_rdy_0_0;	// lm_head_demo.k:51:9
  assign control_state_out = control_state_out_0;	// lm_head_demo.k:51:9
endmodule

module lm_head_demo_set_bank_scale_BasicBlock_0(	// lm_head_demo.k:45:9
  input  wire       clk,
  input  wire       rst,
  output wire       done_out,
  output wire       fifo_wren_0,
  input  wire       fifo_almost_full_in_raw_0,
  input  wire       fifo_overflow_in_0,
  input  wire [7:0] data_in_9,
  input  wire       input_fifo_underflow_0,
  output wire       input_rdy_0,
  input  wire       input_valid_0,
  output wire [7:0] control_state_out
);

  wire        _fifo_overflow_ffc_0_data_out;
  wire        _fifo_almostfull_ffc_0_data_out;
  logic       done_out_0;	// lm_head_demo.k:45:9
  logic       fifo_wren_0_0;	// lm_head_demo.k:45:9
  logic       input_rdy_0_0;	// lm_head_demo.k:45:9
  logic [7:0] control_state_out_0;	// lm_head_demo.k:45:9
  wire        _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// lm_head_demo.k:45:9
  always_comb begin	// lm_head_demo.k:45:9
    input_rdy_0_0 = _GEN;	// lm_head_demo.k:45:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// lm_head_demo.k:45:9
  end // always_comb
  reg   [7:0] p0_data_in_9;	// lm_head_demo.k:45:9
  reg         p0_stage1_enable = 1'h0;	// lm_head_demo.k:45:9
  reg         p0_stage2_enable = 1'h0;	// lm_head_demo.k:45:9
  always @(posedge clk) begin	// lm_head_demo.k:45:9
    p0_data_in_9 <= data_in_9;	// lm_head_demo.k:45:9
    if (rst) begin	// lm_head_demo.k:45:9
      p0_stage1_enable <= 1'h0;	// lm_head_demo.k:45:9
      p0_stage2_enable <= 1'h0;	// lm_head_demo.k:45:9
    end
    else begin	// lm_head_demo.k:45:9
      p0_stage1_enable <= _GEN & input_valid_0;	// lm_head_demo.k:45:9
      p0_stage2_enable <= p0_stage1_enable;	// lm_head_demo.k:45:9
    end
  end // always @(posedge)
  always_comb	// lm_head_demo.k:45:9
    fifo_wren_0_0 = p0_stage2_enable;	// lm_head_demo.k:45:9, :46:9
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// lm_head_demo.k:45:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// lm_head_demo.k:45:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  lm_head_demoDebugView_set_bank_scaleEntry lm_head_demoDebugView_set_bank_scaleEntry_instance (	// lm_head_demo.k:46:9
    .clk       (clk),	// lm_head_demo.k:46:9
    ._value    (p0_stage1_enable ? p0_data_in_9 : 'x),	// lm_head_demo.k:45:9, :46:9
    .valid     (p0_stage1_enable),	// lm_head_demo.k:45:9
    .valid_out (/* unused */)
  );	// lm_head_demo.k:46:9
  assign done_out = p0_stage2_enable;	// lm_head_demo.k:45:9
  assign fifo_wren_0 = fifo_wren_0_0;	// lm_head_demo.k:45:9
  assign input_rdy_0 = input_rdy_0_0;	// lm_head_demo.k:45:9
  assign control_state_out = control_state_out_0;	// lm_head_demo.k:45:9
endmodule

module lm_head_demo_write_weight_chunk_BasicBlock_0(	// lm_head_demo.k:39:9
  input  wire         clk,
  input  wire         rst,
  output wire         done_out,
  output wire [191:0] memory_write_data_out_9_0,
  output wire [15:0]  memory_write_addr_out_9_0,
  output wire         memory_wren_9_0,
  output wire         fifo_wren_0,
  input  wire         fifo_almost_full_in_raw_0,
  input  wire         fifo_overflow_in_0,
  input  wire [207:0] data_in_8,
  input  wire         input_fifo_underflow_0,
  output wire         input_rdy_0,
  input  wire         input_valid_0,
  output wire [7:0]   control_state_out
);

  wire          _fifo_overflow_ffc_0_data_out;
  wire          _fifo_almostfull_ffc_0_data_out;
  logic         done_out_0;	// lm_head_demo.k:39:9
  logic [191:0] memory_write_data_out_9_0_0;	// lm_head_demo.k:39:9
  logic [15:0]  memory_write_addr_out_9_0_0;	// lm_head_demo.k:39:9
  logic         memory_wren_9_0_0;	// lm_head_demo.k:39:9
  logic         fifo_wren_0_0;	// lm_head_demo.k:39:9
  logic         input_rdy_0_0;	// lm_head_demo.k:39:9
  logic [7:0]   control_state_out_0;	// lm_head_demo.k:39:9
  wire          _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// lm_head_demo.k:39:9
  wire          _GEN_0 = _GEN & input_valid_0;	// lm_head_demo.k:39:9
  always_comb begin	// lm_head_demo.k:39:9
    input_rdy_0_0 = _GEN;	// lm_head_demo.k:39:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// lm_head_demo.k:39:9
  end // always_comb
  always_comb begin	// lm_head_demo.k:39:9
    memory_wren_9_0_0 = _GEN_0;	// lm_head_demo.k:39:{9,18}
    memory_write_addr_out_9_0_0 = data_in_8[15:0];	// lm_head_demo.k:39:18
    memory_write_data_out_9_0_0 = data_in_8[207:16];	// lm_head_demo.k:39:18
  end // always_comb
  reg   [15:0]  p0_addr;	// lm_head_demo.k:39:9
  reg   [191:0] p0_value;	// lm_head_demo.k:39:9
  reg           p0_stage1_enable = 1'h0;	// lm_head_demo.k:39:9
  reg           p0_stage2_enable = 1'h0;	// lm_head_demo.k:39:9
  always @(posedge clk) begin	// lm_head_demo.k:39:9
    p0_addr <= data_in_8[15:0];	// lm_head_demo.k:39:9
    p0_value <= data_in_8[207:16];	// lm_head_demo.k:39:9
    if (rst) begin	// lm_head_demo.k:39:9
      p0_stage1_enable <= 1'h0;	// lm_head_demo.k:39:9
      p0_stage2_enable <= 1'h0;	// lm_head_demo.k:39:9
    end
    else begin	// lm_head_demo.k:39:9
      p0_stage1_enable <= _GEN_0;	// lm_head_demo.k:39:9
      p0_stage2_enable <= p0_stage1_enable;	// lm_head_demo.k:39:9
    end
  end // always @(posedge)
  always_comb	// lm_head_demo.k:39:9
    fifo_wren_0_0 = p0_stage2_enable;	// lm_head_demo.k:39:9, :40:9
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// lm_head_demo.k:39:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// lm_head_demo.k:39:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  lm_head_demoDebugView_write_weight_chunkEntry lm_head_demoDebugView_write_weight_chunkEntry_instance (	// lm_head_demo.k:40:9
    .clk       (clk),	// lm_head_demo.k:40:9
    ._addr     (p0_stage1_enable ? p0_addr : 'x),	// lm_head_demo.k:39:9, :40:9
    ._value    (p0_stage1_enable ? p0_value : 'x),	// lm_head_demo.k:39:9, :40:9
    .valid     (p0_stage1_enable),	// lm_head_demo.k:39:9
    .valid_out (/* unused */)
  );	// lm_head_demo.k:40:9
  assign done_out = p0_stage2_enable;	// lm_head_demo.k:39:9
  assign memory_write_data_out_9_0 = memory_write_data_out_9_0_0;	// lm_head_demo.k:39:9
  assign memory_write_addr_out_9_0 = memory_write_addr_out_9_0_0;	// lm_head_demo.k:39:9
  assign memory_wren_9_0 = memory_wren_9_0_0;	// lm_head_demo.k:39:9
  assign fifo_wren_0 = fifo_wren_0_0;	// lm_head_demo.k:39:9
  assign input_rdy_0 = input_rdy_0_0;	// lm_head_demo.k:39:9
  assign control_state_out = control_state_out_0;	// lm_head_demo.k:39:9
endmodule

module lm_head_demo_read_weight_chunk_BasicBlock_0(	// lm_head_demo.k:31:9
  input  wire         clk,
  input  wire         rst,
  output wire         done_out,
  input  wire [191:0] memory_read_data_in_9_0,
  output wire [15:0]  memory_read_addr_out_9_0,
  output wire         memory_rden_out_9_0,
  output wire [191:0] fifo_data_out_0,
  output wire         fifo_wren_0,
  input  wire         fifo_almost_full_in_raw_0,
  input  wire         fifo_overflow_in_0,
  input  wire [15:0]  data_in_7,
  input  wire         input_fifo_underflow_0,
  output wire         input_rdy_0,
  input  wire         input_valid_0,
  output wire [7:0]   control_state_out
);

  wire          _fifo_overflow_ffc_0_data_out;
  wire          _fifo_almostfull_ffc_0_data_out;
  wire  [191:0] memory_read_data_in_9_0_0 = memory_read_data_in_9_0;	// lm_head_demo.k:31:9
  logic         done_out_0;	// lm_head_demo.k:31:9
  logic [15:0]  memory_read_addr_out_9_0_0;	// lm_head_demo.k:31:9
  logic         memory_rden_out_9_0_0;	// lm_head_demo.k:31:9
  logic [191:0] fifo_data_out_0_0;	// lm_head_demo.k:31:9
  logic         fifo_wren_0_0;	// lm_head_demo.k:31:9
  logic         input_rdy_0_0;	// lm_head_demo.k:31:9
  logic [7:0]   control_state_out_0;	// lm_head_demo.k:31:9
  wire          _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// lm_head_demo.k:31:9
  wire          _GEN_0 = _GEN & input_valid_0;	// lm_head_demo.k:31:9
  always_comb begin	// lm_head_demo.k:31:9
    input_rdy_0_0 = _GEN;	// lm_head_demo.k:31:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// lm_head_demo.k:31:9
  end // always_comb
  always_comb begin	// lm_head_demo.k:31:9
    memory_read_addr_out_9_0_0 = data_in_7;	// lm_head_demo.k:32:27
    memory_rden_out_9_0_0 = _GEN_0;	// lm_head_demo.k:31:9, :32:27
  end // always_comb
  reg   [15:0]  p0_data_in_7;	// lm_head_demo.k:31:9
  reg           p0_stage1_enable = 1'h0;	// lm_head_demo.k:31:9
  reg           p0_stage2_enable = 1'h0;	// lm_head_demo.k:31:9
  reg   [191:0] p0_memory_read_data_in_9_0;	// lm_head_demo.k:31:9
  reg           p0_stage3_enable = 1'h0;	// lm_head_demo.k:31:9
  always @(posedge clk) begin	// lm_head_demo.k:31:9
    p0_data_in_7 <= data_in_7;	// lm_head_demo.k:31:9
    if (rst) begin	// lm_head_demo.k:31:9
      p0_stage1_enable <= 1'h0;	// lm_head_demo.k:31:9
      p0_stage2_enable <= 1'h0;	// lm_head_demo.k:31:9
    end
    else begin	// lm_head_demo.k:31:9
      p0_stage1_enable <= _GEN_0;	// lm_head_demo.k:31:9
      p0_stage2_enable <= p0_stage1_enable;	// lm_head_demo.k:31:9
    end
    p0_memory_read_data_in_9_0 <= memory_read_data_in_9_0_0;	// lm_head_demo.k:31:9
    if (rst)	// lm_head_demo.k:31:9
      p0_stage3_enable <= 1'h0;	// lm_head_demo.k:31:9
    else	// lm_head_demo.k:31:9
      p0_stage3_enable <= p0_stage2_enable;	// lm_head_demo.k:31:9
  end // always @(posedge)
  always_comb begin	// lm_head_demo.k:31:9
    fifo_wren_0_0 = p0_stage3_enable;	// lm_head_demo.k:29:5, :31:9
    fifo_data_out_0_0 = p0_memory_read_data_in_9_0;	// lm_head_demo.k:29:5, :31:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// lm_head_demo.k:31:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// lm_head_demo.k:31:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  lm_head_demoDebugView_read_weight_chunkEntry lm_head_demoDebugView_read_weight_chunkEntry_instance (	// lm_head_demo.k:29:5
    .clk       (clk),	// lm_head_demo.k:29:5
    ._addr     (p0_stage1_enable ? p0_data_in_7 : 'x),	// lm_head_demo.k:29:5, :31:9
    .valid     (p0_stage1_enable),	// lm_head_demo.k:31:9
    .valid_out (/* unused */)
  );	// lm_head_demo.k:29:5
  lm_head_demoDebugView_read_weight_chunkExit lm_head_demoDebugView_read_weight_chunkExit_instance (	// lm_head_demo.k:29:5
    .clk          (clk),	// lm_head_demo.k:29:5
    ._ReturnValue (p0_stage2_enable ? memory_read_data_in_9_0_0 : 'x),	// lm_head_demo.k:29:5, :31:9
    .valid        (p0_stage2_enable),	// lm_head_demo.k:31:9
    .valid_out    (/* unused */)
  );	// lm_head_demo.k:29:5
  assign done_out = p0_stage3_enable;	// lm_head_demo.k:31:9
  assign memory_read_addr_out_9_0 = memory_read_addr_out_9_0_0;	// lm_head_demo.k:31:9
  assign memory_rden_out_9_0 = memory_rden_out_9_0_0;	// lm_head_demo.k:31:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// lm_head_demo.k:31:9
  assign fifo_wren_0 = fifo_wren_0_0;	// lm_head_demo.k:31:9
  assign input_rdy_0 = input_rdy_0_0;	// lm_head_demo.k:31:9
  assign control_state_out = control_state_out_0;	// lm_head_demo.k:31:9
endmodule

module lm_head_demo_reg_32_w2_v_1_32_0_i_32_0(
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

module lm_head_demo_reg_10_w2_v_1_10_0_i_10_0(
  input  wire       clk,
  input  wire       rst,
  input  wire       input_valid_0,
  input  wire [9:0] input_0,
  input  wire       input_valid_1,
  output wire [9:0] value_out
);

  reg [9:0] value;
  always @(posedge clk) begin
    if (rst)
      value <= 10'h0;
    else
      value <= input_valid_1 ? 10'h0 : input_valid_0 ? input_0 : value;
  end // always @(posedge)
  assign value_out = value;
endmodule

module lm_head_demo__weights__mem_container(	// lm_head_demo.k:16:5
  input  wire         clk,
  input  wire         rst,
  input  wire         rden_in_0,
  input  wire [15:0]  read_addr_in_0,
  input  wire         wren_in_0,
  input  wire [15:0]  write_addr_in_0,
  input  wire [191:0] write_data_in_0,
  output wire [191:0] read_data_out_0,
  output wire         init_completed
);

  wire [1:0][191:0] ___weights_0_data_out;	// lm_head_demo.k:16:5
  KanagawaSyncRam #(
    .DATA_WIDTH(192),
    .ADDR_WIDTH(16),
    .DEPTH(65536),
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
  ) __weights_0 (	// lm_head_demo.k:16:5
    .clk            (clk),	// lm_head_demo.k:16:5
    .rst            (rst),
    .addr_in        ({{read_addr_in_0}, {write_addr_in_0}}),	// lm_head_demo.k:16:5
    .ecc_status_out (/* unused */),
    .wren_in        ({{1'h0}, {wren_in_0}}),	// lm_head_demo.k:16:5
    .data_in        ({{192'h0}, {write_data_in_0}}),	// lm_head_demo.k:16:5
    .rden_in        ({{rden_in_0}, {1'h0}}),	// lm_head_demo.k:16:5
    .data_out       (___weights_0_data_out)
  );	// lm_head_demo.k:16:5
  assign read_data_out_0 = ___weights_0_data_out[1'h1];	// lm_head_demo.k:16:5
  assign init_completed = 1'h1;	// lm_head_demo.k:16:5
endmodule

module lm_head_demo(
  input  wire         clk,
  input  wire         rst,
  input  wire         read_weight_chunk_valid_in,
  input  wire [15:0]  read_weight_chunk_addr_in,
  input  wire         read_weight_chunk_rden_in,
  input  wire         write_weight_chunk_valid_in,
  input  wire [15:0]  write_weight_chunk_addr_in,
  input  wire [191:0] write_weight_chunk_value_in,
  input  wire         write_weight_chunk_rden_in,
  input  wire         set_bank_scale_valid_in,
  input  wire [7:0]   set_bank_scale_value_in,
  input  wire         set_bank_scale_rden_in,
  input  wire         set_tensor_scale_valid_in,
  input  wire [31:0]  set_tensor_scale_value_in,
  input  wire         set_tensor_scale_rden_in,
  input  wire         update_argmax_valid_in,
  input  wire [9:0]   update_argmax_token_idx_in,
  input  wire [31:0]  update_argmax_score_in,
  input  wire         update_argmax_rden_in,
  input  wire         get_best_token_valid_in,
  input  wire         get_best_token_rden_in,
  input  wire         reset_argmax_valid_in,
  input  wire         reset_argmax_rden_in,
  input  wire [2:0]   stall_rate_in,
  input  wire         stall_rate_valid_in,
  output wire         rst_and_startup_done_out,
  output wire         read_weight_chunk_rdy_out,
  output wire         read_weight_chunk_empty_out,
  output wire [191:0] read_weight_chunk_result_out,
  output wire         write_weight_chunk_rdy_out,
  output wire         write_weight_chunk_empty_out,
  output wire         set_bank_scale_rdy_out,
  output wire         set_bank_scale_empty_out,
  output wire         set_tensor_scale_rdy_out,
  output wire         set_tensor_scale_empty_out,
  output wire         update_argmax_rdy_out,
  output wire         update_argmax_empty_out,
  output wire         get_best_token_rdy_out,
  output wire         get_best_token_empty_out,
  output wire [9:0]   get_best_token_result_out,
  output wire         reset_argmax_rdy_out,
  output wire         reset_argmax_empty_out,
  output wire         stall_rate_supported_out
);

  wire         _reset_argmax_BasicBlock_0Impl_global_out__best_score_10_1_valid;	// lm_head_demo.k:78:9
  wire         _reset_argmax_BasicBlock_0Impl_global_out__best_token_11_1_valid;	// lm_head_demo.k:78:9
  wire         _reset_argmax_BasicBlock_0Impl_fifo_wren_0;	// lm_head_demo.k:78:9
  wire         _reset_argmax_BasicBlock_0Impl_input_rdy_0;	// lm_head_demo.k:78:9
  wire [9:0]   _get_best_token_BasicBlock_0Impl_fifo_data_out_0;	// lm_head_demo.k:70:9
  wire         _get_best_token_BasicBlock_0Impl_fifo_wren_0;	// lm_head_demo.k:70:9
  wire         _get_best_token_BasicBlock_0Impl_input_rdy_0;	// lm_head_demo.k:70:9
  wire         _update_argmax_BasicBlock_0Impl_global_out__best_score_10_0_valid;	// lm_head_demo.k:57:9
  wire [31:0]  _update_argmax_BasicBlock_0Impl_global_out__best_score_10_0;	// lm_head_demo.k:57:9
  wire         _update_argmax_BasicBlock_0Impl_global_out__best_token_11_0_valid;	// lm_head_demo.k:57:9
  wire [9:0]   _update_argmax_BasicBlock_0Impl_global_out__best_token_11_0;	// lm_head_demo.k:57:9
  wire         _update_argmax_BasicBlock_0Impl_fifo_wren_0;	// lm_head_demo.k:57:9
  wire         _update_argmax_BasicBlock_0Impl_input_rdy_0;	// lm_head_demo.k:57:9
  wire         _set_tensor_scale_BasicBlock_0Impl_fifo_wren_0;	// lm_head_demo.k:51:9
  wire         _set_tensor_scale_BasicBlock_0Impl_input_rdy_0;	// lm_head_demo.k:51:9
  wire         _set_bank_scale_BasicBlock_0Impl_fifo_wren_0;	// lm_head_demo.k:45:9
  wire         _set_bank_scale_BasicBlock_0Impl_input_rdy_0;	// lm_head_demo.k:45:9
  wire [191:0] _write_weight_chunk_BasicBlock_0Impl_memory_write_data_out_9_0;	// lm_head_demo.k:39:9
  wire [15:0]  _write_weight_chunk_BasicBlock_0Impl_memory_write_addr_out_9_0;	// lm_head_demo.k:39:9
  wire         _write_weight_chunk_BasicBlock_0Impl_memory_wren_9_0;	// lm_head_demo.k:39:9
  wire         _write_weight_chunk_BasicBlock_0Impl_fifo_wren_0;	// lm_head_demo.k:39:9
  wire         _write_weight_chunk_BasicBlock_0Impl_input_rdy_0;	// lm_head_demo.k:39:9
  wire [15:0]  _read_weight_chunk_BasicBlock_0Impl_memory_read_addr_out_9_0;	// lm_head_demo.k:31:9
  wire         _read_weight_chunk_BasicBlock_0Impl_memory_rden_out_9_0;	// lm_head_demo.k:31:9
  wire [191:0] _read_weight_chunk_BasicBlock_0Impl_fifo_data_out_0;	// lm_head_demo.k:31:9
  wire         _read_weight_chunk_BasicBlock_0Impl_fifo_wren_0;	// lm_head_demo.k:31:9
  wire         _read_weight_chunk_BasicBlock_0Impl_input_rdy_0;	// lm_head_demo.k:31:9
  wire         _fifo_6_reset_argmax_Return_overflow_out;
  wire         _fifo_6_reset_argmax_Return_underflow_out;
  wire         _fifo_6_reset_argmax_Return_empty;
  wire         _fifo_6_reset_argmax_Return_full;
  wire         _fifo_5_get_best_token_Return_overflow_out;
  wire         _fifo_5_get_best_token_Return_underflow_out;
  wire         _fifo_5_get_best_token_Return_empty;
  wire         _fifo_5_get_best_token_Return_full;
  wire [9:0]   _fifo_5_get_best_token_Return_q;
  wire         _fifo_4_update_argmax_Return_overflow_out;
  wire         _fifo_4_update_argmax_Return_underflow_out;
  wire         _fifo_4_update_argmax_Return_empty;
  wire         _fifo_4_update_argmax_Return_full;
  wire         _fifo_3_set_tensor_scale_Return_overflow_out;
  wire         _fifo_3_set_tensor_scale_Return_underflow_out;
  wire         _fifo_3_set_tensor_scale_Return_empty;
  wire         _fifo_3_set_tensor_scale_Return_full;
  wire         _fifo_2_set_bank_scale_Return_overflow_out;
  wire         _fifo_2_set_bank_scale_Return_underflow_out;
  wire         _fifo_2_set_bank_scale_Return_empty;
  wire         _fifo_2_set_bank_scale_Return_full;
  wire         _fifo_1_write_weight_chunk_Return_overflow_out;
  wire         _fifo_1_write_weight_chunk_Return_underflow_out;
  wire         _fifo_1_write_weight_chunk_Return_empty;
  wire         _fifo_1_write_weight_chunk_Return_full;
  wire         _fifo_0_read_weight_chunk_Return_overflow_out;
  wire         _fifo_0_read_weight_chunk_Return_underflow_out;
  wire         _fifo_0_read_weight_chunk_Return_empty;
  wire         _fifo_0_read_weight_chunk_Return_full;
  wire [191:0] _fifo_0_read_weight_chunk_Return_q;
  wire         _has_startup_completed_delayed_6_delay_chain_data_out;
  wire         _has_startup_completed_delayed_5_delay_chain_data_out;
  wire         _has_startup_completed_delayed_4_delay_chain_data_out;
  wire         _has_startup_completed_delayed_3_delay_chain_data_out;
  wire         _has_startup_completed_delayed_2_delay_chain_data_out;
  wire         _has_startup_completed_delayed_1_delay_chain_data_out;
  wire         _has_startup_completed_delayed_0_delay_chain_data_out;
  wire [9:0]   __best_token_value_out;	// lm_head_demo.k:24:5
  wire [31:0]  __best_score_value_out;	// lm_head_demo.k:23:5
  wire [191:0] __weights_read_data_out_0;	// lm_head_demo.k:16:5
  wire         __weights_init_completed;	// lm_head_demo.k:16:5
  wire         _reset_control_rst_and_startup_done_out;
  wire [15:0]  _reset_control_rst_delayed_out;
  wire         _reset_control_reset_sequence_finished_this_cycle_out;
  logic  stall_rate_supported_out_net;
  logic  reset_argmax_empty_out_net;
  logic  reset_argmax_rdy_out_net;
  logic  get_best_token_empty_out_net;
  logic [9:0] get_best_token_result_out_net;
  logic  get_best_token_rdy_out_net;
  logic  update_argmax_empty_out_net;
  logic  update_argmax_rdy_out_net;
  logic  set_tensor_scale_empty_out_net;
  logic  set_tensor_scale_rdy_out_net;
  logic  set_bank_scale_empty_out_net;
  logic  set_bank_scale_rdy_out_net;
  logic  write_weight_chunk_empty_out_net;
  logic  write_weight_chunk_rdy_out_net;
  logic  read_weight_chunk_empty_out_net;
  logic [191:0] read_weight_chunk_result_out_net;
  logic  read_weight_chunk_rdy_out_net;
  logic  rst_and_startup_done_out_net;

  logic [31:0] dropped_commands;
  //synopsys translate_off
  KanagawaStringTable string_table(.clk(clk));
  //synopsys translate_on
  logic [15:0] reg_rst_delayed;
  logic combined_reset;
  assign combined_reset = rst;
  logic reset_sequence_finished_this_cycle;
  logic has_startup_completed_raw;
  logic has_mem_init_completed;
  wire         _GEN = has_startup_completed_raw & __weights_init_completed;	// lm_head_demo.k:16:5
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

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [191:0] data_in;
      logic [191:0] data_out;
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
      logic overflow;
      logic underflow;
  } fifo_data_4;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [9:0] data_in;
      logic [9:0] data_out;
      logic overflow;
      logic underflow;
  } fifo_data_5;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic overflow;
      logic underflow;
  } fifo_data_6;

  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [15:0] data;
      logic underflow;
  } passthrough_data_7;
  assign passthrough_data_7.underflow = 1'b0;
  assign passthrough_data_7.rdy_ext = passthrough_data_7.rdy_int & !(!has_startup_completed_delayed_0);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [207:0] data;
      logic underflow;
  } passthrough_data_8;
  assign passthrough_data_8.underflow = 1'b0;
  assign passthrough_data_8.rdy_ext = passthrough_data_8.rdy_int & !(!has_startup_completed_delayed_1);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [7:0] data;
      logic underflow;
  } passthrough_data_9;
  assign passthrough_data_9.underflow = 1'b0;
  assign passthrough_data_9.rdy_ext = passthrough_data_9.rdy_int & !(!has_startup_completed_delayed_2);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [31:0] data;
      logic underflow;
  } passthrough_data_10;
  assign passthrough_data_10.underflow = 1'b0;
  assign passthrough_data_10.rdy_ext = passthrough_data_10.rdy_int & !(!has_startup_completed_delayed_3);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [41:0] data;
      logic underflow;
  } passthrough_data_11;
  assign passthrough_data_11.underflow = 1'b0;
  assign passthrough_data_11.rdy_ext = passthrough_data_11.rdy_int & !(!has_startup_completed_delayed_4);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic underflow;
  } passthrough_data_12;
  assign passthrough_data_12.underflow = 1'b0;
  assign passthrough_data_12.rdy_ext = passthrough_data_12.rdy_int & !(!has_startup_completed_delayed_5);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic underflow;
  } passthrough_data_13;
  assign passthrough_data_13.underflow = 1'b0;
  assign passthrough_data_13.rdy_ext = passthrough_data_13.rdy_int & !(!has_startup_completed_delayed_6);
  assign read_weight_chunk_rdy_out_net = passthrough_data_7.rdy_ext;
  assign passthrough_data_7.valid = read_weight_chunk_rdy_out & read_weight_chunk_valid_in;
  assign passthrough_data_7.data = { read_weight_chunk_addr_in };
  assign fifo_data_0.rden = read_weight_chunk_rden_in;
  assign read_weight_chunk_result_out_net = fifo_data_0.data_out;
  assign read_weight_chunk_empty_out_net = fifo_data_0.empty;
  assign write_weight_chunk_rdy_out_net = passthrough_data_8.rdy_ext;
  assign passthrough_data_8.valid = write_weight_chunk_rdy_out & write_weight_chunk_valid_in;
  assign passthrough_data_8.data = { write_weight_chunk_value_in, write_weight_chunk_addr_in };
  assign fifo_data_1.rden = write_weight_chunk_rden_in;
  assign write_weight_chunk_empty_out_net = fifo_data_1.empty;
  assign set_bank_scale_rdy_out_net = passthrough_data_9.rdy_ext;
  assign passthrough_data_9.valid = set_bank_scale_rdy_out & set_bank_scale_valid_in;
  assign passthrough_data_9.data = { set_bank_scale_value_in };
  assign fifo_data_2.rden = set_bank_scale_rden_in;
  assign set_bank_scale_empty_out_net = fifo_data_2.empty;
  assign set_tensor_scale_rdy_out_net = passthrough_data_10.rdy_ext;
  assign passthrough_data_10.valid = set_tensor_scale_rdy_out & set_tensor_scale_valid_in;
  assign passthrough_data_10.data = { set_tensor_scale_value_in };
  assign fifo_data_3.rden = set_tensor_scale_rden_in;
  assign set_tensor_scale_empty_out_net = fifo_data_3.empty;
  assign update_argmax_rdy_out_net = passthrough_data_11.rdy_ext;
  assign passthrough_data_11.valid = update_argmax_rdy_out & update_argmax_valid_in;
  assign passthrough_data_11.data = { update_argmax_score_in, update_argmax_token_idx_in };
  assign fifo_data_4.rden = update_argmax_rden_in;
  assign update_argmax_empty_out_net = fifo_data_4.empty;
  assign get_best_token_rdy_out_net = passthrough_data_12.rdy_ext;
  assign passthrough_data_12.valid = get_best_token_rdy_out & get_best_token_valid_in;
  assign fifo_data_5.rden = get_best_token_rden_in;
  assign get_best_token_result_out_net = fifo_data_5.data_out;
  assign get_best_token_empty_out_net = fifo_data_5.empty;
  assign reset_argmax_rdy_out_net = passthrough_data_13.rdy_ext;
  assign passthrough_data_13.valid = reset_argmax_rdy_out & reset_argmax_valid_in;
  assign fifo_data_6.rden = reset_argmax_rden_in;
  assign reset_argmax_empty_out_net = fifo_data_6.empty;
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
    fifo_data_0.overflow = _fifo_0_read_weight_chunk_Return_overflow_out;
    fifo_data_0.underflow = _fifo_0_read_weight_chunk_Return_underflow_out;
    fifo_data_0.empty = _fifo_0_read_weight_chunk_Return_empty;
    fifo_data_0.almost_full = _fifo_0_read_weight_chunk_Return_full;
    fifo_data_0.data_out = _fifo_0_read_weight_chunk_Return_q;
    fifo_data_1.overflow = _fifo_1_write_weight_chunk_Return_overflow_out;
    fifo_data_1.underflow = _fifo_1_write_weight_chunk_Return_underflow_out;
    fifo_data_1.empty = _fifo_1_write_weight_chunk_Return_empty;
    fifo_data_1.almost_full = _fifo_1_write_weight_chunk_Return_full;
    fifo_data_2.overflow = _fifo_2_set_bank_scale_Return_overflow_out;
    fifo_data_2.underflow = _fifo_2_set_bank_scale_Return_underflow_out;
    fifo_data_2.empty = _fifo_2_set_bank_scale_Return_empty;
    fifo_data_2.almost_full = _fifo_2_set_bank_scale_Return_full;
    fifo_data_3.overflow = _fifo_3_set_tensor_scale_Return_overflow_out;
    fifo_data_3.underflow = _fifo_3_set_tensor_scale_Return_underflow_out;
    fifo_data_3.empty = _fifo_3_set_tensor_scale_Return_empty;
    fifo_data_3.almost_full = _fifo_3_set_tensor_scale_Return_full;
    fifo_data_4.overflow = _fifo_4_update_argmax_Return_overflow_out;
    fifo_data_4.underflow = _fifo_4_update_argmax_Return_underflow_out;
    fifo_data_4.empty = _fifo_4_update_argmax_Return_empty;
    fifo_data_4.almost_full = _fifo_4_update_argmax_Return_full;
    fifo_data_5.overflow = _fifo_5_get_best_token_Return_overflow_out;
    fifo_data_5.underflow = _fifo_5_get_best_token_Return_underflow_out;
    fifo_data_5.empty = _fifo_5_get_best_token_Return_empty;
    fifo_data_5.almost_full = _fifo_5_get_best_token_Return_full;
    fifo_data_5.data_out = _fifo_5_get_best_token_Return_q;
    fifo_data_6.overflow = _fifo_6_reset_argmax_Return_overflow_out;
    fifo_data_6.underflow = _fifo_6_reset_argmax_Return_underflow_out;
    fifo_data_6.empty = _fifo_6_reset_argmax_Return_empty;
    fifo_data_6.almost_full = _fifo_6_reset_argmax_Return_full;
    fifo_data_0.data_in = _read_weight_chunk_BasicBlock_0Impl_fifo_data_out_0;	// lm_head_demo.k:31:9
    fifo_data_0.wren = _read_weight_chunk_BasicBlock_0Impl_fifo_wren_0;	// lm_head_demo.k:31:9
    passthrough_data_7.rdy_int = _read_weight_chunk_BasicBlock_0Impl_input_rdy_0;	// lm_head_demo.k:31:9
    fifo_data_1.wren = _write_weight_chunk_BasicBlock_0Impl_fifo_wren_0;	// lm_head_demo.k:39:9
    passthrough_data_8.rdy_int = _write_weight_chunk_BasicBlock_0Impl_input_rdy_0;	// lm_head_demo.k:39:9
    fifo_data_2.wren = _set_bank_scale_BasicBlock_0Impl_fifo_wren_0;	// lm_head_demo.k:45:9
    passthrough_data_9.rdy_int = _set_bank_scale_BasicBlock_0Impl_input_rdy_0;	// lm_head_demo.k:45:9
    fifo_data_3.wren = _set_tensor_scale_BasicBlock_0Impl_fifo_wren_0;	// lm_head_demo.k:51:9
    passthrough_data_10.rdy_int = _set_tensor_scale_BasicBlock_0Impl_input_rdy_0;	// lm_head_demo.k:51:9
    fifo_data_4.wren = _update_argmax_BasicBlock_0Impl_fifo_wren_0;	// lm_head_demo.k:57:9
    passthrough_data_11.rdy_int = _update_argmax_BasicBlock_0Impl_input_rdy_0;	// lm_head_demo.k:57:9
    fifo_data_5.data_in = _get_best_token_BasicBlock_0Impl_fifo_data_out_0;	// lm_head_demo.k:70:9
    fifo_data_5.wren = _get_best_token_BasicBlock_0Impl_fifo_wren_0;	// lm_head_demo.k:70:9
    passthrough_data_12.rdy_int = _get_best_token_BasicBlock_0Impl_input_rdy_0;	// lm_head_demo.k:70:9
    fifo_data_6.wren = _reset_argmax_BasicBlock_0Impl_fifo_wren_0;	// lm_head_demo.k:78:9
    passthrough_data_13.rdy_int = _reset_argmax_BasicBlock_0Impl_input_rdy_0;	// lm_head_demo.k:78:9
  end // always_comb

  assign has_startup_completed_raw = 1'b1;
  assign stall_rate_supported_out_net = 1'b0;
  KanagawaResetControl #(
    .WIDTH(16),
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
  lm_head_demo__weights__mem_container _weights (	// lm_head_demo.k:16:5
    .clk             (clk),	// lm_head_demo.k:16:5
    .rst             (1'b0),	// lm_head_demo.k:16:5
    .rden_in_0       (_read_weight_chunk_BasicBlock_0Impl_memory_rden_out_9_0),	// lm_head_demo.k:31:9
    .read_addr_in_0  (_read_weight_chunk_BasicBlock_0Impl_memory_read_addr_out_9_0),	// lm_head_demo.k:31:9
    .wren_in_0       (_write_weight_chunk_BasicBlock_0Impl_memory_wren_9_0),	// lm_head_demo.k:39:9
    .write_addr_in_0 (_write_weight_chunk_BasicBlock_0Impl_memory_write_addr_out_9_0),	// lm_head_demo.k:39:9
    .write_data_in_0 (_write_weight_chunk_BasicBlock_0Impl_memory_write_data_out_9_0),	// lm_head_demo.k:39:9
    .read_data_out_0 (__weights_read_data_out_0),
    .init_completed  (__weights_init_completed)
  );	// lm_head_demo.k:16:5
  lm_head_demo_reg_32_w2_v_1_32_0_i_32_0 _best_score (	// lm_head_demo.k:23:5
    .clk           (clk),	// lm_head_demo.k:16:5
    .rst           (reg_rst_delayed[0]),	// lm_head_demo.k:23:5
    .input_valid_0 (_update_argmax_BasicBlock_0Impl_global_out__best_score_10_0_valid),	// lm_head_demo.k:57:9
    .input_0       (_update_argmax_BasicBlock_0Impl_global_out__best_score_10_0),	// lm_head_demo.k:57:9
    .input_valid_1 (_reset_argmax_BasicBlock_0Impl_global_out__best_score_10_1_valid),	// lm_head_demo.k:78:9
    .value_out     (__best_score_value_out)
  );	// lm_head_demo.k:23:5
  lm_head_demo_reg_10_w2_v_1_10_0_i_10_0 _best_token (	// lm_head_demo.k:24:5
    .clk           (clk),	// lm_head_demo.k:16:5
    .rst           (reg_rst_delayed[1]),	// lm_head_demo.k:24:5
    .input_valid_0 (_update_argmax_BasicBlock_0Impl_global_out__best_token_11_0_valid),	// lm_head_demo.k:57:9
    .input_0       (_update_argmax_BasicBlock_0Impl_global_out__best_token_11_0),	// lm_head_demo.k:57:9
    .input_valid_1 (_reset_argmax_BasicBlock_0Impl_global_out__best_token_11_1_valid),	// lm_head_demo.k:78:9
    .value_out     (__best_token_value_out)
  );	// lm_head_demo.k:24:5
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
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(192),
    .PORT_WIDTH(192),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_0_read_weight_chunk_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(4),
    .USE_LUTRAM(1)
  ) fifo_0_read_weight_chunk_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[2]),
    .overflow_out  (_fifo_0_read_weight_chunk_Return_overflow_out),
    .underflow_out (_fifo_0_read_weight_chunk_Return_underflow_out),
    .empty         (_fifo_0_read_weight_chunk_Return_empty),
    .rdreq         (fifo_data_0.rden),
    .full          (_fifo_0_read_weight_chunk_Return_full),
    .wrreq         (fifo_data_0.wren),
    .data          (fifo_data_0.data_in),
    .q             (_fifo_0_read_weight_chunk_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(0),
    .PORT_WIDTH(1),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_1_write_weight_chunk_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(0)
  ) fifo_1_write_weight_chunk_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[3]),
    .overflow_out  (_fifo_1_write_weight_chunk_Return_overflow_out),
    .underflow_out (_fifo_1_write_weight_chunk_Return_underflow_out),
    .empty         (_fifo_1_write_weight_chunk_Return_empty),
    .rdreq         (fifo_data_1.rden),
    .full          (_fifo_1_write_weight_chunk_Return_full),
    .wrreq         (fifo_data_1.wren),
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
    .AUTO_PIPELINE_GROUP("fifo_2_set_bank_scale_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(0)
  ) fifo_2_set_bank_scale_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[4]),
    .overflow_out  (_fifo_2_set_bank_scale_Return_overflow_out),
    .underflow_out (_fifo_2_set_bank_scale_Return_underflow_out),
    .empty         (_fifo_2_set_bank_scale_Return_empty),
    .rdreq         (fifo_data_2.rden),
    .full          (_fifo_2_set_bank_scale_Return_full),
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
    .AUTO_PIPELINE_GROUP("fifo_3_set_tensor_scale_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(0)
  ) fifo_3_set_tensor_scale_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[5]),
    .overflow_out  (_fifo_3_set_tensor_scale_Return_overflow_out),
    .underflow_out (_fifo_3_set_tensor_scale_Return_underflow_out),
    .empty         (_fifo_3_set_tensor_scale_Return_empty),
    .rdreq         (fifo_data_3.rden),
    .full          (_fifo_3_set_tensor_scale_Return_full),
    .wrreq         (fifo_data_3.wren),
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
    .AUTO_PIPELINE_GROUP("fifo_4_update_argmax_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(0)
  ) fifo_4_update_argmax_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[6]),
    .overflow_out  (_fifo_4_update_argmax_Return_overflow_out),
    .underflow_out (_fifo_4_update_argmax_Return_underflow_out),
    .empty         (_fifo_4_update_argmax_Return_empty),
    .rdreq         (fifo_data_4.rden),
    .full          (_fifo_4_update_argmax_Return_full),
    .wrreq         (fifo_data_4.wren),
    .data          ('0),
    .q             (/* unused */)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(10),
    .PORT_WIDTH(10),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_5_get_best_token_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(1)
  ) fifo_5_get_best_token_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[7]),
    .overflow_out  (_fifo_5_get_best_token_Return_overflow_out),
    .underflow_out (_fifo_5_get_best_token_Return_underflow_out),
    .empty         (_fifo_5_get_best_token_Return_empty),
    .rdreq         (fifo_data_5.rden),
    .full          (_fifo_5_get_best_token_Return_full),
    .wrreq         (fifo_data_5.wren),
    .data          (fifo_data_5.data_in),
    .q             (_fifo_5_get_best_token_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(0),
    .PORT_WIDTH(1),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_6_reset_argmax_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(0)
  ) fifo_6_reset_argmax_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[8]),
    .overflow_out  (_fifo_6_reset_argmax_Return_overflow_out),
    .underflow_out (_fifo_6_reset_argmax_Return_underflow_out),
    .empty         (_fifo_6_reset_argmax_Return_empty),
    .rdreq         (fifo_data_6.rden),
    .full          (_fifo_6_reset_argmax_Return_full),
    .wrreq         (fifo_data_6.wren),
    .data          ('0),
    .q             (/* unused */)
  );
  lm_head_demo_read_weight_chunk_BasicBlock_0 read_weight_chunk_BasicBlock_0Impl (	// lm_head_demo.k:31:9
    .clk                       (clk),	// lm_head_demo.k:31:9
    .rst                       (reg_rst_delayed[9]),	// lm_head_demo.k:31:9
    .done_out                  (/* unused */),
    .memory_read_data_in_9_0   (__weights_read_data_out_0),	// lm_head_demo.k:16:5
    .memory_read_addr_out_9_0
      (_read_weight_chunk_BasicBlock_0Impl_memory_read_addr_out_9_0),
    .memory_rden_out_9_0       (_read_weight_chunk_BasicBlock_0Impl_memory_rden_out_9_0),
    .fifo_data_out_0           (_read_weight_chunk_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0               (_read_weight_chunk_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_0.almost_full),	// lm_head_demo.k:31:9
    .fifo_overflow_in_0        (fifo_data_0.overflow),	// lm_head_demo.k:31:9
    .data_in_7                 (passthrough_data_7.data),	// lm_head_demo.k:31:9
    .input_fifo_underflow_0    (passthrough_data_7.underflow),	// lm_head_demo.k:31:9
    .input_rdy_0               (_read_weight_chunk_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_7.valid),	// lm_head_demo.k:31:9
    .control_state_out         (/* unused */)
  );	// lm_head_demo.k:31:9
  lm_head_demo_write_weight_chunk_BasicBlock_0 write_weight_chunk_BasicBlock_0Impl (	// lm_head_demo.k:39:9
    .clk                       (clk),	// lm_head_demo.k:39:9
    .rst                       (reg_rst_delayed[10]),	// lm_head_demo.k:39:9
    .done_out                  (/* unused */),
    .memory_write_data_out_9_0
      (_write_weight_chunk_BasicBlock_0Impl_memory_write_data_out_9_0),
    .memory_write_addr_out_9_0
      (_write_weight_chunk_BasicBlock_0Impl_memory_write_addr_out_9_0),
    .memory_wren_9_0           (_write_weight_chunk_BasicBlock_0Impl_memory_wren_9_0),
    .fifo_wren_0               (_write_weight_chunk_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_1.almost_full),	// lm_head_demo.k:39:9
    .fifo_overflow_in_0        (fifo_data_1.overflow),	// lm_head_demo.k:39:9
    .data_in_8                 (passthrough_data_8.data),	// lm_head_demo.k:39:9
    .input_fifo_underflow_0    (passthrough_data_8.underflow),	// lm_head_demo.k:39:9
    .input_rdy_0               (_write_weight_chunk_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_8.valid),	// lm_head_demo.k:39:9
    .control_state_out         (/* unused */)
  );	// lm_head_demo.k:39:9
  lm_head_demo_set_bank_scale_BasicBlock_0 set_bank_scale_BasicBlock_0Impl (	// lm_head_demo.k:45:9
    .clk                       (clk),	// lm_head_demo.k:45:9
    .rst                       (reg_rst_delayed[11]),	// lm_head_demo.k:45:9
    .done_out                  (/* unused */),
    .fifo_wren_0               (_set_bank_scale_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_2.almost_full),	// lm_head_demo.k:45:9
    .fifo_overflow_in_0        (fifo_data_2.overflow),	// lm_head_demo.k:45:9
    .data_in_9                 (passthrough_data_9.data),	// lm_head_demo.k:45:9
    .input_fifo_underflow_0    (passthrough_data_9.underflow),	// lm_head_demo.k:45:9
    .input_rdy_0               (_set_bank_scale_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_9.valid),	// lm_head_demo.k:45:9
    .control_state_out         (/* unused */)
  );	// lm_head_demo.k:45:9
  lm_head_demo_set_tensor_scale_BasicBlock_0 set_tensor_scale_BasicBlock_0Impl (	// lm_head_demo.k:51:9
    .clk                       (clk),	// lm_head_demo.k:51:9
    .rst                       (reg_rst_delayed[12]),	// lm_head_demo.k:51:9
    .done_out                  (/* unused */),
    .fifo_wren_0               (_set_tensor_scale_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_3.almost_full),	// lm_head_demo.k:51:9
    .fifo_overflow_in_0        (fifo_data_3.overflow),	// lm_head_demo.k:51:9
    .data_in_10                (passthrough_data_10.data),	// lm_head_demo.k:51:9
    .input_fifo_underflow_0    (passthrough_data_10.underflow),	// lm_head_demo.k:51:9
    .input_rdy_0               (_set_tensor_scale_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_10.valid),	// lm_head_demo.k:51:9
    .control_state_out         (/* unused */)
  );	// lm_head_demo.k:51:9
  lm_head_demo_update_argmax_BasicBlock_0 update_argmax_BasicBlock_0Impl (	// lm_head_demo.k:57:9
    .clk                               (clk),	// lm_head_demo.k:57:9
    .rst                               (reg_rst_delayed[13]),	// lm_head_demo.k:57:9
    .done_out                          (/* unused */),
    .global_in__best_score_10          (__best_score_value_out),	// lm_head_demo.k:23:5
    .global_out__best_score_10_0_valid
      (_update_argmax_BasicBlock_0Impl_global_out__best_score_10_0_valid),
    .global_out__best_score_10_0
      (_update_argmax_BasicBlock_0Impl_global_out__best_score_10_0),
    .global_out__best_token_11_0_valid
      (_update_argmax_BasicBlock_0Impl_global_out__best_token_11_0_valid),
    .global_out__best_token_11_0
      (_update_argmax_BasicBlock_0Impl_global_out__best_token_11_0),
    .fifo_wren_0                       (_update_argmax_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0         (fifo_data_4.almost_full),	// lm_head_demo.k:57:9
    .fifo_overflow_in_0                (fifo_data_4.overflow),	// lm_head_demo.k:57:9
    .data_in_11                        (passthrough_data_11.data),	// lm_head_demo.k:57:9
    .input_fifo_underflow_0            (passthrough_data_11.underflow),	// lm_head_demo.k:57:9
    .input_rdy_0                       (_update_argmax_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0                     (passthrough_data_11.valid),	// lm_head_demo.k:57:9
    .control_state_out                 (/* unused */)
  );	// lm_head_demo.k:57:9
  lm_head_demo_get_best_token_BasicBlock_0 get_best_token_BasicBlock_0Impl (	// lm_head_demo.k:70:9
    .clk                       (clk),	// lm_head_demo.k:70:9
    .rst                       (reg_rst_delayed[14]),	// lm_head_demo.k:70:9
    .done_out                  (/* unused */),
    .global_in__best_token_11  (__best_token_value_out),	// lm_head_demo.k:24:5
    .fifo_data_out_0           (_get_best_token_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0               (_get_best_token_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_5.almost_full),	// lm_head_demo.k:70:9
    .fifo_overflow_in_0        (fifo_data_5.overflow),	// lm_head_demo.k:70:9
    .input_fifo_underflow_0    (passthrough_data_12.underflow),	// lm_head_demo.k:70:9
    .input_rdy_0               (_get_best_token_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_12.valid),	// lm_head_demo.k:70:9
    .control_state_out         (/* unused */)
  );	// lm_head_demo.k:70:9
  lm_head_demo_reset_argmax_BasicBlock_0 reset_argmax_BasicBlock_0Impl (	// lm_head_demo.k:78:9
    .clk                               (clk),	// lm_head_demo.k:78:9
    .rst                               (reg_rst_delayed[15]),	// lm_head_demo.k:78:9
    .done_out                          (/* unused */),
    .global_out__best_score_10_1_valid
      (_reset_argmax_BasicBlock_0Impl_global_out__best_score_10_1_valid),
    .global_out__best_token_11_1_valid
      (_reset_argmax_BasicBlock_0Impl_global_out__best_token_11_1_valid),
    .fifo_wren_0                       (_reset_argmax_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0         (fifo_data_6.almost_full),	// lm_head_demo.k:78:9
    .fifo_overflow_in_0                (fifo_data_6.overflow),	// lm_head_demo.k:78:9
    .input_fifo_underflow_0            (passthrough_data_13.underflow),	// lm_head_demo.k:78:9
    .input_rdy_0                       (_reset_argmax_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0                     (passthrough_data_13.valid),	// lm_head_demo.k:78:9
    .control_state_out                 (/* unused */)
  );	// lm_head_demo.k:78:9
  assign rst_and_startup_done_out = rst_and_startup_done_out_net;
  assign read_weight_chunk_rdy_out = read_weight_chunk_rdy_out_net;
  assign read_weight_chunk_empty_out = read_weight_chunk_empty_out_net;
  assign read_weight_chunk_result_out = read_weight_chunk_result_out_net;
  assign write_weight_chunk_rdy_out = write_weight_chunk_rdy_out_net;
  assign write_weight_chunk_empty_out = write_weight_chunk_empty_out_net;
  assign set_bank_scale_rdy_out = set_bank_scale_rdy_out_net;
  assign set_bank_scale_empty_out = set_bank_scale_empty_out_net;
  assign set_tensor_scale_rdy_out = set_tensor_scale_rdy_out_net;
  assign set_tensor_scale_empty_out = set_tensor_scale_empty_out_net;
  assign update_argmax_rdy_out = update_argmax_rdy_out_net;
  assign update_argmax_empty_out = update_argmax_empty_out_net;
  assign get_best_token_rdy_out = get_best_token_rdy_out_net;
  assign get_best_token_empty_out = get_best_token_empty_out_net;
  assign get_best_token_result_out = get_best_token_result_out_net;
  assign reset_argmax_rdy_out = reset_argmax_rdy_out_net;
  assign reset_argmax_empty_out = reset_argmax_empty_out_net;
  assign stall_rate_supported_out = stall_rate_supported_out_net;
endmodule

module lm_head_demo_EsiWrapper(
     input  wire                                                             clk,
     input  wire                                                             rst,
     input  wire [2:0]                                                       stall_rate_in,
     input  wire                                                             stall_rate_valid_in,
  // input  wire /*Zero Width*/                                              get_best_token_arg,
     input  wire                                                             get_best_token_arg_valid,
     input  wire struct packed {logic [15:0] addr; }                         read_weight_chunk_arg,
     input  wire                                                             read_weight_chunk_arg_valid,
  // input  wire /*Zero Width*/                                              reset_argmax_arg,
     input  wire                                                             reset_argmax_arg_valid,
     input  wire struct packed {logic [7:0] value; }                         set_bank_scale_arg,
     input  wire                                                             set_bank_scale_arg_valid,
     input  wire struct packed {logic [31:0] value; }                        set_tensor_scale_arg,
     input  wire                                                             set_tensor_scale_arg_valid,
     input  wire struct packed {logic [9:0] token_idx; logic [31:0] score; } update_argmax_arg,
     input  wire                                                             update_argmax_arg_valid,
     input  wire struct packed {logic [15:0] addr; logic [191:0] value; }    write_weight_chunk_arg,
     input  wire                                                             write_weight_chunk_arg_valid,
     input  wire                                                             get_best_token_result_rden,
     input  wire                                                             read_weight_chunk_result_rden,
     input  wire                                                             reset_argmax_result_rden,
     input  wire                                                             set_bank_scale_result_rden,
     input  wire                                                             set_tensor_scale_result_rden,
     input  wire                                                             update_argmax_result_rden,
     input  wire                                                             write_weight_chunk_result_rden,
     output wire                                                             get_best_token_arg_ready,
     output wire                                                             read_weight_chunk_arg_ready,
     output wire                                                             reset_argmax_arg_ready,
     output wire                                                             set_bank_scale_arg_ready,
     output wire                                                             set_tensor_scale_arg_ready,
     output wire                                                             update_argmax_arg_ready,
     output wire                                                             write_weight_chunk_arg_ready,
     output wire [9:0]                                                       get_best_token_result,
     output wire                                                             get_best_token_result_empty,
     output wire [191:0]                                                     read_weight_chunk_result,
     output wire                                                             read_weight_chunk_result_empty,
  // output wire /*Zero Width*/                                              reset_argmax_result,
     output wire                                                             reset_argmax_result_empty,
  // output wire /*Zero Width*/                                              set_bank_scale_result,
     output wire                                                             set_bank_scale_result_empty,
  // output wire /*Zero Width*/                                              set_tensor_scale_result,
     output wire                                                             set_tensor_scale_result_empty,
  // output wire /*Zero Width*/                                              update_argmax_result,
     output wire                                                             update_argmax_result_empty,
  // output wire /*Zero Width*/                                              write_weight_chunk_result,
     output wire                                                             write_weight_chunk_result_empty,
     output wire                                                             rst_and_startup_done_out,
     output wire                                                             stall_rate_supported_out
);

  wire [191:0] _EsiWrapped_read_weight_chunk_result_out;
  wire [9:0]   _EsiWrapped_get_best_token_result_out;
  lm_head_demo EsiWrapped (
    .clk                          (clk),
    .rst                          (rst),
    .read_weight_chunk_valid_in   (read_weight_chunk_arg_valid),
    .read_weight_chunk_addr_in    (read_weight_chunk_arg.addr),
    .read_weight_chunk_rden_in    (read_weight_chunk_result_rden),
    .write_weight_chunk_valid_in  (write_weight_chunk_arg_valid),
    .write_weight_chunk_addr_in   (write_weight_chunk_arg.addr),
    .write_weight_chunk_value_in  (write_weight_chunk_arg.value),
    .write_weight_chunk_rden_in   (write_weight_chunk_result_rden),
    .set_bank_scale_valid_in      (set_bank_scale_arg_valid),
    .set_bank_scale_value_in      (set_bank_scale_arg.value),
    .set_bank_scale_rden_in       (set_bank_scale_result_rden),
    .set_tensor_scale_valid_in    (set_tensor_scale_arg_valid),
    .set_tensor_scale_value_in    (set_tensor_scale_arg.value),
    .set_tensor_scale_rden_in     (set_tensor_scale_result_rden),
    .update_argmax_valid_in       (update_argmax_arg_valid),
    .update_argmax_token_idx_in   (update_argmax_arg.token_idx),
    .update_argmax_score_in       (update_argmax_arg.score),
    .update_argmax_rden_in        (update_argmax_result_rden),
    .get_best_token_valid_in      (get_best_token_arg_valid),
    .get_best_token_rden_in       (get_best_token_result_rden),
    .reset_argmax_valid_in        (reset_argmax_arg_valid),
    .reset_argmax_rden_in         (reset_argmax_result_rden),
    .stall_rate_in                (stall_rate_in),
    .stall_rate_valid_in          (stall_rate_valid_in),
    .rst_and_startup_done_out     (rst_and_startup_done_out),
    .read_weight_chunk_rdy_out    (read_weight_chunk_arg_ready),
    .read_weight_chunk_empty_out  (read_weight_chunk_result_empty),
    .read_weight_chunk_result_out (_EsiWrapped_read_weight_chunk_result_out),
    .write_weight_chunk_rdy_out   (write_weight_chunk_arg_ready),
    .write_weight_chunk_empty_out (write_weight_chunk_result_empty),
    .set_bank_scale_rdy_out       (set_bank_scale_arg_ready),
    .set_bank_scale_empty_out     (set_bank_scale_result_empty),
    .set_tensor_scale_rdy_out     (set_tensor_scale_arg_ready),
    .set_tensor_scale_empty_out   (set_tensor_scale_result_empty),
    .update_argmax_rdy_out        (update_argmax_arg_ready),
    .update_argmax_empty_out      (update_argmax_result_empty),
    .get_best_token_rdy_out       (get_best_token_arg_ready),
    .get_best_token_empty_out     (get_best_token_result_empty),
    .get_best_token_result_out    (_EsiWrapped_get_best_token_result_out),
    .reset_argmax_rdy_out         (reset_argmax_arg_ready),
    .reset_argmax_empty_out       (reset_argmax_result_empty),
    .stall_rate_supported_out     (stall_rate_supported_out)
  );
  assign get_best_token_result = _EsiWrapped_get_best_token_result_out;
  assign read_weight_chunk_result = _EsiWrapped_read_weight_chunk_result_out;
  // Zero width: assign reset_argmax_result = /*Zero width*/;
  // Zero width: assign set_bank_scale_result = /*Zero width*/;
  // Zero width: assign set_tensor_scale_result = /*Zero width*/;
  // Zero width: assign update_argmax_result = /*Zero width*/;
  // Zero width: assign write_weight_chunk_result = /*Zero width*/;
endmodule

