
// This file was generated. Do not modify.
// kanagawa --backend=sv --import-dir=/home/mana/workspace/OpenTaalas/third-party/kanagawa/library --base-library=/home/mana/workspace/OpenTaalas/third-party/kanagawa/library/mini-base.k --output=/home/mana/workspace/OpenTaalas/rtl/generated/kanagawa/codebook_decoder --frequency=250 --register-ratio=8 --max-register-ratio=16 /home/mana/workspace/OpenTaalas/rtl/kanagawa/codebook_decoder.k

`default_nettype wire
module codebook_decoderDebugView_decode_m0Entry
(
    input wire clk,
    input wire[8:0]  _index,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("decode_m0Entry time: %0t index: %p", $time, _index);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module codebook_decoderDebugView_decode_m0Exit
(
    input wire clk,
    input wire[3:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("decode_m0Exit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module codebook_decoderDebugView_decode_m1Entry
(
    input wire clk,
    input wire[8:0]  _index,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("decode_m1Entry time: %0t index: %p", $time, _index);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module codebook_decoderDebugView_decode_m1Exit
(
    input wire clk,
    input wire[3:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("decode_m1Exit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module codebook_decoderDebugView_decode_m2Entry
(
    input wire clk,
    input wire[8:0]  _index,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("decode_m2Entry time: %0t index: %p", $time, _index);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module codebook_decoderDebugView_decode_m2Exit
(
    input wire clk,
    input wire[3:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("decode_m2Exit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module codebook_decoderDebugView_decode_m3Entry
(
    input wire clk,
    input wire[8:0]  _index,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("decode_m3Entry time: %0t index: %p", $time, _index);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module codebook_decoderDebugView_decode_m3Exit
(
    input wire clk,
    input wire[3:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("decode_m3Exit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module codebook_decoderDebugView_write_entryEntry
(
    input wire clk,
    input wire[8:0]  _index,
    input wire[31:0]  _value,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("write_entryEntry time: %0t index: %p value: %p", $time, _index, _value);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module codebook_decoderDebugView_read_entryEntry
(
    input wire clk,
    input wire[8:0]  _index,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("read_entryEntry time: %0t index: %p", $time, _index);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module codebook_decoderDebugView_read_entryExit
(
    input wire clk,
    input wire[31:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("read_entryExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
`ifndef _TYPESCOPE_CoreModuleTypeScope
`define _TYPESCOPE_CoreModuleTypeScope
`endif // _TYPESCOPE_CoreModuleTypeScope
module codebook_decoder_read_entry_BasicBlock_0(	// codebook_decoder.k:29:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  input  wire [31:0] memory_read_data_in_12_4,
  output wire [8:0]  memory_read_addr_out_12_4,
  output wire        memory_rden_out_12_4,
  output wire [31:0] fifo_data_out_0,
  output wire        fifo_wren_0,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [8:0]  data_in_11,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  wire  [31:0] memory_read_data_in_12_4_0 = memory_read_data_in_12_4;	// codebook_decoder.k:29:9
  logic        done_out_0;	// codebook_decoder.k:29:9
  logic [8:0]  memory_read_addr_out_12_4_0;	// codebook_decoder.k:29:9
  logic        memory_rden_out_12_4_0;	// codebook_decoder.k:29:9
  logic [31:0] fifo_data_out_0_0;	// codebook_decoder.k:29:9
  logic        fifo_wren_0_0;	// codebook_decoder.k:29:9
  logic        input_rdy_0_0;	// codebook_decoder.k:29:9
  logic [7:0]  control_state_out_0;	// codebook_decoder.k:29:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// codebook_decoder.k:29:9
  wire         _GEN_0 = _GEN & input_valid_0;	// codebook_decoder.k:29:9
  always_comb begin	// codebook_decoder.k:29:9
    input_rdy_0_0 = _GEN;	// codebook_decoder.k:29:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// codebook_decoder.k:29:9
  end // always_comb
  always_comb begin	// codebook_decoder.k:29:9
    memory_read_addr_out_12_4_0 = data_in_11;	// codebook_decoder.k:29:16
    memory_rden_out_12_4_0 = _GEN_0;	// codebook_decoder.k:29:{9,16}
  end // always_comb
  reg   [8:0]  p0_data_in_11;	// codebook_decoder.k:29:9
  reg          p0_stage1_enable = 1'h0;	// codebook_decoder.k:29:9
  reg          p0_stage2_enable = 1'h0;	// codebook_decoder.k:29:9
  reg   [31:0] p0_memory_read_data_in_12_4;	// codebook_decoder.k:29:9
  reg          p0_stage3_enable = 1'h0;	// codebook_decoder.k:29:9
  always @(posedge clk) begin	// codebook_decoder.k:29:9
    p0_data_in_11 <= data_in_11;	// codebook_decoder.k:29:9
    if (rst) begin	// codebook_decoder.k:29:9
      p0_stage1_enable <= 1'h0;	// codebook_decoder.k:29:9
      p0_stage2_enable <= 1'h0;	// codebook_decoder.k:29:9
    end
    else begin	// codebook_decoder.k:29:9
      p0_stage1_enable <= _GEN_0;	// codebook_decoder.k:29:9
      p0_stage2_enable <= p0_stage1_enable;	// codebook_decoder.k:29:9
    end
    p0_memory_read_data_in_12_4 <= memory_read_data_in_12_4_0;	// codebook_decoder.k:29:9
    if (rst)	// codebook_decoder.k:29:9
      p0_stage3_enable <= 1'h0;	// codebook_decoder.k:29:9
    else	// codebook_decoder.k:29:9
      p0_stage3_enable <= p0_stage2_enable;	// codebook_decoder.k:29:9
  end // always @(posedge)
  always_comb begin	// codebook_decoder.k:29:9
    fifo_wren_0_0 = p0_stage3_enable;	// codebook_decoder.k:27:5, :29:9
    fifo_data_out_0_0 = p0_memory_read_data_in_12_4;	// codebook_decoder.k:27:5, :29:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// codebook_decoder.k:29:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// codebook_decoder.k:29:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  codebook_decoderDebugView_read_entryEntry codebook_decoderDebugView_read_entryEntry_instance (	// codebook_decoder.k:27:5
    .clk       (clk),	// codebook_decoder.k:27:5
    ._index    (p0_stage1_enable ? p0_data_in_11 : 'x),	// codebook_decoder.k:27:5, :29:9
    .valid     (p0_stage1_enable),	// codebook_decoder.k:29:9
    .valid_out (/* unused */)
  );	// codebook_decoder.k:27:5
  codebook_decoderDebugView_read_entryExit codebook_decoderDebugView_read_entryExit_instance (	// codebook_decoder.k:27:5
    .clk          (clk),	// codebook_decoder.k:27:5
    ._ReturnValue (p0_stage2_enable ? memory_read_data_in_12_4_0 : 'x),	// codebook_decoder.k:27:5, :29:9
    .valid        (p0_stage2_enable),	// codebook_decoder.k:29:9
    .valid_out    (/* unused */)
  );	// codebook_decoder.k:27:5
  assign done_out = p0_stage3_enable;	// codebook_decoder.k:29:9
  assign memory_read_addr_out_12_4 = memory_read_addr_out_12_4_0;	// codebook_decoder.k:29:9
  assign memory_rden_out_12_4 = memory_rden_out_12_4_0;	// codebook_decoder.k:29:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// codebook_decoder.k:29:9
  assign fifo_wren_0 = fifo_wren_0_0;	// codebook_decoder.k:29:9
  assign input_rdy_0 = input_rdy_0_0;	// codebook_decoder.k:29:9
  assign control_state_out = control_state_out_0;	// codebook_decoder.k:29:9
endmodule

module codebook_decoder_write_entry_BasicBlock_0(	// codebook_decoder.k:24:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  output wire [31:0] memory_write_data_out_12_0,
  output wire [8:0]  memory_write_addr_out_12_0,
  output wire        memory_wren_12_0,
  output wire        fifo_wren_0,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [40:0] data_in_10,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  logic        done_out_0;	// codebook_decoder.k:24:9
  logic [31:0] memory_write_data_out_12_0_0;	// codebook_decoder.k:24:9
  logic [8:0]  memory_write_addr_out_12_0_0;	// codebook_decoder.k:24:9
  logic        memory_wren_12_0_0;	// codebook_decoder.k:24:9
  logic        fifo_wren_0_0;	// codebook_decoder.k:24:9
  logic        input_rdy_0_0;	// codebook_decoder.k:24:9
  logic [7:0]  control_state_out_0;	// codebook_decoder.k:24:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// codebook_decoder.k:24:9
  wire         _GEN_0 = _GEN & input_valid_0;	// codebook_decoder.k:24:9
  always_comb begin	// codebook_decoder.k:24:9
    input_rdy_0_0 = _GEN;	// codebook_decoder.k:24:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// codebook_decoder.k:24:9
  end // always_comb
  always_comb begin	// codebook_decoder.k:24:9
    memory_wren_12_0_0 = _GEN_0;	// codebook_decoder.k:24:{9,18}
    memory_write_addr_out_12_0_0 = data_in_10[8:0];	// codebook_decoder.k:24:18
    memory_write_data_out_12_0_0 = data_in_10[40:9];	// codebook_decoder.k:24:18
  end // always_comb
  reg   [8:0]  p0_index;	// codebook_decoder.k:24:9
  reg   [31:0] p0_value;	// codebook_decoder.k:24:9
  reg          p0_stage1_enable = 1'h0;	// codebook_decoder.k:24:9
  reg          p0_stage2_enable = 1'h0;	// codebook_decoder.k:24:9
  always @(posedge clk) begin	// codebook_decoder.k:24:9
    p0_index <= data_in_10[8:0];	// codebook_decoder.k:24:9
    p0_value <= data_in_10[40:9];	// codebook_decoder.k:24:9
    if (rst) begin	// codebook_decoder.k:24:9
      p0_stage1_enable <= 1'h0;	// codebook_decoder.k:24:9
      p0_stage2_enable <= 1'h0;	// codebook_decoder.k:24:9
    end
    else begin	// codebook_decoder.k:24:9
      p0_stage1_enable <= _GEN_0;	// codebook_decoder.k:24:9
      p0_stage2_enable <= p0_stage1_enable;	// codebook_decoder.k:24:9
    end
  end // always @(posedge)
  always_comb	// codebook_decoder.k:24:9
    fifo_wren_0_0 = p0_stage2_enable;	// codebook_decoder.k:24:9, :25:9
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// codebook_decoder.k:24:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// codebook_decoder.k:24:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  codebook_decoderDebugView_write_entryEntry codebook_decoderDebugView_write_entryEntry_instance (	// codebook_decoder.k:25:9
    .clk       (clk),	// codebook_decoder.k:25:9
    ._index    (p0_stage1_enable ? p0_index : 'x),	// codebook_decoder.k:24:9, :25:9
    ._value    (p0_stage1_enable ? p0_value : 'x),	// codebook_decoder.k:24:9, :25:9
    .valid     (p0_stage1_enable),	// codebook_decoder.k:24:9
    .valid_out (/* unused */)
  );	// codebook_decoder.k:25:9
  assign done_out = p0_stage2_enable;	// codebook_decoder.k:24:9
  assign memory_write_data_out_12_0 = memory_write_data_out_12_0_0;	// codebook_decoder.k:24:9
  assign memory_write_addr_out_12_0 = memory_write_addr_out_12_0_0;	// codebook_decoder.k:24:9
  assign memory_wren_12_0 = memory_wren_12_0_0;	// codebook_decoder.k:24:9
  assign fifo_wren_0 = fifo_wren_0_0;	// codebook_decoder.k:24:9
  assign input_rdy_0 = input_rdy_0_0;	// codebook_decoder.k:24:9
  assign control_state_out = control_state_out_0;	// codebook_decoder.k:24:9
endmodule

module codebook_decoder_decode_m3_BasicBlock_0(	// codebook_decoder.k:19:38
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  input  wire [31:0] memory_read_data_in_12_3,
  output wire [8:0]  memory_read_addr_out_12_3,
  output wire        memory_rden_out_12_3,
  output wire [3:0]  fifo_data_out_0,
  output wire        fifo_wren_0,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [8:0]  data_in_9,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  wire  [31:0] memory_read_data_in_12_3_0 = memory_read_data_in_12_3;	// codebook_decoder.k:19:38
  logic        done_out_0;	// codebook_decoder.k:19:38
  logic [8:0]  memory_read_addr_out_12_3_0;	// codebook_decoder.k:19:38
  logic        memory_rden_out_12_3_0;	// codebook_decoder.k:19:38
  logic [3:0]  fifo_data_out_0_0;	// codebook_decoder.k:19:38
  logic        fifo_wren_0_0;	// codebook_decoder.k:19:38
  logic        input_rdy_0_0;	// codebook_decoder.k:19:38
  logic [7:0]  control_state_out_0;	// codebook_decoder.k:19:38
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// codebook_decoder.k:19:38
  wire         _GEN_0 = _GEN & input_valid_0;	// codebook_decoder.k:19:38
  always_comb begin	// codebook_decoder.k:19:38
    input_rdy_0_0 = _GEN;	// codebook_decoder.k:19:38
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// codebook_decoder.k:19:38
  end // always_comb
  always_comb begin	// codebook_decoder.k:19:38
    memory_read_addr_out_12_3_0 = data_in_9;	// codebook_decoder.k:19:58
    memory_rden_out_12_3_0 = _GEN_0;	// codebook_decoder.k:19:{38,58}
  end // always_comb
  reg   [8:0]  p0_data_in_9;	// codebook_decoder.k:19:38
  reg          p0_stage1_enable = 1'h0;	// codebook_decoder.k:19:38
  reg          p0_stage2_enable = 1'h0;	// codebook_decoder.k:19:38
  reg   [3:0]  p0_cast_lt_uint4_gt_grid_index_shr_24_and_255_;	// codebook_decoder.k:19:38
  reg          p0_stage3_enable = 1'h0;	// codebook_decoder.k:19:38
  always @(posedge clk) begin	// codebook_decoder.k:19:38
    p0_data_in_9 <= data_in_9;	// codebook_decoder.k:19:38
    if (rst) begin	// codebook_decoder.k:19:38
      p0_stage1_enable <= 1'h0;	// codebook_decoder.k:19:38
      p0_stage2_enable <= 1'h0;	// codebook_decoder.k:19:38
    end
    else begin	// codebook_decoder.k:19:38
      p0_stage1_enable <= _GEN_0;	// codebook_decoder.k:19:38
      p0_stage2_enable <= p0_stage1_enable;	// codebook_decoder.k:19:38
    end
    p0_cast_lt_uint4_gt_grid_index_shr_24_and_255_ <= memory_read_data_in_12_3_0[27:24];	// codebook_decoder.k:19:{38,45,57}
    if (rst)	// codebook_decoder.k:19:38
      p0_stage3_enable <= 1'h0;	// codebook_decoder.k:19:38
    else	// codebook_decoder.k:19:38
      p0_stage3_enable <= p0_stage2_enable;	// codebook_decoder.k:19:38
  end // always @(posedge)
  always_comb begin	// codebook_decoder.k:19:38
    fifo_wren_0_0 = p0_stage3_enable;	// codebook_decoder.k:19:{5,38}
    fifo_data_out_0_0 = p0_cast_lt_uint4_gt_grid_index_shr_24_and_255_;	// codebook_decoder.k:19:{5,38}
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// codebook_decoder.k:19:38
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// codebook_decoder.k:19:38
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  codebook_decoderDebugView_decode_m3Entry codebook_decoderDebugView_decode_m3Entry_instance (	// codebook_decoder.k:19:5
    .clk       (clk),	// codebook_decoder.k:19:5
    ._index    (p0_stage1_enable ? p0_data_in_9 : 'x),	// codebook_decoder.k:19:{5,38}
    .valid     (p0_stage1_enable),	// codebook_decoder.k:19:38
    .valid_out (/* unused */)
  );	// codebook_decoder.k:19:5
  codebook_decoderDebugView_decode_m3Exit codebook_decoderDebugView_decode_m3Exit_instance (	// codebook_decoder.k:19:5
    .clk          (clk),	// codebook_decoder.k:19:5
    ._ReturnValue (p0_stage2_enable ? memory_read_data_in_12_3_0[27:24] : 'x),	// codebook_decoder.k:19:{5,38,45,57}
    .valid        (p0_stage2_enable),	// codebook_decoder.k:19:38
    .valid_out    (/* unused */)
  );	// codebook_decoder.k:19:5
  assign done_out = p0_stage3_enable;	// codebook_decoder.k:19:38
  assign memory_read_addr_out_12_3 = memory_read_addr_out_12_3_0;	// codebook_decoder.k:19:38
  assign memory_rden_out_12_3 = memory_rden_out_12_3_0;	// codebook_decoder.k:19:38
  assign fifo_data_out_0 = fifo_data_out_0_0;	// codebook_decoder.k:19:38
  assign fifo_wren_0 = fifo_wren_0_0;	// codebook_decoder.k:19:38
  assign input_rdy_0 = input_rdy_0_0;	// codebook_decoder.k:19:38
  assign control_state_out = control_state_out_0;	// codebook_decoder.k:19:38
endmodule

module codebook_decoder_decode_m2_BasicBlock_0(	// codebook_decoder.k:18:38
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  input  wire [31:0] memory_read_data_in_12_0,
  output wire [8:0]  memory_read_addr_out_12_0,
  output wire        memory_rden_out_12_0,
  output wire [3:0]  fifo_data_out_0,
  output wire        fifo_wren_0,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [8:0]  data_in_8,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  wire  [31:0] memory_read_data_in_12_0_0 = memory_read_data_in_12_0;	// codebook_decoder.k:18:38
  logic        done_out_0;	// codebook_decoder.k:18:38
  logic [8:0]  memory_read_addr_out_12_0_0;	// codebook_decoder.k:18:38
  logic        memory_rden_out_12_0_0;	// codebook_decoder.k:18:38
  logic [3:0]  fifo_data_out_0_0;	// codebook_decoder.k:18:38
  logic        fifo_wren_0_0;	// codebook_decoder.k:18:38
  logic        input_rdy_0_0;	// codebook_decoder.k:18:38
  logic [7:0]  control_state_out_0;	// codebook_decoder.k:18:38
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// codebook_decoder.k:18:38
  wire         _GEN_0 = _GEN & input_valid_0;	// codebook_decoder.k:18:38
  always_comb begin	// codebook_decoder.k:18:38
    input_rdy_0_0 = _GEN;	// codebook_decoder.k:18:38
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// codebook_decoder.k:18:38
  end // always_comb
  always_comb begin	// codebook_decoder.k:18:38
    memory_read_addr_out_12_0_0 = data_in_8;	// codebook_decoder.k:18:58
    memory_rden_out_12_0_0 = _GEN_0;	// codebook_decoder.k:18:{38,58}
  end // always_comb
  reg   [8:0]  p0_data_in_8;	// codebook_decoder.k:18:38
  reg          p0_stage1_enable = 1'h0;	// codebook_decoder.k:18:38
  reg          p0_stage2_enable = 1'h0;	// codebook_decoder.k:18:38
  reg   [3:0]  p0_cast_lt_uint4_gt_grid_index_shr_16_and_255_;	// codebook_decoder.k:18:38
  reg          p0_stage3_enable = 1'h0;	// codebook_decoder.k:18:38
  always @(posedge clk) begin	// codebook_decoder.k:18:38
    p0_data_in_8 <= data_in_8;	// codebook_decoder.k:18:38
    if (rst) begin	// codebook_decoder.k:18:38
      p0_stage1_enable <= 1'h0;	// codebook_decoder.k:18:38
      p0_stage2_enable <= 1'h0;	// codebook_decoder.k:18:38
    end
    else begin	// codebook_decoder.k:18:38
      p0_stage1_enable <= _GEN_0;	// codebook_decoder.k:18:38
      p0_stage2_enable <= p0_stage1_enable;	// codebook_decoder.k:18:38
    end
    p0_cast_lt_uint4_gt_grid_index_shr_16_and_255_ <= memory_read_data_in_12_0_0[19:16];	// codebook_decoder.k:18:{38,45,57}
    if (rst)	// codebook_decoder.k:18:38
      p0_stage3_enable <= 1'h0;	// codebook_decoder.k:18:38
    else	// codebook_decoder.k:18:38
      p0_stage3_enable <= p0_stage2_enable;	// codebook_decoder.k:18:38
  end // always @(posedge)
  always_comb begin	// codebook_decoder.k:18:38
    fifo_wren_0_0 = p0_stage3_enable;	// codebook_decoder.k:18:{5,38}
    fifo_data_out_0_0 = p0_cast_lt_uint4_gt_grid_index_shr_16_and_255_;	// codebook_decoder.k:18:{5,38}
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// codebook_decoder.k:18:38
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// codebook_decoder.k:18:38
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  codebook_decoderDebugView_decode_m2Entry codebook_decoderDebugView_decode_m2Entry_instance (	// codebook_decoder.k:18:5
    .clk       (clk),	// codebook_decoder.k:18:5
    ._index    (p0_stage1_enable ? p0_data_in_8 : 'x),	// codebook_decoder.k:18:{5,38}
    .valid     (p0_stage1_enable),	// codebook_decoder.k:18:38
    .valid_out (/* unused */)
  );	// codebook_decoder.k:18:5
  codebook_decoderDebugView_decode_m2Exit codebook_decoderDebugView_decode_m2Exit_instance (	// codebook_decoder.k:18:5
    .clk          (clk),	// codebook_decoder.k:18:5
    ._ReturnValue (p0_stage2_enable ? memory_read_data_in_12_0_0[19:16] : 'x),	// codebook_decoder.k:18:{5,38,45,57}
    .valid        (p0_stage2_enable),	// codebook_decoder.k:18:38
    .valid_out    (/* unused */)
  );	// codebook_decoder.k:18:5
  assign done_out = p0_stage3_enable;	// codebook_decoder.k:18:38
  assign memory_read_addr_out_12_0 = memory_read_addr_out_12_0_0;	// codebook_decoder.k:18:38
  assign memory_rden_out_12_0 = memory_rden_out_12_0_0;	// codebook_decoder.k:18:38
  assign fifo_data_out_0 = fifo_data_out_0_0;	// codebook_decoder.k:18:38
  assign fifo_wren_0 = fifo_wren_0_0;	// codebook_decoder.k:18:38
  assign input_rdy_0 = input_rdy_0_0;	// codebook_decoder.k:18:38
  assign control_state_out = control_state_out_0;	// codebook_decoder.k:18:38
endmodule

module codebook_decoder_decode_m1_BasicBlock_0(	// codebook_decoder.k:17:38
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  input  wire [31:0] memory_read_data_in_12_1,
  output wire [8:0]  memory_read_addr_out_12_1,
  output wire        memory_rden_out_12_1,
  output wire [3:0]  fifo_data_out_0,
  output wire        fifo_wren_0,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [8:0]  data_in_7,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  wire  [31:0] memory_read_data_in_12_1_0 = memory_read_data_in_12_1;	// codebook_decoder.k:17:38
  logic        done_out_0;	// codebook_decoder.k:17:38
  logic [8:0]  memory_read_addr_out_12_1_0;	// codebook_decoder.k:17:38
  logic        memory_rden_out_12_1_0;	// codebook_decoder.k:17:38
  logic [3:0]  fifo_data_out_0_0;	// codebook_decoder.k:17:38
  logic        fifo_wren_0_0;	// codebook_decoder.k:17:38
  logic        input_rdy_0_0;	// codebook_decoder.k:17:38
  logic [7:0]  control_state_out_0;	// codebook_decoder.k:17:38
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// codebook_decoder.k:17:38
  wire         _GEN_0 = _GEN & input_valid_0;	// codebook_decoder.k:17:38
  always_comb begin	// codebook_decoder.k:17:38
    input_rdy_0_0 = _GEN;	// codebook_decoder.k:17:38
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// codebook_decoder.k:17:38
  end // always_comb
  always_comb begin	// codebook_decoder.k:17:38
    memory_read_addr_out_12_1_0 = data_in_7;	// codebook_decoder.k:17:58
    memory_rden_out_12_1_0 = _GEN_0;	// codebook_decoder.k:17:{38,58}
  end // always_comb
  reg   [8:0]  p0_data_in_7;	// codebook_decoder.k:17:38
  reg          p0_stage1_enable = 1'h0;	// codebook_decoder.k:17:38
  reg          p0_stage2_enable = 1'h0;	// codebook_decoder.k:17:38
  reg   [3:0]  p0_cast_lt_uint4_gt_grid_index_shr_8_and_255_;	// codebook_decoder.k:17:38
  reg          p0_stage3_enable = 1'h0;	// codebook_decoder.k:17:38
  always @(posedge clk) begin	// codebook_decoder.k:17:38
    p0_data_in_7 <= data_in_7;	// codebook_decoder.k:17:38
    if (rst) begin	// codebook_decoder.k:17:38
      p0_stage1_enable <= 1'h0;	// codebook_decoder.k:17:38
      p0_stage2_enable <= 1'h0;	// codebook_decoder.k:17:38
    end
    else begin	// codebook_decoder.k:17:38
      p0_stage1_enable <= _GEN_0;	// codebook_decoder.k:17:38
      p0_stage2_enable <= p0_stage1_enable;	// codebook_decoder.k:17:38
    end
    p0_cast_lt_uint4_gt_grid_index_shr_8_and_255_ <= memory_read_data_in_12_1_0[11:8];	// codebook_decoder.k:17:{38,45,57}
    if (rst)	// codebook_decoder.k:17:38
      p0_stage3_enable <= 1'h0;	// codebook_decoder.k:17:38
    else	// codebook_decoder.k:17:38
      p0_stage3_enable <= p0_stage2_enable;	// codebook_decoder.k:17:38
  end // always @(posedge)
  always_comb begin	// codebook_decoder.k:17:38
    fifo_wren_0_0 = p0_stage3_enable;	// codebook_decoder.k:17:{5,38}
    fifo_data_out_0_0 = p0_cast_lt_uint4_gt_grid_index_shr_8_and_255_;	// codebook_decoder.k:17:{5,38}
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// codebook_decoder.k:17:38
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// codebook_decoder.k:17:38
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  codebook_decoderDebugView_decode_m1Entry codebook_decoderDebugView_decode_m1Entry_instance (	// codebook_decoder.k:17:5
    .clk       (clk),	// codebook_decoder.k:17:5
    ._index    (p0_stage1_enable ? p0_data_in_7 : 'x),	// codebook_decoder.k:17:{5,38}
    .valid     (p0_stage1_enable),	// codebook_decoder.k:17:38
    .valid_out (/* unused */)
  );	// codebook_decoder.k:17:5
  codebook_decoderDebugView_decode_m1Exit codebook_decoderDebugView_decode_m1Exit_instance (	// codebook_decoder.k:17:5
    .clk          (clk),	// codebook_decoder.k:17:5
    ._ReturnValue (p0_stage2_enable ? memory_read_data_in_12_1_0[11:8] : 'x),	// codebook_decoder.k:17:{5,38,45,57}
    .valid        (p0_stage2_enable),	// codebook_decoder.k:17:38
    .valid_out    (/* unused */)
  );	// codebook_decoder.k:17:5
  assign done_out = p0_stage3_enable;	// codebook_decoder.k:17:38
  assign memory_read_addr_out_12_1 = memory_read_addr_out_12_1_0;	// codebook_decoder.k:17:38
  assign memory_rden_out_12_1 = memory_rden_out_12_1_0;	// codebook_decoder.k:17:38
  assign fifo_data_out_0 = fifo_data_out_0_0;	// codebook_decoder.k:17:38
  assign fifo_wren_0 = fifo_wren_0_0;	// codebook_decoder.k:17:38
  assign input_rdy_0 = input_rdy_0_0;	// codebook_decoder.k:17:38
  assign control_state_out = control_state_out_0;	// codebook_decoder.k:17:38
endmodule

module codebook_decoder_decode_m0_BasicBlock_0(	// codebook_decoder.k:16:38
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  input  wire [31:0] memory_read_data_in_12_2,
  output wire [8:0]  memory_read_addr_out_12_2,
  output wire        memory_rden_out_12_2,
  output wire [3:0]  fifo_data_out_0,
  output wire        fifo_wren_0,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [8:0]  data_in_6,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  wire  [31:0] memory_read_data_in_12_2_0 = memory_read_data_in_12_2;	// codebook_decoder.k:16:38
  logic        done_out_0;	// codebook_decoder.k:16:38
  logic [8:0]  memory_read_addr_out_12_2_0;	// codebook_decoder.k:16:38
  logic        memory_rden_out_12_2_0;	// codebook_decoder.k:16:38
  logic [3:0]  fifo_data_out_0_0;	// codebook_decoder.k:16:38
  logic        fifo_wren_0_0;	// codebook_decoder.k:16:38
  logic        input_rdy_0_0;	// codebook_decoder.k:16:38
  logic [7:0]  control_state_out_0;	// codebook_decoder.k:16:38
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// codebook_decoder.k:16:38
  wire         _GEN_0 = _GEN & input_valid_0;	// codebook_decoder.k:16:38
  always_comb begin	// codebook_decoder.k:16:38
    input_rdy_0_0 = _GEN;	// codebook_decoder.k:16:38
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// codebook_decoder.k:16:38
  end // always_comb
  always_comb begin	// codebook_decoder.k:16:38
    memory_read_addr_out_12_2_0 = data_in_6;	// codebook_decoder.k:16:57
    memory_rden_out_12_2_0 = _GEN_0;	// codebook_decoder.k:16:{38,57}
  end // always_comb
  reg   [8:0]  p0_data_in_6;	// codebook_decoder.k:16:38
  reg          p0_stage1_enable = 1'h0;	// codebook_decoder.k:16:38
  reg          p0_stage2_enable = 1'h0;	// codebook_decoder.k:16:38
  reg   [3:0]  p0_cast_lt_uint4_gt_grid_index_and_255_;	// codebook_decoder.k:16:38
  reg          p0_stage3_enable = 1'h0;	// codebook_decoder.k:16:38
  always @(posedge clk) begin	// codebook_decoder.k:16:38
    p0_data_in_6 <= data_in_6;	// codebook_decoder.k:16:38
    if (rst) begin	// codebook_decoder.k:16:38
      p0_stage1_enable <= 1'h0;	// codebook_decoder.k:16:38
      p0_stage2_enable <= 1'h0;	// codebook_decoder.k:16:38
    end
    else begin	// codebook_decoder.k:16:38
      p0_stage1_enable <= _GEN_0;	// codebook_decoder.k:16:38
      p0_stage2_enable <= p0_stage1_enable;	// codebook_decoder.k:16:38
    end
    p0_cast_lt_uint4_gt_grid_index_and_255_ <= memory_read_data_in_12_2_0[3:0];	// codebook_decoder.k:16:{38,45,57}
    if (rst)	// codebook_decoder.k:16:38
      p0_stage3_enable <= 1'h0;	// codebook_decoder.k:16:38
    else	// codebook_decoder.k:16:38
      p0_stage3_enable <= p0_stage2_enable;	// codebook_decoder.k:16:38
  end // always @(posedge)
  always_comb begin	// codebook_decoder.k:16:38
    fifo_wren_0_0 = p0_stage3_enable;	// codebook_decoder.k:16:{5,38}
    fifo_data_out_0_0 = p0_cast_lt_uint4_gt_grid_index_and_255_;	// codebook_decoder.k:16:{5,38}
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// codebook_decoder.k:16:38
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// codebook_decoder.k:16:38
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  codebook_decoderDebugView_decode_m0Entry codebook_decoderDebugView_decode_m0Entry_instance (	// codebook_decoder.k:16:5
    .clk       (clk),	// codebook_decoder.k:16:5
    ._index    (p0_stage1_enable ? p0_data_in_6 : 'x),	// codebook_decoder.k:16:{5,38}
    .valid     (p0_stage1_enable),	// codebook_decoder.k:16:38
    .valid_out (/* unused */)
  );	// codebook_decoder.k:16:5
  codebook_decoderDebugView_decode_m0Exit codebook_decoderDebugView_decode_m0Exit_instance (	// codebook_decoder.k:16:5
    .clk          (clk),	// codebook_decoder.k:16:5
    ._ReturnValue (p0_stage2_enable ? memory_read_data_in_12_2_0[3:0] : 'x),	// codebook_decoder.k:16:{5,38,45,57}
    .valid        (p0_stage2_enable),	// codebook_decoder.k:16:38
    .valid_out    (/* unused */)
  );	// codebook_decoder.k:16:5
  assign done_out = p0_stage3_enable;	// codebook_decoder.k:16:38
  assign memory_read_addr_out_12_2 = memory_read_addr_out_12_2_0;	// codebook_decoder.k:16:38
  assign memory_rden_out_12_2 = memory_rden_out_12_2_0;	// codebook_decoder.k:16:38
  assign fifo_data_out_0 = fifo_data_out_0_0;	// codebook_decoder.k:16:38
  assign fifo_wren_0 = fifo_wren_0_0;	// codebook_decoder.k:16:38
  assign input_rdy_0 = input_rdy_0_0;	// codebook_decoder.k:16:38
  assign control_state_out = control_state_out_0;	// codebook_decoder.k:16:38
endmodule

module codebook_decoder__grid__mem_container(	// codebook_decoder.k:12:5
  input  wire        clk,
  input  wire        rst,
  input  wire        rden_in_0,
  input  wire [8:0]  read_addr_in_0,
  input  wire        rden_in_1,
  input  wire [8:0]  read_addr_in_1,
  input  wire        rden_in_2,
  input  wire [8:0]  read_addr_in_2,
  input  wire        rden_in_3,
  input  wire [8:0]  read_addr_in_3,
  input  wire        rden_in_4,
  input  wire [8:0]  read_addr_in_4,
  input  wire        wren_in_0,
  input  wire [8:0]  write_addr_in_0,
  input  wire [31:0] write_data_in_0,
  output wire [31:0] read_data_out_0,
  output wire [31:0] read_data_out_1,
  output wire [31:0] read_data_out_2,
  output wire [31:0] read_data_out_3,
  output wire [31:0] read_data_out_4,
  output wire        init_completed
);

  wire [1:0][31:0] ___grid_4_data_out;	// codebook_decoder.k:12:5
  wire [1:0][31:0] ___grid_3_data_out;	// codebook_decoder.k:12:5
  wire [1:0][31:0] ___grid_2_data_out;	// codebook_decoder.k:12:5
  wire [1:0][31:0] ___grid_1_data_out;	// codebook_decoder.k:12:5
  wire [1:0][31:0] ___grid_0_data_out;	// codebook_decoder.k:12:5
  wire [1:0][31:0] _GEN = {{32'h0}, {write_data_in_0}};	// codebook_decoder.k:12:5
  wire [1:0]       _GEN_0 = {{1'h0}, {wren_in_0}};	// codebook_decoder.k:12:5
  KanagawaSyncRam #(
    .DATA_WIDTH(32),
    .ADDR_WIDTH(9),
    .DEPTH(512),
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
  ) __grid_0 (	// codebook_decoder.k:12:5
    .clk            (clk),	// codebook_decoder.k:12:5
    .rst            (rst),
    .addr_in        ({{read_addr_in_0}, {write_addr_in_0}}),	// codebook_decoder.k:12:5
    .ecc_status_out (/* unused */),
    .wren_in        (_GEN_0),	// codebook_decoder.k:12:5
    .data_in        (_GEN),	// codebook_decoder.k:12:5
    .rden_in        ({{rden_in_0}, {1'h0}}),	// codebook_decoder.k:12:5
    .data_out       (___grid_0_data_out)
  );	// codebook_decoder.k:12:5
  KanagawaSyncRam #(
    .DATA_WIDTH(32),
    .ADDR_WIDTH(9),
    .DEPTH(512),
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
  ) __grid_1 (	// codebook_decoder.k:12:5
    .clk            (clk),	// codebook_decoder.k:12:5
    .rst            (rst),
    .addr_in        ({{read_addr_in_1}, {write_addr_in_0}}),	// codebook_decoder.k:12:5
    .ecc_status_out (/* unused */),
    .wren_in        (_GEN_0),	// codebook_decoder.k:12:5
    .data_in        (_GEN),	// codebook_decoder.k:12:5
    .rden_in        ({{rden_in_1}, {1'h0}}),	// codebook_decoder.k:12:5
    .data_out       (___grid_1_data_out)
  );	// codebook_decoder.k:12:5
  KanagawaSyncRam #(
    .DATA_WIDTH(32),
    .ADDR_WIDTH(9),
    .DEPTH(512),
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
  ) __grid_2 (	// codebook_decoder.k:12:5
    .clk            (clk),	// codebook_decoder.k:12:5
    .rst            (rst),
    .addr_in        ({{read_addr_in_2}, {write_addr_in_0}}),	// codebook_decoder.k:12:5
    .ecc_status_out (/* unused */),
    .wren_in        (_GEN_0),	// codebook_decoder.k:12:5
    .data_in        (_GEN),	// codebook_decoder.k:12:5
    .rden_in        ({{rden_in_2}, {1'h0}}),	// codebook_decoder.k:12:5
    .data_out       (___grid_2_data_out)
  );	// codebook_decoder.k:12:5
  KanagawaSyncRam #(
    .DATA_WIDTH(32),
    .ADDR_WIDTH(9),
    .DEPTH(512),
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
  ) __grid_3 (	// codebook_decoder.k:12:5
    .clk            (clk),	// codebook_decoder.k:12:5
    .rst            (rst),
    .addr_in        ({{read_addr_in_3}, {write_addr_in_0}}),	// codebook_decoder.k:12:5
    .ecc_status_out (/* unused */),
    .wren_in        (_GEN_0),	// codebook_decoder.k:12:5
    .data_in        (_GEN),	// codebook_decoder.k:12:5
    .rden_in        ({{rden_in_3}, {1'h0}}),	// codebook_decoder.k:12:5
    .data_out       (___grid_3_data_out)
  );	// codebook_decoder.k:12:5
  KanagawaSyncRam #(
    .DATA_WIDTH(32),
    .ADDR_WIDTH(9),
    .DEPTH(512),
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
  ) __grid_4 (	// codebook_decoder.k:12:5
    .clk            (clk),	// codebook_decoder.k:12:5
    .rst            (rst),
    .addr_in        ({{read_addr_in_4}, {write_addr_in_0}}),	// codebook_decoder.k:12:5
    .ecc_status_out (/* unused */),
    .wren_in        (_GEN_0),	// codebook_decoder.k:12:5
    .data_in        (_GEN),	// codebook_decoder.k:12:5
    .rden_in        ({{rden_in_4}, {1'h0}}),	// codebook_decoder.k:12:5
    .data_out       (___grid_4_data_out)
  );	// codebook_decoder.k:12:5
  assign read_data_out_0 = ___grid_0_data_out[1'h1];	// codebook_decoder.k:12:5
  assign read_data_out_1 = ___grid_1_data_out[1'h1];	// codebook_decoder.k:12:5
  assign read_data_out_2 = ___grid_2_data_out[1'h1];	// codebook_decoder.k:12:5
  assign read_data_out_3 = ___grid_3_data_out[1'h1];	// codebook_decoder.k:12:5
  assign read_data_out_4 = ___grid_4_data_out[1'h1];	// codebook_decoder.k:12:5
  assign init_completed = 1'h1;	// codebook_decoder.k:12:5
endmodule

module codebook_decoder(
  input  wire        clk,
  input  wire        rst,
  input  wire        decode_m0_valid_in,
  input  wire [8:0]  decode_m0_index_in,
  input  wire        decode_m0_rden_in,
  input  wire        decode_m1_valid_in,
  input  wire [8:0]  decode_m1_index_in,
  input  wire        decode_m1_rden_in,
  input  wire        decode_m2_valid_in,
  input  wire [8:0]  decode_m2_index_in,
  input  wire        decode_m2_rden_in,
  input  wire        decode_m3_valid_in,
  input  wire [8:0]  decode_m3_index_in,
  input  wire        decode_m3_rden_in,
  input  wire        write_entry_valid_in,
  input  wire [8:0]  write_entry_index_in,
  input  wire [31:0] write_entry_value_in,
  input  wire        write_entry_rden_in,
  input  wire        read_entry_valid_in,
  input  wire [8:0]  read_entry_index_in,
  input  wire        read_entry_rden_in,
  input  wire [2:0]  stall_rate_in,
  input  wire        stall_rate_valid_in,
  output wire        rst_and_startup_done_out,
  output wire        decode_m0_rdy_out,
  output wire        decode_m0_empty_out,
  output wire [3:0]  decode_m0_result_out,
  output wire        decode_m1_rdy_out,
  output wire        decode_m1_empty_out,
  output wire [3:0]  decode_m1_result_out,
  output wire        decode_m2_rdy_out,
  output wire        decode_m2_empty_out,
  output wire [3:0]  decode_m2_result_out,
  output wire        decode_m3_rdy_out,
  output wire        decode_m3_empty_out,
  output wire [3:0]  decode_m3_result_out,
  output wire        write_entry_rdy_out,
  output wire        write_entry_empty_out,
  output wire        read_entry_rdy_out,
  output wire        read_entry_empty_out,
  output wire [31:0] read_entry_result_out,
  output wire        stall_rate_supported_out
);

  wire [8:0]  _read_entry_BasicBlock_0Impl_memory_read_addr_out_12_4;	// codebook_decoder.k:29:9
  wire        _read_entry_BasicBlock_0Impl_memory_rden_out_12_4;	// codebook_decoder.k:29:9
  wire [31:0] _read_entry_BasicBlock_0Impl_fifo_data_out_0;	// codebook_decoder.k:29:9
  wire        _read_entry_BasicBlock_0Impl_fifo_wren_0;	// codebook_decoder.k:29:9
  wire        _read_entry_BasicBlock_0Impl_input_rdy_0;	// codebook_decoder.k:29:9
  wire [31:0] _write_entry_BasicBlock_0Impl_memory_write_data_out_12_0;	// codebook_decoder.k:24:9
  wire [8:0]  _write_entry_BasicBlock_0Impl_memory_write_addr_out_12_0;	// codebook_decoder.k:24:9
  wire        _write_entry_BasicBlock_0Impl_memory_wren_12_0;	// codebook_decoder.k:24:9
  wire        _write_entry_BasicBlock_0Impl_fifo_wren_0;	// codebook_decoder.k:24:9
  wire        _write_entry_BasicBlock_0Impl_input_rdy_0;	// codebook_decoder.k:24:9
  wire [8:0]  _decode_m3_BasicBlock_0Impl_memory_read_addr_out_12_3;	// codebook_decoder.k:19:38
  wire        _decode_m3_BasicBlock_0Impl_memory_rden_out_12_3;	// codebook_decoder.k:19:38
  wire [3:0]  _decode_m3_BasicBlock_0Impl_fifo_data_out_0;	// codebook_decoder.k:19:38
  wire        _decode_m3_BasicBlock_0Impl_fifo_wren_0;	// codebook_decoder.k:19:38
  wire        _decode_m3_BasicBlock_0Impl_input_rdy_0;	// codebook_decoder.k:19:38
  wire [8:0]  _decode_m2_BasicBlock_0Impl_memory_read_addr_out_12_0;	// codebook_decoder.k:18:38
  wire        _decode_m2_BasicBlock_0Impl_memory_rden_out_12_0;	// codebook_decoder.k:18:38
  wire [3:0]  _decode_m2_BasicBlock_0Impl_fifo_data_out_0;	// codebook_decoder.k:18:38
  wire        _decode_m2_BasicBlock_0Impl_fifo_wren_0;	// codebook_decoder.k:18:38
  wire        _decode_m2_BasicBlock_0Impl_input_rdy_0;	// codebook_decoder.k:18:38
  wire [8:0]  _decode_m1_BasicBlock_0Impl_memory_read_addr_out_12_1;	// codebook_decoder.k:17:38
  wire        _decode_m1_BasicBlock_0Impl_memory_rden_out_12_1;	// codebook_decoder.k:17:38
  wire [3:0]  _decode_m1_BasicBlock_0Impl_fifo_data_out_0;	// codebook_decoder.k:17:38
  wire        _decode_m1_BasicBlock_0Impl_fifo_wren_0;	// codebook_decoder.k:17:38
  wire        _decode_m1_BasicBlock_0Impl_input_rdy_0;	// codebook_decoder.k:17:38
  wire [8:0]  _decode_m0_BasicBlock_0Impl_memory_read_addr_out_12_2;	// codebook_decoder.k:16:38
  wire        _decode_m0_BasicBlock_0Impl_memory_rden_out_12_2;	// codebook_decoder.k:16:38
  wire [3:0]  _decode_m0_BasicBlock_0Impl_fifo_data_out_0;	// codebook_decoder.k:16:38
  wire        _decode_m0_BasicBlock_0Impl_fifo_wren_0;	// codebook_decoder.k:16:38
  wire        _decode_m0_BasicBlock_0Impl_input_rdy_0;	// codebook_decoder.k:16:38
  wire        _fifo_5_read_entry_Return_overflow_out;
  wire        _fifo_5_read_entry_Return_underflow_out;
  wire        _fifo_5_read_entry_Return_empty;
  wire        _fifo_5_read_entry_Return_full;
  wire [31:0] _fifo_5_read_entry_Return_q;
  wire        _fifo_4_write_entry_Return_overflow_out;
  wire        _fifo_4_write_entry_Return_underflow_out;
  wire        _fifo_4_write_entry_Return_empty;
  wire        _fifo_4_write_entry_Return_full;
  wire        _fifo_3_decode_m3_Return_overflow_out;
  wire        _fifo_3_decode_m3_Return_underflow_out;
  wire        _fifo_3_decode_m3_Return_empty;
  wire        _fifo_3_decode_m3_Return_full;
  wire [3:0]  _fifo_3_decode_m3_Return_q;
  wire        _fifo_2_decode_m2_Return_overflow_out;
  wire        _fifo_2_decode_m2_Return_underflow_out;
  wire        _fifo_2_decode_m2_Return_empty;
  wire        _fifo_2_decode_m2_Return_full;
  wire [3:0]  _fifo_2_decode_m2_Return_q;
  wire        _fifo_1_decode_m1_Return_overflow_out;
  wire        _fifo_1_decode_m1_Return_underflow_out;
  wire        _fifo_1_decode_m1_Return_empty;
  wire        _fifo_1_decode_m1_Return_full;
  wire [3:0]  _fifo_1_decode_m1_Return_q;
  wire        _fifo_0_decode_m0_Return_overflow_out;
  wire        _fifo_0_decode_m0_Return_underflow_out;
  wire        _fifo_0_decode_m0_Return_empty;
  wire        _fifo_0_decode_m0_Return_full;
  wire [3:0]  _fifo_0_decode_m0_Return_q;
  wire        _has_startup_completed_delayed_5_delay_chain_data_out;
  wire        _has_startup_completed_delayed_4_delay_chain_data_out;
  wire        _has_startup_completed_delayed_3_delay_chain_data_out;
  wire        _has_startup_completed_delayed_2_delay_chain_data_out;
  wire        _has_startup_completed_delayed_1_delay_chain_data_out;
  wire        _has_startup_completed_delayed_0_delay_chain_data_out;
  wire [31:0] __grid_read_data_out_0;	// codebook_decoder.k:12:5
  wire [31:0] __grid_read_data_out_1;	// codebook_decoder.k:12:5
  wire [31:0] __grid_read_data_out_2;	// codebook_decoder.k:12:5
  wire [31:0] __grid_read_data_out_3;	// codebook_decoder.k:12:5
  wire [31:0] __grid_read_data_out_4;	// codebook_decoder.k:12:5
  wire        __grid_init_completed;	// codebook_decoder.k:12:5
  wire        _reset_control_rst_and_startup_done_out;
  wire [11:0] _reset_control_rst_delayed_out;
  wire        _reset_control_reset_sequence_finished_this_cycle_out;
  logic  stall_rate_supported_out_net;
  logic  read_entry_empty_out_net;
  logic [31:0] read_entry_result_out_net;
  logic  read_entry_rdy_out_net;
  logic  write_entry_empty_out_net;
  logic  write_entry_rdy_out_net;
  logic  decode_m3_empty_out_net;
  logic [3:0] decode_m3_result_out_net;
  logic  decode_m3_rdy_out_net;
  logic  decode_m2_empty_out_net;
  logic [3:0] decode_m2_result_out_net;
  logic  decode_m2_rdy_out_net;
  logic  decode_m1_empty_out_net;
  logic [3:0] decode_m1_result_out_net;
  logic  decode_m1_rdy_out_net;
  logic  decode_m0_empty_out_net;
  logic [3:0] decode_m0_result_out_net;
  logic  decode_m0_rdy_out_net;
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
  wire        _GEN = has_startup_completed_raw & __grid_init_completed;	// codebook_decoder.k:12:5
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

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [3:0] data_in;
      logic [3:0] data_out;
      logic overflow;
      logic underflow;
  } fifo_data_0;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [3:0] data_in;
      logic [3:0] data_out;
      logic overflow;
      logic underflow;
  } fifo_data_1;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [3:0] data_in;
      logic [3:0] data_out;
      logic overflow;
      logic underflow;
  } fifo_data_2;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [3:0] data_in;
      logic [3:0] data_out;
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
      logic [31:0] data_in;
      logic [31:0] data_out;
      logic overflow;
      logic underflow;
  } fifo_data_5;

  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [8:0] data;
      logic underflow;
  } passthrough_data_6;
  assign passthrough_data_6.underflow = 1'b0;
  assign passthrough_data_6.rdy_ext = passthrough_data_6.rdy_int & !(!has_startup_completed_delayed_0);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [8:0] data;
      logic underflow;
  } passthrough_data_7;
  assign passthrough_data_7.underflow = 1'b0;
  assign passthrough_data_7.rdy_ext = passthrough_data_7.rdy_int & !(!has_startup_completed_delayed_1);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [8:0] data;
      logic underflow;
  } passthrough_data_8;
  assign passthrough_data_8.underflow = 1'b0;
  assign passthrough_data_8.rdy_ext = passthrough_data_8.rdy_int & !(!has_startup_completed_delayed_2);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [8:0] data;
      logic underflow;
  } passthrough_data_9;
  assign passthrough_data_9.underflow = 1'b0;
  assign passthrough_data_9.rdy_ext = passthrough_data_9.rdy_int & !(!has_startup_completed_delayed_3);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [40:0] data;
      logic underflow;
  } passthrough_data_10;
  assign passthrough_data_10.underflow = 1'b0;
  assign passthrough_data_10.rdy_ext = passthrough_data_10.rdy_int & !(!has_startup_completed_delayed_4);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [8:0] data;
      logic underflow;
  } passthrough_data_11;
  assign passthrough_data_11.underflow = 1'b0;
  assign passthrough_data_11.rdy_ext = passthrough_data_11.rdy_int & !(!has_startup_completed_delayed_5);
  assign decode_m0_rdy_out_net = passthrough_data_6.rdy_ext;
  assign passthrough_data_6.valid = decode_m0_rdy_out & decode_m0_valid_in;
  assign passthrough_data_6.data = { decode_m0_index_in };
  assign fifo_data_0.rden = decode_m0_rden_in;
  assign decode_m0_result_out_net = fifo_data_0.data_out;
  assign decode_m0_empty_out_net = fifo_data_0.empty;
  assign decode_m1_rdy_out_net = passthrough_data_7.rdy_ext;
  assign passthrough_data_7.valid = decode_m1_rdy_out & decode_m1_valid_in;
  assign passthrough_data_7.data = { decode_m1_index_in };
  assign fifo_data_1.rden = decode_m1_rden_in;
  assign decode_m1_result_out_net = fifo_data_1.data_out;
  assign decode_m1_empty_out_net = fifo_data_1.empty;
  assign decode_m2_rdy_out_net = passthrough_data_8.rdy_ext;
  assign passthrough_data_8.valid = decode_m2_rdy_out & decode_m2_valid_in;
  assign passthrough_data_8.data = { decode_m2_index_in };
  assign fifo_data_2.rden = decode_m2_rden_in;
  assign decode_m2_result_out_net = fifo_data_2.data_out;
  assign decode_m2_empty_out_net = fifo_data_2.empty;
  assign decode_m3_rdy_out_net = passthrough_data_9.rdy_ext;
  assign passthrough_data_9.valid = decode_m3_rdy_out & decode_m3_valid_in;
  assign passthrough_data_9.data = { decode_m3_index_in };
  assign fifo_data_3.rden = decode_m3_rden_in;
  assign decode_m3_result_out_net = fifo_data_3.data_out;
  assign decode_m3_empty_out_net = fifo_data_3.empty;
  assign write_entry_rdy_out_net = passthrough_data_10.rdy_ext;
  assign passthrough_data_10.valid = write_entry_rdy_out & write_entry_valid_in;
  assign passthrough_data_10.data = { write_entry_value_in, write_entry_index_in };
  assign fifo_data_4.rden = write_entry_rden_in;
  assign write_entry_empty_out_net = fifo_data_4.empty;
  assign read_entry_rdy_out_net = passthrough_data_11.rdy_ext;
  assign passthrough_data_11.valid = read_entry_rdy_out & read_entry_valid_in;
  assign passthrough_data_11.data = { read_entry_index_in };
  assign fifo_data_5.rden = read_entry_rden_in;
  assign read_entry_result_out_net = fifo_data_5.data_out;
  assign read_entry_empty_out_net = fifo_data_5.empty;
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
    fifo_data_0.overflow = _fifo_0_decode_m0_Return_overflow_out;
    fifo_data_0.underflow = _fifo_0_decode_m0_Return_underflow_out;
    fifo_data_0.empty = _fifo_0_decode_m0_Return_empty;
    fifo_data_0.almost_full = _fifo_0_decode_m0_Return_full;
    fifo_data_0.data_out = _fifo_0_decode_m0_Return_q;
    fifo_data_1.overflow = _fifo_1_decode_m1_Return_overflow_out;
    fifo_data_1.underflow = _fifo_1_decode_m1_Return_underflow_out;
    fifo_data_1.empty = _fifo_1_decode_m1_Return_empty;
    fifo_data_1.almost_full = _fifo_1_decode_m1_Return_full;
    fifo_data_1.data_out = _fifo_1_decode_m1_Return_q;
    fifo_data_2.overflow = _fifo_2_decode_m2_Return_overflow_out;
    fifo_data_2.underflow = _fifo_2_decode_m2_Return_underflow_out;
    fifo_data_2.empty = _fifo_2_decode_m2_Return_empty;
    fifo_data_2.almost_full = _fifo_2_decode_m2_Return_full;
    fifo_data_2.data_out = _fifo_2_decode_m2_Return_q;
    fifo_data_3.overflow = _fifo_3_decode_m3_Return_overflow_out;
    fifo_data_3.underflow = _fifo_3_decode_m3_Return_underflow_out;
    fifo_data_3.empty = _fifo_3_decode_m3_Return_empty;
    fifo_data_3.almost_full = _fifo_3_decode_m3_Return_full;
    fifo_data_3.data_out = _fifo_3_decode_m3_Return_q;
    fifo_data_4.overflow = _fifo_4_write_entry_Return_overflow_out;
    fifo_data_4.underflow = _fifo_4_write_entry_Return_underflow_out;
    fifo_data_4.empty = _fifo_4_write_entry_Return_empty;
    fifo_data_4.almost_full = _fifo_4_write_entry_Return_full;
    fifo_data_5.overflow = _fifo_5_read_entry_Return_overflow_out;
    fifo_data_5.underflow = _fifo_5_read_entry_Return_underflow_out;
    fifo_data_5.empty = _fifo_5_read_entry_Return_empty;
    fifo_data_5.almost_full = _fifo_5_read_entry_Return_full;
    fifo_data_5.data_out = _fifo_5_read_entry_Return_q;
    fifo_data_0.data_in = _decode_m0_BasicBlock_0Impl_fifo_data_out_0;	// codebook_decoder.k:16:38
    fifo_data_0.wren = _decode_m0_BasicBlock_0Impl_fifo_wren_0;	// codebook_decoder.k:16:38
    passthrough_data_6.rdy_int = _decode_m0_BasicBlock_0Impl_input_rdy_0;	// codebook_decoder.k:16:38
    fifo_data_1.data_in = _decode_m1_BasicBlock_0Impl_fifo_data_out_0;	// codebook_decoder.k:17:38
    fifo_data_1.wren = _decode_m1_BasicBlock_0Impl_fifo_wren_0;	// codebook_decoder.k:17:38
    passthrough_data_7.rdy_int = _decode_m1_BasicBlock_0Impl_input_rdy_0;	// codebook_decoder.k:17:38
    fifo_data_2.data_in = _decode_m2_BasicBlock_0Impl_fifo_data_out_0;	// codebook_decoder.k:18:38
    fifo_data_2.wren = _decode_m2_BasicBlock_0Impl_fifo_wren_0;	// codebook_decoder.k:18:38
    passthrough_data_8.rdy_int = _decode_m2_BasicBlock_0Impl_input_rdy_0;	// codebook_decoder.k:18:38
    fifo_data_3.data_in = _decode_m3_BasicBlock_0Impl_fifo_data_out_0;	// codebook_decoder.k:19:38
    fifo_data_3.wren = _decode_m3_BasicBlock_0Impl_fifo_wren_0;	// codebook_decoder.k:19:38
    passthrough_data_9.rdy_int = _decode_m3_BasicBlock_0Impl_input_rdy_0;	// codebook_decoder.k:19:38
    fifo_data_4.wren = _write_entry_BasicBlock_0Impl_fifo_wren_0;	// codebook_decoder.k:24:9
    passthrough_data_10.rdy_int = _write_entry_BasicBlock_0Impl_input_rdy_0;	// codebook_decoder.k:24:9
    fifo_data_5.data_in = _read_entry_BasicBlock_0Impl_fifo_data_out_0;	// codebook_decoder.k:29:9
    fifo_data_5.wren = _read_entry_BasicBlock_0Impl_fifo_wren_0;	// codebook_decoder.k:29:9
    passthrough_data_11.rdy_int = _read_entry_BasicBlock_0Impl_input_rdy_0;	// codebook_decoder.k:29:9
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
    .has_others_completed_in                (_GEN),
    .rst_and_startup_done_out               (_reset_control_rst_and_startup_done_out),
    .rst_delayed_out                        (_reset_control_rst_delayed_out),
    .reset_sequence_finished_this_cycle_out
      (_reset_control_reset_sequence_finished_this_cycle_out)
  );
  codebook_decoder__grid__mem_container _grid (	// codebook_decoder.k:12:5
    .clk             (clk),	// codebook_decoder.k:12:5
    .rst             (1'b0),	// codebook_decoder.k:12:5
    .rden_in_0       (_decode_m2_BasicBlock_0Impl_memory_rden_out_12_0),	// codebook_decoder.k:18:38
    .read_addr_in_0  (_decode_m2_BasicBlock_0Impl_memory_read_addr_out_12_0),	// codebook_decoder.k:18:38
    .rden_in_1       (_decode_m1_BasicBlock_0Impl_memory_rden_out_12_1),	// codebook_decoder.k:17:38
    .read_addr_in_1  (_decode_m1_BasicBlock_0Impl_memory_read_addr_out_12_1),	// codebook_decoder.k:17:38
    .rden_in_2       (_decode_m0_BasicBlock_0Impl_memory_rden_out_12_2),	// codebook_decoder.k:16:38
    .read_addr_in_2  (_decode_m0_BasicBlock_0Impl_memory_read_addr_out_12_2),	// codebook_decoder.k:16:38
    .rden_in_3       (_decode_m3_BasicBlock_0Impl_memory_rden_out_12_3),	// codebook_decoder.k:19:38
    .read_addr_in_3  (_decode_m3_BasicBlock_0Impl_memory_read_addr_out_12_3),	// codebook_decoder.k:19:38
    .rden_in_4       (_read_entry_BasicBlock_0Impl_memory_rden_out_12_4),	// codebook_decoder.k:29:9
    .read_addr_in_4  (_read_entry_BasicBlock_0Impl_memory_read_addr_out_12_4),	// codebook_decoder.k:29:9
    .wren_in_0       (_write_entry_BasicBlock_0Impl_memory_wren_12_0),	// codebook_decoder.k:24:9
    .write_addr_in_0 (_write_entry_BasicBlock_0Impl_memory_write_addr_out_12_0),	// codebook_decoder.k:24:9
    .write_data_in_0 (_write_entry_BasicBlock_0Impl_memory_write_data_out_12_0),	// codebook_decoder.k:24:9
    .read_data_out_0 (__grid_read_data_out_0),
    .read_data_out_1 (__grid_read_data_out_1),
    .read_data_out_2 (__grid_read_data_out_2),
    .read_data_out_3 (__grid_read_data_out_3),
    .read_data_out_4 (__grid_read_data_out_4),
    .init_completed  (__grid_init_completed)
  );	// codebook_decoder.k:12:5
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
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(4),
    .PORT_WIDTH(4),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_0_decode_m0_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(4),
    .USE_LUTRAM(1)
  ) fifo_0_decode_m0_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[0]),
    .overflow_out  (_fifo_0_decode_m0_Return_overflow_out),
    .underflow_out (_fifo_0_decode_m0_Return_underflow_out),
    .empty         (_fifo_0_decode_m0_Return_empty),
    .rdreq         (fifo_data_0.rden),
    .full          (_fifo_0_decode_m0_Return_full),
    .wrreq         (fifo_data_0.wren),
    .data          (fifo_data_0.data_in),
    .q             (_fifo_0_decode_m0_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(4),
    .PORT_WIDTH(4),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_1_decode_m1_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(4),
    .USE_LUTRAM(1)
  ) fifo_1_decode_m1_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[1]),
    .overflow_out  (_fifo_1_decode_m1_Return_overflow_out),
    .underflow_out (_fifo_1_decode_m1_Return_underflow_out),
    .empty         (_fifo_1_decode_m1_Return_empty),
    .rdreq         (fifo_data_1.rden),
    .full          (_fifo_1_decode_m1_Return_full),
    .wrreq         (fifo_data_1.wren),
    .data          (fifo_data_1.data_in),
    .q             (_fifo_1_decode_m1_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(4),
    .PORT_WIDTH(4),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_2_decode_m2_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(4),
    .USE_LUTRAM(1)
  ) fifo_2_decode_m2_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[2]),
    .overflow_out  (_fifo_2_decode_m2_Return_overflow_out),
    .underflow_out (_fifo_2_decode_m2_Return_underflow_out),
    .empty         (_fifo_2_decode_m2_Return_empty),
    .rdreq         (fifo_data_2.rden),
    .full          (_fifo_2_decode_m2_Return_full),
    .wrreq         (fifo_data_2.wren),
    .data          (fifo_data_2.data_in),
    .q             (_fifo_2_decode_m2_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(4),
    .PORT_WIDTH(4),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_3_decode_m3_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(4),
    .USE_LUTRAM(1)
  ) fifo_3_decode_m3_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[3]),
    .overflow_out  (_fifo_3_decode_m3_Return_overflow_out),
    .underflow_out (_fifo_3_decode_m3_Return_underflow_out),
    .empty         (_fifo_3_decode_m3_Return_empty),
    .rdreq         (fifo_data_3.rden),
    .full          (_fifo_3_decode_m3_Return_full),
    .wrreq         (fifo_data_3.wren),
    .data          (fifo_data_3.data_in),
    .q             (_fifo_3_decode_m3_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(0),
    .PORT_WIDTH(1),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_4_write_entry_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(0)
  ) fifo_4_write_entry_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[4]),
    .overflow_out  (_fifo_4_write_entry_Return_overflow_out),
    .underflow_out (_fifo_4_write_entry_Return_underflow_out),
    .empty         (_fifo_4_write_entry_Return_empty),
    .rdreq         (fifo_data_4.rden),
    .full          (_fifo_4_write_entry_Return_full),
    .wrreq         (fifo_data_4.wren),
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
    .AUTO_PIPELINE_GROUP("fifo_5_read_entry_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(4),
    .USE_LUTRAM(1)
  ) fifo_5_read_entry_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[5]),
    .overflow_out  (_fifo_5_read_entry_Return_overflow_out),
    .underflow_out (_fifo_5_read_entry_Return_underflow_out),
    .empty         (_fifo_5_read_entry_Return_empty),
    .rdreq         (fifo_data_5.rden),
    .full          (_fifo_5_read_entry_Return_full),
    .wrreq         (fifo_data_5.wren),
    .data          (fifo_data_5.data_in),
    .q             (_fifo_5_read_entry_Return_q)
  );
  codebook_decoder_decode_m0_BasicBlock_0 decode_m0_BasicBlock_0Impl (	// codebook_decoder.k:16:38
    .clk                       (clk),	// codebook_decoder.k:16:38
    .rst                       (reg_rst_delayed[6]),	// codebook_decoder.k:16:38
    .done_out                  (/* unused */),
    .memory_read_data_in_12_2  (__grid_read_data_out_2),	// codebook_decoder.k:12:5
    .memory_read_addr_out_12_2 (_decode_m0_BasicBlock_0Impl_memory_read_addr_out_12_2),
    .memory_rden_out_12_2      (_decode_m0_BasicBlock_0Impl_memory_rden_out_12_2),
    .fifo_data_out_0           (_decode_m0_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0               (_decode_m0_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_0.almost_full),	// codebook_decoder.k:16:38
    .fifo_overflow_in_0        (fifo_data_0.overflow),	// codebook_decoder.k:16:38
    .data_in_6                 (passthrough_data_6.data),	// codebook_decoder.k:16:38
    .input_fifo_underflow_0    (passthrough_data_6.underflow),	// codebook_decoder.k:16:38
    .input_rdy_0               (_decode_m0_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_6.valid),	// codebook_decoder.k:16:38
    .control_state_out         (/* unused */)
  );	// codebook_decoder.k:16:38
  codebook_decoder_decode_m1_BasicBlock_0 decode_m1_BasicBlock_0Impl (	// codebook_decoder.k:17:38
    .clk                       (clk),	// codebook_decoder.k:17:38
    .rst                       (reg_rst_delayed[7]),	// codebook_decoder.k:17:38
    .done_out                  (/* unused */),
    .memory_read_data_in_12_1  (__grid_read_data_out_1),	// codebook_decoder.k:12:5
    .memory_read_addr_out_12_1 (_decode_m1_BasicBlock_0Impl_memory_read_addr_out_12_1),
    .memory_rden_out_12_1      (_decode_m1_BasicBlock_0Impl_memory_rden_out_12_1),
    .fifo_data_out_0           (_decode_m1_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0               (_decode_m1_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_1.almost_full),	// codebook_decoder.k:17:38
    .fifo_overflow_in_0        (fifo_data_1.overflow),	// codebook_decoder.k:17:38
    .data_in_7                 (passthrough_data_7.data),	// codebook_decoder.k:17:38
    .input_fifo_underflow_0    (passthrough_data_7.underflow),	// codebook_decoder.k:17:38
    .input_rdy_0               (_decode_m1_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_7.valid),	// codebook_decoder.k:17:38
    .control_state_out         (/* unused */)
  );	// codebook_decoder.k:17:38
  codebook_decoder_decode_m2_BasicBlock_0 decode_m2_BasicBlock_0Impl (	// codebook_decoder.k:18:38
    .clk                       (clk),	// codebook_decoder.k:18:38
    .rst                       (reg_rst_delayed[8]),	// codebook_decoder.k:18:38
    .done_out                  (/* unused */),
    .memory_read_data_in_12_0  (__grid_read_data_out_0),	// codebook_decoder.k:12:5
    .memory_read_addr_out_12_0 (_decode_m2_BasicBlock_0Impl_memory_read_addr_out_12_0),
    .memory_rden_out_12_0      (_decode_m2_BasicBlock_0Impl_memory_rden_out_12_0),
    .fifo_data_out_0           (_decode_m2_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0               (_decode_m2_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_2.almost_full),	// codebook_decoder.k:18:38
    .fifo_overflow_in_0        (fifo_data_2.overflow),	// codebook_decoder.k:18:38
    .data_in_8                 (passthrough_data_8.data),	// codebook_decoder.k:18:38
    .input_fifo_underflow_0    (passthrough_data_8.underflow),	// codebook_decoder.k:18:38
    .input_rdy_0               (_decode_m2_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_8.valid),	// codebook_decoder.k:18:38
    .control_state_out         (/* unused */)
  );	// codebook_decoder.k:18:38
  codebook_decoder_decode_m3_BasicBlock_0 decode_m3_BasicBlock_0Impl (	// codebook_decoder.k:19:38
    .clk                       (clk),	// codebook_decoder.k:19:38
    .rst                       (reg_rst_delayed[9]),	// codebook_decoder.k:19:38
    .done_out                  (/* unused */),
    .memory_read_data_in_12_3  (__grid_read_data_out_3),	// codebook_decoder.k:12:5
    .memory_read_addr_out_12_3 (_decode_m3_BasicBlock_0Impl_memory_read_addr_out_12_3),
    .memory_rden_out_12_3      (_decode_m3_BasicBlock_0Impl_memory_rden_out_12_3),
    .fifo_data_out_0           (_decode_m3_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0               (_decode_m3_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_3.almost_full),	// codebook_decoder.k:19:38
    .fifo_overflow_in_0        (fifo_data_3.overflow),	// codebook_decoder.k:19:38
    .data_in_9                 (passthrough_data_9.data),	// codebook_decoder.k:19:38
    .input_fifo_underflow_0    (passthrough_data_9.underflow),	// codebook_decoder.k:19:38
    .input_rdy_0               (_decode_m3_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_9.valid),	// codebook_decoder.k:19:38
    .control_state_out         (/* unused */)
  );	// codebook_decoder.k:19:38
  codebook_decoder_write_entry_BasicBlock_0 write_entry_BasicBlock_0Impl (	// codebook_decoder.k:24:9
    .clk                        (clk),	// codebook_decoder.k:24:9
    .rst                        (reg_rst_delayed[10]),	// codebook_decoder.k:24:9
    .done_out                   (/* unused */),
    .memory_write_data_out_12_0
      (_write_entry_BasicBlock_0Impl_memory_write_data_out_12_0),
    .memory_write_addr_out_12_0
      (_write_entry_BasicBlock_0Impl_memory_write_addr_out_12_0),
    .memory_wren_12_0           (_write_entry_BasicBlock_0Impl_memory_wren_12_0),
    .fifo_wren_0                (_write_entry_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0  (fifo_data_4.almost_full),	// codebook_decoder.k:24:9
    .fifo_overflow_in_0         (fifo_data_4.overflow),	// codebook_decoder.k:24:9
    .data_in_10                 (passthrough_data_10.data),	// codebook_decoder.k:24:9
    .input_fifo_underflow_0     (passthrough_data_10.underflow),	// codebook_decoder.k:24:9
    .input_rdy_0                (_write_entry_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0              (passthrough_data_10.valid),	// codebook_decoder.k:24:9
    .control_state_out          (/* unused */)
  );	// codebook_decoder.k:24:9
  codebook_decoder_read_entry_BasicBlock_0 read_entry_BasicBlock_0Impl (	// codebook_decoder.k:29:9
    .clk                       (clk),	// codebook_decoder.k:29:9
    .rst                       (reg_rst_delayed[11]),	// codebook_decoder.k:29:9
    .done_out                  (/* unused */),
    .memory_read_data_in_12_4  (__grid_read_data_out_4),	// codebook_decoder.k:12:5
    .memory_read_addr_out_12_4 (_read_entry_BasicBlock_0Impl_memory_read_addr_out_12_4),
    .memory_rden_out_12_4      (_read_entry_BasicBlock_0Impl_memory_rden_out_12_4),
    .fifo_data_out_0           (_read_entry_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0               (_read_entry_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_5.almost_full),	// codebook_decoder.k:29:9
    .fifo_overflow_in_0        (fifo_data_5.overflow),	// codebook_decoder.k:29:9
    .data_in_11                (passthrough_data_11.data),	// codebook_decoder.k:29:9
    .input_fifo_underflow_0    (passthrough_data_11.underflow),	// codebook_decoder.k:29:9
    .input_rdy_0               (_read_entry_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_11.valid),	// codebook_decoder.k:29:9
    .control_state_out         (/* unused */)
  );	// codebook_decoder.k:29:9
  assign rst_and_startup_done_out = rst_and_startup_done_out_net;
  assign decode_m0_rdy_out = decode_m0_rdy_out_net;
  assign decode_m0_empty_out = decode_m0_empty_out_net;
  assign decode_m0_result_out = decode_m0_result_out_net;
  assign decode_m1_rdy_out = decode_m1_rdy_out_net;
  assign decode_m1_empty_out = decode_m1_empty_out_net;
  assign decode_m1_result_out = decode_m1_result_out_net;
  assign decode_m2_rdy_out = decode_m2_rdy_out_net;
  assign decode_m2_empty_out = decode_m2_empty_out_net;
  assign decode_m2_result_out = decode_m2_result_out_net;
  assign decode_m3_rdy_out = decode_m3_rdy_out_net;
  assign decode_m3_empty_out = decode_m3_empty_out_net;
  assign decode_m3_result_out = decode_m3_result_out_net;
  assign write_entry_rdy_out = write_entry_rdy_out_net;
  assign write_entry_empty_out = write_entry_empty_out_net;
  assign read_entry_rdy_out = read_entry_rdy_out_net;
  assign read_entry_empty_out = read_entry_empty_out_net;
  assign read_entry_result_out = read_entry_result_out_net;
  assign stall_rate_supported_out = stall_rate_supported_out_net;
endmodule

module codebook_decoder_EsiWrapper(
     input  wire                                                         clk,
     input  wire                                                         rst,
     input  wire [2:0]                                                   stall_rate_in,
     input  wire                                                         stall_rate_valid_in,
     input  wire struct packed {logic [8:0] index; }                     decode_m0_arg,
     input  wire                                                         decode_m0_arg_valid,
     input  wire struct packed {logic [8:0] index; }                     decode_m1_arg,
     input  wire                                                         decode_m1_arg_valid,
     input  wire struct packed {logic [8:0] index; }                     decode_m2_arg,
     input  wire                                                         decode_m2_arg_valid,
     input  wire struct packed {logic [8:0] index; }                     decode_m3_arg,
     input  wire                                                         decode_m3_arg_valid,
     input  wire struct packed {logic [8:0] index; }                     read_entry_arg,
     input  wire                                                         read_entry_arg_valid,
     input  wire struct packed {logic [8:0] index; logic [31:0] value; } write_entry_arg,
     input  wire                                                         write_entry_arg_valid,
     input  wire                                                         decode_m0_result_rden,
     input  wire                                                         decode_m1_result_rden,
     input  wire                                                         decode_m2_result_rden,
     input  wire                                                         decode_m3_result_rden,
     input  wire                                                         read_entry_result_rden,
     input  wire                                                         write_entry_result_rden,
     output wire                                                         decode_m0_arg_ready,
     output wire                                                         decode_m1_arg_ready,
     output wire                                                         decode_m2_arg_ready,
     output wire                                                         decode_m3_arg_ready,
     output wire                                                         read_entry_arg_ready,
     output wire                                                         write_entry_arg_ready,
     output wire [3:0]                                                   decode_m0_result,
     output wire                                                         decode_m0_result_empty,
     output wire [3:0]                                                   decode_m1_result,
     output wire                                                         decode_m1_result_empty,
     output wire [3:0]                                                   decode_m2_result,
     output wire                                                         decode_m2_result_empty,
     output wire [3:0]                                                   decode_m3_result,
     output wire                                                         decode_m3_result_empty,
     output wire [31:0]                                                  read_entry_result,
     output wire                                                         read_entry_result_empty,
  // output wire /*Zero Width*/                                          write_entry_result,
     output wire                                                         write_entry_result_empty,
     output wire                                                         rst_and_startup_done_out,
     output wire                                                         stall_rate_supported_out
);

  wire [3:0]  _EsiWrapped_decode_m0_result_out;
  wire [3:0]  _EsiWrapped_decode_m1_result_out;
  wire [3:0]  _EsiWrapped_decode_m2_result_out;
  wire [3:0]  _EsiWrapped_decode_m3_result_out;
  wire [31:0] _EsiWrapped_read_entry_result_out;
  codebook_decoder EsiWrapped (
    .clk                      (clk),
    .rst                      (rst),
    .decode_m0_valid_in       (decode_m0_arg_valid),
    .decode_m0_index_in       (decode_m0_arg.index),
    .decode_m0_rden_in        (decode_m0_result_rden),
    .decode_m1_valid_in       (decode_m1_arg_valid),
    .decode_m1_index_in       (decode_m1_arg.index),
    .decode_m1_rden_in        (decode_m1_result_rden),
    .decode_m2_valid_in       (decode_m2_arg_valid),
    .decode_m2_index_in       (decode_m2_arg.index),
    .decode_m2_rden_in        (decode_m2_result_rden),
    .decode_m3_valid_in       (decode_m3_arg_valid),
    .decode_m3_index_in       (decode_m3_arg.index),
    .decode_m3_rden_in        (decode_m3_result_rden),
    .write_entry_valid_in     (write_entry_arg_valid),
    .write_entry_index_in     (write_entry_arg.index),
    .write_entry_value_in     (write_entry_arg.value),
    .write_entry_rden_in      (write_entry_result_rden),
    .read_entry_valid_in      (read_entry_arg_valid),
    .read_entry_index_in      (read_entry_arg.index),
    .read_entry_rden_in       (read_entry_result_rden),
    .stall_rate_in            (stall_rate_in),
    .stall_rate_valid_in      (stall_rate_valid_in),
    .rst_and_startup_done_out (rst_and_startup_done_out),
    .decode_m0_rdy_out        (decode_m0_arg_ready),
    .decode_m0_empty_out      (decode_m0_result_empty),
    .decode_m0_result_out     (_EsiWrapped_decode_m0_result_out),
    .decode_m1_rdy_out        (decode_m1_arg_ready),
    .decode_m1_empty_out      (decode_m1_result_empty),
    .decode_m1_result_out     (_EsiWrapped_decode_m1_result_out),
    .decode_m2_rdy_out        (decode_m2_arg_ready),
    .decode_m2_empty_out      (decode_m2_result_empty),
    .decode_m2_result_out     (_EsiWrapped_decode_m2_result_out),
    .decode_m3_rdy_out        (decode_m3_arg_ready),
    .decode_m3_empty_out      (decode_m3_result_empty),
    .decode_m3_result_out     (_EsiWrapped_decode_m3_result_out),
    .write_entry_rdy_out      (write_entry_arg_ready),
    .write_entry_empty_out    (write_entry_result_empty),
    .read_entry_rdy_out       (read_entry_arg_ready),
    .read_entry_empty_out     (read_entry_result_empty),
    .read_entry_result_out    (_EsiWrapped_read_entry_result_out),
    .stall_rate_supported_out (stall_rate_supported_out)
  );
  assign decode_m0_result = _EsiWrapped_decode_m0_result_out;
  assign decode_m1_result = _EsiWrapped_decode_m1_result_out;
  assign decode_m2_result = _EsiWrapped_decode_m2_result_out;
  assign decode_m3_result = _EsiWrapped_decode_m3_result_out;
  assign read_entry_result = _EsiWrapped_read_entry_result_out;
  // Zero width: assign write_entry_result = /*Zero width*/;
endmodule

