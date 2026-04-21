
// This file was generated. Do not modify.
// kanagawa --backend=sv --import-dir=/home/mana/workspace/OpenTaalas/third-party/kanagawa/library --base-library=/home/mana/workspace/OpenTaalas/third-party/kanagawa/library/mini-base.k --output=/home/mana/workspace/OpenTaalas/rtl/generated/kanagawa/mac_pe /home/mana/workspace/OpenTaalas/rtl/kanagawa/mac_pe.k

`default_nettype wire
module mac_peDebugView_macEntry
(
    input wire clk,
    input wire[3:0]  _magnitude,
    input wire _sign_bit,
    input wire[7:0]  _activation,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("macEntry time: %0t magnitude: %p sign_bit: %p activation: %p", $time, _magnitude, _sign_bit, _activation);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module mac_peDebugView_macExit
(
    input wire clk,
    input wire[23:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("macExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module mac_peDebugView_read_accumExit
(
    input wire clk,
    input wire[23:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("read_accumExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
`ifndef _TYPESCOPE_CoreModuleTypeScope
`define _TYPESCOPE_CoreModuleTypeScope
`endif // _TYPESCOPE_CoreModuleTypeScope
module mac_pe_clear_BasicBlock_0(	// mac_pe.k:52:9
  input  wire       clk,
  input  wire       rst,
  output wire       done_out,
  output wire       global_out__accum_5_1_valid,
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
  logic       done_out_0;	// mac_pe.k:52:9
  logic       global_out__accum_5_1_valid_0;	// mac_pe.k:52:9
  logic       fifo_wren_0_0;	// mac_pe.k:52:9
  logic       input_rdy_0_0;	// mac_pe.k:52:9
  logic [7:0] control_state_out_0;	// mac_pe.k:52:9
  wire        _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// mac_pe.k:52:9
  always_comb begin	// mac_pe.k:52:9
    input_rdy_0_0 = _GEN;	// mac_pe.k:52:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// mac_pe.k:52:9
  end // always_comb
  reg         p0_stage1_enable = 1'h0;	// mac_pe.k:52:9
  always_comb	// mac_pe.k:52:9
    global_out__accum_5_1_valid_0 = p0_stage1_enable;	// mac_pe.k:52:9
  reg         p0_stage2_enable = 1'h0;	// mac_pe.k:52:9
  always @(posedge clk) begin	// mac_pe.k:52:9
    if (rst) begin	// mac_pe.k:52:9
      p0_stage1_enable <= 1'h0;	// mac_pe.k:52:9
      p0_stage2_enable <= 1'h0;	// mac_pe.k:52:9
    end
    else begin	// mac_pe.k:52:9
      p0_stage1_enable <= _GEN & input_valid_0;	// mac_pe.k:52:9
      p0_stage2_enable <= p0_stage1_enable;	// mac_pe.k:52:9
    end
  end // always @(posedge)
  always_comb	// mac_pe.k:52:9
    fifo_wren_0_0 = p0_stage2_enable;	// mac_pe.k:52:9, :56:9
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// mac_pe.k:52:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// mac_pe.k:52:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  assign done_out = p0_stage2_enable;	// mac_pe.k:52:9
  assign global_out__accum_5_1_valid = global_out__accum_5_1_valid_0;	// mac_pe.k:52:9
  assign fifo_wren_0 = fifo_wren_0_0;	// mac_pe.k:52:9
  assign input_rdy_0 = input_rdy_0_0;	// mac_pe.k:52:9
  assign control_state_out = control_state_out_0;	// mac_pe.k:52:9
endmodule

module mac_pe_read_accum_BasicBlock_0(	// mac_pe.k:47:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  input  wire [23:0] global_in__accum_5,
  output wire [23:0] fifo_data_out_0,
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
  wire  [23:0] global_in__accum_5_0 = global_in__accum_5;	// mac_pe.k:47:9
  logic        done_out_0;	// mac_pe.k:47:9
  logic [23:0] fifo_data_out_0_0;	// mac_pe.k:47:9
  logic        fifo_wren_0_0;	// mac_pe.k:47:9
  logic        input_rdy_0_0;	// mac_pe.k:47:9
  logic [7:0]  control_state_out_0;	// mac_pe.k:47:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// mac_pe.k:47:9
  always_comb begin	// mac_pe.k:47:9
    input_rdy_0_0 = _GEN;	// mac_pe.k:47:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// mac_pe.k:47:9
  end // always_comb
  reg          p0_stage1_enable = 1'h0;	// mac_pe.k:47:9
  reg   [23:0] p0_global_in__accum_5;	// mac_pe.k:47:9
  reg          p0_stage2_enable = 1'h0;	// mac_pe.k:47:9
  always @(posedge clk) begin	// mac_pe.k:47:9
    if (rst)	// mac_pe.k:47:9
      p0_stage1_enable <= 1'h0;	// mac_pe.k:47:9
    else	// mac_pe.k:47:9
      p0_stage1_enable <= _GEN & input_valid_0;	// mac_pe.k:47:9
    p0_global_in__accum_5 <= global_in__accum_5_0;	// mac_pe.k:47:9
    if (rst)	// mac_pe.k:47:9
      p0_stage2_enable <= 1'h0;	// mac_pe.k:47:9
    else	// mac_pe.k:47:9
      p0_stage2_enable <= p0_stage1_enable;	// mac_pe.k:47:9
  end // always @(posedge)
  always_comb begin	// mac_pe.k:47:9
    fifo_wren_0_0 = p0_stage2_enable;	// mac_pe.k:45:5, :47:9
    fifo_data_out_0_0 = p0_global_in__accum_5;	// mac_pe.k:45:5, :47:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// mac_pe.k:47:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// mac_pe.k:47:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  mac_peDebugView_read_accumExit mac_peDebugView_read_accumExit_instance (	// mac_pe.k:45:5
    .clk          (clk),	// mac_pe.k:45:5
    ._ReturnValue (p0_stage1_enable ? global_in__accum_5_0 : 'x),	// mac_pe.k:45:5, :47:9
    .valid        (p0_stage1_enable),	// mac_pe.k:47:9
    .valid_out    (/* unused */)
  );	// mac_pe.k:45:5
  assign done_out = p0_stage2_enable;	// mac_pe.k:47:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// mac_pe.k:47:9
  assign fifo_wren_0 = fifo_wren_0_0;	// mac_pe.k:47:9
  assign input_rdy_0 = input_rdy_0_0;	// mac_pe.k:47:9
  assign control_state_out = control_state_out_0;	// mac_pe.k:47:9
endmodule

module mac_pe_mac_BasicBlock_0(	// mac_pe.k:18:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  input  wire [23:0] global_in__accum_5,
  output wire        global_out__accum_5_0_valid,
  output wire [23:0] global_out__accum_5_0,
  output wire [23:0] fifo_data_out_0,
  output wire        fifo_wren_0,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [12:0] data_in_3,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  wire  [23:0] global_in__accum_5_0 = global_in__accum_5;	// mac_pe.k:18:9
  logic        done_out_0;	// mac_pe.k:18:9
  logic        global_out__accum_5_0_valid_0;	// mac_pe.k:18:9
  logic [23:0] global_out__accum_5_0_0;	// mac_pe.k:18:9
  logic [23:0] fifo_data_out_0_0;	// mac_pe.k:18:9
  logic        fifo_wren_0_0;	// mac_pe.k:18:9
  logic        input_rdy_0_0;	// mac_pe.k:18:9
  logic [7:0]  control_state_out_0;	// mac_pe.k:18:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// mac_pe.k:18:9
  always_comb begin	// mac_pe.k:18:9
    input_rdy_0_0 = _GEN;	// mac_pe.k:18:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// mac_pe.k:18:9
  end // always_comb
  reg   [3:0]  p0_magnitude;	// mac_pe.k:18:9
  reg          p0_sign_bit;	// mac_pe.k:18:9
  reg   [7:0]  p0_activation;	// mac_pe.k:18:9
  reg          p0_stage1_enable = 1'h0;	// mac_pe.k:18:9
  wire         ka = p0_activation[7] & p0_magnitude[1];	// mac_pe.k:18:9, :21:25, :22:{29,43}, :26:{13,17}
  wire         ka_0 = p0_activation[7] & p0_magnitude[1];	// mac_pe.k:18:9, :22:{29,43}, :26:{13,17}
  wire         ka_1 = p0_activation[6] & p0_magnitude[1];	// mac_pe.k:18:9, :22:{29,43}, :26:{13,17}
  wire         ka_2 = p0_activation[5] & p0_magnitude[1];	// mac_pe.k:18:9, :22:{29,43}, :26:{13,17}
  wire         ka_3 = p0_activation[4] & p0_magnitude[1];	// mac_pe.k:18:9, :22:{29,43}, :26:{13,17}
  wire         ka_4 = p0_activation[3] & p0_magnitude[1];	// mac_pe.k:18:9, :22:{29,43}, :26:{13,17}
  wire         ka_5 = p0_activation[2] & p0_magnitude[1];	// mac_pe.k:18:9, :22:{29,43}, :26:{13,17}
  wire         ka_6 = p0_activation[1] & p0_magnitude[1];	// mac_pe.k:18:9, :22:{29,43}, :26:{13,17}
  wire         ka_7 = p0_activation[0] & p0_magnitude[1];	// mac_pe.k:18:9, :22:{29,43}, :26:{13,17}
  wire  [22:0] _ka_plus_a_shl_1_ =
    23'({{15{ka}}, ka_0, ka_1, ka_2, ka_3, ka_4, ka_5, ka_6, ka_7}
        + {{14{p0_activation[7]}}, p0_activation, 1'h0});	// mac_pe.k:18:9, :21:25, :26:{13,17}, :27:{42,47}
  wire         _GEN_0 = ka | p0_magnitude[2];	// mac_pe.k:18:9, :22:{29,43}, :26:{13,17}, :27:{13,17}
  wire         _GEN_1 = ka & ~(p0_magnitude[2]);	// mac_pe.k:18:9, :22:{29,43}, :26:{13,17}, :27:{13,17}
  wire         ka_8 = _ka_plus_a_shl_1_[22] ? _GEN_0 : _GEN_1;	// mac_pe.k:27:{13,17,42}
  wire         ka_9 = _ka_plus_a_shl_1_[21] ? _GEN_0 : _GEN_1;	// mac_pe.k:27:{13,17,42}
  wire         ka_10 = _ka_plus_a_shl_1_[20] ? _GEN_0 : _GEN_1;	// mac_pe.k:27:{13,17,42}
  wire         ka_11 = _ka_plus_a_shl_1_[19] ? _GEN_0 : _GEN_1;	// mac_pe.k:27:{13,17,42}
  wire         ka_12 = _ka_plus_a_shl_1_[18] ? _GEN_0 : _GEN_1;	// mac_pe.k:27:{13,17,42}
  wire         ka_13 = _ka_plus_a_shl_1_[17] ? _GEN_0 : _GEN_1;	// mac_pe.k:27:{13,17,42}
  wire         ka_14 = _ka_plus_a_shl_1_[16] ? _GEN_0 : _GEN_1;	// mac_pe.k:27:{13,17,42}
  wire         ka_15 = _ka_plus_a_shl_1_[15] ? _GEN_0 : _GEN_1;	// mac_pe.k:27:{13,17,42}
  wire         ka_16 = _ka_plus_a_shl_1_[14] ? _GEN_0 : _GEN_1;	// mac_pe.k:27:{13,17,42}
  wire         ka_17 = _ka_plus_a_shl_1_[13] ? _GEN_0 : _GEN_1;	// mac_pe.k:27:{13,17,42}
  wire         ka_18 = _ka_plus_a_shl_1_[12] ? _GEN_0 : _GEN_1;	// mac_pe.k:27:{13,17,42}
  wire         ka_19 = _ka_plus_a_shl_1_[11] ? _GEN_0 : _GEN_1;	// mac_pe.k:27:{13,17,42}
  wire         ka_20 = _ka_plus_a_shl_1_[10] ? _GEN_0 : _GEN_1;	// mac_pe.k:27:{13,17,42}
  wire         ka_21 = _ka_plus_a_shl_1_[9] ? _GEN_0 : _GEN_1;	// mac_pe.k:27:{13,17,42}
  wire         ka_22 = _ka_plus_a_shl_1_[8] ? _GEN_0 : _GEN_1;	// mac_pe.k:27:{13,17,42}
  wire         ka_23 =
    _ka_plus_a_shl_1_[7] ? ka_0 | p0_magnitude[2] : ka_0 & ~(p0_magnitude[2]);	// mac_pe.k:18:9, :22:{29,43}, :26:{13,17}, :27:{13,17,42}
  wire         ka_24 =
    _ka_plus_a_shl_1_[6] ? ka_1 | p0_magnitude[2] : ka_1 & ~(p0_magnitude[2]);	// mac_pe.k:18:9, :22:{29,43}, :26:{13,17}, :27:{13,17,42}
  wire         ka_25 =
    _ka_plus_a_shl_1_[5] ? ka_2 | p0_magnitude[2] : ka_2 & ~(p0_magnitude[2]);	// mac_pe.k:18:9, :22:{29,43}, :26:{13,17}, :27:{13,17,42}
  wire         ka_26 =
    _ka_plus_a_shl_1_[4] ? ka_3 | p0_magnitude[2] : ka_3 & ~(p0_magnitude[2]);	// mac_pe.k:18:9, :22:{29,43}, :26:{13,17}, :27:{13,17,42}
  wire         ka_27 =
    _ka_plus_a_shl_1_[3] ? ka_4 | p0_magnitude[2] : ka_4 & ~(p0_magnitude[2]);	// mac_pe.k:18:9, :22:{29,43}, :26:{13,17}, :27:{13,17,42}
  wire         ka_28 =
    _ka_plus_a_shl_1_[2] ? ka_5 | p0_magnitude[2] : ka_5 & ~(p0_magnitude[2]);	// mac_pe.k:18:9, :22:{29,43}, :26:{13,17}, :27:{13,17,42}
  wire         ka_29 =
    _ka_plus_a_shl_1_[1] ? ka_6 | p0_magnitude[2] : ka_6 & ~(p0_magnitude[2]);	// mac_pe.k:18:9, :22:{29,43}, :26:{13,17}, :27:{13,17,42}
  wire         ka_30 =
    _ka_plus_a_shl_1_[0] ? ka_7 | p0_magnitude[2] : ka_7 & ~(p0_magnitude[2]);	// mac_pe.k:18:9, :22:{29,43}, :26:{13,17}, :27:{13,17,42}
  wire  [22:0] _ka_plus_a_shl_2_ =
    23'({ka_8,
         ka_9,
         ka_10,
         ka_11,
         ka_12,
         ka_13,
         ka_14,
         ka_15,
         ka_16,
         ka_17,
         ka_18,
         ka_19,
         ka_20,
         ka_21,
         ka_22,
         ka_23,
         ka_24,
         ka_25,
         ka_26,
         ka_27,
         ka_28,
         ka_29,
         ka_30} + {{13{p0_activation[7]}}, p0_activation, 2'h0});	// mac_pe.k:18:9, :21:25, :27:{13,17}, :28:{42,47}
  wire  [23:0] _ka_shl_1_plus_a_ =
    24'({_ka_plus_a_shl_2_[22] ? ka_8 | p0_magnitude[3] : ka_8 & ~(p0_magnitude[3]),
         _ka_plus_a_shl_2_[21] ? ka_9 | p0_magnitude[3] : ka_9 & ~(p0_magnitude[3]),
         _ka_plus_a_shl_2_[20] ? ka_10 | p0_magnitude[3] : ka_10 & ~(p0_magnitude[3]),
         _ka_plus_a_shl_2_[19] ? ka_11 | p0_magnitude[3] : ka_11 & ~(p0_magnitude[3]),
         _ka_plus_a_shl_2_[18] ? ka_12 | p0_magnitude[3] : ka_12 & ~(p0_magnitude[3]),
         _ka_plus_a_shl_2_[17] ? ka_13 | p0_magnitude[3] : ka_13 & ~(p0_magnitude[3]),
         _ka_plus_a_shl_2_[16] ? ka_14 | p0_magnitude[3] : ka_14 & ~(p0_magnitude[3]),
         _ka_plus_a_shl_2_[15] ? ka_15 | p0_magnitude[3] : ka_15 & ~(p0_magnitude[3]),
         _ka_plus_a_shl_2_[14] ? ka_16 | p0_magnitude[3] : ka_16 & ~(p0_magnitude[3]),
         _ka_plus_a_shl_2_[13] ? ka_17 | p0_magnitude[3] : ka_17 & ~(p0_magnitude[3]),
         _ka_plus_a_shl_2_[12] ? ka_18 | p0_magnitude[3] : ka_18 & ~(p0_magnitude[3]),
         _ka_plus_a_shl_2_[11] ? ka_19 | p0_magnitude[3] : ka_19 & ~(p0_magnitude[3]),
         _ka_plus_a_shl_2_[10] ? ka_20 | p0_magnitude[3] : ka_20 & ~(p0_magnitude[3]),
         _ka_plus_a_shl_2_[9] ? ka_21 | p0_magnitude[3] : ka_21 & ~(p0_magnitude[3]),
         _ka_plus_a_shl_2_[8] ? ka_22 | p0_magnitude[3] : ka_22 & ~(p0_magnitude[3]),
         _ka_plus_a_shl_2_[7] ? ka_23 | p0_magnitude[3] : ka_23 & ~(p0_magnitude[3]),
         _ka_plus_a_shl_2_[6] ? ka_24 | p0_magnitude[3] : ka_24 & ~(p0_magnitude[3]),
         _ka_plus_a_shl_2_[5] ? ka_25 | p0_magnitude[3] : ka_25 & ~(p0_magnitude[3]),
         _ka_plus_a_shl_2_[4] ? ka_26 | p0_magnitude[3] : ka_26 & ~(p0_magnitude[3]),
         _ka_plus_a_shl_2_[3] ? ka_27 | p0_magnitude[3] : ka_27 & ~(p0_magnitude[3]),
         _ka_plus_a_shl_2_[2] ? ka_28 | p0_magnitude[3] : ka_28 & ~(p0_magnitude[3]),
         _ka_plus_a_shl_2_[1] ? ka_29 | p0_magnitude[3] : ka_29 & ~(p0_magnitude[3]),
         _ka_plus_a_shl_2_[0] ? ka_30 | p0_magnitude[3] : ka_30 & ~(p0_magnitude[3]),
         1'h0} + {{16{p0_activation[7]}}, p0_activation});	// mac_pe.k:18:9, :21:25, :22:{29,43}, :27:{13,17}, :28:{13,17,42}, :31:31
  wire  [23:0] _0_minus_product_ = 24'(24'h0 - _ka_shl_1_plus_a_);	// mac_pe.k:31:31, :36:27
  wire  [23:0] _accum_plus_product_ =
    24'(global_in__accum_5_0
        + {_0_minus_product_[23]
             ? _ka_shl_1_plus_a_[23] | p0_sign_bit
             : _ka_shl_1_plus_a_[23] & ~p0_sign_bit,
           _0_minus_product_[22]
             ? _ka_shl_1_plus_a_[22] | p0_sign_bit
             : _ka_shl_1_plus_a_[22] & ~p0_sign_bit,
           _0_minus_product_[21]
             ? _ka_shl_1_plus_a_[21] | p0_sign_bit
             : _ka_shl_1_plus_a_[21] & ~p0_sign_bit,
           _0_minus_product_[20]
             ? _ka_shl_1_plus_a_[20] | p0_sign_bit
             : _ka_shl_1_plus_a_[20] & ~p0_sign_bit,
           _0_minus_product_[19]
             ? _ka_shl_1_plus_a_[19] | p0_sign_bit
             : _ka_shl_1_plus_a_[19] & ~p0_sign_bit,
           _0_minus_product_[18]
             ? _ka_shl_1_plus_a_[18] | p0_sign_bit
             : _ka_shl_1_plus_a_[18] & ~p0_sign_bit,
           _0_minus_product_[17]
             ? _ka_shl_1_plus_a_[17] | p0_sign_bit
             : _ka_shl_1_plus_a_[17] & ~p0_sign_bit,
           _0_minus_product_[16]
             ? _ka_shl_1_plus_a_[16] | p0_sign_bit
             : _ka_shl_1_plus_a_[16] & ~p0_sign_bit,
           _0_minus_product_[15]
             ? _ka_shl_1_plus_a_[15] | p0_sign_bit
             : _ka_shl_1_plus_a_[15] & ~p0_sign_bit,
           _0_minus_product_[14]
             ? _ka_shl_1_plus_a_[14] | p0_sign_bit
             : _ka_shl_1_plus_a_[14] & ~p0_sign_bit,
           _0_minus_product_[13]
             ? _ka_shl_1_plus_a_[13] | p0_sign_bit
             : _ka_shl_1_plus_a_[13] & ~p0_sign_bit,
           _0_minus_product_[12]
             ? _ka_shl_1_plus_a_[12] | p0_sign_bit
             : _ka_shl_1_plus_a_[12] & ~p0_sign_bit,
           _0_minus_product_[11]
             ? _ka_shl_1_plus_a_[11] | p0_sign_bit
             : _ka_shl_1_plus_a_[11] & ~p0_sign_bit,
           _0_minus_product_[10]
             ? _ka_shl_1_plus_a_[10] | p0_sign_bit
             : _ka_shl_1_plus_a_[10] & ~p0_sign_bit,
           _0_minus_product_[9]
             ? _ka_shl_1_plus_a_[9] | p0_sign_bit
             : _ka_shl_1_plus_a_[9] & ~p0_sign_bit,
           _0_minus_product_[8]
             ? _ka_shl_1_plus_a_[8] | p0_sign_bit
             : _ka_shl_1_plus_a_[8] & ~p0_sign_bit,
           _0_minus_product_[7]
             ? _ka_shl_1_plus_a_[7] | p0_sign_bit
             : _ka_shl_1_plus_a_[7] & ~p0_sign_bit,
           _0_minus_product_[6]
             ? _ka_shl_1_plus_a_[6] | p0_sign_bit
             : _ka_shl_1_plus_a_[6] & ~p0_sign_bit,
           _0_minus_product_[5]
             ? _ka_shl_1_plus_a_[5] | p0_sign_bit
             : _ka_shl_1_plus_a_[5] & ~p0_sign_bit,
           _0_minus_product_[4]
             ? _ka_shl_1_plus_a_[4] | p0_sign_bit
             : _ka_shl_1_plus_a_[4] & ~p0_sign_bit,
           _0_minus_product_[3]
             ? _ka_shl_1_plus_a_[3] | p0_sign_bit
             : _ka_shl_1_plus_a_[3] & ~p0_sign_bit,
           _0_minus_product_[2]
             ? _ka_shl_1_plus_a_[2] | p0_sign_bit
             : _ka_shl_1_plus_a_[2] & ~p0_sign_bit,
           _0_minus_product_[1]
             ? _ka_shl_1_plus_a_[1] | p0_sign_bit
             : _ka_shl_1_plus_a_[1] & ~p0_sign_bit,
           _0_minus_product_[0]
             ? _ka_shl_1_plus_a_[0] | p0_sign_bit
             : _ka_shl_1_plus_a_[0] & ~p0_sign_bit});	// mac_pe.k:18:9, :31:31, :34:{13,17}, :36:27, :39:22
  always_comb begin	// mac_pe.k:18:9
    global_out__accum_5_0_0 = _accum_plus_product_;	// mac_pe.k:19:9, :39:22
    global_out__accum_5_0_valid_0 = p0_stage1_enable;	// mac_pe.k:18:9, :19:9
  end // always_comb
  reg   [23:0] p0__accum_plus_product_;	// mac_pe.k:18:9
  reg          p0_stage2_enable = 1'h0;	// mac_pe.k:18:9
  reg   [23:0] p0__accum_plus_product__0;	// mac_pe.k:18:9
  reg          p0_stage3_enable = 1'h0;	// mac_pe.k:18:9
  always @(posedge clk) begin	// mac_pe.k:18:9
    p0_magnitude <= data_in_3[3:0];	// mac_pe.k:18:9
    p0_sign_bit <= data_in_3[4];	// mac_pe.k:18:9
    p0_activation <= data_in_3[12:5];	// mac_pe.k:18:9
    if (rst)	// mac_pe.k:18:9
      p0_stage1_enable <= 1'h0;	// mac_pe.k:18:9
    else	// mac_pe.k:18:9
      p0_stage1_enable <= _GEN & input_valid_0;	// mac_pe.k:18:9
    p0__accum_plus_product_ <= _accum_plus_product_;	// mac_pe.k:18:9, :39:22
    if (rst)	// mac_pe.k:18:9
      p0_stage2_enable <= 1'h0;	// mac_pe.k:18:9
    else	// mac_pe.k:18:9
      p0_stage2_enable <= p0_stage1_enable;	// mac_pe.k:18:9
    p0__accum_plus_product__0 <= p0__accum_plus_product_;	// mac_pe.k:18:9
    if (rst)	// mac_pe.k:18:9
      p0_stage3_enable <= 1'h0;	// mac_pe.k:18:9
    else	// mac_pe.k:18:9
      p0_stage3_enable <= p0_stage2_enable;	// mac_pe.k:18:9
  end // always @(posedge)
  always_comb begin	// mac_pe.k:18:9
    fifo_wren_0_0 = p0_stage3_enable;	// mac_pe.k:16:5, :18:9
    fifo_data_out_0_0 = p0__accum_plus_product__0;	// mac_pe.k:16:5, :18:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// mac_pe.k:18:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// mac_pe.k:18:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  mac_peDebugView_macEntry mac_peDebugView_macEntry_instance (	// mac_pe.k:16:5
    .clk         (clk),	// mac_pe.k:16:5
    ._magnitude  (p0_stage1_enable ? p0_magnitude : 'x),	// mac_pe.k:16:5, :18:9
    ._sign_bit   (p0_stage1_enable ? p0_sign_bit : 'x),	// mac_pe.k:16:5, :18:9
    ._activation (p0_stage1_enable ? p0_activation : 'x),	// mac_pe.k:16:5, :18:9
    .valid       (p0_stage1_enable),	// mac_pe.k:18:9
    .valid_out   (/* unused */)
  );	// mac_pe.k:16:5
  mac_peDebugView_macExit mac_peDebugView_macExit_instance (	// mac_pe.k:16:5
    .clk          (clk),	// mac_pe.k:16:5
    ._ReturnValue (p0_stage2_enable ? p0__accum_plus_product_ : 'x),	// mac_pe.k:16:5, :18:9
    .valid        (p0_stage2_enable),	// mac_pe.k:18:9
    .valid_out    (/* unused */)
  );	// mac_pe.k:16:5
  assign done_out = p0_stage3_enable;	// mac_pe.k:18:9
  assign global_out__accum_5_0_valid = global_out__accum_5_0_valid_0;	// mac_pe.k:18:9
  assign global_out__accum_5_0 = global_out__accum_5_0_0;	// mac_pe.k:18:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// mac_pe.k:18:9
  assign fifo_wren_0 = fifo_wren_0_0;	// mac_pe.k:18:9
  assign input_rdy_0 = input_rdy_0_0;	// mac_pe.k:18:9
  assign control_state_out = control_state_out_0;	// mac_pe.k:18:9
endmodule

module mac_pe_reg_24_w2_v_1_24_0_i_24_0(
  input  wire        clk,
  input  wire        rst,
  input  wire        input_valid_0,
  input  wire [23:0] input_0,
  input  wire        input_valid_1,
  output wire [23:0] value_out
);

  reg [23:0] value;
  always @(posedge clk) begin
    if (rst)
      value <= 24'h0;
    else
      value <= input_valid_1 ? 24'h0 : input_valid_0 ? input_0 : value;
  end // always @(posedge)
  assign value_out = value;
endmodule

module mac_pe(
  input  wire        clk,
  input  wire        rst,
  input  wire        mac_valid_in,
  input  wire [3:0]  mac_magnitude_in,
  input  wire        mac_sign_bit_in,
  input  wire [7:0]  mac_activation_in,
  input  wire        mac_rden_in,
  input  wire        read_accum_valid_in,
  input  wire        read_accum_rden_in,
  input  wire        clear_valid_in,
  input  wire        clear_rden_in,
  input  wire [2:0]  stall_rate_in,
  input  wire        stall_rate_valid_in,
  output wire        rst_and_startup_done_out,
  output wire        mac_rdy_out,
  output wire        mac_empty_out,
  output wire [23:0] mac_result_out,
  output wire        read_accum_rdy_out,
  output wire        read_accum_empty_out,
  output wire [23:0] read_accum_result_out,
  output wire        clear_rdy_out,
  output wire        clear_empty_out,
  output wire        stall_rate_supported_out
);

  wire        _clear_BasicBlock_0Impl_global_out__accum_5_1_valid;	// mac_pe.k:52:9
  wire        _clear_BasicBlock_0Impl_fifo_wren_0;	// mac_pe.k:52:9
  wire        _clear_BasicBlock_0Impl_input_rdy_0;	// mac_pe.k:52:9
  wire [23:0] _read_accum_BasicBlock_0Impl_fifo_data_out_0;	// mac_pe.k:47:9
  wire        _read_accum_BasicBlock_0Impl_fifo_wren_0;	// mac_pe.k:47:9
  wire        _read_accum_BasicBlock_0Impl_input_rdy_0;	// mac_pe.k:47:9
  wire        _mac_BasicBlock_0Impl_global_out__accum_5_0_valid;	// mac_pe.k:18:9
  wire [23:0] _mac_BasicBlock_0Impl_global_out__accum_5_0;	// mac_pe.k:18:9
  wire [23:0] _mac_BasicBlock_0Impl_fifo_data_out_0;	// mac_pe.k:18:9
  wire        _mac_BasicBlock_0Impl_fifo_wren_0;	// mac_pe.k:18:9
  wire        _mac_BasicBlock_0Impl_input_rdy_0;	// mac_pe.k:18:9
  wire        _fifo_2_clear_Return_overflow_out;
  wire        _fifo_2_clear_Return_underflow_out;
  wire        _fifo_2_clear_Return_empty;
  wire        _fifo_2_clear_Return_full;
  wire        _fifo_1_read_accum_Return_overflow_out;
  wire        _fifo_1_read_accum_Return_underflow_out;
  wire        _fifo_1_read_accum_Return_empty;
  wire        _fifo_1_read_accum_Return_full;
  wire [23:0] _fifo_1_read_accum_Return_q;
  wire        _fifo_0_mac_Return_overflow_out;
  wire        _fifo_0_mac_Return_underflow_out;
  wire        _fifo_0_mac_Return_empty;
  wire        _fifo_0_mac_Return_full;
  wire [23:0] _fifo_0_mac_Return_q;
  wire        _has_startup_completed_delayed_2_delay_chain_data_out;
  wire        _has_startup_completed_delayed_1_delay_chain_data_out;
  wire        _has_startup_completed_delayed_0_delay_chain_data_out;
  wire [23:0] __accum_value_out;	// mac_pe.k:13:5
  wire        _reset_control_rst_and_startup_done_out;
  wire [6:0]  _reset_control_rst_delayed_out;
  wire        _reset_control_reset_sequence_finished_this_cycle_out;
  logic  stall_rate_supported_out_net;
  logic  clear_empty_out_net;
  logic  clear_rdy_out_net;
  logic  read_accum_empty_out_net;
  logic [23:0] read_accum_result_out_net;
  logic  read_accum_rdy_out_net;
  logic  mac_empty_out_net;
  logic [23:0] mac_result_out_net;
  logic  mac_rdy_out_net;
  logic  rst_and_startup_done_out_net;

  logic [31:0] dropped_commands;
  //synopsys translate_off
  KanagawaStringTable string_table(.clk(clk));
  //synopsys translate_on
  logic [6:0] reg_rst_delayed;
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

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [23:0] data_in;
      logic [23:0] data_out;
      logic overflow;
      logic underflow;
  } fifo_data_0;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [23:0] data_in;
      logic [23:0] data_out;
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
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [12:0] data;
      logic underflow;
  } passthrough_data_3;
  assign passthrough_data_3.underflow = 1'b0;
  assign passthrough_data_3.rdy_ext = passthrough_data_3.rdy_int & !(!has_startup_completed_delayed_0);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic underflow;
  } passthrough_data_4;
  assign passthrough_data_4.underflow = 1'b0;
  assign passthrough_data_4.rdy_ext = passthrough_data_4.rdy_int & !(!has_startup_completed_delayed_1);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic underflow;
  } passthrough_data_5;
  assign passthrough_data_5.underflow = 1'b0;
  assign passthrough_data_5.rdy_ext = passthrough_data_5.rdy_int & !(!has_startup_completed_delayed_2);
  assign mac_rdy_out_net = passthrough_data_3.rdy_ext;
  assign passthrough_data_3.valid = mac_rdy_out & mac_valid_in;
  assign passthrough_data_3.data = { mac_activation_in, mac_sign_bit_in, mac_magnitude_in };
  assign fifo_data_0.rden = mac_rden_in;
  assign mac_result_out_net = fifo_data_0.data_out;
  assign mac_empty_out_net = fifo_data_0.empty;
  assign read_accum_rdy_out_net = passthrough_data_4.rdy_ext;
  assign passthrough_data_4.valid = read_accum_rdy_out & read_accum_valid_in;
  assign fifo_data_1.rden = read_accum_rden_in;
  assign read_accum_result_out_net = fifo_data_1.data_out;
  assign read_accum_empty_out_net = fifo_data_1.empty;
  assign clear_rdy_out_net = passthrough_data_5.rdy_ext;
  assign passthrough_data_5.valid = clear_rdy_out & clear_valid_in;
  assign fifo_data_2.rden = clear_rden_in;
  assign clear_empty_out_net = fifo_data_2.empty;
  always_comb begin
    rst_and_startup_done_out_net = _reset_control_rst_and_startup_done_out;
    reg_rst_delayed = _reset_control_rst_delayed_out;
    reset_sequence_finished_this_cycle = _reset_control_reset_sequence_finished_this_cycle_out;
    has_startup_completed_delayed_0 = _has_startup_completed_delayed_0_delay_chain_data_out;
    has_startup_completed_delayed_1 = _has_startup_completed_delayed_1_delay_chain_data_out;
    has_startup_completed_delayed_2 = _has_startup_completed_delayed_2_delay_chain_data_out;
    fifo_data_0.overflow = _fifo_0_mac_Return_overflow_out;
    fifo_data_0.underflow = _fifo_0_mac_Return_underflow_out;
    fifo_data_0.empty = _fifo_0_mac_Return_empty;
    fifo_data_0.almost_full = _fifo_0_mac_Return_full;
    fifo_data_0.data_out = _fifo_0_mac_Return_q;
    fifo_data_1.overflow = _fifo_1_read_accum_Return_overflow_out;
    fifo_data_1.underflow = _fifo_1_read_accum_Return_underflow_out;
    fifo_data_1.empty = _fifo_1_read_accum_Return_empty;
    fifo_data_1.almost_full = _fifo_1_read_accum_Return_full;
    fifo_data_1.data_out = _fifo_1_read_accum_Return_q;
    fifo_data_2.overflow = _fifo_2_clear_Return_overflow_out;
    fifo_data_2.underflow = _fifo_2_clear_Return_underflow_out;
    fifo_data_2.empty = _fifo_2_clear_Return_empty;
    fifo_data_2.almost_full = _fifo_2_clear_Return_full;
    fifo_data_0.data_in = _mac_BasicBlock_0Impl_fifo_data_out_0;	// mac_pe.k:18:9
    fifo_data_0.wren = _mac_BasicBlock_0Impl_fifo_wren_0;	// mac_pe.k:18:9
    passthrough_data_3.rdy_int = _mac_BasicBlock_0Impl_input_rdy_0;	// mac_pe.k:18:9
    fifo_data_1.data_in = _read_accum_BasicBlock_0Impl_fifo_data_out_0;	// mac_pe.k:47:9
    fifo_data_1.wren = _read_accum_BasicBlock_0Impl_fifo_wren_0;	// mac_pe.k:47:9
    passthrough_data_4.rdy_int = _read_accum_BasicBlock_0Impl_input_rdy_0;	// mac_pe.k:47:9
    fifo_data_2.wren = _clear_BasicBlock_0Impl_fifo_wren_0;	// mac_pe.k:52:9
    passthrough_data_5.rdy_int = _clear_BasicBlock_0Impl_input_rdy_0;	// mac_pe.k:52:9
  end // always_comb

  assign has_startup_completed_raw = 1'b1;
  assign stall_rate_supported_out_net = 1'b0;
  KanagawaResetControl #(
    .WIDTH(7),
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
  mac_pe_reg_24_w2_v_1_24_0_i_24_0 _accum (	// mac_pe.k:13:5
    .clk           (clk),	// mac_pe.k:13:5
    .rst           (reg_rst_delayed[0]),	// mac_pe.k:13:5
    .input_valid_0 (_mac_BasicBlock_0Impl_global_out__accum_5_0_valid),	// mac_pe.k:18:9
    .input_0       (_mac_BasicBlock_0Impl_global_out__accum_5_0),	// mac_pe.k:18:9
    .input_valid_1 (_clear_BasicBlock_0Impl_global_out__accum_5_1_valid),	// mac_pe.k:52:9
    .value_out     (__accum_value_out)
  );	// mac_pe.k:13:5
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
    .WIDTH(24),
    .PORT_WIDTH(24),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_0_mac_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(4),
    .USE_LUTRAM(1)
  ) fifo_0_mac_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[1]),
    .overflow_out  (_fifo_0_mac_Return_overflow_out),
    .underflow_out (_fifo_0_mac_Return_underflow_out),
    .empty         (_fifo_0_mac_Return_empty),
    .rdreq         (fifo_data_0.rden),
    .full          (_fifo_0_mac_Return_full),
    .wrreq         (fifo_data_0.wren),
    .data          (fifo_data_0.data_in),
    .q             (_fifo_0_mac_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(24),
    .PORT_WIDTH(24),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_1_read_accum_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(1)
  ) fifo_1_read_accum_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[2]),
    .overflow_out  (_fifo_1_read_accum_Return_overflow_out),
    .underflow_out (_fifo_1_read_accum_Return_underflow_out),
    .empty         (_fifo_1_read_accum_Return_empty),
    .rdreq         (fifo_data_1.rden),
    .full          (_fifo_1_read_accum_Return_full),
    .wrreq         (fifo_data_1.wren),
    .data          (fifo_data_1.data_in),
    .q             (_fifo_1_read_accum_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(0),
    .PORT_WIDTH(1),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_2_clear_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(0)
  ) fifo_2_clear_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[3]),
    .overflow_out  (_fifo_2_clear_Return_overflow_out),
    .underflow_out (_fifo_2_clear_Return_underflow_out),
    .empty         (_fifo_2_clear_Return_empty),
    .rdreq         (fifo_data_2.rden),
    .full          (_fifo_2_clear_Return_full),
    .wrreq         (fifo_data_2.wren),
    .data          ('0),
    .q             (/* unused */)
  );
  mac_pe_mac_BasicBlock_0 mac_BasicBlock_0Impl (	// mac_pe.k:18:9
    .clk                         (clk),	// mac_pe.k:18:9
    .rst                         (reg_rst_delayed[4]),	// mac_pe.k:18:9
    .done_out                    (/* unused */),
    .global_in__accum_5          (__accum_value_out),	// mac_pe.k:13:5
    .global_out__accum_5_0_valid (_mac_BasicBlock_0Impl_global_out__accum_5_0_valid),
    .global_out__accum_5_0       (_mac_BasicBlock_0Impl_global_out__accum_5_0),
    .fifo_data_out_0             (_mac_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0                 (_mac_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0   (fifo_data_0.almost_full),	// mac_pe.k:18:9
    .fifo_overflow_in_0          (fifo_data_0.overflow),	// mac_pe.k:18:9
    .data_in_3                   (passthrough_data_3.data),	// mac_pe.k:18:9
    .input_fifo_underflow_0      (passthrough_data_3.underflow),	// mac_pe.k:18:9
    .input_rdy_0                 (_mac_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0               (passthrough_data_3.valid),	// mac_pe.k:18:9
    .control_state_out           (/* unused */)
  );	// mac_pe.k:18:9
  mac_pe_read_accum_BasicBlock_0 read_accum_BasicBlock_0Impl (	// mac_pe.k:47:9
    .clk                       (clk),	// mac_pe.k:47:9
    .rst                       (reg_rst_delayed[5]),	// mac_pe.k:47:9
    .done_out                  (/* unused */),
    .global_in__accum_5        (__accum_value_out),	// mac_pe.k:13:5
    .fifo_data_out_0           (_read_accum_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0               (_read_accum_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_1.almost_full),	// mac_pe.k:47:9
    .fifo_overflow_in_0        (fifo_data_1.overflow),	// mac_pe.k:47:9
    .input_fifo_underflow_0    (passthrough_data_4.underflow),	// mac_pe.k:47:9
    .input_rdy_0               (_read_accum_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_4.valid),	// mac_pe.k:47:9
    .control_state_out         (/* unused */)
  );	// mac_pe.k:47:9
  mac_pe_clear_BasicBlock_0 clear_BasicBlock_0Impl (	// mac_pe.k:52:9
    .clk                         (clk),	// mac_pe.k:52:9
    .rst                         (reg_rst_delayed[6]),	// mac_pe.k:52:9
    .done_out                    (/* unused */),
    .global_out__accum_5_1_valid (_clear_BasicBlock_0Impl_global_out__accum_5_1_valid),
    .fifo_wren_0                 (_clear_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0   (fifo_data_2.almost_full),	// mac_pe.k:52:9
    .fifo_overflow_in_0          (fifo_data_2.overflow),	// mac_pe.k:52:9
    .input_fifo_underflow_0      (passthrough_data_5.underflow),	// mac_pe.k:52:9
    .input_rdy_0                 (_clear_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0               (passthrough_data_5.valid),	// mac_pe.k:52:9
    .control_state_out           (/* unused */)
  );	// mac_pe.k:52:9
  assign rst_and_startup_done_out = rst_and_startup_done_out_net;
  assign mac_rdy_out = mac_rdy_out_net;
  assign mac_empty_out = mac_empty_out_net;
  assign mac_result_out = mac_result_out_net;
  assign read_accum_rdy_out = read_accum_rdy_out_net;
  assign read_accum_empty_out = read_accum_empty_out_net;
  assign read_accum_result_out = read_accum_result_out_net;
  assign clear_rdy_out = clear_rdy_out_net;
  assign clear_empty_out = clear_empty_out_net;
  assign stall_rate_supported_out = stall_rate_supported_out_net;
endmodule

module mac_pe_EsiWrapper(
     input  wire                                                                                 clk,
     input  wire                                                                                 rst,
     input  wire [2:0]                                                                           stall_rate_in,
     input  wire                                                                                 stall_rate_valid_in,
  // input  wire /*Zero Width*/                                                                  clear_arg,
     input  wire                                                                                 clear_arg_valid,
     input  wire struct packed {logic [3:0] magnitude; logic sign_bit; logic [7:0] activation; } mac_arg,
     input  wire                                                                                 mac_arg_valid,
  // input  wire /*Zero Width*/                                                                  read_accum_arg,
     input  wire                                                                                 read_accum_arg_valid,
     input  wire                                                                                 clear_result_rden,
     input  wire                                                                                 mac_result_rden,
     input  wire                                                                                 read_accum_result_rden,
     output wire                                                                                 clear_arg_ready,
     output wire                                                                                 mac_arg_ready,
     output wire                                                                                 read_accum_arg_ready,
  // output wire /*Zero Width*/                                                                  clear_result,
     output wire                                                                                 clear_result_empty,
     output wire [23:0]                                                                          mac_result,
     output wire                                                                                 mac_result_empty,
     output wire [23:0]                                                                          read_accum_result,
     output wire                                                                                 read_accum_result_empty,
     output wire                                                                                 rst_and_startup_done_out,
     output wire                                                                                 stall_rate_supported_out
);

  wire [23:0] _EsiWrapped_mac_result_out;
  wire [23:0] _EsiWrapped_read_accum_result_out;
  mac_pe EsiWrapped (
    .clk                      (clk),
    .rst                      (rst),
    .mac_valid_in             (mac_arg_valid),
    .mac_magnitude_in         (mac_arg.magnitude),
    .mac_sign_bit_in          (mac_arg.sign_bit),
    .mac_activation_in        (mac_arg.activation),
    .mac_rden_in              (mac_result_rden),
    .read_accum_valid_in      (read_accum_arg_valid),
    .read_accum_rden_in       (read_accum_result_rden),
    .clear_valid_in           (clear_arg_valid),
    .clear_rden_in            (clear_result_rden),
    .stall_rate_in            (stall_rate_in),
    .stall_rate_valid_in      (stall_rate_valid_in),
    .rst_and_startup_done_out (rst_and_startup_done_out),
    .mac_rdy_out              (mac_arg_ready),
    .mac_empty_out            (mac_result_empty),
    .mac_result_out           (_EsiWrapped_mac_result_out),
    .read_accum_rdy_out       (read_accum_arg_ready),
    .read_accum_empty_out     (read_accum_result_empty),
    .read_accum_result_out    (_EsiWrapped_read_accum_result_out),
    .clear_rdy_out            (clear_arg_ready),
    .clear_empty_out          (clear_result_empty),
    .stall_rate_supported_out (stall_rate_supported_out)
  );
  // Zero width: assign clear_result = /*Zero width*/;
  assign mac_result = _EsiWrapped_mac_result_out;
  assign read_accum_result = _EsiWrapped_read_accum_result_out;
endmodule

