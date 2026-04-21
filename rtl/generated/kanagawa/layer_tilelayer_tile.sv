
// This file was generated. Do not modify.
// kanagawa --backend=sv --import-dir=/home/mana/workspace/OpenTaalas/third-party/kanagawa/library --base-library=/home/mana/workspace/OpenTaalas/third-party/kanagawa/library/mini-base.k --output=/home/mana/workspace/OpenTaalas/rtl/generated/kanagawa/layer_tile /home/mana/workspace/OpenTaalas/rtl/kanagawa/layer_tile.k

`default_nettype wire
module layer_tileDebugView_set_layer_idEntry
(
    input wire clk,
    input wire[15:0]  _id,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("set_layer_idEntry time: %0t id: %p", $time, _id);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module layer_tileDebugView_get_layer_idExit
(
    input wire clk,
    input wire[15:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("get_layer_idExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module layer_tileDebugView_get_stateExit
(
    input wire clk,
    input wire[5:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("get_stateExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module layer_tileDebugView_is_doneExit
(
    input wire clk,
    input wire _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("is_doneExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module layer_tileDebugView_get_positionExit
(
    input wire clk,
    input wire[11:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("get_positionExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
`ifndef _TYPESCOPE_CoreModuleTypeScope
`define _TYPESCOPE_CoreModuleTypeScope
`endif // _TYPESCOPE_CoreModuleTypeScope
module layer_tile_reset_BasicBlock_0(	// layer_tile.k:128:9
  input  wire       clk,
  input  wire       rst,
  output wire       done_out,
  output wire       global_out__state_5_2_valid,
  output wire       global_out__position_7_1_valid,
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
  logic       done_out_0;	// layer_tile.k:128:9
  logic       global_out__state_5_2_valid_0;	// layer_tile.k:128:9
  logic       global_out__position_7_1_valid_0;	// layer_tile.k:128:9
  logic       fifo_wren_0_0;	// layer_tile.k:128:9
  logic       input_rdy_0_0;	// layer_tile.k:128:9
  logic [7:0] control_state_out_0;	// layer_tile.k:128:9
  wire        _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// layer_tile.k:128:9
  always_comb begin	// layer_tile.k:128:9
    input_rdy_0_0 = _GEN;	// layer_tile.k:128:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// layer_tile.k:128:9
  end // always_comb
  reg         p0_stage1_enable = 1'h0;	// layer_tile.k:128:9
  always_comb begin	// layer_tile.k:128:9
    global_out__state_5_2_valid_0 = p0_stage1_enable;	// layer_tile.k:128:9
    global_out__position_7_1_valid_0 = p0_stage1_enable;	// layer_tile.k:128:9
  end // always_comb
  reg         p0_stage2_enable = 1'h0;	// layer_tile.k:128:9
  always @(posedge clk) begin	// layer_tile.k:128:9
    if (rst) begin	// layer_tile.k:128:9
      p0_stage1_enable <= 1'h0;	// layer_tile.k:128:9
      p0_stage2_enable <= 1'h0;	// layer_tile.k:128:9
    end
    else begin	// layer_tile.k:128:9
      p0_stage1_enable <= _GEN & input_valid_0;	// layer_tile.k:128:9
      p0_stage2_enable <= p0_stage1_enable;	// layer_tile.k:128:9
    end
  end // always @(posedge)
  always_comb	// layer_tile.k:128:9
    fifo_wren_0_0 = p0_stage2_enable;	// layer_tile.k:128:9, :133:9
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// layer_tile.k:128:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// layer_tile.k:128:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  assign done_out = p0_stage2_enable;	// layer_tile.k:128:9
  assign global_out__state_5_2_valid = global_out__state_5_2_valid_0;	// layer_tile.k:128:9
  assign global_out__position_7_1_valid = global_out__position_7_1_valid_0;	// layer_tile.k:128:9
  assign fifo_wren_0 = fifo_wren_0_0;	// layer_tile.k:128:9
  assign input_rdy_0 = input_rdy_0_0;	// layer_tile.k:128:9
  assign control_state_out = control_state_out_0;	// layer_tile.k:128:9
endmodule

module layer_tile_advance_position_BasicBlock_0(	// layer_tile.k:111:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  input  wire [11:0] global_in__position_7,
  output wire        global_out__position_7_0_valid,
  output wire [11:0] global_out__position_7_0,
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
  wire  [11:0] global_in__position_7_0 = global_in__position_7;	// layer_tile.k:111:9
  logic        done_out_0;	// layer_tile.k:111:9
  logic        global_out__position_7_0_valid_0;	// layer_tile.k:111:9
  logic [11:0] global_out__position_7_0_0;	// layer_tile.k:111:9
  logic        fifo_wren_0_0;	// layer_tile.k:111:9
  logic        input_rdy_0_0;	// layer_tile.k:111:9
  logic [7:0]  control_state_out_0;	// layer_tile.k:111:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// layer_tile.k:111:9
  always_comb begin	// layer_tile.k:111:9
    input_rdy_0_0 = _GEN;	// layer_tile.k:111:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// layer_tile.k:111:9
  end // always_comb
  reg          p0_stage1_enable = 1'h0;	// layer_tile.k:111:9
  always_comb begin	// layer_tile.k:111:9
    global_out__position_7_0_0 =
      (&global_in__position_7_0)
        ? 12'h0
        : 12'(((&global_in__position_7_0) ? 12'h0 : global_in__position_7_0) + 12'h1);	// layer_tile.k:111:9, :113:17, :119:29
    global_out__position_7_0_valid_0 = p0_stage1_enable;	// layer_tile.k:111:9
  end // always_comb
  reg          p0_stage2_enable = 1'h0;	// layer_tile.k:111:9
  always @(posedge clk) begin	// layer_tile.k:111:9
    if (rst) begin	// layer_tile.k:111:9
      p0_stage1_enable <= 1'h0;	// layer_tile.k:111:9
      p0_stage2_enable <= 1'h0;	// layer_tile.k:111:9
    end
    else begin	// layer_tile.k:111:9
      p0_stage1_enable <= _GEN & input_valid_0;	// layer_tile.k:111:9
      p0_stage2_enable <= p0_stage1_enable;	// layer_tile.k:111:9
    end
  end // always @(posedge)
  always_comb	// layer_tile.k:111:9
    fifo_wren_0_0 = p0_stage2_enable;	// layer_tile.k:111:9, :122:9
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// layer_tile.k:111:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// layer_tile.k:111:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  assign done_out = p0_stage2_enable;	// layer_tile.k:111:9
  assign global_out__position_7_0_valid = global_out__position_7_0_valid_0;	// layer_tile.k:111:9
  assign global_out__position_7_0 = global_out__position_7_0_0;	// layer_tile.k:111:9
  assign fifo_wren_0 = fifo_wren_0_0;	// layer_tile.k:111:9
  assign input_rdy_0 = input_rdy_0_0;	// layer_tile.k:111:9
  assign control_state_out = control_state_out_0;	// layer_tile.k:111:9
endmodule

module layer_tile_get_position_BasicBlock_0(	// layer_tile.k:105:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  input  wire [11:0] global_in__position_7,
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
  wire  [11:0] global_in__position_7_0 = global_in__position_7;	// layer_tile.k:105:9
  logic        done_out_0;	// layer_tile.k:105:9
  logic [11:0] fifo_data_out_0_0;	// layer_tile.k:105:9
  logic        fifo_wren_0_0;	// layer_tile.k:105:9
  logic        input_rdy_0_0;	// layer_tile.k:105:9
  logic [7:0]  control_state_out_0;	// layer_tile.k:105:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// layer_tile.k:105:9
  always_comb begin	// layer_tile.k:105:9
    input_rdy_0_0 = _GEN;	// layer_tile.k:105:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// layer_tile.k:105:9
  end // always_comb
  reg          p0_stage1_enable = 1'h0;	// layer_tile.k:105:9
  reg   [11:0] p0_global_in__position_7;	// layer_tile.k:105:9
  reg          p0_stage2_enable = 1'h0;	// layer_tile.k:105:9
  always @(posedge clk) begin	// layer_tile.k:105:9
    if (rst)	// layer_tile.k:105:9
      p0_stage1_enable <= 1'h0;	// layer_tile.k:105:9
    else	// layer_tile.k:105:9
      p0_stage1_enable <= _GEN & input_valid_0;	// layer_tile.k:105:9
    p0_global_in__position_7 <= global_in__position_7_0;	// layer_tile.k:105:9
    if (rst)	// layer_tile.k:105:9
      p0_stage2_enable <= 1'h0;	// layer_tile.k:105:9
    else	// layer_tile.k:105:9
      p0_stage2_enable <= p0_stage1_enable;	// layer_tile.k:105:9
  end // always @(posedge)
  always_comb begin	// layer_tile.k:105:9
    fifo_wren_0_0 = p0_stage2_enable;	// layer_tile.k:103:5, :105:9
    fifo_data_out_0_0 = p0_global_in__position_7;	// layer_tile.k:103:5, :105:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// layer_tile.k:105:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// layer_tile.k:105:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  layer_tileDebugView_get_positionExit layer_tileDebugView_get_positionExit_instance (	// layer_tile.k:103:5
    .clk          (clk),	// layer_tile.k:103:5
    ._ReturnValue (p0_stage1_enable ? global_in__position_7_0 : 'x),	// layer_tile.k:103:5, :105:9
    .valid        (p0_stage1_enable),	// layer_tile.k:105:9
    .valid_out    (/* unused */)
  );	// layer_tile.k:103:5
  assign done_out = p0_stage2_enable;	// layer_tile.k:105:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// layer_tile.k:105:9
  assign fifo_wren_0 = fifo_wren_0_0;	// layer_tile.k:105:9
  assign input_rdy_0 = input_rdy_0_0;	// layer_tile.k:105:9
  assign control_state_out = control_state_out_0;	// layer_tile.k:105:9
endmodule

module layer_tile_is_done_BasicBlock_0(	// layer_tile.k:86:9
  input  wire       clk,
  input  wire       rst,
  output wire       done_out,
  input  wire [5:0] global_in__state_5,
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
  wire  [5:0] global_in__state_5_0 = global_in__state_5;	// layer_tile.k:86:9
  logic       done_out_0;	// layer_tile.k:86:9
  logic       fifo_data_out_0_0;	// layer_tile.k:86:9
  logic       fifo_wren_0_0;	// layer_tile.k:86:9
  logic       input_rdy_0_0;	// layer_tile.k:86:9
  logic [7:0] control_state_out_0;	// layer_tile.k:86:9
  wire        _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// layer_tile.k:86:9
  always_comb begin	// layer_tile.k:86:9
    input_rdy_0_0 = _GEN;	// layer_tile.k:86:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// layer_tile.k:86:9
  end // always_comb
  reg         p0_stage1_enable = 1'h0;	// layer_tile.k:86:9
  wire        _state_eq_16_ = global_in__state_5_0 == 6'h10;	// layer_tile.k:86:9, :89:17
  reg         p0__state_eq_16_;	// layer_tile.k:86:9
  reg         p0_stage2_enable = 1'h0;	// layer_tile.k:86:9
  always @(posedge clk) begin	// layer_tile.k:86:9
    if (rst)	// layer_tile.k:86:9
      p0_stage1_enable <= 1'h0;	// layer_tile.k:86:9
    else	// layer_tile.k:86:9
      p0_stage1_enable <= _GEN & input_valid_0;	// layer_tile.k:86:9
    p0__state_eq_16_ <= _state_eq_16_;	// layer_tile.k:86:9, :89:17
    if (rst)	// layer_tile.k:86:9
      p0_stage2_enable <= 1'h0;	// layer_tile.k:86:9
    else	// layer_tile.k:86:9
      p0_stage2_enable <= p0_stage1_enable;	// layer_tile.k:86:9
  end // always @(posedge)
  always_comb begin	// layer_tile.k:86:9
    fifo_wren_0_0 = p0_stage2_enable;	// layer_tile.k:84:5, :86:9
    fifo_data_out_0_0 = p0__state_eq_16_;	// layer_tile.k:84:5, :86:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// layer_tile.k:86:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// layer_tile.k:86:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  layer_tileDebugView_is_doneExit layer_tileDebugView_is_doneExit_instance (	// layer_tile.k:84:5
    .clk          (clk),	// layer_tile.k:84:5
    ._ReturnValue (p0_stage1_enable ? _state_eq_16_ : 'x),	// layer_tile.k:84:5, :86:9, :89:17
    .valid        (p0_stage1_enable),	// layer_tile.k:86:9
    .valid_out    (/* unused */)
  );	// layer_tile.k:84:5
  assign done_out = p0_stage2_enable;	// layer_tile.k:86:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// layer_tile.k:86:9
  assign fifo_wren_0 = fifo_wren_0_0;	// layer_tile.k:86:9
  assign input_rdy_0 = input_rdy_0_0;	// layer_tile.k:86:9
  assign control_state_out = control_state_out_0;	// layer_tile.k:86:9
endmodule

module layer_tile_reset_state_BasicBlock_0(	// layer_tile.k:78:9
  input  wire       clk,
  input  wire       rst,
  output wire       done_out,
  output wire       global_out__state_5_1_valid,
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
  logic       done_out_0;	// layer_tile.k:78:9
  logic       global_out__state_5_1_valid_0;	// layer_tile.k:78:9
  logic       fifo_wren_0_0;	// layer_tile.k:78:9
  logic       input_rdy_0_0;	// layer_tile.k:78:9
  logic [7:0] control_state_out_0;	// layer_tile.k:78:9
  wire        _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// layer_tile.k:78:9
  always_comb begin	// layer_tile.k:78:9
    input_rdy_0_0 = _GEN;	// layer_tile.k:78:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// layer_tile.k:78:9
  end // always_comb
  reg         p0_stage1_enable = 1'h0;	// layer_tile.k:78:9
  always_comb	// layer_tile.k:78:9
    global_out__state_5_1_valid_0 = p0_stage1_enable;	// layer_tile.k:78:9
  reg         p0_stage2_enable = 1'h0;	// layer_tile.k:78:9
  always @(posedge clk) begin	// layer_tile.k:78:9
    if (rst) begin	// layer_tile.k:78:9
      p0_stage1_enable <= 1'h0;	// layer_tile.k:78:9
      p0_stage2_enable <= 1'h0;	// layer_tile.k:78:9
    end
    else begin	// layer_tile.k:78:9
      p0_stage1_enable <= _GEN & input_valid_0;	// layer_tile.k:78:9
      p0_stage2_enable <= p0_stage1_enable;	// layer_tile.k:78:9
    end
  end // always @(posedge)
  always_comb	// layer_tile.k:78:9
    fifo_wren_0_0 = p0_stage2_enable;	// layer_tile.k:78:9, :82:9
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// layer_tile.k:78:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// layer_tile.k:78:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  assign done_out = p0_stage2_enable;	// layer_tile.k:78:9
  assign global_out__state_5_1_valid = global_out__state_5_1_valid_0;	// layer_tile.k:78:9
  assign fifo_wren_0 = fifo_wren_0_0;	// layer_tile.k:78:9
  assign input_rdy_0 = input_rdy_0_0;	// layer_tile.k:78:9
  assign control_state_out = control_state_out_0;	// layer_tile.k:78:9
endmodule

module layer_tile_advance_state_BasicBlock_0(	// layer_tile.k:67:9
  input  wire       clk,
  input  wire       rst,
  output wire       done_out,
  input  wire [5:0] global_in__state_5,
  output wire       global_out__state_5_0_valid,
  output wire [5:0] global_out__state_5_0,
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
  wire  [5:0] global_in__state_5_0 = global_in__state_5;	// layer_tile.k:67:9
  logic       done_out_0;	// layer_tile.k:67:9
  logic       global_out__state_5_0_valid_0;	// layer_tile.k:67:9
  logic [5:0] global_out__state_5_0_0;	// layer_tile.k:67:9
  logic       fifo_wren_0_0;	// layer_tile.k:67:9
  logic       input_rdy_0_0;	// layer_tile.k:67:9
  logic [7:0] control_state_out_0;	// layer_tile.k:67:9
  wire        _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// layer_tile.k:67:9
  always_comb begin	// layer_tile.k:67:9
    input_rdy_0_0 = _GEN;	// layer_tile.k:67:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// layer_tile.k:67:9
  end // always_comb
  reg         p0_stage1_enable = 1'h0;	// layer_tile.k:67:9
  always_comb begin	// layer_tile.k:67:9
    global_out__state_5_0_0 = 6'(global_in__state_5_0 + 6'h1);	// layer_tile.k:67:9, :71:26
    global_out__state_5_0_valid_0 = p0_stage1_enable & global_in__state_5_0 < 6'h10;	// layer_tile.k:67:9, :69:17
  end // always_comb
  reg         p0_stage2_enable = 1'h0;	// layer_tile.k:67:9
  always @(posedge clk) begin	// layer_tile.k:67:9
    if (rst) begin	// layer_tile.k:67:9
      p0_stage1_enable <= 1'h0;	// layer_tile.k:67:9
      p0_stage2_enable <= 1'h0;	// layer_tile.k:67:9
    end
    else begin	// layer_tile.k:67:9
      p0_stage1_enable <= _GEN & input_valid_0;	// layer_tile.k:67:9
      p0_stage2_enable <= p0_stage1_enable;	// layer_tile.k:67:9
    end
  end // always @(posedge)
  always_comb	// layer_tile.k:67:9
    fifo_wren_0_0 = p0_stage2_enable;	// layer_tile.k:67:9, :74:9
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// layer_tile.k:67:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// layer_tile.k:67:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  assign done_out = p0_stage2_enable;	// layer_tile.k:67:9
  assign global_out__state_5_0_valid = global_out__state_5_0_valid_0;	// layer_tile.k:67:9
  assign global_out__state_5_0 = global_out__state_5_0_0;	// layer_tile.k:67:9
  assign fifo_wren_0 = fifo_wren_0_0;	// layer_tile.k:67:9
  assign input_rdy_0 = input_rdy_0_0;	// layer_tile.k:67:9
  assign control_state_out = control_state_out_0;	// layer_tile.k:67:9
endmodule

module layer_tile_get_state_BasicBlock_0(	// layer_tile.k:60:9
  input  wire       clk,
  input  wire       rst,
  output wire       done_out,
  input  wire [5:0] global_in__state_5,
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
  wire  [5:0] global_in__state_5_0 = global_in__state_5;	// layer_tile.k:60:9
  logic       done_out_0;	// layer_tile.k:60:9
  logic [5:0] fifo_data_out_0_0;	// layer_tile.k:60:9
  logic       fifo_wren_0_0;	// layer_tile.k:60:9
  logic       input_rdy_0_0;	// layer_tile.k:60:9
  logic [7:0] control_state_out_0;	// layer_tile.k:60:9
  wire        _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// layer_tile.k:60:9
  always_comb begin	// layer_tile.k:60:9
    input_rdy_0_0 = _GEN;	// layer_tile.k:60:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// layer_tile.k:60:9
  end // always_comb
  reg         p0_stage1_enable = 1'h0;	// layer_tile.k:60:9
  reg   [5:0] p0_global_in__state_5;	// layer_tile.k:60:9
  reg         p0_stage2_enable = 1'h0;	// layer_tile.k:60:9
  always @(posedge clk) begin	// layer_tile.k:60:9
    if (rst)	// layer_tile.k:60:9
      p0_stage1_enable <= 1'h0;	// layer_tile.k:60:9
    else	// layer_tile.k:60:9
      p0_stage1_enable <= _GEN & input_valid_0;	// layer_tile.k:60:9
    p0_global_in__state_5 <= global_in__state_5_0;	// layer_tile.k:60:9
    if (rst)	// layer_tile.k:60:9
      p0_stage2_enable <= 1'h0;	// layer_tile.k:60:9
    else	// layer_tile.k:60:9
      p0_stage2_enable <= p0_stage1_enable;	// layer_tile.k:60:9
  end // always @(posedge)
  always_comb begin	// layer_tile.k:60:9
    fifo_wren_0_0 = p0_stage2_enable;	// layer_tile.k:58:5, :60:9
    fifo_data_out_0_0 = p0_global_in__state_5;	// layer_tile.k:58:5, :60:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// layer_tile.k:60:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// layer_tile.k:60:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  layer_tileDebugView_get_stateExit layer_tileDebugView_get_stateExit_instance (	// layer_tile.k:58:5
    .clk          (clk),	// layer_tile.k:58:5
    ._ReturnValue (p0_stage1_enable ? global_in__state_5_0 : 'x),	// layer_tile.k:58:5, :60:9
    .valid        (p0_stage1_enable),	// layer_tile.k:60:9
    .valid_out    (/* unused */)
  );	// layer_tile.k:58:5
  assign done_out = p0_stage2_enable;	// layer_tile.k:60:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// layer_tile.k:60:9
  assign fifo_wren_0 = fifo_wren_0_0;	// layer_tile.k:60:9
  assign input_rdy_0 = input_rdy_0_0;	// layer_tile.k:60:9
  assign control_state_out = control_state_out_0;	// layer_tile.k:60:9
endmodule

module layer_tile_get_layer_id_BasicBlock_0(	// layer_tile.k:53:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  input  wire [15:0] global_in__layer_id_6,
  output wire [15:0] fifo_data_out_0,
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
  wire  [15:0] global_in__layer_id_6_0 = global_in__layer_id_6;	// layer_tile.k:53:9
  logic        done_out_0;	// layer_tile.k:53:9
  logic [15:0] fifo_data_out_0_0;	// layer_tile.k:53:9
  logic        fifo_wren_0_0;	// layer_tile.k:53:9
  logic        input_rdy_0_0;	// layer_tile.k:53:9
  logic [7:0]  control_state_out_0;	// layer_tile.k:53:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// layer_tile.k:53:9
  always_comb begin	// layer_tile.k:53:9
    input_rdy_0_0 = _GEN;	// layer_tile.k:53:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// layer_tile.k:53:9
  end // always_comb
  reg          p0_stage1_enable = 1'h0;	// layer_tile.k:53:9
  reg   [15:0] p0_global_in__layer_id_6;	// layer_tile.k:53:9
  reg          p0_stage2_enable = 1'h0;	// layer_tile.k:53:9
  always @(posedge clk) begin	// layer_tile.k:53:9
    if (rst)	// layer_tile.k:53:9
      p0_stage1_enable <= 1'h0;	// layer_tile.k:53:9
    else	// layer_tile.k:53:9
      p0_stage1_enable <= _GEN & input_valid_0;	// layer_tile.k:53:9
    p0_global_in__layer_id_6 <= global_in__layer_id_6_0;	// layer_tile.k:53:9
    if (rst)	// layer_tile.k:53:9
      p0_stage2_enable <= 1'h0;	// layer_tile.k:53:9
    else	// layer_tile.k:53:9
      p0_stage2_enable <= p0_stage1_enable;	// layer_tile.k:53:9
  end // always @(posedge)
  always_comb begin	// layer_tile.k:53:9
    fifo_wren_0_0 = p0_stage2_enable;	// layer_tile.k:51:5, :53:9
    fifo_data_out_0_0 = p0_global_in__layer_id_6;	// layer_tile.k:51:5, :53:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// layer_tile.k:53:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// layer_tile.k:53:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  layer_tileDebugView_get_layer_idExit layer_tileDebugView_get_layer_idExit_instance (	// layer_tile.k:51:5
    .clk          (clk),	// layer_tile.k:51:5
    ._ReturnValue (p0_stage1_enable ? global_in__layer_id_6_0 : 'x),	// layer_tile.k:51:5, :53:9
    .valid        (p0_stage1_enable),	// layer_tile.k:53:9
    .valid_out    (/* unused */)
  );	// layer_tile.k:51:5
  assign done_out = p0_stage2_enable;	// layer_tile.k:53:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// layer_tile.k:53:9
  assign fifo_wren_0 = fifo_wren_0_0;	// layer_tile.k:53:9
  assign input_rdy_0 = input_rdy_0_0;	// layer_tile.k:53:9
  assign control_state_out = control_state_out_0;	// layer_tile.k:53:9
endmodule

module layer_tile_set_layer_id_BasicBlock_0(	// layer_tile.k:45:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  output wire        global_out__layer_id_6_0_valid,
  output wire [15:0] global_out__layer_id_6_0,
  output wire        fifo_wren_0,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [15:0] data_in_9,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  logic        done_out_0;	// layer_tile.k:45:9
  logic        global_out__layer_id_6_0_valid_0;	// layer_tile.k:45:9
  logic [15:0] global_out__layer_id_6_0_0;	// layer_tile.k:45:9
  logic        fifo_wren_0_0;	// layer_tile.k:45:9
  logic        input_rdy_0_0;	// layer_tile.k:45:9
  logic [7:0]  control_state_out_0;	// layer_tile.k:45:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// layer_tile.k:45:9
  always_comb begin	// layer_tile.k:45:9
    input_rdy_0_0 = _GEN;	// layer_tile.k:45:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// layer_tile.k:45:9
  end // always_comb
  reg   [15:0] p0_data_in_9;	// layer_tile.k:45:9
  reg          p0_stage1_enable = 1'h0;	// layer_tile.k:45:9
  always_comb begin	// layer_tile.k:45:9
    global_out__layer_id_6_0_0 = p0_data_in_9;	// layer_tile.k:45:9
    global_out__layer_id_6_0_valid_0 = p0_stage1_enable;	// layer_tile.k:45:9
  end // always_comb
  reg          p0_stage2_enable = 1'h0;	// layer_tile.k:45:9
  always @(posedge clk) begin	// layer_tile.k:45:9
    p0_data_in_9 <= data_in_9;	// layer_tile.k:45:9
    if (rst) begin	// layer_tile.k:45:9
      p0_stage1_enable <= 1'h0;	// layer_tile.k:45:9
      p0_stage2_enable <= 1'h0;	// layer_tile.k:45:9
    end
    else begin	// layer_tile.k:45:9
      p0_stage1_enable <= _GEN & input_valid_0;	// layer_tile.k:45:9
      p0_stage2_enable <= p0_stage1_enable;	// layer_tile.k:45:9
    end
  end // always @(posedge)
  always_comb	// layer_tile.k:45:9
    fifo_wren_0_0 = p0_stage2_enable;	// layer_tile.k:45:9, :49:9
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// layer_tile.k:45:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// layer_tile.k:45:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  layer_tileDebugView_set_layer_idEntry layer_tileDebugView_set_layer_idEntry_instance (	// layer_tile.k:49:9
    .clk       (clk),	// layer_tile.k:49:9
    ._id       (p0_stage1_enable ? p0_data_in_9 : 'x),	// layer_tile.k:45:9, :49:9
    .valid     (p0_stage1_enable),	// layer_tile.k:45:9
    .valid_out (/* unused */)
  );	// layer_tile.k:49:9
  assign done_out = p0_stage2_enable;	// layer_tile.k:45:9
  assign global_out__layer_id_6_0_valid = global_out__layer_id_6_0_valid_0;	// layer_tile.k:45:9
  assign global_out__layer_id_6_0 = global_out__layer_id_6_0_0;	// layer_tile.k:45:9
  assign fifo_wren_0 = fifo_wren_0_0;	// layer_tile.k:45:9
  assign input_rdy_0 = input_rdy_0_0;	// layer_tile.k:45:9
  assign control_state_out = control_state_out_0;	// layer_tile.k:45:9
endmodule

module layer_tile_reg_6_w3_v_1_6_0_v_2_6_0_i_6_0(
  input  wire       clk,
  input  wire       rst,
  input  wire       input_valid_0,
  input  wire [5:0] input_0,
  input  wire       input_valid_1,
  input  wire       input_valid_2,
  output wire [5:0] value_out
);

  reg [5:0] value;
  always @(posedge clk) begin
    if (rst)
      value <= 6'h0;
    else
      value <= input_valid_2 | input_valid_1 ? 6'h0 : input_valid_0 ? input_0 : value;
  end // always @(posedge)
  assign value_out = value;
endmodule

module layer_tile_reg_16_w1_i_16_0(
  input  wire        clk,
  input  wire        rst,
  input  wire        input_valid_0,
  input  wire [15:0] input_0,
  output wire [15:0] value_out
);

  reg [15:0] value;
  always @(posedge clk) begin
    if (rst)
      value <= 16'h0;
    else
      value <= input_valid_0 ? input_0 : value;
  end // always @(posedge)
  assign value_out = value;
endmodule

module layer_tile_reg_12_w2_v_1_12_0_i_12_0(
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

module layer_tile(
  input  wire        clk,
  input  wire        rst,
  input  wire        set_layer_id_valid_in,
  input  wire [15:0] set_layer_id_id_in,
  input  wire        set_layer_id_rden_in,
  input  wire        get_layer_id_valid_in,
  input  wire        get_layer_id_rden_in,
  input  wire        get_state_valid_in,
  input  wire        get_state_rden_in,
  input  wire        advance_state_valid_in,
  input  wire        advance_state_rden_in,
  input  wire        reset_state_valid_in,
  input  wire        reset_state_rden_in,
  input  wire        is_done_valid_in,
  input  wire        is_done_rden_in,
  input  wire        get_position_valid_in,
  input  wire        get_position_rden_in,
  input  wire        advance_position_valid_in,
  input  wire        advance_position_rden_in,
  input  wire        reset_valid_in,
  input  wire        reset_rden_in,
  input  wire [2:0]  stall_rate_in,
  input  wire        stall_rate_valid_in,
  output wire        rst_and_startup_done_out,
  output wire        set_layer_id_rdy_out,
  output wire        set_layer_id_empty_out,
  output wire        get_layer_id_rdy_out,
  output wire        get_layer_id_empty_out,
  output wire [15:0] get_layer_id_result_out,
  output wire        get_state_rdy_out,
  output wire        get_state_empty_out,
  output wire [5:0]  get_state_result_out,
  output wire        advance_state_rdy_out,
  output wire        advance_state_empty_out,
  output wire        reset_state_rdy_out,
  output wire        reset_state_empty_out,
  output wire        is_done_rdy_out,
  output wire        is_done_empty_out,
  output wire        is_done_result_out,
  output wire        get_position_rdy_out,
  output wire        get_position_empty_out,
  output wire [11:0] get_position_result_out,
  output wire        advance_position_rdy_out,
  output wire        advance_position_empty_out,
  output wire        reset_rdy_out,
  output wire        reset_empty_out,
  output wire        stall_rate_supported_out
);

  wire        _reset_BasicBlock_0Impl_global_out__state_5_2_valid;	// layer_tile.k:128:9
  wire        _reset_BasicBlock_0Impl_global_out__position_7_1_valid;	// layer_tile.k:128:9
  wire        _reset_BasicBlock_0Impl_fifo_wren_0;	// layer_tile.k:128:9
  wire        _reset_BasicBlock_0Impl_input_rdy_0;	// layer_tile.k:128:9
  wire        _advance_position_BasicBlock_0Impl_global_out__position_7_0_valid;	// layer_tile.k:111:9
  wire [11:0] _advance_position_BasicBlock_0Impl_global_out__position_7_0;	// layer_tile.k:111:9
  wire        _advance_position_BasicBlock_0Impl_fifo_wren_0;	// layer_tile.k:111:9
  wire        _advance_position_BasicBlock_0Impl_input_rdy_0;	// layer_tile.k:111:9
  wire [11:0] _get_position_BasicBlock_0Impl_fifo_data_out_0;	// layer_tile.k:105:9
  wire        _get_position_BasicBlock_0Impl_fifo_wren_0;	// layer_tile.k:105:9
  wire        _get_position_BasicBlock_0Impl_input_rdy_0;	// layer_tile.k:105:9
  wire        _is_done_BasicBlock_0Impl_fifo_data_out_0;	// layer_tile.k:86:9
  wire        _is_done_BasicBlock_0Impl_fifo_wren_0;	// layer_tile.k:86:9
  wire        _is_done_BasicBlock_0Impl_input_rdy_0;	// layer_tile.k:86:9
  wire        _reset_state_BasicBlock_0Impl_global_out__state_5_1_valid;	// layer_tile.k:78:9
  wire        _reset_state_BasicBlock_0Impl_fifo_wren_0;	// layer_tile.k:78:9
  wire        _reset_state_BasicBlock_0Impl_input_rdy_0;	// layer_tile.k:78:9
  wire        _advance_state_BasicBlock_0Impl_global_out__state_5_0_valid;	// layer_tile.k:67:9
  wire [5:0]  _advance_state_BasicBlock_0Impl_global_out__state_5_0;	// layer_tile.k:67:9
  wire        _advance_state_BasicBlock_0Impl_fifo_wren_0;	// layer_tile.k:67:9
  wire        _advance_state_BasicBlock_0Impl_input_rdy_0;	// layer_tile.k:67:9
  wire [5:0]  _get_state_BasicBlock_0Impl_fifo_data_out_0;	// layer_tile.k:60:9
  wire        _get_state_BasicBlock_0Impl_fifo_wren_0;	// layer_tile.k:60:9
  wire        _get_state_BasicBlock_0Impl_input_rdy_0;	// layer_tile.k:60:9
  wire [15:0] _get_layer_id_BasicBlock_0Impl_fifo_data_out_0;	// layer_tile.k:53:9
  wire        _get_layer_id_BasicBlock_0Impl_fifo_wren_0;	// layer_tile.k:53:9
  wire        _get_layer_id_BasicBlock_0Impl_input_rdy_0;	// layer_tile.k:53:9
  wire        _set_layer_id_BasicBlock_0Impl_global_out__layer_id_6_0_valid;	// layer_tile.k:45:9
  wire [15:0] _set_layer_id_BasicBlock_0Impl_global_out__layer_id_6_0;	// layer_tile.k:45:9
  wire        _set_layer_id_BasicBlock_0Impl_fifo_wren_0;	// layer_tile.k:45:9
  wire        _set_layer_id_BasicBlock_0Impl_input_rdy_0;	// layer_tile.k:45:9
  wire        _fifo_8_reset_Return_overflow_out;
  wire        _fifo_8_reset_Return_underflow_out;
  wire        _fifo_8_reset_Return_empty;
  wire        _fifo_8_reset_Return_full;
  wire        _fifo_7_advance_position_Return_overflow_out;
  wire        _fifo_7_advance_position_Return_underflow_out;
  wire        _fifo_7_advance_position_Return_empty;
  wire        _fifo_7_advance_position_Return_full;
  wire        _fifo_6_get_position_Return_overflow_out;
  wire        _fifo_6_get_position_Return_underflow_out;
  wire        _fifo_6_get_position_Return_empty;
  wire        _fifo_6_get_position_Return_full;
  wire [11:0] _fifo_6_get_position_Return_q;
  wire        _fifo_5_is_done_Return_overflow_out;
  wire        _fifo_5_is_done_Return_underflow_out;
  wire        _fifo_5_is_done_Return_empty;
  wire        _fifo_5_is_done_Return_full;
  wire        _fifo_5_is_done_Return_q;
  wire        _fifo_4_reset_state_Return_overflow_out;
  wire        _fifo_4_reset_state_Return_underflow_out;
  wire        _fifo_4_reset_state_Return_empty;
  wire        _fifo_4_reset_state_Return_full;
  wire        _fifo_3_advance_state_Return_overflow_out;
  wire        _fifo_3_advance_state_Return_underflow_out;
  wire        _fifo_3_advance_state_Return_empty;
  wire        _fifo_3_advance_state_Return_full;
  wire        _fifo_2_get_state_Return_overflow_out;
  wire        _fifo_2_get_state_Return_underflow_out;
  wire        _fifo_2_get_state_Return_empty;
  wire        _fifo_2_get_state_Return_full;
  wire [5:0]  _fifo_2_get_state_Return_q;
  wire        _fifo_1_get_layer_id_Return_overflow_out;
  wire        _fifo_1_get_layer_id_Return_underflow_out;
  wire        _fifo_1_get_layer_id_Return_empty;
  wire        _fifo_1_get_layer_id_Return_full;
  wire [15:0] _fifo_1_get_layer_id_Return_q;
  wire        _fifo_0_set_layer_id_Return_overflow_out;
  wire        _fifo_0_set_layer_id_Return_underflow_out;
  wire        _fifo_0_set_layer_id_Return_empty;
  wire        _fifo_0_set_layer_id_Return_full;
  wire        _has_startup_completed_delayed_8_delay_chain_data_out;
  wire        _has_startup_completed_delayed_7_delay_chain_data_out;
  wire        _has_startup_completed_delayed_6_delay_chain_data_out;
  wire        _has_startup_completed_delayed_5_delay_chain_data_out;
  wire        _has_startup_completed_delayed_4_delay_chain_data_out;
  wire        _has_startup_completed_delayed_3_delay_chain_data_out;
  wire        _has_startup_completed_delayed_2_delay_chain_data_out;
  wire        _has_startup_completed_delayed_1_delay_chain_data_out;
  wire        _has_startup_completed_delayed_0_delay_chain_data_out;
  wire [11:0] __position_value_out;	// layer_tile.k:38:5
  wire [15:0] __layer_id_value_out;	// layer_tile.k:35:5
  wire [5:0]  __state_value_out;	// layer_tile.k:32:5
  wire        _reset_control_rst_and_startup_done_out;
  wire [20:0] _reset_control_rst_delayed_out;
  wire        _reset_control_reset_sequence_finished_this_cycle_out;
  logic  stall_rate_supported_out_net;
  logic  reset_empty_out_net;
  logic  reset_rdy_out_net;
  logic  advance_position_empty_out_net;
  logic  advance_position_rdy_out_net;
  logic  get_position_empty_out_net;
  logic [11:0] get_position_result_out_net;
  logic  get_position_rdy_out_net;
  logic  is_done_empty_out_net;
  logic  is_done_result_out_net;
  logic  is_done_rdy_out_net;
  logic  reset_state_empty_out_net;
  logic  reset_state_rdy_out_net;
  logic  advance_state_empty_out_net;
  logic  advance_state_rdy_out_net;
  logic  get_state_empty_out_net;
  logic [5:0] get_state_result_out_net;
  logic  get_state_rdy_out_net;
  logic  get_layer_id_empty_out_net;
  logic [15:0] get_layer_id_result_out_net;
  logic  get_layer_id_rdy_out_net;
  logic  set_layer_id_empty_out_net;
  logic  set_layer_id_rdy_out_net;
  logic  rst_and_startup_done_out_net;

  logic [31:0] dropped_commands;
  //synopsys translate_off
  KanagawaStringTable string_table(.clk(clk));
  //synopsys translate_on
  logic [20:0] reg_rst_delayed;
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
      logic [0:0] data_in;
      logic [0:0] data_out;
      logic overflow;
      logic underflow;
  } fifo_data_5;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [11:0] data_in;
      logic [11:0] data_out;
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
      logic overflow;
      logic underflow;
  } fifo_data_8;

  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [15:0] data;
      logic underflow;
  } passthrough_data_9;
  assign passthrough_data_9.underflow = 1'b0;
  assign passthrough_data_9.rdy_ext = passthrough_data_9.rdy_int & !(!has_startup_completed_delayed_0);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic underflow;
  } passthrough_data_10;
  assign passthrough_data_10.underflow = 1'b0;
  assign passthrough_data_10.rdy_ext = passthrough_data_10.rdy_int & !(!has_startup_completed_delayed_1);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic underflow;
  } passthrough_data_11;
  assign passthrough_data_11.underflow = 1'b0;
  assign passthrough_data_11.rdy_ext = passthrough_data_11.rdy_int & !(!has_startup_completed_delayed_2);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic underflow;
  } passthrough_data_12;
  assign passthrough_data_12.underflow = 1'b0;
  assign passthrough_data_12.rdy_ext = passthrough_data_12.rdy_int & !(!has_startup_completed_delayed_3);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic underflow;
  } passthrough_data_13;
  assign passthrough_data_13.underflow = 1'b0;
  assign passthrough_data_13.rdy_ext = passthrough_data_13.rdy_int & !(!has_startup_completed_delayed_4);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic underflow;
  } passthrough_data_14;
  assign passthrough_data_14.underflow = 1'b0;
  assign passthrough_data_14.rdy_ext = passthrough_data_14.rdy_int & !(!has_startup_completed_delayed_5);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic underflow;
  } passthrough_data_15;
  assign passthrough_data_15.underflow = 1'b0;
  assign passthrough_data_15.rdy_ext = passthrough_data_15.rdy_int & !(!has_startup_completed_delayed_6);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic underflow;
  } passthrough_data_16;
  assign passthrough_data_16.underflow = 1'b0;
  assign passthrough_data_16.rdy_ext = passthrough_data_16.rdy_int & !(!has_startup_completed_delayed_7);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic underflow;
  } passthrough_data_17;
  assign passthrough_data_17.underflow = 1'b0;
  assign passthrough_data_17.rdy_ext = passthrough_data_17.rdy_int & !(!has_startup_completed_delayed_8);
  assign set_layer_id_rdy_out_net = passthrough_data_9.rdy_ext;
  assign passthrough_data_9.valid = set_layer_id_rdy_out & set_layer_id_valid_in;
  assign passthrough_data_9.data = { set_layer_id_id_in };
  assign fifo_data_0.rden = set_layer_id_rden_in;
  assign set_layer_id_empty_out_net = fifo_data_0.empty;
  assign get_layer_id_rdy_out_net = passthrough_data_10.rdy_ext;
  assign passthrough_data_10.valid = get_layer_id_rdy_out & get_layer_id_valid_in;
  assign fifo_data_1.rden = get_layer_id_rden_in;
  assign get_layer_id_result_out_net = fifo_data_1.data_out;
  assign get_layer_id_empty_out_net = fifo_data_1.empty;
  assign get_state_rdy_out_net = passthrough_data_11.rdy_ext;
  assign passthrough_data_11.valid = get_state_rdy_out & get_state_valid_in;
  assign fifo_data_2.rden = get_state_rden_in;
  assign get_state_result_out_net = fifo_data_2.data_out;
  assign get_state_empty_out_net = fifo_data_2.empty;
  assign advance_state_rdy_out_net = passthrough_data_12.rdy_ext;
  assign passthrough_data_12.valid = advance_state_rdy_out & advance_state_valid_in;
  assign fifo_data_3.rden = advance_state_rden_in;
  assign advance_state_empty_out_net = fifo_data_3.empty;
  assign reset_state_rdy_out_net = passthrough_data_13.rdy_ext;
  assign passthrough_data_13.valid = reset_state_rdy_out & reset_state_valid_in;
  assign fifo_data_4.rden = reset_state_rden_in;
  assign reset_state_empty_out_net = fifo_data_4.empty;
  assign is_done_rdy_out_net = passthrough_data_14.rdy_ext;
  assign passthrough_data_14.valid = is_done_rdy_out & is_done_valid_in;
  assign fifo_data_5.rden = is_done_rden_in;
  assign is_done_result_out_net = fifo_data_5.data_out;
  assign is_done_empty_out_net = fifo_data_5.empty;
  assign get_position_rdy_out_net = passthrough_data_15.rdy_ext;
  assign passthrough_data_15.valid = get_position_rdy_out & get_position_valid_in;
  assign fifo_data_6.rden = get_position_rden_in;
  assign get_position_result_out_net = fifo_data_6.data_out;
  assign get_position_empty_out_net = fifo_data_6.empty;
  assign advance_position_rdy_out_net = passthrough_data_16.rdy_ext;
  assign passthrough_data_16.valid = advance_position_rdy_out & advance_position_valid_in;
  assign fifo_data_7.rden = advance_position_rden_in;
  assign advance_position_empty_out_net = fifo_data_7.empty;
  assign reset_rdy_out_net = passthrough_data_17.rdy_ext;
  assign passthrough_data_17.valid = reset_rdy_out & reset_valid_in;
  assign fifo_data_8.rden = reset_rden_in;
  assign reset_empty_out_net = fifo_data_8.empty;
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
    fifo_data_0.overflow = _fifo_0_set_layer_id_Return_overflow_out;
    fifo_data_0.underflow = _fifo_0_set_layer_id_Return_underflow_out;
    fifo_data_0.empty = _fifo_0_set_layer_id_Return_empty;
    fifo_data_0.almost_full = _fifo_0_set_layer_id_Return_full;
    fifo_data_1.overflow = _fifo_1_get_layer_id_Return_overflow_out;
    fifo_data_1.underflow = _fifo_1_get_layer_id_Return_underflow_out;
    fifo_data_1.empty = _fifo_1_get_layer_id_Return_empty;
    fifo_data_1.almost_full = _fifo_1_get_layer_id_Return_full;
    fifo_data_1.data_out = _fifo_1_get_layer_id_Return_q;
    fifo_data_2.overflow = _fifo_2_get_state_Return_overflow_out;
    fifo_data_2.underflow = _fifo_2_get_state_Return_underflow_out;
    fifo_data_2.empty = _fifo_2_get_state_Return_empty;
    fifo_data_2.almost_full = _fifo_2_get_state_Return_full;
    fifo_data_2.data_out = _fifo_2_get_state_Return_q;
    fifo_data_3.overflow = _fifo_3_advance_state_Return_overflow_out;
    fifo_data_3.underflow = _fifo_3_advance_state_Return_underflow_out;
    fifo_data_3.empty = _fifo_3_advance_state_Return_empty;
    fifo_data_3.almost_full = _fifo_3_advance_state_Return_full;
    fifo_data_4.overflow = _fifo_4_reset_state_Return_overflow_out;
    fifo_data_4.underflow = _fifo_4_reset_state_Return_underflow_out;
    fifo_data_4.empty = _fifo_4_reset_state_Return_empty;
    fifo_data_4.almost_full = _fifo_4_reset_state_Return_full;
    fifo_data_5.overflow = _fifo_5_is_done_Return_overflow_out;
    fifo_data_5.underflow = _fifo_5_is_done_Return_underflow_out;
    fifo_data_5.empty = _fifo_5_is_done_Return_empty;
    fifo_data_5.almost_full = _fifo_5_is_done_Return_full;
    fifo_data_5.data_out = _fifo_5_is_done_Return_q;
    fifo_data_6.overflow = _fifo_6_get_position_Return_overflow_out;
    fifo_data_6.underflow = _fifo_6_get_position_Return_underflow_out;
    fifo_data_6.empty = _fifo_6_get_position_Return_empty;
    fifo_data_6.almost_full = _fifo_6_get_position_Return_full;
    fifo_data_6.data_out = _fifo_6_get_position_Return_q;
    fifo_data_7.overflow = _fifo_7_advance_position_Return_overflow_out;
    fifo_data_7.underflow = _fifo_7_advance_position_Return_underflow_out;
    fifo_data_7.empty = _fifo_7_advance_position_Return_empty;
    fifo_data_7.almost_full = _fifo_7_advance_position_Return_full;
    fifo_data_8.overflow = _fifo_8_reset_Return_overflow_out;
    fifo_data_8.underflow = _fifo_8_reset_Return_underflow_out;
    fifo_data_8.empty = _fifo_8_reset_Return_empty;
    fifo_data_8.almost_full = _fifo_8_reset_Return_full;
    fifo_data_0.wren = _set_layer_id_BasicBlock_0Impl_fifo_wren_0;	// layer_tile.k:45:9
    passthrough_data_9.rdy_int = _set_layer_id_BasicBlock_0Impl_input_rdy_0;	// layer_tile.k:45:9
    fifo_data_1.data_in = _get_layer_id_BasicBlock_0Impl_fifo_data_out_0;	// layer_tile.k:53:9
    fifo_data_1.wren = _get_layer_id_BasicBlock_0Impl_fifo_wren_0;	// layer_tile.k:53:9
    passthrough_data_10.rdy_int = _get_layer_id_BasicBlock_0Impl_input_rdy_0;	// layer_tile.k:53:9
    fifo_data_2.data_in = _get_state_BasicBlock_0Impl_fifo_data_out_0;	// layer_tile.k:60:9
    fifo_data_2.wren = _get_state_BasicBlock_0Impl_fifo_wren_0;	// layer_tile.k:60:9
    passthrough_data_11.rdy_int = _get_state_BasicBlock_0Impl_input_rdy_0;	// layer_tile.k:60:9
    fifo_data_3.wren = _advance_state_BasicBlock_0Impl_fifo_wren_0;	// layer_tile.k:67:9
    passthrough_data_12.rdy_int = _advance_state_BasicBlock_0Impl_input_rdy_0;	// layer_tile.k:67:9
    fifo_data_4.wren = _reset_state_BasicBlock_0Impl_fifo_wren_0;	// layer_tile.k:78:9
    passthrough_data_13.rdy_int = _reset_state_BasicBlock_0Impl_input_rdy_0;	// layer_tile.k:78:9
    fifo_data_5.data_in = _is_done_BasicBlock_0Impl_fifo_data_out_0;	// layer_tile.k:86:9
    fifo_data_5.wren = _is_done_BasicBlock_0Impl_fifo_wren_0;	// layer_tile.k:86:9
    passthrough_data_14.rdy_int = _is_done_BasicBlock_0Impl_input_rdy_0;	// layer_tile.k:86:9
    fifo_data_6.data_in = _get_position_BasicBlock_0Impl_fifo_data_out_0;	// layer_tile.k:105:9
    fifo_data_6.wren = _get_position_BasicBlock_0Impl_fifo_wren_0;	// layer_tile.k:105:9
    passthrough_data_15.rdy_int = _get_position_BasicBlock_0Impl_input_rdy_0;	// layer_tile.k:105:9
    fifo_data_7.wren = _advance_position_BasicBlock_0Impl_fifo_wren_0;	// layer_tile.k:111:9
    passthrough_data_16.rdy_int = _advance_position_BasicBlock_0Impl_input_rdy_0;	// layer_tile.k:111:9
    fifo_data_8.wren = _reset_BasicBlock_0Impl_fifo_wren_0;	// layer_tile.k:128:9
    passthrough_data_17.rdy_int = _reset_BasicBlock_0Impl_input_rdy_0;	// layer_tile.k:128:9
  end // always_comb

  assign has_startup_completed_raw = 1'b1;
  assign stall_rate_supported_out_net = 1'b0;
  KanagawaResetControl #(
    .WIDTH(21),
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
  layer_tile_reg_6_w3_v_1_6_0_v_2_6_0_i_6_0 _state (	// layer_tile.k:32:5
    .clk           (clk),	// layer_tile.k:32:5
    .rst           (reg_rst_delayed[0]),	// layer_tile.k:32:5
    .input_valid_0 (_advance_state_BasicBlock_0Impl_global_out__state_5_0_valid),	// layer_tile.k:67:9
    .input_0       (_advance_state_BasicBlock_0Impl_global_out__state_5_0),	// layer_tile.k:67:9
    .input_valid_1 (_reset_state_BasicBlock_0Impl_global_out__state_5_1_valid),	// layer_tile.k:78:9
    .input_valid_2 (_reset_BasicBlock_0Impl_global_out__state_5_2_valid),	// layer_tile.k:128:9
    .value_out     (__state_value_out)
  );	// layer_tile.k:32:5
  layer_tile_reg_16_w1_i_16_0 _layer_id (	// layer_tile.k:35:5
    .clk           (clk),	// layer_tile.k:32:5
    .rst           (reg_rst_delayed[1]),	// layer_tile.k:35:5
    .input_valid_0 (_set_layer_id_BasicBlock_0Impl_global_out__layer_id_6_0_valid),	// layer_tile.k:45:9
    .input_0       (_set_layer_id_BasicBlock_0Impl_global_out__layer_id_6_0),	// layer_tile.k:45:9
    .value_out     (__layer_id_value_out)
  );	// layer_tile.k:35:5
  layer_tile_reg_12_w2_v_1_12_0_i_12_0 _position (	// layer_tile.k:38:5
    .clk           (clk),	// layer_tile.k:32:5
    .rst           (reg_rst_delayed[2]),	// layer_tile.k:38:5
    .input_valid_0 (_advance_position_BasicBlock_0Impl_global_out__position_7_0_valid),	// layer_tile.k:111:9
    .input_0       (_advance_position_BasicBlock_0Impl_global_out__position_7_0),	// layer_tile.k:111:9
    .input_valid_1 (_reset_BasicBlock_0Impl_global_out__position_7_1_valid),	// layer_tile.k:128:9
    .value_out     (__position_value_out)
  );	// layer_tile.k:38:5
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
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(0),
    .PORT_WIDTH(1),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_0_set_layer_id_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(0)
  ) fifo_0_set_layer_id_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[3]),
    .overflow_out  (_fifo_0_set_layer_id_Return_overflow_out),
    .underflow_out (_fifo_0_set_layer_id_Return_underflow_out),
    .empty         (_fifo_0_set_layer_id_Return_empty),
    .rdreq         (fifo_data_0.rden),
    .full          (_fifo_0_set_layer_id_Return_full),
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
    .AUTO_PIPELINE_GROUP("fifo_1_get_layer_id_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(1)
  ) fifo_1_get_layer_id_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[4]),
    .overflow_out  (_fifo_1_get_layer_id_Return_overflow_out),
    .underflow_out (_fifo_1_get_layer_id_Return_underflow_out),
    .empty         (_fifo_1_get_layer_id_Return_empty),
    .rdreq         (fifo_data_1.rden),
    .full          (_fifo_1_get_layer_id_Return_full),
    .wrreq         (fifo_data_1.wren),
    .data          (fifo_data_1.data_in),
    .q             (_fifo_1_get_layer_id_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(6),
    .PORT_WIDTH(6),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_2_get_state_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(1)
  ) fifo_2_get_state_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[5]),
    .overflow_out  (_fifo_2_get_state_Return_overflow_out),
    .underflow_out (_fifo_2_get_state_Return_underflow_out),
    .empty         (_fifo_2_get_state_Return_empty),
    .rdreq         (fifo_data_2.rden),
    .full          (_fifo_2_get_state_Return_full),
    .wrreq         (fifo_data_2.wren),
    .data          (fifo_data_2.data_in),
    .q             (_fifo_2_get_state_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(0),
    .PORT_WIDTH(1),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_3_advance_state_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(0)
  ) fifo_3_advance_state_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[6]),
    .overflow_out  (_fifo_3_advance_state_Return_overflow_out),
    .underflow_out (_fifo_3_advance_state_Return_underflow_out),
    .empty         (_fifo_3_advance_state_Return_empty),
    .rdreq         (fifo_data_3.rden),
    .full          (_fifo_3_advance_state_Return_full),
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
    .AUTO_PIPELINE_GROUP("fifo_4_reset_state_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(0)
  ) fifo_4_reset_state_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[7]),
    .overflow_out  (_fifo_4_reset_state_Return_overflow_out),
    .underflow_out (_fifo_4_reset_state_Return_underflow_out),
    .empty         (_fifo_4_reset_state_Return_empty),
    .rdreq         (fifo_data_4.rden),
    .full          (_fifo_4_reset_state_Return_full),
    .wrreq         (fifo_data_4.wren),
    .data          ('0),
    .q             (/* unused */)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(1),
    .PORT_WIDTH(1),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_5_is_done_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(1)
  ) fifo_5_is_done_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[8]),
    .overflow_out  (_fifo_5_is_done_Return_overflow_out),
    .underflow_out (_fifo_5_is_done_Return_underflow_out),
    .empty         (_fifo_5_is_done_Return_empty),
    .rdreq         (fifo_data_5.rden),
    .full          (_fifo_5_is_done_Return_full),
    .wrreq         (fifo_data_5.wren),
    .data          (fifo_data_5.data_in),
    .q             (_fifo_5_is_done_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(12),
    .PORT_WIDTH(12),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_6_get_position_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(1)
  ) fifo_6_get_position_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[9]),
    .overflow_out  (_fifo_6_get_position_Return_overflow_out),
    .underflow_out (_fifo_6_get_position_Return_underflow_out),
    .empty         (_fifo_6_get_position_Return_empty),
    .rdreq         (fifo_data_6.rden),
    .full          (_fifo_6_get_position_Return_full),
    .wrreq         (fifo_data_6.wren),
    .data          (fifo_data_6.data_in),
    .q             (_fifo_6_get_position_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(0),
    .PORT_WIDTH(1),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_7_advance_position_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(0)
  ) fifo_7_advance_position_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[10]),
    .overflow_out  (_fifo_7_advance_position_Return_overflow_out),
    .underflow_out (_fifo_7_advance_position_Return_underflow_out),
    .empty         (_fifo_7_advance_position_Return_empty),
    .rdreq         (fifo_data_7.rden),
    .full          (_fifo_7_advance_position_Return_full),
    .wrreq         (fifo_data_7.wren),
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
    .AUTO_PIPELINE_GROUP("fifo_8_reset_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(0)
  ) fifo_8_reset_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[11]),
    .overflow_out  (_fifo_8_reset_Return_overflow_out),
    .underflow_out (_fifo_8_reset_Return_underflow_out),
    .empty         (_fifo_8_reset_Return_empty),
    .rdreq         (fifo_data_8.rden),
    .full          (_fifo_8_reset_Return_full),
    .wrreq         (fifo_data_8.wren),
    .data          ('0),
    .q             (/* unused */)
  );
  layer_tile_set_layer_id_BasicBlock_0 set_layer_id_BasicBlock_0Impl (	// layer_tile.k:45:9
    .clk                            (clk),	// layer_tile.k:45:9
    .rst                            (reg_rst_delayed[12]),	// layer_tile.k:45:9
    .done_out                       (/* unused */),
    .global_out__layer_id_6_0_valid
      (_set_layer_id_BasicBlock_0Impl_global_out__layer_id_6_0_valid),
    .global_out__layer_id_6_0
      (_set_layer_id_BasicBlock_0Impl_global_out__layer_id_6_0),
    .fifo_wren_0                    (_set_layer_id_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0      (fifo_data_0.almost_full),	// layer_tile.k:45:9
    .fifo_overflow_in_0             (fifo_data_0.overflow),	// layer_tile.k:45:9
    .data_in_9                      (passthrough_data_9.data),	// layer_tile.k:45:9
    .input_fifo_underflow_0         (passthrough_data_9.underflow),	// layer_tile.k:45:9
    .input_rdy_0                    (_set_layer_id_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0                  (passthrough_data_9.valid),	// layer_tile.k:45:9
    .control_state_out              (/* unused */)
  );	// layer_tile.k:45:9
  layer_tile_get_layer_id_BasicBlock_0 get_layer_id_BasicBlock_0Impl (	// layer_tile.k:53:9
    .clk                       (clk),	// layer_tile.k:53:9
    .rst                       (reg_rst_delayed[13]),	// layer_tile.k:53:9
    .done_out                  (/* unused */),
    .global_in__layer_id_6     (__layer_id_value_out),	// layer_tile.k:35:5
    .fifo_data_out_0           (_get_layer_id_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0               (_get_layer_id_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_1.almost_full),	// layer_tile.k:53:9
    .fifo_overflow_in_0        (fifo_data_1.overflow),	// layer_tile.k:53:9
    .input_fifo_underflow_0    (passthrough_data_10.underflow),	// layer_tile.k:53:9
    .input_rdy_0               (_get_layer_id_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_10.valid),	// layer_tile.k:53:9
    .control_state_out         (/* unused */)
  );	// layer_tile.k:53:9
  layer_tile_get_state_BasicBlock_0 get_state_BasicBlock_0Impl (	// layer_tile.k:60:9
    .clk                       (clk),	// layer_tile.k:60:9
    .rst                       (reg_rst_delayed[14]),	// layer_tile.k:60:9
    .done_out                  (/* unused */),
    .global_in__state_5        (__state_value_out),	// layer_tile.k:32:5
    .fifo_data_out_0           (_get_state_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0               (_get_state_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_2.almost_full),	// layer_tile.k:60:9
    .fifo_overflow_in_0        (fifo_data_2.overflow),	// layer_tile.k:60:9
    .input_fifo_underflow_0    (passthrough_data_11.underflow),	// layer_tile.k:60:9
    .input_rdy_0               (_get_state_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_11.valid),	// layer_tile.k:60:9
    .control_state_out         (/* unused */)
  );	// layer_tile.k:60:9
  layer_tile_advance_state_BasicBlock_0 advance_state_BasicBlock_0Impl (	// layer_tile.k:67:9
    .clk                         (clk),	// layer_tile.k:67:9
    .rst                         (reg_rst_delayed[15]),	// layer_tile.k:67:9
    .done_out                    (/* unused */),
    .global_in__state_5          (__state_value_out),	// layer_tile.k:32:5
    .global_out__state_5_0_valid
      (_advance_state_BasicBlock_0Impl_global_out__state_5_0_valid),
    .global_out__state_5_0       (_advance_state_BasicBlock_0Impl_global_out__state_5_0),
    .fifo_wren_0                 (_advance_state_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0   (fifo_data_3.almost_full),	// layer_tile.k:67:9
    .fifo_overflow_in_0          (fifo_data_3.overflow),	// layer_tile.k:67:9
    .input_fifo_underflow_0      (passthrough_data_12.underflow),	// layer_tile.k:67:9
    .input_rdy_0                 (_advance_state_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0               (passthrough_data_12.valid),	// layer_tile.k:67:9
    .control_state_out           (/* unused */)
  );	// layer_tile.k:67:9
  layer_tile_reset_state_BasicBlock_0 reset_state_BasicBlock_0Impl (	// layer_tile.k:78:9
    .clk                         (clk),	// layer_tile.k:78:9
    .rst                         (reg_rst_delayed[16]),	// layer_tile.k:78:9
    .done_out                    (/* unused */),
    .global_out__state_5_1_valid
      (_reset_state_BasicBlock_0Impl_global_out__state_5_1_valid),
    .fifo_wren_0                 (_reset_state_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0   (fifo_data_4.almost_full),	// layer_tile.k:78:9
    .fifo_overflow_in_0          (fifo_data_4.overflow),	// layer_tile.k:78:9
    .input_fifo_underflow_0      (passthrough_data_13.underflow),	// layer_tile.k:78:9
    .input_rdy_0                 (_reset_state_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0               (passthrough_data_13.valid),	// layer_tile.k:78:9
    .control_state_out           (/* unused */)
  );	// layer_tile.k:78:9
  layer_tile_is_done_BasicBlock_0 is_done_BasicBlock_0Impl (	// layer_tile.k:86:9
    .clk                       (clk),	// layer_tile.k:86:9
    .rst                       (reg_rst_delayed[17]),	// layer_tile.k:86:9
    .done_out                  (/* unused */),
    .global_in__state_5        (__state_value_out),	// layer_tile.k:32:5
    .fifo_data_out_0           (_is_done_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0               (_is_done_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_5.almost_full),	// layer_tile.k:86:9
    .fifo_overflow_in_0        (fifo_data_5.overflow),	// layer_tile.k:86:9
    .input_fifo_underflow_0    (passthrough_data_14.underflow),	// layer_tile.k:86:9
    .input_rdy_0               (_is_done_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_14.valid),	// layer_tile.k:86:9
    .control_state_out         (/* unused */)
  );	// layer_tile.k:86:9
  layer_tile_get_position_BasicBlock_0 get_position_BasicBlock_0Impl (	// layer_tile.k:105:9
    .clk                       (clk),	// layer_tile.k:105:9
    .rst                       (reg_rst_delayed[18]),	// layer_tile.k:105:9
    .done_out                  (/* unused */),
    .global_in__position_7     (__position_value_out),	// layer_tile.k:38:5
    .fifo_data_out_0           (_get_position_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0               (_get_position_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_6.almost_full),	// layer_tile.k:105:9
    .fifo_overflow_in_0        (fifo_data_6.overflow),	// layer_tile.k:105:9
    .input_fifo_underflow_0    (passthrough_data_15.underflow),	// layer_tile.k:105:9
    .input_rdy_0               (_get_position_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_15.valid),	// layer_tile.k:105:9
    .control_state_out         (/* unused */)
  );	// layer_tile.k:105:9
  layer_tile_advance_position_BasicBlock_0 advance_position_BasicBlock_0Impl (	// layer_tile.k:111:9
    .clk                            (clk),	// layer_tile.k:111:9
    .rst                            (reg_rst_delayed[19]),	// layer_tile.k:111:9
    .done_out                       (/* unused */),
    .global_in__position_7          (__position_value_out),	// layer_tile.k:38:5
    .global_out__position_7_0_valid
      (_advance_position_BasicBlock_0Impl_global_out__position_7_0_valid),
    .global_out__position_7_0
      (_advance_position_BasicBlock_0Impl_global_out__position_7_0),
    .fifo_wren_0                    (_advance_position_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0      (fifo_data_7.almost_full),	// layer_tile.k:111:9
    .fifo_overflow_in_0             (fifo_data_7.overflow),	// layer_tile.k:111:9
    .input_fifo_underflow_0         (passthrough_data_16.underflow),	// layer_tile.k:111:9
    .input_rdy_0                    (_advance_position_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0                  (passthrough_data_16.valid),	// layer_tile.k:111:9
    .control_state_out              (/* unused */)
  );	// layer_tile.k:111:9
  layer_tile_reset_BasicBlock_0 reset_BasicBlock_0Impl (	// layer_tile.k:128:9
    .clk                            (clk),	// layer_tile.k:128:9
    .rst                            (reg_rst_delayed[20]),	// layer_tile.k:128:9
    .done_out                       (/* unused */),
    .global_out__state_5_2_valid    (_reset_BasicBlock_0Impl_global_out__state_5_2_valid),
    .global_out__position_7_1_valid
      (_reset_BasicBlock_0Impl_global_out__position_7_1_valid),
    .fifo_wren_0                    (_reset_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0      (fifo_data_8.almost_full),	// layer_tile.k:128:9
    .fifo_overflow_in_0             (fifo_data_8.overflow),	// layer_tile.k:128:9
    .input_fifo_underflow_0         (passthrough_data_17.underflow),	// layer_tile.k:128:9
    .input_rdy_0                    (_reset_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0                  (passthrough_data_17.valid),	// layer_tile.k:128:9
    .control_state_out              (/* unused */)
  );	// layer_tile.k:128:9
  assign rst_and_startup_done_out = rst_and_startup_done_out_net;
  assign set_layer_id_rdy_out = set_layer_id_rdy_out_net;
  assign set_layer_id_empty_out = set_layer_id_empty_out_net;
  assign get_layer_id_rdy_out = get_layer_id_rdy_out_net;
  assign get_layer_id_empty_out = get_layer_id_empty_out_net;
  assign get_layer_id_result_out = get_layer_id_result_out_net;
  assign get_state_rdy_out = get_state_rdy_out_net;
  assign get_state_empty_out = get_state_empty_out_net;
  assign get_state_result_out = get_state_result_out_net;
  assign advance_state_rdy_out = advance_state_rdy_out_net;
  assign advance_state_empty_out = advance_state_empty_out_net;
  assign reset_state_rdy_out = reset_state_rdy_out_net;
  assign reset_state_empty_out = reset_state_empty_out_net;
  assign is_done_rdy_out = is_done_rdy_out_net;
  assign is_done_empty_out = is_done_empty_out_net;
  assign is_done_result_out = is_done_result_out_net;
  assign get_position_rdy_out = get_position_rdy_out_net;
  assign get_position_empty_out = get_position_empty_out_net;
  assign get_position_result_out = get_position_result_out_net;
  assign advance_position_rdy_out = advance_position_rdy_out_net;
  assign advance_position_empty_out = advance_position_empty_out_net;
  assign reset_rdy_out = reset_rdy_out_net;
  assign reset_empty_out = reset_empty_out_net;
  assign stall_rate_supported_out = stall_rate_supported_out_net;
endmodule

module layer_tile_EsiWrapper(
     input  wire                                   clk,
     input  wire                                   rst,
     input  wire [2:0]                             stall_rate_in,
     input  wire                                   stall_rate_valid_in,
  // input  wire /*Zero Width*/                    advance_position_arg,
     input  wire                                   advance_position_arg_valid,
  // input  wire /*Zero Width*/                    advance_state_arg,
     input  wire                                   advance_state_arg_valid,
  // input  wire /*Zero Width*/                    get_layer_id_arg,
     input  wire                                   get_layer_id_arg_valid,
  // input  wire /*Zero Width*/                    get_position_arg,
     input  wire                                   get_position_arg_valid,
  // input  wire /*Zero Width*/                    get_state_arg,
     input  wire                                   get_state_arg_valid,
  // input  wire /*Zero Width*/                    is_done_arg,
     input  wire                                   is_done_arg_valid,
  // input  wire /*Zero Width*/                    reset_arg,
     input  wire                                   reset_arg_valid,
  // input  wire /*Zero Width*/                    reset_state_arg,
     input  wire                                   reset_state_arg_valid,
     input  wire struct packed {logic [15:0] id; } set_layer_id_arg,
     input  wire                                   set_layer_id_arg_valid,
     input  wire                                   advance_position_result_rden,
     input  wire                                   advance_state_result_rden,
     input  wire                                   get_layer_id_result_rden,
     input  wire                                   get_position_result_rden,
     input  wire                                   get_state_result_rden,
     input  wire                                   is_done_result_rden,
     input  wire                                   reset_result_rden,
     input  wire                                   reset_state_result_rden,
     input  wire                                   set_layer_id_result_rden,
     output wire                                   advance_position_arg_ready,
     output wire                                   advance_state_arg_ready,
     output wire                                   get_layer_id_arg_ready,
     output wire                                   get_position_arg_ready,
     output wire                                   get_state_arg_ready,
     output wire                                   is_done_arg_ready,
     output wire                                   reset_arg_ready,
     output wire                                   reset_state_arg_ready,
     output wire                                   set_layer_id_arg_ready,
  // output wire /*Zero Width*/                    advance_position_result,
     output wire                                   advance_position_result_empty,
  // output wire /*Zero Width*/                    advance_state_result,
     output wire                                   advance_state_result_empty,
     output wire [15:0]                            get_layer_id_result,
     output wire                                   get_layer_id_result_empty,
     output wire [11:0]                            get_position_result,
     output wire                                   get_position_result_empty,
     output wire [5:0]                             get_state_result,
     output wire                                   get_state_result_empty,
     output wire                                   is_done_result,
     output wire                                   is_done_result_empty,
  // output wire /*Zero Width*/                    reset_result,
     output wire                                   reset_result_empty,
  // output wire /*Zero Width*/                    reset_state_result,
     output wire                                   reset_state_result_empty,
  // output wire /*Zero Width*/                    set_layer_id_result,
     output wire                                   set_layer_id_result_empty,
     output wire                                   rst_and_startup_done_out,
     output wire                                   stall_rate_supported_out
);

  wire [15:0] _EsiWrapped_get_layer_id_result_out;
  wire [5:0]  _EsiWrapped_get_state_result_out;
  wire [11:0] _EsiWrapped_get_position_result_out;
  layer_tile EsiWrapped (
    .clk                        (clk),
    .rst                        (rst),
    .set_layer_id_valid_in      (set_layer_id_arg_valid),
    .set_layer_id_id_in         (set_layer_id_arg.id),
    .set_layer_id_rden_in       (set_layer_id_result_rden),
    .get_layer_id_valid_in      (get_layer_id_arg_valid),
    .get_layer_id_rden_in       (get_layer_id_result_rden),
    .get_state_valid_in         (get_state_arg_valid),
    .get_state_rden_in          (get_state_result_rden),
    .advance_state_valid_in     (advance_state_arg_valid),
    .advance_state_rden_in      (advance_state_result_rden),
    .reset_state_valid_in       (reset_state_arg_valid),
    .reset_state_rden_in        (reset_state_result_rden),
    .is_done_valid_in           (is_done_arg_valid),
    .is_done_rden_in            (is_done_result_rden),
    .get_position_valid_in      (get_position_arg_valid),
    .get_position_rden_in       (get_position_result_rden),
    .advance_position_valid_in  (advance_position_arg_valid),
    .advance_position_rden_in   (advance_position_result_rden),
    .reset_valid_in             (reset_arg_valid),
    .reset_rden_in              (reset_result_rden),
    .stall_rate_in              (stall_rate_in),
    .stall_rate_valid_in        (stall_rate_valid_in),
    .rst_and_startup_done_out   (rst_and_startup_done_out),
    .set_layer_id_rdy_out       (set_layer_id_arg_ready),
    .set_layer_id_empty_out     (set_layer_id_result_empty),
    .get_layer_id_rdy_out       (get_layer_id_arg_ready),
    .get_layer_id_empty_out     (get_layer_id_result_empty),
    .get_layer_id_result_out    (_EsiWrapped_get_layer_id_result_out),
    .get_state_rdy_out          (get_state_arg_ready),
    .get_state_empty_out        (get_state_result_empty),
    .get_state_result_out       (_EsiWrapped_get_state_result_out),
    .advance_state_rdy_out      (advance_state_arg_ready),
    .advance_state_empty_out    (advance_state_result_empty),
    .reset_state_rdy_out        (reset_state_arg_ready),
    .reset_state_empty_out      (reset_state_result_empty),
    .is_done_rdy_out            (is_done_arg_ready),
    .is_done_empty_out          (is_done_result_empty),
    .is_done_result_out         (is_done_result),
    .get_position_rdy_out       (get_position_arg_ready),
    .get_position_empty_out     (get_position_result_empty),
    .get_position_result_out    (_EsiWrapped_get_position_result_out),
    .advance_position_rdy_out   (advance_position_arg_ready),
    .advance_position_empty_out (advance_position_result_empty),
    .reset_rdy_out              (reset_arg_ready),
    .reset_empty_out            (reset_result_empty),
    .stall_rate_supported_out   (stall_rate_supported_out)
  );
  // Zero width: assign advance_position_result = /*Zero width*/;
  // Zero width: assign advance_state_result = /*Zero width*/;
  assign get_layer_id_result = _EsiWrapped_get_layer_id_result_out;
  assign get_position_result = _EsiWrapped_get_position_result_out;
  assign get_state_result = _EsiWrapped_get_state_result_out;
  // Zero width: assign reset_result = /*Zero width*/;
  // Zero width: assign reset_state_result = /*Zero width*/;
  // Zero width: assign set_layer_id_result = /*Zero width*/;
endmodule

