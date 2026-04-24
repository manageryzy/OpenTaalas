
// This file was generated. Do not modify.
// kanagawa --backend=sv --import-dir=/home/mana/workspace/OpenTaalas/third-party/kanagawa/library --base-library=/home/mana/workspace/OpenTaalas/third-party/kanagawa/library/mini-base.k --output=/home/mana/workspace/OpenTaalas/rtl/generated/kanagawa/scale_store --frequency=250 --register-ratio=8 --max-register-ratio=16 /home/mana/workspace/OpenTaalas/rtl/kanagawa/scale_store.k

`default_nettype wire
module scale_storeDebugView_get_bank_scaleEntry
(
    input wire clk,
    input wire[4:0]  _bank_id,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("get_bank_scaleEntry time: %0t bank_id: %p", $time, _bank_id);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module scale_storeDebugView_get_bank_scaleExit
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
module scale_storeDebugView_get_tensor_scaleEntry
(
    input wire clk,
    input wire[2:0]  _matrix_id,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("get_tensor_scaleEntry time: %0t matrix_id: %p", $time, _matrix_id);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module scale_storeDebugView_get_tensor_scaleExit
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
module scale_storeDebugView_set_bank_scaleEntry
(
    input wire clk,
    input wire[4:0]  _bank_id,
    input wire[7:0]  _value,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("set_bank_scaleEntry time: %0t bank_id: %p value: %p", $time, _bank_id, _value);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module scale_storeDebugView_set_tensor_scaleEntry
(
    input wire clk,
    input wire[2:0]  _matrix_id,
    input wire[31:0]  _value,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("set_tensor_scaleEntry time: %0t matrix_id: %p value: %p", $time, _matrix_id, _value);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
`ifndef _TYPESCOPE_CoreModuleTypeScope
`define _TYPESCOPE_CoreModuleTypeScope
`endif // _TYPESCOPE_CoreModuleTypeScope
module scale_store_set_tensor_scale_BasicBlock_0(	// scale_store.k:35:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  output wire [31:0] memory_write_data_out_9_0,
  output wire [2:0]  memory_write_addr_out_9_0,
  output wire        memory_wren_9_0,
  output wire        fifo_wren_0,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [34:0] data_in_7,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  logic        done_out_0;	// scale_store.k:35:9
  logic [31:0] memory_write_data_out_9_0_0;	// scale_store.k:35:9
  logic [2:0]  memory_write_addr_out_9_0_0;	// scale_store.k:35:9
  logic        memory_wren_9_0_0;	// scale_store.k:35:9
  logic        fifo_wren_0_0;	// scale_store.k:35:9
  logic        input_rdy_0_0;	// scale_store.k:35:9
  logic [7:0]  control_state_out_0;	// scale_store.k:35:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// scale_store.k:35:9
  wire         _GEN_0 = _GEN & input_valid_0;	// scale_store.k:35:9
  always_comb begin	// scale_store.k:35:9
    input_rdy_0_0 = _GEN;	// scale_store.k:35:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// scale_store.k:35:9
  end // always_comb
  always_comb begin	// scale_store.k:35:9
    memory_wren_9_0_0 = _GEN_0;	// scale_store.k:35:9, :37:13
    memory_write_addr_out_9_0_0 = data_in_7[2:0];	// scale_store.k:37:13
    memory_write_data_out_9_0_0 = data_in_7[34:3];	// scale_store.k:37:13
  end // always_comb
  reg   [2:0]  p0_matrix_id;	// scale_store.k:35:9
  reg   [31:0] p0_value;	// scale_store.k:35:9
  reg          p0_stage1_enable = 1'h0;	// scale_store.k:35:9
  reg          p0_stage2_enable = 1'h0;	// scale_store.k:35:9
  always @(posedge clk) begin	// scale_store.k:35:9
    p0_matrix_id <= data_in_7[2:0];	// scale_store.k:35:9
    p0_value <= data_in_7[34:3];	// scale_store.k:35:9
    if (rst) begin	// scale_store.k:35:9
      p0_stage1_enable <= 1'h0;	// scale_store.k:35:9
      p0_stage2_enable <= 1'h0;	// scale_store.k:35:9
    end
    else begin	// scale_store.k:35:9
      p0_stage1_enable <= _GEN_0;	// scale_store.k:35:9
      p0_stage2_enable <= p0_stage1_enable;	// scale_store.k:35:9
    end
  end // always @(posedge)
  always_comb	// scale_store.k:35:9
    fifo_wren_0_0 = p0_stage2_enable;	// scale_store.k:35:9, :39:9
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// scale_store.k:35:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// scale_store.k:35:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  scale_storeDebugView_set_tensor_scaleEntry scale_storeDebugView_set_tensor_scaleEntry_instance (	// scale_store.k:39:9
    .clk        (clk),	// scale_store.k:39:9
    ._matrix_id (p0_stage1_enable ? p0_matrix_id : 'x),	// scale_store.k:35:9, :39:9
    ._value     (p0_stage1_enable ? p0_value : 'x),	// scale_store.k:35:9, :39:9
    .valid      (p0_stage1_enable),	// scale_store.k:35:9
    .valid_out  (/* unused */)
  );	// scale_store.k:39:9
  assign done_out = p0_stage2_enable;	// scale_store.k:35:9
  assign memory_write_data_out_9_0 = memory_write_data_out_9_0_0;	// scale_store.k:35:9
  assign memory_write_addr_out_9_0 = memory_write_addr_out_9_0_0;	// scale_store.k:35:9
  assign memory_wren_9_0 = memory_wren_9_0_0;	// scale_store.k:35:9
  assign fifo_wren_0 = fifo_wren_0_0;	// scale_store.k:35:9
  assign input_rdy_0 = input_rdy_0_0;	// scale_store.k:35:9
  assign control_state_out = control_state_out_0;	// scale_store.k:35:9
endmodule

module scale_store_set_bank_scale_BasicBlock_0(	// scale_store.k:27:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  output wire [7:0]  memory_write_data_out_8_0,
  output wire [4:0]  memory_write_addr_out_8_0,
  output wire        memory_wren_8_0,
  output wire        fifo_wren_0,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [12:0] data_in_6,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire        _fifo_overflow_ffc_0_data_out;
  wire        _fifo_almostfull_ffc_0_data_out;
  logic       done_out_0;	// scale_store.k:27:9
  logic [7:0] memory_write_data_out_8_0_0;	// scale_store.k:27:9
  logic [4:0] memory_write_addr_out_8_0_0;	// scale_store.k:27:9
  logic       memory_wren_8_0_0;	// scale_store.k:27:9
  logic       fifo_wren_0_0;	// scale_store.k:27:9
  logic       input_rdy_0_0;	// scale_store.k:27:9
  logic [7:0] control_state_out_0;	// scale_store.k:27:9
  wire        _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// scale_store.k:27:9
  wire        _GEN_0 = _GEN & input_valid_0;	// scale_store.k:27:9
  always_comb begin	// scale_store.k:27:9
    input_rdy_0_0 = _GEN;	// scale_store.k:27:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// scale_store.k:27:9
  end // always_comb
  always_comb begin	// scale_store.k:27:9
    memory_wren_8_0_0 = _GEN_0;	// scale_store.k:27:9, :29:13
    memory_write_addr_out_8_0_0 = data_in_6[4:0];	// scale_store.k:29:13
    memory_write_data_out_8_0_0 = data_in_6[12:5];	// scale_store.k:29:13
  end // always_comb
  reg   [4:0] p0_bank_id;	// scale_store.k:27:9
  reg   [7:0] p0_value;	// scale_store.k:27:9
  reg         p0_stage1_enable = 1'h0;	// scale_store.k:27:9
  reg         p0_stage2_enable = 1'h0;	// scale_store.k:27:9
  always @(posedge clk) begin	// scale_store.k:27:9
    p0_bank_id <= data_in_6[4:0];	// scale_store.k:27:9
    p0_value <= data_in_6[12:5];	// scale_store.k:27:9
    if (rst) begin	// scale_store.k:27:9
      p0_stage1_enable <= 1'h0;	// scale_store.k:27:9
      p0_stage2_enable <= 1'h0;	// scale_store.k:27:9
    end
    else begin	// scale_store.k:27:9
      p0_stage1_enable <= _GEN_0;	// scale_store.k:27:9
      p0_stage2_enable <= p0_stage1_enable;	// scale_store.k:27:9
    end
  end // always @(posedge)
  always_comb	// scale_store.k:27:9
    fifo_wren_0_0 = p0_stage2_enable;	// scale_store.k:27:9, :31:9
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// scale_store.k:27:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// scale_store.k:27:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  scale_storeDebugView_set_bank_scaleEntry scale_storeDebugView_set_bank_scaleEntry_instance (	// scale_store.k:31:9
    .clk       (clk),	// scale_store.k:31:9
    ._bank_id  (p0_stage1_enable ? p0_bank_id : 'x),	// scale_store.k:27:9, :31:9
    ._value    (p0_stage1_enable ? p0_value : 'x),	// scale_store.k:27:9, :31:9
    .valid     (p0_stage1_enable),	// scale_store.k:27:9
    .valid_out (/* unused */)
  );	// scale_store.k:31:9
  assign done_out = p0_stage2_enable;	// scale_store.k:27:9
  assign memory_write_data_out_8_0 = memory_write_data_out_8_0_0;	// scale_store.k:27:9
  assign memory_write_addr_out_8_0 = memory_write_addr_out_8_0_0;	// scale_store.k:27:9
  assign memory_wren_8_0 = memory_wren_8_0_0;	// scale_store.k:27:9
  assign fifo_wren_0 = fifo_wren_0_0;	// scale_store.k:27:9
  assign input_rdy_0 = input_rdy_0_0;	// scale_store.k:27:9
  assign control_state_out = control_state_out_0;	// scale_store.k:27:9
endmodule

module scale_store_get_tensor_scale_BasicBlock_0(	// scale_store.k:22:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  input  wire [31:0] memory_read_data_in_9_0,
  output wire [2:0]  memory_read_addr_out_9_0,
  output wire        memory_rden_out_9_0,
  output wire [31:0] fifo_data_out_0,
  output wire        fifo_wren_0,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [2:0]  data_in_5,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  wire  [31:0] memory_read_data_in_9_0_0 = memory_read_data_in_9_0;	// scale_store.k:22:9
  logic        done_out_0;	// scale_store.k:22:9
  logic [2:0]  memory_read_addr_out_9_0_0;	// scale_store.k:22:9
  logic        memory_rden_out_9_0_0;	// scale_store.k:22:9
  logic [31:0] fifo_data_out_0_0;	// scale_store.k:22:9
  logic        fifo_wren_0_0;	// scale_store.k:22:9
  logic        input_rdy_0_0;	// scale_store.k:22:9
  logic [7:0]  control_state_out_0;	// scale_store.k:22:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// scale_store.k:22:9
  wire         _GEN_0 = _GEN & input_valid_0;	// scale_store.k:22:9
  always_comb begin	// scale_store.k:22:9
    input_rdy_0_0 = _GEN;	// scale_store.k:22:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// scale_store.k:22:9
  end // always_comb
  always_comb begin	// scale_store.k:22:9
    memory_read_addr_out_9_0_0 = data_in_5;	// scale_store.k:22:16
    memory_rden_out_9_0_0 = _GEN_0;	// scale_store.k:22:{9,16}
  end // always_comb
  reg   [2:0]  p0_data_in_5;	// scale_store.k:22:9
  reg          p0_stage1_enable = 1'h0;	// scale_store.k:22:9
  reg          p0_stage2_enable = 1'h0;	// scale_store.k:22:9
  reg   [31:0] p0_memory_read_data_in_9_0;	// scale_store.k:22:9
  reg          p0_stage3_enable = 1'h0;	// scale_store.k:22:9
  always @(posedge clk) begin	// scale_store.k:22:9
    p0_data_in_5 <= data_in_5;	// scale_store.k:22:9
    if (rst) begin	// scale_store.k:22:9
      p0_stage1_enable <= 1'h0;	// scale_store.k:22:9
      p0_stage2_enable <= 1'h0;	// scale_store.k:22:9
    end
    else begin	// scale_store.k:22:9
      p0_stage1_enable <= _GEN_0;	// scale_store.k:22:9
      p0_stage2_enable <= p0_stage1_enable;	// scale_store.k:22:9
    end
    p0_memory_read_data_in_9_0 <= memory_read_data_in_9_0_0;	// scale_store.k:22:9
    if (rst)	// scale_store.k:22:9
      p0_stage3_enable <= 1'h0;	// scale_store.k:22:9
    else	// scale_store.k:22:9
      p0_stage3_enable <= p0_stage2_enable;	// scale_store.k:22:9
  end // always @(posedge)
  always_comb begin	// scale_store.k:22:9
    fifo_wren_0_0 = p0_stage3_enable;	// scale_store.k:20:5, :22:9
    fifo_data_out_0_0 = p0_memory_read_data_in_9_0;	// scale_store.k:20:5, :22:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// scale_store.k:22:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// scale_store.k:22:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  scale_storeDebugView_get_tensor_scaleEntry scale_storeDebugView_get_tensor_scaleEntry_instance (	// scale_store.k:20:5
    .clk        (clk),	// scale_store.k:20:5
    ._matrix_id (p0_stage1_enable ? p0_data_in_5 : 'x),	// scale_store.k:20:5, :22:9
    .valid      (p0_stage1_enable),	// scale_store.k:22:9
    .valid_out  (/* unused */)
  );	// scale_store.k:20:5
  scale_storeDebugView_get_tensor_scaleExit scale_storeDebugView_get_tensor_scaleExit_instance (	// scale_store.k:20:5
    .clk          (clk),	// scale_store.k:20:5
    ._ReturnValue (p0_stage2_enable ? memory_read_data_in_9_0_0 : 'x),	// scale_store.k:20:5, :22:9
    .valid        (p0_stage2_enable),	// scale_store.k:22:9
    .valid_out    (/* unused */)
  );	// scale_store.k:20:5
  assign done_out = p0_stage3_enable;	// scale_store.k:22:9
  assign memory_read_addr_out_9_0 = memory_read_addr_out_9_0_0;	// scale_store.k:22:9
  assign memory_rden_out_9_0 = memory_rden_out_9_0_0;	// scale_store.k:22:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// scale_store.k:22:9
  assign fifo_wren_0 = fifo_wren_0_0;	// scale_store.k:22:9
  assign input_rdy_0 = input_rdy_0_0;	// scale_store.k:22:9
  assign control_state_out = control_state_out_0;	// scale_store.k:22:9
endmodule

module scale_store_get_bank_scale_BasicBlock_0(	// scale_store.k:17:9
  input  wire       clk,
  input  wire       rst,
  output wire       done_out,
  input  wire [7:0] memory_read_data_in_8_0,
  output wire [4:0] memory_read_addr_out_8_0,
  output wire       memory_rden_out_8_0,
  output wire [7:0] fifo_data_out_0,
  output wire       fifo_wren_0,
  input  wire       fifo_almost_full_in_raw_0,
  input  wire       fifo_overflow_in_0,
  input  wire [4:0] data_in_4,
  input  wire       input_fifo_underflow_0,
  output wire       input_rdy_0,
  input  wire       input_valid_0,
  output wire [7:0] control_state_out
);

  wire        _fifo_overflow_ffc_0_data_out;
  wire        _fifo_almostfull_ffc_0_data_out;
  wire  [7:0] memory_read_data_in_8_0_0 = memory_read_data_in_8_0;	// scale_store.k:17:9
  logic       done_out_0;	// scale_store.k:17:9
  logic [4:0] memory_read_addr_out_8_0_0;	// scale_store.k:17:9
  logic       memory_rden_out_8_0_0;	// scale_store.k:17:9
  logic [7:0] fifo_data_out_0_0;	// scale_store.k:17:9
  logic       fifo_wren_0_0;	// scale_store.k:17:9
  logic       input_rdy_0_0;	// scale_store.k:17:9
  logic [7:0] control_state_out_0;	// scale_store.k:17:9
  wire        _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// scale_store.k:17:9
  wire        _GEN_0 = _GEN & input_valid_0;	// scale_store.k:17:9
  always_comb begin	// scale_store.k:17:9
    input_rdy_0_0 = _GEN;	// scale_store.k:17:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// scale_store.k:17:9
  end // always_comb
  always_comb begin	// scale_store.k:17:9
    memory_read_addr_out_8_0_0 = data_in_4;	// scale_store.k:17:16
    memory_rden_out_8_0_0 = _GEN_0;	// scale_store.k:17:{9,16}
  end // always_comb
  reg   [4:0] p0_data_in_4;	// scale_store.k:17:9
  reg         p0_stage1_enable = 1'h0;	// scale_store.k:17:9
  reg         p0_stage2_enable = 1'h0;	// scale_store.k:17:9
  reg   [7:0] p0_memory_read_data_in_8_0;	// scale_store.k:17:9
  reg         p0_stage3_enable = 1'h0;	// scale_store.k:17:9
  always @(posedge clk) begin	// scale_store.k:17:9
    p0_data_in_4 <= data_in_4;	// scale_store.k:17:9
    if (rst) begin	// scale_store.k:17:9
      p0_stage1_enable <= 1'h0;	// scale_store.k:17:9
      p0_stage2_enable <= 1'h0;	// scale_store.k:17:9
    end
    else begin	// scale_store.k:17:9
      p0_stage1_enable <= _GEN_0;	// scale_store.k:17:9
      p0_stage2_enable <= p0_stage1_enable;	// scale_store.k:17:9
    end
    p0_memory_read_data_in_8_0 <= memory_read_data_in_8_0_0;	// scale_store.k:17:9
    if (rst)	// scale_store.k:17:9
      p0_stage3_enable <= 1'h0;	// scale_store.k:17:9
    else	// scale_store.k:17:9
      p0_stage3_enable <= p0_stage2_enable;	// scale_store.k:17:9
  end // always @(posedge)
  always_comb begin	// scale_store.k:17:9
    fifo_wren_0_0 = p0_stage3_enable;	// scale_store.k:15:5, :17:9
    fifo_data_out_0_0 = p0_memory_read_data_in_8_0;	// scale_store.k:15:5, :17:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// scale_store.k:17:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// scale_store.k:17:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  scale_storeDebugView_get_bank_scaleEntry scale_storeDebugView_get_bank_scaleEntry_instance (	// scale_store.k:15:5
    .clk       (clk),	// scale_store.k:15:5
    ._bank_id  (p0_stage1_enable ? p0_data_in_4 : 'x),	// scale_store.k:15:5, :17:9
    .valid     (p0_stage1_enable),	// scale_store.k:17:9
    .valid_out (/* unused */)
  );	// scale_store.k:15:5
  scale_storeDebugView_get_bank_scaleExit scale_storeDebugView_get_bank_scaleExit_instance (	// scale_store.k:15:5
    .clk          (clk),	// scale_store.k:15:5
    ._ReturnValue (p0_stage2_enable ? memory_read_data_in_8_0_0 : 'x),	// scale_store.k:15:5, :17:9
    .valid        (p0_stage2_enable),	// scale_store.k:17:9
    .valid_out    (/* unused */)
  );	// scale_store.k:15:5
  assign done_out = p0_stage3_enable;	// scale_store.k:17:9
  assign memory_read_addr_out_8_0 = memory_read_addr_out_8_0_0;	// scale_store.k:17:9
  assign memory_rden_out_8_0 = memory_rden_out_8_0_0;	// scale_store.k:17:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// scale_store.k:17:9
  assign fifo_wren_0 = fifo_wren_0_0;	// scale_store.k:17:9
  assign input_rdy_0 = input_rdy_0_0;	// scale_store.k:17:9
  assign control_state_out = control_state_out_0;	// scale_store.k:17:9
endmodule

module scale_store__bank_scales__mem_container(	// scale_store.k:11:5
  input  wire       clk,
  input  wire       rst,
  input  wire       rden_in_0,
  input  wire [4:0] read_addr_in_0,
  input  wire       wren_in_0,
  input  wire [4:0] write_addr_in_0,
  input  wire [7:0] write_data_in_0,
  output wire [7:0] read_data_out_0,
  output wire       init_completed
);

  wire [1:0][7:0] ___bank_scales_0_data_out;	// scale_store.k:11:5
  KanagawaSyncRam #(
    .DATA_WIDTH(8),
    .ADDR_WIDTH(5),
    .DEPTH(32),
    .MAX_DEPTH(32),
    .USE_LUTRAM(1),
    .USE_BRAM(0),
    .USE_OUTPUT_REG(1),
    .WRITE_DELAY(0),
    .USE_HARDENED_BYPASS(0),
    .TRUE_DUAL_PORT(0),
    .SUPPORTS_RW_COLLISIONS(0),
    .ECC(0),
    .INITIAL_DATA_FILE("UNUSED"),
    .DEVICE_FAMILY("mock")
  ) __bank_scales_0 (	// scale_store.k:11:5
    .clk            (clk),	// scale_store.k:11:5
    .rst            (rst),
    .addr_in        ({{read_addr_in_0}, {write_addr_in_0}}),	// scale_store.k:11:5
    .ecc_status_out (/* unused */),
    .wren_in        ({{1'h0}, {wren_in_0}}),	// scale_store.k:11:5
    .data_in        ({{8'h0}, {write_data_in_0}}),	// scale_store.k:11:5
    .rden_in        ({{rden_in_0}, {1'h0}}),	// scale_store.k:11:5
    .data_out       (___bank_scales_0_data_out)
  );	// scale_store.k:11:5
  assign read_data_out_0 = ___bank_scales_0_data_out[1'h1];	// scale_store.k:11:5
  assign init_completed = 1'h1;	// scale_store.k:11:5
endmodule

module scale_store__tensor_scales__mem_container(	// scale_store.k:12:5
  input  wire        clk,
  input  wire        rst,
  input  wire        rden_in_0,
  input  wire [2:0]  read_addr_in_0,
  input  wire        wren_in_0,
  input  wire [2:0]  write_addr_in_0,
  input  wire [31:0] write_data_in_0,
  output wire [31:0] read_data_out_0,
  output wire        init_completed
);

  wire [1:0][31:0] ___tensor_scales_0_data_out;	// scale_store.k:12:5
  KanagawaSyncRam #(
    .DATA_WIDTH(32),
    .ADDR_WIDTH(3),
    .DEPTH(8),
    .MAX_DEPTH(32),
    .USE_LUTRAM(1),
    .USE_BRAM(0),
    .USE_OUTPUT_REG(1),
    .WRITE_DELAY(0),
    .USE_HARDENED_BYPASS(0),
    .TRUE_DUAL_PORT(0),
    .SUPPORTS_RW_COLLISIONS(0),
    .ECC(0),
    .INITIAL_DATA_FILE("UNUSED"),
    .DEVICE_FAMILY("mock")
  ) __tensor_scales_0 (	// scale_store.k:12:5
    .clk            (clk),	// scale_store.k:12:5
    .rst            (rst),
    .addr_in        ({{read_addr_in_0}, {write_addr_in_0}}),	// scale_store.k:12:5
    .ecc_status_out (/* unused */),
    .wren_in        ({{1'h0}, {wren_in_0}}),	// scale_store.k:12:5
    .data_in        ({{32'h0}, {write_data_in_0}}),	// scale_store.k:12:5
    .rden_in        ({{rden_in_0}, {1'h0}}),	// scale_store.k:12:5
    .data_out       (___tensor_scales_0_data_out)
  );	// scale_store.k:12:5
  assign read_data_out_0 = ___tensor_scales_0_data_out[1'h1];	// scale_store.k:12:5
  assign init_completed = 1'h1;	// scale_store.k:12:5
endmodule

module scale_store(
  input  wire        clk,
  input  wire        rst,
  input  wire        get_bank_scale_valid_in,
  input  wire [4:0]  get_bank_scale_bank_id_in,
  input  wire        get_bank_scale_rden_in,
  input  wire        get_tensor_scale_valid_in,
  input  wire [2:0]  get_tensor_scale_matrix_id_in,
  input  wire        get_tensor_scale_rden_in,
  input  wire        set_bank_scale_valid_in,
  input  wire [4:0]  set_bank_scale_bank_id_in,
  input  wire [7:0]  set_bank_scale_value_in,
  input  wire        set_bank_scale_rden_in,
  input  wire        set_tensor_scale_valid_in,
  input  wire [2:0]  set_tensor_scale_matrix_id_in,
  input  wire [31:0] set_tensor_scale_value_in,
  input  wire        set_tensor_scale_rden_in,
  input  wire [2:0]  stall_rate_in,
  input  wire        stall_rate_valid_in,
  output wire        rst_and_startup_done_out,
  output wire        get_bank_scale_rdy_out,
  output wire        get_bank_scale_empty_out,
  output wire [7:0]  get_bank_scale_result_out,
  output wire        get_tensor_scale_rdy_out,
  output wire        get_tensor_scale_empty_out,
  output wire [31:0] get_tensor_scale_result_out,
  output wire        set_bank_scale_rdy_out,
  output wire        set_bank_scale_empty_out,
  output wire        set_tensor_scale_rdy_out,
  output wire        set_tensor_scale_empty_out,
  output wire        stall_rate_supported_out
);

  wire [31:0] _set_tensor_scale_BasicBlock_0Impl_memory_write_data_out_9_0;	// scale_store.k:35:9
  wire [2:0]  _set_tensor_scale_BasicBlock_0Impl_memory_write_addr_out_9_0;	// scale_store.k:35:9
  wire        _set_tensor_scale_BasicBlock_0Impl_memory_wren_9_0;	// scale_store.k:35:9
  wire        _set_tensor_scale_BasicBlock_0Impl_fifo_wren_0;	// scale_store.k:35:9
  wire        _set_tensor_scale_BasicBlock_0Impl_input_rdy_0;	// scale_store.k:35:9
  wire [7:0]  _set_bank_scale_BasicBlock_0Impl_memory_write_data_out_8_0;	// scale_store.k:27:9
  wire [4:0]  _set_bank_scale_BasicBlock_0Impl_memory_write_addr_out_8_0;	// scale_store.k:27:9
  wire        _set_bank_scale_BasicBlock_0Impl_memory_wren_8_0;	// scale_store.k:27:9
  wire        _set_bank_scale_BasicBlock_0Impl_fifo_wren_0;	// scale_store.k:27:9
  wire        _set_bank_scale_BasicBlock_0Impl_input_rdy_0;	// scale_store.k:27:9
  wire [2:0]  _get_tensor_scale_BasicBlock_0Impl_memory_read_addr_out_9_0;	// scale_store.k:22:9
  wire        _get_tensor_scale_BasicBlock_0Impl_memory_rden_out_9_0;	// scale_store.k:22:9
  wire [31:0] _get_tensor_scale_BasicBlock_0Impl_fifo_data_out_0;	// scale_store.k:22:9
  wire        _get_tensor_scale_BasicBlock_0Impl_fifo_wren_0;	// scale_store.k:22:9
  wire        _get_tensor_scale_BasicBlock_0Impl_input_rdy_0;	// scale_store.k:22:9
  wire [4:0]  _get_bank_scale_BasicBlock_0Impl_memory_read_addr_out_8_0;	// scale_store.k:17:9
  wire        _get_bank_scale_BasicBlock_0Impl_memory_rden_out_8_0;	// scale_store.k:17:9
  wire [7:0]  _get_bank_scale_BasicBlock_0Impl_fifo_data_out_0;	// scale_store.k:17:9
  wire        _get_bank_scale_BasicBlock_0Impl_fifo_wren_0;	// scale_store.k:17:9
  wire        _get_bank_scale_BasicBlock_0Impl_input_rdy_0;	// scale_store.k:17:9
  wire        _fifo_3_set_tensor_scale_Return_overflow_out;
  wire        _fifo_3_set_tensor_scale_Return_underflow_out;
  wire        _fifo_3_set_tensor_scale_Return_empty;
  wire        _fifo_3_set_tensor_scale_Return_full;
  wire        _fifo_2_set_bank_scale_Return_overflow_out;
  wire        _fifo_2_set_bank_scale_Return_underflow_out;
  wire        _fifo_2_set_bank_scale_Return_empty;
  wire        _fifo_2_set_bank_scale_Return_full;
  wire        _fifo_1_get_tensor_scale_Return_overflow_out;
  wire        _fifo_1_get_tensor_scale_Return_underflow_out;
  wire        _fifo_1_get_tensor_scale_Return_empty;
  wire        _fifo_1_get_tensor_scale_Return_full;
  wire [31:0] _fifo_1_get_tensor_scale_Return_q;
  wire        _fifo_0_get_bank_scale_Return_overflow_out;
  wire        _fifo_0_get_bank_scale_Return_underflow_out;
  wire        _fifo_0_get_bank_scale_Return_empty;
  wire        _fifo_0_get_bank_scale_Return_full;
  wire [7:0]  _fifo_0_get_bank_scale_Return_q;
  wire        _has_startup_completed_delayed_3_delay_chain_data_out;
  wire        _has_startup_completed_delayed_2_delay_chain_data_out;
  wire        _has_startup_completed_delayed_1_delay_chain_data_out;
  wire        _has_startup_completed_delayed_0_delay_chain_data_out;
  wire [31:0] __tensor_scales_read_data_out_0;	// scale_store.k:12:5
  wire        __tensor_scales_init_completed;	// scale_store.k:12:5
  wire [7:0]  __bank_scales_read_data_out_0;	// scale_store.k:11:5
  wire        __bank_scales_init_completed;	// scale_store.k:11:5
  wire        _reset_control_rst_and_startup_done_out;
  wire [7:0]  _reset_control_rst_delayed_out;
  wire        _reset_control_reset_sequence_finished_this_cycle_out;
  logic  stall_rate_supported_out_net;
  logic  set_tensor_scale_empty_out_net;
  logic  set_tensor_scale_rdy_out_net;
  logic  set_bank_scale_empty_out_net;
  logic  set_bank_scale_rdy_out_net;
  logic  get_tensor_scale_empty_out_net;
  logic [31:0] get_tensor_scale_result_out_net;
  logic  get_tensor_scale_rdy_out_net;
  logic  get_bank_scale_empty_out_net;
  logic [7:0] get_bank_scale_result_out_net;
  logic  get_bank_scale_rdy_out_net;
  logic  rst_and_startup_done_out_net;

  logic [31:0] dropped_commands;
  //synopsys translate_off
  KanagawaStringTable string_table(.clk(clk));
  //synopsys translate_on
  logic [7:0] reg_rst_delayed;
  logic combined_reset;
  assign combined_reset = rst;
  logic reset_sequence_finished_this_cycle;
  logic has_startup_completed_raw;
  logic has_mem_init_completed;
  wire        _GEN =
    has_startup_completed_raw & __bank_scales_init_completed
    & __tensor_scales_init_completed;	// scale_store.k:11:5, :12:5
  logic has_others_completed;
  assign has_others_completed = _GEN;

  logic rst_and_startup_done_raw;

  logic [0:0] rst_array;
  assign rst_array[0] = combined_reset;

  logic has_startup_completed_delayed_0;

  logic has_startup_completed_delayed_1;

  logic has_startup_completed_delayed_2;

  logic has_startup_completed_delayed_3;

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
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [4:0] data;
      logic underflow;
  } passthrough_data_4;
  assign passthrough_data_4.underflow = 1'b0;
  assign passthrough_data_4.rdy_ext = passthrough_data_4.rdy_int & !(!has_startup_completed_delayed_0);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [2:0] data;
      logic underflow;
  } passthrough_data_5;
  assign passthrough_data_5.underflow = 1'b0;
  assign passthrough_data_5.rdy_ext = passthrough_data_5.rdy_int & !(!has_startup_completed_delayed_1);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [12:0] data;
      logic underflow;
  } passthrough_data_6;
  assign passthrough_data_6.underflow = 1'b0;
  assign passthrough_data_6.rdy_ext = passthrough_data_6.rdy_int & !(!has_startup_completed_delayed_2);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [34:0] data;
      logic underflow;
  } passthrough_data_7;
  assign passthrough_data_7.underflow = 1'b0;
  assign passthrough_data_7.rdy_ext = passthrough_data_7.rdy_int & !(!has_startup_completed_delayed_3);
  assign get_bank_scale_rdy_out_net = passthrough_data_4.rdy_ext;
  assign passthrough_data_4.valid = get_bank_scale_rdy_out & get_bank_scale_valid_in;
  assign passthrough_data_4.data = { get_bank_scale_bank_id_in };
  assign fifo_data_0.rden = get_bank_scale_rden_in;
  assign get_bank_scale_result_out_net = fifo_data_0.data_out;
  assign get_bank_scale_empty_out_net = fifo_data_0.empty;
  assign get_tensor_scale_rdy_out_net = passthrough_data_5.rdy_ext;
  assign passthrough_data_5.valid = get_tensor_scale_rdy_out & get_tensor_scale_valid_in;
  assign passthrough_data_5.data = { get_tensor_scale_matrix_id_in };
  assign fifo_data_1.rden = get_tensor_scale_rden_in;
  assign get_tensor_scale_result_out_net = fifo_data_1.data_out;
  assign get_tensor_scale_empty_out_net = fifo_data_1.empty;
  assign set_bank_scale_rdy_out_net = passthrough_data_6.rdy_ext;
  assign passthrough_data_6.valid = set_bank_scale_rdy_out & set_bank_scale_valid_in;
  assign passthrough_data_6.data = { set_bank_scale_value_in, set_bank_scale_bank_id_in };
  assign fifo_data_2.rden = set_bank_scale_rden_in;
  assign set_bank_scale_empty_out_net = fifo_data_2.empty;
  assign set_tensor_scale_rdy_out_net = passthrough_data_7.rdy_ext;
  assign passthrough_data_7.valid = set_tensor_scale_rdy_out & set_tensor_scale_valid_in;
  assign passthrough_data_7.data = { set_tensor_scale_value_in, set_tensor_scale_matrix_id_in };
  assign fifo_data_3.rden = set_tensor_scale_rden_in;
  assign set_tensor_scale_empty_out_net = fifo_data_3.empty;
  always_comb begin
    rst_and_startup_done_out_net = _reset_control_rst_and_startup_done_out;
    reg_rst_delayed = _reset_control_rst_delayed_out;
    reset_sequence_finished_this_cycle = _reset_control_reset_sequence_finished_this_cycle_out;
    has_startup_completed_delayed_0 = _has_startup_completed_delayed_0_delay_chain_data_out;
    has_startup_completed_delayed_1 = _has_startup_completed_delayed_1_delay_chain_data_out;
    has_startup_completed_delayed_2 = _has_startup_completed_delayed_2_delay_chain_data_out;
    has_startup_completed_delayed_3 = _has_startup_completed_delayed_3_delay_chain_data_out;
    fifo_data_0.overflow = _fifo_0_get_bank_scale_Return_overflow_out;
    fifo_data_0.underflow = _fifo_0_get_bank_scale_Return_underflow_out;
    fifo_data_0.empty = _fifo_0_get_bank_scale_Return_empty;
    fifo_data_0.almost_full = _fifo_0_get_bank_scale_Return_full;
    fifo_data_0.data_out = _fifo_0_get_bank_scale_Return_q;
    fifo_data_1.overflow = _fifo_1_get_tensor_scale_Return_overflow_out;
    fifo_data_1.underflow = _fifo_1_get_tensor_scale_Return_underflow_out;
    fifo_data_1.empty = _fifo_1_get_tensor_scale_Return_empty;
    fifo_data_1.almost_full = _fifo_1_get_tensor_scale_Return_full;
    fifo_data_1.data_out = _fifo_1_get_tensor_scale_Return_q;
    fifo_data_2.overflow = _fifo_2_set_bank_scale_Return_overflow_out;
    fifo_data_2.underflow = _fifo_2_set_bank_scale_Return_underflow_out;
    fifo_data_2.empty = _fifo_2_set_bank_scale_Return_empty;
    fifo_data_2.almost_full = _fifo_2_set_bank_scale_Return_full;
    fifo_data_3.overflow = _fifo_3_set_tensor_scale_Return_overflow_out;
    fifo_data_3.underflow = _fifo_3_set_tensor_scale_Return_underflow_out;
    fifo_data_3.empty = _fifo_3_set_tensor_scale_Return_empty;
    fifo_data_3.almost_full = _fifo_3_set_tensor_scale_Return_full;
    fifo_data_0.data_in = _get_bank_scale_BasicBlock_0Impl_fifo_data_out_0;	// scale_store.k:17:9
    fifo_data_0.wren = _get_bank_scale_BasicBlock_0Impl_fifo_wren_0;	// scale_store.k:17:9
    passthrough_data_4.rdy_int = _get_bank_scale_BasicBlock_0Impl_input_rdy_0;	// scale_store.k:17:9
    fifo_data_1.data_in = _get_tensor_scale_BasicBlock_0Impl_fifo_data_out_0;	// scale_store.k:22:9
    fifo_data_1.wren = _get_tensor_scale_BasicBlock_0Impl_fifo_wren_0;	// scale_store.k:22:9
    passthrough_data_5.rdy_int = _get_tensor_scale_BasicBlock_0Impl_input_rdy_0;	// scale_store.k:22:9
    fifo_data_2.wren = _set_bank_scale_BasicBlock_0Impl_fifo_wren_0;	// scale_store.k:27:9
    passthrough_data_6.rdy_int = _set_bank_scale_BasicBlock_0Impl_input_rdy_0;	// scale_store.k:27:9
    fifo_data_3.wren = _set_tensor_scale_BasicBlock_0Impl_fifo_wren_0;	// scale_store.k:35:9
    passthrough_data_7.rdy_int = _set_tensor_scale_BasicBlock_0Impl_input_rdy_0;	// scale_store.k:35:9
  end // always_comb

  assign has_startup_completed_raw = 1'b1;
  assign stall_rate_supported_out_net = 1'b0;
  KanagawaResetControl #(
    .WIDTH(8),
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
  scale_store__bank_scales__mem_container _bank_scales (	// scale_store.k:11:5
    .clk             (clk),	// scale_store.k:11:5
    .rst             (1'b0),	// scale_store.k:11:5
    .rden_in_0       (_get_bank_scale_BasicBlock_0Impl_memory_rden_out_8_0),	// scale_store.k:17:9
    .read_addr_in_0  (_get_bank_scale_BasicBlock_0Impl_memory_read_addr_out_8_0),	// scale_store.k:17:9
    .wren_in_0       (_set_bank_scale_BasicBlock_0Impl_memory_wren_8_0),	// scale_store.k:27:9
    .write_addr_in_0 (_set_bank_scale_BasicBlock_0Impl_memory_write_addr_out_8_0),	// scale_store.k:27:9
    .write_data_in_0 (_set_bank_scale_BasicBlock_0Impl_memory_write_data_out_8_0),	// scale_store.k:27:9
    .read_data_out_0 (__bank_scales_read_data_out_0),
    .init_completed  (__bank_scales_init_completed)
  );	// scale_store.k:11:5
  scale_store__tensor_scales__mem_container _tensor_scales (	// scale_store.k:12:5
    .clk             (clk),	// scale_store.k:11:5
    .rst             (1'b0),	// scale_store.k:11:5
    .rden_in_0       (_get_tensor_scale_BasicBlock_0Impl_memory_rden_out_9_0),	// scale_store.k:22:9
    .read_addr_in_0  (_get_tensor_scale_BasicBlock_0Impl_memory_read_addr_out_9_0),	// scale_store.k:22:9
    .wren_in_0       (_set_tensor_scale_BasicBlock_0Impl_memory_wren_9_0),	// scale_store.k:35:9
    .write_addr_in_0 (_set_tensor_scale_BasicBlock_0Impl_memory_write_addr_out_9_0),	// scale_store.k:35:9
    .write_data_in_0 (_set_tensor_scale_BasicBlock_0Impl_memory_write_data_out_9_0),	// scale_store.k:35:9
    .read_data_out_0 (__tensor_scales_read_data_out_0),
    .init_completed  (__tensor_scales_init_completed)
  );	// scale_store.k:12:5
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
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(8),
    .PORT_WIDTH(8),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_0_get_bank_scale_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(4),
    .USE_LUTRAM(1)
  ) fifo_0_get_bank_scale_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[0]),
    .overflow_out  (_fifo_0_get_bank_scale_Return_overflow_out),
    .underflow_out (_fifo_0_get_bank_scale_Return_underflow_out),
    .empty         (_fifo_0_get_bank_scale_Return_empty),
    .rdreq         (fifo_data_0.rden),
    .full          (_fifo_0_get_bank_scale_Return_full),
    .wrreq         (fifo_data_0.wren),
    .data          (fifo_data_0.data_in),
    .q             (_fifo_0_get_bank_scale_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(32),
    .PORT_WIDTH(32),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_1_get_tensor_scale_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(4),
    .USE_LUTRAM(1)
  ) fifo_1_get_tensor_scale_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[1]),
    .overflow_out  (_fifo_1_get_tensor_scale_Return_overflow_out),
    .underflow_out (_fifo_1_get_tensor_scale_Return_underflow_out),
    .empty         (_fifo_1_get_tensor_scale_Return_empty),
    .rdreq         (fifo_data_1.rden),
    .full          (_fifo_1_get_tensor_scale_Return_full),
    .wrreq         (fifo_data_1.wren),
    .data          (fifo_data_1.data_in),
    .q             (_fifo_1_get_tensor_scale_Return_q)
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
    .rst           (reg_rst_delayed[2]),
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
    .rst           (reg_rst_delayed[3]),
    .overflow_out  (_fifo_3_set_tensor_scale_Return_overflow_out),
    .underflow_out (_fifo_3_set_tensor_scale_Return_underflow_out),
    .empty         (_fifo_3_set_tensor_scale_Return_empty),
    .rdreq         (fifo_data_3.rden),
    .full          (_fifo_3_set_tensor_scale_Return_full),
    .wrreq         (fifo_data_3.wren),
    .data          ('0),
    .q             (/* unused */)
  );
  scale_store_get_bank_scale_BasicBlock_0 get_bank_scale_BasicBlock_0Impl (	// scale_store.k:17:9
    .clk                       (clk),	// scale_store.k:17:9
    .rst                       (reg_rst_delayed[4]),	// scale_store.k:17:9
    .done_out                  (/* unused */),
    .memory_read_data_in_8_0   (__bank_scales_read_data_out_0),	// scale_store.k:11:5
    .memory_read_addr_out_8_0
      (_get_bank_scale_BasicBlock_0Impl_memory_read_addr_out_8_0),
    .memory_rden_out_8_0       (_get_bank_scale_BasicBlock_0Impl_memory_rden_out_8_0),
    .fifo_data_out_0           (_get_bank_scale_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0               (_get_bank_scale_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_0.almost_full),	// scale_store.k:17:9
    .fifo_overflow_in_0        (fifo_data_0.overflow),	// scale_store.k:17:9
    .data_in_4                 (passthrough_data_4.data),	// scale_store.k:17:9
    .input_fifo_underflow_0    (passthrough_data_4.underflow),	// scale_store.k:17:9
    .input_rdy_0               (_get_bank_scale_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_4.valid),	// scale_store.k:17:9
    .control_state_out         (/* unused */)
  );	// scale_store.k:17:9
  scale_store_get_tensor_scale_BasicBlock_0 get_tensor_scale_BasicBlock_0Impl (	// scale_store.k:22:9
    .clk                       (clk),	// scale_store.k:22:9
    .rst                       (reg_rst_delayed[5]),	// scale_store.k:22:9
    .done_out                  (/* unused */),
    .memory_read_data_in_9_0   (__tensor_scales_read_data_out_0),	// scale_store.k:12:5
    .memory_read_addr_out_9_0
      (_get_tensor_scale_BasicBlock_0Impl_memory_read_addr_out_9_0),
    .memory_rden_out_9_0       (_get_tensor_scale_BasicBlock_0Impl_memory_rden_out_9_0),
    .fifo_data_out_0           (_get_tensor_scale_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0               (_get_tensor_scale_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_1.almost_full),	// scale_store.k:22:9
    .fifo_overflow_in_0        (fifo_data_1.overflow),	// scale_store.k:22:9
    .data_in_5                 (passthrough_data_5.data),	// scale_store.k:22:9
    .input_fifo_underflow_0    (passthrough_data_5.underflow),	// scale_store.k:22:9
    .input_rdy_0               (_get_tensor_scale_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_5.valid),	// scale_store.k:22:9
    .control_state_out         (/* unused */)
  );	// scale_store.k:22:9
  scale_store_set_bank_scale_BasicBlock_0 set_bank_scale_BasicBlock_0Impl (	// scale_store.k:27:9
    .clk                       (clk),	// scale_store.k:27:9
    .rst                       (reg_rst_delayed[6]),	// scale_store.k:27:9
    .done_out                  (/* unused */),
    .memory_write_data_out_8_0
      (_set_bank_scale_BasicBlock_0Impl_memory_write_data_out_8_0),
    .memory_write_addr_out_8_0
      (_set_bank_scale_BasicBlock_0Impl_memory_write_addr_out_8_0),
    .memory_wren_8_0           (_set_bank_scale_BasicBlock_0Impl_memory_wren_8_0),
    .fifo_wren_0               (_set_bank_scale_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_2.almost_full),	// scale_store.k:27:9
    .fifo_overflow_in_0        (fifo_data_2.overflow),	// scale_store.k:27:9
    .data_in_6                 (passthrough_data_6.data),	// scale_store.k:27:9
    .input_fifo_underflow_0    (passthrough_data_6.underflow),	// scale_store.k:27:9
    .input_rdy_0               (_set_bank_scale_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_6.valid),	// scale_store.k:27:9
    .control_state_out         (/* unused */)
  );	// scale_store.k:27:9
  scale_store_set_tensor_scale_BasicBlock_0 set_tensor_scale_BasicBlock_0Impl (	// scale_store.k:35:9
    .clk                       (clk),	// scale_store.k:35:9
    .rst                       (reg_rst_delayed[7]),	// scale_store.k:35:9
    .done_out                  (/* unused */),
    .memory_write_data_out_9_0
      (_set_tensor_scale_BasicBlock_0Impl_memory_write_data_out_9_0),
    .memory_write_addr_out_9_0
      (_set_tensor_scale_BasicBlock_0Impl_memory_write_addr_out_9_0),
    .memory_wren_9_0           (_set_tensor_scale_BasicBlock_0Impl_memory_wren_9_0),
    .fifo_wren_0               (_set_tensor_scale_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_3.almost_full),	// scale_store.k:35:9
    .fifo_overflow_in_0        (fifo_data_3.overflow),	// scale_store.k:35:9
    .data_in_7                 (passthrough_data_7.data),	// scale_store.k:35:9
    .input_fifo_underflow_0    (passthrough_data_7.underflow),	// scale_store.k:35:9
    .input_rdy_0               (_set_tensor_scale_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_7.valid),	// scale_store.k:35:9
    .control_state_out         (/* unused */)
  );	// scale_store.k:35:9
  assign rst_and_startup_done_out = rst_and_startup_done_out_net;
  assign get_bank_scale_rdy_out = get_bank_scale_rdy_out_net;
  assign get_bank_scale_empty_out = get_bank_scale_empty_out_net;
  assign get_bank_scale_result_out = get_bank_scale_result_out_net;
  assign get_tensor_scale_rdy_out = get_tensor_scale_rdy_out_net;
  assign get_tensor_scale_empty_out = get_tensor_scale_empty_out_net;
  assign get_tensor_scale_result_out = get_tensor_scale_result_out_net;
  assign set_bank_scale_rdy_out = set_bank_scale_rdy_out_net;
  assign set_bank_scale_empty_out = set_bank_scale_empty_out_net;
  assign set_tensor_scale_rdy_out = set_tensor_scale_rdy_out_net;
  assign set_tensor_scale_empty_out = set_tensor_scale_empty_out_net;
  assign stall_rate_supported_out = stall_rate_supported_out_net;
endmodule

module scale_store_EsiWrapper(
     input  wire                                                             clk,
     input  wire                                                             rst,
     input  wire [2:0]                                                       stall_rate_in,
     input  wire                                                             stall_rate_valid_in,
     input  wire struct packed {logic [4:0] bank_id; }                       get_bank_scale_arg,
     input  wire                                                             get_bank_scale_arg_valid,
     input  wire struct packed {logic [2:0] matrix_id; }                     get_tensor_scale_arg,
     input  wire                                                             get_tensor_scale_arg_valid,
     input  wire struct packed {logic [4:0] bank_id; logic [7:0] value; }    set_bank_scale_arg,
     input  wire                                                             set_bank_scale_arg_valid,
     input  wire struct packed {logic [2:0] matrix_id; logic [31:0] value; } set_tensor_scale_arg,
     input  wire                                                             set_tensor_scale_arg_valid,
     input  wire                                                             get_bank_scale_result_rden,
     input  wire                                                             get_tensor_scale_result_rden,
     input  wire                                                             set_bank_scale_result_rden,
     input  wire                                                             set_tensor_scale_result_rden,
     output wire                                                             get_bank_scale_arg_ready,
     output wire                                                             get_tensor_scale_arg_ready,
     output wire                                                             set_bank_scale_arg_ready,
     output wire                                                             set_tensor_scale_arg_ready,
     output wire [7:0]                                                       get_bank_scale_result,
     output wire                                                             get_bank_scale_result_empty,
     output wire [31:0]                                                      get_tensor_scale_result,
     output wire                                                             get_tensor_scale_result_empty,
  // output wire /*Zero Width*/                                              set_bank_scale_result,
     output wire                                                             set_bank_scale_result_empty,
  // output wire /*Zero Width*/                                              set_tensor_scale_result,
     output wire                                                             set_tensor_scale_result_empty,
     output wire                                                             rst_and_startup_done_out,
     output wire                                                             stall_rate_supported_out
);

  wire [7:0]  _EsiWrapped_get_bank_scale_result_out;
  wire [31:0] _EsiWrapped_get_tensor_scale_result_out;
  scale_store EsiWrapped (
    .clk                           (clk),
    .rst                           (rst),
    .get_bank_scale_valid_in       (get_bank_scale_arg_valid),
    .get_bank_scale_bank_id_in     (get_bank_scale_arg.bank_id),
    .get_bank_scale_rden_in        (get_bank_scale_result_rden),
    .get_tensor_scale_valid_in     (get_tensor_scale_arg_valid),
    .get_tensor_scale_matrix_id_in (get_tensor_scale_arg.matrix_id),
    .get_tensor_scale_rden_in      (get_tensor_scale_result_rden),
    .set_bank_scale_valid_in       (set_bank_scale_arg_valid),
    .set_bank_scale_bank_id_in     (set_bank_scale_arg.bank_id),
    .set_bank_scale_value_in       (set_bank_scale_arg.value),
    .set_bank_scale_rden_in        (set_bank_scale_result_rden),
    .set_tensor_scale_valid_in     (set_tensor_scale_arg_valid),
    .set_tensor_scale_matrix_id_in (set_tensor_scale_arg.matrix_id),
    .set_tensor_scale_value_in     (set_tensor_scale_arg.value),
    .set_tensor_scale_rden_in      (set_tensor_scale_result_rden),
    .stall_rate_in                 (stall_rate_in),
    .stall_rate_valid_in           (stall_rate_valid_in),
    .rst_and_startup_done_out      (rst_and_startup_done_out),
    .get_bank_scale_rdy_out        (get_bank_scale_arg_ready),
    .get_bank_scale_empty_out      (get_bank_scale_result_empty),
    .get_bank_scale_result_out     (_EsiWrapped_get_bank_scale_result_out),
    .get_tensor_scale_rdy_out      (get_tensor_scale_arg_ready),
    .get_tensor_scale_empty_out    (get_tensor_scale_result_empty),
    .get_tensor_scale_result_out   (_EsiWrapped_get_tensor_scale_result_out),
    .set_bank_scale_rdy_out        (set_bank_scale_arg_ready),
    .set_bank_scale_empty_out      (set_bank_scale_result_empty),
    .set_tensor_scale_rdy_out      (set_tensor_scale_arg_ready),
    .set_tensor_scale_empty_out    (set_tensor_scale_result_empty),
    .stall_rate_supported_out      (stall_rate_supported_out)
  );
  assign get_bank_scale_result = _EsiWrapped_get_bank_scale_result_out;
  assign get_tensor_scale_result = _EsiWrapped_get_tensor_scale_result_out;
  // Zero width: assign set_bank_scale_result = /*Zero width*/;
  // Zero width: assign set_tensor_scale_result = /*Zero width*/;
endmodule

