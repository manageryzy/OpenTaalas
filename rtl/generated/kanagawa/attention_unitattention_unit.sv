
// This file was generated. Do not modify.
// kanagawa --backend=sv --import-dir=/home/mana/workspace/OpenTaalas/third-party/kanagawa/library --base-library=/home/mana/workspace/OpenTaalas/third-party/kanagawa/library/mini-base.k --output=/home/mana/workspace/OpenTaalas/rtl/generated/kanagawa/attention_unit /home/mana/workspace/OpenTaalas/rtl/kanagawa/attention_unit.k

`default_nettype wire
module attention_unitDebugView_dot_productEntry
(
    input wire clk,
    input wire[7:0]  _q_elem,
    input wire[7:0]  _k_elem,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("dot_productEntry time: %0t q_elem: %p k_elem: %p", $time, _q_elem, _k_elem);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module attention_unitDebugView_dot_productExit
(
    input wire clk,
    input wire[31:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("dot_productExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module attention_unitDebugView_read_scoreExit
(
    input wire clk,
    input wire[31:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("read_scoreExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module attention_unitDebugView_set_max_scoreEntry
(
    input wire clk,
    input wire[31:0]  _score,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("set_max_scoreEntry time: %0t score: %p", $time, _score);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module attention_unitDebugView_get_max_scoreExit
(
    input wire clk,
    input wire[31:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("get_max_scoreExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
`ifndef _TYPESCOPE_CoreModuleTypeScope
`define _TYPESCOPE_CoreModuleTypeScope
`endif // _TYPESCOPE_CoreModuleTypeScope
module attention_unit_get_max_score_BasicBlock_0(	// attention_unit.k:97:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  input  wire [31:0] global_in__max_score_7,
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
  wire  [31:0] global_in__max_score_7_0 = global_in__max_score_7;	// attention_unit.k:97:9
  logic        done_out_0;	// attention_unit.k:97:9
  logic [31:0] fifo_data_out_0_0;	// attention_unit.k:97:9
  logic        fifo_wren_0_0;	// attention_unit.k:97:9
  logic        input_rdy_0_0;	// attention_unit.k:97:9
  logic [7:0]  control_state_out_0;	// attention_unit.k:97:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// attention_unit.k:97:9
  always_comb begin	// attention_unit.k:97:9
    input_rdy_0_0 = _GEN;	// attention_unit.k:97:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// attention_unit.k:97:9
  end // always_comb
  reg          p0_stage1_enable = 1'h0;	// attention_unit.k:97:9
  reg   [31:0] p0_global_in__max_score_7;	// attention_unit.k:97:9
  reg          p0_stage2_enable = 1'h0;	// attention_unit.k:97:9
  always @(posedge clk) begin	// attention_unit.k:97:9
    if (rst)	// attention_unit.k:97:9
      p0_stage1_enable <= 1'h0;	// attention_unit.k:97:9
    else	// attention_unit.k:97:9
      p0_stage1_enable <= _GEN & input_valid_0;	// attention_unit.k:97:9
    p0_global_in__max_score_7 <= global_in__max_score_7_0;	// attention_unit.k:97:9
    if (rst)	// attention_unit.k:97:9
      p0_stage2_enable <= 1'h0;	// attention_unit.k:97:9
    else	// attention_unit.k:97:9
      p0_stage2_enable <= p0_stage1_enable;	// attention_unit.k:97:9
  end // always @(posedge)
  always_comb begin	// attention_unit.k:97:9
    fifo_wren_0_0 = p0_stage2_enable;	// attention_unit.k:95:5, :97:9
    fifo_data_out_0_0 = p0_global_in__max_score_7;	// attention_unit.k:95:5, :97:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// attention_unit.k:97:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// attention_unit.k:97:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  attention_unitDebugView_get_max_scoreExit attention_unitDebugView_get_max_scoreExit_instance (	// attention_unit.k:95:5
    .clk          (clk),	// attention_unit.k:95:5
    ._ReturnValue (p0_stage1_enable ? global_in__max_score_7_0 : 'x),	// attention_unit.k:95:5, :97:9
    .valid        (p0_stage1_enable),	// attention_unit.k:97:9
    .valid_out    (/* unused */)
  );	// attention_unit.k:95:5
  assign done_out = p0_stage2_enable;	// attention_unit.k:97:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// attention_unit.k:97:9
  assign fifo_wren_0 = fifo_wren_0_0;	// attention_unit.k:97:9
  assign input_rdy_0 = input_rdy_0_0;	// attention_unit.k:97:9
  assign control_state_out = control_state_out_0;	// attention_unit.k:97:9
endmodule

module attention_unit_set_max_score_BasicBlock_0(	// attention_unit.k:88:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  output wire        global_out__max_score_7_0_valid,
  output wire [31:0] global_out__max_score_7_0,
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
  logic        done_out_0;	// attention_unit.k:88:9
  logic        global_out__max_score_7_0_valid_0;	// attention_unit.k:88:9
  logic [31:0] global_out__max_score_7_0_0;	// attention_unit.k:88:9
  logic        fifo_wren_0_0;	// attention_unit.k:88:9
  logic        input_rdy_0_0;	// attention_unit.k:88:9
  logic [7:0]  control_state_out_0;	// attention_unit.k:88:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// attention_unit.k:88:9
  always_comb begin	// attention_unit.k:88:9
    input_rdy_0_0 = _GEN;	// attention_unit.k:88:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// attention_unit.k:88:9
  end // always_comb
  reg   [31:0] p0_data_in_8;	// attention_unit.k:88:9
  reg          p0_stage1_enable = 1'h0;	// attention_unit.k:88:9
  always_comb begin	// attention_unit.k:88:9
    global_out__max_score_7_0_0 = p0_data_in_8;	// attention_unit.k:88:9
    global_out__max_score_7_0_valid_0 = p0_stage1_enable;	// attention_unit.k:88:9
  end // always_comb
  reg          p0_stage2_enable = 1'h0;	// attention_unit.k:88:9
  always @(posedge clk) begin	// attention_unit.k:88:9
    p0_data_in_8 <= data_in_8;	// attention_unit.k:88:9
    if (rst) begin	// attention_unit.k:88:9
      p0_stage1_enable <= 1'h0;	// attention_unit.k:88:9
      p0_stage2_enable <= 1'h0;	// attention_unit.k:88:9
    end
    else begin	// attention_unit.k:88:9
      p0_stage1_enable <= _GEN & input_valid_0;	// attention_unit.k:88:9
      p0_stage2_enable <= p0_stage1_enable;	// attention_unit.k:88:9
    end
  end // always @(posedge)
  always_comb	// attention_unit.k:88:9
    fifo_wren_0_0 = p0_stage2_enable;	// attention_unit.k:88:9, :92:9
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// attention_unit.k:88:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// attention_unit.k:88:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  attention_unitDebugView_set_max_scoreEntry attention_unitDebugView_set_max_scoreEntry_instance (	// attention_unit.k:92:9
    .clk       (clk),	// attention_unit.k:92:9
    ._score    (p0_stage1_enable ? p0_data_in_8 : 'x),	// attention_unit.k:88:9, :92:9
    .valid     (p0_stage1_enable),	// attention_unit.k:88:9
    .valid_out (/* unused */)
  );	// attention_unit.k:92:9
  assign done_out = p0_stage2_enable;	// attention_unit.k:88:9
  assign global_out__max_score_7_0_valid = global_out__max_score_7_0_valid_0;	// attention_unit.k:88:9
  assign global_out__max_score_7_0 = global_out__max_score_7_0_0;	// attention_unit.k:88:9
  assign fifo_wren_0 = fifo_wren_0_0;	// attention_unit.k:88:9
  assign input_rdy_0 = input_rdy_0_0;	// attention_unit.k:88:9
  assign control_state_out = control_state_out_0;	// attention_unit.k:88:9
endmodule

module attention_unit_clear_score_BasicBlock_0(	// attention_unit.k:79:9
  input  wire       clk,
  input  wire       rst,
  output wire       done_out,
  output wire       global_out__score_accum_6_1_valid,
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
  logic       done_out_0;	// attention_unit.k:79:9
  logic       global_out__score_accum_6_1_valid_0;	// attention_unit.k:79:9
  logic       fifo_wren_0_0;	// attention_unit.k:79:9
  logic       input_rdy_0_0;	// attention_unit.k:79:9
  logic [7:0] control_state_out_0;	// attention_unit.k:79:9
  wire        _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// attention_unit.k:79:9
  always_comb begin	// attention_unit.k:79:9
    input_rdy_0_0 = _GEN;	// attention_unit.k:79:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// attention_unit.k:79:9
  end // always_comb
  reg         p0_stage1_enable = 1'h0;	// attention_unit.k:79:9
  always_comb	// attention_unit.k:79:9
    global_out__score_accum_6_1_valid_0 = p0_stage1_enable;	// attention_unit.k:79:9
  reg         p0_stage2_enable = 1'h0;	// attention_unit.k:79:9
  always @(posedge clk) begin	// attention_unit.k:79:9
    if (rst) begin	// attention_unit.k:79:9
      p0_stage1_enable <= 1'h0;	// attention_unit.k:79:9
      p0_stage2_enable <= 1'h0;	// attention_unit.k:79:9
    end
    else begin	// attention_unit.k:79:9
      p0_stage1_enable <= _GEN & input_valid_0;	// attention_unit.k:79:9
      p0_stage2_enable <= p0_stage1_enable;	// attention_unit.k:79:9
    end
  end // always @(posedge)
  always_comb	// attention_unit.k:79:9
    fifo_wren_0_0 = p0_stage2_enable;	// attention_unit.k:79:9, :83:9
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// attention_unit.k:79:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// attention_unit.k:79:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  assign done_out = p0_stage2_enable;	// attention_unit.k:79:9
  assign global_out__score_accum_6_1_valid = global_out__score_accum_6_1_valid_0;	// attention_unit.k:79:9
  assign fifo_wren_0 = fifo_wren_0_0;	// attention_unit.k:79:9
  assign input_rdy_0 = input_rdy_0_0;	// attention_unit.k:79:9
  assign control_state_out = control_state_out_0;	// attention_unit.k:79:9
endmodule

module attention_unit_read_score_BasicBlock_0(	// attention_unit.k:73:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  input  wire [31:0] global_in__score_accum_6,
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
  wire  [31:0] global_in__score_accum_6_0 = global_in__score_accum_6;	// attention_unit.k:73:9
  logic        done_out_0;	// attention_unit.k:73:9
  logic [31:0] fifo_data_out_0_0;	// attention_unit.k:73:9
  logic        fifo_wren_0_0;	// attention_unit.k:73:9
  logic        input_rdy_0_0;	// attention_unit.k:73:9
  logic [7:0]  control_state_out_0;	// attention_unit.k:73:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// attention_unit.k:73:9
  always_comb begin	// attention_unit.k:73:9
    input_rdy_0_0 = _GEN;	// attention_unit.k:73:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// attention_unit.k:73:9
  end // always_comb
  reg          p0_stage1_enable = 1'h0;	// attention_unit.k:73:9
  reg   [31:0] p0_global_in__score_accum_6;	// attention_unit.k:73:9
  reg          p0_stage2_enable = 1'h0;	// attention_unit.k:73:9
  always @(posedge clk) begin	// attention_unit.k:73:9
    if (rst)	// attention_unit.k:73:9
      p0_stage1_enable <= 1'h0;	// attention_unit.k:73:9
    else	// attention_unit.k:73:9
      p0_stage1_enable <= _GEN & input_valid_0;	// attention_unit.k:73:9
    p0_global_in__score_accum_6 <= global_in__score_accum_6_0;	// attention_unit.k:73:9
    if (rst)	// attention_unit.k:73:9
      p0_stage2_enable <= 1'h0;	// attention_unit.k:73:9
    else	// attention_unit.k:73:9
      p0_stage2_enable <= p0_stage1_enable;	// attention_unit.k:73:9
  end // always @(posedge)
  always_comb begin	// attention_unit.k:73:9
    fifo_wren_0_0 = p0_stage2_enable;	// attention_unit.k:71:5, :73:9
    fifo_data_out_0_0 = p0_global_in__score_accum_6;	// attention_unit.k:71:5, :73:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// attention_unit.k:73:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// attention_unit.k:73:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  attention_unitDebugView_read_scoreExit attention_unitDebugView_read_scoreExit_instance (	// attention_unit.k:71:5
    .clk          (clk),	// attention_unit.k:71:5
    ._ReturnValue (p0_stage1_enable ? global_in__score_accum_6_0 : 'x),	// attention_unit.k:71:5, :73:9
    .valid        (p0_stage1_enable),	// attention_unit.k:73:9
    .valid_out    (/* unused */)
  );	// attention_unit.k:71:5
  assign done_out = p0_stage2_enable;	// attention_unit.k:73:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// attention_unit.k:73:9
  assign fifo_wren_0 = fifo_wren_0_0;	// attention_unit.k:73:9
  assign input_rdy_0 = input_rdy_0_0;	// attention_unit.k:73:9
  assign control_state_out = control_state_out_0;	// attention_unit.k:73:9
endmodule

module attention_unit_dot_product_BasicBlock_0(	// attention_unit.k:20:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  input  wire [31:0] global_in__score_accum_6,
  output wire        global_out__score_accum_6_0_valid,
  output wire [31:0] global_out__score_accum_6_0,
  output wire [31:0] fifo_data_out_0,
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
  wire  [31:0] global_in__score_accum_6_0 = global_in__score_accum_6;	// attention_unit.k:20:9
  logic        done_out_0;	// attention_unit.k:20:9
  logic        global_out__score_accum_6_0_valid_0;	// attention_unit.k:20:9
  logic [31:0] global_out__score_accum_6_0_0;	// attention_unit.k:20:9
  logic [31:0] fifo_data_out_0_0;	// attention_unit.k:20:9
  logic        fifo_wren_0_0;	// attention_unit.k:20:9
  logic        input_rdy_0_0;	// attention_unit.k:20:9
  logic [7:0]  control_state_out_0;	// attention_unit.k:20:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// attention_unit.k:20:9
  always_comb begin	// attention_unit.k:20:9
    input_rdy_0_0 = _GEN;	// attention_unit.k:20:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// attention_unit.k:20:9
  end // always_comb
  reg   [7:0]  p0_q_elem;	// attention_unit.k:20:9
  reg   [7:0]  p0_k_elem;	// attention_unit.k:20:9
  reg          p0_stage1_enable = 1'h0;	// attention_unit.k:20:9
  wire         product = p0_q_elem[7] & p0_k_elem[0];	// attention_unit.k:20:9, :24:23, :29:{13,17}
  wire         product_0 = p0_q_elem[7] & p0_k_elem[0];	// attention_unit.k:20:9, :29:{13,17}
  wire         product_1 = p0_q_elem[6] & p0_k_elem[0];	// attention_unit.k:20:9, :29:{13,17}
  wire         product_2 = p0_q_elem[5] & p0_k_elem[0];	// attention_unit.k:20:9, :29:{13,17}
  wire         product_3 = p0_q_elem[4] & p0_k_elem[0];	// attention_unit.k:20:9, :29:{13,17}
  wire         product_4 = p0_q_elem[3] & p0_k_elem[0];	// attention_unit.k:20:9, :29:{13,17}
  wire         product_5 = p0_q_elem[2] & p0_k_elem[0];	// attention_unit.k:20:9, :29:{13,17}
  wire         product_6 = p0_q_elem[1] & p0_k_elem[0];	// attention_unit.k:20:9, :29:{13,17}
  wire         product_7 = p0_q_elem[0] & p0_k_elem[0];	// attention_unit.k:20:9, :29:{13,17}
  wire  [31:0] _product_plus_q_shl_1_ =
    32'({{24{product}},
         product_0,
         product_1,
         product_2,
         product_3,
         product_4,
         product_5,
         product_6,
         product_7} + {{23{p0_q_elem[7]}}, p0_q_elem, 1'h0});	// attention_unit.k:20:9, :24:23, :29:{13,17}, :35:{27,37}
  wire         _GEN_0 = product | p0_k_elem[1];	// attention_unit.k:20:9, :29:{13,17}, :33:{13,17}
  wire         _GEN_1 = product & ~(p0_k_elem[1]);	// attention_unit.k:20:9, :29:{13,17}, :33:{13,17}
  wire         product_8 = _product_plus_q_shl_1_[31] ? _GEN_0 : _GEN_1;	// attention_unit.k:33:{13,17}, :35:27
  wire         product_9 = _product_plus_q_shl_1_[30] ? _GEN_0 : _GEN_1;	// attention_unit.k:33:{13,17}, :35:27
  wire         product_10 = _product_plus_q_shl_1_[29] ? _GEN_0 : _GEN_1;	// attention_unit.k:33:{13,17}, :35:27
  wire         product_11 = _product_plus_q_shl_1_[28] ? _GEN_0 : _GEN_1;	// attention_unit.k:33:{13,17}, :35:27
  wire         product_12 = _product_plus_q_shl_1_[27] ? _GEN_0 : _GEN_1;	// attention_unit.k:33:{13,17}, :35:27
  wire         product_13 = _product_plus_q_shl_1_[26] ? _GEN_0 : _GEN_1;	// attention_unit.k:33:{13,17}, :35:27
  wire         product_14 = _product_plus_q_shl_1_[25] ? _GEN_0 : _GEN_1;	// attention_unit.k:33:{13,17}, :35:27
  wire         product_15 = _product_plus_q_shl_1_[24] ? _GEN_0 : _GEN_1;	// attention_unit.k:33:{13,17}, :35:27
  wire         product_16 = _product_plus_q_shl_1_[23] ? _GEN_0 : _GEN_1;	// attention_unit.k:33:{13,17}, :35:27
  wire         product_17 = _product_plus_q_shl_1_[22] ? _GEN_0 : _GEN_1;	// attention_unit.k:33:{13,17}, :35:27
  wire         product_18 = _product_plus_q_shl_1_[21] ? _GEN_0 : _GEN_1;	// attention_unit.k:33:{13,17}, :35:27
  wire         product_19 = _product_plus_q_shl_1_[20] ? _GEN_0 : _GEN_1;	// attention_unit.k:33:{13,17}, :35:27
  wire         product_20 = _product_plus_q_shl_1_[19] ? _GEN_0 : _GEN_1;	// attention_unit.k:33:{13,17}, :35:27
  wire         product_21 = _product_plus_q_shl_1_[18] ? _GEN_0 : _GEN_1;	// attention_unit.k:33:{13,17}, :35:27
  wire         product_22 = _product_plus_q_shl_1_[17] ? _GEN_0 : _GEN_1;	// attention_unit.k:33:{13,17}, :35:27
  wire         product_23 = _product_plus_q_shl_1_[16] ? _GEN_0 : _GEN_1;	// attention_unit.k:33:{13,17}, :35:27
  wire         product_24 = _product_plus_q_shl_1_[15] ? _GEN_0 : _GEN_1;	// attention_unit.k:33:{13,17}, :35:27
  wire         product_25 = _product_plus_q_shl_1_[14] ? _GEN_0 : _GEN_1;	// attention_unit.k:33:{13,17}, :35:27
  wire         product_26 = _product_plus_q_shl_1_[13] ? _GEN_0 : _GEN_1;	// attention_unit.k:33:{13,17}, :35:27
  wire         product_27 = _product_plus_q_shl_1_[12] ? _GEN_0 : _GEN_1;	// attention_unit.k:33:{13,17}, :35:27
  wire         product_28 = _product_plus_q_shl_1_[11] ? _GEN_0 : _GEN_1;	// attention_unit.k:33:{13,17}, :35:27
  wire         product_29 = _product_plus_q_shl_1_[10] ? _GEN_0 : _GEN_1;	// attention_unit.k:33:{13,17}, :35:27
  wire         product_30 = _product_plus_q_shl_1_[9] ? _GEN_0 : _GEN_1;	// attention_unit.k:33:{13,17}, :35:27
  wire         product_31 = _product_plus_q_shl_1_[8] ? _GEN_0 : _GEN_1;	// attention_unit.k:33:{13,17}, :35:27
  wire         product_32 =
    _product_plus_q_shl_1_[7] ? product_0 | p0_k_elem[1] : product_0 & ~(p0_k_elem[1]);	// attention_unit.k:20:9, :29:{13,17}, :33:{13,17}, :35:27
  wire         product_33 =
    _product_plus_q_shl_1_[6] ? product_1 | p0_k_elem[1] : product_1 & ~(p0_k_elem[1]);	// attention_unit.k:20:9, :29:{13,17}, :33:{13,17}, :35:27
  wire         product_34 =
    _product_plus_q_shl_1_[5] ? product_2 | p0_k_elem[1] : product_2 & ~(p0_k_elem[1]);	// attention_unit.k:20:9, :29:{13,17}, :33:{13,17}, :35:27
  wire         product_35 =
    _product_plus_q_shl_1_[4] ? product_3 | p0_k_elem[1] : product_3 & ~(p0_k_elem[1]);	// attention_unit.k:20:9, :29:{13,17}, :33:{13,17}, :35:27
  wire         product_36 =
    _product_plus_q_shl_1_[3] ? product_4 | p0_k_elem[1] : product_4 & ~(p0_k_elem[1]);	// attention_unit.k:20:9, :29:{13,17}, :33:{13,17}, :35:27
  wire         product_37 =
    _product_plus_q_shl_1_[2] ? product_5 | p0_k_elem[1] : product_5 & ~(p0_k_elem[1]);	// attention_unit.k:20:9, :29:{13,17}, :33:{13,17}, :35:27
  wire         product_38 =
    _product_plus_q_shl_1_[1] ? product_6 | p0_k_elem[1] : product_6 & ~(p0_k_elem[1]);	// attention_unit.k:20:9, :29:{13,17}, :33:{13,17}, :35:27
  wire         product_39 =
    _product_plus_q_shl_1_[0] ? product_7 | p0_k_elem[1] : product_7 & ~(p0_k_elem[1]);	// attention_unit.k:20:9, :29:{13,17}, :33:{13,17}, :35:27
  wire  [31:0] _product_plus_q_shl_2_ =
    32'({product_8,
         product_9,
         product_10,
         product_11,
         product_12,
         product_13,
         product_14,
         product_15,
         product_16,
         product_17,
         product_18,
         product_19,
         product_20,
         product_21,
         product_22,
         product_23,
         product_24,
         product_25,
         product_26,
         product_27,
         product_28,
         product_29,
         product_30,
         product_31,
         product_32,
         product_33,
         product_34,
         product_35,
         product_36,
         product_37,
         product_38,
         product_39} + {{22{p0_q_elem[7]}}, p0_q_elem, 2'h0});	// attention_unit.k:20:9, :24:23, :33:{13,17}, :39:{27,37}
  wire         product_40 =
    _product_plus_q_shl_2_[31] ? product_8 | p0_k_elem[2] : product_8 & ~(p0_k_elem[2]);	// attention_unit.k:20:9, :33:{13,17}, :37:{13,17}, :39:27
  wire         product_41 =
    _product_plus_q_shl_2_[30] ? product_9 | p0_k_elem[2] : product_9 & ~(p0_k_elem[2]);	// attention_unit.k:20:9, :33:{13,17}, :37:{13,17}, :39:27
  wire         product_42 =
    _product_plus_q_shl_2_[29] ? product_10 | p0_k_elem[2] : product_10 & ~(p0_k_elem[2]);	// attention_unit.k:20:9, :33:{13,17}, :37:{13,17}, :39:27
  wire         product_43 =
    _product_plus_q_shl_2_[28] ? product_11 | p0_k_elem[2] : product_11 & ~(p0_k_elem[2]);	// attention_unit.k:20:9, :33:{13,17}, :37:{13,17}, :39:27
  wire         product_44 =
    _product_plus_q_shl_2_[27] ? product_12 | p0_k_elem[2] : product_12 & ~(p0_k_elem[2]);	// attention_unit.k:20:9, :33:{13,17}, :37:{13,17}, :39:27
  wire         product_45 =
    _product_plus_q_shl_2_[26] ? product_13 | p0_k_elem[2] : product_13 & ~(p0_k_elem[2]);	// attention_unit.k:20:9, :33:{13,17}, :37:{13,17}, :39:27
  wire         product_46 =
    _product_plus_q_shl_2_[25] ? product_14 | p0_k_elem[2] : product_14 & ~(p0_k_elem[2]);	// attention_unit.k:20:9, :33:{13,17}, :37:{13,17}, :39:27
  wire         product_47 =
    _product_plus_q_shl_2_[24] ? product_15 | p0_k_elem[2] : product_15 & ~(p0_k_elem[2]);	// attention_unit.k:20:9, :33:{13,17}, :37:{13,17}, :39:27
  wire         product_48 =
    _product_plus_q_shl_2_[23] ? product_16 | p0_k_elem[2] : product_16 & ~(p0_k_elem[2]);	// attention_unit.k:20:9, :33:{13,17}, :37:{13,17}, :39:27
  wire         product_49 =
    _product_plus_q_shl_2_[22] ? product_17 | p0_k_elem[2] : product_17 & ~(p0_k_elem[2]);	// attention_unit.k:20:9, :33:{13,17}, :37:{13,17}, :39:27
  wire         product_50 =
    _product_plus_q_shl_2_[21] ? product_18 | p0_k_elem[2] : product_18 & ~(p0_k_elem[2]);	// attention_unit.k:20:9, :33:{13,17}, :37:{13,17}, :39:27
  wire         product_51 =
    _product_plus_q_shl_2_[20] ? product_19 | p0_k_elem[2] : product_19 & ~(p0_k_elem[2]);	// attention_unit.k:20:9, :33:{13,17}, :37:{13,17}, :39:27
  wire         product_52 =
    _product_plus_q_shl_2_[19] ? product_20 | p0_k_elem[2] : product_20 & ~(p0_k_elem[2]);	// attention_unit.k:20:9, :33:{13,17}, :37:{13,17}, :39:27
  wire         product_53 =
    _product_plus_q_shl_2_[18] ? product_21 | p0_k_elem[2] : product_21 & ~(p0_k_elem[2]);	// attention_unit.k:20:9, :33:{13,17}, :37:{13,17}, :39:27
  wire         product_54 =
    _product_plus_q_shl_2_[17] ? product_22 | p0_k_elem[2] : product_22 & ~(p0_k_elem[2]);	// attention_unit.k:20:9, :33:{13,17}, :37:{13,17}, :39:27
  wire         product_55 =
    _product_plus_q_shl_2_[16] ? product_23 | p0_k_elem[2] : product_23 & ~(p0_k_elem[2]);	// attention_unit.k:20:9, :33:{13,17}, :37:{13,17}, :39:27
  wire         product_56 =
    _product_plus_q_shl_2_[15] ? product_24 | p0_k_elem[2] : product_24 & ~(p0_k_elem[2]);	// attention_unit.k:20:9, :33:{13,17}, :37:{13,17}, :39:27
  wire         product_57 =
    _product_plus_q_shl_2_[14] ? product_25 | p0_k_elem[2] : product_25 & ~(p0_k_elem[2]);	// attention_unit.k:20:9, :33:{13,17}, :37:{13,17}, :39:27
  wire         product_58 =
    _product_plus_q_shl_2_[13] ? product_26 | p0_k_elem[2] : product_26 & ~(p0_k_elem[2]);	// attention_unit.k:20:9, :33:{13,17}, :37:{13,17}, :39:27
  wire         product_59 =
    _product_plus_q_shl_2_[12] ? product_27 | p0_k_elem[2] : product_27 & ~(p0_k_elem[2]);	// attention_unit.k:20:9, :33:{13,17}, :37:{13,17}, :39:27
  wire         product_60 =
    _product_plus_q_shl_2_[11] ? product_28 | p0_k_elem[2] : product_28 & ~(p0_k_elem[2]);	// attention_unit.k:20:9, :33:{13,17}, :37:{13,17}, :39:27
  wire         product_61 =
    _product_plus_q_shl_2_[10] ? product_29 | p0_k_elem[2] : product_29 & ~(p0_k_elem[2]);	// attention_unit.k:20:9, :33:{13,17}, :37:{13,17}, :39:27
  wire         product_62 =
    _product_plus_q_shl_2_[9] ? product_30 | p0_k_elem[2] : product_30 & ~(p0_k_elem[2]);	// attention_unit.k:20:9, :33:{13,17}, :37:{13,17}, :39:27
  wire         product_63 =
    _product_plus_q_shl_2_[8] ? product_31 | p0_k_elem[2] : product_31 & ~(p0_k_elem[2]);	// attention_unit.k:20:9, :33:{13,17}, :37:{13,17}, :39:27
  wire         product_64 =
    _product_plus_q_shl_2_[7] ? product_32 | p0_k_elem[2] : product_32 & ~(p0_k_elem[2]);	// attention_unit.k:20:9, :33:{13,17}, :37:{13,17}, :39:27
  wire         product_65 =
    _product_plus_q_shl_2_[6] ? product_33 | p0_k_elem[2] : product_33 & ~(p0_k_elem[2]);	// attention_unit.k:20:9, :33:{13,17}, :37:{13,17}, :39:27
  wire         product_66 =
    _product_plus_q_shl_2_[5] ? product_34 | p0_k_elem[2] : product_34 & ~(p0_k_elem[2]);	// attention_unit.k:20:9, :33:{13,17}, :37:{13,17}, :39:27
  wire         product_67 =
    _product_plus_q_shl_2_[4] ? product_35 | p0_k_elem[2] : product_35 & ~(p0_k_elem[2]);	// attention_unit.k:20:9, :33:{13,17}, :37:{13,17}, :39:27
  wire         product_68 =
    _product_plus_q_shl_2_[3] ? product_36 | p0_k_elem[2] : product_36 & ~(p0_k_elem[2]);	// attention_unit.k:20:9, :33:{13,17}, :37:{13,17}, :39:27
  wire         product_69 =
    _product_plus_q_shl_2_[2] ? product_37 | p0_k_elem[2] : product_37 & ~(p0_k_elem[2]);	// attention_unit.k:20:9, :33:{13,17}, :37:{13,17}, :39:27
  wire         product_70 =
    _product_plus_q_shl_2_[1] ? product_38 | p0_k_elem[2] : product_38 & ~(p0_k_elem[2]);	// attention_unit.k:20:9, :33:{13,17}, :37:{13,17}, :39:27
  wire         product_71 =
    _product_plus_q_shl_2_[0] ? product_39 | p0_k_elem[2] : product_39 & ~(p0_k_elem[2]);	// attention_unit.k:20:9, :33:{13,17}, :37:{13,17}, :39:27
  wire  [31:0] _product_plus_q_shl_3_ =
    32'({product_40,
         product_41,
         product_42,
         product_43,
         product_44,
         product_45,
         product_46,
         product_47,
         product_48,
         product_49,
         product_50,
         product_51,
         product_52,
         product_53,
         product_54,
         product_55,
         product_56,
         product_57,
         product_58,
         product_59,
         product_60,
         product_61,
         product_62,
         product_63,
         product_64,
         product_65,
         product_66,
         product_67,
         product_68,
         product_69,
         product_70,
         product_71} + {{21{p0_q_elem[7]}}, p0_q_elem, 3'h0});	// attention_unit.k:20:9, :24:23, :37:{13,17}, :43:{27,37}
  wire         product_72 =
    _product_plus_q_shl_3_[31] ? product_40 | p0_k_elem[3] : product_40 & ~(p0_k_elem[3]);	// attention_unit.k:20:9, :37:{13,17}, :41:{13,17}, :43:27
  wire         product_73 =
    _product_plus_q_shl_3_[30] ? product_41 | p0_k_elem[3] : product_41 & ~(p0_k_elem[3]);	// attention_unit.k:20:9, :37:{13,17}, :41:{13,17}, :43:27
  wire         product_74 =
    _product_plus_q_shl_3_[29] ? product_42 | p0_k_elem[3] : product_42 & ~(p0_k_elem[3]);	// attention_unit.k:20:9, :37:{13,17}, :41:{13,17}, :43:27
  wire         product_75 =
    _product_plus_q_shl_3_[28] ? product_43 | p0_k_elem[3] : product_43 & ~(p0_k_elem[3]);	// attention_unit.k:20:9, :37:{13,17}, :41:{13,17}, :43:27
  wire         product_76 =
    _product_plus_q_shl_3_[27] ? product_44 | p0_k_elem[3] : product_44 & ~(p0_k_elem[3]);	// attention_unit.k:20:9, :37:{13,17}, :41:{13,17}, :43:27
  wire         product_77 =
    _product_plus_q_shl_3_[26] ? product_45 | p0_k_elem[3] : product_45 & ~(p0_k_elem[3]);	// attention_unit.k:20:9, :37:{13,17}, :41:{13,17}, :43:27
  wire         product_78 =
    _product_plus_q_shl_3_[25] ? product_46 | p0_k_elem[3] : product_46 & ~(p0_k_elem[3]);	// attention_unit.k:20:9, :37:{13,17}, :41:{13,17}, :43:27
  wire         product_79 =
    _product_plus_q_shl_3_[24] ? product_47 | p0_k_elem[3] : product_47 & ~(p0_k_elem[3]);	// attention_unit.k:20:9, :37:{13,17}, :41:{13,17}, :43:27
  wire         product_80 =
    _product_plus_q_shl_3_[23] ? product_48 | p0_k_elem[3] : product_48 & ~(p0_k_elem[3]);	// attention_unit.k:20:9, :37:{13,17}, :41:{13,17}, :43:27
  wire         product_81 =
    _product_plus_q_shl_3_[22] ? product_49 | p0_k_elem[3] : product_49 & ~(p0_k_elem[3]);	// attention_unit.k:20:9, :37:{13,17}, :41:{13,17}, :43:27
  wire         product_82 =
    _product_plus_q_shl_3_[21] ? product_50 | p0_k_elem[3] : product_50 & ~(p0_k_elem[3]);	// attention_unit.k:20:9, :37:{13,17}, :41:{13,17}, :43:27
  wire         product_83 =
    _product_plus_q_shl_3_[20] ? product_51 | p0_k_elem[3] : product_51 & ~(p0_k_elem[3]);	// attention_unit.k:20:9, :37:{13,17}, :41:{13,17}, :43:27
  wire         product_84 =
    _product_plus_q_shl_3_[19] ? product_52 | p0_k_elem[3] : product_52 & ~(p0_k_elem[3]);	// attention_unit.k:20:9, :37:{13,17}, :41:{13,17}, :43:27
  wire         product_85 =
    _product_plus_q_shl_3_[18] ? product_53 | p0_k_elem[3] : product_53 & ~(p0_k_elem[3]);	// attention_unit.k:20:9, :37:{13,17}, :41:{13,17}, :43:27
  wire         product_86 =
    _product_plus_q_shl_3_[17] ? product_54 | p0_k_elem[3] : product_54 & ~(p0_k_elem[3]);	// attention_unit.k:20:9, :37:{13,17}, :41:{13,17}, :43:27
  wire         product_87 =
    _product_plus_q_shl_3_[16] ? product_55 | p0_k_elem[3] : product_55 & ~(p0_k_elem[3]);	// attention_unit.k:20:9, :37:{13,17}, :41:{13,17}, :43:27
  wire         product_88 =
    _product_plus_q_shl_3_[15] ? product_56 | p0_k_elem[3] : product_56 & ~(p0_k_elem[3]);	// attention_unit.k:20:9, :37:{13,17}, :41:{13,17}, :43:27
  wire         product_89 =
    _product_plus_q_shl_3_[14] ? product_57 | p0_k_elem[3] : product_57 & ~(p0_k_elem[3]);	// attention_unit.k:20:9, :37:{13,17}, :41:{13,17}, :43:27
  wire         product_90 =
    _product_plus_q_shl_3_[13] ? product_58 | p0_k_elem[3] : product_58 & ~(p0_k_elem[3]);	// attention_unit.k:20:9, :37:{13,17}, :41:{13,17}, :43:27
  wire         product_91 =
    _product_plus_q_shl_3_[12] ? product_59 | p0_k_elem[3] : product_59 & ~(p0_k_elem[3]);	// attention_unit.k:20:9, :37:{13,17}, :41:{13,17}, :43:27
  wire         product_92 =
    _product_plus_q_shl_3_[11] ? product_60 | p0_k_elem[3] : product_60 & ~(p0_k_elem[3]);	// attention_unit.k:20:9, :37:{13,17}, :41:{13,17}, :43:27
  wire         product_93 =
    _product_plus_q_shl_3_[10] ? product_61 | p0_k_elem[3] : product_61 & ~(p0_k_elem[3]);	// attention_unit.k:20:9, :37:{13,17}, :41:{13,17}, :43:27
  wire         product_94 =
    _product_plus_q_shl_3_[9] ? product_62 | p0_k_elem[3] : product_62 & ~(p0_k_elem[3]);	// attention_unit.k:20:9, :37:{13,17}, :41:{13,17}, :43:27
  wire         product_95 =
    _product_plus_q_shl_3_[8] ? product_63 | p0_k_elem[3] : product_63 & ~(p0_k_elem[3]);	// attention_unit.k:20:9, :37:{13,17}, :41:{13,17}, :43:27
  wire         product_96 =
    _product_plus_q_shl_3_[7] ? product_64 | p0_k_elem[3] : product_64 & ~(p0_k_elem[3]);	// attention_unit.k:20:9, :37:{13,17}, :41:{13,17}, :43:27
  wire         product_97 =
    _product_plus_q_shl_3_[6] ? product_65 | p0_k_elem[3] : product_65 & ~(p0_k_elem[3]);	// attention_unit.k:20:9, :37:{13,17}, :41:{13,17}, :43:27
  wire         product_98 =
    _product_plus_q_shl_3_[5] ? product_66 | p0_k_elem[3] : product_66 & ~(p0_k_elem[3]);	// attention_unit.k:20:9, :37:{13,17}, :41:{13,17}, :43:27
  wire         product_99 =
    _product_plus_q_shl_3_[4] ? product_67 | p0_k_elem[3] : product_67 & ~(p0_k_elem[3]);	// attention_unit.k:20:9, :37:{13,17}, :41:{13,17}, :43:27
  wire         product_100 =
    _product_plus_q_shl_3_[3] ? product_68 | p0_k_elem[3] : product_68 & ~(p0_k_elem[3]);	// attention_unit.k:20:9, :37:{13,17}, :41:{13,17}, :43:27
  wire         product_101 =
    _product_plus_q_shl_3_[2] ? product_69 | p0_k_elem[3] : product_69 & ~(p0_k_elem[3]);	// attention_unit.k:20:9, :37:{13,17}, :41:{13,17}, :43:27
  wire         product_102 =
    _product_plus_q_shl_3_[1] ? product_70 | p0_k_elem[3] : product_70 & ~(p0_k_elem[3]);	// attention_unit.k:20:9, :37:{13,17}, :41:{13,17}, :43:27
  wire         product_103 =
    _product_plus_q_shl_3_[0] ? product_71 | p0_k_elem[3] : product_71 & ~(p0_k_elem[3]);	// attention_unit.k:20:9, :37:{13,17}, :41:{13,17}, :43:27
  wire  [31:0] _product_plus_q_shl_4_ =
    32'({product_72,
         product_73,
         product_74,
         product_75,
         product_76,
         product_77,
         product_78,
         product_79,
         product_80,
         product_81,
         product_82,
         product_83,
         product_84,
         product_85,
         product_86,
         product_87,
         product_88,
         product_89,
         product_90,
         product_91,
         product_92,
         product_93,
         product_94,
         product_95,
         product_96,
         product_97,
         product_98,
         product_99,
         product_100,
         product_101,
         product_102,
         product_103} + {{20{p0_q_elem[7]}}, p0_q_elem, 4'h0});	// attention_unit.k:20:9, :24:23, :41:{13,17}, :47:{27,37}
  wire         product_104 =
    _product_plus_q_shl_4_[31] ? product_72 | p0_k_elem[4] : product_72 & ~(p0_k_elem[4]);	// attention_unit.k:20:9, :41:{13,17}, :45:{13,17}, :47:27
  wire         product_105 =
    _product_plus_q_shl_4_[30] ? product_73 | p0_k_elem[4] : product_73 & ~(p0_k_elem[4]);	// attention_unit.k:20:9, :41:{13,17}, :45:{13,17}, :47:27
  wire         product_106 =
    _product_plus_q_shl_4_[29] ? product_74 | p0_k_elem[4] : product_74 & ~(p0_k_elem[4]);	// attention_unit.k:20:9, :41:{13,17}, :45:{13,17}, :47:27
  wire         product_107 =
    _product_plus_q_shl_4_[28] ? product_75 | p0_k_elem[4] : product_75 & ~(p0_k_elem[4]);	// attention_unit.k:20:9, :41:{13,17}, :45:{13,17}, :47:27
  wire         product_108 =
    _product_plus_q_shl_4_[27] ? product_76 | p0_k_elem[4] : product_76 & ~(p0_k_elem[4]);	// attention_unit.k:20:9, :41:{13,17}, :45:{13,17}, :47:27
  wire         product_109 =
    _product_plus_q_shl_4_[26] ? product_77 | p0_k_elem[4] : product_77 & ~(p0_k_elem[4]);	// attention_unit.k:20:9, :41:{13,17}, :45:{13,17}, :47:27
  wire         product_110 =
    _product_plus_q_shl_4_[25] ? product_78 | p0_k_elem[4] : product_78 & ~(p0_k_elem[4]);	// attention_unit.k:20:9, :41:{13,17}, :45:{13,17}, :47:27
  wire         product_111 =
    _product_plus_q_shl_4_[24] ? product_79 | p0_k_elem[4] : product_79 & ~(p0_k_elem[4]);	// attention_unit.k:20:9, :41:{13,17}, :45:{13,17}, :47:27
  wire         product_112 =
    _product_plus_q_shl_4_[23] ? product_80 | p0_k_elem[4] : product_80 & ~(p0_k_elem[4]);	// attention_unit.k:20:9, :41:{13,17}, :45:{13,17}, :47:27
  wire         product_113 =
    _product_plus_q_shl_4_[22] ? product_81 | p0_k_elem[4] : product_81 & ~(p0_k_elem[4]);	// attention_unit.k:20:9, :41:{13,17}, :45:{13,17}, :47:27
  wire         product_114 =
    _product_plus_q_shl_4_[21] ? product_82 | p0_k_elem[4] : product_82 & ~(p0_k_elem[4]);	// attention_unit.k:20:9, :41:{13,17}, :45:{13,17}, :47:27
  wire         product_115 =
    _product_plus_q_shl_4_[20] ? product_83 | p0_k_elem[4] : product_83 & ~(p0_k_elem[4]);	// attention_unit.k:20:9, :41:{13,17}, :45:{13,17}, :47:27
  wire         product_116 =
    _product_plus_q_shl_4_[19] ? product_84 | p0_k_elem[4] : product_84 & ~(p0_k_elem[4]);	// attention_unit.k:20:9, :41:{13,17}, :45:{13,17}, :47:27
  wire         product_117 =
    _product_plus_q_shl_4_[18] ? product_85 | p0_k_elem[4] : product_85 & ~(p0_k_elem[4]);	// attention_unit.k:20:9, :41:{13,17}, :45:{13,17}, :47:27
  wire         product_118 =
    _product_plus_q_shl_4_[17] ? product_86 | p0_k_elem[4] : product_86 & ~(p0_k_elem[4]);	// attention_unit.k:20:9, :41:{13,17}, :45:{13,17}, :47:27
  wire         product_119 =
    _product_plus_q_shl_4_[16] ? product_87 | p0_k_elem[4] : product_87 & ~(p0_k_elem[4]);	// attention_unit.k:20:9, :41:{13,17}, :45:{13,17}, :47:27
  wire         product_120 =
    _product_plus_q_shl_4_[15] ? product_88 | p0_k_elem[4] : product_88 & ~(p0_k_elem[4]);	// attention_unit.k:20:9, :41:{13,17}, :45:{13,17}, :47:27
  wire         product_121 =
    _product_plus_q_shl_4_[14] ? product_89 | p0_k_elem[4] : product_89 & ~(p0_k_elem[4]);	// attention_unit.k:20:9, :41:{13,17}, :45:{13,17}, :47:27
  wire         product_122 =
    _product_plus_q_shl_4_[13] ? product_90 | p0_k_elem[4] : product_90 & ~(p0_k_elem[4]);	// attention_unit.k:20:9, :41:{13,17}, :45:{13,17}, :47:27
  wire         product_123 =
    _product_plus_q_shl_4_[12] ? product_91 | p0_k_elem[4] : product_91 & ~(p0_k_elem[4]);	// attention_unit.k:20:9, :41:{13,17}, :45:{13,17}, :47:27
  wire         product_124 =
    _product_plus_q_shl_4_[11] ? product_92 | p0_k_elem[4] : product_92 & ~(p0_k_elem[4]);	// attention_unit.k:20:9, :41:{13,17}, :45:{13,17}, :47:27
  wire         product_125 =
    _product_plus_q_shl_4_[10] ? product_93 | p0_k_elem[4] : product_93 & ~(p0_k_elem[4]);	// attention_unit.k:20:9, :41:{13,17}, :45:{13,17}, :47:27
  wire         product_126 =
    _product_plus_q_shl_4_[9] ? product_94 | p0_k_elem[4] : product_94 & ~(p0_k_elem[4]);	// attention_unit.k:20:9, :41:{13,17}, :45:{13,17}, :47:27
  wire         product_127 =
    _product_plus_q_shl_4_[8] ? product_95 | p0_k_elem[4] : product_95 & ~(p0_k_elem[4]);	// attention_unit.k:20:9, :41:{13,17}, :45:{13,17}, :47:27
  wire         product_128 =
    _product_plus_q_shl_4_[7] ? product_96 | p0_k_elem[4] : product_96 & ~(p0_k_elem[4]);	// attention_unit.k:20:9, :41:{13,17}, :45:{13,17}, :47:27
  wire         product_129 =
    _product_plus_q_shl_4_[6] ? product_97 | p0_k_elem[4] : product_97 & ~(p0_k_elem[4]);	// attention_unit.k:20:9, :41:{13,17}, :45:{13,17}, :47:27
  wire         product_130 =
    _product_plus_q_shl_4_[5] ? product_98 | p0_k_elem[4] : product_98 & ~(p0_k_elem[4]);	// attention_unit.k:20:9, :41:{13,17}, :45:{13,17}, :47:27
  wire         product_131 =
    _product_plus_q_shl_4_[4] ? product_99 | p0_k_elem[4] : product_99 & ~(p0_k_elem[4]);	// attention_unit.k:20:9, :41:{13,17}, :45:{13,17}, :47:27
  wire         product_132 =
    _product_plus_q_shl_4_[3]
      ? product_100 | p0_k_elem[4]
      : product_100 & ~(p0_k_elem[4]);	// attention_unit.k:20:9, :41:{13,17}, :45:{13,17}, :47:27
  wire         product_133 =
    _product_plus_q_shl_4_[2]
      ? product_101 | p0_k_elem[4]
      : product_101 & ~(p0_k_elem[4]);	// attention_unit.k:20:9, :41:{13,17}, :45:{13,17}, :47:27
  wire         product_134 =
    _product_plus_q_shl_4_[1]
      ? product_102 | p0_k_elem[4]
      : product_102 & ~(p0_k_elem[4]);	// attention_unit.k:20:9, :41:{13,17}, :45:{13,17}, :47:27
  wire         product_135 =
    _product_plus_q_shl_4_[0]
      ? product_103 | p0_k_elem[4]
      : product_103 & ~(p0_k_elem[4]);	// attention_unit.k:20:9, :41:{13,17}, :45:{13,17}, :47:27
  wire  [31:0] _product_plus_q_shl_5_ =
    32'({product_104,
         product_105,
         product_106,
         product_107,
         product_108,
         product_109,
         product_110,
         product_111,
         product_112,
         product_113,
         product_114,
         product_115,
         product_116,
         product_117,
         product_118,
         product_119,
         product_120,
         product_121,
         product_122,
         product_123,
         product_124,
         product_125,
         product_126,
         product_127,
         product_128,
         product_129,
         product_130,
         product_131,
         product_132,
         product_133,
         product_134,
         product_135} + {{19{p0_q_elem[7]}}, p0_q_elem, 5'h0});	// attention_unit.k:20:9, :24:23, :45:{13,17}, :51:{27,37}
  wire  [31:0] product_136 =
    {_product_plus_q_shl_5_[31]
       ? product_104 | p0_k_elem[5]
       : product_104 & ~(p0_k_elem[5]),
     _product_plus_q_shl_5_[30]
       ? product_105 | p0_k_elem[5]
       : product_105 & ~(p0_k_elem[5]),
     _product_plus_q_shl_5_[29]
       ? product_106 | p0_k_elem[5]
       : product_106 & ~(p0_k_elem[5]),
     _product_plus_q_shl_5_[28]
       ? product_107 | p0_k_elem[5]
       : product_107 & ~(p0_k_elem[5]),
     _product_plus_q_shl_5_[27]
       ? product_108 | p0_k_elem[5]
       : product_108 & ~(p0_k_elem[5]),
     _product_plus_q_shl_5_[26]
       ? product_109 | p0_k_elem[5]
       : product_109 & ~(p0_k_elem[5]),
     _product_plus_q_shl_5_[25]
       ? product_110 | p0_k_elem[5]
       : product_110 & ~(p0_k_elem[5]),
     _product_plus_q_shl_5_[24]
       ? product_111 | p0_k_elem[5]
       : product_111 & ~(p0_k_elem[5]),
     _product_plus_q_shl_5_[23]
       ? product_112 | p0_k_elem[5]
       : product_112 & ~(p0_k_elem[5]),
     _product_plus_q_shl_5_[22]
       ? product_113 | p0_k_elem[5]
       : product_113 & ~(p0_k_elem[5]),
     _product_plus_q_shl_5_[21]
       ? product_114 | p0_k_elem[5]
       : product_114 & ~(p0_k_elem[5]),
     _product_plus_q_shl_5_[20]
       ? product_115 | p0_k_elem[5]
       : product_115 & ~(p0_k_elem[5]),
     _product_plus_q_shl_5_[19]
       ? product_116 | p0_k_elem[5]
       : product_116 & ~(p0_k_elem[5]),
     _product_plus_q_shl_5_[18]
       ? product_117 | p0_k_elem[5]
       : product_117 & ~(p0_k_elem[5]),
     _product_plus_q_shl_5_[17]
       ? product_118 | p0_k_elem[5]
       : product_118 & ~(p0_k_elem[5]),
     _product_plus_q_shl_5_[16]
       ? product_119 | p0_k_elem[5]
       : product_119 & ~(p0_k_elem[5]),
     _product_plus_q_shl_5_[15]
       ? product_120 | p0_k_elem[5]
       : product_120 & ~(p0_k_elem[5]),
     _product_plus_q_shl_5_[14]
       ? product_121 | p0_k_elem[5]
       : product_121 & ~(p0_k_elem[5]),
     _product_plus_q_shl_5_[13]
       ? product_122 | p0_k_elem[5]
       : product_122 & ~(p0_k_elem[5]),
     _product_plus_q_shl_5_[12]
       ? product_123 | p0_k_elem[5]
       : product_123 & ~(p0_k_elem[5]),
     _product_plus_q_shl_5_[11]
       ? product_124 | p0_k_elem[5]
       : product_124 & ~(p0_k_elem[5]),
     _product_plus_q_shl_5_[10]
       ? product_125 | p0_k_elem[5]
       : product_125 & ~(p0_k_elem[5]),
     _product_plus_q_shl_5_[9]
       ? product_126 | p0_k_elem[5]
       : product_126 & ~(p0_k_elem[5]),
     _product_plus_q_shl_5_[8]
       ? product_127 | p0_k_elem[5]
       : product_127 & ~(p0_k_elem[5]),
     _product_plus_q_shl_5_[7]
       ? product_128 | p0_k_elem[5]
       : product_128 & ~(p0_k_elem[5]),
     _product_plus_q_shl_5_[6]
       ? product_129 | p0_k_elem[5]
       : product_129 & ~(p0_k_elem[5]),
     _product_plus_q_shl_5_[5]
       ? product_130 | p0_k_elem[5]
       : product_130 & ~(p0_k_elem[5]),
     _product_plus_q_shl_5_[4]
       ? product_131 | p0_k_elem[5]
       : product_131 & ~(p0_k_elem[5]),
     _product_plus_q_shl_5_[3]
       ? product_132 | p0_k_elem[5]
       : product_132 & ~(p0_k_elem[5]),
     _product_plus_q_shl_5_[2]
       ? product_133 | p0_k_elem[5]
       : product_133 & ~(p0_k_elem[5]),
     _product_plus_q_shl_5_[1]
       ? product_134 | p0_k_elem[5]
       : product_134 & ~(p0_k_elem[5]),
     _product_plus_q_shl_5_[0]
       ? product_135 | p0_k_elem[5]
       : product_135 & ~(p0_k_elem[5])};	// attention_unit.k:20:9, :45:{13,17}, :49:{13,17}, :51:27
  wire  [31:0] product_137 =
    p0_k_elem[6] ? 32'(product_136 + {{18{p0_q_elem[7]}}, p0_q_elem, 6'h0}) : product_136;	// attention_unit.k:20:9, :24:23, :49:{13,17}, :53:{13,17}, :55:{27,37}
  wire  [31:0] _score_accum_plus_product_ =
    32'(global_in__score_accum_6_0
        + (p0_k_elem[7]
             ? 32'(product_137 - {{17{p0_q_elem[7]}}, p0_q_elem, 7'h0})
             : product_137));	// attention_unit.k:18:5, :20:9, :24:23, :53:13, :58:13, :60:27, :63:28
  always_comb begin	// attention_unit.k:20:9
    global_out__score_accum_6_0_0 = _score_accum_plus_product_;	// attention_unit.k:22:9, :63:28
    global_out__score_accum_6_0_valid_0 = p0_stage1_enable;	// attention_unit.k:20:9, :22:9
  end // always_comb
  reg   [31:0] p0__score_accum_plus_product_;	// attention_unit.k:20:9
  reg          p0_stage2_enable = 1'h0;	// attention_unit.k:20:9
  reg   [31:0] p0__score_accum_plus_product__0;	// attention_unit.k:20:9
  reg          p0_stage3_enable = 1'h0;	// attention_unit.k:20:9
  always @(posedge clk) begin	// attention_unit.k:20:9
    p0_q_elem <= data_in_5[7:0];	// attention_unit.k:20:9
    p0_k_elem <= data_in_5[15:8];	// attention_unit.k:20:9
    if (rst)	// attention_unit.k:20:9
      p0_stage1_enable <= 1'h0;	// attention_unit.k:20:9
    else	// attention_unit.k:20:9
      p0_stage1_enable <= _GEN & input_valid_0;	// attention_unit.k:20:9
    p0__score_accum_plus_product_ <= _score_accum_plus_product_;	// attention_unit.k:20:9, :63:28
    if (rst)	// attention_unit.k:20:9
      p0_stage2_enable <= 1'h0;	// attention_unit.k:20:9
    else	// attention_unit.k:20:9
      p0_stage2_enable <= p0_stage1_enable;	// attention_unit.k:20:9
    p0__score_accum_plus_product__0 <= p0__score_accum_plus_product_;	// attention_unit.k:20:9
    if (rst)	// attention_unit.k:20:9
      p0_stage3_enable <= 1'h0;	// attention_unit.k:20:9
    else	// attention_unit.k:20:9
      p0_stage3_enable <= p0_stage2_enable;	// attention_unit.k:20:9
  end // always @(posedge)
  always_comb begin	// attention_unit.k:20:9
    fifo_wren_0_0 = p0_stage3_enable;	// attention_unit.k:18:5, :20:9
    fifo_data_out_0_0 = p0__score_accum_plus_product__0;	// attention_unit.k:18:5, :20:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// attention_unit.k:20:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// attention_unit.k:20:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  attention_unitDebugView_dot_productEntry attention_unitDebugView_dot_productEntry_instance (	// attention_unit.k:18:5
    .clk       (clk),	// attention_unit.k:18:5
    ._q_elem   (p0_stage1_enable ? p0_q_elem : 'x),	// attention_unit.k:18:5, :20:9
    ._k_elem   (p0_stage1_enable ? p0_k_elem : 'x),	// attention_unit.k:18:5, :20:9
    .valid     (p0_stage1_enable),	// attention_unit.k:20:9
    .valid_out (/* unused */)
  );	// attention_unit.k:18:5
  attention_unitDebugView_dot_productExit attention_unitDebugView_dot_productExit_instance (	// attention_unit.k:18:5
    .clk          (clk),	// attention_unit.k:18:5
    ._ReturnValue (p0_stage2_enable ? p0__score_accum_plus_product_ : 'x),	// attention_unit.k:18:5, :20:9
    .valid        (p0_stage2_enable),	// attention_unit.k:20:9
    .valid_out    (/* unused */)
  );	// attention_unit.k:18:5
  assign done_out = p0_stage3_enable;	// attention_unit.k:20:9
  assign global_out__score_accum_6_0_valid = global_out__score_accum_6_0_valid_0;	// attention_unit.k:20:9
  assign global_out__score_accum_6_0 = global_out__score_accum_6_0_0;	// attention_unit.k:20:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// attention_unit.k:20:9
  assign fifo_wren_0 = fifo_wren_0_0;	// attention_unit.k:20:9
  assign input_rdy_0 = input_rdy_0_0;	// attention_unit.k:20:9
  assign control_state_out = control_state_out_0;	// attention_unit.k:20:9
endmodule

module attention_unit_reg_32_w2_v_1_32_0_i_32_0(
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

module attention_unit_reg_32_w1_i_32_0(
  input  wire        clk,
  input  wire        rst,
  input  wire        input_valid_0,
  input  wire [31:0] input_0,
  output wire [31:0] value_out
);

  reg [31:0] value;
  always @(posedge clk) begin
    if (rst)
      value <= 32'h0;
    else
      value <= input_valid_0 ? input_0 : value;
  end // always @(posedge)
  assign value_out = value;
endmodule

module attention_unit(
  input  wire        clk,
  input  wire        rst,
  input  wire        dot_product_valid_in,
  input  wire [7:0]  dot_product_q_elem_in,
  input  wire [7:0]  dot_product_k_elem_in,
  input  wire        dot_product_rden_in,
  input  wire        read_score_valid_in,
  input  wire        read_score_rden_in,
  input  wire        clear_score_valid_in,
  input  wire        clear_score_rden_in,
  input  wire        set_max_score_valid_in,
  input  wire [31:0] set_max_score_score_in,
  input  wire        set_max_score_rden_in,
  input  wire        get_max_score_valid_in,
  input  wire        get_max_score_rden_in,
  input  wire [2:0]  stall_rate_in,
  input  wire        stall_rate_valid_in,
  output wire        rst_and_startup_done_out,
  output wire        dot_product_rdy_out,
  output wire        dot_product_empty_out,
  output wire [31:0] dot_product_result_out,
  output wire        read_score_rdy_out,
  output wire        read_score_empty_out,
  output wire [31:0] read_score_result_out,
  output wire        clear_score_rdy_out,
  output wire        clear_score_empty_out,
  output wire        set_max_score_rdy_out,
  output wire        set_max_score_empty_out,
  output wire        get_max_score_rdy_out,
  output wire        get_max_score_empty_out,
  output wire [31:0] get_max_score_result_out,
  output wire        stall_rate_supported_out
);

  wire [31:0] _get_max_score_BasicBlock_0Impl_fifo_data_out_0;	// attention_unit.k:97:9
  wire        _get_max_score_BasicBlock_0Impl_fifo_wren_0;	// attention_unit.k:97:9
  wire        _get_max_score_BasicBlock_0Impl_input_rdy_0;	// attention_unit.k:97:9
  wire        _set_max_score_BasicBlock_0Impl_global_out__max_score_7_0_valid;	// attention_unit.k:88:9
  wire [31:0] _set_max_score_BasicBlock_0Impl_global_out__max_score_7_0;	// attention_unit.k:88:9
  wire        _set_max_score_BasicBlock_0Impl_fifo_wren_0;	// attention_unit.k:88:9
  wire        _set_max_score_BasicBlock_0Impl_input_rdy_0;	// attention_unit.k:88:9
  wire        _clear_score_BasicBlock_0Impl_global_out__score_accum_6_1_valid;	// attention_unit.k:79:9
  wire        _clear_score_BasicBlock_0Impl_fifo_wren_0;	// attention_unit.k:79:9
  wire        _clear_score_BasicBlock_0Impl_input_rdy_0;	// attention_unit.k:79:9
  wire [31:0] _read_score_BasicBlock_0Impl_fifo_data_out_0;	// attention_unit.k:73:9
  wire        _read_score_BasicBlock_0Impl_fifo_wren_0;	// attention_unit.k:73:9
  wire        _read_score_BasicBlock_0Impl_input_rdy_0;	// attention_unit.k:73:9
  wire        _dot_product_BasicBlock_0Impl_global_out__score_accum_6_0_valid;	// attention_unit.k:20:9
  wire [31:0] _dot_product_BasicBlock_0Impl_global_out__score_accum_6_0;	// attention_unit.k:20:9
  wire [31:0] _dot_product_BasicBlock_0Impl_fifo_data_out_0;	// attention_unit.k:20:9
  wire        _dot_product_BasicBlock_0Impl_fifo_wren_0;	// attention_unit.k:20:9
  wire        _dot_product_BasicBlock_0Impl_input_rdy_0;	// attention_unit.k:20:9
  wire        _fifo_4_get_max_score_Return_overflow_out;
  wire        _fifo_4_get_max_score_Return_underflow_out;
  wire        _fifo_4_get_max_score_Return_empty;
  wire        _fifo_4_get_max_score_Return_full;
  wire [31:0] _fifo_4_get_max_score_Return_q;
  wire        _fifo_3_set_max_score_Return_overflow_out;
  wire        _fifo_3_set_max_score_Return_underflow_out;
  wire        _fifo_3_set_max_score_Return_empty;
  wire        _fifo_3_set_max_score_Return_full;
  wire        _fifo_2_clear_score_Return_overflow_out;
  wire        _fifo_2_clear_score_Return_underflow_out;
  wire        _fifo_2_clear_score_Return_empty;
  wire        _fifo_2_clear_score_Return_full;
  wire        _fifo_1_read_score_Return_overflow_out;
  wire        _fifo_1_read_score_Return_underflow_out;
  wire        _fifo_1_read_score_Return_empty;
  wire        _fifo_1_read_score_Return_full;
  wire [31:0] _fifo_1_read_score_Return_q;
  wire        _fifo_0_dot_product_Return_overflow_out;
  wire        _fifo_0_dot_product_Return_underflow_out;
  wire        _fifo_0_dot_product_Return_empty;
  wire        _fifo_0_dot_product_Return_full;
  wire [31:0] _fifo_0_dot_product_Return_q;
  wire        _has_startup_completed_delayed_4_delay_chain_data_out;
  wire        _has_startup_completed_delayed_3_delay_chain_data_out;
  wire        _has_startup_completed_delayed_2_delay_chain_data_out;
  wire        _has_startup_completed_delayed_1_delay_chain_data_out;
  wire        _has_startup_completed_delayed_0_delay_chain_data_out;
  wire [31:0] __max_score_value_out;	// attention_unit.k:13:5
  wire [31:0] __score_accum_value_out;	// attention_unit.k:12:5
  wire        _reset_control_rst_and_startup_done_out;
  wire [11:0] _reset_control_rst_delayed_out;
  wire        _reset_control_reset_sequence_finished_this_cycle_out;
  logic  stall_rate_supported_out_net;
  logic  get_max_score_empty_out_net;
  logic [31:0] get_max_score_result_out_net;
  logic  get_max_score_rdy_out_net;
  logic  set_max_score_empty_out_net;
  logic  set_max_score_rdy_out_net;
  logic  clear_score_empty_out_net;
  logic  clear_score_rdy_out_net;
  logic  read_score_empty_out_net;
  logic [31:0] read_score_result_out_net;
  logic  read_score_rdy_out_net;
  logic  dot_product_empty_out_net;
  logic [31:0] dot_product_result_out_net;
  logic  dot_product_rdy_out_net;
  logic  rst_and_startup_done_out_net;

  logic [31:0] dropped_commands;
  //synopsys translate_off
  KanagawaStringTable string_table(.clk(clk));
  //synopsys translate_on
  logic [11:0] reg_rst_delayed;
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
      logic [31:0] data_in;
      logic [31:0] data_out;
      logic overflow;
      logic underflow;
  } fifo_data_4;

  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [15:0] data;
      logic underflow;
  } passthrough_data_5;
  assign passthrough_data_5.underflow = 1'b0;
  assign passthrough_data_5.rdy_ext = passthrough_data_5.rdy_int & !(!has_startup_completed_delayed_0);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic underflow;
  } passthrough_data_6;
  assign passthrough_data_6.underflow = 1'b0;
  assign passthrough_data_6.rdy_ext = passthrough_data_6.rdy_int & !(!has_startup_completed_delayed_1);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic underflow;
  } passthrough_data_7;
  assign passthrough_data_7.underflow = 1'b0;
  assign passthrough_data_7.rdy_ext = passthrough_data_7.rdy_int & !(!has_startup_completed_delayed_2);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [31:0] data;
      logic underflow;
  } passthrough_data_8;
  assign passthrough_data_8.underflow = 1'b0;
  assign passthrough_data_8.rdy_ext = passthrough_data_8.rdy_int & !(!has_startup_completed_delayed_3);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic underflow;
  } passthrough_data_9;
  assign passthrough_data_9.underflow = 1'b0;
  assign passthrough_data_9.rdy_ext = passthrough_data_9.rdy_int & !(!has_startup_completed_delayed_4);
  assign dot_product_rdy_out_net = passthrough_data_5.rdy_ext;
  assign passthrough_data_5.valid = dot_product_rdy_out & dot_product_valid_in;
  assign passthrough_data_5.data = { dot_product_k_elem_in, dot_product_q_elem_in };
  assign fifo_data_0.rden = dot_product_rden_in;
  assign dot_product_result_out_net = fifo_data_0.data_out;
  assign dot_product_empty_out_net = fifo_data_0.empty;
  assign read_score_rdy_out_net = passthrough_data_6.rdy_ext;
  assign passthrough_data_6.valid = read_score_rdy_out & read_score_valid_in;
  assign fifo_data_1.rden = read_score_rden_in;
  assign read_score_result_out_net = fifo_data_1.data_out;
  assign read_score_empty_out_net = fifo_data_1.empty;
  assign clear_score_rdy_out_net = passthrough_data_7.rdy_ext;
  assign passthrough_data_7.valid = clear_score_rdy_out & clear_score_valid_in;
  assign fifo_data_2.rden = clear_score_rden_in;
  assign clear_score_empty_out_net = fifo_data_2.empty;
  assign set_max_score_rdy_out_net = passthrough_data_8.rdy_ext;
  assign passthrough_data_8.valid = set_max_score_rdy_out & set_max_score_valid_in;
  assign passthrough_data_8.data = { set_max_score_score_in };
  assign fifo_data_3.rden = set_max_score_rden_in;
  assign set_max_score_empty_out_net = fifo_data_3.empty;
  assign get_max_score_rdy_out_net = passthrough_data_9.rdy_ext;
  assign passthrough_data_9.valid = get_max_score_rdy_out & get_max_score_valid_in;
  assign fifo_data_4.rden = get_max_score_rden_in;
  assign get_max_score_result_out_net = fifo_data_4.data_out;
  assign get_max_score_empty_out_net = fifo_data_4.empty;
  always_comb begin
    rst_and_startup_done_out_net = _reset_control_rst_and_startup_done_out;
    reg_rst_delayed = _reset_control_rst_delayed_out;
    reset_sequence_finished_this_cycle = _reset_control_reset_sequence_finished_this_cycle_out;
    has_startup_completed_delayed_0 = _has_startup_completed_delayed_0_delay_chain_data_out;
    has_startup_completed_delayed_1 = _has_startup_completed_delayed_1_delay_chain_data_out;
    has_startup_completed_delayed_2 = _has_startup_completed_delayed_2_delay_chain_data_out;
    has_startup_completed_delayed_3 = _has_startup_completed_delayed_3_delay_chain_data_out;
    has_startup_completed_delayed_4 = _has_startup_completed_delayed_4_delay_chain_data_out;
    fifo_data_0.overflow = _fifo_0_dot_product_Return_overflow_out;
    fifo_data_0.underflow = _fifo_0_dot_product_Return_underflow_out;
    fifo_data_0.empty = _fifo_0_dot_product_Return_empty;
    fifo_data_0.almost_full = _fifo_0_dot_product_Return_full;
    fifo_data_0.data_out = _fifo_0_dot_product_Return_q;
    fifo_data_1.overflow = _fifo_1_read_score_Return_overflow_out;
    fifo_data_1.underflow = _fifo_1_read_score_Return_underflow_out;
    fifo_data_1.empty = _fifo_1_read_score_Return_empty;
    fifo_data_1.almost_full = _fifo_1_read_score_Return_full;
    fifo_data_1.data_out = _fifo_1_read_score_Return_q;
    fifo_data_2.overflow = _fifo_2_clear_score_Return_overflow_out;
    fifo_data_2.underflow = _fifo_2_clear_score_Return_underflow_out;
    fifo_data_2.empty = _fifo_2_clear_score_Return_empty;
    fifo_data_2.almost_full = _fifo_2_clear_score_Return_full;
    fifo_data_3.overflow = _fifo_3_set_max_score_Return_overflow_out;
    fifo_data_3.underflow = _fifo_3_set_max_score_Return_underflow_out;
    fifo_data_3.empty = _fifo_3_set_max_score_Return_empty;
    fifo_data_3.almost_full = _fifo_3_set_max_score_Return_full;
    fifo_data_4.overflow = _fifo_4_get_max_score_Return_overflow_out;
    fifo_data_4.underflow = _fifo_4_get_max_score_Return_underflow_out;
    fifo_data_4.empty = _fifo_4_get_max_score_Return_empty;
    fifo_data_4.almost_full = _fifo_4_get_max_score_Return_full;
    fifo_data_4.data_out = _fifo_4_get_max_score_Return_q;
    fifo_data_0.data_in = _dot_product_BasicBlock_0Impl_fifo_data_out_0;	// attention_unit.k:20:9
    fifo_data_0.wren = _dot_product_BasicBlock_0Impl_fifo_wren_0;	// attention_unit.k:20:9
    passthrough_data_5.rdy_int = _dot_product_BasicBlock_0Impl_input_rdy_0;	// attention_unit.k:20:9
    fifo_data_1.data_in = _read_score_BasicBlock_0Impl_fifo_data_out_0;	// attention_unit.k:73:9
    fifo_data_1.wren = _read_score_BasicBlock_0Impl_fifo_wren_0;	// attention_unit.k:73:9
    passthrough_data_6.rdy_int = _read_score_BasicBlock_0Impl_input_rdy_0;	// attention_unit.k:73:9
    fifo_data_2.wren = _clear_score_BasicBlock_0Impl_fifo_wren_0;	// attention_unit.k:79:9
    passthrough_data_7.rdy_int = _clear_score_BasicBlock_0Impl_input_rdy_0;	// attention_unit.k:79:9
    fifo_data_3.wren = _set_max_score_BasicBlock_0Impl_fifo_wren_0;	// attention_unit.k:88:9
    passthrough_data_8.rdy_int = _set_max_score_BasicBlock_0Impl_input_rdy_0;	// attention_unit.k:88:9
    fifo_data_4.data_in = _get_max_score_BasicBlock_0Impl_fifo_data_out_0;	// attention_unit.k:97:9
    fifo_data_4.wren = _get_max_score_BasicBlock_0Impl_fifo_wren_0;	// attention_unit.k:97:9
    passthrough_data_9.rdy_int = _get_max_score_BasicBlock_0Impl_input_rdy_0;	// attention_unit.k:97:9
  end // always_comb

  assign has_startup_completed_raw = 1'b1;
  assign stall_rate_supported_out_net = 1'b0;
  KanagawaResetControl #(
    .WIDTH(12),
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
  attention_unit_reg_32_w2_v_1_32_0_i_32_0 _score_accum (	// attention_unit.k:12:5
    .clk           (clk),	// attention_unit.k:12:5
    .rst           (reg_rst_delayed[0]),	// attention_unit.k:12:5
    .input_valid_0 (_dot_product_BasicBlock_0Impl_global_out__score_accum_6_0_valid),	// attention_unit.k:20:9
    .input_0       (_dot_product_BasicBlock_0Impl_global_out__score_accum_6_0),	// attention_unit.k:20:9
    .input_valid_1 (_clear_score_BasicBlock_0Impl_global_out__score_accum_6_1_valid),	// attention_unit.k:79:9
    .value_out     (__score_accum_value_out)
  );	// attention_unit.k:12:5
  attention_unit_reg_32_w1_i_32_0 _max_score (	// attention_unit.k:13:5
    .clk           (clk),	// attention_unit.k:12:5
    .rst           (reg_rst_delayed[1]),	// attention_unit.k:13:5
    .input_valid_0 (_set_max_score_BasicBlock_0Impl_global_out__max_score_7_0_valid),	// attention_unit.k:88:9
    .input_0       (_set_max_score_BasicBlock_0Impl_global_out__max_score_7_0),	// attention_unit.k:88:9
    .value_out     (__max_score_value_out)
  );	// attention_unit.k:13:5
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
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(32),
    .PORT_WIDTH(32),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_0_dot_product_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(4),
    .USE_LUTRAM(1)
  ) fifo_0_dot_product_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[2]),
    .overflow_out  (_fifo_0_dot_product_Return_overflow_out),
    .underflow_out (_fifo_0_dot_product_Return_underflow_out),
    .empty         (_fifo_0_dot_product_Return_empty),
    .rdreq         (fifo_data_0.rden),
    .full          (_fifo_0_dot_product_Return_full),
    .wrreq         (fifo_data_0.wren),
    .data          (fifo_data_0.data_in),
    .q             (_fifo_0_dot_product_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(32),
    .PORT_WIDTH(32),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_1_read_score_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(1)
  ) fifo_1_read_score_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[3]),
    .overflow_out  (_fifo_1_read_score_Return_overflow_out),
    .underflow_out (_fifo_1_read_score_Return_underflow_out),
    .empty         (_fifo_1_read_score_Return_empty),
    .rdreq         (fifo_data_1.rden),
    .full          (_fifo_1_read_score_Return_full),
    .wrreq         (fifo_data_1.wren),
    .data          (fifo_data_1.data_in),
    .q             (_fifo_1_read_score_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(0),
    .PORT_WIDTH(1),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_2_clear_score_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(0)
  ) fifo_2_clear_score_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[4]),
    .overflow_out  (_fifo_2_clear_score_Return_overflow_out),
    .underflow_out (_fifo_2_clear_score_Return_underflow_out),
    .empty         (_fifo_2_clear_score_Return_empty),
    .rdreq         (fifo_data_2.rden),
    .full          (_fifo_2_clear_score_Return_full),
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
    .AUTO_PIPELINE_GROUP("fifo_3_set_max_score_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(0)
  ) fifo_3_set_max_score_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[5]),
    .overflow_out  (_fifo_3_set_max_score_Return_overflow_out),
    .underflow_out (_fifo_3_set_max_score_Return_underflow_out),
    .empty         (_fifo_3_set_max_score_Return_empty),
    .rdreq         (fifo_data_3.rden),
    .full          (_fifo_3_set_max_score_Return_full),
    .wrreq         (fifo_data_3.wren),
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
    .AUTO_PIPELINE_GROUP("fifo_4_get_max_score_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(1)
  ) fifo_4_get_max_score_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[6]),
    .overflow_out  (_fifo_4_get_max_score_Return_overflow_out),
    .underflow_out (_fifo_4_get_max_score_Return_underflow_out),
    .empty         (_fifo_4_get_max_score_Return_empty),
    .rdreq         (fifo_data_4.rden),
    .full          (_fifo_4_get_max_score_Return_full),
    .wrreq         (fifo_data_4.wren),
    .data          (fifo_data_4.data_in),
    .q             (_fifo_4_get_max_score_Return_q)
  );
  attention_unit_dot_product_BasicBlock_0 dot_product_BasicBlock_0Impl (	// attention_unit.k:20:9
    .clk                               (clk),	// attention_unit.k:20:9
    .rst                               (reg_rst_delayed[7]),	// attention_unit.k:20:9
    .done_out                          (/* unused */),
    .global_in__score_accum_6          (__score_accum_value_out),	// attention_unit.k:12:5
    .global_out__score_accum_6_0_valid
      (_dot_product_BasicBlock_0Impl_global_out__score_accum_6_0_valid),
    .global_out__score_accum_6_0
      (_dot_product_BasicBlock_0Impl_global_out__score_accum_6_0),
    .fifo_data_out_0                   (_dot_product_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0                       (_dot_product_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0         (fifo_data_0.almost_full),	// attention_unit.k:20:9
    .fifo_overflow_in_0                (fifo_data_0.overflow),	// attention_unit.k:20:9
    .data_in_5                         (passthrough_data_5.data),	// attention_unit.k:20:9
    .input_fifo_underflow_0            (passthrough_data_5.underflow),	// attention_unit.k:20:9
    .input_rdy_0                       (_dot_product_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0                     (passthrough_data_5.valid),	// attention_unit.k:20:9
    .control_state_out                 (/* unused */)
  );	// attention_unit.k:20:9
  attention_unit_read_score_BasicBlock_0 read_score_BasicBlock_0Impl (	// attention_unit.k:73:9
    .clk                       (clk),	// attention_unit.k:73:9
    .rst                       (reg_rst_delayed[8]),	// attention_unit.k:73:9
    .done_out                  (/* unused */),
    .global_in__score_accum_6  (__score_accum_value_out),	// attention_unit.k:12:5
    .fifo_data_out_0           (_read_score_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0               (_read_score_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_1.almost_full),	// attention_unit.k:73:9
    .fifo_overflow_in_0        (fifo_data_1.overflow),	// attention_unit.k:73:9
    .input_fifo_underflow_0    (passthrough_data_6.underflow),	// attention_unit.k:73:9
    .input_rdy_0               (_read_score_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_6.valid),	// attention_unit.k:73:9
    .control_state_out         (/* unused */)
  );	// attention_unit.k:73:9
  attention_unit_clear_score_BasicBlock_0 clear_score_BasicBlock_0Impl (	// attention_unit.k:79:9
    .clk                               (clk),	// attention_unit.k:79:9
    .rst                               (reg_rst_delayed[9]),	// attention_unit.k:79:9
    .done_out                          (/* unused */),
    .global_out__score_accum_6_1_valid
      (_clear_score_BasicBlock_0Impl_global_out__score_accum_6_1_valid),
    .fifo_wren_0                       (_clear_score_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0         (fifo_data_2.almost_full),	// attention_unit.k:79:9
    .fifo_overflow_in_0                (fifo_data_2.overflow),	// attention_unit.k:79:9
    .input_fifo_underflow_0            (passthrough_data_7.underflow),	// attention_unit.k:79:9
    .input_rdy_0                       (_clear_score_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0                     (passthrough_data_7.valid),	// attention_unit.k:79:9
    .control_state_out                 (/* unused */)
  );	// attention_unit.k:79:9
  attention_unit_set_max_score_BasicBlock_0 set_max_score_BasicBlock_0Impl (	// attention_unit.k:88:9
    .clk                             (clk),	// attention_unit.k:88:9
    .rst                             (reg_rst_delayed[10]),	// attention_unit.k:88:9
    .done_out                        (/* unused */),
    .global_out__max_score_7_0_valid
      (_set_max_score_BasicBlock_0Impl_global_out__max_score_7_0_valid),
    .global_out__max_score_7_0
      (_set_max_score_BasicBlock_0Impl_global_out__max_score_7_0),
    .fifo_wren_0                     (_set_max_score_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0       (fifo_data_3.almost_full),	// attention_unit.k:88:9
    .fifo_overflow_in_0              (fifo_data_3.overflow),	// attention_unit.k:88:9
    .data_in_8                       (passthrough_data_8.data),	// attention_unit.k:88:9
    .input_fifo_underflow_0          (passthrough_data_8.underflow),	// attention_unit.k:88:9
    .input_rdy_0                     (_set_max_score_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0                   (passthrough_data_8.valid),	// attention_unit.k:88:9
    .control_state_out               (/* unused */)
  );	// attention_unit.k:88:9
  attention_unit_get_max_score_BasicBlock_0 get_max_score_BasicBlock_0Impl (	// attention_unit.k:97:9
    .clk                       (clk),	// attention_unit.k:97:9
    .rst                       (reg_rst_delayed[11]),	// attention_unit.k:97:9
    .done_out                  (/* unused */),
    .global_in__max_score_7    (__max_score_value_out),	// attention_unit.k:13:5
    .fifo_data_out_0           (_get_max_score_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0               (_get_max_score_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_4.almost_full),	// attention_unit.k:97:9
    .fifo_overflow_in_0        (fifo_data_4.overflow),	// attention_unit.k:97:9
    .input_fifo_underflow_0    (passthrough_data_9.underflow),	// attention_unit.k:97:9
    .input_rdy_0               (_get_max_score_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_9.valid),	// attention_unit.k:97:9
    .control_state_out         (/* unused */)
  );	// attention_unit.k:97:9
  assign rst_and_startup_done_out = rst_and_startup_done_out_net;
  assign dot_product_rdy_out = dot_product_rdy_out_net;
  assign dot_product_empty_out = dot_product_empty_out_net;
  assign dot_product_result_out = dot_product_result_out_net;
  assign read_score_rdy_out = read_score_rdy_out_net;
  assign read_score_empty_out = read_score_empty_out_net;
  assign read_score_result_out = read_score_result_out_net;
  assign clear_score_rdy_out = clear_score_rdy_out_net;
  assign clear_score_empty_out = clear_score_empty_out_net;
  assign set_max_score_rdy_out = set_max_score_rdy_out_net;
  assign set_max_score_empty_out = set_max_score_empty_out_net;
  assign get_max_score_rdy_out = get_max_score_rdy_out_net;
  assign get_max_score_empty_out = get_max_score_empty_out_net;
  assign get_max_score_result_out = get_max_score_result_out_net;
  assign stall_rate_supported_out = stall_rate_supported_out_net;
endmodule

module attention_unit_EsiWrapper(
     input  wire                                                          clk,
     input  wire                                                          rst,
     input  wire [2:0]                                                    stall_rate_in,
     input  wire                                                          stall_rate_valid_in,
  // input  wire /*Zero Width*/                                           clear_score_arg,
     input  wire                                                          clear_score_arg_valid,
     input  wire struct packed {logic [7:0] q_elem; logic [7:0] k_elem; } dot_product_arg,
     input  wire                                                          dot_product_arg_valid,
  // input  wire /*Zero Width*/                                           get_max_score_arg,
     input  wire                                                          get_max_score_arg_valid,
  // input  wire /*Zero Width*/                                           read_score_arg,
     input  wire                                                          read_score_arg_valid,
     input  wire struct packed {logic [31:0] score; }                     set_max_score_arg,
     input  wire                                                          set_max_score_arg_valid,
     input  wire                                                          clear_score_result_rden,
     input  wire                                                          dot_product_result_rden,
     input  wire                                                          get_max_score_result_rden,
     input  wire                                                          read_score_result_rden,
     input  wire                                                          set_max_score_result_rden,
     output wire                                                          clear_score_arg_ready,
     output wire                                                          dot_product_arg_ready,
     output wire                                                          get_max_score_arg_ready,
     output wire                                                          read_score_arg_ready,
     output wire                                                          set_max_score_arg_ready,
  // output wire /*Zero Width*/                                           clear_score_result,
     output wire                                                          clear_score_result_empty,
     output wire [31:0]                                                   dot_product_result,
     output wire                                                          dot_product_result_empty,
     output wire [31:0]                                                   get_max_score_result,
     output wire                                                          get_max_score_result_empty,
     output wire [31:0]                                                   read_score_result,
     output wire                                                          read_score_result_empty,
  // output wire /*Zero Width*/                                           set_max_score_result,
     output wire                                                          set_max_score_result_empty,
     output wire                                                          rst_and_startup_done_out,
     output wire                                                          stall_rate_supported_out
);

  wire [31:0] _EsiWrapped_dot_product_result_out;
  wire [31:0] _EsiWrapped_read_score_result_out;
  wire [31:0] _EsiWrapped_get_max_score_result_out;
  attention_unit EsiWrapped (
    .clk                      (clk),
    .rst                      (rst),
    .dot_product_valid_in     (dot_product_arg_valid),
    .dot_product_q_elem_in    (dot_product_arg.q_elem),
    .dot_product_k_elem_in    (dot_product_arg.k_elem),
    .dot_product_rden_in      (dot_product_result_rden),
    .read_score_valid_in      (read_score_arg_valid),
    .read_score_rden_in       (read_score_result_rden),
    .clear_score_valid_in     (clear_score_arg_valid),
    .clear_score_rden_in      (clear_score_result_rden),
    .set_max_score_valid_in   (set_max_score_arg_valid),
    .set_max_score_score_in   (set_max_score_arg.score),
    .set_max_score_rden_in    (set_max_score_result_rden),
    .get_max_score_valid_in   (get_max_score_arg_valid),
    .get_max_score_rden_in    (get_max_score_result_rden),
    .stall_rate_in            (stall_rate_in),
    .stall_rate_valid_in      (stall_rate_valid_in),
    .rst_and_startup_done_out (rst_and_startup_done_out),
    .dot_product_rdy_out      (dot_product_arg_ready),
    .dot_product_empty_out    (dot_product_result_empty),
    .dot_product_result_out   (_EsiWrapped_dot_product_result_out),
    .read_score_rdy_out       (read_score_arg_ready),
    .read_score_empty_out     (read_score_result_empty),
    .read_score_result_out    (_EsiWrapped_read_score_result_out),
    .clear_score_rdy_out      (clear_score_arg_ready),
    .clear_score_empty_out    (clear_score_result_empty),
    .set_max_score_rdy_out    (set_max_score_arg_ready),
    .set_max_score_empty_out  (set_max_score_result_empty),
    .get_max_score_rdy_out    (get_max_score_arg_ready),
    .get_max_score_empty_out  (get_max_score_result_empty),
    .get_max_score_result_out (_EsiWrapped_get_max_score_result_out),
    .stall_rate_supported_out (stall_rate_supported_out)
  );
  // Zero width: assign clear_score_result = /*Zero width*/;
  assign dot_product_result = _EsiWrapped_dot_product_result_out;
  assign get_max_score_result = _EsiWrapped_get_max_score_result_out;
  assign read_score_result = _EsiWrapped_read_score_result_out;
  // Zero width: assign set_max_score_result = /*Zero width*/;
endmodule

