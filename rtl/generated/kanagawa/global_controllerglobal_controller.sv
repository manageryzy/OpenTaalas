
// This file was generated. Do not modify.
// kanagawa --backend=sv --import-dir=/home/mana/workspace/OpenTaalas/third-party/kanagawa/library --base-library=/home/mana/workspace/OpenTaalas/third-party/kanagawa/library/mini-base.k --output=/home/mana/workspace/OpenTaalas/rtl/generated/kanagawa/global_controller /home/mana/workspace/OpenTaalas/rtl/kanagawa/global_controller.k

`default_nettype wire
module global_controllerDebugView_startEntry
(
    input wire clk,
    input wire[16:0]  _token_id,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("startEntry time: %0t token_id: %p", $time, _token_id);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module global_controllerDebugView_get_stateExit
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
module global_controllerDebugView_get_current_tokenExit
(
    input wire clk,
    input wire[16:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("get_current_tokenExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module global_controllerDebugView_set_output_tokenEntry
(
    input wire clk,
    input wire[16:0]  _token_id,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("set_output_tokenEntry time: %0t token_id: %p", $time, _token_id);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module global_controllerDebugView_get_output_tokenExit
(
    input wire clk,
    input wire[16:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("get_output_tokenExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module global_controllerDebugView_get_token_countExit
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
module global_controllerDebugView_is_idleExit
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
module global_controllerDebugView_is_output_readyExit
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
`ifndef _TYPESCOPE_CoreModuleTypeScope
`define _TYPESCOPE_CoreModuleTypeScope
`endif // _TYPESCOPE_CoreModuleTypeScope
module global_controller_reset_BasicBlock_0(	// global_controller.k:93:9
  input  wire       clk,
  input  wire       rst,
  output wire       done_out,
  output wire       global_out__state_8_2_valid,
  output wire       global_out__token_count_9_1_valid,
  output wire       global_out__current_token_10_1_valid,
  output wire       global_out__output_token_11_1_valid,
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
  logic       done_out_0;	// global_controller.k:93:9
  logic       global_out__state_8_2_valid_0;	// global_controller.k:93:9
  logic       global_out__token_count_9_1_valid_0;	// global_controller.k:93:9
  logic       global_out__current_token_10_1_valid_0;	// global_controller.k:93:9
  logic       global_out__output_token_11_1_valid_0;	// global_controller.k:93:9
  logic       fifo_wren_0_0;	// global_controller.k:93:9
  logic       input_rdy_0_0;	// global_controller.k:93:9
  logic [7:0] control_state_out_0;	// global_controller.k:93:9
  wire        _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// global_controller.k:93:9
  always_comb begin	// global_controller.k:93:9
    input_rdy_0_0 = _GEN;	// global_controller.k:93:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// global_controller.k:93:9
  end // always_comb
  reg         p0_stage1_enable = 1'h0;	// global_controller.k:93:9
  always_comb begin	// global_controller.k:93:9
    global_out__state_8_2_valid_0 = p0_stage1_enable;	// global_controller.k:93:9
    global_out__token_count_9_1_valid_0 = p0_stage1_enable;	// global_controller.k:93:9
    global_out__current_token_10_1_valid_0 = p0_stage1_enable;	// global_controller.k:93:9
    global_out__output_token_11_1_valid_0 = p0_stage1_enable;	// global_controller.k:93:9
  end // always_comb
  reg         p0_stage2_enable = 1'h0;	// global_controller.k:93:9
  always @(posedge clk) begin	// global_controller.k:93:9
    if (rst) begin	// global_controller.k:93:9
      p0_stage1_enable <= 1'h0;	// global_controller.k:93:9
      p0_stage2_enable <= 1'h0;	// global_controller.k:93:9
    end
    else begin	// global_controller.k:93:9
      p0_stage1_enable <= _GEN & input_valid_0;	// global_controller.k:93:9
      p0_stage2_enable <= p0_stage1_enable;	// global_controller.k:93:9
    end
  end // always @(posedge)
  always_comb	// global_controller.k:93:9
    fifo_wren_0_0 = p0_stage2_enable;	// global_controller.k:93:9, :100:9
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// global_controller.k:93:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// global_controller.k:93:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  assign done_out = p0_stage2_enable;	// global_controller.k:93:9
  assign global_out__state_8_2_valid = global_out__state_8_2_valid_0;	// global_controller.k:93:9
  assign global_out__token_count_9_1_valid = global_out__token_count_9_1_valid_0;	// global_controller.k:93:9
  assign global_out__current_token_10_1_valid = global_out__current_token_10_1_valid_0;	// global_controller.k:93:9
  assign global_out__output_token_11_1_valid = global_out__output_token_11_1_valid_0;	// global_controller.k:93:9
  assign fifo_wren_0 = fifo_wren_0_0;	// global_controller.k:93:9
  assign input_rdy_0 = input_rdy_0_0;	// global_controller.k:93:9
  assign control_state_out = control_state_out_0;	// global_controller.k:93:9
endmodule

module global_controller_is_output_ready_BasicBlock_0(	// global_controller.k:87:9
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
  wire  [5:0] global_in__state_8_0 = global_in__state_8;	// global_controller.k:87:9
  logic       done_out_0;	// global_controller.k:87:9
  logic       fifo_data_out_0_0;	// global_controller.k:87:9
  logic       fifo_wren_0_0;	// global_controller.k:87:9
  logic       input_rdy_0_0;	// global_controller.k:87:9
  logic [7:0] control_state_out_0;	// global_controller.k:87:9
  wire        _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// global_controller.k:87:9
  always_comb begin	// global_controller.k:87:9
    input_rdy_0_0 = _GEN;	// global_controller.k:87:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// global_controller.k:87:9
  end // always_comb
  reg         p0_stage1_enable = 1'h0;	// global_controller.k:87:9
  wire        _state_eq_35_ =
    global_in__state_8_0[5] & ~(global_in__state_8_0[4]) & ~(global_in__state_8_0[3])
    & ~(global_in__state_8_0[2]) & global_in__state_8_0[1] & global_in__state_8_0[0];	// global_controller.k:87:{9,16}
  reg         p0__state_eq_35_;	// global_controller.k:87:9
  reg         p0_stage2_enable = 1'h0;	// global_controller.k:87:9
  always @(posedge clk) begin	// global_controller.k:87:9
    if (rst)	// global_controller.k:87:9
      p0_stage1_enable <= 1'h0;	// global_controller.k:87:9
    else	// global_controller.k:87:9
      p0_stage1_enable <= _GEN & input_valid_0;	// global_controller.k:87:9
    p0__state_eq_35_ <= _state_eq_35_;	// global_controller.k:87:{9,16}
    if (rst)	// global_controller.k:87:9
      p0_stage2_enable <= 1'h0;	// global_controller.k:87:9
    else	// global_controller.k:87:9
      p0_stage2_enable <= p0_stage1_enable;	// global_controller.k:87:9
  end // always @(posedge)
  always_comb begin	// global_controller.k:87:9
    fifo_wren_0_0 = p0_stage2_enable;	// global_controller.k:85:5, :87:9
    fifo_data_out_0_0 = p0__state_eq_35_;	// global_controller.k:85:5, :87:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// global_controller.k:87:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// global_controller.k:87:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  global_controllerDebugView_is_output_readyExit global_controllerDebugView_is_output_readyExit_instance (	// global_controller.k:85:5
    .clk          (clk),	// global_controller.k:85:5
    ._ReturnValue (p0_stage1_enable ? _state_eq_35_ : 'x),	// global_controller.k:85:5, :87:{9,16}
    .valid        (p0_stage1_enable),	// global_controller.k:87:9
    .valid_out    (/* unused */)
  );	// global_controller.k:85:5
  assign done_out = p0_stage2_enable;	// global_controller.k:87:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// global_controller.k:87:9
  assign fifo_wren_0 = fifo_wren_0_0;	// global_controller.k:87:9
  assign input_rdy_0 = input_rdy_0_0;	// global_controller.k:87:9
  assign control_state_out = control_state_out_0;	// global_controller.k:87:9
endmodule

module global_controller_is_idle_BasicBlock_0(	// global_controller.k:81:9
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
  wire  [5:0] global_in__state_8_0 = global_in__state_8;	// global_controller.k:81:9
  logic       done_out_0;	// global_controller.k:81:9
  logic       fifo_data_out_0_0;	// global_controller.k:81:9
  logic       fifo_wren_0_0;	// global_controller.k:81:9
  logic       input_rdy_0_0;	// global_controller.k:81:9
  logic [7:0] control_state_out_0;	// global_controller.k:81:9
  wire        _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// global_controller.k:81:9
  always_comb begin	// global_controller.k:81:9
    input_rdy_0_0 = _GEN;	// global_controller.k:81:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// global_controller.k:81:9
  end // always_comb
  reg         p0_stage1_enable = 1'h0;	// global_controller.k:81:9
  wire        _state_eq_0_ =
    ~(global_in__state_8_0[5]) & ~(global_in__state_8_0[4]) & ~(global_in__state_8_0[3])
    & ~(global_in__state_8_0[2]) & ~(global_in__state_8_0[1])
    & ~(global_in__state_8_0[0]);	// global_controller.k:81:{9,16}
  reg         p0__state_eq_0_;	// global_controller.k:81:9
  reg         p0_stage2_enable = 1'h0;	// global_controller.k:81:9
  always @(posedge clk) begin	// global_controller.k:81:9
    if (rst)	// global_controller.k:81:9
      p0_stage1_enable <= 1'h0;	// global_controller.k:81:9
    else	// global_controller.k:81:9
      p0_stage1_enable <= _GEN & input_valid_0;	// global_controller.k:81:9
    p0__state_eq_0_ <= _state_eq_0_;	// global_controller.k:81:{9,16}
    if (rst)	// global_controller.k:81:9
      p0_stage2_enable <= 1'h0;	// global_controller.k:81:9
    else	// global_controller.k:81:9
      p0_stage2_enable <= p0_stage1_enable;	// global_controller.k:81:9
  end // always @(posedge)
  always_comb begin	// global_controller.k:81:9
    fifo_wren_0_0 = p0_stage2_enable;	// global_controller.k:79:5, :81:9
    fifo_data_out_0_0 = p0__state_eq_0_;	// global_controller.k:79:5, :81:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// global_controller.k:81:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// global_controller.k:81:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  global_controllerDebugView_is_idleExit global_controllerDebugView_is_idleExit_instance (	// global_controller.k:79:5
    .clk          (clk),	// global_controller.k:79:5
    ._ReturnValue (p0_stage1_enable ? _state_eq_0_ : 'x),	// global_controller.k:79:5, :81:{9,16}
    .valid        (p0_stage1_enable),	// global_controller.k:81:9
    .valid_out    (/* unused */)
  );	// global_controller.k:79:5
  assign done_out = p0_stage2_enable;	// global_controller.k:81:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// global_controller.k:81:9
  assign fifo_wren_0 = fifo_wren_0_0;	// global_controller.k:81:9
  assign input_rdy_0 = input_rdy_0_0;	// global_controller.k:81:9
  assign control_state_out = control_state_out_0;	// global_controller.k:81:9
endmodule

module global_controller_get_token_count_BasicBlock_0(	// global_controller.k:75:9
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
  wire  [11:0] global_in__token_count_9_0 = global_in__token_count_9;	// global_controller.k:75:9
  logic        done_out_0;	// global_controller.k:75:9
  logic [11:0] fifo_data_out_0_0;	// global_controller.k:75:9
  logic        fifo_wren_0_0;	// global_controller.k:75:9
  logic        input_rdy_0_0;	// global_controller.k:75:9
  logic [7:0]  control_state_out_0;	// global_controller.k:75:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// global_controller.k:75:9
  always_comb begin	// global_controller.k:75:9
    input_rdy_0_0 = _GEN;	// global_controller.k:75:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// global_controller.k:75:9
  end // always_comb
  reg          p0_stage1_enable = 1'h0;	// global_controller.k:75:9
  reg   [11:0] p0_global_in__token_count_9;	// global_controller.k:75:9
  reg          p0_stage2_enable = 1'h0;	// global_controller.k:75:9
  always @(posedge clk) begin	// global_controller.k:75:9
    if (rst)	// global_controller.k:75:9
      p0_stage1_enable <= 1'h0;	// global_controller.k:75:9
    else	// global_controller.k:75:9
      p0_stage1_enable <= _GEN & input_valid_0;	// global_controller.k:75:9
    p0_global_in__token_count_9 <= global_in__token_count_9_0;	// global_controller.k:75:9
    if (rst)	// global_controller.k:75:9
      p0_stage2_enable <= 1'h0;	// global_controller.k:75:9
    else	// global_controller.k:75:9
      p0_stage2_enable <= p0_stage1_enable;	// global_controller.k:75:9
  end // always @(posedge)
  always_comb begin	// global_controller.k:75:9
    fifo_wren_0_0 = p0_stage2_enable;	// global_controller.k:73:5, :75:9
    fifo_data_out_0_0 = p0_global_in__token_count_9;	// global_controller.k:73:5, :75:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// global_controller.k:75:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// global_controller.k:75:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  global_controllerDebugView_get_token_countExit global_controllerDebugView_get_token_countExit_instance (	// global_controller.k:73:5
    .clk          (clk),	// global_controller.k:73:5
    ._ReturnValue (p0_stage1_enable ? global_in__token_count_9_0 : 'x),	// global_controller.k:73:5, :75:9
    .valid        (p0_stage1_enable),	// global_controller.k:75:9
    .valid_out    (/* unused */)
  );	// global_controller.k:73:5
  assign done_out = p0_stage2_enable;	// global_controller.k:75:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// global_controller.k:75:9
  assign fifo_wren_0 = fifo_wren_0_0;	// global_controller.k:75:9
  assign input_rdy_0 = input_rdy_0_0;	// global_controller.k:75:9
  assign control_state_out = control_state_out_0;	// global_controller.k:75:9
endmodule

module global_controller_get_output_token_BasicBlock_0(	// global_controller.k:69:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  input  wire [16:0] global_in__output_token_11,
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
  wire  [16:0] global_in__output_token_11_0 = global_in__output_token_11;	// global_controller.k:69:9
  logic        done_out_0;	// global_controller.k:69:9
  logic [16:0] fifo_data_out_0_0;	// global_controller.k:69:9
  logic        fifo_wren_0_0;	// global_controller.k:69:9
  logic        input_rdy_0_0;	// global_controller.k:69:9
  logic [7:0]  control_state_out_0;	// global_controller.k:69:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// global_controller.k:69:9
  always_comb begin	// global_controller.k:69:9
    input_rdy_0_0 = _GEN;	// global_controller.k:69:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// global_controller.k:69:9
  end // always_comb
  reg          p0_stage1_enable = 1'h0;	// global_controller.k:69:9
  reg   [16:0] p0_global_in__output_token_11;	// global_controller.k:69:9
  reg          p0_stage2_enable = 1'h0;	// global_controller.k:69:9
  always @(posedge clk) begin	// global_controller.k:69:9
    if (rst)	// global_controller.k:69:9
      p0_stage1_enable <= 1'h0;	// global_controller.k:69:9
    else	// global_controller.k:69:9
      p0_stage1_enable <= _GEN & input_valid_0;	// global_controller.k:69:9
    p0_global_in__output_token_11 <= global_in__output_token_11_0;	// global_controller.k:69:9
    if (rst)	// global_controller.k:69:9
      p0_stage2_enable <= 1'h0;	// global_controller.k:69:9
    else	// global_controller.k:69:9
      p0_stage2_enable <= p0_stage1_enable;	// global_controller.k:69:9
  end // always @(posedge)
  always_comb begin	// global_controller.k:69:9
    fifo_wren_0_0 = p0_stage2_enable;	// global_controller.k:67:5, :69:9
    fifo_data_out_0_0 = p0_global_in__output_token_11;	// global_controller.k:67:5, :69:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// global_controller.k:69:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// global_controller.k:69:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  global_controllerDebugView_get_output_tokenExit global_controllerDebugView_get_output_tokenExit_instance (	// global_controller.k:67:5
    .clk          (clk),	// global_controller.k:67:5
    ._ReturnValue (p0_stage1_enable ? global_in__output_token_11_0 : 'x),	// global_controller.k:67:5, :69:9
    .valid        (p0_stage1_enable),	// global_controller.k:69:9
    .valid_out    (/* unused */)
  );	// global_controller.k:67:5
  assign done_out = p0_stage2_enable;	// global_controller.k:69:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// global_controller.k:69:9
  assign fifo_wren_0 = fifo_wren_0_0;	// global_controller.k:69:9
  assign input_rdy_0 = input_rdy_0_0;	// global_controller.k:69:9
  assign control_state_out = control_state_out_0;	// global_controller.k:69:9
endmodule

module global_controller_set_output_token_BasicBlock_0(	// global_controller.k:60:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  output wire        global_out__output_token_11_0_valid,
  output wire [16:0] global_out__output_token_11_0,
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
  logic        done_out_0;	// global_controller.k:60:9
  logic        global_out__output_token_11_0_valid_0;	// global_controller.k:60:9
  logic [16:0] global_out__output_token_11_0_0;	// global_controller.k:60:9
  logic        fifo_wren_0_0;	// global_controller.k:60:9
  logic        input_rdy_0_0;	// global_controller.k:60:9
  logic [7:0]  control_state_out_0;	// global_controller.k:60:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// global_controller.k:60:9
  always_comb begin	// global_controller.k:60:9
    input_rdy_0_0 = _GEN;	// global_controller.k:60:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// global_controller.k:60:9
  end // always_comb
  reg   [16:0] p0_data_in_14;	// global_controller.k:60:9
  reg          p0_stage1_enable = 1'h0;	// global_controller.k:60:9
  always_comb begin	// global_controller.k:60:9
    global_out__output_token_11_0_0 = p0_data_in_14;	// global_controller.k:60:9
    global_out__output_token_11_0_valid_0 = p0_stage1_enable;	// global_controller.k:60:9
  end // always_comb
  reg          p0_stage2_enable = 1'h0;	// global_controller.k:60:9
  always @(posedge clk) begin	// global_controller.k:60:9
    p0_data_in_14 <= data_in_14;	// global_controller.k:60:9
    if (rst) begin	// global_controller.k:60:9
      p0_stage1_enable <= 1'h0;	// global_controller.k:60:9
      p0_stage2_enable <= 1'h0;	// global_controller.k:60:9
    end
    else begin	// global_controller.k:60:9
      p0_stage1_enable <= _GEN & input_valid_0;	// global_controller.k:60:9
      p0_stage2_enable <= p0_stage1_enable;	// global_controller.k:60:9
    end
  end // always @(posedge)
  always_comb	// global_controller.k:60:9
    fifo_wren_0_0 = p0_stage2_enable;	// global_controller.k:60:9, :64:9
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// global_controller.k:60:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// global_controller.k:60:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  global_controllerDebugView_set_output_tokenEntry global_controllerDebugView_set_output_tokenEntry_instance (	// global_controller.k:64:9
    .clk       (clk),	// global_controller.k:64:9
    ._token_id (p0_stage1_enable ? p0_data_in_14 : 'x),	// global_controller.k:60:9, :64:9
    .valid     (p0_stage1_enable),	// global_controller.k:60:9
    .valid_out (/* unused */)
  );	// global_controller.k:64:9
  assign done_out = p0_stage2_enable;	// global_controller.k:60:9
  assign global_out__output_token_11_0_valid = global_out__output_token_11_0_valid_0;	// global_controller.k:60:9
  assign global_out__output_token_11_0 = global_out__output_token_11_0_0;	// global_controller.k:60:9
  assign fifo_wren_0 = fifo_wren_0_0;	// global_controller.k:60:9
  assign input_rdy_0 = input_rdy_0_0;	// global_controller.k:60:9
  assign control_state_out = control_state_out_0;	// global_controller.k:60:9
endmodule

module global_controller_get_current_token_BasicBlock_0(	// global_controller.k:54:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  input  wire [16:0] global_in__current_token_10,
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
  wire  [16:0] global_in__current_token_10_0 = global_in__current_token_10;	// global_controller.k:54:9
  logic        done_out_0;	// global_controller.k:54:9
  logic [16:0] fifo_data_out_0_0;	// global_controller.k:54:9
  logic        fifo_wren_0_0;	// global_controller.k:54:9
  logic        input_rdy_0_0;	// global_controller.k:54:9
  logic [7:0]  control_state_out_0;	// global_controller.k:54:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// global_controller.k:54:9
  always_comb begin	// global_controller.k:54:9
    input_rdy_0_0 = _GEN;	// global_controller.k:54:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// global_controller.k:54:9
  end // always_comb
  reg          p0_stage1_enable = 1'h0;	// global_controller.k:54:9
  reg   [16:0] p0_global_in__current_token_10;	// global_controller.k:54:9
  reg          p0_stage2_enable = 1'h0;	// global_controller.k:54:9
  always @(posedge clk) begin	// global_controller.k:54:9
    if (rst)	// global_controller.k:54:9
      p0_stage1_enable <= 1'h0;	// global_controller.k:54:9
    else	// global_controller.k:54:9
      p0_stage1_enable <= _GEN & input_valid_0;	// global_controller.k:54:9
    p0_global_in__current_token_10 <= global_in__current_token_10_0;	// global_controller.k:54:9
    if (rst)	// global_controller.k:54:9
      p0_stage2_enable <= 1'h0;	// global_controller.k:54:9
    else	// global_controller.k:54:9
      p0_stage2_enable <= p0_stage1_enable;	// global_controller.k:54:9
  end // always @(posedge)
  always_comb begin	// global_controller.k:54:9
    fifo_wren_0_0 = p0_stage2_enable;	// global_controller.k:52:5, :54:9
    fifo_data_out_0_0 = p0_global_in__current_token_10;	// global_controller.k:52:5, :54:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// global_controller.k:54:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// global_controller.k:54:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  global_controllerDebugView_get_current_tokenExit global_controllerDebugView_get_current_tokenExit_instance (	// global_controller.k:52:5
    .clk          (clk),	// global_controller.k:52:5
    ._ReturnValue (p0_stage1_enable ? global_in__current_token_10_0 : 'x),	// global_controller.k:52:5, :54:9
    .valid        (p0_stage1_enable),	// global_controller.k:54:9
    .valid_out    (/* unused */)
  );	// global_controller.k:52:5
  assign done_out = p0_stage2_enable;	// global_controller.k:54:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// global_controller.k:54:9
  assign fifo_wren_0 = fifo_wren_0_0;	// global_controller.k:54:9
  assign input_rdy_0 = input_rdy_0_0;	// global_controller.k:54:9
  assign control_state_out = control_state_out_0;	// global_controller.k:54:9
endmodule

module global_controller_get_state_BasicBlock_0(	// global_controller.k:48:9
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
  wire  [5:0] global_in__state_8_0 = global_in__state_8;	// global_controller.k:48:9
  logic       done_out_0;	// global_controller.k:48:9
  logic [5:0] fifo_data_out_0_0;	// global_controller.k:48:9
  logic       fifo_wren_0_0;	// global_controller.k:48:9
  logic       input_rdy_0_0;	// global_controller.k:48:9
  logic [7:0] control_state_out_0;	// global_controller.k:48:9
  wire        _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// global_controller.k:48:9
  always_comb begin	// global_controller.k:48:9
    input_rdy_0_0 = _GEN;	// global_controller.k:48:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// global_controller.k:48:9
  end // always_comb
  reg         p0_stage1_enable = 1'h0;	// global_controller.k:48:9
  reg   [5:0] p0_global_in__state_8;	// global_controller.k:48:9
  reg         p0_stage2_enable = 1'h0;	// global_controller.k:48:9
  always @(posedge clk) begin	// global_controller.k:48:9
    if (rst)	// global_controller.k:48:9
      p0_stage1_enable <= 1'h0;	// global_controller.k:48:9
    else	// global_controller.k:48:9
      p0_stage1_enable <= _GEN & input_valid_0;	// global_controller.k:48:9
    p0_global_in__state_8 <= global_in__state_8_0;	// global_controller.k:48:9
    if (rst)	// global_controller.k:48:9
      p0_stage2_enable <= 1'h0;	// global_controller.k:48:9
    else	// global_controller.k:48:9
      p0_stage2_enable <= p0_stage1_enable;	// global_controller.k:48:9
  end // always @(posedge)
  always_comb begin	// global_controller.k:48:9
    fifo_wren_0_0 = p0_stage2_enable;	// global_controller.k:46:5, :48:9
    fifo_data_out_0_0 = p0_global_in__state_8;	// global_controller.k:46:5, :48:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// global_controller.k:48:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// global_controller.k:48:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  global_controllerDebugView_get_stateExit global_controllerDebugView_get_stateExit_instance (	// global_controller.k:46:5
    .clk          (clk),	// global_controller.k:46:5
    ._ReturnValue (p0_stage1_enable ? global_in__state_8_0 : 'x),	// global_controller.k:46:5, :48:9
    .valid        (p0_stage1_enable),	// global_controller.k:48:9
    .valid_out    (/* unused */)
  );	// global_controller.k:46:5
  assign done_out = p0_stage2_enable;	// global_controller.k:48:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// global_controller.k:48:9
  assign fifo_wren_0 = fifo_wren_0_0;	// global_controller.k:48:9
  assign input_rdy_0 = input_rdy_0_0;	// global_controller.k:48:9
  assign control_state_out = control_state_out_0;	// global_controller.k:48:9
endmodule

module global_controller_advance_BasicBlock_0(	// global_controller.k:31:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  input  wire [5:0]  global_in__state_8,
  input  wire [11:0] global_in__token_count_9,
  output wire        global_out__state_8_1_valid,
  output wire [5:0]  global_out__state_8_1,
  output wire        global_out__token_count_9_0_valid,
  output wire [11:0] global_out__token_count_9_0,
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
  wire  [5:0]  global_in__state_8_0 = global_in__state_8;	// global_controller.k:31:9
  wire  [11:0] global_in__token_count_9_0 = global_in__token_count_9;	// global_controller.k:31:9
  logic        done_out_0;	// global_controller.k:31:9
  logic        global_out__state_8_1_valid_0;	// global_controller.k:31:9
  logic [5:0]  global_out__state_8_1_0;	// global_controller.k:31:9
  logic        global_out__token_count_9_0_valid_0;	// global_controller.k:31:9
  logic [11:0] global_out__token_count_9_0_0;	// global_controller.k:31:9
  logic        fifo_wren_0_0;	// global_controller.k:31:9
  logic        input_rdy_0_0;	// global_controller.k:31:9
  logic [7:0]  control_state_out_0;	// global_controller.k:31:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// global_controller.k:31:9
  always_comb begin	// global_controller.k:31:9
    input_rdy_0_0 = _GEN;	// global_controller.k:31:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// global_controller.k:31:9
  end // always_comb
  reg          p0_stage1_enable = 1'h0;	// global_controller.k:31:9
  wire         _state_eq_35_ = global_in__state_8_0 == 6'h23;	// global_controller.k:31:9, :33:17
  always_comb begin	// global_controller.k:31:9
    global_out__token_count_9_0_0 = 12'(global_in__token_count_9_0 + 12'h1);	// global_controller.k:31:9, :35:32
    global_out__token_count_9_0_valid_0 = p0_stage1_enable & _state_eq_35_;	// global_controller.k:31:9, :33:17
  end // always_comb
  always_comb begin	// global_controller.k:31:9
    global_out__state_8_1_0 =
      _state_eq_35_ ? 6'h0 : 6'((_state_eq_35_ ? 6'h0 : global_in__state_8_0) + 6'h1);	// global_controller.k:31:9, :33:17, :40:26
    global_out__state_8_1_valid_0 = p0_stage1_enable;	// global_controller.k:31:9
  end // always_comb
  reg          p0_stage2_enable = 1'h0;	// global_controller.k:31:9
  always @(posedge clk) begin	// global_controller.k:31:9
    if (rst) begin	// global_controller.k:31:9
      p0_stage1_enable <= 1'h0;	// global_controller.k:31:9
      p0_stage2_enable <= 1'h0;	// global_controller.k:31:9
    end
    else begin	// global_controller.k:31:9
      p0_stage1_enable <= _GEN & input_valid_0;	// global_controller.k:31:9
      p0_stage2_enable <= p0_stage1_enable;	// global_controller.k:31:9
    end
  end // always @(posedge)
  always_comb	// global_controller.k:31:9
    fifo_wren_0_0 = p0_stage2_enable;	// global_controller.k:31:9, :43:9
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// global_controller.k:31:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// global_controller.k:31:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  assign done_out = p0_stage2_enable;	// global_controller.k:31:9
  assign global_out__state_8_1_valid = global_out__state_8_1_valid_0;	// global_controller.k:31:9
  assign global_out__state_8_1 = global_out__state_8_1_0;	// global_controller.k:31:9
  assign global_out__token_count_9_0_valid = global_out__token_count_9_0_valid_0;	// global_controller.k:31:9
  assign global_out__token_count_9_0 = global_out__token_count_9_0_0;	// global_controller.k:31:9
  assign fifo_wren_0 = fifo_wren_0_0;	// global_controller.k:31:9
  assign input_rdy_0 = input_rdy_0_0;	// global_controller.k:31:9
  assign control_state_out = control_state_out_0;	// global_controller.k:31:9
endmodule

module global_controller_start_BasicBlock_0(	// global_controller.k:21:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  output wire        global_out__state_8_0_valid,
  output wire        global_out__current_token_10_0_valid,
  output wire [16:0] global_out__current_token_10_0,
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
  logic        done_out_0;	// global_controller.k:21:9
  logic        global_out__state_8_0_valid_0;	// global_controller.k:21:9
  logic        global_out__current_token_10_0_valid_0;	// global_controller.k:21:9
  logic [16:0] global_out__current_token_10_0_0;	// global_controller.k:21:9
  logic        fifo_wren_0_0;	// global_controller.k:21:9
  logic        input_rdy_0_0;	// global_controller.k:21:9
  logic [7:0]  control_state_out_0;	// global_controller.k:21:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// global_controller.k:21:9
  always_comb begin	// global_controller.k:21:9
    input_rdy_0_0 = _GEN;	// global_controller.k:21:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// global_controller.k:21:9
  end // always_comb
  reg   [16:0] p0_data_in_10;	// global_controller.k:21:9
  reg          p0_stage1_enable = 1'h0;	// global_controller.k:21:9
  always_comb begin	// global_controller.k:21:9
    global_out__state_8_0_valid_0 = p0_stage1_enable;	// global_controller.k:21:9
    global_out__current_token_10_0_0 = p0_data_in_10;	// global_controller.k:21:9
    global_out__current_token_10_0_valid_0 = p0_stage1_enable;	// global_controller.k:21:9
  end // always_comb
  reg          p0_stage2_enable = 1'h0;	// global_controller.k:21:9
  always @(posedge clk) begin	// global_controller.k:21:9
    p0_data_in_10 <= data_in_10;	// global_controller.k:21:9
    if (rst) begin	// global_controller.k:21:9
      p0_stage1_enable <= 1'h0;	// global_controller.k:21:9
      p0_stage2_enable <= 1'h0;	// global_controller.k:21:9
    end
    else begin	// global_controller.k:21:9
      p0_stage1_enable <= _GEN & input_valid_0;	// global_controller.k:21:9
      p0_stage2_enable <= p0_stage1_enable;	// global_controller.k:21:9
    end
  end // always @(posedge)
  always_comb	// global_controller.k:21:9
    fifo_wren_0_0 = p0_stage2_enable;	// global_controller.k:21:9, :26:9
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// global_controller.k:21:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// global_controller.k:21:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  global_controllerDebugView_startEntry global_controllerDebugView_startEntry_instance (	// global_controller.k:26:9
    .clk       (clk),	// global_controller.k:26:9
    ._token_id (p0_stage1_enable ? p0_data_in_10 : 'x),	// global_controller.k:21:9, :26:9
    .valid     (p0_stage1_enable),	// global_controller.k:21:9
    .valid_out (/* unused */)
  );	// global_controller.k:26:9
  assign done_out = p0_stage2_enable;	// global_controller.k:21:9
  assign global_out__state_8_0_valid = global_out__state_8_0_valid_0;	// global_controller.k:21:9
  assign global_out__current_token_10_0_valid = global_out__current_token_10_0_valid_0;	// global_controller.k:21:9
  assign global_out__current_token_10_0 = global_out__current_token_10_0_0;	// global_controller.k:21:9
  assign fifo_wren_0 = fifo_wren_0_0;	// global_controller.k:21:9
  assign input_rdy_0 = input_rdy_0_0;	// global_controller.k:21:9
  assign control_state_out = control_state_out_0;	// global_controller.k:21:9
endmodule

module global_controller_reg_6_w3_v_0_6_1_v_2_6_0_i_6_0(
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

module global_controller_reg_12_w2_v_1_12_0_i_12_0(
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

module global_controller_reg_17_w2_v_1_17_0_i_17_0(
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

module global_controller(
  input  wire        clk,
  input  wire        rst,
  input  wire        start_valid_in,
  input  wire [16:0] start_token_id_in,
  input  wire        start_rden_in,
  input  wire        advance_valid_in,
  input  wire        advance_rden_in,
  input  wire        get_state_valid_in,
  input  wire        get_state_rden_in,
  input  wire        get_current_token_valid_in,
  input  wire        get_current_token_rden_in,
  input  wire        set_output_token_valid_in,
  input  wire [16:0] set_output_token_token_id_in,
  input  wire        set_output_token_rden_in,
  input  wire        get_output_token_valid_in,
  input  wire        get_output_token_rden_in,
  input  wire        get_token_count_valid_in,
  input  wire        get_token_count_rden_in,
  input  wire        is_idle_valid_in,
  input  wire        is_idle_rden_in,
  input  wire        is_output_ready_valid_in,
  input  wire        is_output_ready_rden_in,
  input  wire        reset_valid_in,
  input  wire        reset_rden_in,
  input  wire [2:0]  stall_rate_in,
  input  wire        stall_rate_valid_in,
  output wire        rst_and_startup_done_out,
  output wire        start_rdy_out,
  output wire        start_empty_out,
  output wire        advance_rdy_out,
  output wire        advance_empty_out,
  output wire        get_state_rdy_out,
  output wire        get_state_empty_out,
  output wire [5:0]  get_state_result_out,
  output wire        get_current_token_rdy_out,
  output wire        get_current_token_empty_out,
  output wire [16:0] get_current_token_result_out,
  output wire        set_output_token_rdy_out,
  output wire        set_output_token_empty_out,
  output wire        get_output_token_rdy_out,
  output wire        get_output_token_empty_out,
  output wire [16:0] get_output_token_result_out,
  output wire        get_token_count_rdy_out,
  output wire        get_token_count_empty_out,
  output wire [11:0] get_token_count_result_out,
  output wire        is_idle_rdy_out,
  output wire        is_idle_empty_out,
  output wire        is_idle_result_out,
  output wire        is_output_ready_rdy_out,
  output wire        is_output_ready_empty_out,
  output wire        is_output_ready_result_out,
  output wire        reset_rdy_out,
  output wire        reset_empty_out,
  output wire        stall_rate_supported_out
);

  wire        _reset_BasicBlock_0Impl_global_out__state_8_2_valid;	// global_controller.k:93:9
  wire        _reset_BasicBlock_0Impl_global_out__token_count_9_1_valid;	// global_controller.k:93:9
  wire        _reset_BasicBlock_0Impl_global_out__current_token_10_1_valid;	// global_controller.k:93:9
  wire        _reset_BasicBlock_0Impl_global_out__output_token_11_1_valid;	// global_controller.k:93:9
  wire        _reset_BasicBlock_0Impl_fifo_wren_0;	// global_controller.k:93:9
  wire        _reset_BasicBlock_0Impl_input_rdy_0;	// global_controller.k:93:9
  wire        _is_output_ready_BasicBlock_0Impl_fifo_data_out_0;	// global_controller.k:87:9
  wire        _is_output_ready_BasicBlock_0Impl_fifo_wren_0;	// global_controller.k:87:9
  wire        _is_output_ready_BasicBlock_0Impl_input_rdy_0;	// global_controller.k:87:9
  wire        _is_idle_BasicBlock_0Impl_fifo_data_out_0;	// global_controller.k:81:9
  wire        _is_idle_BasicBlock_0Impl_fifo_wren_0;	// global_controller.k:81:9
  wire        _is_idle_BasicBlock_0Impl_input_rdy_0;	// global_controller.k:81:9
  wire [11:0] _get_token_count_BasicBlock_0Impl_fifo_data_out_0;	// global_controller.k:75:9
  wire        _get_token_count_BasicBlock_0Impl_fifo_wren_0;	// global_controller.k:75:9
  wire        _get_token_count_BasicBlock_0Impl_input_rdy_0;	// global_controller.k:75:9
  wire [16:0] _get_output_token_BasicBlock_0Impl_fifo_data_out_0;	// global_controller.k:69:9
  wire        _get_output_token_BasicBlock_0Impl_fifo_wren_0;	// global_controller.k:69:9
  wire        _get_output_token_BasicBlock_0Impl_input_rdy_0;	// global_controller.k:69:9
  wire        _set_output_token_BasicBlock_0Impl_global_out__output_token_11_0_valid;	// global_controller.k:60:9
  wire [16:0] _set_output_token_BasicBlock_0Impl_global_out__output_token_11_0;	// global_controller.k:60:9
  wire        _set_output_token_BasicBlock_0Impl_fifo_wren_0;	// global_controller.k:60:9
  wire        _set_output_token_BasicBlock_0Impl_input_rdy_0;	// global_controller.k:60:9
  wire [16:0] _get_current_token_BasicBlock_0Impl_fifo_data_out_0;	// global_controller.k:54:9
  wire        _get_current_token_BasicBlock_0Impl_fifo_wren_0;	// global_controller.k:54:9
  wire        _get_current_token_BasicBlock_0Impl_input_rdy_0;	// global_controller.k:54:9
  wire [5:0]  _get_state_BasicBlock_0Impl_fifo_data_out_0;	// global_controller.k:48:9
  wire        _get_state_BasicBlock_0Impl_fifo_wren_0;	// global_controller.k:48:9
  wire        _get_state_BasicBlock_0Impl_input_rdy_0;	// global_controller.k:48:9
  wire        _advance_BasicBlock_0Impl_global_out__state_8_1_valid;	// global_controller.k:31:9
  wire [5:0]  _advance_BasicBlock_0Impl_global_out__state_8_1;	// global_controller.k:31:9
  wire        _advance_BasicBlock_0Impl_global_out__token_count_9_0_valid;	// global_controller.k:31:9
  wire [11:0] _advance_BasicBlock_0Impl_global_out__token_count_9_0;	// global_controller.k:31:9
  wire        _advance_BasicBlock_0Impl_fifo_wren_0;	// global_controller.k:31:9
  wire        _advance_BasicBlock_0Impl_input_rdy_0;	// global_controller.k:31:9
  wire        _start_BasicBlock_0Impl_global_out__state_8_0_valid;	// global_controller.k:21:9
  wire        _start_BasicBlock_0Impl_global_out__current_token_10_0_valid;	// global_controller.k:21:9
  wire [16:0] _start_BasicBlock_0Impl_global_out__current_token_10_0;	// global_controller.k:21:9
  wire        _start_BasicBlock_0Impl_fifo_wren_0;	// global_controller.k:21:9
  wire        _start_BasicBlock_0Impl_input_rdy_0;	// global_controller.k:21:9
  wire        _fifo_9_reset_Return_overflow_out;
  wire        _fifo_9_reset_Return_underflow_out;
  wire        _fifo_9_reset_Return_empty;
  wire        _fifo_9_reset_Return_full;
  wire        _fifo_8_is_output_ready_Return_overflow_out;
  wire        _fifo_8_is_output_ready_Return_underflow_out;
  wire        _fifo_8_is_output_ready_Return_empty;
  wire        _fifo_8_is_output_ready_Return_full;
  wire        _fifo_8_is_output_ready_Return_q;
  wire        _fifo_7_is_idle_Return_overflow_out;
  wire        _fifo_7_is_idle_Return_underflow_out;
  wire        _fifo_7_is_idle_Return_empty;
  wire        _fifo_7_is_idle_Return_full;
  wire        _fifo_7_is_idle_Return_q;
  wire        _fifo_6_get_token_count_Return_overflow_out;
  wire        _fifo_6_get_token_count_Return_underflow_out;
  wire        _fifo_6_get_token_count_Return_empty;
  wire        _fifo_6_get_token_count_Return_full;
  wire [11:0] _fifo_6_get_token_count_Return_q;
  wire        _fifo_5_get_output_token_Return_overflow_out;
  wire        _fifo_5_get_output_token_Return_underflow_out;
  wire        _fifo_5_get_output_token_Return_empty;
  wire        _fifo_5_get_output_token_Return_full;
  wire [16:0] _fifo_5_get_output_token_Return_q;
  wire        _fifo_4_set_output_token_Return_overflow_out;
  wire        _fifo_4_set_output_token_Return_underflow_out;
  wire        _fifo_4_set_output_token_Return_empty;
  wire        _fifo_4_set_output_token_Return_full;
  wire        _fifo_3_get_current_token_Return_overflow_out;
  wire        _fifo_3_get_current_token_Return_underflow_out;
  wire        _fifo_3_get_current_token_Return_empty;
  wire        _fifo_3_get_current_token_Return_full;
  wire [16:0] _fifo_3_get_current_token_Return_q;
  wire        _fifo_2_get_state_Return_overflow_out;
  wire        _fifo_2_get_state_Return_underflow_out;
  wire        _fifo_2_get_state_Return_empty;
  wire        _fifo_2_get_state_Return_full;
  wire [5:0]  _fifo_2_get_state_Return_q;
  wire        _fifo_1_advance_Return_overflow_out;
  wire        _fifo_1_advance_Return_underflow_out;
  wire        _fifo_1_advance_Return_empty;
  wire        _fifo_1_advance_Return_full;
  wire        _fifo_0_start_Return_overflow_out;
  wire        _fifo_0_start_Return_underflow_out;
  wire        _fifo_0_start_Return_empty;
  wire        _fifo_0_start_Return_full;
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
  wire [16:0] __output_token_value_out;	// global_controller.k:15:5
  wire [16:0] __current_token_value_out;	// global_controller.k:14:5
  wire [11:0] __token_count_value_out;	// global_controller.k:13:5
  wire [5:0]  __state_value_out;	// global_controller.k:12:5
  wire        _reset_control_rst_and_startup_done_out;
  wire [23:0] _reset_control_rst_delayed_out;
  wire        _reset_control_reset_sequence_finished_this_cycle_out;
  logic  stall_rate_supported_out_net;
  logic  reset_empty_out_net;
  logic  reset_rdy_out_net;
  logic  is_output_ready_empty_out_net;
  logic  is_output_ready_result_out_net;
  logic  is_output_ready_rdy_out_net;
  logic  is_idle_empty_out_net;
  logic  is_idle_result_out_net;
  logic  is_idle_rdy_out_net;
  logic  get_token_count_empty_out_net;
  logic [11:0] get_token_count_result_out_net;
  logic  get_token_count_rdy_out_net;
  logic  get_output_token_empty_out_net;
  logic [16:0] get_output_token_result_out_net;
  logic  get_output_token_rdy_out_net;
  logic  set_output_token_empty_out_net;
  logic  set_output_token_rdy_out_net;
  logic  get_current_token_empty_out_net;
  logic [16:0] get_current_token_result_out_net;
  logic  get_current_token_rdy_out_net;
  logic  get_state_empty_out_net;
  logic [5:0] get_state_result_out_net;
  logic  get_state_rdy_out_net;
  logic  advance_empty_out_net;
  logic  advance_rdy_out_net;
  logic  start_empty_out_net;
  logic  start_rdy_out_net;
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
      logic [16:0] data_in;
      logic [16:0] data_out;
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
      logic [0:0] data_in;
      logic [0:0] data_out;
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
  assign start_rdy_out_net = passthrough_data_10.rdy_ext;
  assign passthrough_data_10.valid = start_rdy_out & start_valid_in;
  assign passthrough_data_10.data = { start_token_id_in };
  assign fifo_data_0.rden = start_rden_in;
  assign start_empty_out_net = fifo_data_0.empty;
  assign advance_rdy_out_net = passthrough_data_11.rdy_ext;
  assign passthrough_data_11.valid = advance_rdy_out & advance_valid_in;
  assign fifo_data_1.rden = advance_rden_in;
  assign advance_empty_out_net = fifo_data_1.empty;
  assign get_state_rdy_out_net = passthrough_data_12.rdy_ext;
  assign passthrough_data_12.valid = get_state_rdy_out & get_state_valid_in;
  assign fifo_data_2.rden = get_state_rden_in;
  assign get_state_result_out_net = fifo_data_2.data_out;
  assign get_state_empty_out_net = fifo_data_2.empty;
  assign get_current_token_rdy_out_net = passthrough_data_13.rdy_ext;
  assign passthrough_data_13.valid = get_current_token_rdy_out & get_current_token_valid_in;
  assign fifo_data_3.rden = get_current_token_rden_in;
  assign get_current_token_result_out_net = fifo_data_3.data_out;
  assign get_current_token_empty_out_net = fifo_data_3.empty;
  assign set_output_token_rdy_out_net = passthrough_data_14.rdy_ext;
  assign passthrough_data_14.valid = set_output_token_rdy_out & set_output_token_valid_in;
  assign passthrough_data_14.data = { set_output_token_token_id_in };
  assign fifo_data_4.rden = set_output_token_rden_in;
  assign set_output_token_empty_out_net = fifo_data_4.empty;
  assign get_output_token_rdy_out_net = passthrough_data_15.rdy_ext;
  assign passthrough_data_15.valid = get_output_token_rdy_out & get_output_token_valid_in;
  assign fifo_data_5.rden = get_output_token_rden_in;
  assign get_output_token_result_out_net = fifo_data_5.data_out;
  assign get_output_token_empty_out_net = fifo_data_5.empty;
  assign get_token_count_rdy_out_net = passthrough_data_16.rdy_ext;
  assign passthrough_data_16.valid = get_token_count_rdy_out & get_token_count_valid_in;
  assign fifo_data_6.rden = get_token_count_rden_in;
  assign get_token_count_result_out_net = fifo_data_6.data_out;
  assign get_token_count_empty_out_net = fifo_data_6.empty;
  assign is_idle_rdy_out_net = passthrough_data_17.rdy_ext;
  assign passthrough_data_17.valid = is_idle_rdy_out & is_idle_valid_in;
  assign fifo_data_7.rden = is_idle_rden_in;
  assign is_idle_result_out_net = fifo_data_7.data_out;
  assign is_idle_empty_out_net = fifo_data_7.empty;
  assign is_output_ready_rdy_out_net = passthrough_data_18.rdy_ext;
  assign passthrough_data_18.valid = is_output_ready_rdy_out & is_output_ready_valid_in;
  assign fifo_data_8.rden = is_output_ready_rden_in;
  assign is_output_ready_result_out_net = fifo_data_8.data_out;
  assign is_output_ready_empty_out_net = fifo_data_8.empty;
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
    fifo_data_0.overflow = _fifo_0_start_Return_overflow_out;
    fifo_data_0.underflow = _fifo_0_start_Return_underflow_out;
    fifo_data_0.empty = _fifo_0_start_Return_empty;
    fifo_data_0.almost_full = _fifo_0_start_Return_full;
    fifo_data_1.overflow = _fifo_1_advance_Return_overflow_out;
    fifo_data_1.underflow = _fifo_1_advance_Return_underflow_out;
    fifo_data_1.empty = _fifo_1_advance_Return_empty;
    fifo_data_1.almost_full = _fifo_1_advance_Return_full;
    fifo_data_2.overflow = _fifo_2_get_state_Return_overflow_out;
    fifo_data_2.underflow = _fifo_2_get_state_Return_underflow_out;
    fifo_data_2.empty = _fifo_2_get_state_Return_empty;
    fifo_data_2.almost_full = _fifo_2_get_state_Return_full;
    fifo_data_2.data_out = _fifo_2_get_state_Return_q;
    fifo_data_3.overflow = _fifo_3_get_current_token_Return_overflow_out;
    fifo_data_3.underflow = _fifo_3_get_current_token_Return_underflow_out;
    fifo_data_3.empty = _fifo_3_get_current_token_Return_empty;
    fifo_data_3.almost_full = _fifo_3_get_current_token_Return_full;
    fifo_data_3.data_out = _fifo_3_get_current_token_Return_q;
    fifo_data_4.overflow = _fifo_4_set_output_token_Return_overflow_out;
    fifo_data_4.underflow = _fifo_4_set_output_token_Return_underflow_out;
    fifo_data_4.empty = _fifo_4_set_output_token_Return_empty;
    fifo_data_4.almost_full = _fifo_4_set_output_token_Return_full;
    fifo_data_5.overflow = _fifo_5_get_output_token_Return_overflow_out;
    fifo_data_5.underflow = _fifo_5_get_output_token_Return_underflow_out;
    fifo_data_5.empty = _fifo_5_get_output_token_Return_empty;
    fifo_data_5.almost_full = _fifo_5_get_output_token_Return_full;
    fifo_data_5.data_out = _fifo_5_get_output_token_Return_q;
    fifo_data_6.overflow = _fifo_6_get_token_count_Return_overflow_out;
    fifo_data_6.underflow = _fifo_6_get_token_count_Return_underflow_out;
    fifo_data_6.empty = _fifo_6_get_token_count_Return_empty;
    fifo_data_6.almost_full = _fifo_6_get_token_count_Return_full;
    fifo_data_6.data_out = _fifo_6_get_token_count_Return_q;
    fifo_data_7.overflow = _fifo_7_is_idle_Return_overflow_out;
    fifo_data_7.underflow = _fifo_7_is_idle_Return_underflow_out;
    fifo_data_7.empty = _fifo_7_is_idle_Return_empty;
    fifo_data_7.almost_full = _fifo_7_is_idle_Return_full;
    fifo_data_7.data_out = _fifo_7_is_idle_Return_q;
    fifo_data_8.overflow = _fifo_8_is_output_ready_Return_overflow_out;
    fifo_data_8.underflow = _fifo_8_is_output_ready_Return_underflow_out;
    fifo_data_8.empty = _fifo_8_is_output_ready_Return_empty;
    fifo_data_8.almost_full = _fifo_8_is_output_ready_Return_full;
    fifo_data_8.data_out = _fifo_8_is_output_ready_Return_q;
    fifo_data_9.overflow = _fifo_9_reset_Return_overflow_out;
    fifo_data_9.underflow = _fifo_9_reset_Return_underflow_out;
    fifo_data_9.empty = _fifo_9_reset_Return_empty;
    fifo_data_9.almost_full = _fifo_9_reset_Return_full;
    fifo_data_0.wren = _start_BasicBlock_0Impl_fifo_wren_0;	// global_controller.k:21:9
    passthrough_data_10.rdy_int = _start_BasicBlock_0Impl_input_rdy_0;	// global_controller.k:21:9
    fifo_data_1.wren = _advance_BasicBlock_0Impl_fifo_wren_0;	// global_controller.k:31:9
    passthrough_data_11.rdy_int = _advance_BasicBlock_0Impl_input_rdy_0;	// global_controller.k:31:9
    fifo_data_2.data_in = _get_state_BasicBlock_0Impl_fifo_data_out_0;	// global_controller.k:48:9
    fifo_data_2.wren = _get_state_BasicBlock_0Impl_fifo_wren_0;	// global_controller.k:48:9
    passthrough_data_12.rdy_int = _get_state_BasicBlock_0Impl_input_rdy_0;	// global_controller.k:48:9
    fifo_data_3.data_in = _get_current_token_BasicBlock_0Impl_fifo_data_out_0;	// global_controller.k:54:9
    fifo_data_3.wren = _get_current_token_BasicBlock_0Impl_fifo_wren_0;	// global_controller.k:54:9
    passthrough_data_13.rdy_int = _get_current_token_BasicBlock_0Impl_input_rdy_0;	// global_controller.k:54:9
    fifo_data_4.wren = _set_output_token_BasicBlock_0Impl_fifo_wren_0;	// global_controller.k:60:9
    passthrough_data_14.rdy_int = _set_output_token_BasicBlock_0Impl_input_rdy_0;	// global_controller.k:60:9
    fifo_data_5.data_in = _get_output_token_BasicBlock_0Impl_fifo_data_out_0;	// global_controller.k:69:9
    fifo_data_5.wren = _get_output_token_BasicBlock_0Impl_fifo_wren_0;	// global_controller.k:69:9
    passthrough_data_15.rdy_int = _get_output_token_BasicBlock_0Impl_input_rdy_0;	// global_controller.k:69:9
    fifo_data_6.data_in = _get_token_count_BasicBlock_0Impl_fifo_data_out_0;	// global_controller.k:75:9
    fifo_data_6.wren = _get_token_count_BasicBlock_0Impl_fifo_wren_0;	// global_controller.k:75:9
    passthrough_data_16.rdy_int = _get_token_count_BasicBlock_0Impl_input_rdy_0;	// global_controller.k:75:9
    fifo_data_7.data_in = _is_idle_BasicBlock_0Impl_fifo_data_out_0;	// global_controller.k:81:9
    fifo_data_7.wren = _is_idle_BasicBlock_0Impl_fifo_wren_0;	// global_controller.k:81:9
    passthrough_data_17.rdy_int = _is_idle_BasicBlock_0Impl_input_rdy_0;	// global_controller.k:81:9
    fifo_data_8.data_in = _is_output_ready_BasicBlock_0Impl_fifo_data_out_0;	// global_controller.k:87:9
    fifo_data_8.wren = _is_output_ready_BasicBlock_0Impl_fifo_wren_0;	// global_controller.k:87:9
    passthrough_data_18.rdy_int = _is_output_ready_BasicBlock_0Impl_input_rdy_0;	// global_controller.k:87:9
    fifo_data_9.wren = _reset_BasicBlock_0Impl_fifo_wren_0;	// global_controller.k:93:9
    passthrough_data_19.rdy_int = _reset_BasicBlock_0Impl_input_rdy_0;	// global_controller.k:93:9
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
  global_controller_reg_6_w3_v_0_6_1_v_2_6_0_i_6_0 _state (	// global_controller.k:12:5
    .clk           (clk),	// global_controller.k:12:5
    .rst           (reg_rst_delayed[0]),	// global_controller.k:12:5
    .input_valid_0 (_start_BasicBlock_0Impl_global_out__state_8_0_valid),	// global_controller.k:21:9
    .input_valid_1 (_advance_BasicBlock_0Impl_global_out__state_8_1_valid),	// global_controller.k:31:9
    .input_1       (_advance_BasicBlock_0Impl_global_out__state_8_1),	// global_controller.k:31:9
    .input_valid_2 (_reset_BasicBlock_0Impl_global_out__state_8_2_valid),	// global_controller.k:93:9
    .value_out     (__state_value_out)
  );	// global_controller.k:12:5
  global_controller_reg_12_w2_v_1_12_0_i_12_0 _token_count (	// global_controller.k:13:5
    .clk           (clk),	// global_controller.k:12:5
    .rst           (reg_rst_delayed[1]),	// global_controller.k:13:5
    .input_valid_0 (_advance_BasicBlock_0Impl_global_out__token_count_9_0_valid),	// global_controller.k:31:9
    .input_0       (_advance_BasicBlock_0Impl_global_out__token_count_9_0),	// global_controller.k:31:9
    .input_valid_1 (_reset_BasicBlock_0Impl_global_out__token_count_9_1_valid),	// global_controller.k:93:9
    .value_out     (__token_count_value_out)
  );	// global_controller.k:13:5
  global_controller_reg_17_w2_v_1_17_0_i_17_0 _current_token (	// global_controller.k:14:5
    .clk           (clk),	// global_controller.k:12:5
    .rst           (reg_rst_delayed[2]),	// global_controller.k:14:5
    .input_valid_0 (_start_BasicBlock_0Impl_global_out__current_token_10_0_valid),	// global_controller.k:21:9
    .input_0       (_start_BasicBlock_0Impl_global_out__current_token_10_0),	// global_controller.k:21:9
    .input_valid_1 (_reset_BasicBlock_0Impl_global_out__current_token_10_1_valid),	// global_controller.k:93:9
    .value_out     (__current_token_value_out)
  );	// global_controller.k:14:5
  global_controller_reg_17_w2_v_1_17_0_i_17_0 _output_token (	// global_controller.k:15:5
    .clk           (clk),	// global_controller.k:12:5
    .rst           (reg_rst_delayed[3]),	// global_controller.k:15:5
    .input_valid_0
      (_set_output_token_BasicBlock_0Impl_global_out__output_token_11_0_valid),	// global_controller.k:60:9
    .input_0       (_set_output_token_BasicBlock_0Impl_global_out__output_token_11_0),	// global_controller.k:60:9
    .input_valid_1 (_reset_BasicBlock_0Impl_global_out__output_token_11_1_valid),	// global_controller.k:93:9
    .value_out     (__output_token_value_out)
  );	// global_controller.k:15:5
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
    .AUTO_PIPELINE_GROUP("fifo_0_start_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(0)
  ) fifo_0_start_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[4]),
    .overflow_out  (_fifo_0_start_Return_overflow_out),
    .underflow_out (_fifo_0_start_Return_underflow_out),
    .empty         (_fifo_0_start_Return_empty),
    .rdreq         (fifo_data_0.rden),
    .full          (_fifo_0_start_Return_full),
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
    .AUTO_PIPELINE_GROUP("fifo_1_advance_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(0)
  ) fifo_1_advance_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[5]),
    .overflow_out  (_fifo_1_advance_Return_overflow_out),
    .underflow_out (_fifo_1_advance_Return_underflow_out),
    .empty         (_fifo_1_advance_Return_empty),
    .rdreq         (fifo_data_1.rden),
    .full          (_fifo_1_advance_Return_full),
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
    .AUTO_PIPELINE_GROUP("fifo_2_get_state_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(1)
  ) fifo_2_get_state_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[6]),
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
    .WIDTH(17),
    .PORT_WIDTH(17),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_3_get_current_token_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(1)
  ) fifo_3_get_current_token_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[7]),
    .overflow_out  (_fifo_3_get_current_token_Return_overflow_out),
    .underflow_out (_fifo_3_get_current_token_Return_underflow_out),
    .empty         (_fifo_3_get_current_token_Return_empty),
    .rdreq         (fifo_data_3.rden),
    .full          (_fifo_3_get_current_token_Return_full),
    .wrreq         (fifo_data_3.wren),
    .data          (fifo_data_3.data_in),
    .q             (_fifo_3_get_current_token_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(0),
    .PORT_WIDTH(1),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_4_set_output_token_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(0)
  ) fifo_4_set_output_token_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[8]),
    .overflow_out  (_fifo_4_set_output_token_Return_overflow_out),
    .underflow_out (_fifo_4_set_output_token_Return_underflow_out),
    .empty         (_fifo_4_set_output_token_Return_empty),
    .rdreq         (fifo_data_4.rden),
    .full          (_fifo_4_set_output_token_Return_full),
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
    .AUTO_PIPELINE_GROUP("fifo_5_get_output_token_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(1)
  ) fifo_5_get_output_token_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[9]),
    .overflow_out  (_fifo_5_get_output_token_Return_overflow_out),
    .underflow_out (_fifo_5_get_output_token_Return_underflow_out),
    .empty         (_fifo_5_get_output_token_Return_empty),
    .rdreq         (fifo_data_5.rden),
    .full          (_fifo_5_get_output_token_Return_full),
    .wrreq         (fifo_data_5.wren),
    .data          (fifo_data_5.data_in),
    .q             (_fifo_5_get_output_token_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(12),
    .PORT_WIDTH(12),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_6_get_token_count_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(1)
  ) fifo_6_get_token_count_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[10]),
    .overflow_out  (_fifo_6_get_token_count_Return_overflow_out),
    .underflow_out (_fifo_6_get_token_count_Return_underflow_out),
    .empty         (_fifo_6_get_token_count_Return_empty),
    .rdreq         (fifo_data_6.rden),
    .full          (_fifo_6_get_token_count_Return_full),
    .wrreq         (fifo_data_6.wren),
    .data          (fifo_data_6.data_in),
    .q             (_fifo_6_get_token_count_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(1),
    .PORT_WIDTH(1),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_7_is_idle_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(1)
  ) fifo_7_is_idle_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[11]),
    .overflow_out  (_fifo_7_is_idle_Return_overflow_out),
    .underflow_out (_fifo_7_is_idle_Return_underflow_out),
    .empty         (_fifo_7_is_idle_Return_empty),
    .rdreq         (fifo_data_7.rden),
    .full          (_fifo_7_is_idle_Return_full),
    .wrreq         (fifo_data_7.wren),
    .data          (fifo_data_7.data_in),
    .q             (_fifo_7_is_idle_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(1),
    .PORT_WIDTH(1),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_8_is_output_ready_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(1)
  ) fifo_8_is_output_ready_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[12]),
    .overflow_out  (_fifo_8_is_output_ready_Return_overflow_out),
    .underflow_out (_fifo_8_is_output_ready_Return_underflow_out),
    .empty         (_fifo_8_is_output_ready_Return_empty),
    .rdreq         (fifo_data_8.rden),
    .full          (_fifo_8_is_output_ready_Return_full),
    .wrreq         (fifo_data_8.wren),
    .data          (fifo_data_8.data_in),
    .q             (_fifo_8_is_output_ready_Return_q)
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
  global_controller_start_BasicBlock_0 start_BasicBlock_0Impl (	// global_controller.k:21:9
    .clk                                  (clk),	// global_controller.k:21:9
    .rst                                  (reg_rst_delayed[14]),	// global_controller.k:21:9
    .done_out                             (/* unused */),
    .global_out__state_8_0_valid
      (_start_BasicBlock_0Impl_global_out__state_8_0_valid),
    .global_out__current_token_10_0_valid
      (_start_BasicBlock_0Impl_global_out__current_token_10_0_valid),
    .global_out__current_token_10_0
      (_start_BasicBlock_0Impl_global_out__current_token_10_0),
    .fifo_wren_0                          (_start_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0            (fifo_data_0.almost_full),	// global_controller.k:21:9
    .fifo_overflow_in_0                   (fifo_data_0.overflow),	// global_controller.k:21:9
    .data_in_10                           (passthrough_data_10.data),	// global_controller.k:21:9
    .input_fifo_underflow_0               (passthrough_data_10.underflow),	// global_controller.k:21:9
    .input_rdy_0                          (_start_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0                        (passthrough_data_10.valid),	// global_controller.k:21:9
    .control_state_out                    (/* unused */)
  );	// global_controller.k:21:9
  global_controller_advance_BasicBlock_0 advance_BasicBlock_0Impl (	// global_controller.k:31:9
    .clk                               (clk),	// global_controller.k:31:9
    .rst                               (reg_rst_delayed[15]),	// global_controller.k:31:9
    .done_out                          (/* unused */),
    .global_in__state_8                (__state_value_out),	// global_controller.k:12:5
    .global_in__token_count_9          (__token_count_value_out),	// global_controller.k:13:5
    .global_out__state_8_1_valid
      (_advance_BasicBlock_0Impl_global_out__state_8_1_valid),
    .global_out__state_8_1             (_advance_BasicBlock_0Impl_global_out__state_8_1),
    .global_out__token_count_9_0_valid
      (_advance_BasicBlock_0Impl_global_out__token_count_9_0_valid),
    .global_out__token_count_9_0
      (_advance_BasicBlock_0Impl_global_out__token_count_9_0),
    .fifo_wren_0                       (_advance_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0         (fifo_data_1.almost_full),	// global_controller.k:31:9
    .fifo_overflow_in_0                (fifo_data_1.overflow),	// global_controller.k:31:9
    .input_fifo_underflow_0            (passthrough_data_11.underflow),	// global_controller.k:31:9
    .input_rdy_0                       (_advance_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0                     (passthrough_data_11.valid),	// global_controller.k:31:9
    .control_state_out                 (/* unused */)
  );	// global_controller.k:31:9
  global_controller_get_state_BasicBlock_0 get_state_BasicBlock_0Impl (	// global_controller.k:48:9
    .clk                       (clk),	// global_controller.k:48:9
    .rst                       (reg_rst_delayed[16]),	// global_controller.k:48:9
    .done_out                  (/* unused */),
    .global_in__state_8        (__state_value_out),	// global_controller.k:12:5
    .fifo_data_out_0           (_get_state_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0               (_get_state_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_2.almost_full),	// global_controller.k:48:9
    .fifo_overflow_in_0        (fifo_data_2.overflow),	// global_controller.k:48:9
    .input_fifo_underflow_0    (passthrough_data_12.underflow),	// global_controller.k:48:9
    .input_rdy_0               (_get_state_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_12.valid),	// global_controller.k:48:9
    .control_state_out         (/* unused */)
  );	// global_controller.k:48:9
  global_controller_get_current_token_BasicBlock_0 get_current_token_BasicBlock_0Impl (	// global_controller.k:54:9
    .clk                         (clk),	// global_controller.k:54:9
    .rst                         (reg_rst_delayed[17]),	// global_controller.k:54:9
    .done_out                    (/* unused */),
    .global_in__current_token_10 (__current_token_value_out),	// global_controller.k:14:5
    .fifo_data_out_0             (_get_current_token_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0                 (_get_current_token_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0   (fifo_data_3.almost_full),	// global_controller.k:54:9
    .fifo_overflow_in_0          (fifo_data_3.overflow),	// global_controller.k:54:9
    .input_fifo_underflow_0      (passthrough_data_13.underflow),	// global_controller.k:54:9
    .input_rdy_0                 (_get_current_token_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0               (passthrough_data_13.valid),	// global_controller.k:54:9
    .control_state_out           (/* unused */)
  );	// global_controller.k:54:9
  global_controller_set_output_token_BasicBlock_0 set_output_token_BasicBlock_0Impl (	// global_controller.k:60:9
    .clk                                 (clk),	// global_controller.k:60:9
    .rst                                 (reg_rst_delayed[18]),	// global_controller.k:60:9
    .done_out                            (/* unused */),
    .global_out__output_token_11_0_valid
      (_set_output_token_BasicBlock_0Impl_global_out__output_token_11_0_valid),
    .global_out__output_token_11_0
      (_set_output_token_BasicBlock_0Impl_global_out__output_token_11_0),
    .fifo_wren_0                         (_set_output_token_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0           (fifo_data_4.almost_full),	// global_controller.k:60:9
    .fifo_overflow_in_0                  (fifo_data_4.overflow),	// global_controller.k:60:9
    .data_in_14                          (passthrough_data_14.data),	// global_controller.k:60:9
    .input_fifo_underflow_0              (passthrough_data_14.underflow),	// global_controller.k:60:9
    .input_rdy_0                         (_set_output_token_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0                       (passthrough_data_14.valid),	// global_controller.k:60:9
    .control_state_out                   (/* unused */)
  );	// global_controller.k:60:9
  global_controller_get_output_token_BasicBlock_0 get_output_token_BasicBlock_0Impl (	// global_controller.k:69:9
    .clk                        (clk),	// global_controller.k:69:9
    .rst                        (reg_rst_delayed[19]),	// global_controller.k:69:9
    .done_out                   (/* unused */),
    .global_in__output_token_11 (__output_token_value_out),	// global_controller.k:15:5
    .fifo_data_out_0            (_get_output_token_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0                (_get_output_token_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0  (fifo_data_5.almost_full),	// global_controller.k:69:9
    .fifo_overflow_in_0         (fifo_data_5.overflow),	// global_controller.k:69:9
    .input_fifo_underflow_0     (passthrough_data_15.underflow),	// global_controller.k:69:9
    .input_rdy_0                (_get_output_token_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0              (passthrough_data_15.valid),	// global_controller.k:69:9
    .control_state_out          (/* unused */)
  );	// global_controller.k:69:9
  global_controller_get_token_count_BasicBlock_0 get_token_count_BasicBlock_0Impl (	// global_controller.k:75:9
    .clk                       (clk),	// global_controller.k:75:9
    .rst                       (reg_rst_delayed[20]),	// global_controller.k:75:9
    .done_out                  (/* unused */),
    .global_in__token_count_9  (__token_count_value_out),	// global_controller.k:13:5
    .fifo_data_out_0           (_get_token_count_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0               (_get_token_count_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_6.almost_full),	// global_controller.k:75:9
    .fifo_overflow_in_0        (fifo_data_6.overflow),	// global_controller.k:75:9
    .input_fifo_underflow_0    (passthrough_data_16.underflow),	// global_controller.k:75:9
    .input_rdy_0               (_get_token_count_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_16.valid),	// global_controller.k:75:9
    .control_state_out         (/* unused */)
  );	// global_controller.k:75:9
  global_controller_is_idle_BasicBlock_0 is_idle_BasicBlock_0Impl (	// global_controller.k:81:9
    .clk                       (clk),	// global_controller.k:81:9
    .rst                       (reg_rst_delayed[21]),	// global_controller.k:81:9
    .done_out                  (/* unused */),
    .global_in__state_8        (__state_value_out),	// global_controller.k:12:5
    .fifo_data_out_0           (_is_idle_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0               (_is_idle_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_7.almost_full),	// global_controller.k:81:9
    .fifo_overflow_in_0        (fifo_data_7.overflow),	// global_controller.k:81:9
    .input_fifo_underflow_0    (passthrough_data_17.underflow),	// global_controller.k:81:9
    .input_rdy_0               (_is_idle_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_17.valid),	// global_controller.k:81:9
    .control_state_out         (/* unused */)
  );	// global_controller.k:81:9
  global_controller_is_output_ready_BasicBlock_0 is_output_ready_BasicBlock_0Impl (	// global_controller.k:87:9
    .clk                       (clk),	// global_controller.k:87:9
    .rst                       (reg_rst_delayed[22]),	// global_controller.k:87:9
    .done_out                  (/* unused */),
    .global_in__state_8        (__state_value_out),	// global_controller.k:12:5
    .fifo_data_out_0           (_is_output_ready_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0               (_is_output_ready_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_8.almost_full),	// global_controller.k:87:9
    .fifo_overflow_in_0        (fifo_data_8.overflow),	// global_controller.k:87:9
    .input_fifo_underflow_0    (passthrough_data_18.underflow),	// global_controller.k:87:9
    .input_rdy_0               (_is_output_ready_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_18.valid),	// global_controller.k:87:9
    .control_state_out         (/* unused */)
  );	// global_controller.k:87:9
  global_controller_reset_BasicBlock_0 reset_BasicBlock_0Impl (	// global_controller.k:93:9
    .clk                                  (clk),	// global_controller.k:93:9
    .rst                                  (reg_rst_delayed[23]),	// global_controller.k:93:9
    .done_out                             (/* unused */),
    .global_out__state_8_2_valid
      (_reset_BasicBlock_0Impl_global_out__state_8_2_valid),
    .global_out__token_count_9_1_valid
      (_reset_BasicBlock_0Impl_global_out__token_count_9_1_valid),
    .global_out__current_token_10_1_valid
      (_reset_BasicBlock_0Impl_global_out__current_token_10_1_valid),
    .global_out__output_token_11_1_valid
      (_reset_BasicBlock_0Impl_global_out__output_token_11_1_valid),
    .fifo_wren_0                          (_reset_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0            (fifo_data_9.almost_full),	// global_controller.k:93:9
    .fifo_overflow_in_0                   (fifo_data_9.overflow),	// global_controller.k:93:9
    .input_fifo_underflow_0               (passthrough_data_19.underflow),	// global_controller.k:93:9
    .input_rdy_0                          (_reset_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0                        (passthrough_data_19.valid),	// global_controller.k:93:9
    .control_state_out                    (/* unused */)
  );	// global_controller.k:93:9
  assign rst_and_startup_done_out = rst_and_startup_done_out_net;
  assign start_rdy_out = start_rdy_out_net;
  assign start_empty_out = start_empty_out_net;
  assign advance_rdy_out = advance_rdy_out_net;
  assign advance_empty_out = advance_empty_out_net;
  assign get_state_rdy_out = get_state_rdy_out_net;
  assign get_state_empty_out = get_state_empty_out_net;
  assign get_state_result_out = get_state_result_out_net;
  assign get_current_token_rdy_out = get_current_token_rdy_out_net;
  assign get_current_token_empty_out = get_current_token_empty_out_net;
  assign get_current_token_result_out = get_current_token_result_out_net;
  assign set_output_token_rdy_out = set_output_token_rdy_out_net;
  assign set_output_token_empty_out = set_output_token_empty_out_net;
  assign get_output_token_rdy_out = get_output_token_rdy_out_net;
  assign get_output_token_empty_out = get_output_token_empty_out_net;
  assign get_output_token_result_out = get_output_token_result_out_net;
  assign get_token_count_rdy_out = get_token_count_rdy_out_net;
  assign get_token_count_empty_out = get_token_count_empty_out_net;
  assign get_token_count_result_out = get_token_count_result_out_net;
  assign is_idle_rdy_out = is_idle_rdy_out_net;
  assign is_idle_empty_out = is_idle_empty_out_net;
  assign is_idle_result_out = is_idle_result_out_net;
  assign is_output_ready_rdy_out = is_output_ready_rdy_out_net;
  assign is_output_ready_empty_out = is_output_ready_empty_out_net;
  assign is_output_ready_result_out = is_output_ready_result_out_net;
  assign reset_rdy_out = reset_rdy_out_net;
  assign reset_empty_out = reset_empty_out_net;
  assign stall_rate_supported_out = stall_rate_supported_out_net;
endmodule

module global_controller_EsiWrapper(
     input  wire                                         clk,
     input  wire                                         rst,
     input  wire [2:0]                                   stall_rate_in,
     input  wire                                         stall_rate_valid_in,
  // input  wire /*Zero Width*/                          advance_arg,
     input  wire                                         advance_arg_valid,
  // input  wire /*Zero Width*/                          get_current_token_arg,
     input  wire                                         get_current_token_arg_valid,
  // input  wire /*Zero Width*/                          get_output_token_arg,
     input  wire                                         get_output_token_arg_valid,
  // input  wire /*Zero Width*/                          get_state_arg,
     input  wire                                         get_state_arg_valid,
  // input  wire /*Zero Width*/                          get_token_count_arg,
     input  wire                                         get_token_count_arg_valid,
  // input  wire /*Zero Width*/                          is_idle_arg,
     input  wire                                         is_idle_arg_valid,
  // input  wire /*Zero Width*/                          is_output_ready_arg,
     input  wire                                         is_output_ready_arg_valid,
  // input  wire /*Zero Width*/                          reset_arg,
     input  wire                                         reset_arg_valid,
     input  wire struct packed {logic [16:0] token_id; } set_output_token_arg,
     input  wire                                         set_output_token_arg_valid,
     input  wire struct packed {logic [16:0] token_id; } start_arg,
     input  wire                                         start_arg_valid,
     input  wire                                         advance_result_rden,
     input  wire                                         get_current_token_result_rden,
     input  wire                                         get_output_token_result_rden,
     input  wire                                         get_state_result_rden,
     input  wire                                         get_token_count_result_rden,
     input  wire                                         is_idle_result_rden,
     input  wire                                         is_output_ready_result_rden,
     input  wire                                         reset_result_rden,
     input  wire                                         set_output_token_result_rden,
     input  wire                                         start_result_rden,
     output wire                                         advance_arg_ready,
     output wire                                         get_current_token_arg_ready,
     output wire                                         get_output_token_arg_ready,
     output wire                                         get_state_arg_ready,
     output wire                                         get_token_count_arg_ready,
     output wire                                         is_idle_arg_ready,
     output wire                                         is_output_ready_arg_ready,
     output wire                                         reset_arg_ready,
     output wire                                         set_output_token_arg_ready,
     output wire                                         start_arg_ready,
  // output wire /*Zero Width*/                          advance_result,
     output wire                                         advance_result_empty,
     output wire [16:0]                                  get_current_token_result,
     output wire                                         get_current_token_result_empty,
     output wire [16:0]                                  get_output_token_result,
     output wire                                         get_output_token_result_empty,
     output wire [5:0]                                   get_state_result,
     output wire                                         get_state_result_empty,
     output wire [11:0]                                  get_token_count_result,
     output wire                                         get_token_count_result_empty,
     output wire                                         is_idle_result,
     output wire                                         is_idle_result_empty,
     output wire                                         is_output_ready_result,
     output wire                                         is_output_ready_result_empty,
  // output wire /*Zero Width*/                          reset_result,
     output wire                                         reset_result_empty,
  // output wire /*Zero Width*/                          set_output_token_result,
     output wire                                         set_output_token_result_empty,
  // output wire /*Zero Width*/                          start_result,
     output wire                                         start_result_empty,
     output wire                                         rst_and_startup_done_out,
     output wire                                         stall_rate_supported_out
);

  wire [5:0]  _EsiWrapped_get_state_result_out;
  wire [16:0] _EsiWrapped_get_current_token_result_out;
  wire [16:0] _EsiWrapped_get_output_token_result_out;
  wire [11:0] _EsiWrapped_get_token_count_result_out;
  global_controller EsiWrapped (
    .clk                          (clk),
    .rst                          (rst),
    .start_valid_in               (start_arg_valid),
    .start_token_id_in            (start_arg.token_id),
    .start_rden_in                (start_result_rden),
    .advance_valid_in             (advance_arg_valid),
    .advance_rden_in              (advance_result_rden),
    .get_state_valid_in           (get_state_arg_valid),
    .get_state_rden_in            (get_state_result_rden),
    .get_current_token_valid_in   (get_current_token_arg_valid),
    .get_current_token_rden_in    (get_current_token_result_rden),
    .set_output_token_valid_in    (set_output_token_arg_valid),
    .set_output_token_token_id_in (set_output_token_arg.token_id),
    .set_output_token_rden_in     (set_output_token_result_rden),
    .get_output_token_valid_in    (get_output_token_arg_valid),
    .get_output_token_rden_in     (get_output_token_result_rden),
    .get_token_count_valid_in     (get_token_count_arg_valid),
    .get_token_count_rden_in      (get_token_count_result_rden),
    .is_idle_valid_in             (is_idle_arg_valid),
    .is_idle_rden_in              (is_idle_result_rden),
    .is_output_ready_valid_in     (is_output_ready_arg_valid),
    .is_output_ready_rden_in      (is_output_ready_result_rden),
    .reset_valid_in               (reset_arg_valid),
    .reset_rden_in                (reset_result_rden),
    .stall_rate_in                (stall_rate_in),
    .stall_rate_valid_in          (stall_rate_valid_in),
    .rst_and_startup_done_out     (rst_and_startup_done_out),
    .start_rdy_out                (start_arg_ready),
    .start_empty_out              (start_result_empty),
    .advance_rdy_out              (advance_arg_ready),
    .advance_empty_out            (advance_result_empty),
    .get_state_rdy_out            (get_state_arg_ready),
    .get_state_empty_out          (get_state_result_empty),
    .get_state_result_out         (_EsiWrapped_get_state_result_out),
    .get_current_token_rdy_out    (get_current_token_arg_ready),
    .get_current_token_empty_out  (get_current_token_result_empty),
    .get_current_token_result_out (_EsiWrapped_get_current_token_result_out),
    .set_output_token_rdy_out     (set_output_token_arg_ready),
    .set_output_token_empty_out   (set_output_token_result_empty),
    .get_output_token_rdy_out     (get_output_token_arg_ready),
    .get_output_token_empty_out   (get_output_token_result_empty),
    .get_output_token_result_out  (_EsiWrapped_get_output_token_result_out),
    .get_token_count_rdy_out      (get_token_count_arg_ready),
    .get_token_count_empty_out    (get_token_count_result_empty),
    .get_token_count_result_out   (_EsiWrapped_get_token_count_result_out),
    .is_idle_rdy_out              (is_idle_arg_ready),
    .is_idle_empty_out            (is_idle_result_empty),
    .is_idle_result_out           (is_idle_result),
    .is_output_ready_rdy_out      (is_output_ready_arg_ready),
    .is_output_ready_empty_out    (is_output_ready_result_empty),
    .is_output_ready_result_out   (is_output_ready_result),
    .reset_rdy_out                (reset_arg_ready),
    .reset_empty_out              (reset_result_empty),
    .stall_rate_supported_out     (stall_rate_supported_out)
  );
  // Zero width: assign advance_result = /*Zero width*/;
  assign get_current_token_result = _EsiWrapped_get_current_token_result_out;
  assign get_output_token_result = _EsiWrapped_get_output_token_result_out;
  assign get_state_result = _EsiWrapped_get_state_result_out;
  assign get_token_count_result = _EsiWrapped_get_token_count_result_out;
  // Zero width: assign reset_result = /*Zero width*/;
  // Zero width: assign set_output_token_result = /*Zero width*/;
  // Zero width: assign start_result = /*Zero width*/;
endmodule

