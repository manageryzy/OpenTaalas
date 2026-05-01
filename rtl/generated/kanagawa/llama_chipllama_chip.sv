
// This file was generated. Do not modify.
// kanagawa --backend=sv --import-dir=/home/mana/workspace/OpenTaalas/third-party/kanagawa/library --base-library=/home/mana/workspace/OpenTaalas/third-party/kanagawa/library/mini-base.k --output=/home/mana/workspace/OpenTaalas/rtl/generated/kanagawa/llama_chip --frequency=250 --register-ratio=8 --max-register-ratio=16 /home/mana/workspace/OpenTaalas/rtl/kanagawa/llama_chip.k

`default_nettype wire
module llama_chipDebugView_decode_startEntry
(
    input wire clk,
    input wire[16:0]  _token_id,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("decode_startEntry time: %0t token_id: %p", $time, _token_id);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module llama_chipDebugView_decode_get_stateExit
(
    input wire clk,
    input wire[5:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("decode_get_stateExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module llama_chipDebugView_decode_get_layerExit
(
    input wire clk,
    input wire[4:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("decode_get_layerExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module llama_chipDebugView_set_outputEntry
(
    input wire clk,
    input wire[16:0]  _token_id,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("set_outputEntry time: %0t token_id: %p", $time, _token_id);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module llama_chipDebugView_get_outputExit
(
    input wire clk,
    input wire[16:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("get_outputExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module llama_chipDebugView_is_idleExit
(
    input wire clk,
    input wire _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("is_idleExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module llama_chipDebugView_is_output_readyExit
(
    input wire clk,
    input wire _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("is_output_readyExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module llama_chipDebugView_get_token_countExit
(
    input wire clk,
    input wire[11:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("get_token_countExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
`ifndef _TYPESCOPE_CoreModuleTypeScope
`define _TYPESCOPE_CoreModuleTypeScope
`endif // _TYPESCOPE_CoreModuleTypeScope
module llama_chip_reset_BasicBlock_0(	// llama_chip.k:117:9
  input  wire       clk,
  input  wire       rst,
  output wire       done_out,
  output wire       global_out__state_8_2_valid,
  output wire       global_out__token_count_9_1_valid,
  output wire       global_out__output_token_10_1_valid,
  output wire       global_out__current_layer_11_2_valid,
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
  logic       done_out_0;	// llama_chip.k:117:9
  logic       global_out__state_8_2_valid_0;	// llama_chip.k:117:9
  logic       global_out__token_count_9_1_valid_0;	// llama_chip.k:117:9
  logic       global_out__output_token_10_1_valid_0;	// llama_chip.k:117:9
  logic       global_out__current_layer_11_2_valid_0;	// llama_chip.k:117:9
  logic       fifo_wren_0_0;	// llama_chip.k:117:9
  logic       input_rdy_0_0;	// llama_chip.k:117:9
  logic [7:0] control_state_out_0;	// llama_chip.k:117:9
  wire        _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// llama_chip.k:117:9
  always_comb begin	// llama_chip.k:117:9
    input_rdy_0_0 = _GEN;	// llama_chip.k:117:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// llama_chip.k:117:9
  end // always_comb
  reg         p0_stage1_enable = 1'h0;	// llama_chip.k:117:9
  always_comb begin	// llama_chip.k:117:9
    global_out__state_8_2_valid_0 = p0_stage1_enable;	// llama_chip.k:117:9
    global_out__token_count_9_1_valid_0 = p0_stage1_enable;	// llama_chip.k:117:9
    global_out__output_token_10_1_valid_0 = p0_stage1_enable;	// llama_chip.k:117:9
    global_out__current_layer_11_2_valid_0 = p0_stage1_enable;	// llama_chip.k:117:9
  end // always_comb
  reg         p0_stage2_enable = 1'h0;	// llama_chip.k:117:9
  always @(posedge clk) begin	// llama_chip.k:117:9
    if (rst) begin	// llama_chip.k:117:9
      p0_stage1_enable <= 1'h0;	// llama_chip.k:117:9
      p0_stage2_enable <= 1'h0;	// llama_chip.k:117:9
    end
    else begin	// llama_chip.k:117:9
      p0_stage1_enable <= _GEN & input_valid_0;	// llama_chip.k:117:9
      p0_stage2_enable <= p0_stage1_enable;	// llama_chip.k:117:9
    end
  end // always @(posedge)
  always_comb	// llama_chip.k:117:9
    fifo_wren_0_0 = p0_stage2_enable;	// llama_chip.k:117:9, :126:9
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// llama_chip.k:117:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// llama_chip.k:117:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  assign done_out = p0_stage2_enable;	// llama_chip.k:117:9
  assign global_out__state_8_2_valid = global_out__state_8_2_valid_0;	// llama_chip.k:117:9
  assign global_out__token_count_9_1_valid = global_out__token_count_9_1_valid_0;	// llama_chip.k:117:9
  assign global_out__output_token_10_1_valid = global_out__output_token_10_1_valid_0;	// llama_chip.k:117:9
  assign global_out__current_layer_11_2_valid = global_out__current_layer_11_2_valid_0;	// llama_chip.k:117:9
  assign fifo_wren_0 = fifo_wren_0_0;	// llama_chip.k:117:9
  assign input_rdy_0 = input_rdy_0_0;	// llama_chip.k:117:9
  assign control_state_out = control_state_out_0;	// llama_chip.k:117:9
endmodule

module llama_chip_get_token_count_BasicBlock_0(	// llama_chip.k:111:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  input  wire [11:0] global_in__token_count_9,
  output wire [11:0] fifo_data_out_0,
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
  wire  [11:0] global_in__token_count_9_0 = global_in__token_count_9;	// llama_chip.k:111:9
  logic        done_out_0;	// llama_chip.k:111:9
  logic [11:0] fifo_data_out_0_0;	// llama_chip.k:111:9
  logic        fifo_wren_0_0;	// llama_chip.k:111:9
  logic        input_rdy_0_0;	// llama_chip.k:111:9
  logic [7:0]  control_state_out_0;	// llama_chip.k:111:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// llama_chip.k:111:9
  always_comb begin	// llama_chip.k:111:9
    input_rdy_0_0 = _GEN;	// llama_chip.k:111:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// llama_chip.k:111:9
  end // always_comb
  reg          p0_stage1_enable = 1'h0;	// llama_chip.k:111:9
  reg   [11:0] p0_global_in__token_count_9;	// llama_chip.k:111:9
  reg          p0_stage2_enable = 1'h0;	// llama_chip.k:111:9
  always @(posedge clk) begin	// llama_chip.k:111:9
    if (rst)	// llama_chip.k:111:9
      p0_stage1_enable <= 1'h0;	// llama_chip.k:111:9
    else	// llama_chip.k:111:9
      p0_stage1_enable <= _GEN & input_valid_0;	// llama_chip.k:111:9
    p0_global_in__token_count_9 <= global_in__token_count_9_0;	// llama_chip.k:111:9
    if (rst)	// llama_chip.k:111:9
      p0_stage2_enable <= 1'h0;	// llama_chip.k:111:9
    else	// llama_chip.k:111:9
      p0_stage2_enable <= p0_stage1_enable;	// llama_chip.k:111:9
  end // always @(posedge)
  always_comb begin	// llama_chip.k:111:9
    fifo_wren_0_0 = p0_stage2_enable;	// llama_chip.k:109:5, :111:9
    fifo_data_out_0_0 = p0_global_in__token_count_9;	// llama_chip.k:109:5, :111:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// llama_chip.k:111:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// llama_chip.k:111:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  llama_chipDebugView_get_token_countExit llama_chipDebugView_get_token_countExit_instance (	// llama_chip.k:109:5
    .clk          (clk),	// llama_chip.k:109:5
    ._ReturnValue (p0_stage1_enable ? global_in__token_count_9_0 : 'x),	// llama_chip.k:109:5, :111:9
    .valid        (p0_stage1_enable),	// llama_chip.k:111:9
    .valid_out    (/* unused */)
  );	// llama_chip.k:109:5
  assign done_out = p0_stage2_enable;	// llama_chip.k:111:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// llama_chip.k:111:9
  assign fifo_wren_0 = fifo_wren_0_0;	// llama_chip.k:111:9
  assign input_rdy_0 = input_rdy_0_0;	// llama_chip.k:111:9
  assign control_state_out = control_state_out_0;	// llama_chip.k:111:9
endmodule

module llama_chip_is_output_ready_BasicBlock_0(	// llama_chip.k:105:9
  input  wire       clk,
  input  wire       rst,
  output wire       done_out,
  input  wire [5:0] global_in__state_8,
  output wire       fifo_data_out_0,
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
  wire  [5:0] global_in__state_8_0 = global_in__state_8;	// llama_chip.k:105:9
  logic       done_out_0;	// llama_chip.k:105:9
  logic       fifo_data_out_0_0;	// llama_chip.k:105:9
  logic       fifo_wren_0_0;	// llama_chip.k:105:9
  logic       input_rdy_0_0;	// llama_chip.k:105:9
  logic [7:0] control_state_out_0;	// llama_chip.k:105:9
  wire        _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// llama_chip.k:105:9
  always_comb begin	// llama_chip.k:105:9
    input_rdy_0_0 = _GEN;	// llama_chip.k:105:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// llama_chip.k:105:9
  end // always_comb
  reg         p0_stage1_enable = 1'h0;	// llama_chip.k:105:9
  wire        _state_eq_35_ =
    global_in__state_8_0[5] & ~(global_in__state_8_0[4]) & ~(global_in__state_8_0[3])
    & ~(global_in__state_8_0[2]) & global_in__state_8_0[1] & global_in__state_8_0[0];	// llama_chip.k:105:{9,16}
  reg         p0__state_eq_35_;	// llama_chip.k:105:9
  reg         p0_stage2_enable = 1'h0;	// llama_chip.k:105:9
  always @(posedge clk) begin	// llama_chip.k:105:9
    if (rst)	// llama_chip.k:105:9
      p0_stage1_enable <= 1'h0;	// llama_chip.k:105:9
    else	// llama_chip.k:105:9
      p0_stage1_enable <= _GEN & input_valid_0;	// llama_chip.k:105:9
    p0__state_eq_35_ <= _state_eq_35_;	// llama_chip.k:105:{9,16}
    if (rst)	// llama_chip.k:105:9
      p0_stage2_enable <= 1'h0;	// llama_chip.k:105:9
    else	// llama_chip.k:105:9
      p0_stage2_enable <= p0_stage1_enable;	// llama_chip.k:105:9
  end // always @(posedge)
  always_comb begin	// llama_chip.k:105:9
    fifo_wren_0_0 = p0_stage2_enable;	// llama_chip.k:103:5, :105:9
    fifo_data_out_0_0 = p0__state_eq_35_;	// llama_chip.k:103:5, :105:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// llama_chip.k:105:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// llama_chip.k:105:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  llama_chipDebugView_is_output_readyExit llama_chipDebugView_is_output_readyExit_instance (	// llama_chip.k:103:5
    .clk          (clk),	// llama_chip.k:103:5
    ._ReturnValue (p0_stage1_enable ? _state_eq_35_ : 'x),	// llama_chip.k:103:5, :105:{9,16}
    .valid        (p0_stage1_enable),	// llama_chip.k:105:9
    .valid_out    (/* unused */)
  );	// llama_chip.k:103:5
  assign done_out = p0_stage2_enable;	// llama_chip.k:105:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// llama_chip.k:105:9
  assign fifo_wren_0 = fifo_wren_0_0;	// llama_chip.k:105:9
  assign input_rdy_0 = input_rdy_0_0;	// llama_chip.k:105:9
  assign control_state_out = control_state_out_0;	// llama_chip.k:105:9
endmodule

module llama_chip_is_idle_BasicBlock_0(	// llama_chip.k:99:9
  input  wire       clk,
  input  wire       rst,
  output wire       done_out,
  input  wire [5:0] global_in__state_8,
  output wire       fifo_data_out_0,
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
  wire  [5:0] global_in__state_8_0 = global_in__state_8;	// llama_chip.k:99:9
  logic       done_out_0;	// llama_chip.k:99:9
  logic       fifo_data_out_0_0;	// llama_chip.k:99:9
  logic       fifo_wren_0_0;	// llama_chip.k:99:9
  logic       input_rdy_0_0;	// llama_chip.k:99:9
  logic [7:0] control_state_out_0;	// llama_chip.k:99:9
  wire        _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// llama_chip.k:99:9
  always_comb begin	// llama_chip.k:99:9
    input_rdy_0_0 = _GEN;	// llama_chip.k:99:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// llama_chip.k:99:9
  end // always_comb
  reg         p0_stage1_enable = 1'h0;	// llama_chip.k:99:9
  wire        _state_eq_0_ =
    ~(global_in__state_8_0[5]) & ~(global_in__state_8_0[4]) & ~(global_in__state_8_0[3])
    & ~(global_in__state_8_0[2]) & ~(global_in__state_8_0[1])
    & ~(global_in__state_8_0[0]);	// llama_chip.k:99:{9,16}
  reg         p0__state_eq_0_;	// llama_chip.k:99:9
  reg         p0_stage2_enable = 1'h0;	// llama_chip.k:99:9
  always @(posedge clk) begin	// llama_chip.k:99:9
    if (rst)	// llama_chip.k:99:9
      p0_stage1_enable <= 1'h0;	// llama_chip.k:99:9
    else	// llama_chip.k:99:9
      p0_stage1_enable <= _GEN & input_valid_0;	// llama_chip.k:99:9
    p0__state_eq_0_ <= _state_eq_0_;	// llama_chip.k:99:{9,16}
    if (rst)	// llama_chip.k:99:9
      p0_stage2_enable <= 1'h0;	// llama_chip.k:99:9
    else	// llama_chip.k:99:9
      p0_stage2_enable <= p0_stage1_enable;	// llama_chip.k:99:9
  end // always @(posedge)
  always_comb begin	// llama_chip.k:99:9
    fifo_wren_0_0 = p0_stage2_enable;	// llama_chip.k:97:5, :99:9
    fifo_data_out_0_0 = p0__state_eq_0_;	// llama_chip.k:97:5, :99:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// llama_chip.k:99:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// llama_chip.k:99:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  llama_chipDebugView_is_idleExit llama_chipDebugView_is_idleExit_instance (	// llama_chip.k:97:5
    .clk          (clk),	// llama_chip.k:97:5
    ._ReturnValue (p0_stage1_enable ? _state_eq_0_ : 'x),	// llama_chip.k:97:5, :99:{9,16}
    .valid        (p0_stage1_enable),	// llama_chip.k:99:9
    .valid_out    (/* unused */)
  );	// llama_chip.k:97:5
  assign done_out = p0_stage2_enable;	// llama_chip.k:99:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// llama_chip.k:99:9
  assign fifo_wren_0 = fifo_wren_0_0;	// llama_chip.k:99:9
  assign input_rdy_0 = input_rdy_0_0;	// llama_chip.k:99:9
  assign control_state_out = control_state_out_0;	// llama_chip.k:99:9
endmodule

module llama_chip_get_output_BasicBlock_0(	// llama_chip.k:93:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  input  wire [16:0] global_in__output_token_10,
  output wire [16:0] fifo_data_out_0,
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
  wire  [16:0] global_in__output_token_10_0 = global_in__output_token_10;	// llama_chip.k:93:9
  logic        done_out_0;	// llama_chip.k:93:9
  logic [16:0] fifo_data_out_0_0;	// llama_chip.k:93:9
  logic        fifo_wren_0_0;	// llama_chip.k:93:9
  logic        input_rdy_0_0;	// llama_chip.k:93:9
  logic [7:0]  control_state_out_0;	// llama_chip.k:93:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// llama_chip.k:93:9
  always_comb begin	// llama_chip.k:93:9
    input_rdy_0_0 = _GEN;	// llama_chip.k:93:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// llama_chip.k:93:9
  end // always_comb
  reg          p0_stage1_enable = 1'h0;	// llama_chip.k:93:9
  reg   [16:0] p0_global_in__output_token_10;	// llama_chip.k:93:9
  reg          p0_stage2_enable = 1'h0;	// llama_chip.k:93:9
  always @(posedge clk) begin	// llama_chip.k:93:9
    if (rst)	// llama_chip.k:93:9
      p0_stage1_enable <= 1'h0;	// llama_chip.k:93:9
    else	// llama_chip.k:93:9
      p0_stage1_enable <= _GEN & input_valid_0;	// llama_chip.k:93:9
    p0_global_in__output_token_10 <= global_in__output_token_10_0;	// llama_chip.k:93:9
    if (rst)	// llama_chip.k:93:9
      p0_stage2_enable <= 1'h0;	// llama_chip.k:93:9
    else	// llama_chip.k:93:9
      p0_stage2_enable <= p0_stage1_enable;	// llama_chip.k:93:9
  end // always @(posedge)
  always_comb begin	// llama_chip.k:93:9
    fifo_wren_0_0 = p0_stage2_enable;	// llama_chip.k:91:5, :93:9
    fifo_data_out_0_0 = p0_global_in__output_token_10;	// llama_chip.k:91:5, :93:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// llama_chip.k:93:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// llama_chip.k:93:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  llama_chipDebugView_get_outputExit llama_chipDebugView_get_outputExit_instance (	// llama_chip.k:91:5
    .clk          (clk),	// llama_chip.k:91:5
    ._ReturnValue (p0_stage1_enable ? global_in__output_token_10_0 : 'x),	// llama_chip.k:91:5, :93:9
    .valid        (p0_stage1_enable),	// llama_chip.k:93:9
    .valid_out    (/* unused */)
  );	// llama_chip.k:91:5
  assign done_out = p0_stage2_enable;	// llama_chip.k:93:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// llama_chip.k:93:9
  assign fifo_wren_0 = fifo_wren_0_0;	// llama_chip.k:93:9
  assign input_rdy_0 = input_rdy_0_0;	// llama_chip.k:93:9
  assign control_state_out = control_state_out_0;	// llama_chip.k:93:9
endmodule

module llama_chip_set_output_BasicBlock_0(	// llama_chip.k:84:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  output wire        global_out__output_token_10_0_valid,
  output wire [16:0] global_out__output_token_10_0,
  output wire        fifo_wren_0,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [16:0] data_in_14,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  logic        done_out_0;	// llama_chip.k:84:9
  logic        global_out__output_token_10_0_valid_0;	// llama_chip.k:84:9
  logic [16:0] global_out__output_token_10_0_0;	// llama_chip.k:84:9
  logic        fifo_wren_0_0;	// llama_chip.k:84:9
  logic        input_rdy_0_0;	// llama_chip.k:84:9
  logic [7:0]  control_state_out_0;	// llama_chip.k:84:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// llama_chip.k:84:9
  always_comb begin	// llama_chip.k:84:9
    input_rdy_0_0 = _GEN;	// llama_chip.k:84:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// llama_chip.k:84:9
  end // always_comb
  reg   [16:0] p0_data_in_14;	// llama_chip.k:84:9
  reg          p0_stage1_enable = 1'h0;	// llama_chip.k:84:9
  always_comb begin	// llama_chip.k:84:9
    global_out__output_token_10_0_0 = p0_data_in_14;	// llama_chip.k:84:9
    global_out__output_token_10_0_valid_0 = p0_stage1_enable;	// llama_chip.k:84:9
  end // always_comb
  reg          p0_stage2_enable = 1'h0;	// llama_chip.k:84:9
  always @(posedge clk) begin	// llama_chip.k:84:9
    p0_data_in_14 <= data_in_14;	// llama_chip.k:84:9
    if (rst) begin	// llama_chip.k:84:9
      p0_stage1_enable <= 1'h0;	// llama_chip.k:84:9
      p0_stage2_enable <= 1'h0;	// llama_chip.k:84:9
    end
    else begin	// llama_chip.k:84:9
      p0_stage1_enable <= _GEN & input_valid_0;	// llama_chip.k:84:9
      p0_stage2_enable <= p0_stage1_enable;	// llama_chip.k:84:9
    end
  end // always @(posedge)
  always_comb	// llama_chip.k:84:9
    fifo_wren_0_0 = p0_stage2_enable;	// llama_chip.k:84:9, :88:9
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// llama_chip.k:84:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// llama_chip.k:84:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  llama_chipDebugView_set_outputEntry llama_chipDebugView_set_outputEntry_instance (	// llama_chip.k:88:9
    .clk       (clk),	// llama_chip.k:88:9
    ._token_id (p0_stage1_enable ? p0_data_in_14 : 'x),	// llama_chip.k:84:9, :88:9
    .valid     (p0_stage1_enable),	// llama_chip.k:84:9
    .valid_out (/* unused */)
  );	// llama_chip.k:88:9
  assign done_out = p0_stage2_enable;	// llama_chip.k:84:9
  assign global_out__output_token_10_0_valid = global_out__output_token_10_0_valid_0;	// llama_chip.k:84:9
  assign global_out__output_token_10_0 = global_out__output_token_10_0_0;	// llama_chip.k:84:9
  assign fifo_wren_0 = fifo_wren_0_0;	// llama_chip.k:84:9
  assign input_rdy_0 = input_rdy_0_0;	// llama_chip.k:84:9
  assign control_state_out = control_state_out_0;	// llama_chip.k:84:9
endmodule

module llama_chip_decode_get_layer_BasicBlock_0(	// llama_chip.k:78:9
  input  wire       clk,
  input  wire       rst,
  output wire       done_out,
  input  wire [4:0] global_in__current_layer_11,
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
  wire  [4:0] global_in__current_layer_11_0 = global_in__current_layer_11;	// llama_chip.k:78:9
  logic       done_out_0;	// llama_chip.k:78:9
  logic [4:0] fifo_data_out_0_0;	// llama_chip.k:78:9
  logic       fifo_wren_0_0;	// llama_chip.k:78:9
  logic       input_rdy_0_0;	// llama_chip.k:78:9
  logic [7:0] control_state_out_0;	// llama_chip.k:78:9
  wire        _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// llama_chip.k:78:9
  always_comb begin	// llama_chip.k:78:9
    input_rdy_0_0 = _GEN;	// llama_chip.k:78:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// llama_chip.k:78:9
  end // always_comb
  reg         p0_stage1_enable = 1'h0;	// llama_chip.k:78:9
  reg   [4:0] p0_global_in__current_layer_11;	// llama_chip.k:78:9
  reg         p0_stage2_enable = 1'h0;	// llama_chip.k:78:9
  always @(posedge clk) begin	// llama_chip.k:78:9
    if (rst)	// llama_chip.k:78:9
      p0_stage1_enable <= 1'h0;	// llama_chip.k:78:9
    else	// llama_chip.k:78:9
      p0_stage1_enable <= _GEN & input_valid_0;	// llama_chip.k:78:9
    p0_global_in__current_layer_11 <= global_in__current_layer_11_0;	// llama_chip.k:78:9
    if (rst)	// llama_chip.k:78:9
      p0_stage2_enable <= 1'h0;	// llama_chip.k:78:9
    else	// llama_chip.k:78:9
      p0_stage2_enable <= p0_stage1_enable;	// llama_chip.k:78:9
  end // always @(posedge)
  always_comb begin	// llama_chip.k:78:9
    fifo_wren_0_0 = p0_stage2_enable;	// llama_chip.k:76:5, :78:9
    fifo_data_out_0_0 = p0_global_in__current_layer_11;	// llama_chip.k:76:5, :78:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// llama_chip.k:78:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// llama_chip.k:78:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  llama_chipDebugView_decode_get_layerExit llama_chipDebugView_decode_get_layerExit_instance (	// llama_chip.k:76:5
    .clk          (clk),	// llama_chip.k:76:5
    ._ReturnValue (p0_stage1_enable ? global_in__current_layer_11_0 : 'x),	// llama_chip.k:76:5, :78:9
    .valid        (p0_stage1_enable),	// llama_chip.k:78:9
    .valid_out    (/* unused */)
  );	// llama_chip.k:76:5
  assign done_out = p0_stage2_enable;	// llama_chip.k:78:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// llama_chip.k:78:9
  assign fifo_wren_0 = fifo_wren_0_0;	// llama_chip.k:78:9
  assign input_rdy_0 = input_rdy_0_0;	// llama_chip.k:78:9
  assign control_state_out = control_state_out_0;	// llama_chip.k:78:9
endmodule

module llama_chip_decode_get_state_BasicBlock_0(	// llama_chip.k:72:9
  input  wire       clk,
  input  wire       rst,
  output wire       done_out,
  input  wire [5:0] global_in__state_8,
  output wire [5:0] fifo_data_out_0,
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
  wire  [5:0] global_in__state_8_0 = global_in__state_8;	// llama_chip.k:72:9
  logic       done_out_0;	// llama_chip.k:72:9
  logic [5:0] fifo_data_out_0_0;	// llama_chip.k:72:9
  logic       fifo_wren_0_0;	// llama_chip.k:72:9
  logic       input_rdy_0_0;	// llama_chip.k:72:9
  logic [7:0] control_state_out_0;	// llama_chip.k:72:9
  wire        _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// llama_chip.k:72:9
  always_comb begin	// llama_chip.k:72:9
    input_rdy_0_0 = _GEN;	// llama_chip.k:72:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// llama_chip.k:72:9
  end // always_comb
  reg         p0_stage1_enable = 1'h0;	// llama_chip.k:72:9
  reg   [5:0] p0_global_in__state_8;	// llama_chip.k:72:9
  reg         p0_stage2_enable = 1'h0;	// llama_chip.k:72:9
  always @(posedge clk) begin	// llama_chip.k:72:9
    if (rst)	// llama_chip.k:72:9
      p0_stage1_enable <= 1'h0;	// llama_chip.k:72:9
    else	// llama_chip.k:72:9
      p0_stage1_enable <= _GEN & input_valid_0;	// llama_chip.k:72:9
    p0_global_in__state_8 <= global_in__state_8_0;	// llama_chip.k:72:9
    if (rst)	// llama_chip.k:72:9
      p0_stage2_enable <= 1'h0;	// llama_chip.k:72:9
    else	// llama_chip.k:72:9
      p0_stage2_enable <= p0_stage1_enable;	// llama_chip.k:72:9
  end // always @(posedge)
  always_comb begin	// llama_chip.k:72:9
    fifo_wren_0_0 = p0_stage2_enable;	// llama_chip.k:70:5, :72:9
    fifo_data_out_0_0 = p0_global_in__state_8;	// llama_chip.k:70:5, :72:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// llama_chip.k:72:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// llama_chip.k:72:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  llama_chipDebugView_decode_get_stateExit llama_chipDebugView_decode_get_stateExit_instance (	// llama_chip.k:70:5
    .clk          (clk),	// llama_chip.k:70:5
    ._ReturnValue (p0_stage1_enable ? global_in__state_8_0 : 'x),	// llama_chip.k:70:5, :72:9
    .valid        (p0_stage1_enable),	// llama_chip.k:72:9
    .valid_out    (/* unused */)
  );	// llama_chip.k:70:5
  assign done_out = p0_stage2_enable;	// llama_chip.k:72:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// llama_chip.k:72:9
  assign fifo_wren_0 = fifo_wren_0_0;	// llama_chip.k:72:9
  assign input_rdy_0 = input_rdy_0_0;	// llama_chip.k:72:9
  assign control_state_out = control_state_out_0;	// llama_chip.k:72:9
endmodule

module llama_chip_decode_advance_BasicBlock_0(	// llama_chip.k:43:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  input  wire [5:0]  global_in__state_8,
  input  wire [11:0] global_in__token_count_9,
  input  wire [4:0]  global_in__current_layer_11,
  output wire        global_out__state_8_1_valid,
  output wire [5:0]  global_out__state_8_1,
  output wire        global_out__token_count_9_0_valid,
  output wire [11:0] global_out__token_count_9_0,
  output wire        global_out__current_layer_11_1_valid,
  output wire [4:0]  global_out__current_layer_11_1,
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
  wire  [5:0]  global_in__state_8_0 = global_in__state_8;	// llama_chip.k:43:9
  wire  [11:0] global_in__token_count_9_0 = global_in__token_count_9;	// llama_chip.k:43:9
  wire  [4:0]  global_in__current_layer_11_0 = global_in__current_layer_11;	// llama_chip.k:43:9
  logic        done_out_0;	// llama_chip.k:43:9
  logic        global_out__state_8_1_valid_0;	// llama_chip.k:43:9
  logic [5:0]  global_out__state_8_1_0;	// llama_chip.k:43:9
  logic        global_out__token_count_9_0_valid_0;	// llama_chip.k:43:9
  logic [11:0] global_out__token_count_9_0_0;	// llama_chip.k:43:9
  logic        global_out__current_layer_11_1_valid_0;	// llama_chip.k:43:9
  logic [4:0]  global_out__current_layer_11_1_0;	// llama_chip.k:43:9
  logic        fifo_wren_0_0;	// llama_chip.k:43:9
  logic        input_rdy_0_0;	// llama_chip.k:43:9
  logic [7:0]  control_state_out_0;	// llama_chip.k:43:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// llama_chip.k:43:9
  always_comb begin	// llama_chip.k:43:9
    input_rdy_0_0 = _GEN;	// llama_chip.k:43:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// llama_chip.k:43:9
  end // always_comb
  reg          p0_stage1_enable = 1'h0;	// llama_chip.k:43:9
  wire         _state_eq_35_ = global_in__state_8_0 == 6'h23;	// llama_chip.k:43:9, :45:17
  wire  [5:0]  _state = _state_eq_35_ ? 6'h0 : global_in__state_8_0;	// llama_chip.k:43:9, :45:17
  always_comb begin	// llama_chip.k:43:9
    global_out__token_count_9_0_0 = 12'(global_in__token_count_9_0 + 12'h1);	// llama_chip.k:43:9, :47:32
    global_out__token_count_9_0_valid_0 = p0_stage1_enable & _state_eq_35_;	// llama_chip.k:43:9, :45:17
  end // always_comb
  always_comb begin	// llama_chip.k:43:9
    global_out__state_8_1_0 = _state_eq_35_ ? 6'h0 : 6'(_state + 6'h1);	// llama_chip.k:43:9, :45:17, :64:26
    global_out__state_8_1_valid_0 = p0_stage1_enable;	// llama_chip.k:43:9
  end // always_comb
  wire  [4:0]  CastSource = 5'(_state[4:0] - 5'h1);	// llama_chip.k:43:9, :61:56
  wire         not__state_eq_35__and__state_ge_1__and__state_le_32_ =
    ~_state_eq_35_ & (|_state) & _state < 6'h21;	// llama_chip.k:43:9, :45:{13,17}, :57:{17,21}, :59:{21,25}
  wire         _GEN_0 =
    ~_state_eq_35_ & ~not__state_eq_35__and__state_ge_1__and__state_le_32_;	// llama_chip.k:43:9, :45:17, :57:17, :59:21, :61:42
  always_comb begin	// llama_chip.k:43:9
    global_out__current_layer_11_1_0 =
      {CastSource[4]
         ? global_in__current_layer_11_0[4] & ~_state_eq_35_
           | not__state_eq_35__and__state_ge_1__and__state_le_32_
         : global_in__current_layer_11_0[4] & _GEN_0,
       CastSource[3]
         ? global_in__current_layer_11_0[3] & ~_state_eq_35_
           | not__state_eq_35__and__state_ge_1__and__state_le_32_
         : global_in__current_layer_11_0[3] & _GEN_0,
       CastSource[2]
         ? global_in__current_layer_11_0[2] & ~_state_eq_35_
           | not__state_eq_35__and__state_ge_1__and__state_le_32_
         : global_in__current_layer_11_0[2] & _GEN_0,
       CastSource[1]
         ? global_in__current_layer_11_0[1] & ~_state_eq_35_
           | not__state_eq_35__and__state_ge_1__and__state_le_32_
         : global_in__current_layer_11_0[1] & _GEN_0,
       CastSource[0]
         ? global_in__current_layer_11_0[0] & ~_state_eq_35_
           | not__state_eq_35__and__state_ge_1__and__state_le_32_
         : global_in__current_layer_11_0[0] & _GEN_0};	// llama_chip.k:43:9, :45:17, :57:17, :59:21, :61:{42,56}
    global_out__current_layer_11_1_valid_0 =
      p0_stage1_enable
      & (not__state_eq_35__and__state_ge_1__and__state_le_32_ | _state_eq_35_);	// llama_chip.k:43:9, :45:17, :57:17, :59:21
  end // always_comb
  reg          p0_stage2_enable = 1'h0;	// llama_chip.k:43:9
  always @(posedge clk) begin	// llama_chip.k:43:9
    if (rst) begin	// llama_chip.k:43:9
      p0_stage1_enable <= 1'h0;	// llama_chip.k:43:9
      p0_stage2_enable <= 1'h0;	// llama_chip.k:43:9
    end
    else begin	// llama_chip.k:43:9
      p0_stage1_enable <= _GEN & input_valid_0;	// llama_chip.k:43:9
      p0_stage2_enable <= p0_stage1_enable;	// llama_chip.k:43:9
    end
  end // always @(posedge)
  always_comb	// llama_chip.k:43:9
    fifo_wren_0_0 = p0_stage2_enable;	// llama_chip.k:43:9, :67:9
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// llama_chip.k:43:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// llama_chip.k:43:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  assign done_out = p0_stage2_enable;	// llama_chip.k:43:9
  assign global_out__state_8_1_valid = global_out__state_8_1_valid_0;	// llama_chip.k:43:9
  assign global_out__state_8_1 = global_out__state_8_1_0;	// llama_chip.k:43:9
  assign global_out__token_count_9_0_valid = global_out__token_count_9_0_valid_0;	// llama_chip.k:43:9
  assign global_out__token_count_9_0 = global_out__token_count_9_0_0;	// llama_chip.k:43:9
  assign global_out__current_layer_11_1_valid = global_out__current_layer_11_1_valid_0;	// llama_chip.k:43:9
  assign global_out__current_layer_11_1 = global_out__current_layer_11_1_0;	// llama_chip.k:43:9
  assign fifo_wren_0 = fifo_wren_0_0;	// llama_chip.k:43:9
  assign input_rdy_0 = input_rdy_0_0;	// llama_chip.k:43:9
  assign control_state_out = control_state_out_0;	// llama_chip.k:43:9
endmodule

module llama_chip_decode_start_BasicBlock_0(	// llama_chip.k:31:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  output wire        global_out__state_8_0_valid,
  output wire        global_out__current_layer_11_0_valid,
  output wire        fifo_wren_0,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [16:0] data_in_10,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  logic        done_out_0;	// llama_chip.k:31:9
  logic        global_out__state_8_0_valid_0;	// llama_chip.k:31:9
  logic        global_out__current_layer_11_0_valid_0;	// llama_chip.k:31:9
  logic        fifo_wren_0_0;	// llama_chip.k:31:9
  logic        input_rdy_0_0;	// llama_chip.k:31:9
  logic [7:0]  control_state_out_0;	// llama_chip.k:31:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// llama_chip.k:31:9
  always_comb begin	// llama_chip.k:31:9
    input_rdy_0_0 = _GEN;	// llama_chip.k:31:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// llama_chip.k:31:9
  end // always_comb
  reg   [16:0] p0_data_in_10;	// llama_chip.k:31:9
  reg          p0_stage1_enable = 1'h0;	// llama_chip.k:31:9
  always_comb begin	// llama_chip.k:31:9
    global_out__state_8_0_valid_0 = p0_stage1_enable;	// llama_chip.k:31:9
    global_out__current_layer_11_0_valid_0 = p0_stage1_enable;	// llama_chip.k:31:9
  end // always_comb
  reg          p0_stage2_enable = 1'h0;	// llama_chip.k:31:9
  always @(posedge clk) begin	// llama_chip.k:31:9
    p0_data_in_10 <= data_in_10;	// llama_chip.k:31:9
    if (rst) begin	// llama_chip.k:31:9
      p0_stage1_enable <= 1'h0;	// llama_chip.k:31:9
      p0_stage2_enable <= 1'h0;	// llama_chip.k:31:9
    end
    else begin	// llama_chip.k:31:9
      p0_stage1_enable <= _GEN & input_valid_0;	// llama_chip.k:31:9
      p0_stage2_enable <= p0_stage1_enable;	// llama_chip.k:31:9
    end
  end // always @(posedge)
  always_comb	// llama_chip.k:31:9
    fifo_wren_0_0 = p0_stage2_enable;	// llama_chip.k:31:9, :38:9
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// llama_chip.k:31:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// llama_chip.k:31:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  llama_chipDebugView_decode_startEntry llama_chipDebugView_decode_startEntry_instance (	// llama_chip.k:38:9
    .clk       (clk),	// llama_chip.k:38:9
    ._token_id (p0_stage1_enable ? p0_data_in_10 : 'x),	// llama_chip.k:31:9, :38:9
    .valid     (p0_stage1_enable),	// llama_chip.k:31:9
    .valid_out (/* unused */)
  );	// llama_chip.k:38:9
  assign done_out = p0_stage2_enable;	// llama_chip.k:31:9
  assign global_out__state_8_0_valid = global_out__state_8_0_valid_0;	// llama_chip.k:31:9
  assign global_out__current_layer_11_0_valid = global_out__current_layer_11_0_valid_0;	// llama_chip.k:31:9
  assign fifo_wren_0 = fifo_wren_0_0;	// llama_chip.k:31:9
  assign input_rdy_0 = input_rdy_0_0;	// llama_chip.k:31:9
  assign control_state_out = control_state_out_0;	// llama_chip.k:31:9
endmodule

module llama_chip_reg_6_w3_v_0_6_1_v_2_6_0_i_6_0(
  input  wire       clk,
  input  wire       rst,
  input  wire       input_valid_0,
  input  wire       input_valid_1,
  input  wire [5:0] input_1,
  input  wire       input_valid_2,
  output wire [5:0] value_out
);

  reg [5:0] value;
  always @(posedge clk) begin
    if (rst)
      value <= 6'h0;
    else
      value <=
        input_valid_2 ? 6'h0 : input_valid_1 ? input_1 : input_valid_0 ? 6'h1 : value;
  end // always @(posedge)
  assign value_out = value;
endmodule

module llama_chip_reg_12_w2_v_1_12_0_i_12_0(
  input  wire        clk,
  input  wire        rst,
  input  wire        input_valid_0,
  input  wire [11:0] input_0,
  input  wire        input_valid_1,
  output wire [11:0] value_out
);

  reg [11:0] value;
  always @(posedge clk) begin
    if (rst)
      value <= 12'h0;
    else
      value <= input_valid_1 ? 12'h0 : input_valid_0 ? input_0 : value;
  end // always @(posedge)
  assign value_out = value;
endmodule

module llama_chip_reg_17_w2_v_1_17_0_i_17_0(
  input  wire        clk,
  input  wire        rst,
  input  wire        input_valid_0,
  input  wire [16:0] input_0,
  input  wire        input_valid_1,
  output wire [16:0] value_out
);

  reg [16:0] value;
  always @(posedge clk) begin
    if (rst)
      value <= 17'h0;
    else
      value <= input_valid_1 ? 17'h0 : input_valid_0 ? input_0 : value;
  end // always @(posedge)
  assign value_out = value;
endmodule

module llama_chip_reg_5_w3_v_0_5_0_v_2_5_0_i_5_0(
  input  wire       clk,
  input  wire       rst,
  input  wire       input_valid_0,
  input  wire       input_valid_1,
  input  wire [4:0] input_1,
  input  wire       input_valid_2,
  output wire [4:0] value_out
);

  reg [4:0] value;
  always @(posedge clk) begin
    if (rst)
      value <= 5'h0;
    else
      value <=
        input_valid_2 ? 5'h0 : input_valid_1 ? input_1 : input_valid_0 ? 5'h0 : value;
  end // always @(posedge)
  assign value_out = value;
endmodule

module llama_chip(
  input  wire        clk,
  input  wire        rst,
  input  wire        decode_start_valid_in,
  input  wire [16:0] decode_start_token_id_in,
  input  wire        decode_start_rden_in,
  input  wire        decode_advance_valid_in,
  input  wire        decode_advance_rden_in,
  input  wire        decode_get_state_valid_in,
  input  wire        decode_get_state_rden_in,
  input  wire        decode_get_layer_valid_in,
  input  wire        decode_get_layer_rden_in,
  input  wire        set_output_valid_in,
  input  wire [16:0] set_output_token_id_in,
  input  wire        set_output_rden_in,
  input  wire        get_output_valid_in,
  input  wire        get_output_rden_in,
  input  wire        is_idle_valid_in,
  input  wire        is_idle_rden_in,
  input  wire        is_output_ready_valid_in,
  input  wire        is_output_ready_rden_in,
  input  wire        get_token_count_valid_in,
  input  wire        get_token_count_rden_in,
  input  wire        reset_valid_in,
  input  wire        reset_rden_in,
  input  wire [2:0]  stall_rate_in,
  input  wire        stall_rate_valid_in,
  output wire        rst_and_startup_done_out,
  output wire        decode_start_rdy_out,
  output wire        decode_start_empty_out,
  output wire        decode_advance_rdy_out,
  output wire        decode_advance_empty_out,
  output wire        decode_get_state_rdy_out,
  output wire        decode_get_state_empty_out,
  output wire [5:0]  decode_get_state_result_out,
  output wire        decode_get_layer_rdy_out,
  output wire        decode_get_layer_empty_out,
  output wire [4:0]  decode_get_layer_result_out,
  output wire        set_output_rdy_out,
  output wire        set_output_empty_out,
  output wire        get_output_rdy_out,
  output wire        get_output_empty_out,
  output wire [16:0] get_output_result_out,
  output wire        is_idle_rdy_out,
  output wire        is_idle_empty_out,
  output wire        is_idle_result_out,
  output wire        is_output_ready_rdy_out,
  output wire        is_output_ready_empty_out,
  output wire        is_output_ready_result_out,
  output wire        get_token_count_rdy_out,
  output wire        get_token_count_empty_out,
  output wire [11:0] get_token_count_result_out,
  output wire        reset_rdy_out,
  output wire        reset_empty_out,
  output wire        stall_rate_supported_out
);

  wire        _reset_BasicBlock_0Impl_global_out__state_8_2_valid;	// llama_chip.k:117:9
  wire        _reset_BasicBlock_0Impl_global_out__token_count_9_1_valid;	// llama_chip.k:117:9
  wire        _reset_BasicBlock_0Impl_global_out__output_token_10_1_valid;	// llama_chip.k:117:9
  wire        _reset_BasicBlock_0Impl_global_out__current_layer_11_2_valid;	// llama_chip.k:117:9
  wire        _reset_BasicBlock_0Impl_fifo_wren_0;	// llama_chip.k:117:9
  wire        _reset_BasicBlock_0Impl_input_rdy_0;	// llama_chip.k:117:9
  wire [11:0] _get_token_count_BasicBlock_0Impl_fifo_data_out_0;	// llama_chip.k:111:9
  wire        _get_token_count_BasicBlock_0Impl_fifo_wren_0;	// llama_chip.k:111:9
  wire        _get_token_count_BasicBlock_0Impl_input_rdy_0;	// llama_chip.k:111:9
  wire        _is_output_ready_BasicBlock_0Impl_fifo_data_out_0;	// llama_chip.k:105:9
  wire        _is_output_ready_BasicBlock_0Impl_fifo_wren_0;	// llama_chip.k:105:9
  wire        _is_output_ready_BasicBlock_0Impl_input_rdy_0;	// llama_chip.k:105:9
  wire        _is_idle_BasicBlock_0Impl_fifo_data_out_0;	// llama_chip.k:99:9
  wire        _is_idle_BasicBlock_0Impl_fifo_wren_0;	// llama_chip.k:99:9
  wire        _is_idle_BasicBlock_0Impl_input_rdy_0;	// llama_chip.k:99:9
  wire [16:0] _get_output_BasicBlock_0Impl_fifo_data_out_0;	// llama_chip.k:93:9
  wire        _get_output_BasicBlock_0Impl_fifo_wren_0;	// llama_chip.k:93:9
  wire        _get_output_BasicBlock_0Impl_input_rdy_0;	// llama_chip.k:93:9
  wire        _set_output_BasicBlock_0Impl_global_out__output_token_10_0_valid;	// llama_chip.k:84:9
  wire [16:0] _set_output_BasicBlock_0Impl_global_out__output_token_10_0;	// llama_chip.k:84:9
  wire        _set_output_BasicBlock_0Impl_fifo_wren_0;	// llama_chip.k:84:9
  wire        _set_output_BasicBlock_0Impl_input_rdy_0;	// llama_chip.k:84:9
  wire [4:0]  _decode_get_layer_BasicBlock_0Impl_fifo_data_out_0;	// llama_chip.k:78:9
  wire        _decode_get_layer_BasicBlock_0Impl_fifo_wren_0;	// llama_chip.k:78:9
  wire        _decode_get_layer_BasicBlock_0Impl_input_rdy_0;	// llama_chip.k:78:9
  wire [5:0]  _decode_get_state_BasicBlock_0Impl_fifo_data_out_0;	// llama_chip.k:72:9
  wire        _decode_get_state_BasicBlock_0Impl_fifo_wren_0;	// llama_chip.k:72:9
  wire        _decode_get_state_BasicBlock_0Impl_input_rdy_0;	// llama_chip.k:72:9
  wire        _decode_advance_BasicBlock_0Impl_global_out__state_8_1_valid;	// llama_chip.k:43:9
  wire [5:0]  _decode_advance_BasicBlock_0Impl_global_out__state_8_1;	// llama_chip.k:43:9
  wire        _decode_advance_BasicBlock_0Impl_global_out__token_count_9_0_valid;	// llama_chip.k:43:9
  wire [11:0] _decode_advance_BasicBlock_0Impl_global_out__token_count_9_0;	// llama_chip.k:43:9
  wire        _decode_advance_BasicBlock_0Impl_global_out__current_layer_11_1_valid;	// llama_chip.k:43:9
  wire [4:0]  _decode_advance_BasicBlock_0Impl_global_out__current_layer_11_1;	// llama_chip.k:43:9
  wire        _decode_advance_BasicBlock_0Impl_fifo_wren_0;	// llama_chip.k:43:9
  wire        _decode_advance_BasicBlock_0Impl_input_rdy_0;	// llama_chip.k:43:9
  wire        _decode_start_BasicBlock_0Impl_global_out__state_8_0_valid;	// llama_chip.k:31:9
  wire        _decode_start_BasicBlock_0Impl_global_out__current_layer_11_0_valid;	// llama_chip.k:31:9
  wire        _decode_start_BasicBlock_0Impl_fifo_wren_0;	// llama_chip.k:31:9
  wire        _decode_start_BasicBlock_0Impl_input_rdy_0;	// llama_chip.k:31:9
  wire        _fifo_9_reset_Return_overflow_out;
  wire        _fifo_9_reset_Return_underflow_out;
  wire        _fifo_9_reset_Return_empty;
  wire        _fifo_9_reset_Return_full;
  wire        _fifo_8_get_token_count_Return_overflow_out;
  wire        _fifo_8_get_token_count_Return_underflow_out;
  wire        _fifo_8_get_token_count_Return_empty;
  wire        _fifo_8_get_token_count_Return_full;
  wire [11:0] _fifo_8_get_token_count_Return_q;
  wire        _fifo_7_is_output_ready_Return_overflow_out;
  wire        _fifo_7_is_output_ready_Return_underflow_out;
  wire        _fifo_7_is_output_ready_Return_empty;
  wire        _fifo_7_is_output_ready_Return_full;
  wire        _fifo_7_is_output_ready_Return_q;
  wire        _fifo_6_is_idle_Return_overflow_out;
  wire        _fifo_6_is_idle_Return_underflow_out;
  wire        _fifo_6_is_idle_Return_empty;
  wire        _fifo_6_is_idle_Return_full;
  wire        _fifo_6_is_idle_Return_q;
  wire        _fifo_5_get_output_Return_overflow_out;
  wire        _fifo_5_get_output_Return_underflow_out;
  wire        _fifo_5_get_output_Return_empty;
  wire        _fifo_5_get_output_Return_full;
  wire [16:0] _fifo_5_get_output_Return_q;
  wire        _fifo_4_set_output_Return_overflow_out;
  wire        _fifo_4_set_output_Return_underflow_out;
  wire        _fifo_4_set_output_Return_empty;
  wire        _fifo_4_set_output_Return_full;
  wire        _fifo_3_decode_get_layer_Return_overflow_out;
  wire        _fifo_3_decode_get_layer_Return_underflow_out;
  wire        _fifo_3_decode_get_layer_Return_empty;
  wire        _fifo_3_decode_get_layer_Return_full;
  wire [4:0]  _fifo_3_decode_get_layer_Return_q;
  wire        _fifo_2_decode_get_state_Return_overflow_out;
  wire        _fifo_2_decode_get_state_Return_underflow_out;
  wire        _fifo_2_decode_get_state_Return_empty;
  wire        _fifo_2_decode_get_state_Return_full;
  wire [5:0]  _fifo_2_decode_get_state_Return_q;
  wire        _fifo_1_decode_advance_Return_overflow_out;
  wire        _fifo_1_decode_advance_Return_underflow_out;
  wire        _fifo_1_decode_advance_Return_empty;
  wire        _fifo_1_decode_advance_Return_full;
  wire        _fifo_0_decode_start_Return_overflow_out;
  wire        _fifo_0_decode_start_Return_underflow_out;
  wire        _fifo_0_decode_start_Return_empty;
  wire        _fifo_0_decode_start_Return_full;
  wire        _has_startup_completed_delayed_9_delay_chain_data_out;
  wire        _has_startup_completed_delayed_8_delay_chain_data_out;
  wire        _has_startup_completed_delayed_7_delay_chain_data_out;
  wire        _has_startup_completed_delayed_6_delay_chain_data_out;
  wire        _has_startup_completed_delayed_5_delay_chain_data_out;
  wire        _has_startup_completed_delayed_4_delay_chain_data_out;
  wire        _has_startup_completed_delayed_3_delay_chain_data_out;
  wire        _has_startup_completed_delayed_2_delay_chain_data_out;
  wire        _has_startup_completed_delayed_1_delay_chain_data_out;
  wire        _has_startup_completed_delayed_0_delay_chain_data_out;
  wire [4:0]  __current_layer_value_out;	// llama_chip.k:24:5
  wire [16:0] __output_token_value_out;	// llama_chip.k:23:5
  wire [11:0] __token_count_value_out;	// llama_chip.k:21:5
  wire [5:0]  __state_value_out;	// llama_chip.k:20:5
  wire        _reset_control_rst_and_startup_done_out;
  wire [23:0] _reset_control_rst_delayed_out;
  wire        _reset_control_reset_sequence_finished_this_cycle_out;
  logic  stall_rate_supported_out_net;
  logic  reset_empty_out_net;
  logic  reset_rdy_out_net;
  logic  get_token_count_empty_out_net;
  logic [11:0] get_token_count_result_out_net;
  logic  get_token_count_rdy_out_net;
  logic  is_output_ready_empty_out_net;
  logic  is_output_ready_result_out_net;
  logic  is_output_ready_rdy_out_net;
  logic  is_idle_empty_out_net;
  logic  is_idle_result_out_net;
  logic  is_idle_rdy_out_net;
  logic  get_output_empty_out_net;
  logic [16:0] get_output_result_out_net;
  logic  get_output_rdy_out_net;
  logic  set_output_empty_out_net;
  logic  set_output_rdy_out_net;
  logic  decode_get_layer_empty_out_net;
  logic [4:0] decode_get_layer_result_out_net;
  logic  decode_get_layer_rdy_out_net;
  logic  decode_get_state_empty_out_net;
  logic [5:0] decode_get_state_result_out_net;
  logic  decode_get_state_rdy_out_net;
  logic  decode_advance_empty_out_net;
  logic  decode_advance_rdy_out_net;
  logic  decode_start_empty_out_net;
  logic  decode_start_rdy_out_net;
  logic  rst_and_startup_done_out_net;

  logic [31:0] dropped_commands;
  //synopsys translate_off
  KanagawaStringTable string_table(.clk(clk));
  //synopsys translate_on
  logic [23:0] reg_rst_delayed;
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

  logic has_startup_completed_delayed_6;

  logic has_startup_completed_delayed_7;

  logic has_startup_completed_delayed_8;

  logic has_startup_completed_delayed_9;

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
      logic [5:0] data_in;
      logic [5:0] data_out;
      logic overflow;
      logic underflow;
  } fifo_data_2;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [4:0] data_in;
      logic [4:0] data_out;
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
      logic [16:0] data_in;
      logic [16:0] data_out;
      logic overflow;
      logic underflow;
  } fifo_data_5;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [0:0] data_in;
      logic [0:0] data_out;
      logic overflow;
      logic underflow;
  } fifo_data_6;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [0:0] data_in;
      logic [0:0] data_out;
      logic overflow;
      logic underflow;
  } fifo_data_7;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [11:0] data_in;
      logic [11:0] data_out;
      logic overflow;
      logic underflow;
  } fifo_data_8;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic overflow;
      logic underflow;
  } fifo_data_9;

  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [16:0] data;
      logic underflow;
  } passthrough_data_10;
  assign passthrough_data_10.underflow = 1'b0;
  assign passthrough_data_10.rdy_ext = passthrough_data_10.rdy_int & !(!has_startup_completed_delayed_0);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic underflow;
  } passthrough_data_11;
  assign passthrough_data_11.underflow = 1'b0;
  assign passthrough_data_11.rdy_ext = passthrough_data_11.rdy_int & !(!has_startup_completed_delayed_1);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic underflow;
  } passthrough_data_12;
  assign passthrough_data_12.underflow = 1'b0;
  assign passthrough_data_12.rdy_ext = passthrough_data_12.rdy_int & !(!has_startup_completed_delayed_2);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic underflow;
  } passthrough_data_13;
  assign passthrough_data_13.underflow = 1'b0;
  assign passthrough_data_13.rdy_ext = passthrough_data_13.rdy_int & !(!has_startup_completed_delayed_3);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [16:0] data;
      logic underflow;
  } passthrough_data_14;
  assign passthrough_data_14.underflow = 1'b0;
  assign passthrough_data_14.rdy_ext = passthrough_data_14.rdy_int & !(!has_startup_completed_delayed_4);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic underflow;
  } passthrough_data_15;
  assign passthrough_data_15.underflow = 1'b0;
  assign passthrough_data_15.rdy_ext = passthrough_data_15.rdy_int & !(!has_startup_completed_delayed_5);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic underflow;
  } passthrough_data_16;
  assign passthrough_data_16.underflow = 1'b0;
  assign passthrough_data_16.rdy_ext = passthrough_data_16.rdy_int & !(!has_startup_completed_delayed_6);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic underflow;
  } passthrough_data_17;
  assign passthrough_data_17.underflow = 1'b0;
  assign passthrough_data_17.rdy_ext = passthrough_data_17.rdy_int & !(!has_startup_completed_delayed_7);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic underflow;
  } passthrough_data_18;
  assign passthrough_data_18.underflow = 1'b0;
  assign passthrough_data_18.rdy_ext = passthrough_data_18.rdy_int & !(!has_startup_completed_delayed_8);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic underflow;
  } passthrough_data_19;
  assign passthrough_data_19.underflow = 1'b0;
  assign passthrough_data_19.rdy_ext = passthrough_data_19.rdy_int & !(!has_startup_completed_delayed_9);
  assign decode_start_rdy_out_net = passthrough_data_10.rdy_ext;
  assign passthrough_data_10.valid = decode_start_rdy_out & decode_start_valid_in;
  assign passthrough_data_10.data = { decode_start_token_id_in };
  assign fifo_data_0.rden = decode_start_rden_in;
  assign decode_start_empty_out_net = fifo_data_0.empty;
  assign decode_advance_rdy_out_net = passthrough_data_11.rdy_ext;
  assign passthrough_data_11.valid = decode_advance_rdy_out & decode_advance_valid_in;
  assign fifo_data_1.rden = decode_advance_rden_in;
  assign decode_advance_empty_out_net = fifo_data_1.empty;
  assign decode_get_state_rdy_out_net = passthrough_data_12.rdy_ext;
  assign passthrough_data_12.valid = decode_get_state_rdy_out & decode_get_state_valid_in;
  assign fifo_data_2.rden = decode_get_state_rden_in;
  assign decode_get_state_result_out_net = fifo_data_2.data_out;
  assign decode_get_state_empty_out_net = fifo_data_2.empty;
  assign decode_get_layer_rdy_out_net = passthrough_data_13.rdy_ext;
  assign passthrough_data_13.valid = decode_get_layer_rdy_out & decode_get_layer_valid_in;
  assign fifo_data_3.rden = decode_get_layer_rden_in;
  assign decode_get_layer_result_out_net = fifo_data_3.data_out;
  assign decode_get_layer_empty_out_net = fifo_data_3.empty;
  assign set_output_rdy_out_net = passthrough_data_14.rdy_ext;
  assign passthrough_data_14.valid = set_output_rdy_out & set_output_valid_in;
  assign passthrough_data_14.data = { set_output_token_id_in };
  assign fifo_data_4.rden = set_output_rden_in;
  assign set_output_empty_out_net = fifo_data_4.empty;
  assign get_output_rdy_out_net = passthrough_data_15.rdy_ext;
  assign passthrough_data_15.valid = get_output_rdy_out & get_output_valid_in;
  assign fifo_data_5.rden = get_output_rden_in;
  assign get_output_result_out_net = fifo_data_5.data_out;
  assign get_output_empty_out_net = fifo_data_5.empty;
  assign is_idle_rdy_out_net = passthrough_data_16.rdy_ext;
  assign passthrough_data_16.valid = is_idle_rdy_out & is_idle_valid_in;
  assign fifo_data_6.rden = is_idle_rden_in;
  assign is_idle_result_out_net = fifo_data_6.data_out;
  assign is_idle_empty_out_net = fifo_data_6.empty;
  assign is_output_ready_rdy_out_net = passthrough_data_17.rdy_ext;
  assign passthrough_data_17.valid = is_output_ready_rdy_out & is_output_ready_valid_in;
  assign fifo_data_7.rden = is_output_ready_rden_in;
  assign is_output_ready_result_out_net = fifo_data_7.data_out;
  assign is_output_ready_empty_out_net = fifo_data_7.empty;
  assign get_token_count_rdy_out_net = passthrough_data_18.rdy_ext;
  assign passthrough_data_18.valid = get_token_count_rdy_out & get_token_count_valid_in;
  assign fifo_data_8.rden = get_token_count_rden_in;
  assign get_token_count_result_out_net = fifo_data_8.data_out;
  assign get_token_count_empty_out_net = fifo_data_8.empty;
  assign reset_rdy_out_net = passthrough_data_19.rdy_ext;
  assign passthrough_data_19.valid = reset_rdy_out & reset_valid_in;
  assign fifo_data_9.rden = reset_rden_in;
  assign reset_empty_out_net = fifo_data_9.empty;
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
    fifo_data_0.overflow = _fifo_0_decode_start_Return_overflow_out;
    fifo_data_0.underflow = _fifo_0_decode_start_Return_underflow_out;
    fifo_data_0.empty = _fifo_0_decode_start_Return_empty;
    fifo_data_0.almost_full = _fifo_0_decode_start_Return_full;
    fifo_data_1.overflow = _fifo_1_decode_advance_Return_overflow_out;
    fifo_data_1.underflow = _fifo_1_decode_advance_Return_underflow_out;
    fifo_data_1.empty = _fifo_1_decode_advance_Return_empty;
    fifo_data_1.almost_full = _fifo_1_decode_advance_Return_full;
    fifo_data_2.overflow = _fifo_2_decode_get_state_Return_overflow_out;
    fifo_data_2.underflow = _fifo_2_decode_get_state_Return_underflow_out;
    fifo_data_2.empty = _fifo_2_decode_get_state_Return_empty;
    fifo_data_2.almost_full = _fifo_2_decode_get_state_Return_full;
    fifo_data_2.data_out = _fifo_2_decode_get_state_Return_q;
    fifo_data_3.overflow = _fifo_3_decode_get_layer_Return_overflow_out;
    fifo_data_3.underflow = _fifo_3_decode_get_layer_Return_underflow_out;
    fifo_data_3.empty = _fifo_3_decode_get_layer_Return_empty;
    fifo_data_3.almost_full = _fifo_3_decode_get_layer_Return_full;
    fifo_data_3.data_out = _fifo_3_decode_get_layer_Return_q;
    fifo_data_4.overflow = _fifo_4_set_output_Return_overflow_out;
    fifo_data_4.underflow = _fifo_4_set_output_Return_underflow_out;
    fifo_data_4.empty = _fifo_4_set_output_Return_empty;
    fifo_data_4.almost_full = _fifo_4_set_output_Return_full;
    fifo_data_5.overflow = _fifo_5_get_output_Return_overflow_out;
    fifo_data_5.underflow = _fifo_5_get_output_Return_underflow_out;
    fifo_data_5.empty = _fifo_5_get_output_Return_empty;
    fifo_data_5.almost_full = _fifo_5_get_output_Return_full;
    fifo_data_5.data_out = _fifo_5_get_output_Return_q;
    fifo_data_6.overflow = _fifo_6_is_idle_Return_overflow_out;
    fifo_data_6.underflow = _fifo_6_is_idle_Return_underflow_out;
    fifo_data_6.empty = _fifo_6_is_idle_Return_empty;
    fifo_data_6.almost_full = _fifo_6_is_idle_Return_full;
    fifo_data_6.data_out = _fifo_6_is_idle_Return_q;
    fifo_data_7.overflow = _fifo_7_is_output_ready_Return_overflow_out;
    fifo_data_7.underflow = _fifo_7_is_output_ready_Return_underflow_out;
    fifo_data_7.empty = _fifo_7_is_output_ready_Return_empty;
    fifo_data_7.almost_full = _fifo_7_is_output_ready_Return_full;
    fifo_data_7.data_out = _fifo_7_is_output_ready_Return_q;
    fifo_data_8.overflow = _fifo_8_get_token_count_Return_overflow_out;
    fifo_data_8.underflow = _fifo_8_get_token_count_Return_underflow_out;
    fifo_data_8.empty = _fifo_8_get_token_count_Return_empty;
    fifo_data_8.almost_full = _fifo_8_get_token_count_Return_full;
    fifo_data_8.data_out = _fifo_8_get_token_count_Return_q;
    fifo_data_9.overflow = _fifo_9_reset_Return_overflow_out;
    fifo_data_9.underflow = _fifo_9_reset_Return_underflow_out;
    fifo_data_9.empty = _fifo_9_reset_Return_empty;
    fifo_data_9.almost_full = _fifo_9_reset_Return_full;
    fifo_data_0.wren = _decode_start_BasicBlock_0Impl_fifo_wren_0;	// llama_chip.k:31:9
    passthrough_data_10.rdy_int = _decode_start_BasicBlock_0Impl_input_rdy_0;	// llama_chip.k:31:9
    fifo_data_1.wren = _decode_advance_BasicBlock_0Impl_fifo_wren_0;	// llama_chip.k:43:9
    passthrough_data_11.rdy_int = _decode_advance_BasicBlock_0Impl_input_rdy_0;	// llama_chip.k:43:9
    fifo_data_2.data_in = _decode_get_state_BasicBlock_0Impl_fifo_data_out_0;	// llama_chip.k:72:9
    fifo_data_2.wren = _decode_get_state_BasicBlock_0Impl_fifo_wren_0;	// llama_chip.k:72:9
    passthrough_data_12.rdy_int = _decode_get_state_BasicBlock_0Impl_input_rdy_0;	// llama_chip.k:72:9
    fifo_data_3.data_in = _decode_get_layer_BasicBlock_0Impl_fifo_data_out_0;	// llama_chip.k:78:9
    fifo_data_3.wren = _decode_get_layer_BasicBlock_0Impl_fifo_wren_0;	// llama_chip.k:78:9
    passthrough_data_13.rdy_int = _decode_get_layer_BasicBlock_0Impl_input_rdy_0;	// llama_chip.k:78:9
    fifo_data_4.wren = _set_output_BasicBlock_0Impl_fifo_wren_0;	// llama_chip.k:84:9
    passthrough_data_14.rdy_int = _set_output_BasicBlock_0Impl_input_rdy_0;	// llama_chip.k:84:9
    fifo_data_5.data_in = _get_output_BasicBlock_0Impl_fifo_data_out_0;	// llama_chip.k:93:9
    fifo_data_5.wren = _get_output_BasicBlock_0Impl_fifo_wren_0;	// llama_chip.k:93:9
    passthrough_data_15.rdy_int = _get_output_BasicBlock_0Impl_input_rdy_0;	// llama_chip.k:93:9
    fifo_data_6.data_in = _is_idle_BasicBlock_0Impl_fifo_data_out_0;	// llama_chip.k:99:9
    fifo_data_6.wren = _is_idle_BasicBlock_0Impl_fifo_wren_0;	// llama_chip.k:99:9
    passthrough_data_16.rdy_int = _is_idle_BasicBlock_0Impl_input_rdy_0;	// llama_chip.k:99:9
    fifo_data_7.data_in = _is_output_ready_BasicBlock_0Impl_fifo_data_out_0;	// llama_chip.k:105:9
    fifo_data_7.wren = _is_output_ready_BasicBlock_0Impl_fifo_wren_0;	// llama_chip.k:105:9
    passthrough_data_17.rdy_int = _is_output_ready_BasicBlock_0Impl_input_rdy_0;	// llama_chip.k:105:9
    fifo_data_8.data_in = _get_token_count_BasicBlock_0Impl_fifo_data_out_0;	// llama_chip.k:111:9
    fifo_data_8.wren = _get_token_count_BasicBlock_0Impl_fifo_wren_0;	// llama_chip.k:111:9
    passthrough_data_18.rdy_int = _get_token_count_BasicBlock_0Impl_input_rdy_0;	// llama_chip.k:111:9
    fifo_data_9.wren = _reset_BasicBlock_0Impl_fifo_wren_0;	// llama_chip.k:117:9
    passthrough_data_19.rdy_int = _reset_BasicBlock_0Impl_input_rdy_0;	// llama_chip.k:117:9
  end // always_comb

  assign has_startup_completed_raw = 1'b1;
  assign stall_rate_supported_out_net = 1'b0;
  KanagawaResetControl #(
    .WIDTH(24),
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
  llama_chip_reg_6_w3_v_0_6_1_v_2_6_0_i_6_0 _state (	// llama_chip.k:20:5
    .clk           (clk),	// llama_chip.k:20:5
    .rst           (reg_rst_delayed[0]),	// llama_chip.k:20:5
    .input_valid_0 (_decode_start_BasicBlock_0Impl_global_out__state_8_0_valid),	// llama_chip.k:31:9
    .input_valid_1 (_decode_advance_BasicBlock_0Impl_global_out__state_8_1_valid),	// llama_chip.k:43:9
    .input_1       (_decode_advance_BasicBlock_0Impl_global_out__state_8_1),	// llama_chip.k:43:9
    .input_valid_2 (_reset_BasicBlock_0Impl_global_out__state_8_2_valid),	// llama_chip.k:117:9
    .value_out     (__state_value_out)
  );	// llama_chip.k:20:5
  llama_chip_reg_12_w2_v_1_12_0_i_12_0 _token_count (	// llama_chip.k:21:5
    .clk           (clk),	// llama_chip.k:20:5
    .rst           (reg_rst_delayed[1]),	// llama_chip.k:21:5
    .input_valid_0 (_decode_advance_BasicBlock_0Impl_global_out__token_count_9_0_valid),	// llama_chip.k:43:9
    .input_0       (_decode_advance_BasicBlock_0Impl_global_out__token_count_9_0),	// llama_chip.k:43:9
    .input_valid_1 (_reset_BasicBlock_0Impl_global_out__token_count_9_1_valid),	// llama_chip.k:117:9
    .value_out     (__token_count_value_out)
  );	// llama_chip.k:21:5
  llama_chip_reg_17_w2_v_1_17_0_i_17_0 _output_token (	// llama_chip.k:23:5
    .clk           (clk),	// llama_chip.k:20:5
    .rst           (reg_rst_delayed[2]),	// llama_chip.k:23:5
    .input_valid_0 (_set_output_BasicBlock_0Impl_global_out__output_token_10_0_valid),	// llama_chip.k:84:9
    .input_0       (_set_output_BasicBlock_0Impl_global_out__output_token_10_0),	// llama_chip.k:84:9
    .input_valid_1 (_reset_BasicBlock_0Impl_global_out__output_token_10_1_valid),	// llama_chip.k:117:9
    .value_out     (__output_token_value_out)
  );	// llama_chip.k:23:5
  llama_chip_reg_5_w3_v_0_5_0_v_2_5_0_i_5_0 _current_layer (	// llama_chip.k:24:5
    .clk           (clk),	// llama_chip.k:20:5
    .rst           (reg_rst_delayed[3]),	// llama_chip.k:24:5
    .input_valid_0 (_decode_start_BasicBlock_0Impl_global_out__current_layer_11_0_valid),	// llama_chip.k:31:9
    .input_valid_1
      (_decode_advance_BasicBlock_0Impl_global_out__current_layer_11_1_valid),	// llama_chip.k:43:9
    .input_1       (_decode_advance_BasicBlock_0Impl_global_out__current_layer_11_1),	// llama_chip.k:43:9
    .input_valid_2 (_reset_BasicBlock_0Impl_global_out__current_layer_11_2_valid),	// llama_chip.k:117:9
    .value_out     (__current_layer_value_out)
  );	// llama_chip.k:24:5
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
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(0),
    .PORT_WIDTH(1),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_0_decode_start_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(0)
  ) fifo_0_decode_start_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[4]),
    .overflow_out  (_fifo_0_decode_start_Return_overflow_out),
    .underflow_out (_fifo_0_decode_start_Return_underflow_out),
    .empty         (_fifo_0_decode_start_Return_empty),
    .rdreq         (fifo_data_0.rden),
    .full          (_fifo_0_decode_start_Return_full),
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
    .AUTO_PIPELINE_GROUP("fifo_1_decode_advance_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(0)
  ) fifo_1_decode_advance_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[5]),
    .overflow_out  (_fifo_1_decode_advance_Return_overflow_out),
    .underflow_out (_fifo_1_decode_advance_Return_underflow_out),
    .empty         (_fifo_1_decode_advance_Return_empty),
    .rdreq         (fifo_data_1.rden),
    .full          (_fifo_1_decode_advance_Return_full),
    .wrreq         (fifo_data_1.wren),
    .data          ('0),
    .q             (/* unused */)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(6),
    .PORT_WIDTH(6),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_2_decode_get_state_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(1)
  ) fifo_2_decode_get_state_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[6]),
    .overflow_out  (_fifo_2_decode_get_state_Return_overflow_out),
    .underflow_out (_fifo_2_decode_get_state_Return_underflow_out),
    .empty         (_fifo_2_decode_get_state_Return_empty),
    .rdreq         (fifo_data_2.rden),
    .full          (_fifo_2_decode_get_state_Return_full),
    .wrreq         (fifo_data_2.wren),
    .data          (fifo_data_2.data_in),
    .q             (_fifo_2_decode_get_state_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(5),
    .PORT_WIDTH(5),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_3_decode_get_layer_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(1)
  ) fifo_3_decode_get_layer_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[7]),
    .overflow_out  (_fifo_3_decode_get_layer_Return_overflow_out),
    .underflow_out (_fifo_3_decode_get_layer_Return_underflow_out),
    .empty         (_fifo_3_decode_get_layer_Return_empty),
    .rdreq         (fifo_data_3.rden),
    .full          (_fifo_3_decode_get_layer_Return_full),
    .wrreq         (fifo_data_3.wren),
    .data          (fifo_data_3.data_in),
    .q             (_fifo_3_decode_get_layer_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(0),
    .PORT_WIDTH(1),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_4_set_output_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(0)
  ) fifo_4_set_output_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[8]),
    .overflow_out  (_fifo_4_set_output_Return_overflow_out),
    .underflow_out (_fifo_4_set_output_Return_underflow_out),
    .empty         (_fifo_4_set_output_Return_empty),
    .rdreq         (fifo_data_4.rden),
    .full          (_fifo_4_set_output_Return_full),
    .wrreq         (fifo_data_4.wren),
    .data          ('0),
    .q             (/* unused */)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(17),
    .PORT_WIDTH(17),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_5_get_output_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(1)
  ) fifo_5_get_output_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[9]),
    .overflow_out  (_fifo_5_get_output_Return_overflow_out),
    .underflow_out (_fifo_5_get_output_Return_underflow_out),
    .empty         (_fifo_5_get_output_Return_empty),
    .rdreq         (fifo_data_5.rden),
    .full          (_fifo_5_get_output_Return_full),
    .wrreq         (fifo_data_5.wren),
    .data          (fifo_data_5.data_in),
    .q             (_fifo_5_get_output_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(1),
    .PORT_WIDTH(1),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_6_is_idle_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(1)
  ) fifo_6_is_idle_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[10]),
    .overflow_out  (_fifo_6_is_idle_Return_overflow_out),
    .underflow_out (_fifo_6_is_idle_Return_underflow_out),
    .empty         (_fifo_6_is_idle_Return_empty),
    .rdreq         (fifo_data_6.rden),
    .full          (_fifo_6_is_idle_Return_full),
    .wrreq         (fifo_data_6.wren),
    .data          (fifo_data_6.data_in),
    .q             (_fifo_6_is_idle_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(1),
    .PORT_WIDTH(1),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_7_is_output_ready_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(1)
  ) fifo_7_is_output_ready_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[11]),
    .overflow_out  (_fifo_7_is_output_ready_Return_overflow_out),
    .underflow_out (_fifo_7_is_output_ready_Return_underflow_out),
    .empty         (_fifo_7_is_output_ready_Return_empty),
    .rdreq         (fifo_data_7.rden),
    .full          (_fifo_7_is_output_ready_Return_full),
    .wrreq         (fifo_data_7.wren),
    .data          (fifo_data_7.data_in),
    .q             (_fifo_7_is_output_ready_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(12),
    .PORT_WIDTH(12),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_8_get_token_count_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(1)
  ) fifo_8_get_token_count_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[12]),
    .overflow_out  (_fifo_8_get_token_count_Return_overflow_out),
    .underflow_out (_fifo_8_get_token_count_Return_underflow_out),
    .empty         (_fifo_8_get_token_count_Return_empty),
    .rdreq         (fifo_data_8.rden),
    .full          (_fifo_8_get_token_count_Return_full),
    .wrreq         (fifo_data_8.wren),
    .data          (fifo_data_8.data_in),
    .q             (_fifo_8_get_token_count_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(0),
    .PORT_WIDTH(1),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_9_reset_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(0)
  ) fifo_9_reset_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[13]),
    .overflow_out  (_fifo_9_reset_Return_overflow_out),
    .underflow_out (_fifo_9_reset_Return_underflow_out),
    .empty         (_fifo_9_reset_Return_empty),
    .rdreq         (fifo_data_9.rden),
    .full          (_fifo_9_reset_Return_full),
    .wrreq         (fifo_data_9.wren),
    .data          ('0),
    .q             (/* unused */)
  );
  llama_chip_decode_start_BasicBlock_0 decode_start_BasicBlock_0Impl (	// llama_chip.k:31:9
    .clk                                  (clk),	// llama_chip.k:31:9
    .rst                                  (reg_rst_delayed[14]),	// llama_chip.k:31:9
    .done_out                             (/* unused */),
    .global_out__state_8_0_valid
      (_decode_start_BasicBlock_0Impl_global_out__state_8_0_valid),
    .global_out__current_layer_11_0_valid
      (_decode_start_BasicBlock_0Impl_global_out__current_layer_11_0_valid),
    .fifo_wren_0                          (_decode_start_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0            (fifo_data_0.almost_full),	// llama_chip.k:31:9
    .fifo_overflow_in_0                   (fifo_data_0.overflow),	// llama_chip.k:31:9
    .data_in_10                           (passthrough_data_10.data),	// llama_chip.k:31:9
    .input_fifo_underflow_0               (passthrough_data_10.underflow),	// llama_chip.k:31:9
    .input_rdy_0                          (_decode_start_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0                        (passthrough_data_10.valid),	// llama_chip.k:31:9
    .control_state_out                    (/* unused */)
  );	// llama_chip.k:31:9
  llama_chip_decode_advance_BasicBlock_0 decode_advance_BasicBlock_0Impl (	// llama_chip.k:43:9
    .clk                                  (clk),	// llama_chip.k:43:9
    .rst                                  (reg_rst_delayed[15]),	// llama_chip.k:43:9
    .done_out                             (/* unused */),
    .global_in__state_8                   (__state_value_out),	// llama_chip.k:20:5
    .global_in__token_count_9             (__token_count_value_out),	// llama_chip.k:21:5
    .global_in__current_layer_11          (__current_layer_value_out),	// llama_chip.k:24:5
    .global_out__state_8_1_valid
      (_decode_advance_BasicBlock_0Impl_global_out__state_8_1_valid),
    .global_out__state_8_1
      (_decode_advance_BasicBlock_0Impl_global_out__state_8_1),
    .global_out__token_count_9_0_valid
      (_decode_advance_BasicBlock_0Impl_global_out__token_count_9_0_valid),
    .global_out__token_count_9_0
      (_decode_advance_BasicBlock_0Impl_global_out__token_count_9_0),
    .global_out__current_layer_11_1_valid
      (_decode_advance_BasicBlock_0Impl_global_out__current_layer_11_1_valid),
    .global_out__current_layer_11_1
      (_decode_advance_BasicBlock_0Impl_global_out__current_layer_11_1),
    .fifo_wren_0                          (_decode_advance_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0            (fifo_data_1.almost_full),	// llama_chip.k:43:9
    .fifo_overflow_in_0                   (fifo_data_1.overflow),	// llama_chip.k:43:9
    .input_fifo_underflow_0               (passthrough_data_11.underflow),	// llama_chip.k:43:9
    .input_rdy_0                          (_decode_advance_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0                        (passthrough_data_11.valid),	// llama_chip.k:43:9
    .control_state_out                    (/* unused */)
  );	// llama_chip.k:43:9
  llama_chip_decode_get_state_BasicBlock_0 decode_get_state_BasicBlock_0Impl (	// llama_chip.k:72:9
    .clk                       (clk),	// llama_chip.k:72:9
    .rst                       (reg_rst_delayed[16]),	// llama_chip.k:72:9
    .done_out                  (/* unused */),
    .global_in__state_8        (__state_value_out),	// llama_chip.k:20:5
    .fifo_data_out_0           (_decode_get_state_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0               (_decode_get_state_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_2.almost_full),	// llama_chip.k:72:9
    .fifo_overflow_in_0        (fifo_data_2.overflow),	// llama_chip.k:72:9
    .input_fifo_underflow_0    (passthrough_data_12.underflow),	// llama_chip.k:72:9
    .input_rdy_0               (_decode_get_state_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_12.valid),	// llama_chip.k:72:9
    .control_state_out         (/* unused */)
  );	// llama_chip.k:72:9
  llama_chip_decode_get_layer_BasicBlock_0 decode_get_layer_BasicBlock_0Impl (	// llama_chip.k:78:9
    .clk                         (clk),	// llama_chip.k:78:9
    .rst                         (reg_rst_delayed[17]),	// llama_chip.k:78:9
    .done_out                    (/* unused */),
    .global_in__current_layer_11 (__current_layer_value_out),	// llama_chip.k:24:5
    .fifo_data_out_0             (_decode_get_layer_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0                 (_decode_get_layer_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0   (fifo_data_3.almost_full),	// llama_chip.k:78:9
    .fifo_overflow_in_0          (fifo_data_3.overflow),	// llama_chip.k:78:9
    .input_fifo_underflow_0      (passthrough_data_13.underflow),	// llama_chip.k:78:9
    .input_rdy_0                 (_decode_get_layer_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0               (passthrough_data_13.valid),	// llama_chip.k:78:9
    .control_state_out           (/* unused */)
  );	// llama_chip.k:78:9
  llama_chip_set_output_BasicBlock_0 set_output_BasicBlock_0Impl (	// llama_chip.k:84:9
    .clk                                 (clk),	// llama_chip.k:84:9
    .rst                                 (reg_rst_delayed[18]),	// llama_chip.k:84:9
    .done_out                            (/* unused */),
    .global_out__output_token_10_0_valid
      (_set_output_BasicBlock_0Impl_global_out__output_token_10_0_valid),
    .global_out__output_token_10_0
      (_set_output_BasicBlock_0Impl_global_out__output_token_10_0),
    .fifo_wren_0                         (_set_output_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0           (fifo_data_4.almost_full),	// llama_chip.k:84:9
    .fifo_overflow_in_0                  (fifo_data_4.overflow),	// llama_chip.k:84:9
    .data_in_14                          (passthrough_data_14.data),	// llama_chip.k:84:9
    .input_fifo_underflow_0              (passthrough_data_14.underflow),	// llama_chip.k:84:9
    .input_rdy_0                         (_set_output_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0                       (passthrough_data_14.valid),	// llama_chip.k:84:9
    .control_state_out                   (/* unused */)
  );	// llama_chip.k:84:9
  llama_chip_get_output_BasicBlock_0 get_output_BasicBlock_0Impl (	// llama_chip.k:93:9
    .clk                        (clk),	// llama_chip.k:93:9
    .rst                        (reg_rst_delayed[19]),	// llama_chip.k:93:9
    .done_out                   (/* unused */),
    .global_in__output_token_10 (__output_token_value_out),	// llama_chip.k:23:5
    .fifo_data_out_0            (_get_output_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0                (_get_output_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0  (fifo_data_5.almost_full),	// llama_chip.k:93:9
    .fifo_overflow_in_0         (fifo_data_5.overflow),	// llama_chip.k:93:9
    .input_fifo_underflow_0     (passthrough_data_15.underflow),	// llama_chip.k:93:9
    .input_rdy_0                (_get_output_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0              (passthrough_data_15.valid),	// llama_chip.k:93:9
    .control_state_out          (/* unused */)
  );	// llama_chip.k:93:9
  llama_chip_is_idle_BasicBlock_0 is_idle_BasicBlock_0Impl (	// llama_chip.k:99:9
    .clk                       (clk),	// llama_chip.k:99:9
    .rst                       (reg_rst_delayed[20]),	// llama_chip.k:99:9
    .done_out                  (/* unused */),
    .global_in__state_8        (__state_value_out),	// llama_chip.k:20:5
    .fifo_data_out_0           (_is_idle_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0               (_is_idle_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_6.almost_full),	// llama_chip.k:99:9
    .fifo_overflow_in_0        (fifo_data_6.overflow),	// llama_chip.k:99:9
    .input_fifo_underflow_0    (passthrough_data_16.underflow),	// llama_chip.k:99:9
    .input_rdy_0               (_is_idle_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_16.valid),	// llama_chip.k:99:9
    .control_state_out         (/* unused */)
  );	// llama_chip.k:99:9
  llama_chip_is_output_ready_BasicBlock_0 is_output_ready_BasicBlock_0Impl (	// llama_chip.k:105:9
    .clk                       (clk),	// llama_chip.k:105:9
    .rst                       (reg_rst_delayed[21]),	// llama_chip.k:105:9
    .done_out                  (/* unused */),
    .global_in__state_8        (__state_value_out),	// llama_chip.k:20:5
    .fifo_data_out_0           (_is_output_ready_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0               (_is_output_ready_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_7.almost_full),	// llama_chip.k:105:9
    .fifo_overflow_in_0        (fifo_data_7.overflow),	// llama_chip.k:105:9
    .input_fifo_underflow_0    (passthrough_data_17.underflow),	// llama_chip.k:105:9
    .input_rdy_0               (_is_output_ready_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_17.valid),	// llama_chip.k:105:9
    .control_state_out         (/* unused */)
  );	// llama_chip.k:105:9
  llama_chip_get_token_count_BasicBlock_0 get_token_count_BasicBlock_0Impl (	// llama_chip.k:111:9
    .clk                       (clk),	// llama_chip.k:111:9
    .rst                       (reg_rst_delayed[22]),	// llama_chip.k:111:9
    .done_out                  (/* unused */),
    .global_in__token_count_9  (__token_count_value_out),	// llama_chip.k:21:5
    .fifo_data_out_0           (_get_token_count_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0               (_get_token_count_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_8.almost_full),	// llama_chip.k:111:9
    .fifo_overflow_in_0        (fifo_data_8.overflow),	// llama_chip.k:111:9
    .input_fifo_underflow_0    (passthrough_data_18.underflow),	// llama_chip.k:111:9
    .input_rdy_0               (_get_token_count_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_18.valid),	// llama_chip.k:111:9
    .control_state_out         (/* unused */)
  );	// llama_chip.k:111:9
  llama_chip_reset_BasicBlock_0 reset_BasicBlock_0Impl (	// llama_chip.k:117:9
    .clk                                  (clk),	// llama_chip.k:117:9
    .rst                                  (reg_rst_delayed[23]),	// llama_chip.k:117:9
    .done_out                             (/* unused */),
    .global_out__state_8_2_valid
      (_reset_BasicBlock_0Impl_global_out__state_8_2_valid),
    .global_out__token_count_9_1_valid
      (_reset_BasicBlock_0Impl_global_out__token_count_9_1_valid),
    .global_out__output_token_10_1_valid
      (_reset_BasicBlock_0Impl_global_out__output_token_10_1_valid),
    .global_out__current_layer_11_2_valid
      (_reset_BasicBlock_0Impl_global_out__current_layer_11_2_valid),
    .fifo_wren_0                          (_reset_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0            (fifo_data_9.almost_full),	// llama_chip.k:117:9
    .fifo_overflow_in_0                   (fifo_data_9.overflow),	// llama_chip.k:117:9
    .input_fifo_underflow_0               (passthrough_data_19.underflow),	// llama_chip.k:117:9
    .input_rdy_0                          (_reset_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0                        (passthrough_data_19.valid),	// llama_chip.k:117:9
    .control_state_out                    (/* unused */)
  );	// llama_chip.k:117:9
  assign rst_and_startup_done_out = rst_and_startup_done_out_net;
  assign decode_start_rdy_out = decode_start_rdy_out_net;
  assign decode_start_empty_out = decode_start_empty_out_net;
  assign decode_advance_rdy_out = decode_advance_rdy_out_net;
  assign decode_advance_empty_out = decode_advance_empty_out_net;
  assign decode_get_state_rdy_out = decode_get_state_rdy_out_net;
  assign decode_get_state_empty_out = decode_get_state_empty_out_net;
  assign decode_get_state_result_out = decode_get_state_result_out_net;
  assign decode_get_layer_rdy_out = decode_get_layer_rdy_out_net;
  assign decode_get_layer_empty_out = decode_get_layer_empty_out_net;
  assign decode_get_layer_result_out = decode_get_layer_result_out_net;
  assign set_output_rdy_out = set_output_rdy_out_net;
  assign set_output_empty_out = set_output_empty_out_net;
  assign get_output_rdy_out = get_output_rdy_out_net;
  assign get_output_empty_out = get_output_empty_out_net;
  assign get_output_result_out = get_output_result_out_net;
  assign is_idle_rdy_out = is_idle_rdy_out_net;
  assign is_idle_empty_out = is_idle_empty_out_net;
  assign is_idle_result_out = is_idle_result_out_net;
  assign is_output_ready_rdy_out = is_output_ready_rdy_out_net;
  assign is_output_ready_empty_out = is_output_ready_empty_out_net;
  assign is_output_ready_result_out = is_output_ready_result_out_net;
  assign get_token_count_rdy_out = get_token_count_rdy_out_net;
  assign get_token_count_empty_out = get_token_count_empty_out_net;
  assign get_token_count_result_out = get_token_count_result_out_net;
  assign reset_rdy_out = reset_rdy_out_net;
  assign reset_empty_out = reset_empty_out_net;
  assign stall_rate_supported_out = stall_rate_supported_out_net;
endmodule

module llama_chip_EsiWrapper(
     input  wire                                         clk,
     input  wire                                         rst,
     input  wire [2:0]                                   stall_rate_in,
     input  wire                                         stall_rate_valid_in,
  // input  wire /*Zero Width*/                          decode_advance_arg,
     input  wire                                         decode_advance_arg_valid,
  // input  wire /*Zero Width*/                          decode_get_layer_arg,
     input  wire                                         decode_get_layer_arg_valid,
  // input  wire /*Zero Width*/                          decode_get_state_arg,
     input  wire                                         decode_get_state_arg_valid,
     input  wire struct packed {logic [16:0] token_id; } decode_start_arg,
     input  wire                                         decode_start_arg_valid,
  // input  wire /*Zero Width*/                          get_output_arg,
     input  wire                                         get_output_arg_valid,
  // input  wire /*Zero Width*/                          get_token_count_arg,
     input  wire                                         get_token_count_arg_valid,
  // input  wire /*Zero Width*/                          is_idle_arg,
     input  wire                                         is_idle_arg_valid,
  // input  wire /*Zero Width*/                          is_output_ready_arg,
     input  wire                                         is_output_ready_arg_valid,
  // input  wire /*Zero Width*/                          reset_arg,
     input  wire                                         reset_arg_valid,
     input  wire struct packed {logic [16:0] token_id; } set_output_arg,
     input  wire                                         set_output_arg_valid,
     input  wire                                         decode_advance_result_rden,
     input  wire                                         decode_get_layer_result_rden,
     input  wire                                         decode_get_state_result_rden,
     input  wire                                         decode_start_result_rden,
     input  wire                                         get_output_result_rden,
     input  wire                                         get_token_count_result_rden,
     input  wire                                         is_idle_result_rden,
     input  wire                                         is_output_ready_result_rden,
     input  wire                                         reset_result_rden,
     input  wire                                         set_output_result_rden,
     output wire                                         decode_advance_arg_ready,
     output wire                                         decode_get_layer_arg_ready,
     output wire                                         decode_get_state_arg_ready,
     output wire                                         decode_start_arg_ready,
     output wire                                         get_output_arg_ready,
     output wire                                         get_token_count_arg_ready,
     output wire                                         is_idle_arg_ready,
     output wire                                         is_output_ready_arg_ready,
     output wire                                         reset_arg_ready,
     output wire                                         set_output_arg_ready,
  // output wire /*Zero Width*/                          decode_advance_result,
     output wire                                         decode_advance_result_empty,
     output wire [4:0]                                   decode_get_layer_result,
     output wire                                         decode_get_layer_result_empty,
     output wire [5:0]                                   decode_get_state_result,
     output wire                                         decode_get_state_result_empty,
  // output wire /*Zero Width*/                          decode_start_result,
     output wire                                         decode_start_result_empty,
     output wire [16:0]                                  get_output_result,
     output wire                                         get_output_result_empty,
     output wire [11:0]                                  get_token_count_result,
     output wire                                         get_token_count_result_empty,
     output wire                                         is_idle_result,
     output wire                                         is_idle_result_empty,
     output wire                                         is_output_ready_result,
     output wire                                         is_output_ready_result_empty,
  // output wire /*Zero Width*/                          reset_result,
     output wire                                         reset_result_empty,
  // output wire /*Zero Width*/                          set_output_result,
     output wire                                         set_output_result_empty,
     output wire                                         rst_and_startup_done_out,
     output wire                                         stall_rate_supported_out
);

  wire [5:0]  _EsiWrapped_decode_get_state_result_out;
  wire [4:0]  _EsiWrapped_decode_get_layer_result_out;
  wire [16:0] _EsiWrapped_get_output_result_out;
  wire [11:0] _EsiWrapped_get_token_count_result_out;
  llama_chip EsiWrapped (
    .clk                         (clk),
    .rst                         (rst),
    .decode_start_valid_in       (decode_start_arg_valid),
    .decode_start_token_id_in    (decode_start_arg.token_id),
    .decode_start_rden_in        (decode_start_result_rden),
    .decode_advance_valid_in     (decode_advance_arg_valid),
    .decode_advance_rden_in      (decode_advance_result_rden),
    .decode_get_state_valid_in   (decode_get_state_arg_valid),
    .decode_get_state_rden_in    (decode_get_state_result_rden),
    .decode_get_layer_valid_in   (decode_get_layer_arg_valid),
    .decode_get_layer_rden_in    (decode_get_layer_result_rden),
    .set_output_valid_in         (set_output_arg_valid),
    .set_output_token_id_in      (set_output_arg.token_id),
    .set_output_rden_in          (set_output_result_rden),
    .get_output_valid_in         (get_output_arg_valid),
    .get_output_rden_in          (get_output_result_rden),
    .is_idle_valid_in            (is_idle_arg_valid),
    .is_idle_rden_in             (is_idle_result_rden),
    .is_output_ready_valid_in    (is_output_ready_arg_valid),
    .is_output_ready_rden_in     (is_output_ready_result_rden),
    .get_token_count_valid_in    (get_token_count_arg_valid),
    .get_token_count_rden_in     (get_token_count_result_rden),
    .reset_valid_in              (reset_arg_valid),
    .reset_rden_in               (reset_result_rden),
    .stall_rate_in               (stall_rate_in),
    .stall_rate_valid_in         (stall_rate_valid_in),
    .rst_and_startup_done_out    (rst_and_startup_done_out),
    .decode_start_rdy_out        (decode_start_arg_ready),
    .decode_start_empty_out      (decode_start_result_empty),
    .decode_advance_rdy_out      (decode_advance_arg_ready),
    .decode_advance_empty_out    (decode_advance_result_empty),
    .decode_get_state_rdy_out    (decode_get_state_arg_ready),
    .decode_get_state_empty_out  (decode_get_state_result_empty),
    .decode_get_state_result_out (_EsiWrapped_decode_get_state_result_out),
    .decode_get_layer_rdy_out    (decode_get_layer_arg_ready),
    .decode_get_layer_empty_out  (decode_get_layer_result_empty),
    .decode_get_layer_result_out (_EsiWrapped_decode_get_layer_result_out),
    .set_output_rdy_out          (set_output_arg_ready),
    .set_output_empty_out        (set_output_result_empty),
    .get_output_rdy_out          (get_output_arg_ready),
    .get_output_empty_out        (get_output_result_empty),
    .get_output_result_out       (_EsiWrapped_get_output_result_out),
    .is_idle_rdy_out             (is_idle_arg_ready),
    .is_idle_empty_out           (is_idle_result_empty),
    .is_idle_result_out          (is_idle_result),
    .is_output_ready_rdy_out     (is_output_ready_arg_ready),
    .is_output_ready_empty_out   (is_output_ready_result_empty),
    .is_output_ready_result_out  (is_output_ready_result),
    .get_token_count_rdy_out     (get_token_count_arg_ready),
    .get_token_count_empty_out   (get_token_count_result_empty),
    .get_token_count_result_out  (_EsiWrapped_get_token_count_result_out),
    .reset_rdy_out               (reset_arg_ready),
    .reset_empty_out             (reset_result_empty),
    .stall_rate_supported_out    (stall_rate_supported_out)
  );
  // Zero width: assign decode_advance_result = /*Zero width*/;
  assign decode_get_layer_result = _EsiWrapped_decode_get_layer_result_out;
  assign decode_get_state_result = _EsiWrapped_decode_get_state_result_out;
  // Zero width: assign decode_start_result = /*Zero width*/;
  assign get_output_result = _EsiWrapped_get_output_result_out;
  assign get_token_count_result = _EsiWrapped_get_token_count_result_out;
  // Zero width: assign reset_result = /*Zero width*/;
  // Zero width: assign set_output_result = /*Zero width*/;
endmodule

