
// This file was generated. Do not modify.
// kanagawa --backend=sv --import-dir=third-party/kanagawa/library --base-library=third-party/kanagawa/library/mini-base.k --output=rtl/generated/kanagawa/embed_rom rtl/kanagawa/embed_rom.k

`default_nettype wire
module embed_romDebugView_read_chunkEntry
(
    input wire clk,
    input wire[15:0]  _addr,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("read_chunkEntry time: %0t addr: %p", $time, _addr);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module embed_romDebugView_read_chunkExit
(
    input wire clk,
    input wire[191:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("read_chunkExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module embed_romDebugView_write_chunkEntry
(
    input wire clk,
    input wire[15:0]  _addr,
    input wire[191:0]  _value,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("write_chunkEntry time: %0t addr: %p value: %p", $time, _addr, _value);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module embed_romDebugView_set_bank_scaleEntry
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
module embed_romDebugView_set_tensor_scaleEntry
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
module embed_romDebugView_get_bank_scaleExit
(
    input wire clk,
    input wire[7:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("get_bank_scaleExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module embed_romDebugView_get_tensor_scaleExit
(
    input wire clk,
    input wire[31:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("get_tensor_scaleExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
`ifndef _TYPESCOPE_CoreModuleTypeScope
`define _TYPESCOPE_CoreModuleTypeScope
`endif // _TYPESCOPE_CoreModuleTypeScope
module embed_rom_get_tensor_scale_BasicBlock_0(	// embed_rom.k:49:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  input  wire [31:0] global_in__tensor_scale_10,
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
  wire  [31:0] global_in__tensor_scale_10_0 = global_in__tensor_scale_10;	// embed_rom.k:49:9
  logic        done_out_0;	// embed_rom.k:49:9
  logic [31:0] fifo_data_out_0_0;	// embed_rom.k:49:9
  logic        fifo_wren_0_0;	// embed_rom.k:49:9
  logic        input_rdy_0_0;	// embed_rom.k:49:9
  logic [7:0]  control_state_out_0;	// embed_rom.k:49:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// embed_rom.k:49:9
  always_comb begin	// embed_rom.k:49:9
    input_rdy_0_0 = _GEN;	// embed_rom.k:49:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// embed_rom.k:49:9
  end // always_comb
  reg          p0_stage1_enable = 1'h0;	// embed_rom.k:49:9
  reg   [31:0] p0_global_in__tensor_scale_10;	// embed_rom.k:49:9
  reg          p0_stage2_enable = 1'h0;	// embed_rom.k:49:9
  always @(posedge clk) begin	// embed_rom.k:49:9
    if (rst)	// embed_rom.k:49:9
      p0_stage1_enable <= 1'h0;	// embed_rom.k:49:9
    else	// embed_rom.k:49:9
      p0_stage1_enable <= _GEN & input_valid_0;	// embed_rom.k:49:9
    p0_global_in__tensor_scale_10 <= global_in__tensor_scale_10_0;	// embed_rom.k:49:9
    if (rst)	// embed_rom.k:49:9
      p0_stage2_enable <= 1'h0;	// embed_rom.k:49:9
    else	// embed_rom.k:49:9
      p0_stage2_enable <= p0_stage1_enable;	// embed_rom.k:49:9
  end // always @(posedge)
  always_comb begin	// embed_rom.k:49:9
    fifo_wren_0_0 = p0_stage2_enable;	// embed_rom.k:47:5, :49:9
    fifo_data_out_0_0 = p0_global_in__tensor_scale_10;	// embed_rom.k:47:5, :49:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// embed_rom.k:49:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// embed_rom.k:49:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  embed_romDebugView_get_tensor_scaleExit embed_romDebugView_get_tensor_scaleExit_instance (	// embed_rom.k:47:5
    .clk          (clk),	// embed_rom.k:47:5
    ._ReturnValue (p0_stage1_enable ? global_in__tensor_scale_10_0 : 'x),	// embed_rom.k:47:5, :49:9
    .valid        (p0_stage1_enable),	// embed_rom.k:49:9
    .valid_out    (/* unused */)
  );	// embed_rom.k:47:5
  assign done_out = p0_stage2_enable;	// embed_rom.k:49:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// embed_rom.k:49:9
  assign fifo_wren_0 = fifo_wren_0_0;	// embed_rom.k:49:9
  assign input_rdy_0 = input_rdy_0_0;	// embed_rom.k:49:9
  assign control_state_out = control_state_out_0;	// embed_rom.k:49:9
endmodule

module embed_rom_get_bank_scale_BasicBlock_0(	// embed_rom.k:44:9
  input  wire       clk,
  input  wire       rst,
  output wire       done_out,
  input  wire [7:0] global_in__bank_scale_9,
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
  wire  [7:0] global_in__bank_scale_9_0 = global_in__bank_scale_9;	// embed_rom.k:44:9
  logic       done_out_0;	// embed_rom.k:44:9
  logic [7:0] fifo_data_out_0_0;	// embed_rom.k:44:9
  logic       fifo_wren_0_0;	// embed_rom.k:44:9
  logic       input_rdy_0_0;	// embed_rom.k:44:9
  logic [7:0] control_state_out_0;	// embed_rom.k:44:9
  wire        _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// embed_rom.k:44:9
  always_comb begin	// embed_rom.k:44:9
    input_rdy_0_0 = _GEN;	// embed_rom.k:44:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// embed_rom.k:44:9
  end // always_comb
  reg         p0_stage1_enable = 1'h0;	// embed_rom.k:44:9
  reg   [7:0] p0_global_in__bank_scale_9;	// embed_rom.k:44:9
  reg         p0_stage2_enable = 1'h0;	// embed_rom.k:44:9
  always @(posedge clk) begin	// embed_rom.k:44:9
    if (rst)	// embed_rom.k:44:9
      p0_stage1_enable <= 1'h0;	// embed_rom.k:44:9
    else	// embed_rom.k:44:9
      p0_stage1_enable <= _GEN & input_valid_0;	// embed_rom.k:44:9
    p0_global_in__bank_scale_9 <= global_in__bank_scale_9_0;	// embed_rom.k:44:9
    if (rst)	// embed_rom.k:44:9
      p0_stage2_enable <= 1'h0;	// embed_rom.k:44:9
    else	// embed_rom.k:44:9
      p0_stage2_enable <= p0_stage1_enable;	// embed_rom.k:44:9
  end // always @(posedge)
  always_comb begin	// embed_rom.k:44:9
    fifo_wren_0_0 = p0_stage2_enable;	// embed_rom.k:42:5, :44:9
    fifo_data_out_0_0 = p0_global_in__bank_scale_9;	// embed_rom.k:42:5, :44:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// embed_rom.k:44:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// embed_rom.k:44:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  embed_romDebugView_get_bank_scaleExit embed_romDebugView_get_bank_scaleExit_instance (	// embed_rom.k:42:5
    .clk          (clk),	// embed_rom.k:42:5
    ._ReturnValue (p0_stage1_enable ? global_in__bank_scale_9_0 : 'x),	// embed_rom.k:42:5, :44:9
    .valid        (p0_stage1_enable),	// embed_rom.k:44:9
    .valid_out    (/* unused */)
  );	// embed_rom.k:42:5
  assign done_out = p0_stage2_enable;	// embed_rom.k:44:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// embed_rom.k:44:9
  assign fifo_wren_0 = fifo_wren_0_0;	// embed_rom.k:44:9
  assign input_rdy_0 = input_rdy_0_0;	// embed_rom.k:44:9
  assign control_state_out = control_state_out_0;	// embed_rom.k:44:9
endmodule

module embed_rom_set_tensor_scale_BasicBlock_0(	// embed_rom.k:39:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  output wire        global_out__tensor_scale_10_0_valid,
  output wire [31:0] global_out__tensor_scale_10_0,
  output wire        fifo_wren_0,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [31:0] data_in_9,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  logic        done_out_0;	// embed_rom.k:39:9
  logic        global_out__tensor_scale_10_0_valid_0;	// embed_rom.k:39:9
  logic [31:0] global_out__tensor_scale_10_0_0;	// embed_rom.k:39:9
  logic        fifo_wren_0_0;	// embed_rom.k:39:9
  logic        input_rdy_0_0;	// embed_rom.k:39:9
  logic [7:0]  control_state_out_0;	// embed_rom.k:39:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// embed_rom.k:39:9
  always_comb begin	// embed_rom.k:39:9
    input_rdy_0_0 = _GEN;	// embed_rom.k:39:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// embed_rom.k:39:9
  end // always_comb
  reg   [31:0] p0_data_in_9;	// embed_rom.k:39:9
  reg          p0_stage1_enable = 1'h0;	// embed_rom.k:39:9
  always_comb begin	// embed_rom.k:39:9
    global_out__tensor_scale_10_0_0 = p0_data_in_9;	// embed_rom.k:39:9
    global_out__tensor_scale_10_0_valid_0 = p0_stage1_enable;	// embed_rom.k:39:9
  end // always_comb
  reg          p0_stage2_enable = 1'h0;	// embed_rom.k:39:9
  always @(posedge clk) begin	// embed_rom.k:39:9
    p0_data_in_9 <= data_in_9;	// embed_rom.k:39:9
    if (rst) begin	// embed_rom.k:39:9
      p0_stage1_enable <= 1'h0;	// embed_rom.k:39:9
      p0_stage2_enable <= 1'h0;	// embed_rom.k:39:9
    end
    else begin	// embed_rom.k:39:9
      p0_stage1_enable <= _GEN & input_valid_0;	// embed_rom.k:39:9
      p0_stage2_enable <= p0_stage1_enable;	// embed_rom.k:39:9
    end
  end // always @(posedge)
  always_comb	// embed_rom.k:39:9
    fifo_wren_0_0 = p0_stage2_enable;	// embed_rom.k:39:9, :40:9
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// embed_rom.k:39:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// embed_rom.k:39:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  embed_romDebugView_set_tensor_scaleEntry embed_romDebugView_set_tensor_scaleEntry_instance (	// embed_rom.k:40:9
    .clk       (clk),	// embed_rom.k:40:9
    ._value    (p0_stage1_enable ? p0_data_in_9 : 'x),	// embed_rom.k:39:9, :40:9
    .valid     (p0_stage1_enable),	// embed_rom.k:39:9
    .valid_out (/* unused */)
  );	// embed_rom.k:40:9
  assign done_out = p0_stage2_enable;	// embed_rom.k:39:9
  assign global_out__tensor_scale_10_0_valid = global_out__tensor_scale_10_0_valid_0;	// embed_rom.k:39:9
  assign global_out__tensor_scale_10_0 = global_out__tensor_scale_10_0_0;	// embed_rom.k:39:9
  assign fifo_wren_0 = fifo_wren_0_0;	// embed_rom.k:39:9
  assign input_rdy_0 = input_rdy_0_0;	// embed_rom.k:39:9
  assign control_state_out = control_state_out_0;	// embed_rom.k:39:9
endmodule

module embed_rom_set_bank_scale_BasicBlock_0(	// embed_rom.k:34:9
  input  wire       clk,
  input  wire       rst,
  output wire       done_out,
  output wire       global_out__bank_scale_9_0_valid,
  output wire [7:0] global_out__bank_scale_9_0,
  output wire       fifo_wren_0,
  input  wire       fifo_almost_full_in_raw_0,
  input  wire       fifo_overflow_in_0,
  input  wire [7:0] data_in_8,
  input  wire       input_fifo_underflow_0,
  output wire       input_rdy_0,
  input  wire       input_valid_0,
  output wire [7:0] control_state_out
);

  wire        _fifo_overflow_ffc_0_data_out;
  wire        _fifo_almostfull_ffc_0_data_out;
  logic       done_out_0;	// embed_rom.k:34:9
  logic       global_out__bank_scale_9_0_valid_0;	// embed_rom.k:34:9
  logic [7:0] global_out__bank_scale_9_0_0;	// embed_rom.k:34:9
  logic       fifo_wren_0_0;	// embed_rom.k:34:9
  logic       input_rdy_0_0;	// embed_rom.k:34:9
  logic [7:0] control_state_out_0;	// embed_rom.k:34:9
  wire        _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// embed_rom.k:34:9
  always_comb begin	// embed_rom.k:34:9
    input_rdy_0_0 = _GEN;	// embed_rom.k:34:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// embed_rom.k:34:9
  end // always_comb
  reg   [7:0] p0_data_in_8;	// embed_rom.k:34:9
  reg         p0_stage1_enable = 1'h0;	// embed_rom.k:34:9
  always_comb begin	// embed_rom.k:34:9
    global_out__bank_scale_9_0_0 = p0_data_in_8;	// embed_rom.k:34:9
    global_out__bank_scale_9_0_valid_0 = p0_stage1_enable;	// embed_rom.k:34:9
  end // always_comb
  reg         p0_stage2_enable = 1'h0;	// embed_rom.k:34:9
  always @(posedge clk) begin	// embed_rom.k:34:9
    p0_data_in_8 <= data_in_8;	// embed_rom.k:34:9
    if (rst) begin	// embed_rom.k:34:9
      p0_stage1_enable <= 1'h0;	// embed_rom.k:34:9
      p0_stage2_enable <= 1'h0;	// embed_rom.k:34:9
    end
    else begin	// embed_rom.k:34:9
      p0_stage1_enable <= _GEN & input_valid_0;	// embed_rom.k:34:9
      p0_stage2_enable <= p0_stage1_enable;	// embed_rom.k:34:9
    end
  end // always @(posedge)
  always_comb	// embed_rom.k:34:9
    fifo_wren_0_0 = p0_stage2_enable;	// embed_rom.k:34:9, :35:9
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// embed_rom.k:34:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// embed_rom.k:34:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  embed_romDebugView_set_bank_scaleEntry embed_romDebugView_set_bank_scaleEntry_instance (	// embed_rom.k:35:9
    .clk       (clk),	// embed_rom.k:35:9
    ._value    (p0_stage1_enable ? p0_data_in_8 : 'x),	// embed_rom.k:34:9, :35:9
    .valid     (p0_stage1_enable),	// embed_rom.k:34:9
    .valid_out (/* unused */)
  );	// embed_rom.k:35:9
  assign done_out = p0_stage2_enable;	// embed_rom.k:34:9
  assign global_out__bank_scale_9_0_valid = global_out__bank_scale_9_0_valid_0;	// embed_rom.k:34:9
  assign global_out__bank_scale_9_0 = global_out__bank_scale_9_0_0;	// embed_rom.k:34:9
  assign fifo_wren_0 = fifo_wren_0_0;	// embed_rom.k:34:9
  assign input_rdy_0 = input_rdy_0_0;	// embed_rom.k:34:9
  assign control_state_out = control_state_out_0;	// embed_rom.k:34:9
endmodule

module embed_rom_write_chunk_BasicBlock_0(	// embed_rom.k:29:9
  input  wire         clk,
  input  wire         rst,
  output wire         done_out,
  output wire [191:0] memory_write_data_out_8_0,
  output wire [15:0]  memory_write_addr_out_8_0,
  output wire         memory_wren_8_0,
  output wire         fifo_wren_0,
  input  wire         fifo_almost_full_in_raw_0,
  input  wire         fifo_overflow_in_0,
  input  wire [207:0] data_in_7,
  input  wire         input_fifo_underflow_0,
  output wire         input_rdy_0,
  input  wire         input_valid_0,
  output wire [7:0]   control_state_out
);

  wire          _fifo_overflow_ffc_0_data_out;
  wire          _fifo_almostfull_ffc_0_data_out;
  logic         done_out_0;	// embed_rom.k:29:9
  logic [191:0] memory_write_data_out_8_0_0;	// embed_rom.k:29:9
  logic [15:0]  memory_write_addr_out_8_0_0;	// embed_rom.k:29:9
  logic         memory_wren_8_0_0;	// embed_rom.k:29:9
  logic         fifo_wren_0_0;	// embed_rom.k:29:9
  logic         input_rdy_0_0;	// embed_rom.k:29:9
  logic [7:0]   control_state_out_0;	// embed_rom.k:29:9
  wire          _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// embed_rom.k:29:9
  wire          _GEN_0 = _GEN & input_valid_0;	// embed_rom.k:29:9
  always_comb begin	// embed_rom.k:29:9
    input_rdy_0_0 = _GEN;	// embed_rom.k:29:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// embed_rom.k:29:9
  end // always_comb
  always_comb begin	// embed_rom.k:29:9
    memory_wren_8_0_0 = _GEN_0;	// embed_rom.k:29:{9,18}
    memory_write_addr_out_8_0_0 = data_in_7[15:0];	// embed_rom.k:29:18
    memory_write_data_out_8_0_0 = data_in_7[207:16];	// embed_rom.k:29:18
  end // always_comb
  reg   [15:0]  p0_addr;	// embed_rom.k:29:9
  reg   [191:0] p0_value;	// embed_rom.k:29:9
  reg           p0_stage1_enable = 1'h0;	// embed_rom.k:29:9
  reg           p0_stage2_enable = 1'h0;	// embed_rom.k:29:9
  always @(posedge clk) begin	// embed_rom.k:29:9
    p0_addr <= data_in_7[15:0];	// embed_rom.k:29:9
    p0_value <= data_in_7[207:16];	// embed_rom.k:29:9
    if (rst) begin	// embed_rom.k:29:9
      p0_stage1_enable <= 1'h0;	// embed_rom.k:29:9
      p0_stage2_enable <= 1'h0;	// embed_rom.k:29:9
    end
    else begin	// embed_rom.k:29:9
      p0_stage1_enable <= _GEN_0;	// embed_rom.k:29:9
      p0_stage2_enable <= p0_stage1_enable;	// embed_rom.k:29:9
    end
  end // always @(posedge)
  always_comb	// embed_rom.k:29:9
    fifo_wren_0_0 = p0_stage2_enable;	// embed_rom.k:29:9, :30:9
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// embed_rom.k:29:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// embed_rom.k:29:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  embed_romDebugView_write_chunkEntry embed_romDebugView_write_chunkEntry_instance (	// embed_rom.k:30:9
    .clk       (clk),	// embed_rom.k:30:9
    ._addr     (p0_stage1_enable ? p0_addr : 'x),	// embed_rom.k:29:9, :30:9
    ._value    (p0_stage1_enable ? p0_value : 'x),	// embed_rom.k:29:9, :30:9
    .valid     (p0_stage1_enable),	// embed_rom.k:29:9
    .valid_out (/* unused */)
  );	// embed_rom.k:30:9
  assign done_out = p0_stage2_enable;	// embed_rom.k:29:9
  assign memory_write_data_out_8_0 = memory_write_data_out_8_0_0;	// embed_rom.k:29:9
  assign memory_write_addr_out_8_0 = memory_write_addr_out_8_0_0;	// embed_rom.k:29:9
  assign memory_wren_8_0 = memory_wren_8_0_0;	// embed_rom.k:29:9
  assign fifo_wren_0 = fifo_wren_0_0;	// embed_rom.k:29:9
  assign input_rdy_0 = input_rdy_0_0;	// embed_rom.k:29:9
  assign control_state_out = control_state_out_0;	// embed_rom.k:29:9
endmodule

module embed_rom_read_chunk_BasicBlock_0(	// embed_rom.k:21:9
  input  wire         clk,
  input  wire         rst,
  output wire         done_out,
  input  wire [191:0] memory_read_data_in_8_0,
  output wire [15:0]  memory_read_addr_out_8_0,
  output wire         memory_rden_out_8_0,
  output wire [191:0] fifo_data_out_0,
  output wire         fifo_wren_0,
  input  wire         fifo_almost_full_in_raw_0,
  input  wire         fifo_overflow_in_0,
  input  wire [15:0]  data_in_6,
  input  wire         input_fifo_underflow_0,
  output wire         input_rdy_0,
  input  wire         input_valid_0,
  output wire [7:0]   control_state_out
);

  wire          _fifo_overflow_ffc_0_data_out;
  wire          _fifo_almostfull_ffc_0_data_out;
  wire  [191:0] memory_read_data_in_8_0_0 = memory_read_data_in_8_0;	// embed_rom.k:21:9
  logic         done_out_0;	// embed_rom.k:21:9
  logic [15:0]  memory_read_addr_out_8_0_0;	// embed_rom.k:21:9
  logic         memory_rden_out_8_0_0;	// embed_rom.k:21:9
  logic [191:0] fifo_data_out_0_0;	// embed_rom.k:21:9
  logic         fifo_wren_0_0;	// embed_rom.k:21:9
  logic         input_rdy_0_0;	// embed_rom.k:21:9
  logic [7:0]   control_state_out_0;	// embed_rom.k:21:9
  wire          _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// embed_rom.k:21:9
  wire          _GEN_0 = _GEN & input_valid_0;	// embed_rom.k:21:9
  always_comb begin	// embed_rom.k:21:9
    input_rdy_0_0 = _GEN;	// embed_rom.k:21:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// embed_rom.k:21:9
  end // always_comb
  always_comb begin	// embed_rom.k:21:9
    memory_read_addr_out_8_0_0 = data_in_6;	// embed_rom.k:22:27
    memory_rden_out_8_0_0 = _GEN_0;	// embed_rom.k:21:9, :22:27
  end // always_comb
  reg   [15:0]  p0_data_in_6;	// embed_rom.k:21:9
  reg           p0_stage1_enable = 1'h0;	// embed_rom.k:21:9
  reg           p0_stage2_enable = 1'h0;	// embed_rom.k:21:9
  reg   [191:0] p0_memory_read_data_in_8_0;	// embed_rom.k:21:9
  reg           p0_stage3_enable = 1'h0;	// embed_rom.k:21:9
  always @(posedge clk) begin	// embed_rom.k:21:9
    p0_data_in_6 <= data_in_6;	// embed_rom.k:21:9
    if (rst) begin	// embed_rom.k:21:9
      p0_stage1_enable <= 1'h0;	// embed_rom.k:21:9
      p0_stage2_enable <= 1'h0;	// embed_rom.k:21:9
    end
    else begin	// embed_rom.k:21:9
      p0_stage1_enable <= _GEN_0;	// embed_rom.k:21:9
      p0_stage2_enable <= p0_stage1_enable;	// embed_rom.k:21:9
    end
    p0_memory_read_data_in_8_0 <= memory_read_data_in_8_0_0;	// embed_rom.k:21:9
    if (rst)	// embed_rom.k:21:9
      p0_stage3_enable <= 1'h0;	// embed_rom.k:21:9
    else	// embed_rom.k:21:9
      p0_stage3_enable <= p0_stage2_enable;	// embed_rom.k:21:9
  end // always @(posedge)
  always_comb begin	// embed_rom.k:21:9
    fifo_wren_0_0 = p0_stage3_enable;	// embed_rom.k:19:5, :21:9
    fifo_data_out_0_0 = p0_memory_read_data_in_8_0;	// embed_rom.k:19:5, :21:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// embed_rom.k:21:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// embed_rom.k:21:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  embed_romDebugView_read_chunkEntry embed_romDebugView_read_chunkEntry_instance (	// embed_rom.k:19:5
    .clk       (clk),	// embed_rom.k:19:5
    ._addr     (p0_stage1_enable ? p0_data_in_6 : 'x),	// embed_rom.k:19:5, :21:9
    .valid     (p0_stage1_enable),	// embed_rom.k:21:9
    .valid_out (/* unused */)
  );	// embed_rom.k:19:5
  embed_romDebugView_read_chunkExit embed_romDebugView_read_chunkExit_instance (	// embed_rom.k:19:5
    .clk          (clk),	// embed_rom.k:19:5
    ._ReturnValue (p0_stage2_enable ? memory_read_data_in_8_0_0 : 'x),	// embed_rom.k:19:5, :21:9
    .valid        (p0_stage2_enable),	// embed_rom.k:21:9
    .valid_out    (/* unused */)
  );	// embed_rom.k:19:5
  assign done_out = p0_stage3_enable;	// embed_rom.k:21:9
  assign memory_read_addr_out_8_0 = memory_read_addr_out_8_0_0;	// embed_rom.k:21:9
  assign memory_rden_out_8_0 = memory_rden_out_8_0_0;	// embed_rom.k:21:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// embed_rom.k:21:9
  assign fifo_wren_0 = fifo_wren_0_0;	// embed_rom.k:21:9
  assign input_rdy_0 = input_rdy_0_0;	// embed_rom.k:21:9
  assign control_state_out = control_state_out_0;	// embed_rom.k:21:9
endmodule

module embed_rom_reg_8_w1_i_8_0(
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

module embed_rom_reg_32_w1_i_32_0(
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

module embed_rom__embeddings__mem_container(	// embed_rom.k:13:5
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

  wire [1:0][191:0] ___embeddings_0_data_out;	// embed_rom.k:13:5
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
  ) __embeddings_0 (	// embed_rom.k:13:5
    .clk            (clk),	// embed_rom.k:13:5
    .rst            (rst),
    .addr_in        ({{read_addr_in_0}, {write_addr_in_0}}),	// embed_rom.k:13:5
    .ecc_status_out (/* unused */),
    .wren_in        ({{1'h0}, {wren_in_0}}),	// embed_rom.k:13:5
    .data_in        ({{192'h0}, {write_data_in_0}}),	// embed_rom.k:13:5
    .rden_in        ({{rden_in_0}, {1'h0}}),	// embed_rom.k:13:5
    .data_out       (___embeddings_0_data_out)
  );	// embed_rom.k:13:5
  assign read_data_out_0 = ___embeddings_0_data_out[1'h1];	// embed_rom.k:13:5
  assign init_completed = 1'h1;	// embed_rom.k:13:5
endmodule

module embed_rom(
  input  wire         clk,
  input  wire         rst,
  input  wire         read_chunk_valid_in,
  input  wire [15:0]  read_chunk_addr_in,
  input  wire         read_chunk_rden_in,
  input  wire         write_chunk_valid_in,
  input  wire [15:0]  write_chunk_addr_in,
  input  wire [191:0] write_chunk_value_in,
  input  wire         write_chunk_rden_in,
  input  wire         set_bank_scale_valid_in,
  input  wire [7:0]   set_bank_scale_value_in,
  input  wire         set_bank_scale_rden_in,
  input  wire         set_tensor_scale_valid_in,
  input  wire [31:0]  set_tensor_scale_value_in,
  input  wire         set_tensor_scale_rden_in,
  input  wire         get_bank_scale_valid_in,
  input  wire         get_bank_scale_rden_in,
  input  wire         get_tensor_scale_valid_in,
  input  wire         get_tensor_scale_rden_in,
  input  wire [2:0]   stall_rate_in,
  input  wire         stall_rate_valid_in,
  output wire         rst_and_startup_done_out,
  output wire         read_chunk_rdy_out,
  output wire         read_chunk_empty_out,
  output wire [191:0] read_chunk_result_out,
  output wire         write_chunk_rdy_out,
  output wire         write_chunk_empty_out,
  output wire         set_bank_scale_rdy_out,
  output wire         set_bank_scale_empty_out,
  output wire         set_tensor_scale_rdy_out,
  output wire         set_tensor_scale_empty_out,
  output wire         get_bank_scale_rdy_out,
  output wire         get_bank_scale_empty_out,
  output wire [7:0]   get_bank_scale_result_out,
  output wire         get_tensor_scale_rdy_out,
  output wire         get_tensor_scale_empty_out,
  output wire [31:0]  get_tensor_scale_result_out,
  output wire         stall_rate_supported_out
);

  wire [31:0]  _get_tensor_scale_BasicBlock_0Impl_fifo_data_out_0;	// embed_rom.k:49:9
  wire         _get_tensor_scale_BasicBlock_0Impl_fifo_wren_0;	// embed_rom.k:49:9
  wire         _get_tensor_scale_BasicBlock_0Impl_input_rdy_0;	// embed_rom.k:49:9
  wire [7:0]   _get_bank_scale_BasicBlock_0Impl_fifo_data_out_0;	// embed_rom.k:44:9
  wire         _get_bank_scale_BasicBlock_0Impl_fifo_wren_0;	// embed_rom.k:44:9
  wire         _get_bank_scale_BasicBlock_0Impl_input_rdy_0;	// embed_rom.k:44:9
  wire         _set_tensor_scale_BasicBlock_0Impl_global_out__tensor_scale_10_0_valid;	// embed_rom.k:39:9
  wire [31:0]  _set_tensor_scale_BasicBlock_0Impl_global_out__tensor_scale_10_0;	// embed_rom.k:39:9
  wire         _set_tensor_scale_BasicBlock_0Impl_fifo_wren_0;	// embed_rom.k:39:9
  wire         _set_tensor_scale_BasicBlock_0Impl_input_rdy_0;	// embed_rom.k:39:9
  wire         _set_bank_scale_BasicBlock_0Impl_global_out__bank_scale_9_0_valid;	// embed_rom.k:34:9
  wire [7:0]   _set_bank_scale_BasicBlock_0Impl_global_out__bank_scale_9_0;	// embed_rom.k:34:9
  wire         _set_bank_scale_BasicBlock_0Impl_fifo_wren_0;	// embed_rom.k:34:9
  wire         _set_bank_scale_BasicBlock_0Impl_input_rdy_0;	// embed_rom.k:34:9
  wire [191:0] _write_chunk_BasicBlock_0Impl_memory_write_data_out_8_0;	// embed_rom.k:29:9
  wire [15:0]  _write_chunk_BasicBlock_0Impl_memory_write_addr_out_8_0;	// embed_rom.k:29:9
  wire         _write_chunk_BasicBlock_0Impl_memory_wren_8_0;	// embed_rom.k:29:9
  wire         _write_chunk_BasicBlock_0Impl_fifo_wren_0;	// embed_rom.k:29:9
  wire         _write_chunk_BasicBlock_0Impl_input_rdy_0;	// embed_rom.k:29:9
  wire [15:0]  _read_chunk_BasicBlock_0Impl_memory_read_addr_out_8_0;	// embed_rom.k:21:9
  wire         _read_chunk_BasicBlock_0Impl_memory_rden_out_8_0;	// embed_rom.k:21:9
  wire [191:0] _read_chunk_BasicBlock_0Impl_fifo_data_out_0;	// embed_rom.k:21:9
  wire         _read_chunk_BasicBlock_0Impl_fifo_wren_0;	// embed_rom.k:21:9
  wire         _read_chunk_BasicBlock_0Impl_input_rdy_0;	// embed_rom.k:21:9
  wire         _fifo_5_get_tensor_scale_Return_overflow_out;
  wire         _fifo_5_get_tensor_scale_Return_underflow_out;
  wire         _fifo_5_get_tensor_scale_Return_empty;
  wire         _fifo_5_get_tensor_scale_Return_full;
  wire [31:0]  _fifo_5_get_tensor_scale_Return_q;
  wire         _fifo_4_get_bank_scale_Return_overflow_out;
  wire         _fifo_4_get_bank_scale_Return_underflow_out;
  wire         _fifo_4_get_bank_scale_Return_empty;
  wire         _fifo_4_get_bank_scale_Return_full;
  wire [7:0]   _fifo_4_get_bank_scale_Return_q;
  wire         _fifo_3_set_tensor_scale_Return_overflow_out;
  wire         _fifo_3_set_tensor_scale_Return_underflow_out;
  wire         _fifo_3_set_tensor_scale_Return_empty;
  wire         _fifo_3_set_tensor_scale_Return_full;
  wire         _fifo_2_set_bank_scale_Return_overflow_out;
  wire         _fifo_2_set_bank_scale_Return_underflow_out;
  wire         _fifo_2_set_bank_scale_Return_empty;
  wire         _fifo_2_set_bank_scale_Return_full;
  wire         _fifo_1_write_chunk_Return_overflow_out;
  wire         _fifo_1_write_chunk_Return_underflow_out;
  wire         _fifo_1_write_chunk_Return_empty;
  wire         _fifo_1_write_chunk_Return_full;
  wire         _fifo_0_read_chunk_Return_overflow_out;
  wire         _fifo_0_read_chunk_Return_underflow_out;
  wire         _fifo_0_read_chunk_Return_empty;
  wire         _fifo_0_read_chunk_Return_full;
  wire [191:0] _fifo_0_read_chunk_Return_q;
  wire         _has_startup_completed_delayed_5_delay_chain_data_out;
  wire         _has_startup_completed_delayed_4_delay_chain_data_out;
  wire         _has_startup_completed_delayed_3_delay_chain_data_out;
  wire         _has_startup_completed_delayed_2_delay_chain_data_out;
  wire         _has_startup_completed_delayed_1_delay_chain_data_out;
  wire         _has_startup_completed_delayed_0_delay_chain_data_out;
  wire [31:0]  __tensor_scale_value_out;	// embed_rom.k:15:5
  wire [7:0]   __bank_scale_value_out;	// embed_rom.k:14:5
  wire [191:0] __embeddings_read_data_out_0;	// embed_rom.k:13:5
  wire         __embeddings_init_completed;	// embed_rom.k:13:5
  wire         _reset_control_rst_and_startup_done_out;
  wire [13:0]  _reset_control_rst_delayed_out;
  wire         _reset_control_reset_sequence_finished_this_cycle_out;
  logic  stall_rate_supported_out_net;
  logic  get_tensor_scale_empty_out_net;
  logic [31:0] get_tensor_scale_result_out_net;
  logic  get_tensor_scale_rdy_out_net;
  logic  get_bank_scale_empty_out_net;
  logic [7:0] get_bank_scale_result_out_net;
  logic  get_bank_scale_rdy_out_net;
  logic  set_tensor_scale_empty_out_net;
  logic  set_tensor_scale_rdy_out_net;
  logic  set_bank_scale_empty_out_net;
  logic  set_bank_scale_rdy_out_net;
  logic  write_chunk_empty_out_net;
  logic  write_chunk_rdy_out_net;
  logic  read_chunk_empty_out_net;
  logic [191:0] read_chunk_result_out_net;
  logic  read_chunk_rdy_out_net;
  logic  rst_and_startup_done_out_net;

  logic [31:0] dropped_commands;
  //synopsys translate_off
  KanagawaStringTable string_table(.clk(clk));
  //synopsys translate_on
  logic [13:0] reg_rst_delayed;
  logic combined_reset;
  assign combined_reset = rst;
  logic reset_sequence_finished_this_cycle;
  logic has_startup_completed_raw;
  logic has_mem_init_completed;
  wire         _GEN = has_startup_completed_raw & __embeddings_init_completed;	// embed_rom.k:13:5
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
      logic [7:0] data_in;
      logic [7:0] data_out;
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
      logic [15:0] data;
      logic underflow;
  } passthrough_data_6;
  assign passthrough_data_6.underflow = 1'b0;
  assign passthrough_data_6.rdy_ext = passthrough_data_6.rdy_int & !(!has_startup_completed_delayed_0);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [207:0] data;
      logic underflow;
  } passthrough_data_7;
  assign passthrough_data_7.underflow = 1'b0;
  assign passthrough_data_7.rdy_ext = passthrough_data_7.rdy_int & !(!has_startup_completed_delayed_1);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [7:0] data;
      logic underflow;
  } passthrough_data_8;
  assign passthrough_data_8.underflow = 1'b0;
  assign passthrough_data_8.rdy_ext = passthrough_data_8.rdy_int & !(!has_startup_completed_delayed_2);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [31:0] data;
      logic underflow;
  } passthrough_data_9;
  assign passthrough_data_9.underflow = 1'b0;
  assign passthrough_data_9.rdy_ext = passthrough_data_9.rdy_int & !(!has_startup_completed_delayed_3);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic underflow;
  } passthrough_data_10;
  assign passthrough_data_10.underflow = 1'b0;
  assign passthrough_data_10.rdy_ext = passthrough_data_10.rdy_int & !(!has_startup_completed_delayed_4);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic underflow;
  } passthrough_data_11;
  assign passthrough_data_11.underflow = 1'b0;
  assign passthrough_data_11.rdy_ext = passthrough_data_11.rdy_int & !(!has_startup_completed_delayed_5);
  assign read_chunk_rdy_out_net = passthrough_data_6.rdy_ext;
  assign passthrough_data_6.valid = read_chunk_rdy_out & read_chunk_valid_in;
  assign passthrough_data_6.data = { read_chunk_addr_in };
  assign fifo_data_0.rden = read_chunk_rden_in;
  assign read_chunk_result_out_net = fifo_data_0.data_out;
  assign read_chunk_empty_out_net = fifo_data_0.empty;
  assign write_chunk_rdy_out_net = passthrough_data_7.rdy_ext;
  assign passthrough_data_7.valid = write_chunk_rdy_out & write_chunk_valid_in;
  assign passthrough_data_7.data = { write_chunk_value_in, write_chunk_addr_in };
  assign fifo_data_1.rden = write_chunk_rden_in;
  assign write_chunk_empty_out_net = fifo_data_1.empty;
  assign set_bank_scale_rdy_out_net = passthrough_data_8.rdy_ext;
  assign passthrough_data_8.valid = set_bank_scale_rdy_out & set_bank_scale_valid_in;
  assign passthrough_data_8.data = { set_bank_scale_value_in };
  assign fifo_data_2.rden = set_bank_scale_rden_in;
  assign set_bank_scale_empty_out_net = fifo_data_2.empty;
  assign set_tensor_scale_rdy_out_net = passthrough_data_9.rdy_ext;
  assign passthrough_data_9.valid = set_tensor_scale_rdy_out & set_tensor_scale_valid_in;
  assign passthrough_data_9.data = { set_tensor_scale_value_in };
  assign fifo_data_3.rden = set_tensor_scale_rden_in;
  assign set_tensor_scale_empty_out_net = fifo_data_3.empty;
  assign get_bank_scale_rdy_out_net = passthrough_data_10.rdy_ext;
  assign passthrough_data_10.valid = get_bank_scale_rdy_out & get_bank_scale_valid_in;
  assign fifo_data_4.rden = get_bank_scale_rden_in;
  assign get_bank_scale_result_out_net = fifo_data_4.data_out;
  assign get_bank_scale_empty_out_net = fifo_data_4.empty;
  assign get_tensor_scale_rdy_out_net = passthrough_data_11.rdy_ext;
  assign passthrough_data_11.valid = get_tensor_scale_rdy_out & get_tensor_scale_valid_in;
  assign fifo_data_5.rden = get_tensor_scale_rden_in;
  assign get_tensor_scale_result_out_net = fifo_data_5.data_out;
  assign get_tensor_scale_empty_out_net = fifo_data_5.empty;
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
    fifo_data_0.overflow = _fifo_0_read_chunk_Return_overflow_out;
    fifo_data_0.underflow = _fifo_0_read_chunk_Return_underflow_out;
    fifo_data_0.empty = _fifo_0_read_chunk_Return_empty;
    fifo_data_0.almost_full = _fifo_0_read_chunk_Return_full;
    fifo_data_0.data_out = _fifo_0_read_chunk_Return_q;
    fifo_data_1.overflow = _fifo_1_write_chunk_Return_overflow_out;
    fifo_data_1.underflow = _fifo_1_write_chunk_Return_underflow_out;
    fifo_data_1.empty = _fifo_1_write_chunk_Return_empty;
    fifo_data_1.almost_full = _fifo_1_write_chunk_Return_full;
    fifo_data_2.overflow = _fifo_2_set_bank_scale_Return_overflow_out;
    fifo_data_2.underflow = _fifo_2_set_bank_scale_Return_underflow_out;
    fifo_data_2.empty = _fifo_2_set_bank_scale_Return_empty;
    fifo_data_2.almost_full = _fifo_2_set_bank_scale_Return_full;
    fifo_data_3.overflow = _fifo_3_set_tensor_scale_Return_overflow_out;
    fifo_data_3.underflow = _fifo_3_set_tensor_scale_Return_underflow_out;
    fifo_data_3.empty = _fifo_3_set_tensor_scale_Return_empty;
    fifo_data_3.almost_full = _fifo_3_set_tensor_scale_Return_full;
    fifo_data_4.overflow = _fifo_4_get_bank_scale_Return_overflow_out;
    fifo_data_4.underflow = _fifo_4_get_bank_scale_Return_underflow_out;
    fifo_data_4.empty = _fifo_4_get_bank_scale_Return_empty;
    fifo_data_4.almost_full = _fifo_4_get_bank_scale_Return_full;
    fifo_data_4.data_out = _fifo_4_get_bank_scale_Return_q;
    fifo_data_5.overflow = _fifo_5_get_tensor_scale_Return_overflow_out;
    fifo_data_5.underflow = _fifo_5_get_tensor_scale_Return_underflow_out;
    fifo_data_5.empty = _fifo_5_get_tensor_scale_Return_empty;
    fifo_data_5.almost_full = _fifo_5_get_tensor_scale_Return_full;
    fifo_data_5.data_out = _fifo_5_get_tensor_scale_Return_q;
    fifo_data_0.data_in = _read_chunk_BasicBlock_0Impl_fifo_data_out_0;	// embed_rom.k:21:9
    fifo_data_0.wren = _read_chunk_BasicBlock_0Impl_fifo_wren_0;	// embed_rom.k:21:9
    passthrough_data_6.rdy_int = _read_chunk_BasicBlock_0Impl_input_rdy_0;	// embed_rom.k:21:9
    fifo_data_1.wren = _write_chunk_BasicBlock_0Impl_fifo_wren_0;	// embed_rom.k:29:9
    passthrough_data_7.rdy_int = _write_chunk_BasicBlock_0Impl_input_rdy_0;	// embed_rom.k:29:9
    fifo_data_2.wren = _set_bank_scale_BasicBlock_0Impl_fifo_wren_0;	// embed_rom.k:34:9
    passthrough_data_8.rdy_int = _set_bank_scale_BasicBlock_0Impl_input_rdy_0;	// embed_rom.k:34:9
    fifo_data_3.wren = _set_tensor_scale_BasicBlock_0Impl_fifo_wren_0;	// embed_rom.k:39:9
    passthrough_data_9.rdy_int = _set_tensor_scale_BasicBlock_0Impl_input_rdy_0;	// embed_rom.k:39:9
    fifo_data_4.data_in = _get_bank_scale_BasicBlock_0Impl_fifo_data_out_0;	// embed_rom.k:44:9
    fifo_data_4.wren = _get_bank_scale_BasicBlock_0Impl_fifo_wren_0;	// embed_rom.k:44:9
    passthrough_data_10.rdy_int = _get_bank_scale_BasicBlock_0Impl_input_rdy_0;	// embed_rom.k:44:9
    fifo_data_5.data_in = _get_tensor_scale_BasicBlock_0Impl_fifo_data_out_0;	// embed_rom.k:49:9
    fifo_data_5.wren = _get_tensor_scale_BasicBlock_0Impl_fifo_wren_0;	// embed_rom.k:49:9
    passthrough_data_11.rdy_int = _get_tensor_scale_BasicBlock_0Impl_input_rdy_0;	// embed_rom.k:49:9
  end // always_comb

  assign has_startup_completed_raw = 1'b1;
  assign stall_rate_supported_out_net = 1'b0;
  KanagawaResetControl #(
    .WIDTH(14),
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
  embed_rom__embeddings__mem_container _embeddings (	// embed_rom.k:13:5
    .clk             (clk),	// embed_rom.k:13:5
    .rst             (1'b0),	// embed_rom.k:13:5
    .rden_in_0       (_read_chunk_BasicBlock_0Impl_memory_rden_out_8_0),	// embed_rom.k:21:9
    .read_addr_in_0  (_read_chunk_BasicBlock_0Impl_memory_read_addr_out_8_0),	// embed_rom.k:21:9
    .wren_in_0       (_write_chunk_BasicBlock_0Impl_memory_wren_8_0),	// embed_rom.k:29:9
    .write_addr_in_0 (_write_chunk_BasicBlock_0Impl_memory_write_addr_out_8_0),	// embed_rom.k:29:9
    .write_data_in_0 (_write_chunk_BasicBlock_0Impl_memory_write_data_out_8_0),	// embed_rom.k:29:9
    .read_data_out_0 (__embeddings_read_data_out_0),
    .init_completed  (__embeddings_init_completed)
  );	// embed_rom.k:13:5
  embed_rom_reg_8_w1_i_8_0 _bank_scale (	// embed_rom.k:14:5
    .clk           (clk),	// embed_rom.k:13:5
    .rst           (reg_rst_delayed[0]),	// embed_rom.k:14:5
    .input_valid_0 (_set_bank_scale_BasicBlock_0Impl_global_out__bank_scale_9_0_valid),	// embed_rom.k:34:9
    .input_0       (_set_bank_scale_BasicBlock_0Impl_global_out__bank_scale_9_0),	// embed_rom.k:34:9
    .value_out     (__bank_scale_value_out)
  );	// embed_rom.k:14:5
  embed_rom_reg_32_w1_i_32_0 _tensor_scale (	// embed_rom.k:15:5
    .clk           (clk),	// embed_rom.k:13:5
    .rst           (reg_rst_delayed[1]),	// embed_rom.k:15:5
    .input_valid_0
      (_set_tensor_scale_BasicBlock_0Impl_global_out__tensor_scale_10_0_valid),	// embed_rom.k:39:9
    .input_0       (_set_tensor_scale_BasicBlock_0Impl_global_out__tensor_scale_10_0),	// embed_rom.k:39:9
    .value_out     (__tensor_scale_value_out)
  );	// embed_rom.k:15:5
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
    .WIDTH(192),
    .PORT_WIDTH(192),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_0_read_chunk_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(4),
    .USE_LUTRAM(1)
  ) fifo_0_read_chunk_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[2]),
    .overflow_out  (_fifo_0_read_chunk_Return_overflow_out),
    .underflow_out (_fifo_0_read_chunk_Return_underflow_out),
    .empty         (_fifo_0_read_chunk_Return_empty),
    .rdreq         (fifo_data_0.rden),
    .full          (_fifo_0_read_chunk_Return_full),
    .wrreq         (fifo_data_0.wren),
    .data          (fifo_data_0.data_in),
    .q             (_fifo_0_read_chunk_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(0),
    .PORT_WIDTH(1),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_1_write_chunk_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(0)
  ) fifo_1_write_chunk_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[3]),
    .overflow_out  (_fifo_1_write_chunk_Return_overflow_out),
    .underflow_out (_fifo_1_write_chunk_Return_underflow_out),
    .empty         (_fifo_1_write_chunk_Return_empty),
    .rdreq         (fifo_data_1.rden),
    .full          (_fifo_1_write_chunk_Return_full),
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
    .WIDTH(8),
    .PORT_WIDTH(8),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_4_get_bank_scale_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(1)
  ) fifo_4_get_bank_scale_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[6]),
    .overflow_out  (_fifo_4_get_bank_scale_Return_overflow_out),
    .underflow_out (_fifo_4_get_bank_scale_Return_underflow_out),
    .empty         (_fifo_4_get_bank_scale_Return_empty),
    .rdreq         (fifo_data_4.rden),
    .full          (_fifo_4_get_bank_scale_Return_full),
    .wrreq         (fifo_data_4.wren),
    .data          (fifo_data_4.data_in),
    .q             (_fifo_4_get_bank_scale_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(32),
    .PORT_WIDTH(32),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_5_get_tensor_scale_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(1)
  ) fifo_5_get_tensor_scale_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[7]),
    .overflow_out  (_fifo_5_get_tensor_scale_Return_overflow_out),
    .underflow_out (_fifo_5_get_tensor_scale_Return_underflow_out),
    .empty         (_fifo_5_get_tensor_scale_Return_empty),
    .rdreq         (fifo_data_5.rden),
    .full          (_fifo_5_get_tensor_scale_Return_full),
    .wrreq         (fifo_data_5.wren),
    .data          (fifo_data_5.data_in),
    .q             (_fifo_5_get_tensor_scale_Return_q)
  );
  embed_rom_read_chunk_BasicBlock_0 read_chunk_BasicBlock_0Impl (	// embed_rom.k:21:9
    .clk                       (clk),	// embed_rom.k:21:9
    .rst                       (reg_rst_delayed[8]),	// embed_rom.k:21:9
    .done_out                  (/* unused */),
    .memory_read_data_in_8_0   (__embeddings_read_data_out_0),	// embed_rom.k:13:5
    .memory_read_addr_out_8_0  (_read_chunk_BasicBlock_0Impl_memory_read_addr_out_8_0),
    .memory_rden_out_8_0       (_read_chunk_BasicBlock_0Impl_memory_rden_out_8_0),
    .fifo_data_out_0           (_read_chunk_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0               (_read_chunk_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_0.almost_full),	// embed_rom.k:21:9
    .fifo_overflow_in_0        (fifo_data_0.overflow),	// embed_rom.k:21:9
    .data_in_6                 (passthrough_data_6.data),	// embed_rom.k:21:9
    .input_fifo_underflow_0    (passthrough_data_6.underflow),	// embed_rom.k:21:9
    .input_rdy_0               (_read_chunk_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_6.valid),	// embed_rom.k:21:9
    .control_state_out         (/* unused */)
  );	// embed_rom.k:21:9
  embed_rom_write_chunk_BasicBlock_0 write_chunk_BasicBlock_0Impl (	// embed_rom.k:29:9
    .clk                       (clk),	// embed_rom.k:29:9
    .rst                       (reg_rst_delayed[9]),	// embed_rom.k:29:9
    .done_out                  (/* unused */),
    .memory_write_data_out_8_0 (_write_chunk_BasicBlock_0Impl_memory_write_data_out_8_0),
    .memory_write_addr_out_8_0 (_write_chunk_BasicBlock_0Impl_memory_write_addr_out_8_0),
    .memory_wren_8_0           (_write_chunk_BasicBlock_0Impl_memory_wren_8_0),
    .fifo_wren_0               (_write_chunk_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_1.almost_full),	// embed_rom.k:29:9
    .fifo_overflow_in_0        (fifo_data_1.overflow),	// embed_rom.k:29:9
    .data_in_7                 (passthrough_data_7.data),	// embed_rom.k:29:9
    .input_fifo_underflow_0    (passthrough_data_7.underflow),	// embed_rom.k:29:9
    .input_rdy_0               (_write_chunk_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_7.valid),	// embed_rom.k:29:9
    .control_state_out         (/* unused */)
  );	// embed_rom.k:29:9
  embed_rom_set_bank_scale_BasicBlock_0 set_bank_scale_BasicBlock_0Impl (	// embed_rom.k:34:9
    .clk                              (clk),	// embed_rom.k:34:9
    .rst                              (reg_rst_delayed[10]),	// embed_rom.k:34:9
    .done_out                         (/* unused */),
    .global_out__bank_scale_9_0_valid
      (_set_bank_scale_BasicBlock_0Impl_global_out__bank_scale_9_0_valid),
    .global_out__bank_scale_9_0
      (_set_bank_scale_BasicBlock_0Impl_global_out__bank_scale_9_0),
    .fifo_wren_0                      (_set_bank_scale_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0        (fifo_data_2.almost_full),	// embed_rom.k:34:9
    .fifo_overflow_in_0               (fifo_data_2.overflow),	// embed_rom.k:34:9
    .data_in_8                        (passthrough_data_8.data),	// embed_rom.k:34:9
    .input_fifo_underflow_0           (passthrough_data_8.underflow),	// embed_rom.k:34:9
    .input_rdy_0                      (_set_bank_scale_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0                    (passthrough_data_8.valid),	// embed_rom.k:34:9
    .control_state_out                (/* unused */)
  );	// embed_rom.k:34:9
  embed_rom_set_tensor_scale_BasicBlock_0 set_tensor_scale_BasicBlock_0Impl (	// embed_rom.k:39:9
    .clk                                 (clk),	// embed_rom.k:39:9
    .rst                                 (reg_rst_delayed[11]),	// embed_rom.k:39:9
    .done_out                            (/* unused */),
    .global_out__tensor_scale_10_0_valid
      (_set_tensor_scale_BasicBlock_0Impl_global_out__tensor_scale_10_0_valid),
    .global_out__tensor_scale_10_0
      (_set_tensor_scale_BasicBlock_0Impl_global_out__tensor_scale_10_0),
    .fifo_wren_0                         (_set_tensor_scale_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0           (fifo_data_3.almost_full),	// embed_rom.k:39:9
    .fifo_overflow_in_0                  (fifo_data_3.overflow),	// embed_rom.k:39:9
    .data_in_9                           (passthrough_data_9.data),	// embed_rom.k:39:9
    .input_fifo_underflow_0              (passthrough_data_9.underflow),	// embed_rom.k:39:9
    .input_rdy_0                         (_set_tensor_scale_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0                       (passthrough_data_9.valid),	// embed_rom.k:39:9
    .control_state_out                   (/* unused */)
  );	// embed_rom.k:39:9
  embed_rom_get_bank_scale_BasicBlock_0 get_bank_scale_BasicBlock_0Impl (	// embed_rom.k:44:9
    .clk                       (clk),	// embed_rom.k:44:9
    .rst                       (reg_rst_delayed[12]),	// embed_rom.k:44:9
    .done_out                  (/* unused */),
    .global_in__bank_scale_9   (__bank_scale_value_out),	// embed_rom.k:14:5
    .fifo_data_out_0           (_get_bank_scale_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0               (_get_bank_scale_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_4.almost_full),	// embed_rom.k:44:9
    .fifo_overflow_in_0        (fifo_data_4.overflow),	// embed_rom.k:44:9
    .input_fifo_underflow_0    (passthrough_data_10.underflow),	// embed_rom.k:44:9
    .input_rdy_0               (_get_bank_scale_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_10.valid),	// embed_rom.k:44:9
    .control_state_out         (/* unused */)
  );	// embed_rom.k:44:9
  embed_rom_get_tensor_scale_BasicBlock_0 get_tensor_scale_BasicBlock_0Impl (	// embed_rom.k:49:9
    .clk                        (clk),	// embed_rom.k:49:9
    .rst                        (reg_rst_delayed[13]),	// embed_rom.k:49:9
    .done_out                   (/* unused */),
    .global_in__tensor_scale_10 (__tensor_scale_value_out),	// embed_rom.k:15:5
    .fifo_data_out_0            (_get_tensor_scale_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0                (_get_tensor_scale_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0  (fifo_data_5.almost_full),	// embed_rom.k:49:9
    .fifo_overflow_in_0         (fifo_data_5.overflow),	// embed_rom.k:49:9
    .input_fifo_underflow_0     (passthrough_data_11.underflow),	// embed_rom.k:49:9
    .input_rdy_0                (_get_tensor_scale_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0              (passthrough_data_11.valid),	// embed_rom.k:49:9
    .control_state_out          (/* unused */)
  );	// embed_rom.k:49:9
  assign rst_and_startup_done_out = rst_and_startup_done_out_net;
  assign read_chunk_rdy_out = read_chunk_rdy_out_net;
  assign read_chunk_empty_out = read_chunk_empty_out_net;
  assign read_chunk_result_out = read_chunk_result_out_net;
  assign write_chunk_rdy_out = write_chunk_rdy_out_net;
  assign write_chunk_empty_out = write_chunk_empty_out_net;
  assign set_bank_scale_rdy_out = set_bank_scale_rdy_out_net;
  assign set_bank_scale_empty_out = set_bank_scale_empty_out_net;
  assign set_tensor_scale_rdy_out = set_tensor_scale_rdy_out_net;
  assign set_tensor_scale_empty_out = set_tensor_scale_empty_out_net;
  assign get_bank_scale_rdy_out = get_bank_scale_rdy_out_net;
  assign get_bank_scale_empty_out = get_bank_scale_empty_out_net;
  assign get_bank_scale_result_out = get_bank_scale_result_out_net;
  assign get_tensor_scale_rdy_out = get_tensor_scale_rdy_out_net;
  assign get_tensor_scale_empty_out = get_tensor_scale_empty_out_net;
  assign get_tensor_scale_result_out = get_tensor_scale_result_out_net;
  assign stall_rate_supported_out = stall_rate_supported_out_net;
endmodule

module embed_rom_EsiWrapper(
     input  wire                                                          clk,
     input  wire                                                          rst,
     input  wire [2:0]                                                    stall_rate_in,
     input  wire                                                          stall_rate_valid_in,
  // input  wire /*Zero Width*/                                           get_bank_scale_arg,
     input  wire                                                          get_bank_scale_arg_valid,
  // input  wire /*Zero Width*/                                           get_tensor_scale_arg,
     input  wire                                                          get_tensor_scale_arg_valid,
     input  wire struct packed {logic [15:0] addr; }                      read_chunk_arg,
     input  wire                                                          read_chunk_arg_valid,
     input  wire struct packed {logic [7:0] value; }                      set_bank_scale_arg,
     input  wire                                                          set_bank_scale_arg_valid,
     input  wire struct packed {logic [31:0] value; }                     set_tensor_scale_arg,
     input  wire                                                          set_tensor_scale_arg_valid,
     input  wire struct packed {logic [15:0] addr; logic [191:0] value; } write_chunk_arg,
     input  wire                                                          write_chunk_arg_valid,
     input  wire                                                          get_bank_scale_result_rden,
     input  wire                                                          get_tensor_scale_result_rden,
     input  wire                                                          read_chunk_result_rden,
     input  wire                                                          set_bank_scale_result_rden,
     input  wire                                                          set_tensor_scale_result_rden,
     input  wire                                                          write_chunk_result_rden,
     output wire                                                          get_bank_scale_arg_ready,
     output wire                                                          get_tensor_scale_arg_ready,
     output wire                                                          read_chunk_arg_ready,
     output wire                                                          set_bank_scale_arg_ready,
     output wire                                                          set_tensor_scale_arg_ready,
     output wire                                                          write_chunk_arg_ready,
     output wire [7:0]                                                    get_bank_scale_result,
     output wire                                                          get_bank_scale_result_empty,
     output wire [31:0]                                                   get_tensor_scale_result,
     output wire                                                          get_tensor_scale_result_empty,
     output wire [191:0]                                                  read_chunk_result,
     output wire                                                          read_chunk_result_empty,
  // output wire /*Zero Width*/                                           set_bank_scale_result,
     output wire                                                          set_bank_scale_result_empty,
  // output wire /*Zero Width*/                                           set_tensor_scale_result,
     output wire                                                          set_tensor_scale_result_empty,
  // output wire /*Zero Width*/                                           write_chunk_result,
     output wire                                                          write_chunk_result_empty,
     output wire                                                          rst_and_startup_done_out,
     output wire                                                          stall_rate_supported_out
);

  wire [191:0] _EsiWrapped_read_chunk_result_out;
  wire [7:0]   _EsiWrapped_get_bank_scale_result_out;
  wire [31:0]  _EsiWrapped_get_tensor_scale_result_out;
  embed_rom EsiWrapped (
    .clk                         (clk),
    .rst                         (rst),
    .read_chunk_valid_in         (read_chunk_arg_valid),
    .read_chunk_addr_in          (read_chunk_arg.addr),
    .read_chunk_rden_in          (read_chunk_result_rden),
    .write_chunk_valid_in        (write_chunk_arg_valid),
    .write_chunk_addr_in         (write_chunk_arg.addr),
    .write_chunk_value_in        (write_chunk_arg.value),
    .write_chunk_rden_in         (write_chunk_result_rden),
    .set_bank_scale_valid_in     (set_bank_scale_arg_valid),
    .set_bank_scale_value_in     (set_bank_scale_arg.value),
    .set_bank_scale_rden_in      (set_bank_scale_result_rden),
    .set_tensor_scale_valid_in   (set_tensor_scale_arg_valid),
    .set_tensor_scale_value_in   (set_tensor_scale_arg.value),
    .set_tensor_scale_rden_in    (set_tensor_scale_result_rden),
    .get_bank_scale_valid_in     (get_bank_scale_arg_valid),
    .get_bank_scale_rden_in      (get_bank_scale_result_rden),
    .get_tensor_scale_valid_in   (get_tensor_scale_arg_valid),
    .get_tensor_scale_rden_in    (get_tensor_scale_result_rden),
    .stall_rate_in               (stall_rate_in),
    .stall_rate_valid_in         (stall_rate_valid_in),
    .rst_and_startup_done_out    (rst_and_startup_done_out),
    .read_chunk_rdy_out          (read_chunk_arg_ready),
    .read_chunk_empty_out        (read_chunk_result_empty),
    .read_chunk_result_out       (_EsiWrapped_read_chunk_result_out),
    .write_chunk_rdy_out         (write_chunk_arg_ready),
    .write_chunk_empty_out       (write_chunk_result_empty),
    .set_bank_scale_rdy_out      (set_bank_scale_arg_ready),
    .set_bank_scale_empty_out    (set_bank_scale_result_empty),
    .set_tensor_scale_rdy_out    (set_tensor_scale_arg_ready),
    .set_tensor_scale_empty_out  (set_tensor_scale_result_empty),
    .get_bank_scale_rdy_out      (get_bank_scale_arg_ready),
    .get_bank_scale_empty_out    (get_bank_scale_result_empty),
    .get_bank_scale_result_out   (_EsiWrapped_get_bank_scale_result_out),
    .get_tensor_scale_rdy_out    (get_tensor_scale_arg_ready),
    .get_tensor_scale_empty_out  (get_tensor_scale_result_empty),
    .get_tensor_scale_result_out (_EsiWrapped_get_tensor_scale_result_out),
    .stall_rate_supported_out    (stall_rate_supported_out)
  );
  assign get_bank_scale_result = _EsiWrapped_get_bank_scale_result_out;
  assign get_tensor_scale_result = _EsiWrapped_get_tensor_scale_result_out;
  assign read_chunk_result = _EsiWrapped_read_chunk_result_out;
  // Zero width: assign set_bank_scale_result = /*Zero width*/;
  // Zero width: assign set_tensor_scale_result = /*Zero width*/;
  // Zero width: assign write_chunk_result = /*Zero width*/;
endmodule

