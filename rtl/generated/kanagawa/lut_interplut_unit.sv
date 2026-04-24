
// This file was generated. Do not modify.
// kanagawa --backend=sv --import-dir=/home/mana/workspace/OpenTaalas/third-party/kanagawa/library --base-library=/home/mana/workspace/OpenTaalas/third-party/kanagawa/library/mini-base.k --output=/home/mana/workspace/OpenTaalas/rtl/generated/kanagawa/lut_interp --frequency=250 --register-ratio=8 --max-register-ratio=16 /home/mana/workspace/OpenTaalas/rtl/kanagawa/lut_interp.k

`default_nettype wire
module lut_unitDebugView_set_entryEntry
(
    input wire clk,
    input wire[7:0]  _index,
    input wire[15:0]  _value,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("set_entryEntry time: %0t index: %p value: %p", $time, _index, _value);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module lut_unitDebugView_get_entryEntry
(
    input wire clk,
    input wire[7:0]  _index,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("get_entryEntry time: %0t index: %p", $time, _index);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module lut_unitDebugView_get_entryExit
(
    input wire clk,
    input wire[15:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("get_entryExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module lut_unitDebugView_lookupEntry
(
    input wire clk,
    input wire[15:0]  _input,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("lookupEntry time: %0t input: %p", $time, _input);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module lut_unitDebugView_lookupExit
(
    input wire clk,
    input wire[15:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("lookupExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
`ifndef _TYPESCOPE_CoreModuleTypeScope
`define _TYPESCOPE_CoreModuleTypeScope
`endif // _TYPESCOPE_CoreModuleTypeScope
module lut_unit_lookup_BasicBlock_0(	// lut_interp.k:41:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  input  wire [15:0] memory_read_data_in_6_1,
  output wire [7:0]  memory_read_addr_out_6_1,
  output wire        memory_rden_out_6_1,
  input  wire [15:0] memory_read_data_in_6_2,
  output wire [7:0]  memory_read_addr_out_6_2,
  output wire        memory_rden_out_6_2,
  output wire [15:0] fifo_data_out_0,
  output wire        fifo_wren_0,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [15:0] data_in_5,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  wire  [15:0] memory_read_data_in_6_1_0 = memory_read_data_in_6_1;	// lut_interp.k:41:9
  wire  [15:0] memory_read_data_in_6_2_0 = memory_read_data_in_6_2;	// lut_interp.k:41:9
  logic        done_out_0;	// lut_interp.k:41:9
  logic [7:0]  memory_read_addr_out_6_1_0;	// lut_interp.k:41:9
  logic        memory_rden_out_6_1_0;	// lut_interp.k:41:9
  logic [7:0]  memory_read_addr_out_6_2_0;	// lut_interp.k:41:9
  logic        memory_rden_out_6_2_0;	// lut_interp.k:41:9
  logic [15:0] fifo_data_out_0_0;	// lut_interp.k:41:9
  logic        fifo_wren_0_0;	// lut_interp.k:41:9
  logic        input_rdy_0_0;	// lut_interp.k:41:9
  logic [7:0]  control_state_out_0;	// lut_interp.k:41:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// lut_interp.k:41:9
  always_comb begin	// lut_interp.k:41:9
    input_rdy_0_0 = _GEN;	// lut_interp.k:41:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// lut_interp.k:41:9
  end // always_comb
  reg   [15:0] p0_data_in_5;	// lut_interp.k:41:9
  reg          p0_stage1_enable = 1'h0;	// lut_interp.k:41:9
  always_comb begin	// lut_interp.k:41:9
    memory_read_addr_out_6_1_0 = p0_data_in_5[15:8];	// lut_interp.k:41:9, :45:39, :48:25
    memory_rden_out_6_1_0 = p0_stage1_enable;	// lut_interp.k:41:9, :48:25
  end // always_comb
  wire  [8:0]  _cast_lt_uint9_gt_index_plus_1_ = 9'({1'h0, p0_data_in_5[15:8]} + 9'h1);	// lut_interp.k:41:9, :45:39, :57:30
  wire  [9:0]  _next_gt_255__diff = 10'(10'hFF - {1'h0, _cast_lt_uint9_gt_index_plus_1_});	// lut_interp.k:41:9, :57:30, :59:21
  always_comb begin	// lut_interp.k:41:9
    memory_read_addr_out_6_2_0 =
      {_cast_lt_uint9_gt_index_plus_1_[7] | _next_gt_255__diff[9],
       _cast_lt_uint9_gt_index_plus_1_[6] | _next_gt_255__diff[9],
       _cast_lt_uint9_gt_index_plus_1_[5] | _next_gt_255__diff[9],
       _cast_lt_uint9_gt_index_plus_1_[4] | _next_gt_255__diff[9],
       _cast_lt_uint9_gt_index_plus_1_[3] | _next_gt_255__diff[9],
       _cast_lt_uint9_gt_index_plus_1_[2] | _next_gt_255__diff[9],
       _cast_lt_uint9_gt_index_plus_1_[1] | _next_gt_255__diff[9],
       _cast_lt_uint9_gt_index_plus_1_[0] | _next_gt_255__diff[9]};	// lut_interp.k:57:30, :59:{17,21}, :65:34, :67:26
    memory_rden_out_6_2_0 = p0_stage1_enable;	// lut_interp.k:41:9, :67:26
  end // always_comb
  reg   [7:0]  p0_input;	// lut_interp.k:41:9
  reg          p0_stage2_enable = 1'h0;	// lut_interp.k:41:9
  reg   [7:0]  p0_input_0;	// lut_interp.k:41:9
  reg          p0_stage3_enable = 1'h0;	// lut_interp.k:41:9
  wire  [15:0] result =
    p0_input_0[7] ? memory_read_data_in_6_2_0 : memory_read_data_in_6_1_0;	// lut_interp.k:41:9, :50:{13,17}
  reg   [15:0] p0_result;	// lut_interp.k:41:9
  reg          p0_stage4_enable = 1'h0;	// lut_interp.k:41:9
  always @(posedge clk) begin	// lut_interp.k:41:9
    p0_data_in_5 <= data_in_5;	// lut_interp.k:41:9
    if (rst)	// lut_interp.k:41:9
      p0_stage1_enable <= 1'h0;	// lut_interp.k:41:9
    else	// lut_interp.k:41:9
      p0_stage1_enable <= _GEN & input_valid_0;	// lut_interp.k:41:9
    p0_input <= p0_data_in_5[7:0];	// lut_interp.k:41:9
    if (rst)	// lut_interp.k:41:9
      p0_stage2_enable <= 1'h0;	// lut_interp.k:41:9
    else	// lut_interp.k:41:9
      p0_stage2_enable <= p0_stage1_enable;	// lut_interp.k:41:9
    p0_input_0 <= p0_input;	// lut_interp.k:41:9
    if (rst)	// lut_interp.k:41:9
      p0_stage3_enable <= 1'h0;	// lut_interp.k:41:9
    else	// lut_interp.k:41:9
      p0_stage3_enable <= p0_stage2_enable;	// lut_interp.k:41:9
    p0_result <= result;	// lut_interp.k:41:9, :50:13
    if (rst)	// lut_interp.k:41:9
      p0_stage4_enable <= 1'h0;	// lut_interp.k:41:9
    else	// lut_interp.k:41:9
      p0_stage4_enable <= p0_stage3_enable;	// lut_interp.k:41:9
  end // always @(posedge)
  always_comb begin	// lut_interp.k:41:9
    fifo_wren_0_0 = p0_stage4_enable;	// lut_interp.k:39:5, :41:9
    fifo_data_out_0_0 = p0_result;	// lut_interp.k:39:5, :41:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// lut_interp.k:41:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// lut_interp.k:41:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  lut_unitDebugView_lookupEntry lut_unitDebugView_lookupEntry_instance (	// lut_interp.k:39:5
    .clk       (clk),	// lut_interp.k:39:5
    ._input    (p0_stage1_enable ? p0_data_in_5 : 'x),	// lut_interp.k:39:5, :41:9
    .valid     (p0_stage1_enable),	// lut_interp.k:41:9
    .valid_out (/* unused */)
  );	// lut_interp.k:39:5
  lut_unitDebugView_lookupExit lut_unitDebugView_lookupExit_instance (	// lut_interp.k:39:5
    .clk          (clk),	// lut_interp.k:39:5
    ._ReturnValue (p0_stage3_enable ? result : 'x),	// lut_interp.k:39:5, :41:9, :50:13
    .valid        (p0_stage3_enable),	// lut_interp.k:41:9
    .valid_out    (/* unused */)
  );	// lut_interp.k:39:5
  assign done_out = p0_stage4_enable;	// lut_interp.k:41:9
  assign memory_read_addr_out_6_1 = memory_read_addr_out_6_1_0;	// lut_interp.k:41:9
  assign memory_rden_out_6_1 = memory_rden_out_6_1_0;	// lut_interp.k:41:9
  assign memory_read_addr_out_6_2 = memory_read_addr_out_6_2_0;	// lut_interp.k:41:9
  assign memory_rden_out_6_2 = memory_rden_out_6_2_0;	// lut_interp.k:41:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// lut_interp.k:41:9
  assign fifo_wren_0 = fifo_wren_0_0;	// lut_interp.k:41:9
  assign input_rdy_0 = input_rdy_0_0;	// lut_interp.k:41:9
  assign control_state_out = control_state_out_0;	// lut_interp.k:41:9
endmodule

module lut_unit_get_entry_BasicBlock_0(	// lut_interp.k:27:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  input  wire [15:0] memory_read_data_in_6_0,
  output wire [7:0]  memory_read_addr_out_6_0,
  output wire        memory_rden_out_6_0,
  output wire [15:0] fifo_data_out_0,
  output wire        fifo_wren_0,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [7:0]  data_in_4,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  wire  [15:0] memory_read_data_in_6_0_0 = memory_read_data_in_6_0;	// lut_interp.k:27:9
  logic        done_out_0;	// lut_interp.k:27:9
  logic [7:0]  memory_read_addr_out_6_0_0;	// lut_interp.k:27:9
  logic        memory_rden_out_6_0_0;	// lut_interp.k:27:9
  logic [15:0] fifo_data_out_0_0;	// lut_interp.k:27:9
  logic        fifo_wren_0_0;	// lut_interp.k:27:9
  logic        input_rdy_0_0;	// lut_interp.k:27:9
  logic [7:0]  control_state_out_0;	// lut_interp.k:27:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// lut_interp.k:27:9
  wire         _GEN_0 = _GEN & input_valid_0;	// lut_interp.k:27:9
  always_comb begin	// lut_interp.k:27:9
    input_rdy_0_0 = _GEN;	// lut_interp.k:27:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// lut_interp.k:27:9
  end // always_comb
  always_comb begin	// lut_interp.k:27:9
    memory_read_addr_out_6_0_0 = data_in_4;	// lut_interp.k:30:22
    memory_rden_out_6_0_0 = _GEN_0;	// lut_interp.k:27:9, :30:22
  end // always_comb
  reg   [7:0]  p0_data_in_4;	// lut_interp.k:27:9
  reg          p0_stage1_enable = 1'h0;	// lut_interp.k:27:9
  reg          p0_stage2_enable = 1'h0;	// lut_interp.k:27:9
  reg   [15:0] p0_memory_read_data_in_6_0;	// lut_interp.k:27:9
  reg          p0_stage3_enable = 1'h0;	// lut_interp.k:27:9
  always @(posedge clk) begin	// lut_interp.k:27:9
    p0_data_in_4 <= data_in_4;	// lut_interp.k:27:9
    if (rst) begin	// lut_interp.k:27:9
      p0_stage1_enable <= 1'h0;	// lut_interp.k:27:9
      p0_stage2_enable <= 1'h0;	// lut_interp.k:27:9
    end
    else begin	// lut_interp.k:27:9
      p0_stage1_enable <= _GEN_0;	// lut_interp.k:27:9
      p0_stage2_enable <= p0_stage1_enable;	// lut_interp.k:27:9
    end
    p0_memory_read_data_in_6_0 <= memory_read_data_in_6_0_0;	// lut_interp.k:27:9
    if (rst)	// lut_interp.k:27:9
      p0_stage3_enable <= 1'h0;	// lut_interp.k:27:9
    else	// lut_interp.k:27:9
      p0_stage3_enable <= p0_stage2_enable;	// lut_interp.k:27:9
  end // always @(posedge)
  always_comb begin	// lut_interp.k:27:9
    fifo_wren_0_0 = p0_stage3_enable;	// lut_interp.k:25:5, :27:9
    fifo_data_out_0_0 = p0_memory_read_data_in_6_0;	// lut_interp.k:25:5, :27:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// lut_interp.k:27:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// lut_interp.k:27:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  lut_unitDebugView_get_entryEntry lut_unitDebugView_get_entryEntry_instance (	// lut_interp.k:25:5
    .clk       (clk),	// lut_interp.k:25:5
    ._index    (p0_stage1_enable ? p0_data_in_4 : 'x),	// lut_interp.k:25:5, :27:9
    .valid     (p0_stage1_enable),	// lut_interp.k:27:9
    .valid_out (/* unused */)
  );	// lut_interp.k:25:5
  lut_unitDebugView_get_entryExit lut_unitDebugView_get_entryExit_instance (	// lut_interp.k:25:5
    .clk          (clk),	// lut_interp.k:25:5
    ._ReturnValue (p0_stage2_enable ? memory_read_data_in_6_0_0 : 'x),	// lut_interp.k:25:5, :27:9
    .valid        (p0_stage2_enable),	// lut_interp.k:27:9
    .valid_out    (/* unused */)
  );	// lut_interp.k:25:5
  assign done_out = p0_stage3_enable;	// lut_interp.k:27:9
  assign memory_read_addr_out_6_0 = memory_read_addr_out_6_0_0;	// lut_interp.k:27:9
  assign memory_rden_out_6_0 = memory_rden_out_6_0_0;	// lut_interp.k:27:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// lut_interp.k:27:9
  assign fifo_wren_0 = fifo_wren_0_0;	// lut_interp.k:27:9
  assign input_rdy_0 = input_rdy_0_0;	// lut_interp.k:27:9
  assign control_state_out = control_state_out_0;	// lut_interp.k:27:9
endmodule

module lut_unit_set_entry_BasicBlock_0(	// lut_interp.k:18:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  output wire [15:0] memory_write_data_out_6_0,
  output wire [7:0]  memory_write_addr_out_6_0,
  output wire        memory_wren_6_0,
  output wire        fifo_wren_0,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [23:0] data_in_3,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  logic        done_out_0;	// lut_interp.k:18:9
  logic [15:0] memory_write_data_out_6_0_0;	// lut_interp.k:18:9
  logic [7:0]  memory_write_addr_out_6_0_0;	// lut_interp.k:18:9
  logic        memory_wren_6_0_0;	// lut_interp.k:18:9
  logic        fifo_wren_0_0;	// lut_interp.k:18:9
  logic        input_rdy_0_0;	// lut_interp.k:18:9
  logic [7:0]  control_state_out_0;	// lut_interp.k:18:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// lut_interp.k:18:9
  wire         _GEN_0 = _GEN & input_valid_0;	// lut_interp.k:18:9
  always_comb begin	// lut_interp.k:18:9
    input_rdy_0_0 = _GEN;	// lut_interp.k:18:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// lut_interp.k:18:9
  end // always_comb
  always_comb begin	// lut_interp.k:18:9
    memory_wren_6_0_0 = _GEN_0;	// lut_interp.k:18:9, :20:13
    memory_write_addr_out_6_0_0 = data_in_3[7:0];	// lut_interp.k:20:13
    memory_write_data_out_6_0_0 = data_in_3[23:8];	// lut_interp.k:20:13
  end // always_comb
  reg   [7:0]  p0_index;	// lut_interp.k:18:9
  reg   [15:0] p0_value;	// lut_interp.k:18:9
  reg          p0_stage1_enable = 1'h0;	// lut_interp.k:18:9
  reg          p0_stage2_enable = 1'h0;	// lut_interp.k:18:9
  always @(posedge clk) begin	// lut_interp.k:18:9
    p0_index <= data_in_3[7:0];	// lut_interp.k:18:9
    p0_value <= data_in_3[23:8];	// lut_interp.k:18:9
    if (rst) begin	// lut_interp.k:18:9
      p0_stage1_enable <= 1'h0;	// lut_interp.k:18:9
      p0_stage2_enable <= 1'h0;	// lut_interp.k:18:9
    end
    else begin	// lut_interp.k:18:9
      p0_stage1_enable <= _GEN_0;	// lut_interp.k:18:9
      p0_stage2_enable <= p0_stage1_enable;	// lut_interp.k:18:9
    end
  end // always @(posedge)
  always_comb	// lut_interp.k:18:9
    fifo_wren_0_0 = p0_stage2_enable;	// lut_interp.k:18:9, :22:9
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// lut_interp.k:18:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// lut_interp.k:18:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  lut_unitDebugView_set_entryEntry lut_unitDebugView_set_entryEntry_instance (	// lut_interp.k:22:9
    .clk       (clk),	// lut_interp.k:22:9
    ._index    (p0_stage1_enable ? p0_index : 'x),	// lut_interp.k:18:9, :22:9
    ._value    (p0_stage1_enable ? p0_value : 'x),	// lut_interp.k:18:9, :22:9
    .valid     (p0_stage1_enable),	// lut_interp.k:18:9
    .valid_out (/* unused */)
  );	// lut_interp.k:22:9
  assign done_out = p0_stage2_enable;	// lut_interp.k:18:9
  assign memory_write_data_out_6_0 = memory_write_data_out_6_0_0;	// lut_interp.k:18:9
  assign memory_write_addr_out_6_0 = memory_write_addr_out_6_0_0;	// lut_interp.k:18:9
  assign memory_wren_6_0 = memory_wren_6_0_0;	// lut_interp.k:18:9
  assign fifo_wren_0 = fifo_wren_0_0;	// lut_interp.k:18:9
  assign input_rdy_0 = input_rdy_0_0;	// lut_interp.k:18:9
  assign control_state_out = control_state_out_0;	// lut_interp.k:18:9
endmodule

module lut_unit__table__mem_container(	// lut_interp.k:12:5
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

  wire [1:0][15:0] ___table_2_data_out;	// lut_interp.k:12:5
  wire [1:0][15:0] ___table_1_data_out;	// lut_interp.k:12:5
  wire [1:0][15:0] ___table_0_data_out;	// lut_interp.k:12:5
  wire [1:0][15:0] _GEN = {{16'h0}, {write_data_in_0}};	// lut_interp.k:12:5
  wire [1:0]       _GEN_0 = {{1'h0}, {wren_in_0}};	// lut_interp.k:12:5
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
  ) __table_0 (	// lut_interp.k:12:5
    .clk            (clk),	// lut_interp.k:12:5
    .rst            (rst),
    .addr_in        ({{read_addr_in_0}, {write_addr_in_0}}),	// lut_interp.k:12:5
    .ecc_status_out (/* unused */),
    .wren_in        (_GEN_0),	// lut_interp.k:12:5
    .data_in        (_GEN),	// lut_interp.k:12:5
    .rden_in        ({{rden_in_0}, {1'h0}}),	// lut_interp.k:12:5
    .data_out       (___table_0_data_out)
  );	// lut_interp.k:12:5
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
  ) __table_1 (	// lut_interp.k:12:5
    .clk            (clk),	// lut_interp.k:12:5
    .rst            (rst),
    .addr_in        ({{read_addr_in_1}, {write_addr_in_0}}),	// lut_interp.k:12:5
    .ecc_status_out (/* unused */),
    .wren_in        (_GEN_0),	// lut_interp.k:12:5
    .data_in        (_GEN),	// lut_interp.k:12:5
    .rden_in        ({{rden_in_1}, {1'h0}}),	// lut_interp.k:12:5
    .data_out       (___table_1_data_out)
  );	// lut_interp.k:12:5
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
  ) __table_2 (	// lut_interp.k:12:5
    .clk            (clk),	// lut_interp.k:12:5
    .rst            (rst),
    .addr_in        ({{read_addr_in_2}, {write_addr_in_0}}),	// lut_interp.k:12:5
    .ecc_status_out (/* unused */),
    .wren_in        (_GEN_0),	// lut_interp.k:12:5
    .data_in        (_GEN),	// lut_interp.k:12:5
    .rden_in        ({{rden_in_2}, {1'h0}}),	// lut_interp.k:12:5
    .data_out       (___table_2_data_out)
  );	// lut_interp.k:12:5
  assign read_data_out_0 = ___table_0_data_out[1'h1];	// lut_interp.k:12:5
  assign read_data_out_1 = ___table_1_data_out[1'h1];	// lut_interp.k:12:5
  assign read_data_out_2 = ___table_2_data_out[1'h1];	// lut_interp.k:12:5
  assign init_completed = 1'h1;	// lut_interp.k:12:5
endmodule

module lut_unit(
  input  wire        clk,
  input  wire        rst,
  input  wire        set_entry_valid_in,
  input  wire [7:0]  set_entry_index_in,
  input  wire [15:0] set_entry_value_in,
  input  wire        set_entry_rden_in,
  input  wire        get_entry_valid_in,
  input  wire [7:0]  get_entry_index_in,
  input  wire        get_entry_rden_in,
  input  wire        lookup_valid_in,
  input  wire [15:0] lookup_input_in,
  input  wire        lookup_rden_in,
  input  wire [2:0]  stall_rate_in,
  input  wire        stall_rate_valid_in,
  output wire        rst_and_startup_done_out,
  output wire        set_entry_rdy_out,
  output wire        set_entry_empty_out,
  output wire        get_entry_rdy_out,
  output wire        get_entry_empty_out,
  output wire [15:0] get_entry_result_out,
  output wire        lookup_rdy_out,
  output wire        lookup_empty_out,
  output wire [15:0] lookup_result_out,
  output wire        stall_rate_supported_out
);

  wire [7:0]  _lookup_BasicBlock_0Impl_memory_read_addr_out_6_1;	// lut_interp.k:41:9
  wire        _lookup_BasicBlock_0Impl_memory_rden_out_6_1;	// lut_interp.k:41:9
  wire [7:0]  _lookup_BasicBlock_0Impl_memory_read_addr_out_6_2;	// lut_interp.k:41:9
  wire        _lookup_BasicBlock_0Impl_memory_rden_out_6_2;	// lut_interp.k:41:9
  wire [15:0] _lookup_BasicBlock_0Impl_fifo_data_out_0;	// lut_interp.k:41:9
  wire        _lookup_BasicBlock_0Impl_fifo_wren_0;	// lut_interp.k:41:9
  wire        _lookup_BasicBlock_0Impl_input_rdy_0;	// lut_interp.k:41:9
  wire [7:0]  _get_entry_BasicBlock_0Impl_memory_read_addr_out_6_0;	// lut_interp.k:27:9
  wire        _get_entry_BasicBlock_0Impl_memory_rden_out_6_0;	// lut_interp.k:27:9
  wire [15:0] _get_entry_BasicBlock_0Impl_fifo_data_out_0;	// lut_interp.k:27:9
  wire        _get_entry_BasicBlock_0Impl_fifo_wren_0;	// lut_interp.k:27:9
  wire        _get_entry_BasicBlock_0Impl_input_rdy_0;	// lut_interp.k:27:9
  wire [15:0] _set_entry_BasicBlock_0Impl_memory_write_data_out_6_0;	// lut_interp.k:18:9
  wire [7:0]  _set_entry_BasicBlock_0Impl_memory_write_addr_out_6_0;	// lut_interp.k:18:9
  wire        _set_entry_BasicBlock_0Impl_memory_wren_6_0;	// lut_interp.k:18:9
  wire        _set_entry_BasicBlock_0Impl_fifo_wren_0;	// lut_interp.k:18:9
  wire        _set_entry_BasicBlock_0Impl_input_rdy_0;	// lut_interp.k:18:9
  wire        _fifo_2_lookup_Return_overflow_out;
  wire        _fifo_2_lookup_Return_underflow_out;
  wire        _fifo_2_lookup_Return_empty;
  wire        _fifo_2_lookup_Return_full;
  wire [15:0] _fifo_2_lookup_Return_q;
  wire        _fifo_1_get_entry_Return_overflow_out;
  wire        _fifo_1_get_entry_Return_underflow_out;
  wire        _fifo_1_get_entry_Return_empty;
  wire        _fifo_1_get_entry_Return_full;
  wire [15:0] _fifo_1_get_entry_Return_q;
  wire        _fifo_0_set_entry_Return_overflow_out;
  wire        _fifo_0_set_entry_Return_underflow_out;
  wire        _fifo_0_set_entry_Return_empty;
  wire        _fifo_0_set_entry_Return_full;
  wire        _has_startup_completed_delayed_2_delay_chain_data_out;
  wire        _has_startup_completed_delayed_1_delay_chain_data_out;
  wire        _has_startup_completed_delayed_0_delay_chain_data_out;
  wire [15:0] __table_read_data_out_0;	// lut_interp.k:12:5
  wire [15:0] __table_read_data_out_1;	// lut_interp.k:12:5
  wire [15:0] __table_read_data_out_2;	// lut_interp.k:12:5
  wire        __table_init_completed;	// lut_interp.k:12:5
  wire        _reset_control_rst_and_startup_done_out;
  wire [5:0]  _reset_control_rst_delayed_out;
  wire        _reset_control_reset_sequence_finished_this_cycle_out;
  logic  stall_rate_supported_out_net;
  logic  lookup_empty_out_net;
  logic [15:0] lookup_result_out_net;
  logic  lookup_rdy_out_net;
  logic  get_entry_empty_out_net;
  logic [15:0] get_entry_result_out_net;
  logic  get_entry_rdy_out_net;
  logic  set_entry_empty_out_net;
  logic  set_entry_rdy_out_net;
  logic  rst_and_startup_done_out_net;

  logic [31:0] dropped_commands;
  //synopsys translate_off
  KanagawaStringTable string_table(.clk(clk));
  //synopsys translate_on
  logic [5:0] reg_rst_delayed;
  logic combined_reset;
  assign combined_reset = rst;
  logic reset_sequence_finished_this_cycle;
  logic has_startup_completed_raw;
  logic has_mem_init_completed;
  wire        _GEN = has_startup_completed_raw & __table_init_completed;	// lut_interp.k:12:5
  logic has_others_completed;
  assign has_others_completed = _GEN;

  logic rst_and_startup_done_raw;

  logic [0:0] rst_array;
  assign rst_array[0] = combined_reset;

  logic has_startup_completed_delayed_0;

  logic has_startup_completed_delayed_1;

  logic has_startup_completed_delayed_2;

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
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [23:0] data;
      logic underflow;
  } passthrough_data_3;
  assign passthrough_data_3.underflow = 1'b0;
  assign passthrough_data_3.rdy_ext = passthrough_data_3.rdy_int & !(!has_startup_completed_delayed_0);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [7:0] data;
      logic underflow;
  } passthrough_data_4;
  assign passthrough_data_4.underflow = 1'b0;
  assign passthrough_data_4.rdy_ext = passthrough_data_4.rdy_int & !(!has_startup_completed_delayed_1);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [15:0] data;
      logic underflow;
  } passthrough_data_5;
  assign passthrough_data_5.underflow = 1'b0;
  assign passthrough_data_5.rdy_ext = passthrough_data_5.rdy_int & !(!has_startup_completed_delayed_2);
  assign set_entry_rdy_out_net = passthrough_data_3.rdy_ext;
  assign passthrough_data_3.valid = set_entry_rdy_out & set_entry_valid_in;
  assign passthrough_data_3.data = { set_entry_value_in, set_entry_index_in };
  assign fifo_data_0.rden = set_entry_rden_in;
  assign set_entry_empty_out_net = fifo_data_0.empty;
  assign get_entry_rdy_out_net = passthrough_data_4.rdy_ext;
  assign passthrough_data_4.valid = get_entry_rdy_out & get_entry_valid_in;
  assign passthrough_data_4.data = { get_entry_index_in };
  assign fifo_data_1.rden = get_entry_rden_in;
  assign get_entry_result_out_net = fifo_data_1.data_out;
  assign get_entry_empty_out_net = fifo_data_1.empty;
  assign lookup_rdy_out_net = passthrough_data_5.rdy_ext;
  assign passthrough_data_5.valid = lookup_rdy_out & lookup_valid_in;
  assign passthrough_data_5.data = { lookup_input_in };
  assign fifo_data_2.rden = lookup_rden_in;
  assign lookup_result_out_net = fifo_data_2.data_out;
  assign lookup_empty_out_net = fifo_data_2.empty;
  always_comb begin
    rst_and_startup_done_out_net = _reset_control_rst_and_startup_done_out;
    reg_rst_delayed = _reset_control_rst_delayed_out;
    reset_sequence_finished_this_cycle = _reset_control_reset_sequence_finished_this_cycle_out;
    has_startup_completed_delayed_0 = _has_startup_completed_delayed_0_delay_chain_data_out;
    has_startup_completed_delayed_1 = _has_startup_completed_delayed_1_delay_chain_data_out;
    has_startup_completed_delayed_2 = _has_startup_completed_delayed_2_delay_chain_data_out;
    fifo_data_0.overflow = _fifo_0_set_entry_Return_overflow_out;
    fifo_data_0.underflow = _fifo_0_set_entry_Return_underflow_out;
    fifo_data_0.empty = _fifo_0_set_entry_Return_empty;
    fifo_data_0.almost_full = _fifo_0_set_entry_Return_full;
    fifo_data_1.overflow = _fifo_1_get_entry_Return_overflow_out;
    fifo_data_1.underflow = _fifo_1_get_entry_Return_underflow_out;
    fifo_data_1.empty = _fifo_1_get_entry_Return_empty;
    fifo_data_1.almost_full = _fifo_1_get_entry_Return_full;
    fifo_data_1.data_out = _fifo_1_get_entry_Return_q;
    fifo_data_2.overflow = _fifo_2_lookup_Return_overflow_out;
    fifo_data_2.underflow = _fifo_2_lookup_Return_underflow_out;
    fifo_data_2.empty = _fifo_2_lookup_Return_empty;
    fifo_data_2.almost_full = _fifo_2_lookup_Return_full;
    fifo_data_2.data_out = _fifo_2_lookup_Return_q;
    fifo_data_0.wren = _set_entry_BasicBlock_0Impl_fifo_wren_0;	// lut_interp.k:18:9
    passthrough_data_3.rdy_int = _set_entry_BasicBlock_0Impl_input_rdy_0;	// lut_interp.k:18:9
    fifo_data_1.data_in = _get_entry_BasicBlock_0Impl_fifo_data_out_0;	// lut_interp.k:27:9
    fifo_data_1.wren = _get_entry_BasicBlock_0Impl_fifo_wren_0;	// lut_interp.k:27:9
    passthrough_data_4.rdy_int = _get_entry_BasicBlock_0Impl_input_rdy_0;	// lut_interp.k:27:9
    fifo_data_2.data_in = _lookup_BasicBlock_0Impl_fifo_data_out_0;	// lut_interp.k:41:9
    fifo_data_2.wren = _lookup_BasicBlock_0Impl_fifo_wren_0;	// lut_interp.k:41:9
    passthrough_data_5.rdy_int = _lookup_BasicBlock_0Impl_input_rdy_0;	// lut_interp.k:41:9
  end // always_comb

  assign has_startup_completed_raw = 1'b1;
  assign stall_rate_supported_out_net = 1'b0;
  KanagawaResetControl #(
    .WIDTH(6),
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
  lut_unit__table__mem_container _table (	// lut_interp.k:12:5
    .clk             (clk),	// lut_interp.k:12:5
    .rst             (1'b0),	// lut_interp.k:12:5
    .rden_in_0       (_get_entry_BasicBlock_0Impl_memory_rden_out_6_0),	// lut_interp.k:27:9
    .read_addr_in_0  (_get_entry_BasicBlock_0Impl_memory_read_addr_out_6_0),	// lut_interp.k:27:9
    .rden_in_1       (_lookup_BasicBlock_0Impl_memory_rden_out_6_1),	// lut_interp.k:41:9
    .read_addr_in_1  (_lookup_BasicBlock_0Impl_memory_read_addr_out_6_1),	// lut_interp.k:41:9
    .rden_in_2       (_lookup_BasicBlock_0Impl_memory_rden_out_6_2),	// lut_interp.k:41:9
    .read_addr_in_2  (_lookup_BasicBlock_0Impl_memory_read_addr_out_6_2),	// lut_interp.k:41:9
    .wren_in_0       (_set_entry_BasicBlock_0Impl_memory_wren_6_0),	// lut_interp.k:18:9
    .write_addr_in_0 (_set_entry_BasicBlock_0Impl_memory_write_addr_out_6_0),	// lut_interp.k:18:9
    .write_data_in_0 (_set_entry_BasicBlock_0Impl_memory_write_data_out_6_0),	// lut_interp.k:18:9
    .read_data_out_0 (__table_read_data_out_0),
    .read_data_out_1 (__table_read_data_out_1),
    .read_data_out_2 (__table_read_data_out_2),
    .init_completed  (__table_init_completed)
  );	// lut_interp.k:12:5
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
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(0),
    .PORT_WIDTH(1),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_0_set_entry_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(0)
  ) fifo_0_set_entry_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[0]),
    .overflow_out  (_fifo_0_set_entry_Return_overflow_out),
    .underflow_out (_fifo_0_set_entry_Return_underflow_out),
    .empty         (_fifo_0_set_entry_Return_empty),
    .rdreq         (fifo_data_0.rden),
    .full          (_fifo_0_set_entry_Return_full),
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
    .AUTO_PIPELINE_GROUP("fifo_1_get_entry_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(4),
    .USE_LUTRAM(1)
  ) fifo_1_get_entry_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[1]),
    .overflow_out  (_fifo_1_get_entry_Return_overflow_out),
    .underflow_out (_fifo_1_get_entry_Return_underflow_out),
    .empty         (_fifo_1_get_entry_Return_empty),
    .rdreq         (fifo_data_1.rden),
    .full          (_fifo_1_get_entry_Return_full),
    .wrreq         (fifo_data_1.wren),
    .data          (fifo_data_1.data_in),
    .q             (_fifo_1_get_entry_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(16),
    .PORT_WIDTH(16),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_2_lookup_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(5),
    .USE_LUTRAM(1)
  ) fifo_2_lookup_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[2]),
    .overflow_out  (_fifo_2_lookup_Return_overflow_out),
    .underflow_out (_fifo_2_lookup_Return_underflow_out),
    .empty         (_fifo_2_lookup_Return_empty),
    .rdreq         (fifo_data_2.rden),
    .full          (_fifo_2_lookup_Return_full),
    .wrreq         (fifo_data_2.wren),
    .data          (fifo_data_2.data_in),
    .q             (_fifo_2_lookup_Return_q)
  );
  lut_unit_set_entry_BasicBlock_0 set_entry_BasicBlock_0Impl (	// lut_interp.k:18:9
    .clk                       (clk),	// lut_interp.k:18:9
    .rst                       (reg_rst_delayed[3]),	// lut_interp.k:18:9
    .done_out                  (/* unused */),
    .memory_write_data_out_6_0 (_set_entry_BasicBlock_0Impl_memory_write_data_out_6_0),
    .memory_write_addr_out_6_0 (_set_entry_BasicBlock_0Impl_memory_write_addr_out_6_0),
    .memory_wren_6_0           (_set_entry_BasicBlock_0Impl_memory_wren_6_0),
    .fifo_wren_0               (_set_entry_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_0.almost_full),	// lut_interp.k:18:9
    .fifo_overflow_in_0        (fifo_data_0.overflow),	// lut_interp.k:18:9
    .data_in_3                 (passthrough_data_3.data),	// lut_interp.k:18:9
    .input_fifo_underflow_0    (passthrough_data_3.underflow),	// lut_interp.k:18:9
    .input_rdy_0               (_set_entry_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_3.valid),	// lut_interp.k:18:9
    .control_state_out         (/* unused */)
  );	// lut_interp.k:18:9
  lut_unit_get_entry_BasicBlock_0 get_entry_BasicBlock_0Impl (	// lut_interp.k:27:9
    .clk                       (clk),	// lut_interp.k:27:9
    .rst                       (reg_rst_delayed[4]),	// lut_interp.k:27:9
    .done_out                  (/* unused */),
    .memory_read_data_in_6_0   (__table_read_data_out_0),	// lut_interp.k:12:5
    .memory_read_addr_out_6_0  (_get_entry_BasicBlock_0Impl_memory_read_addr_out_6_0),
    .memory_rden_out_6_0       (_get_entry_BasicBlock_0Impl_memory_rden_out_6_0),
    .fifo_data_out_0           (_get_entry_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0               (_get_entry_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_1.almost_full),	// lut_interp.k:27:9
    .fifo_overflow_in_0        (fifo_data_1.overflow),	// lut_interp.k:27:9
    .data_in_4                 (passthrough_data_4.data),	// lut_interp.k:27:9
    .input_fifo_underflow_0    (passthrough_data_4.underflow),	// lut_interp.k:27:9
    .input_rdy_0               (_get_entry_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_4.valid),	// lut_interp.k:27:9
    .control_state_out         (/* unused */)
  );	// lut_interp.k:27:9
  lut_unit_lookup_BasicBlock_0 lookup_BasicBlock_0Impl (	// lut_interp.k:41:9
    .clk                       (clk),	// lut_interp.k:41:9
    .rst                       (reg_rst_delayed[5]),	// lut_interp.k:41:9
    .done_out                  (/* unused */),
    .memory_read_data_in_6_1   (__table_read_data_out_1),	// lut_interp.k:12:5
    .memory_read_addr_out_6_1  (_lookup_BasicBlock_0Impl_memory_read_addr_out_6_1),
    .memory_rden_out_6_1       (_lookup_BasicBlock_0Impl_memory_rden_out_6_1),
    .memory_read_data_in_6_2   (__table_read_data_out_2),	// lut_interp.k:12:5
    .memory_read_addr_out_6_2  (_lookup_BasicBlock_0Impl_memory_read_addr_out_6_2),
    .memory_rden_out_6_2       (_lookup_BasicBlock_0Impl_memory_rden_out_6_2),
    .fifo_data_out_0           (_lookup_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0               (_lookup_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_2.almost_full),	// lut_interp.k:41:9
    .fifo_overflow_in_0        (fifo_data_2.overflow),	// lut_interp.k:41:9
    .data_in_5                 (passthrough_data_5.data),	// lut_interp.k:41:9
    .input_fifo_underflow_0    (passthrough_data_5.underflow),	// lut_interp.k:41:9
    .input_rdy_0               (_lookup_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_5.valid),	// lut_interp.k:41:9
    .control_state_out         (/* unused */)
  );	// lut_interp.k:41:9
  assign rst_and_startup_done_out = rst_and_startup_done_out_net;
  assign set_entry_rdy_out = set_entry_rdy_out_net;
  assign set_entry_empty_out = set_entry_empty_out_net;
  assign get_entry_rdy_out = get_entry_rdy_out_net;
  assign get_entry_empty_out = get_entry_empty_out_net;
  assign get_entry_result_out = get_entry_result_out_net;
  assign lookup_rdy_out = lookup_rdy_out_net;
  assign lookup_empty_out = lookup_empty_out_net;
  assign lookup_result_out = lookup_result_out_net;
  assign stall_rate_supported_out = stall_rate_supported_out_net;
endmodule

module lut_unit_EsiWrapper(
     input  wire                                                         clk,
     input  wire                                                         rst,
     input  wire [2:0]                                                   stall_rate_in,
     input  wire                                                         stall_rate_valid_in,
     input  wire struct packed {logic [7:0] index; }                     get_entry_arg,
     input  wire                                                         get_entry_arg_valid,
     input  wire struct packed {logic [15:0] input_0; }                  lookup_arg,
     input  wire                                                         lookup_arg_valid,
     input  wire struct packed {logic [7:0] index; logic [15:0] value; } set_entry_arg,
     input  wire                                                         set_entry_arg_valid,
     input  wire                                                         get_entry_result_rden,
     input  wire                                                         lookup_result_rden,
     input  wire                                                         set_entry_result_rden,
     output wire                                                         get_entry_arg_ready,
     output wire                                                         lookup_arg_ready,
     output wire                                                         set_entry_arg_ready,
     output wire [15:0]                                                  get_entry_result,
     output wire                                                         get_entry_result_empty,
     output wire [15:0]                                                  lookup_result,
     output wire                                                         lookup_result_empty,
  // output wire /*Zero Width*/                                          set_entry_result,
     output wire                                                         set_entry_result_empty,
     output wire                                                         rst_and_startup_done_out,
     output wire                                                         stall_rate_supported_out
);

  wire [15:0] _EsiWrapped_get_entry_result_out;
  wire [15:0] _EsiWrapped_lookup_result_out;
  lut_unit EsiWrapped (
    .clk                      (clk),
    .rst                      (rst),
    .set_entry_valid_in       (set_entry_arg_valid),
    .set_entry_index_in       (set_entry_arg.index),
    .set_entry_value_in       (set_entry_arg.value),
    .set_entry_rden_in        (set_entry_result_rden),
    .get_entry_valid_in       (get_entry_arg_valid),
    .get_entry_index_in       (get_entry_arg.index),
    .get_entry_rden_in        (get_entry_result_rden),
    .lookup_valid_in          (lookup_arg_valid),
    .lookup_input_in          (lookup_arg.input_0),
    .lookup_rden_in           (lookup_result_rden),
    .stall_rate_in            (stall_rate_in),
    .stall_rate_valid_in      (stall_rate_valid_in),
    .rst_and_startup_done_out (rst_and_startup_done_out),
    .set_entry_rdy_out        (set_entry_arg_ready),
    .set_entry_empty_out      (set_entry_result_empty),
    .get_entry_rdy_out        (get_entry_arg_ready),
    .get_entry_empty_out      (get_entry_result_empty),
    .get_entry_result_out     (_EsiWrapped_get_entry_result_out),
    .lookup_rdy_out           (lookup_arg_ready),
    .lookup_empty_out         (lookup_result_empty),
    .lookup_result_out        (_EsiWrapped_lookup_result_out),
    .stall_rate_supported_out (stall_rate_supported_out)
  );
  assign get_entry_result = _EsiWrapped_get_entry_result_out;
  assign lookup_result = _EsiWrapped_lookup_result_out;
  // Zero width: assign set_entry_result = /*Zero width*/;
endmodule

