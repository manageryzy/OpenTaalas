
// This file was generated. Do not modify.
// kanagawa --backend=sv --import-dir=/home/mana/workspace/OpenTaalas/third-party/kanagawa/library --base-library=/home/mana/workspace/OpenTaalas/third-party/kanagawa/library/mini-base.k --output=/home/mana/workspace/OpenTaalas/rtl/generated/kanagawa/smoke_accumulator /home/mana/workspace/OpenTaalas/rtl/kanagawa/smoke_accumulator.k

`default_nettype wire
module accumulatorDebugView_addEntry
(
    input wire clk,
    input wire[7:0]  _amount,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("addEntry time: %0t amount: %p", $time, _amount);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module accumulatorDebugView_addExit
(
    input wire clk,
    input wire[7:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("addExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module accumulatorDebugView_getExit
(
    input wire clk,
    input wire[7:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("getExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
`ifndef _TYPESCOPE_CoreModuleTypeScope
`define _TYPESCOPE_CoreModuleTypeScope
`endif // _TYPESCOPE_CoreModuleTypeScope
module accumulator_get_BasicBlock_0(	// smoke_accumulator.k:39:9
  input  wire       clk,
  input  wire       rst,
  output wire       done_out,
  input  wire [7:0] global_in__value_3,
  output wire [7:0] fifo_data_out_0,
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
  wire  [7:0] global_in__value_3_0 = global_in__value_3;	// smoke_accumulator.k:39:9
  logic       done_out_0;	// smoke_accumulator.k:39:9
  logic [7:0] fifo_data_out_0_0;	// smoke_accumulator.k:39:9
  logic       fifo_wren_0_0;	// smoke_accumulator.k:39:9
  logic       input_rdy_0_0;	// smoke_accumulator.k:39:9
  logic [7:0] control_state_out_0;	// smoke_accumulator.k:39:9
  wire        _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// smoke_accumulator.k:39:9
  always_comb begin	// smoke_accumulator.k:39:9
    input_rdy_0_0 = _GEN;	// smoke_accumulator.k:39:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// smoke_accumulator.k:39:9
  end // always_comb
  reg         p0_stage1_enable = 1'h0;	// smoke_accumulator.k:39:9
  reg   [7:0] p0_global_in__value_3;	// smoke_accumulator.k:39:9
  reg         p0_stage2_enable = 1'h0;	// smoke_accumulator.k:39:9
  always @(posedge clk) begin	// smoke_accumulator.k:39:9
    if (rst)	// smoke_accumulator.k:39:9
      p0_stage1_enable <= 1'h0;	// smoke_accumulator.k:39:9
    else	// smoke_accumulator.k:39:9
      p0_stage1_enable <= _GEN & input_valid_0;	// smoke_accumulator.k:39:9
    p0_global_in__value_3 <= global_in__value_3_0;	// smoke_accumulator.k:39:9
    if (rst)	// smoke_accumulator.k:39:9
      p0_stage2_enable <= 1'h0;	// smoke_accumulator.k:39:9
    else	// smoke_accumulator.k:39:9
      p0_stage2_enable <= p0_stage1_enable;	// smoke_accumulator.k:39:9
  end // always @(posedge)
  always_comb begin	// smoke_accumulator.k:39:9
    fifo_wren_0_0 = p0_stage2_enable;	// smoke_accumulator.k:37:5, :39:9
    fifo_data_out_0_0 = p0_global_in__value_3;	// smoke_accumulator.k:37:5, :39:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// smoke_accumulator.k:39:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// smoke_accumulator.k:39:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  accumulatorDebugView_getExit accumulatorDebugView_getExit_instance (	// smoke_accumulator.k:37:5
    .clk          (clk),	// smoke_accumulator.k:37:5
    ._ReturnValue (p0_stage1_enable ? global_in__value_3_0 : 'x),	// smoke_accumulator.k:37:5, :39:9
    .valid        (p0_stage1_enable),	// smoke_accumulator.k:39:9
    .valid_out    (/* unused */)
  );	// smoke_accumulator.k:37:5
  assign done_out = p0_stage2_enable;	// smoke_accumulator.k:39:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// smoke_accumulator.k:39:9
  assign fifo_wren_0 = fifo_wren_0_0;	// smoke_accumulator.k:39:9
  assign input_rdy_0 = input_rdy_0_0;	// smoke_accumulator.k:39:9
  assign control_state_out = control_state_out_0;	// smoke_accumulator.k:39:9
endmodule

module accumulator_add_BasicBlock_0(	// smoke_accumulator.k:17:9
  input  wire       clk,
  input  wire       rst,
  output wire       done_out,
  input  wire [7:0] global_in__value_3,
  output wire       global_out__value_3_0_valid,
  output wire [7:0] global_out__value_3_0,
  output wire [7:0] fifo_data_out_0,
  output wire       fifo_wren_0,
  input  wire       fifo_almost_full_in_raw_0,
  input  wire       fifo_overflow_in_0,
  input  wire [7:0] data_in_2,
  input  wire       input_fifo_underflow_0,
  output wire       input_rdy_0,
  input  wire       input_valid_0,
  output wire [7:0] control_state_out
);

  wire        _fifo_overflow_ffc_0_data_out;
  wire        _fifo_almostfull_ffc_0_data_out;
  wire  [7:0] global_in__value_3_0 = global_in__value_3;	// smoke_accumulator.k:17:9
  logic       done_out_0;	// smoke_accumulator.k:17:9
  logic       global_out__value_3_0_valid_0;	// smoke_accumulator.k:17:9
  logic [7:0] global_out__value_3_0_0;	// smoke_accumulator.k:17:9
  logic [7:0] fifo_data_out_0_0;	// smoke_accumulator.k:17:9
  logic       fifo_wren_0_0;	// smoke_accumulator.k:17:9
  logic       input_rdy_0_0;	// smoke_accumulator.k:17:9
  logic [7:0] control_state_out_0;	// smoke_accumulator.k:17:9
  wire        _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// smoke_accumulator.k:17:9
  always_comb begin	// smoke_accumulator.k:17:9
    input_rdy_0_0 = _GEN;	// smoke_accumulator.k:17:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// smoke_accumulator.k:17:9
  end // always_comb
  reg   [7:0] p0_data_in_2;	// smoke_accumulator.k:17:9
  reg         p0_stage1_enable = 1'h0;	// smoke_accumulator.k:17:9
  wire  [8:0] _value_plus_amount_ =
    9'({1'h0, global_in__value_3_0} + {1'h0, p0_data_in_2});	// smoke_accumulator.k:17:9, :21:25
  wire  [7:0] _value =
    {_value_plus_amount_[7] | _value_plus_amount_[8],
     _value_plus_amount_[6] | _value_plus_amount_[8],
     _value_plus_amount_[5] | _value_plus_amount_[8],
     _value_plus_amount_[4] | _value_plus_amount_[8],
     _value_plus_amount_[3] | _value_plus_amount_[8],
     _value_plus_amount_[2] | _value_plus_amount_[8],
     _value_plus_amount_[1] | _value_plus_amount_[8],
     _value_plus_amount_[0] | _value_plus_amount_[8]};	// smoke_accumulator.k:19:9, :21:25, :22:17, :28:26
  always_comb begin	// smoke_accumulator.k:17:9
    global_out__value_3_0_0 = _value;	// smoke_accumulator.k:19:9, :28:26
    global_out__value_3_0_valid_0 = p0_stage1_enable;	// smoke_accumulator.k:17:9, :19:9
  end // always_comb
  reg   [7:0] p0__value;	// smoke_accumulator.k:17:9
  reg         p0_stage2_enable = 1'h0;	// smoke_accumulator.k:17:9
  reg   [7:0] p0__value_0;	// smoke_accumulator.k:17:9
  reg         p0_stage3_enable = 1'h0;	// smoke_accumulator.k:17:9
  always @(posedge clk) begin	// smoke_accumulator.k:17:9
    p0_data_in_2 <= data_in_2;	// smoke_accumulator.k:17:9
    if (rst)	// smoke_accumulator.k:17:9
      p0_stage1_enable <= 1'h0;	// smoke_accumulator.k:17:9
    else	// smoke_accumulator.k:17:9
      p0_stage1_enable <= _GEN & input_valid_0;	// smoke_accumulator.k:17:9
    p0__value <= _value;	// smoke_accumulator.k:17:9, :19:9, :28:26
    if (rst)	// smoke_accumulator.k:17:9
      p0_stage2_enable <= 1'h0;	// smoke_accumulator.k:17:9
    else	// smoke_accumulator.k:17:9
      p0_stage2_enable <= p0_stage1_enable;	// smoke_accumulator.k:17:9
    p0__value_0 <= p0__value;	// smoke_accumulator.k:17:9
    if (rst)	// smoke_accumulator.k:17:9
      p0_stage3_enable <= 1'h0;	// smoke_accumulator.k:17:9
    else	// smoke_accumulator.k:17:9
      p0_stage3_enable <= p0_stage2_enable;	// smoke_accumulator.k:17:9
  end // always @(posedge)
  always_comb begin	// smoke_accumulator.k:17:9
    fifo_wren_0_0 = p0_stage3_enable;	// smoke_accumulator.k:15:5, :17:9
    fifo_data_out_0_0 = p0__value_0;	// smoke_accumulator.k:15:5, :17:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// smoke_accumulator.k:17:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// smoke_accumulator.k:17:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  accumulatorDebugView_addEntry accumulatorDebugView_addEntry_instance (	// smoke_accumulator.k:15:5
    .clk       (clk),	// smoke_accumulator.k:15:5
    ._amount   (p0_stage1_enable ? p0_data_in_2 : 'x),	// smoke_accumulator.k:15:5, :17:9
    .valid     (p0_stage1_enable),	// smoke_accumulator.k:17:9
    .valid_out (/* unused */)
  );	// smoke_accumulator.k:15:5
  accumulatorDebugView_addExit accumulatorDebugView_addExit_instance (	// smoke_accumulator.k:15:5
    .clk          (clk),	// smoke_accumulator.k:15:5
    ._ReturnValue (p0_stage2_enable ? p0__value : 'x),	// smoke_accumulator.k:15:5, :17:9
    .valid        (p0_stage2_enable),	// smoke_accumulator.k:17:9
    .valid_out    (/* unused */)
  );	// smoke_accumulator.k:15:5
  assign done_out = p0_stage3_enable;	// smoke_accumulator.k:17:9
  assign global_out__value_3_0_valid = global_out__value_3_0_valid_0;	// smoke_accumulator.k:17:9
  assign global_out__value_3_0 = global_out__value_3_0_0;	// smoke_accumulator.k:17:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// smoke_accumulator.k:17:9
  assign fifo_wren_0 = fifo_wren_0_0;	// smoke_accumulator.k:17:9
  assign input_rdy_0 = input_rdy_0_0;	// smoke_accumulator.k:17:9
  assign control_state_out = control_state_out_0;	// smoke_accumulator.k:17:9
endmodule

module accumulator_reg_8_w1_i_8_0(
  input  wire       clk,
  input  wire       rst,
  input  wire       input_valid_0,
  input  wire [7:0] input_0,
  output wire [7:0] value_out
);

  reg [7:0] value;
  always @(posedge clk) begin
    if (rst)
      value <= 8'h0;
    else
      value <= input_valid_0 ? input_0 : value;
  end // always @(posedge)
  assign value_out = value;
endmodule

module accumulator(
  input  wire       clk,
  input  wire       rst,
  input  wire       add_valid_in,
  input  wire [7:0] add_amount_in,
  input  wire       add_rden_in,
  input  wire       get_valid_in,
  input  wire       get_rden_in,
  input  wire [2:0] stall_rate_in,
  input  wire       stall_rate_valid_in,
  output wire       rst_and_startup_done_out,
  output wire       add_rdy_out,
  output wire       add_empty_out,
  output wire [7:0] add_result_out,
  output wire       get_rdy_out,
  output wire       get_empty_out,
  output wire [7:0] get_result_out,
  output wire       stall_rate_supported_out
);

  wire [7:0] _get_BasicBlock_0Impl_fifo_data_out_0;	// smoke_accumulator.k:39:9
  wire       _get_BasicBlock_0Impl_fifo_wren_0;	// smoke_accumulator.k:39:9
  wire       _get_BasicBlock_0Impl_input_rdy_0;	// smoke_accumulator.k:39:9
  wire       _add_BasicBlock_0Impl_global_out__value_3_0_valid;	// smoke_accumulator.k:17:9
  wire [7:0] _add_BasicBlock_0Impl_global_out__value_3_0;	// smoke_accumulator.k:17:9
  wire [7:0] _add_BasicBlock_0Impl_fifo_data_out_0;	// smoke_accumulator.k:17:9
  wire       _add_BasicBlock_0Impl_fifo_wren_0;	// smoke_accumulator.k:17:9
  wire       _add_BasicBlock_0Impl_input_rdy_0;	// smoke_accumulator.k:17:9
  wire       _fifo_1_get_Return_overflow_out;
  wire       _fifo_1_get_Return_underflow_out;
  wire       _fifo_1_get_Return_empty;
  wire       _fifo_1_get_Return_full;
  wire [7:0] _fifo_1_get_Return_q;
  wire       _fifo_0_add_Return_overflow_out;
  wire       _fifo_0_add_Return_underflow_out;
  wire       _fifo_0_add_Return_empty;
  wire       _fifo_0_add_Return_full;
  wire [7:0] _fifo_0_add_Return_q;
  wire       _has_startup_completed_delayed_1_delay_chain_data_out;
  wire       _has_startup_completed_delayed_0_delay_chain_data_out;
  wire [7:0] __value_value_out;	// smoke_accumulator.k:11:5
  wire       _reset_control_rst_and_startup_done_out;
  wire [4:0] _reset_control_rst_delayed_out;
  wire       _reset_control_reset_sequence_finished_this_cycle_out;
  logic  stall_rate_supported_out_net;
  logic  get_empty_out_net;
  logic [7:0] get_result_out_net;
  logic  get_rdy_out_net;
  logic  add_empty_out_net;
  logic [7:0] add_result_out_net;
  logic  add_rdy_out_net;
  logic  rst_and_startup_done_out_net;

  logic [31:0] dropped_commands;
  //synopsys translate_off
  KanagawaStringTable string_table(.clk(clk));
  //synopsys translate_on
  logic [4:0] reg_rst_delayed;
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

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [7:0] data_in;
      logic [7:0] data_out;
      logic overflow;
      logic underflow;
  } fifo_data_0;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [7:0] data_in;
      logic [7:0] data_out;
      logic overflow;
      logic underflow;
  } fifo_data_1;

  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [7:0] data;
      logic underflow;
  } passthrough_data_2;
  assign passthrough_data_2.underflow = 1'b0;
  assign passthrough_data_2.rdy_ext = passthrough_data_2.rdy_int & !(!has_startup_completed_delayed_0);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic underflow;
  } passthrough_data_3;
  assign passthrough_data_3.underflow = 1'b0;
  assign passthrough_data_3.rdy_ext = passthrough_data_3.rdy_int & !(!has_startup_completed_delayed_1);
  assign add_rdy_out_net = passthrough_data_2.rdy_ext;
  assign passthrough_data_2.valid = add_rdy_out & add_valid_in;
  assign passthrough_data_2.data = { add_amount_in };
  assign fifo_data_0.rden = add_rden_in;
  assign add_result_out_net = fifo_data_0.data_out;
  assign add_empty_out_net = fifo_data_0.empty;
  assign get_rdy_out_net = passthrough_data_3.rdy_ext;
  assign passthrough_data_3.valid = get_rdy_out & get_valid_in;
  assign fifo_data_1.rden = get_rden_in;
  assign get_result_out_net = fifo_data_1.data_out;
  assign get_empty_out_net = fifo_data_1.empty;
  always_comb begin
    rst_and_startup_done_out_net = _reset_control_rst_and_startup_done_out;
    reg_rst_delayed = _reset_control_rst_delayed_out;
    reset_sequence_finished_this_cycle = _reset_control_reset_sequence_finished_this_cycle_out;
    has_startup_completed_delayed_0 = _has_startup_completed_delayed_0_delay_chain_data_out;
    has_startup_completed_delayed_1 = _has_startup_completed_delayed_1_delay_chain_data_out;
    fifo_data_0.overflow = _fifo_0_add_Return_overflow_out;
    fifo_data_0.underflow = _fifo_0_add_Return_underflow_out;
    fifo_data_0.empty = _fifo_0_add_Return_empty;
    fifo_data_0.almost_full = _fifo_0_add_Return_full;
    fifo_data_0.data_out = _fifo_0_add_Return_q;
    fifo_data_1.overflow = _fifo_1_get_Return_overflow_out;
    fifo_data_1.underflow = _fifo_1_get_Return_underflow_out;
    fifo_data_1.empty = _fifo_1_get_Return_empty;
    fifo_data_1.almost_full = _fifo_1_get_Return_full;
    fifo_data_1.data_out = _fifo_1_get_Return_q;
    fifo_data_0.data_in = _add_BasicBlock_0Impl_fifo_data_out_0;	// smoke_accumulator.k:17:9
    fifo_data_0.wren = _add_BasicBlock_0Impl_fifo_wren_0;	// smoke_accumulator.k:17:9
    passthrough_data_2.rdy_int = _add_BasicBlock_0Impl_input_rdy_0;	// smoke_accumulator.k:17:9
    fifo_data_1.data_in = _get_BasicBlock_0Impl_fifo_data_out_0;	// smoke_accumulator.k:39:9
    fifo_data_1.wren = _get_BasicBlock_0Impl_fifo_wren_0;	// smoke_accumulator.k:39:9
    passthrough_data_3.rdy_int = _get_BasicBlock_0Impl_input_rdy_0;	// smoke_accumulator.k:39:9
  end // always_comb

  assign has_startup_completed_raw = 1'b1;
  assign stall_rate_supported_out_net = 1'b0;
  KanagawaResetControl #(
    .WIDTH(5),
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
  accumulator_reg_8_w1_i_8_0 _value (	// smoke_accumulator.k:11:5
    .clk           (clk),	// smoke_accumulator.k:11:5
    .rst           (reg_rst_delayed[0]),	// smoke_accumulator.k:11:5
    .input_valid_0 (_add_BasicBlock_0Impl_global_out__value_3_0_valid),	// smoke_accumulator.k:17:9
    .input_0       (_add_BasicBlock_0Impl_global_out__value_3_0),	// smoke_accumulator.k:17:9
    .value_out     (__value_value_out)
  );	// smoke_accumulator.k:11:5
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
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(8),
    .PORT_WIDTH(8),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_0_add_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(4),
    .USE_LUTRAM(1)
  ) fifo_0_add_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[1]),
    .overflow_out  (_fifo_0_add_Return_overflow_out),
    .underflow_out (_fifo_0_add_Return_underflow_out),
    .empty         (_fifo_0_add_Return_empty),
    .rdreq         (fifo_data_0.rden),
    .full          (_fifo_0_add_Return_full),
    .wrreq         (fifo_data_0.wren),
    .data          (fifo_data_0.data_in),
    .q             (_fifo_0_add_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(8),
    .PORT_WIDTH(8),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_1_get_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(1)
  ) fifo_1_get_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[2]),
    .overflow_out  (_fifo_1_get_Return_overflow_out),
    .underflow_out (_fifo_1_get_Return_underflow_out),
    .empty         (_fifo_1_get_Return_empty),
    .rdreq         (fifo_data_1.rden),
    .full          (_fifo_1_get_Return_full),
    .wrreq         (fifo_data_1.wren),
    .data          (fifo_data_1.data_in),
    .q             (_fifo_1_get_Return_q)
  );
  accumulator_add_BasicBlock_0 add_BasicBlock_0Impl (	// smoke_accumulator.k:17:9
    .clk                         (clk),	// smoke_accumulator.k:17:9
    .rst                         (reg_rst_delayed[3]),	// smoke_accumulator.k:17:9
    .done_out                    (/* unused */),
    .global_in__value_3          (__value_value_out),	// smoke_accumulator.k:11:5
    .global_out__value_3_0_valid (_add_BasicBlock_0Impl_global_out__value_3_0_valid),
    .global_out__value_3_0       (_add_BasicBlock_0Impl_global_out__value_3_0),
    .fifo_data_out_0             (_add_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0                 (_add_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0   (fifo_data_0.almost_full),	// smoke_accumulator.k:17:9
    .fifo_overflow_in_0          (fifo_data_0.overflow),	// smoke_accumulator.k:17:9
    .data_in_2                   (passthrough_data_2.data),	// smoke_accumulator.k:17:9
    .input_fifo_underflow_0      (passthrough_data_2.underflow),	// smoke_accumulator.k:17:9
    .input_rdy_0                 (_add_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0               (passthrough_data_2.valid),	// smoke_accumulator.k:17:9
    .control_state_out           (/* unused */)
  );	// smoke_accumulator.k:17:9
  accumulator_get_BasicBlock_0 get_BasicBlock_0Impl (	// smoke_accumulator.k:39:9
    .clk                       (clk),	// smoke_accumulator.k:39:9
    .rst                       (reg_rst_delayed[4]),	// smoke_accumulator.k:39:9
    .done_out                  (/* unused */),
    .global_in__value_3        (__value_value_out),	// smoke_accumulator.k:11:5
    .fifo_data_out_0           (_get_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0               (_get_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_1.almost_full),	// smoke_accumulator.k:39:9
    .fifo_overflow_in_0        (fifo_data_1.overflow),	// smoke_accumulator.k:39:9
    .input_fifo_underflow_0    (passthrough_data_3.underflow),	// smoke_accumulator.k:39:9
    .input_rdy_0               (_get_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_3.valid),	// smoke_accumulator.k:39:9
    .control_state_out         (/* unused */)
  );	// smoke_accumulator.k:39:9
  assign rst_and_startup_done_out = rst_and_startup_done_out_net;
  assign add_rdy_out = add_rdy_out_net;
  assign add_empty_out = add_empty_out_net;
  assign add_result_out = add_result_out_net;
  assign get_rdy_out = get_rdy_out_net;
  assign get_empty_out = get_empty_out_net;
  assign get_result_out = get_result_out_net;
  assign stall_rate_supported_out = stall_rate_supported_out_net;
endmodule

module accumulator_EsiWrapper(
     input  wire                                      clk,
     input  wire                                      rst,
     input  wire [2:0]                                stall_rate_in,
     input  wire                                      stall_rate_valid_in,
     input  wire struct packed {logic [7:0] amount; } add_arg,
     input  wire                                      add_arg_valid,
  // input  wire /*Zero Width*/                       get_arg,
     input  wire                                      get_arg_valid,
     input  wire                                      add_result_rden,
     input  wire                                      get_result_rden,
     output wire                                      add_arg_ready,
     output wire                                      get_arg_ready,
     output wire [7:0]                                add_result,
     output wire                                      add_result_empty,
     output wire [7:0]                                get_result,
     output wire                                      get_result_empty,
     output wire                                      rst_and_startup_done_out,
     output wire                                      stall_rate_supported_out
);

  wire [7:0] _EsiWrapped_add_result_out;
  wire [7:0] _EsiWrapped_get_result_out;
  accumulator EsiWrapped (
    .clk                      (clk),
    .rst                      (rst),
    .add_valid_in             (add_arg_valid),
    .add_amount_in            (add_arg.amount),
    .add_rden_in              (add_result_rden),
    .get_valid_in             (get_arg_valid),
    .get_rden_in              (get_result_rden),
    .stall_rate_in            (stall_rate_in),
    .stall_rate_valid_in      (stall_rate_valid_in),
    .rst_and_startup_done_out (rst_and_startup_done_out),
    .add_rdy_out              (add_arg_ready),
    .add_empty_out            (add_result_empty),
    .add_result_out           (_EsiWrapped_add_result_out),
    .get_rdy_out              (get_arg_ready),
    .get_empty_out            (get_result_empty),
    .get_result_out           (_EsiWrapped_get_result_out),
    .stall_rate_supported_out (stall_rate_supported_out)
  );
  assign add_result = _EsiWrapped_add_result_out;
  assign get_result = _EsiWrapped_get_result_out;
endmodule

