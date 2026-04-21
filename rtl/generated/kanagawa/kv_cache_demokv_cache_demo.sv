
// This file was generated. Do not modify.
// kanagawa --backend=sv --import-dir=third-party/kanagawa/library --base-library=third-party/kanagawa/library/mini-base.k --output=rtl/generated/kanagawa/kv_cache_demo rtl/kanagawa/kv_cache_demo.k

`default_nettype wire
module kv_cache_demoDebugView_append_kEntry
(
    input wire clk,
    input wire[3:0]  _token_pos,
    input wire[3:0]  _head_id,
    input wire[6:0]  _dim_idx,
    input wire[7:0]  _value,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("append_kEntry time: %0t token_pos: %p head_id: %p dim_idx: %p value: %p", $time, _token_pos, _head_id, _dim_idx, _value);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module kv_cache_demoDebugView_append_vEntry
(
    input wire clk,
    input wire[3:0]  _token_pos,
    input wire[3:0]  _head_id,
    input wire[6:0]  _dim_idx,
    input wire[7:0]  _value,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("append_vEntry time: %0t token_pos: %p head_id: %p dim_idx: %p value: %p", $time, _token_pos, _head_id, _dim_idx, _value);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module kv_cache_demoDebugView_read_kEntry
(
    input wire clk,
    input wire[3:0]  _token_pos,
    input wire[3:0]  _head_id,
    input wire[6:0]  _dim_idx,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("read_kEntry time: %0t token_pos: %p head_id: %p dim_idx: %p", $time, _token_pos, _head_id, _dim_idx);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module kv_cache_demoDebugView_read_kExit
(
    input wire clk,
    input wire[7:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("read_kExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module kv_cache_demoDebugView_read_vEntry
(
    input wire clk,
    input wire[3:0]  _token_pos,
    input wire[3:0]  _head_id,
    input wire[6:0]  _dim_idx,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("read_vEntry time: %0t token_pos: %p head_id: %p dim_idx: %p", $time, _token_pos, _head_id, _dim_idx);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module kv_cache_demoDebugView_read_vExit
(
    input wire clk,
    input wire[7:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("read_vExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module kv_cache_demoDebugView_get_seq_lenExit
(
    input wire clk,
    input wire[4:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("get_seq_lenExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
`ifndef _TYPESCOPE_CoreModuleTypeScope
`define _TYPESCOPE_CoreModuleTypeScope
`endif // _TYPESCOPE_CoreModuleTypeScope
module kv_cache_demo_reset_BasicBlock_0(	// kv_cache_demo.k:83:9
  input  wire       clk,
  input  wire       rst,
  output wire       done_out,
  output wire       global_out__seq_len_19_1_valid,
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
  logic       done_out_0;	// kv_cache_demo.k:83:9
  logic       global_out__seq_len_19_1_valid_0;	// kv_cache_demo.k:83:9
  logic       fifo_wren_0_0;	// kv_cache_demo.k:83:9
  logic       input_rdy_0_0;	// kv_cache_demo.k:83:9
  logic [7:0] control_state_out_0;	// kv_cache_demo.k:83:9
  wire        _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// kv_cache_demo.k:83:9
  always_comb begin	// kv_cache_demo.k:83:9
    input_rdy_0_0 = _GEN;	// kv_cache_demo.k:83:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// kv_cache_demo.k:83:9
  end // always_comb
  reg         p0_stage1_enable = 1'h0;	// kv_cache_demo.k:83:9
  always_comb	// kv_cache_demo.k:83:9
    global_out__seq_len_19_1_valid_0 = p0_stage1_enable;	// kv_cache_demo.k:83:9
  reg         p0_stage2_enable = 1'h0;	// kv_cache_demo.k:83:9
  always @(posedge clk) begin	// kv_cache_demo.k:83:9
    if (rst) begin	// kv_cache_demo.k:83:9
      p0_stage1_enable <= 1'h0;	// kv_cache_demo.k:83:9
      p0_stage2_enable <= 1'h0;	// kv_cache_demo.k:83:9
    end
    else begin	// kv_cache_demo.k:83:9
      p0_stage1_enable <= _GEN & input_valid_0;	// kv_cache_demo.k:83:9
      p0_stage2_enable <= p0_stage1_enable;	// kv_cache_demo.k:83:9
    end
  end // always @(posedge)
  always_comb	// kv_cache_demo.k:83:9
    fifo_wren_0_0 = p0_stage2_enable;	// kv_cache_demo.k:83:9, :88:9
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// kv_cache_demo.k:83:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// kv_cache_demo.k:83:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  assign done_out = p0_stage2_enable;	// kv_cache_demo.k:83:9
  assign global_out__seq_len_19_1_valid = global_out__seq_len_19_1_valid_0;	// kv_cache_demo.k:83:9
  assign fifo_wren_0 = fifo_wren_0_0;	// kv_cache_demo.k:83:9
  assign input_rdy_0 = input_rdy_0_0;	// kv_cache_demo.k:83:9
  assign control_state_out = control_state_out_0;	// kv_cache_demo.k:83:9
endmodule

module kv_cache_demo_get_seq_len_BasicBlock_0(	// kv_cache_demo.k:78:9
  input  wire       clk,
  input  wire       rst,
  output wire       done_out,
  input  wire [4:0] global_in__seq_len_19,
  output wire [4:0] fifo_data_out_0,
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
  wire  [4:0] global_in__seq_len_19_0 = global_in__seq_len_19;	// kv_cache_demo.k:78:9
  logic       done_out_0;	// kv_cache_demo.k:78:9
  logic [4:0] fifo_data_out_0_0;	// kv_cache_demo.k:78:9
  logic       fifo_wren_0_0;	// kv_cache_demo.k:78:9
  logic       input_rdy_0_0;	// kv_cache_demo.k:78:9
  logic [7:0] control_state_out_0;	// kv_cache_demo.k:78:9
  wire        _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// kv_cache_demo.k:78:9
  always_comb begin	// kv_cache_demo.k:78:9
    input_rdy_0_0 = _GEN;	// kv_cache_demo.k:78:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// kv_cache_demo.k:78:9
  end // always_comb
  reg         p0_stage1_enable = 1'h0;	// kv_cache_demo.k:78:9
  reg   [4:0] p0_global_in__seq_len_19;	// kv_cache_demo.k:78:9
  reg         p0_stage2_enable = 1'h0;	// kv_cache_demo.k:78:9
  always @(posedge clk) begin	// kv_cache_demo.k:78:9
    if (rst)	// kv_cache_demo.k:78:9
      p0_stage1_enable <= 1'h0;	// kv_cache_demo.k:78:9
    else	// kv_cache_demo.k:78:9
      p0_stage1_enable <= _GEN & input_valid_0;	// kv_cache_demo.k:78:9
    p0_global_in__seq_len_19 <= global_in__seq_len_19_0;	// kv_cache_demo.k:78:9
    if (rst)	// kv_cache_demo.k:78:9
      p0_stage2_enable <= 1'h0;	// kv_cache_demo.k:78:9
    else	// kv_cache_demo.k:78:9
      p0_stage2_enable <= p0_stage1_enable;	// kv_cache_demo.k:78:9
  end // always @(posedge)
  always_comb begin	// kv_cache_demo.k:78:9
    fifo_wren_0_0 = p0_stage2_enable;	// kv_cache_demo.k:76:5, :78:9
    fifo_data_out_0_0 = p0_global_in__seq_len_19;	// kv_cache_demo.k:76:5, :78:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// kv_cache_demo.k:78:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// kv_cache_demo.k:78:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  kv_cache_demoDebugView_get_seq_lenExit kv_cache_demoDebugView_get_seq_lenExit_instance (	// kv_cache_demo.k:76:5
    .clk          (clk),	// kv_cache_demo.k:76:5
    ._ReturnValue (p0_stage1_enable ? global_in__seq_len_19_0 : 'x),	// kv_cache_demo.k:76:5, :78:9
    .valid        (p0_stage1_enable),	// kv_cache_demo.k:78:9
    .valid_out    (/* unused */)
  );	// kv_cache_demo.k:76:5
  assign done_out = p0_stage2_enable;	// kv_cache_demo.k:78:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// kv_cache_demo.k:78:9
  assign fifo_wren_0 = fifo_wren_0_0;	// kv_cache_demo.k:78:9
  assign input_rdy_0 = input_rdy_0_0;	// kv_cache_demo.k:78:9
  assign control_state_out = control_state_out_0;	// kv_cache_demo.k:78:9
endmodule

module kv_cache_demo_advance_write_ptr_BasicBlock_0(	// kv_cache_demo.k:58:9
  input  wire       clk,
  input  wire       rst,
  output wire       done_out,
  input  wire [4:0] global_in__seq_len_19,
  output wire       global_out__seq_len_19_0_valid,
  output wire [4:0] global_out__seq_len_19_0,
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
  wire  [4:0] global_in__seq_len_19_0 = global_in__seq_len_19;	// kv_cache_demo.k:58:9
  logic       done_out_0;	// kv_cache_demo.k:58:9
  logic       global_out__seq_len_19_0_valid_0;	// kv_cache_demo.k:58:9
  logic [4:0] global_out__seq_len_19_0_0;	// kv_cache_demo.k:58:9
  logic       fifo_wren_0_0;	// kv_cache_demo.k:58:9
  logic       input_rdy_0_0;	// kv_cache_demo.k:58:9
  logic [7:0] control_state_out_0;	// kv_cache_demo.k:58:9
  wire        _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// kv_cache_demo.k:58:9
  always_comb begin	// kv_cache_demo.k:58:9
    input_rdy_0_0 = _GEN;	// kv_cache_demo.k:58:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// kv_cache_demo.k:58:9
  end // always_comb
  reg         p0_stage1_enable = 1'h0;	// kv_cache_demo.k:58:9
  always_comb begin	// kv_cache_demo.k:58:9
    global_out__seq_len_19_0_0 = 5'(global_in__seq_len_19_0 + 5'h1);	// kv_cache_demo.k:58:9, :71:28
    global_out__seq_len_19_0_valid_0 = p0_stage1_enable & ~(global_in__seq_len_19_0[4]);	// kv_cache_demo.k:58:9, :69:17
  end // always_comb
  reg         p0_stage2_enable = 1'h0;	// kv_cache_demo.k:58:9
  always @(posedge clk) begin	// kv_cache_demo.k:58:9
    if (rst) begin	// kv_cache_demo.k:58:9
      p0_stage1_enable <= 1'h0;	// kv_cache_demo.k:58:9
      p0_stage2_enable <= 1'h0;	// kv_cache_demo.k:58:9
    end
    else begin	// kv_cache_demo.k:58:9
      p0_stage1_enable <= _GEN & input_valid_0;	// kv_cache_demo.k:58:9
      p0_stage2_enable <= p0_stage1_enable;	// kv_cache_demo.k:58:9
    end
  end // always @(posedge)
  always_comb	// kv_cache_demo.k:58:9
    fifo_wren_0_0 = p0_stage2_enable;	// kv_cache_demo.k:58:9, :74:9
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// kv_cache_demo.k:58:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// kv_cache_demo.k:58:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  assign done_out = p0_stage2_enable;	// kv_cache_demo.k:58:9
  assign global_out__seq_len_19_0_valid = global_out__seq_len_19_0_valid_0;	// kv_cache_demo.k:58:9
  assign global_out__seq_len_19_0 = global_out__seq_len_19_0_0;	// kv_cache_demo.k:58:9
  assign fifo_wren_0 = fifo_wren_0_0;	// kv_cache_demo.k:58:9
  assign input_rdy_0 = input_rdy_0_0;	// kv_cache_demo.k:58:9
  assign control_state_out = control_state_out_0;	// kv_cache_demo.k:58:9
endmodule

module kv_cache_demo_read_v_BasicBlock_0(	// kv_cache_demo.k:48:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  input  wire [7:0]  memory_read_data_in_18_0,
  output wire [13:0] memory_read_addr_out_18_0,
  output wire        memory_rden_out_18_0,
  output wire [7:0]  fifo_data_out_0,
  output wire        fifo_wren_0,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [14:0] data_in_10,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  wire  [7:0]  memory_read_data_in_18_0_0 = memory_read_data_in_18_0;	// kv_cache_demo.k:48:9
  logic        done_out_0;	// kv_cache_demo.k:48:9
  logic [13:0] memory_read_addr_out_18_0_0;	// kv_cache_demo.k:48:9
  logic        memory_rden_out_18_0_0;	// kv_cache_demo.k:48:9
  logic [7:0]  fifo_data_out_0_0;	// kv_cache_demo.k:48:9
  logic        fifo_wren_0_0;	// kv_cache_demo.k:48:9
  logic        input_rdy_0_0;	// kv_cache_demo.k:48:9
  logic [7:0]  control_state_out_0;	// kv_cache_demo.k:48:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// kv_cache_demo.k:48:9
  always_comb begin	// kv_cache_demo.k:48:9
    input_rdy_0_0 = _GEN;	// kv_cache_demo.k:48:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// kv_cache_demo.k:48:9
  end // always_comb
  reg   [3:0]  p0_token_pos;	// kv_cache_demo.k:48:9
  reg   [3:0]  p0_head_id;	// kv_cache_demo.k:48:9
  reg   [6:0]  p0_dim_idx;	// kv_cache_demo.k:48:9
  reg          p0_stage1_enable = 1'h0;	// kv_cache_demo.k:48:9
  always_comb begin	// kv_cache_demo.k:48:9
    memory_read_addr_out_18_0_0 =
      {p0_token_pos[3:1], p0_head_id[3] | p0_token_pos[0], p0_head_id[2:0], p0_dim_idx};	// kv_cache_demo.k:48:9, :51:{22,31,32,63,65,66,96}
    memory_rden_out_18_0_0 = p0_stage1_enable;	// kv_cache_demo.k:48:9, :51:22
  end // always_comb
  reg          p0_stage2_enable = 1'h0;	// kv_cache_demo.k:48:9
  reg          p0_stage3_enable = 1'h0;	// kv_cache_demo.k:48:9
  reg   [7:0]  p0_memory_read_data_in_18_0;	// kv_cache_demo.k:48:9
  reg          p0_stage4_enable = 1'h0;	// kv_cache_demo.k:48:9
  always @(posedge clk) begin	// kv_cache_demo.k:48:9
    p0_token_pos <= data_in_10[3:0];	// kv_cache_demo.k:48:9
    p0_head_id <= data_in_10[7:4];	// kv_cache_demo.k:48:9
    p0_dim_idx <= data_in_10[14:8];	// kv_cache_demo.k:48:9
    if (rst) begin	// kv_cache_demo.k:48:9
      p0_stage1_enable <= 1'h0;	// kv_cache_demo.k:48:9
      p0_stage2_enable <= 1'h0;	// kv_cache_demo.k:48:9
      p0_stage3_enable <= 1'h0;	// kv_cache_demo.k:48:9
    end
    else begin	// kv_cache_demo.k:48:9
      p0_stage1_enable <= _GEN & input_valid_0;	// kv_cache_demo.k:48:9
      p0_stage2_enable <= p0_stage1_enable;	// kv_cache_demo.k:48:9
      p0_stage3_enable <= p0_stage2_enable;	// kv_cache_demo.k:48:9
    end
    p0_memory_read_data_in_18_0 <= memory_read_data_in_18_0_0;	// kv_cache_demo.k:48:9
    if (rst)	// kv_cache_demo.k:48:9
      p0_stage4_enable <= 1'h0;	// kv_cache_demo.k:48:9
    else	// kv_cache_demo.k:48:9
      p0_stage4_enable <= p0_stage3_enable;	// kv_cache_demo.k:48:9
  end // always @(posedge)
  always_comb begin	// kv_cache_demo.k:48:9
    fifo_wren_0_0 = p0_stage4_enable;	// kv_cache_demo.k:46:5, :48:9
    fifo_data_out_0_0 = p0_memory_read_data_in_18_0;	// kv_cache_demo.k:46:5, :48:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// kv_cache_demo.k:48:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// kv_cache_demo.k:48:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  kv_cache_demoDebugView_read_vEntry kv_cache_demoDebugView_read_vEntry_instance (	// kv_cache_demo.k:46:5
    .clk        (clk),	// kv_cache_demo.k:46:5
    ._token_pos (p0_stage1_enable ? p0_token_pos : 'x),	// kv_cache_demo.k:46:5, :48:9
    ._head_id   (p0_stage1_enable ? p0_head_id : 'x),	// kv_cache_demo.k:46:5, :48:9
    ._dim_idx   (p0_stage1_enable ? p0_dim_idx : 'x),	// kv_cache_demo.k:46:5, :48:9
    .valid      (p0_stage1_enable),	// kv_cache_demo.k:48:9
    .valid_out  (/* unused */)
  );	// kv_cache_demo.k:46:5
  kv_cache_demoDebugView_read_vExit kv_cache_demoDebugView_read_vExit_instance (	// kv_cache_demo.k:46:5
    .clk          (clk),	// kv_cache_demo.k:46:5
    ._ReturnValue (p0_stage3_enable ? memory_read_data_in_18_0_0 : 'x),	// kv_cache_demo.k:46:5, :48:9
    .valid        (p0_stage3_enable),	// kv_cache_demo.k:48:9
    .valid_out    (/* unused */)
  );	// kv_cache_demo.k:46:5
  assign done_out = p0_stage4_enable;	// kv_cache_demo.k:48:9
  assign memory_read_addr_out_18_0 = memory_read_addr_out_18_0_0;	// kv_cache_demo.k:48:9
  assign memory_rden_out_18_0 = memory_rden_out_18_0_0;	// kv_cache_demo.k:48:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// kv_cache_demo.k:48:9
  assign fifo_wren_0 = fifo_wren_0_0;	// kv_cache_demo.k:48:9
  assign input_rdy_0 = input_rdy_0_0;	// kv_cache_demo.k:48:9
  assign control_state_out = control_state_out_0;	// kv_cache_demo.k:48:9
endmodule

module kv_cache_demo_read_k_BasicBlock_0(	// kv_cache_demo.k:38:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  input  wire [7:0]  memory_read_data_in_17_0,
  output wire [13:0] memory_read_addr_out_17_0,
  output wire        memory_rden_out_17_0,
  output wire [7:0]  fifo_data_out_0,
  output wire        fifo_wren_0,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [14:0] data_in_9,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  wire  [7:0]  memory_read_data_in_17_0_0 = memory_read_data_in_17_0;	// kv_cache_demo.k:38:9
  logic        done_out_0;	// kv_cache_demo.k:38:9
  logic [13:0] memory_read_addr_out_17_0_0;	// kv_cache_demo.k:38:9
  logic        memory_rden_out_17_0_0;	// kv_cache_demo.k:38:9
  logic [7:0]  fifo_data_out_0_0;	// kv_cache_demo.k:38:9
  logic        fifo_wren_0_0;	// kv_cache_demo.k:38:9
  logic        input_rdy_0_0;	// kv_cache_demo.k:38:9
  logic [7:0]  control_state_out_0;	// kv_cache_demo.k:38:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// kv_cache_demo.k:38:9
  always_comb begin	// kv_cache_demo.k:38:9
    input_rdy_0_0 = _GEN;	// kv_cache_demo.k:38:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// kv_cache_demo.k:38:9
  end // always_comb
  reg   [3:0]  p0_token_pos;	// kv_cache_demo.k:38:9
  reg   [3:0]  p0_head_id;	// kv_cache_demo.k:38:9
  reg   [6:0]  p0_dim_idx;	// kv_cache_demo.k:38:9
  reg          p0_stage1_enable = 1'h0;	// kv_cache_demo.k:38:9
  always_comb begin	// kv_cache_demo.k:38:9
    memory_read_addr_out_17_0_0 =
      {p0_token_pos[3:1], p0_head_id[3] | p0_token_pos[0], p0_head_id[2:0], p0_dim_idx};	// kv_cache_demo.k:38:9, :41:{22,31,32,63,65,66,96}
    memory_rden_out_17_0_0 = p0_stage1_enable;	// kv_cache_demo.k:38:9, :41:22
  end // always_comb
  reg          p0_stage2_enable = 1'h0;	// kv_cache_demo.k:38:9
  reg          p0_stage3_enable = 1'h0;	// kv_cache_demo.k:38:9
  reg   [7:0]  p0_memory_read_data_in_17_0;	// kv_cache_demo.k:38:9
  reg          p0_stage4_enable = 1'h0;	// kv_cache_demo.k:38:9
  always @(posedge clk) begin	// kv_cache_demo.k:38:9
    p0_token_pos <= data_in_9[3:0];	// kv_cache_demo.k:38:9
    p0_head_id <= data_in_9[7:4];	// kv_cache_demo.k:38:9
    p0_dim_idx <= data_in_9[14:8];	// kv_cache_demo.k:38:9
    if (rst) begin	// kv_cache_demo.k:38:9
      p0_stage1_enable <= 1'h0;	// kv_cache_demo.k:38:9
      p0_stage2_enable <= 1'h0;	// kv_cache_demo.k:38:9
      p0_stage3_enable <= 1'h0;	// kv_cache_demo.k:38:9
    end
    else begin	// kv_cache_demo.k:38:9
      p0_stage1_enable <= _GEN & input_valid_0;	// kv_cache_demo.k:38:9
      p0_stage2_enable <= p0_stage1_enable;	// kv_cache_demo.k:38:9
      p0_stage3_enable <= p0_stage2_enable;	// kv_cache_demo.k:38:9
    end
    p0_memory_read_data_in_17_0 <= memory_read_data_in_17_0_0;	// kv_cache_demo.k:38:9
    if (rst)	// kv_cache_demo.k:38:9
      p0_stage4_enable <= 1'h0;	// kv_cache_demo.k:38:9
    else	// kv_cache_demo.k:38:9
      p0_stage4_enable <= p0_stage3_enable;	// kv_cache_demo.k:38:9
  end // always @(posedge)
  always_comb begin	// kv_cache_demo.k:38:9
    fifo_wren_0_0 = p0_stage4_enable;	// kv_cache_demo.k:36:5, :38:9
    fifo_data_out_0_0 = p0_memory_read_data_in_17_0;	// kv_cache_demo.k:36:5, :38:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// kv_cache_demo.k:38:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// kv_cache_demo.k:38:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  kv_cache_demoDebugView_read_kEntry kv_cache_demoDebugView_read_kEntry_instance (	// kv_cache_demo.k:36:5
    .clk        (clk),	// kv_cache_demo.k:36:5
    ._token_pos (p0_stage1_enable ? p0_token_pos : 'x),	// kv_cache_demo.k:36:5, :38:9
    ._head_id   (p0_stage1_enable ? p0_head_id : 'x),	// kv_cache_demo.k:36:5, :38:9
    ._dim_idx   (p0_stage1_enable ? p0_dim_idx : 'x),	// kv_cache_demo.k:36:5, :38:9
    .valid      (p0_stage1_enable),	// kv_cache_demo.k:38:9
    .valid_out  (/* unused */)
  );	// kv_cache_demo.k:36:5
  kv_cache_demoDebugView_read_kExit kv_cache_demoDebugView_read_kExit_instance (	// kv_cache_demo.k:36:5
    .clk          (clk),	// kv_cache_demo.k:36:5
    ._ReturnValue (p0_stage3_enable ? memory_read_data_in_17_0_0 : 'x),	// kv_cache_demo.k:36:5, :38:9
    .valid        (p0_stage3_enable),	// kv_cache_demo.k:38:9
    .valid_out    (/* unused */)
  );	// kv_cache_demo.k:36:5
  assign done_out = p0_stage4_enable;	// kv_cache_demo.k:38:9
  assign memory_read_addr_out_17_0 = memory_read_addr_out_17_0_0;	// kv_cache_demo.k:38:9
  assign memory_rden_out_17_0 = memory_rden_out_17_0_0;	// kv_cache_demo.k:38:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// kv_cache_demo.k:38:9
  assign fifo_wren_0 = fifo_wren_0_0;	// kv_cache_demo.k:38:9
  assign input_rdy_0 = input_rdy_0_0;	// kv_cache_demo.k:38:9
  assign control_state_out = control_state_out_0;	// kv_cache_demo.k:38:9
endmodule

module kv_cache_demo_append_v_BasicBlock_0(	// kv_cache_demo.k:30:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  output wire [7:0]  memory_write_data_out_18_0,
  output wire [13:0] memory_write_addr_out_18_0,
  output wire        memory_wren_18_0,
  output wire        fifo_wren_0,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [22:0] data_in_8,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  logic        done_out_0;	// kv_cache_demo.k:30:9
  logic [7:0]  memory_write_data_out_18_0_0;	// kv_cache_demo.k:30:9
  logic [13:0] memory_write_addr_out_18_0_0;	// kv_cache_demo.k:30:9
  logic        memory_wren_18_0_0;	// kv_cache_demo.k:30:9
  logic        fifo_wren_0_0;	// kv_cache_demo.k:30:9
  logic        input_rdy_0_0;	// kv_cache_demo.k:30:9
  logic [7:0]  control_state_out_0;	// kv_cache_demo.k:30:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// kv_cache_demo.k:30:9
  always_comb begin	// kv_cache_demo.k:30:9
    input_rdy_0_0 = _GEN;	// kv_cache_demo.k:30:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// kv_cache_demo.k:30:9
  end // always_comb
  reg   [3:0]  p0_token_pos;	// kv_cache_demo.k:30:9
  reg   [3:0]  p0_head_id;	// kv_cache_demo.k:30:9
  reg   [6:0]  p0_dim_idx;	// kv_cache_demo.k:30:9
  reg   [7:0]  p0_value;	// kv_cache_demo.k:30:9
  reg          p0_stage1_enable = 1'h0;	// kv_cache_demo.k:30:9
  always_comb begin	// kv_cache_demo.k:30:9
    memory_wren_18_0_0 = p0_stage1_enable;	// kv_cache_demo.k:30:9, :32:13
    memory_write_addr_out_18_0_0 =
      {p0_token_pos[3:1], p0_head_id[3] | p0_token_pos[0], p0_head_id[2:0], p0_dim_idx};	// kv_cache_demo.k:30:9, :32:{13,22,23,54,56,57,87}
    memory_write_data_out_18_0_0 = p0_value;	// kv_cache_demo.k:30:9, :32:13
  end // always_comb
  reg          p0_stage2_enable = 1'h0;	// kv_cache_demo.k:30:9
  reg          p0_stage3_enable = 1'h0;	// kv_cache_demo.k:30:9
  always @(posedge clk) begin	// kv_cache_demo.k:30:9
    p0_token_pos <= data_in_8[3:0];	// kv_cache_demo.k:30:9
    p0_head_id <= data_in_8[7:4];	// kv_cache_demo.k:30:9
    p0_dim_idx <= data_in_8[14:8];	// kv_cache_demo.k:30:9
    p0_value <= data_in_8[22:15];	// kv_cache_demo.k:30:9
    if (rst) begin	// kv_cache_demo.k:30:9
      p0_stage1_enable <= 1'h0;	// kv_cache_demo.k:30:9
      p0_stage2_enable <= 1'h0;	// kv_cache_demo.k:30:9
      p0_stage3_enable <= 1'h0;	// kv_cache_demo.k:30:9
    end
    else begin	// kv_cache_demo.k:30:9
      p0_stage1_enable <= _GEN & input_valid_0;	// kv_cache_demo.k:30:9
      p0_stage2_enable <= p0_stage1_enable;	// kv_cache_demo.k:30:9
      p0_stage3_enable <= p0_stage2_enable;	// kv_cache_demo.k:30:9
    end
  end // always @(posedge)
  always_comb	// kv_cache_demo.k:30:9
    fifo_wren_0_0 = p0_stage3_enable;	// kv_cache_demo.k:30:9, :34:9
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// kv_cache_demo.k:30:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// kv_cache_demo.k:30:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  kv_cache_demoDebugView_append_vEntry kv_cache_demoDebugView_append_vEntry_instance (	// kv_cache_demo.k:34:9
    .clk        (clk),	// kv_cache_demo.k:34:9
    ._token_pos (p0_stage1_enable ? p0_token_pos : 'x),	// kv_cache_demo.k:30:9, :34:9
    ._head_id   (p0_stage1_enable ? p0_head_id : 'x),	// kv_cache_demo.k:30:9, :34:9
    ._dim_idx   (p0_stage1_enable ? p0_dim_idx : 'x),	// kv_cache_demo.k:30:9, :34:9
    ._value     (p0_stage1_enable ? p0_value : 'x),	// kv_cache_demo.k:30:9, :34:9
    .valid      (p0_stage1_enable),	// kv_cache_demo.k:30:9
    .valid_out  (/* unused */)
  );	// kv_cache_demo.k:34:9
  assign done_out = p0_stage3_enable;	// kv_cache_demo.k:30:9
  assign memory_write_data_out_18_0 = memory_write_data_out_18_0_0;	// kv_cache_demo.k:30:9
  assign memory_write_addr_out_18_0 = memory_write_addr_out_18_0_0;	// kv_cache_demo.k:30:9
  assign memory_wren_18_0 = memory_wren_18_0_0;	// kv_cache_demo.k:30:9
  assign fifo_wren_0 = fifo_wren_0_0;	// kv_cache_demo.k:30:9
  assign input_rdy_0 = input_rdy_0_0;	// kv_cache_demo.k:30:9
  assign control_state_out = control_state_out_0;	// kv_cache_demo.k:30:9
endmodule

module kv_cache_demo_append_k_BasicBlock_0(	// kv_cache_demo.k:22:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  output wire [7:0]  memory_write_data_out_17_0,
  output wire [13:0] memory_write_addr_out_17_0,
  output wire        memory_wren_17_0,
  output wire        fifo_wren_0,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [22:0] data_in_7,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  logic        done_out_0;	// kv_cache_demo.k:22:9
  logic [7:0]  memory_write_data_out_17_0_0;	// kv_cache_demo.k:22:9
  logic [13:0] memory_write_addr_out_17_0_0;	// kv_cache_demo.k:22:9
  logic        memory_wren_17_0_0;	// kv_cache_demo.k:22:9
  logic        fifo_wren_0_0;	// kv_cache_demo.k:22:9
  logic        input_rdy_0_0;	// kv_cache_demo.k:22:9
  logic [7:0]  control_state_out_0;	// kv_cache_demo.k:22:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// kv_cache_demo.k:22:9
  always_comb begin	// kv_cache_demo.k:22:9
    input_rdy_0_0 = _GEN;	// kv_cache_demo.k:22:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// kv_cache_demo.k:22:9
  end // always_comb
  reg   [3:0]  p0_token_pos;	// kv_cache_demo.k:22:9
  reg   [3:0]  p0_head_id;	// kv_cache_demo.k:22:9
  reg   [6:0]  p0_dim_idx;	// kv_cache_demo.k:22:9
  reg   [7:0]  p0_value;	// kv_cache_demo.k:22:9
  reg          p0_stage1_enable = 1'h0;	// kv_cache_demo.k:22:9
  always_comb begin	// kv_cache_demo.k:22:9
    memory_wren_17_0_0 = p0_stage1_enable;	// kv_cache_demo.k:22:9, :24:13
    memory_write_addr_out_17_0_0 =
      {p0_token_pos[3:1], p0_head_id[3] | p0_token_pos[0], p0_head_id[2:0], p0_dim_idx};	// kv_cache_demo.k:22:9, :24:{13,22,23,54,56,57,87}
    memory_write_data_out_17_0_0 = p0_value;	// kv_cache_demo.k:22:9, :24:13
  end // always_comb
  reg          p0_stage2_enable = 1'h0;	// kv_cache_demo.k:22:9
  reg          p0_stage3_enable = 1'h0;	// kv_cache_demo.k:22:9
  always @(posedge clk) begin	// kv_cache_demo.k:22:9
    p0_token_pos <= data_in_7[3:0];	// kv_cache_demo.k:22:9
    p0_head_id <= data_in_7[7:4];	// kv_cache_demo.k:22:9
    p0_dim_idx <= data_in_7[14:8];	// kv_cache_demo.k:22:9
    p0_value <= data_in_7[22:15];	// kv_cache_demo.k:22:9
    if (rst) begin	// kv_cache_demo.k:22:9
      p0_stage1_enable <= 1'h0;	// kv_cache_demo.k:22:9
      p0_stage2_enable <= 1'h0;	// kv_cache_demo.k:22:9
      p0_stage3_enable <= 1'h0;	// kv_cache_demo.k:22:9
    end
    else begin	// kv_cache_demo.k:22:9
      p0_stage1_enable <= _GEN & input_valid_0;	// kv_cache_demo.k:22:9
      p0_stage2_enable <= p0_stage1_enable;	// kv_cache_demo.k:22:9
      p0_stage3_enable <= p0_stage2_enable;	// kv_cache_demo.k:22:9
    end
  end // always @(posedge)
  always_comb	// kv_cache_demo.k:22:9
    fifo_wren_0_0 = p0_stage3_enable;	// kv_cache_demo.k:22:9, :26:9
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// kv_cache_demo.k:22:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// kv_cache_demo.k:22:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  kv_cache_demoDebugView_append_kEntry kv_cache_demoDebugView_append_kEntry_instance (	// kv_cache_demo.k:26:9
    .clk        (clk),	// kv_cache_demo.k:26:9
    ._token_pos (p0_stage1_enable ? p0_token_pos : 'x),	// kv_cache_demo.k:22:9, :26:9
    ._head_id   (p0_stage1_enable ? p0_head_id : 'x),	// kv_cache_demo.k:22:9, :26:9
    ._dim_idx   (p0_stage1_enable ? p0_dim_idx : 'x),	// kv_cache_demo.k:22:9, :26:9
    ._value     (p0_stage1_enable ? p0_value : 'x),	// kv_cache_demo.k:22:9, :26:9
    .valid      (p0_stage1_enable),	// kv_cache_demo.k:22:9
    .valid_out  (/* unused */)
  );	// kv_cache_demo.k:26:9
  assign done_out = p0_stage3_enable;	// kv_cache_demo.k:22:9
  assign memory_write_data_out_17_0 = memory_write_data_out_17_0_0;	// kv_cache_demo.k:22:9
  assign memory_write_addr_out_17_0 = memory_write_addr_out_17_0_0;	// kv_cache_demo.k:22:9
  assign memory_wren_17_0 = memory_wren_17_0_0;	// kv_cache_demo.k:22:9
  assign fifo_wren_0 = fifo_wren_0_0;	// kv_cache_demo.k:22:9
  assign input_rdy_0 = input_rdy_0_0;	// kv_cache_demo.k:22:9
  assign control_state_out = control_state_out_0;	// kv_cache_demo.k:22:9
endmodule

module kv_cache_demo_reg_5_w2_v_1_5_0_i_5_0(
  input  wire       clk,
  input  wire       rst,
  input  wire       input_valid_0,
  input  wire [4:0] input_0,
  input  wire       input_valid_1,
  output wire [4:0] value_out
);

  reg [4:0] value;
  always @(posedge clk) begin
    if (rst)
      value <= 5'h0;
    else
      value <= input_valid_1 ? 5'h0 : input_valid_0 ? input_0 : value;
  end // always @(posedge)
  assign value_out = value;
endmodule

module kv_cache_demo__k_store__mem_container(	// kv_cache_demo.k:13:5
  input  wire        clk,
  input  wire        rst,
  input  wire        rden_in_0,
  input  wire [13:0] read_addr_in_0,
  input  wire        wren_in_0,
  input  wire [13:0] write_addr_in_0,
  input  wire [7:0]  write_data_in_0,
  output wire [7:0]  read_data_out_0,
  output wire        init_completed
);

  wire [1:0][7:0] ___k_store_0_data_out;	// kv_cache_demo.k:13:5
  KanagawaSyncRam #(
    .DATA_WIDTH(8),
    .ADDR_WIDTH(14),
    .DEPTH(16384),
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
  ) __k_store_0 (	// kv_cache_demo.k:13:5
    .clk            (clk),	// kv_cache_demo.k:13:5
    .rst            (rst),
    .addr_in        ({{read_addr_in_0}, {write_addr_in_0}}),	// kv_cache_demo.k:13:5
    .ecc_status_out (/* unused */),
    .wren_in        ({{1'h0}, {wren_in_0}}),	// kv_cache_demo.k:13:5
    .data_in        ({{8'h0}, {write_data_in_0}}),	// kv_cache_demo.k:13:5
    .rden_in        ({{rden_in_0}, {1'h0}}),	// kv_cache_demo.k:13:5
    .data_out       (___k_store_0_data_out)
  );	// kv_cache_demo.k:13:5
  assign read_data_out_0 = ___k_store_0_data_out[1'h1];	// kv_cache_demo.k:13:5
  assign init_completed = 1'h1;	// kv_cache_demo.k:13:5
endmodule

module kv_cache_demo__v_store__mem_container(	// kv_cache_demo.k:14:5
  input  wire        clk,
  input  wire        rst,
  input  wire        rden_in_0,
  input  wire [13:0] read_addr_in_0,
  input  wire        wren_in_0,
  input  wire [13:0] write_addr_in_0,
  input  wire [7:0]  write_data_in_0,
  output wire [7:0]  read_data_out_0,
  output wire        init_completed
);

  wire [1:0][7:0] ___v_store_0_data_out;	// kv_cache_demo.k:14:5
  KanagawaSyncRam #(
    .DATA_WIDTH(8),
    .ADDR_WIDTH(14),
    .DEPTH(16384),
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
  ) __v_store_0 (	// kv_cache_demo.k:14:5
    .clk            (clk),	// kv_cache_demo.k:14:5
    .rst            (rst),
    .addr_in        ({{read_addr_in_0}, {write_addr_in_0}}),	// kv_cache_demo.k:14:5
    .ecc_status_out (/* unused */),
    .wren_in        ({{1'h0}, {wren_in_0}}),	// kv_cache_demo.k:14:5
    .data_in        ({{8'h0}, {write_data_in_0}}),	// kv_cache_demo.k:14:5
    .rden_in        ({{rden_in_0}, {1'h0}}),	// kv_cache_demo.k:14:5
    .data_out       (___v_store_0_data_out)
  );	// kv_cache_demo.k:14:5
  assign read_data_out_0 = ___v_store_0_data_out[1'h1];	// kv_cache_demo.k:14:5
  assign init_completed = 1'h1;	// kv_cache_demo.k:14:5
endmodule

module kv_cache_demo(
  input  wire       clk,
  input  wire       rst,
  input  wire       append_k_valid_in,
  input  wire [3:0] append_k_token_pos_in,
  input  wire [3:0] append_k_head_id_in,
  input  wire [6:0] append_k_dim_idx_in,
  input  wire [7:0] append_k_value_in,
  input  wire       append_k_rden_in,
  input  wire       append_v_valid_in,
  input  wire [3:0] append_v_token_pos_in,
  input  wire [3:0] append_v_head_id_in,
  input  wire [6:0] append_v_dim_idx_in,
  input  wire [7:0] append_v_value_in,
  input  wire       append_v_rden_in,
  input  wire       read_k_valid_in,
  input  wire [3:0] read_k_token_pos_in,
  input  wire [3:0] read_k_head_id_in,
  input  wire [6:0] read_k_dim_idx_in,
  input  wire       read_k_rden_in,
  input  wire       read_v_valid_in,
  input  wire [3:0] read_v_token_pos_in,
  input  wire [3:0] read_v_head_id_in,
  input  wire [6:0] read_v_dim_idx_in,
  input  wire       read_v_rden_in,
  input  wire       advance_write_ptr_valid_in,
  input  wire       advance_write_ptr_rden_in,
  input  wire       get_seq_len_valid_in,
  input  wire       get_seq_len_rden_in,
  input  wire       reset_valid_in,
  input  wire       reset_rden_in,
  input  wire [2:0] stall_rate_in,
  input  wire       stall_rate_valid_in,
  output wire       rst_and_startup_done_out,
  output wire       append_k_rdy_out,
  output wire       append_k_empty_out,
  output wire       append_v_rdy_out,
  output wire       append_v_empty_out,
  output wire       read_k_rdy_out,
  output wire       read_k_empty_out,
  output wire [7:0] read_k_result_out,
  output wire       read_v_rdy_out,
  output wire       read_v_empty_out,
  output wire [7:0] read_v_result_out,
  output wire       advance_write_ptr_rdy_out,
  output wire       advance_write_ptr_empty_out,
  output wire       get_seq_len_rdy_out,
  output wire       get_seq_len_empty_out,
  output wire [4:0] get_seq_len_result_out,
  output wire       reset_rdy_out,
  output wire       reset_empty_out,
  output wire       stall_rate_supported_out
);

  wire        _reset_BasicBlock_0Impl_global_out__seq_len_19_1_valid;	// kv_cache_demo.k:83:9
  wire        _reset_BasicBlock_0Impl_fifo_wren_0;	// kv_cache_demo.k:83:9
  wire        _reset_BasicBlock_0Impl_input_rdy_0;	// kv_cache_demo.k:83:9
  wire [4:0]  _get_seq_len_BasicBlock_0Impl_fifo_data_out_0;	// kv_cache_demo.k:78:9
  wire        _get_seq_len_BasicBlock_0Impl_fifo_wren_0;	// kv_cache_demo.k:78:9
  wire        _get_seq_len_BasicBlock_0Impl_input_rdy_0;	// kv_cache_demo.k:78:9
  wire        _advance_write_ptr_BasicBlock_0Impl_global_out__seq_len_19_0_valid;	// kv_cache_demo.k:58:9
  wire [4:0]  _advance_write_ptr_BasicBlock_0Impl_global_out__seq_len_19_0;	// kv_cache_demo.k:58:9
  wire        _advance_write_ptr_BasicBlock_0Impl_fifo_wren_0;	// kv_cache_demo.k:58:9
  wire        _advance_write_ptr_BasicBlock_0Impl_input_rdy_0;	// kv_cache_demo.k:58:9
  wire [13:0] _read_v_BasicBlock_0Impl_memory_read_addr_out_18_0;	// kv_cache_demo.k:48:9
  wire        _read_v_BasicBlock_0Impl_memory_rden_out_18_0;	// kv_cache_demo.k:48:9
  wire [7:0]  _read_v_BasicBlock_0Impl_fifo_data_out_0;	// kv_cache_demo.k:48:9
  wire        _read_v_BasicBlock_0Impl_fifo_wren_0;	// kv_cache_demo.k:48:9
  wire        _read_v_BasicBlock_0Impl_input_rdy_0;	// kv_cache_demo.k:48:9
  wire [13:0] _read_k_BasicBlock_0Impl_memory_read_addr_out_17_0;	// kv_cache_demo.k:38:9
  wire        _read_k_BasicBlock_0Impl_memory_rden_out_17_0;	// kv_cache_demo.k:38:9
  wire [7:0]  _read_k_BasicBlock_0Impl_fifo_data_out_0;	// kv_cache_demo.k:38:9
  wire        _read_k_BasicBlock_0Impl_fifo_wren_0;	// kv_cache_demo.k:38:9
  wire        _read_k_BasicBlock_0Impl_input_rdy_0;	// kv_cache_demo.k:38:9
  wire [7:0]  _append_v_BasicBlock_0Impl_memory_write_data_out_18_0;	// kv_cache_demo.k:30:9
  wire [13:0] _append_v_BasicBlock_0Impl_memory_write_addr_out_18_0;	// kv_cache_demo.k:30:9
  wire        _append_v_BasicBlock_0Impl_memory_wren_18_0;	// kv_cache_demo.k:30:9
  wire        _append_v_BasicBlock_0Impl_fifo_wren_0;	// kv_cache_demo.k:30:9
  wire        _append_v_BasicBlock_0Impl_input_rdy_0;	// kv_cache_demo.k:30:9
  wire [7:0]  _append_k_BasicBlock_0Impl_memory_write_data_out_17_0;	// kv_cache_demo.k:22:9
  wire [13:0] _append_k_BasicBlock_0Impl_memory_write_addr_out_17_0;	// kv_cache_demo.k:22:9
  wire        _append_k_BasicBlock_0Impl_memory_wren_17_0;	// kv_cache_demo.k:22:9
  wire        _append_k_BasicBlock_0Impl_fifo_wren_0;	// kv_cache_demo.k:22:9
  wire        _append_k_BasicBlock_0Impl_input_rdy_0;	// kv_cache_demo.k:22:9
  wire        _fifo_6_reset_Return_overflow_out;
  wire        _fifo_6_reset_Return_underflow_out;
  wire        _fifo_6_reset_Return_empty;
  wire        _fifo_6_reset_Return_full;
  wire        _fifo_5_get_seq_len_Return_overflow_out;
  wire        _fifo_5_get_seq_len_Return_underflow_out;
  wire        _fifo_5_get_seq_len_Return_empty;
  wire        _fifo_5_get_seq_len_Return_full;
  wire [4:0]  _fifo_5_get_seq_len_Return_q;
  wire        _fifo_4_advance_write_ptr_Return_overflow_out;
  wire        _fifo_4_advance_write_ptr_Return_underflow_out;
  wire        _fifo_4_advance_write_ptr_Return_empty;
  wire        _fifo_4_advance_write_ptr_Return_full;
  wire        _fifo_3_read_v_Return_overflow_out;
  wire        _fifo_3_read_v_Return_underflow_out;
  wire        _fifo_3_read_v_Return_empty;
  wire        _fifo_3_read_v_Return_full;
  wire [7:0]  _fifo_3_read_v_Return_q;
  wire        _fifo_2_read_k_Return_overflow_out;
  wire        _fifo_2_read_k_Return_underflow_out;
  wire        _fifo_2_read_k_Return_empty;
  wire        _fifo_2_read_k_Return_full;
  wire [7:0]  _fifo_2_read_k_Return_q;
  wire        _fifo_1_append_v_Return_overflow_out;
  wire        _fifo_1_append_v_Return_underflow_out;
  wire        _fifo_1_append_v_Return_empty;
  wire        _fifo_1_append_v_Return_full;
  wire        _fifo_0_append_k_Return_overflow_out;
  wire        _fifo_0_append_k_Return_underflow_out;
  wire        _fifo_0_append_k_Return_empty;
  wire        _fifo_0_append_k_Return_full;
  wire        _has_startup_completed_delayed_6_delay_chain_data_out;
  wire        _has_startup_completed_delayed_5_delay_chain_data_out;
  wire        _has_startup_completed_delayed_4_delay_chain_data_out;
  wire        _has_startup_completed_delayed_3_delay_chain_data_out;
  wire        _has_startup_completed_delayed_2_delay_chain_data_out;
  wire        _has_startup_completed_delayed_1_delay_chain_data_out;
  wire        _has_startup_completed_delayed_0_delay_chain_data_out;
  wire [4:0]  __seq_len_value_out;	// kv_cache_demo.k:17:5
  wire [7:0]  __v_store_read_data_out_0;	// kv_cache_demo.k:14:5
  wire        __v_store_init_completed;	// kv_cache_demo.k:14:5
  wire [7:0]  __k_store_read_data_out_0;	// kv_cache_demo.k:13:5
  wire        __k_store_init_completed;	// kv_cache_demo.k:13:5
  wire        _reset_control_rst_and_startup_done_out;
  wire [14:0] _reset_control_rst_delayed_out;
  wire        _reset_control_reset_sequence_finished_this_cycle_out;
  logic  stall_rate_supported_out_net;
  logic  reset_empty_out_net;
  logic  reset_rdy_out_net;
  logic  get_seq_len_empty_out_net;
  logic [4:0] get_seq_len_result_out_net;
  logic  get_seq_len_rdy_out_net;
  logic  advance_write_ptr_empty_out_net;
  logic  advance_write_ptr_rdy_out_net;
  logic  read_v_empty_out_net;
  logic [7:0] read_v_result_out_net;
  logic  read_v_rdy_out_net;
  logic  read_k_empty_out_net;
  logic [7:0] read_k_result_out_net;
  logic  read_k_rdy_out_net;
  logic  append_v_empty_out_net;
  logic  append_v_rdy_out_net;
  logic  append_k_empty_out_net;
  logic  append_k_rdy_out_net;
  logic  rst_and_startup_done_out_net;

  logic [31:0] dropped_commands;
  //synopsys translate_off
  KanagawaStringTable string_table(.clk(clk));
  //synopsys translate_on
  logic [14:0] reg_rst_delayed;
  logic combined_reset;
  assign combined_reset = rst;
  logic reset_sequence_finished_this_cycle;
  logic has_startup_completed_raw;
  logic has_mem_init_completed;
  wire        _GEN =
    has_startup_completed_raw & __k_store_init_completed & __v_store_init_completed;	// kv_cache_demo.k:13:5, :14:5
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
      logic [7:0] data_in;
      logic [7:0] data_out;
      logic overflow;
      logic underflow;
  } fifo_data_2;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [7:0] data_in;
      logic [7:0] data_out;
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
      logic [4:0] data_in;
      logic [4:0] data_out;
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
      logic [22:0] data;
      logic underflow;
  } passthrough_data_7;
  assign passthrough_data_7.underflow = 1'b0;
  assign passthrough_data_7.rdy_ext = passthrough_data_7.rdy_int & !(!has_startup_completed_delayed_0);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [22:0] data;
      logic underflow;
  } passthrough_data_8;
  assign passthrough_data_8.underflow = 1'b0;
  assign passthrough_data_8.rdy_ext = passthrough_data_8.rdy_int & !(!has_startup_completed_delayed_1);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [14:0] data;
      logic underflow;
  } passthrough_data_9;
  assign passthrough_data_9.underflow = 1'b0;
  assign passthrough_data_9.rdy_ext = passthrough_data_9.rdy_int & !(!has_startup_completed_delayed_2);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [14:0] data;
      logic underflow;
  } passthrough_data_10;
  assign passthrough_data_10.underflow = 1'b0;
  assign passthrough_data_10.rdy_ext = passthrough_data_10.rdy_int & !(!has_startup_completed_delayed_3);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
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
  assign append_k_rdy_out_net = passthrough_data_7.rdy_ext;
  assign passthrough_data_7.valid = append_k_rdy_out & append_k_valid_in;
  assign passthrough_data_7.data = { append_k_value_in, append_k_dim_idx_in, append_k_head_id_in, append_k_token_pos_in };
  assign fifo_data_0.rden = append_k_rden_in;
  assign append_k_empty_out_net = fifo_data_0.empty;
  assign append_v_rdy_out_net = passthrough_data_8.rdy_ext;
  assign passthrough_data_8.valid = append_v_rdy_out & append_v_valid_in;
  assign passthrough_data_8.data = { append_v_value_in, append_v_dim_idx_in, append_v_head_id_in, append_v_token_pos_in };
  assign fifo_data_1.rden = append_v_rden_in;
  assign append_v_empty_out_net = fifo_data_1.empty;
  assign read_k_rdy_out_net = passthrough_data_9.rdy_ext;
  assign passthrough_data_9.valid = read_k_rdy_out & read_k_valid_in;
  assign passthrough_data_9.data = { read_k_dim_idx_in, read_k_head_id_in, read_k_token_pos_in };
  assign fifo_data_2.rden = read_k_rden_in;
  assign read_k_result_out_net = fifo_data_2.data_out;
  assign read_k_empty_out_net = fifo_data_2.empty;
  assign read_v_rdy_out_net = passthrough_data_10.rdy_ext;
  assign passthrough_data_10.valid = read_v_rdy_out & read_v_valid_in;
  assign passthrough_data_10.data = { read_v_dim_idx_in, read_v_head_id_in, read_v_token_pos_in };
  assign fifo_data_3.rden = read_v_rden_in;
  assign read_v_result_out_net = fifo_data_3.data_out;
  assign read_v_empty_out_net = fifo_data_3.empty;
  assign advance_write_ptr_rdy_out_net = passthrough_data_11.rdy_ext;
  assign passthrough_data_11.valid = advance_write_ptr_rdy_out & advance_write_ptr_valid_in;
  assign fifo_data_4.rden = advance_write_ptr_rden_in;
  assign advance_write_ptr_empty_out_net = fifo_data_4.empty;
  assign get_seq_len_rdy_out_net = passthrough_data_12.rdy_ext;
  assign passthrough_data_12.valid = get_seq_len_rdy_out & get_seq_len_valid_in;
  assign fifo_data_5.rden = get_seq_len_rden_in;
  assign get_seq_len_result_out_net = fifo_data_5.data_out;
  assign get_seq_len_empty_out_net = fifo_data_5.empty;
  assign reset_rdy_out_net = passthrough_data_13.rdy_ext;
  assign passthrough_data_13.valid = reset_rdy_out & reset_valid_in;
  assign fifo_data_6.rden = reset_rden_in;
  assign reset_empty_out_net = fifo_data_6.empty;
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
    fifo_data_0.overflow = _fifo_0_append_k_Return_overflow_out;
    fifo_data_0.underflow = _fifo_0_append_k_Return_underflow_out;
    fifo_data_0.empty = _fifo_0_append_k_Return_empty;
    fifo_data_0.almost_full = _fifo_0_append_k_Return_full;
    fifo_data_1.overflow = _fifo_1_append_v_Return_overflow_out;
    fifo_data_1.underflow = _fifo_1_append_v_Return_underflow_out;
    fifo_data_1.empty = _fifo_1_append_v_Return_empty;
    fifo_data_1.almost_full = _fifo_1_append_v_Return_full;
    fifo_data_2.overflow = _fifo_2_read_k_Return_overflow_out;
    fifo_data_2.underflow = _fifo_2_read_k_Return_underflow_out;
    fifo_data_2.empty = _fifo_2_read_k_Return_empty;
    fifo_data_2.almost_full = _fifo_2_read_k_Return_full;
    fifo_data_2.data_out = _fifo_2_read_k_Return_q;
    fifo_data_3.overflow = _fifo_3_read_v_Return_overflow_out;
    fifo_data_3.underflow = _fifo_3_read_v_Return_underflow_out;
    fifo_data_3.empty = _fifo_3_read_v_Return_empty;
    fifo_data_3.almost_full = _fifo_3_read_v_Return_full;
    fifo_data_3.data_out = _fifo_3_read_v_Return_q;
    fifo_data_4.overflow = _fifo_4_advance_write_ptr_Return_overflow_out;
    fifo_data_4.underflow = _fifo_4_advance_write_ptr_Return_underflow_out;
    fifo_data_4.empty = _fifo_4_advance_write_ptr_Return_empty;
    fifo_data_4.almost_full = _fifo_4_advance_write_ptr_Return_full;
    fifo_data_5.overflow = _fifo_5_get_seq_len_Return_overflow_out;
    fifo_data_5.underflow = _fifo_5_get_seq_len_Return_underflow_out;
    fifo_data_5.empty = _fifo_5_get_seq_len_Return_empty;
    fifo_data_5.almost_full = _fifo_5_get_seq_len_Return_full;
    fifo_data_5.data_out = _fifo_5_get_seq_len_Return_q;
    fifo_data_6.overflow = _fifo_6_reset_Return_overflow_out;
    fifo_data_6.underflow = _fifo_6_reset_Return_underflow_out;
    fifo_data_6.empty = _fifo_6_reset_Return_empty;
    fifo_data_6.almost_full = _fifo_6_reset_Return_full;
    fifo_data_0.wren = _append_k_BasicBlock_0Impl_fifo_wren_0;	// kv_cache_demo.k:22:9
    passthrough_data_7.rdy_int = _append_k_BasicBlock_0Impl_input_rdy_0;	// kv_cache_demo.k:22:9
    fifo_data_1.wren = _append_v_BasicBlock_0Impl_fifo_wren_0;	// kv_cache_demo.k:30:9
    passthrough_data_8.rdy_int = _append_v_BasicBlock_0Impl_input_rdy_0;	// kv_cache_demo.k:30:9
    fifo_data_2.data_in = _read_k_BasicBlock_0Impl_fifo_data_out_0;	// kv_cache_demo.k:38:9
    fifo_data_2.wren = _read_k_BasicBlock_0Impl_fifo_wren_0;	// kv_cache_demo.k:38:9
    passthrough_data_9.rdy_int = _read_k_BasicBlock_0Impl_input_rdy_0;	// kv_cache_demo.k:38:9
    fifo_data_3.data_in = _read_v_BasicBlock_0Impl_fifo_data_out_0;	// kv_cache_demo.k:48:9
    fifo_data_3.wren = _read_v_BasicBlock_0Impl_fifo_wren_0;	// kv_cache_demo.k:48:9
    passthrough_data_10.rdy_int = _read_v_BasicBlock_0Impl_input_rdy_0;	// kv_cache_demo.k:48:9
    fifo_data_4.wren = _advance_write_ptr_BasicBlock_0Impl_fifo_wren_0;	// kv_cache_demo.k:58:9
    passthrough_data_11.rdy_int = _advance_write_ptr_BasicBlock_0Impl_input_rdy_0;	// kv_cache_demo.k:58:9
    fifo_data_5.data_in = _get_seq_len_BasicBlock_0Impl_fifo_data_out_0;	// kv_cache_demo.k:78:9
    fifo_data_5.wren = _get_seq_len_BasicBlock_0Impl_fifo_wren_0;	// kv_cache_demo.k:78:9
    passthrough_data_12.rdy_int = _get_seq_len_BasicBlock_0Impl_input_rdy_0;	// kv_cache_demo.k:78:9
    fifo_data_6.wren = _reset_BasicBlock_0Impl_fifo_wren_0;	// kv_cache_demo.k:83:9
    passthrough_data_13.rdy_int = _reset_BasicBlock_0Impl_input_rdy_0;	// kv_cache_demo.k:83:9
  end // always_comb

  assign has_startup_completed_raw = 1'b1;
  assign stall_rate_supported_out_net = 1'b0;
  KanagawaResetControl #(
    .WIDTH(15),
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
  kv_cache_demo__k_store__mem_container _k_store (	// kv_cache_demo.k:13:5
    .clk             (clk),	// kv_cache_demo.k:13:5
    .rst             (1'b0),	// kv_cache_demo.k:13:5
    .rden_in_0       (_read_k_BasicBlock_0Impl_memory_rden_out_17_0),	// kv_cache_demo.k:38:9
    .read_addr_in_0  (_read_k_BasicBlock_0Impl_memory_read_addr_out_17_0),	// kv_cache_demo.k:38:9
    .wren_in_0       (_append_k_BasicBlock_0Impl_memory_wren_17_0),	// kv_cache_demo.k:22:9
    .write_addr_in_0 (_append_k_BasicBlock_0Impl_memory_write_addr_out_17_0),	// kv_cache_demo.k:22:9
    .write_data_in_0 (_append_k_BasicBlock_0Impl_memory_write_data_out_17_0),	// kv_cache_demo.k:22:9
    .read_data_out_0 (__k_store_read_data_out_0),
    .init_completed  (__k_store_init_completed)
  );	// kv_cache_demo.k:13:5
  kv_cache_demo__v_store__mem_container _v_store (	// kv_cache_demo.k:14:5
    .clk             (clk),	// kv_cache_demo.k:13:5
    .rst             (1'b0),	// kv_cache_demo.k:13:5
    .rden_in_0       (_read_v_BasicBlock_0Impl_memory_rden_out_18_0),	// kv_cache_demo.k:48:9
    .read_addr_in_0  (_read_v_BasicBlock_0Impl_memory_read_addr_out_18_0),	// kv_cache_demo.k:48:9
    .wren_in_0       (_append_v_BasicBlock_0Impl_memory_wren_18_0),	// kv_cache_demo.k:30:9
    .write_addr_in_0 (_append_v_BasicBlock_0Impl_memory_write_addr_out_18_0),	// kv_cache_demo.k:30:9
    .write_data_in_0 (_append_v_BasicBlock_0Impl_memory_write_data_out_18_0),	// kv_cache_demo.k:30:9
    .read_data_out_0 (__v_store_read_data_out_0),
    .init_completed  (__v_store_init_completed)
  );	// kv_cache_demo.k:14:5
  kv_cache_demo_reg_5_w2_v_1_5_0_i_5_0 _seq_len (	// kv_cache_demo.k:17:5
    .clk           (clk),	// kv_cache_demo.k:13:5
    .rst           (reg_rst_delayed[0]),	// kv_cache_demo.k:17:5
    .input_valid_0 (_advance_write_ptr_BasicBlock_0Impl_global_out__seq_len_19_0_valid),	// kv_cache_demo.k:58:9
    .input_0       (_advance_write_ptr_BasicBlock_0Impl_global_out__seq_len_19_0),	// kv_cache_demo.k:58:9
    .input_valid_1 (_reset_BasicBlock_0Impl_global_out__seq_len_19_1_valid),	// kv_cache_demo.k:83:9
    .value_out     (__seq_len_value_out)
  );	// kv_cache_demo.k:17:5
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
    .WIDTH(0),
    .PORT_WIDTH(1),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_0_append_k_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(4),
    .USE_LUTRAM(0)
  ) fifo_0_append_k_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[1]),
    .overflow_out  (_fifo_0_append_k_Return_overflow_out),
    .underflow_out (_fifo_0_append_k_Return_underflow_out),
    .empty         (_fifo_0_append_k_Return_empty),
    .rdreq         (fifo_data_0.rden),
    .full          (_fifo_0_append_k_Return_full),
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
    .AUTO_PIPELINE_GROUP("fifo_1_append_v_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(4),
    .USE_LUTRAM(0)
  ) fifo_1_append_v_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[2]),
    .overflow_out  (_fifo_1_append_v_Return_overflow_out),
    .underflow_out (_fifo_1_append_v_Return_underflow_out),
    .empty         (_fifo_1_append_v_Return_empty),
    .rdreq         (fifo_data_1.rden),
    .full          (_fifo_1_append_v_Return_full),
    .wrreq         (fifo_data_1.wren),
    .data          ('0),
    .q             (/* unused */)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(8),
    .PORT_WIDTH(8),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_2_read_k_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(5),
    .USE_LUTRAM(1)
  ) fifo_2_read_k_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[3]),
    .overflow_out  (_fifo_2_read_k_Return_overflow_out),
    .underflow_out (_fifo_2_read_k_Return_underflow_out),
    .empty         (_fifo_2_read_k_Return_empty),
    .rdreq         (fifo_data_2.rden),
    .full          (_fifo_2_read_k_Return_full),
    .wrreq         (fifo_data_2.wren),
    .data          (fifo_data_2.data_in),
    .q             (_fifo_2_read_k_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(8),
    .PORT_WIDTH(8),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_3_read_v_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(5),
    .USE_LUTRAM(1)
  ) fifo_3_read_v_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[4]),
    .overflow_out  (_fifo_3_read_v_Return_overflow_out),
    .underflow_out (_fifo_3_read_v_Return_underflow_out),
    .empty         (_fifo_3_read_v_Return_empty),
    .rdreq         (fifo_data_3.rden),
    .full          (_fifo_3_read_v_Return_full),
    .wrreq         (fifo_data_3.wren),
    .data          (fifo_data_3.data_in),
    .q             (_fifo_3_read_v_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(0),
    .PORT_WIDTH(1),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_4_advance_write_ptr_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(0)
  ) fifo_4_advance_write_ptr_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[5]),
    .overflow_out  (_fifo_4_advance_write_ptr_Return_overflow_out),
    .underflow_out (_fifo_4_advance_write_ptr_Return_underflow_out),
    .empty         (_fifo_4_advance_write_ptr_Return_empty),
    .rdreq         (fifo_data_4.rden),
    .full          (_fifo_4_advance_write_ptr_Return_full),
    .wrreq         (fifo_data_4.wren),
    .data          ('0),
    .q             (/* unused */)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(5),
    .PORT_WIDTH(5),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_5_get_seq_len_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(1)
  ) fifo_5_get_seq_len_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[6]),
    .overflow_out  (_fifo_5_get_seq_len_Return_overflow_out),
    .underflow_out (_fifo_5_get_seq_len_Return_underflow_out),
    .empty         (_fifo_5_get_seq_len_Return_empty),
    .rdreq         (fifo_data_5.rden),
    .full          (_fifo_5_get_seq_len_Return_full),
    .wrreq         (fifo_data_5.wren),
    .data          (fifo_data_5.data_in),
    .q             (_fifo_5_get_seq_len_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(0),
    .PORT_WIDTH(1),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_6_reset_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(0)
  ) fifo_6_reset_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[7]),
    .overflow_out  (_fifo_6_reset_Return_overflow_out),
    .underflow_out (_fifo_6_reset_Return_underflow_out),
    .empty         (_fifo_6_reset_Return_empty),
    .rdreq         (fifo_data_6.rden),
    .full          (_fifo_6_reset_Return_full),
    .wrreq         (fifo_data_6.wren),
    .data          ('0),
    .q             (/* unused */)
  );
  kv_cache_demo_append_k_BasicBlock_0 append_k_BasicBlock_0Impl (	// kv_cache_demo.k:22:9
    .clk                        (clk),	// kv_cache_demo.k:22:9
    .rst                        (reg_rst_delayed[8]),	// kv_cache_demo.k:22:9
    .done_out                   (/* unused */),
    .memory_write_data_out_17_0 (_append_k_BasicBlock_0Impl_memory_write_data_out_17_0),
    .memory_write_addr_out_17_0 (_append_k_BasicBlock_0Impl_memory_write_addr_out_17_0),
    .memory_wren_17_0           (_append_k_BasicBlock_0Impl_memory_wren_17_0),
    .fifo_wren_0                (_append_k_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0  (fifo_data_0.almost_full),	// kv_cache_demo.k:22:9
    .fifo_overflow_in_0         (fifo_data_0.overflow),	// kv_cache_demo.k:22:9
    .data_in_7                  (passthrough_data_7.data),	// kv_cache_demo.k:22:9
    .input_fifo_underflow_0     (passthrough_data_7.underflow),	// kv_cache_demo.k:22:9
    .input_rdy_0                (_append_k_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0              (passthrough_data_7.valid),	// kv_cache_demo.k:22:9
    .control_state_out          (/* unused */)
  );	// kv_cache_demo.k:22:9
  kv_cache_demo_append_v_BasicBlock_0 append_v_BasicBlock_0Impl (	// kv_cache_demo.k:30:9
    .clk                        (clk),	// kv_cache_demo.k:30:9
    .rst                        (reg_rst_delayed[9]),	// kv_cache_demo.k:30:9
    .done_out                   (/* unused */),
    .memory_write_data_out_18_0 (_append_v_BasicBlock_0Impl_memory_write_data_out_18_0),
    .memory_write_addr_out_18_0 (_append_v_BasicBlock_0Impl_memory_write_addr_out_18_0),
    .memory_wren_18_0           (_append_v_BasicBlock_0Impl_memory_wren_18_0),
    .fifo_wren_0                (_append_v_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0  (fifo_data_1.almost_full),	// kv_cache_demo.k:30:9
    .fifo_overflow_in_0         (fifo_data_1.overflow),	// kv_cache_demo.k:30:9
    .data_in_8                  (passthrough_data_8.data),	// kv_cache_demo.k:30:9
    .input_fifo_underflow_0     (passthrough_data_8.underflow),	// kv_cache_demo.k:30:9
    .input_rdy_0                (_append_v_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0              (passthrough_data_8.valid),	// kv_cache_demo.k:30:9
    .control_state_out          (/* unused */)
  );	// kv_cache_demo.k:30:9
  kv_cache_demo_read_k_BasicBlock_0 read_k_BasicBlock_0Impl (	// kv_cache_demo.k:38:9
    .clk                       (clk),	// kv_cache_demo.k:38:9
    .rst                       (reg_rst_delayed[10]),	// kv_cache_demo.k:38:9
    .done_out                  (/* unused */),
    .memory_read_data_in_17_0  (__k_store_read_data_out_0),	// kv_cache_demo.k:13:5
    .memory_read_addr_out_17_0 (_read_k_BasicBlock_0Impl_memory_read_addr_out_17_0),
    .memory_rden_out_17_0      (_read_k_BasicBlock_0Impl_memory_rden_out_17_0),
    .fifo_data_out_0           (_read_k_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0               (_read_k_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_2.almost_full),	// kv_cache_demo.k:38:9
    .fifo_overflow_in_0        (fifo_data_2.overflow),	// kv_cache_demo.k:38:9
    .data_in_9                 (passthrough_data_9.data),	// kv_cache_demo.k:38:9
    .input_fifo_underflow_0    (passthrough_data_9.underflow),	// kv_cache_demo.k:38:9
    .input_rdy_0               (_read_k_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_9.valid),	// kv_cache_demo.k:38:9
    .control_state_out         (/* unused */)
  );	// kv_cache_demo.k:38:9
  kv_cache_demo_read_v_BasicBlock_0 read_v_BasicBlock_0Impl (	// kv_cache_demo.k:48:9
    .clk                       (clk),	// kv_cache_demo.k:48:9
    .rst                       (reg_rst_delayed[11]),	// kv_cache_demo.k:48:9
    .done_out                  (/* unused */),
    .memory_read_data_in_18_0  (__v_store_read_data_out_0),	// kv_cache_demo.k:14:5
    .memory_read_addr_out_18_0 (_read_v_BasicBlock_0Impl_memory_read_addr_out_18_0),
    .memory_rden_out_18_0      (_read_v_BasicBlock_0Impl_memory_rden_out_18_0),
    .fifo_data_out_0           (_read_v_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0               (_read_v_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_3.almost_full),	// kv_cache_demo.k:48:9
    .fifo_overflow_in_0        (fifo_data_3.overflow),	// kv_cache_demo.k:48:9
    .data_in_10                (passthrough_data_10.data),	// kv_cache_demo.k:48:9
    .input_fifo_underflow_0    (passthrough_data_10.underflow),	// kv_cache_demo.k:48:9
    .input_rdy_0               (_read_v_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_10.valid),	// kv_cache_demo.k:48:9
    .control_state_out         (/* unused */)
  );	// kv_cache_demo.k:48:9
  kv_cache_demo_advance_write_ptr_BasicBlock_0 advance_write_ptr_BasicBlock_0Impl (	// kv_cache_demo.k:58:9
    .clk                            (clk),	// kv_cache_demo.k:58:9
    .rst                            (reg_rst_delayed[12]),	// kv_cache_demo.k:58:9
    .done_out                       (/* unused */),
    .global_in__seq_len_19          (__seq_len_value_out),	// kv_cache_demo.k:17:5
    .global_out__seq_len_19_0_valid
      (_advance_write_ptr_BasicBlock_0Impl_global_out__seq_len_19_0_valid),
    .global_out__seq_len_19_0
      (_advance_write_ptr_BasicBlock_0Impl_global_out__seq_len_19_0),
    .fifo_wren_0                    (_advance_write_ptr_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0      (fifo_data_4.almost_full),	// kv_cache_demo.k:58:9
    .fifo_overflow_in_0             (fifo_data_4.overflow),	// kv_cache_demo.k:58:9
    .input_fifo_underflow_0         (passthrough_data_11.underflow),	// kv_cache_demo.k:58:9
    .input_rdy_0                    (_advance_write_ptr_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0                  (passthrough_data_11.valid),	// kv_cache_demo.k:58:9
    .control_state_out              (/* unused */)
  );	// kv_cache_demo.k:58:9
  kv_cache_demo_get_seq_len_BasicBlock_0 get_seq_len_BasicBlock_0Impl (	// kv_cache_demo.k:78:9
    .clk                       (clk),	// kv_cache_demo.k:78:9
    .rst                       (reg_rst_delayed[13]),	// kv_cache_demo.k:78:9
    .done_out                  (/* unused */),
    .global_in__seq_len_19     (__seq_len_value_out),	// kv_cache_demo.k:17:5
    .fifo_data_out_0           (_get_seq_len_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0               (_get_seq_len_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_5.almost_full),	// kv_cache_demo.k:78:9
    .fifo_overflow_in_0        (fifo_data_5.overflow),	// kv_cache_demo.k:78:9
    .input_fifo_underflow_0    (passthrough_data_12.underflow),	// kv_cache_demo.k:78:9
    .input_rdy_0               (_get_seq_len_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_12.valid),	// kv_cache_demo.k:78:9
    .control_state_out         (/* unused */)
  );	// kv_cache_demo.k:78:9
  kv_cache_demo_reset_BasicBlock_0 reset_BasicBlock_0Impl (	// kv_cache_demo.k:83:9
    .clk                            (clk),	// kv_cache_demo.k:83:9
    .rst                            (reg_rst_delayed[14]),	// kv_cache_demo.k:83:9
    .done_out                       (/* unused */),
    .global_out__seq_len_19_1_valid
      (_reset_BasicBlock_0Impl_global_out__seq_len_19_1_valid),
    .fifo_wren_0                    (_reset_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0      (fifo_data_6.almost_full),	// kv_cache_demo.k:83:9
    .fifo_overflow_in_0             (fifo_data_6.overflow),	// kv_cache_demo.k:83:9
    .input_fifo_underflow_0         (passthrough_data_13.underflow),	// kv_cache_demo.k:83:9
    .input_rdy_0                    (_reset_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0                  (passthrough_data_13.valid),	// kv_cache_demo.k:83:9
    .control_state_out              (/* unused */)
  );	// kv_cache_demo.k:83:9
  assign rst_and_startup_done_out = rst_and_startup_done_out_net;
  assign append_k_rdy_out = append_k_rdy_out_net;
  assign append_k_empty_out = append_k_empty_out_net;
  assign append_v_rdy_out = append_v_rdy_out_net;
  assign append_v_empty_out = append_v_empty_out_net;
  assign read_k_rdy_out = read_k_rdy_out_net;
  assign read_k_empty_out = read_k_empty_out_net;
  assign read_k_result_out = read_k_result_out_net;
  assign read_v_rdy_out = read_v_rdy_out_net;
  assign read_v_empty_out = read_v_empty_out_net;
  assign read_v_result_out = read_v_result_out_net;
  assign advance_write_ptr_rdy_out = advance_write_ptr_rdy_out_net;
  assign advance_write_ptr_empty_out = advance_write_ptr_empty_out_net;
  assign get_seq_len_rdy_out = get_seq_len_rdy_out_net;
  assign get_seq_len_empty_out = get_seq_len_empty_out_net;
  assign get_seq_len_result_out = get_seq_len_result_out_net;
  assign reset_rdy_out = reset_rdy_out_net;
  assign reset_empty_out = reset_empty_out_net;
  assign stall_rate_supported_out = stall_rate_supported_out_net;
endmodule

module kv_cache_demo_EsiWrapper(
     input  wire                                                                                                      clk,
     input  wire                                                                                                      rst,
     input  wire [2:0]                                                                                                stall_rate_in,
     input  wire                                                                                                      stall_rate_valid_in,
  // input  wire /*Zero Width*/                                                                                       advance_write_ptr_arg,
     input  wire                                                                                                      advance_write_ptr_arg_valid,
     input  wire struct packed {logic [3:0] token_pos; logic [3:0] head_id; logic [6:0] dim_idx; logic [7:0] value; } append_k_arg,
     input  wire                                                                                                      append_k_arg_valid,
     input  wire struct packed {logic [3:0] token_pos; logic [3:0] head_id; logic [6:0] dim_idx; logic [7:0] value; } append_v_arg,
     input  wire                                                                                                      append_v_arg_valid,
  // input  wire /*Zero Width*/                                                                                       get_seq_len_arg,
     input  wire                                                                                                      get_seq_len_arg_valid,
     input  wire struct packed {logic [3:0] token_pos; logic [3:0] head_id; logic [6:0] dim_idx; }                    read_k_arg,
     input  wire                                                                                                      read_k_arg_valid,
     input  wire struct packed {logic [3:0] token_pos; logic [3:0] head_id; logic [6:0] dim_idx; }                    read_v_arg,
     input  wire                                                                                                      read_v_arg_valid,
  // input  wire /*Zero Width*/                                                                                       reset_arg,
     input  wire                                                                                                      reset_arg_valid,
     input  wire                                                                                                      advance_write_ptr_result_rden,
     input  wire                                                                                                      append_k_result_rden,
     input  wire                                                                                                      append_v_result_rden,
     input  wire                                                                                                      get_seq_len_result_rden,
     input  wire                                                                                                      read_k_result_rden,
     input  wire                                                                                                      read_v_result_rden,
     input  wire                                                                                                      reset_result_rden,
     output wire                                                                                                      advance_write_ptr_arg_ready,
     output wire                                                                                                      append_k_arg_ready,
     output wire                                                                                                      append_v_arg_ready,
     output wire                                                                                                      get_seq_len_arg_ready,
     output wire                                                                                                      read_k_arg_ready,
     output wire                                                                                                      read_v_arg_ready,
     output wire                                                                                                      reset_arg_ready,
  // output wire /*Zero Width*/                                                                                       advance_write_ptr_result,
     output wire                                                                                                      advance_write_ptr_result_empty,
  // output wire /*Zero Width*/                                                                                       append_k_result,
     output wire                                                                                                      append_k_result_empty,
  // output wire /*Zero Width*/                                                                                       append_v_result,
     output wire                                                                                                      append_v_result_empty,
     output wire [4:0]                                                                                                get_seq_len_result,
     output wire                                                                                                      get_seq_len_result_empty,
     output wire [7:0]                                                                                                read_k_result,
     output wire                                                                                                      read_k_result_empty,
     output wire [7:0]                                                                                                read_v_result,
     output wire                                                                                                      read_v_result_empty,
  // output wire /*Zero Width*/                                                                                       reset_result,
     output wire                                                                                                      reset_result_empty,
     output wire                                                                                                      rst_and_startup_done_out,
     output wire                                                                                                      stall_rate_supported_out
);

  wire [7:0] _EsiWrapped_read_k_result_out;
  wire [7:0] _EsiWrapped_read_v_result_out;
  wire [4:0] _EsiWrapped_get_seq_len_result_out;
  kv_cache_demo EsiWrapped (
    .clk                         (clk),
    .rst                         (rst),
    .append_k_valid_in           (append_k_arg_valid),
    .append_k_token_pos_in       (append_k_arg.token_pos),
    .append_k_head_id_in         (append_k_arg.head_id),
    .append_k_dim_idx_in         (append_k_arg.dim_idx),
    .append_k_value_in           (append_k_arg.value),
    .append_k_rden_in            (append_k_result_rden),
    .append_v_valid_in           (append_v_arg_valid),
    .append_v_token_pos_in       (append_v_arg.token_pos),
    .append_v_head_id_in         (append_v_arg.head_id),
    .append_v_dim_idx_in         (append_v_arg.dim_idx),
    .append_v_value_in           (append_v_arg.value),
    .append_v_rden_in            (append_v_result_rden),
    .read_k_valid_in             (read_k_arg_valid),
    .read_k_token_pos_in         (read_k_arg.token_pos),
    .read_k_head_id_in           (read_k_arg.head_id),
    .read_k_dim_idx_in           (read_k_arg.dim_idx),
    .read_k_rden_in              (read_k_result_rden),
    .read_v_valid_in             (read_v_arg_valid),
    .read_v_token_pos_in         (read_v_arg.token_pos),
    .read_v_head_id_in           (read_v_arg.head_id),
    .read_v_dim_idx_in           (read_v_arg.dim_idx),
    .read_v_rden_in              (read_v_result_rden),
    .advance_write_ptr_valid_in  (advance_write_ptr_arg_valid),
    .advance_write_ptr_rden_in   (advance_write_ptr_result_rden),
    .get_seq_len_valid_in        (get_seq_len_arg_valid),
    .get_seq_len_rden_in         (get_seq_len_result_rden),
    .reset_valid_in              (reset_arg_valid),
    .reset_rden_in               (reset_result_rden),
    .stall_rate_in               (stall_rate_in),
    .stall_rate_valid_in         (stall_rate_valid_in),
    .rst_and_startup_done_out    (rst_and_startup_done_out),
    .append_k_rdy_out            (append_k_arg_ready),
    .append_k_empty_out          (append_k_result_empty),
    .append_v_rdy_out            (append_v_arg_ready),
    .append_v_empty_out          (append_v_result_empty),
    .read_k_rdy_out              (read_k_arg_ready),
    .read_k_empty_out            (read_k_result_empty),
    .read_k_result_out           (_EsiWrapped_read_k_result_out),
    .read_v_rdy_out              (read_v_arg_ready),
    .read_v_empty_out            (read_v_result_empty),
    .read_v_result_out           (_EsiWrapped_read_v_result_out),
    .advance_write_ptr_rdy_out   (advance_write_ptr_arg_ready),
    .advance_write_ptr_empty_out (advance_write_ptr_result_empty),
    .get_seq_len_rdy_out         (get_seq_len_arg_ready),
    .get_seq_len_empty_out       (get_seq_len_result_empty),
    .get_seq_len_result_out      (_EsiWrapped_get_seq_len_result_out),
    .reset_rdy_out               (reset_arg_ready),
    .reset_empty_out             (reset_result_empty),
    .stall_rate_supported_out    (stall_rate_supported_out)
  );
  // Zero width: assign advance_write_ptr_result = /*Zero width*/;
  // Zero width: assign append_k_result = /*Zero width*/;
  // Zero width: assign append_v_result = /*Zero width*/;
  assign get_seq_len_result = _EsiWrapped_get_seq_len_result_out;
  assign read_k_result = _EsiWrapped_read_k_result_out;
  assign read_v_result = _EsiWrapped_read_v_result_out;
  // Zero width: assign reset_result = /*Zero width*/;
endmodule

