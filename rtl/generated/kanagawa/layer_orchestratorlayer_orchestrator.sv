
// This file was generated. Do not modify.
// kanagawa --backend=sv --import-dir=/home/mana/workspace/OpenTaalas/third-party/kanagawa/library --base-library=/home/mana/workspace/OpenTaalas/third-party/kanagawa/library/mini-base.k --output=/home/mana/workspace/OpenTaalas/rtl/generated/kanagawa/layer_orchestrator --frequency=250 --register-ratio=8 --max-register-ratio=16 /home/mana/workspace/OpenTaalas/rtl/kanagawa/layer_orchestrator.k

`default_nettype wire
module layer_orchestratorDebugView_forward_cosEntry
(
    input wire clk,
    input wire[1:0]  _phase,
    input wire[255:0]  _v,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("forward_cosEntry time: %0t phase: %p v: %p", $time, _phase, _v);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module layer_orchestratorDebugView_forward_sinEntry
(
    input wire clk,
    input wire[1:0]  _phase,
    input wire[255:0]  _v,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("forward_sinEntry time: %0t phase: %p v: %p", $time, _phase, _v);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module layer_orchestratorDebugView_read_cos_forwardedEntry
(
    input wire clk,
    input wire[1:0]  _phase,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("read_cos_forwardedEntry time: %0t phase: %p", $time, _phase);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module layer_orchestratorDebugView_read_cos_forwardedExit
(
    input wire clk,
    input wire[255:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("read_cos_forwardedExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module layer_orchestratorDebugView_read_sin_forwardedEntry
(
    input wire clk,
    input wire[1:0]  _phase,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("read_sin_forwardedEntry time: %0t phase: %p", $time, _phase);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module layer_orchestratorDebugView_read_sin_forwardedExit
(
    input wire clk,
    input wire[255:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("read_sin_forwardedExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module layer_orchestratorDebugView_prog_gamma_pre_attnEntry
(
    input wire clk,
    input wire[15:0]  _idx,
    input wire[15:0]  _val,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("prog_gamma_pre_attnEntry time: %0t idx: %p val: %p", $time, _idx, _val);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module layer_orchestratorDebugView_prog_gamma_pre_mlpEntry
(
    input wire clk,
    input wire[15:0]  _idx,
    input wire[15:0]  _val,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("prog_gamma_pre_mlpEntry time: %0t idx: %p val: %p", $time, _idx, _val);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module layer_orchestratorDebugView_prog_rsqrt_lutEntry
(
    input wire clk,
    input wire[7:0]  _idx,
    input wire[15:0]  _val,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("prog_rsqrt_lutEntry time: %0t idx: %p val: %p", $time, _idx, _val);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module layer_orchestratorDebugView_prog_sigmoid_lutEntry
(
    input wire clk,
    input wire[7:0]  _idx,
    input wire[15:0]  _val,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("prog_sigmoid_lutEntry time: %0t idx: %p val: %p", $time, _idx, _val);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module layer_orchestratorDebugView_rmsnorm_get_sumExit
(
    input wire clk,
    input wire[31:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("rmsnorm_get_sumExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module layer_orchestratorDebugView_rmsnorm_stepEntry
(
    input wire clk,
    input wire[15:0]  _x_bf16,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("rmsnorm_stepEntry time: %0t x_bf16: %p", $time, _x_bf16);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module layer_orchestratorDebugView_swiglu_stepEntry
(
    input wire clk,
    input wire[15:0]  _gate_bf16,
    input wire[15:0]  _up_bf16,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("swiglu_stepEntry time: %0t gate_bf16: %p up_bf16: %p", $time, _gate_bf16, _up_bf16);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module layer_orchestratorDebugView_swiglu_stepExit
(
    input wire clk,
    input wire[15:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("swiglu_stepExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module layer_orchestratorDebugView_residual_add_stepEntry
(
    input wire clk,
    input wire[15:0]  _a_bf16,
    input wire[15:0]  _b_bf16,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("residual_add_stepEntry time: %0t a_bf16: %p b_bf16: %p", $time, _a_bf16, _b_bf16);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module layer_orchestratorDebugView_residual_add_stepExit
(
    input wire clk,
    input wire[15:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("residual_add_stepExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module layer_orchestratorDebugView_rotate_evenEntry
(
    input wire clk,
    input wire[15:0]  _x_even,
    input wire[15:0]  _x_odd,
    input wire[15:0]  _cos_val,
    input wire[15:0]  _sin_val,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("rotate_evenEntry time: %0t x_even: %p x_odd: %p cos_val: %p sin_val: %p", $time, _x_even, _x_odd, _cos_val, _sin_val);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module layer_orchestratorDebugView_rotate_evenExit
(
    input wire clk,
    input wire[15:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("rotate_evenExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module layer_orchestratorDebugView_rotate_oddEntry
(
    input wire clk,
    input wire[15:0]  _x_even,
    input wire[15:0]  _x_odd,
    input wire[15:0]  _cos_val,
    input wire[15:0]  _sin_val,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("rotate_oddEntry time: %0t x_even: %p x_odd: %p cos_val: %p sin_val: %p", $time, _x_even, _x_odd, _cos_val, _sin_val);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module layer_orchestratorDebugView_rotate_oddExit
(
    input wire clk,
    input wire[15:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("rotate_oddExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
`ifndef _TYPESCOPE_CoreModuleTypeScope
`define _TYPESCOPE_CoreModuleTypeScope
`endif // _TYPESCOPE_CoreModuleTypeScope
module layer_orchestrator_rotate_odd_BasicBlock_1(	// layer_orchestrator.k:79:16
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  output wire        decr_semaphore_thread_count_14_out,
  output wire [15:0] fifo_data_out_0,
  output wire        fifo_wren_0,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [15:0] data_in_59,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  logic        done_out_0;	// layer_orchestrator.k:79:16
  logic        decr_semaphore_thread_count_14_out_0;	// layer_orchestrator.k:79:16
  logic [15:0] fifo_data_out_0_0;	// layer_orchestrator.k:79:16
  logic        fifo_wren_0_0;	// layer_orchestrator.k:79:16
  logic        input_rdy_0_0;	// layer_orchestrator.k:79:16
  logic [7:0]  control_state_out_0;	// layer_orchestrator.k:79:16
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// layer_orchestrator.k:79:16
  always_comb begin	// layer_orchestrator.k:79:16
    input_rdy_0_0 = _GEN;	// layer_orchestrator.k:79:16
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// layer_orchestrator.k:79:16
  end // always_comb
  reg   [15:0] p0_data_in_59;	// layer_orchestrator.k:79:16
  reg          p0_stage1_enable = 1'h0;	// layer_orchestrator.k:79:16
  reg   [15:0] p0_data_in_59_0;	// layer_orchestrator.k:79:16
  reg          p0_stage2_enable = 1'h0;	// layer_orchestrator.k:79:16
  always @(posedge clk) begin	// layer_orchestrator.k:79:16
    p0_data_in_59 <= data_in_59;	// layer_orchestrator.k:79:16
    if (rst)	// layer_orchestrator.k:79:16
      p0_stage1_enable <= 1'h0;	// layer_orchestrator.k:79:16
    else	// layer_orchestrator.k:79:16
      p0_stage1_enable <= _GEN & input_valid_0;	// layer_orchestrator.k:79:16
    p0_data_in_59_0 <= p0_data_in_59;	// layer_orchestrator.k:79:16
    if (rst)	// layer_orchestrator.k:79:16
      p0_stage2_enable <= 1'h0;	// layer_orchestrator.k:79:16
    else	// layer_orchestrator.k:79:16
      p0_stage2_enable <= p0_stage1_enable;	// layer_orchestrator.k:79:16
  end // always @(posedge)
  always_comb begin	// layer_orchestrator.k:79:16
    fifo_wren_0_0 = p0_stage2_enable;	// layer_orchestrator.k:78:5, :79:16
    fifo_data_out_0_0 = p0_data_in_59_0;	// layer_orchestrator.k:78:5, :79:16
  end // always_comb
  assign decr_semaphore_thread_count_14_out_0 = p0_stage2_enable;	// layer_orchestrator.k:79:16
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// layer_orchestrator.k:79:16
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// layer_orchestrator.k:79:16
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  layer_orchestratorDebugView_rotate_oddExit layer_orchestratorDebugView_rotate_oddExit_instance (	// layer_orchestrator.k:78:5
    .clk          (clk),	// layer_orchestrator.k:78:5
    ._ReturnValue (p0_stage1_enable ? p0_data_in_59 : 'x),	// layer_orchestrator.k:78:5, :79:16
    .valid        (p0_stage1_enable),	// layer_orchestrator.k:79:16
    .valid_out    (/* unused */)
  );	// layer_orchestrator.k:78:5
  assign done_out = p0_stage2_enable;	// layer_orchestrator.k:79:16
  assign decr_semaphore_thread_count_14_out = decr_semaphore_thread_count_14_out_0;	// layer_orchestrator.k:79:16
  assign fifo_data_out_0 = fifo_data_out_0_0;	// layer_orchestrator.k:79:16
  assign fifo_wren_0 = fifo_wren_0_0;	// layer_orchestrator.k:79:16
  assign input_rdy_0 = input_rdy_0_0;	// layer_orchestrator.k:79:16
  assign control_state_out = control_state_out_0;	// layer_orchestrator.k:79:16
endmodule

module layer_orchestrator_rotate_odd_BasicBlock_0(	// layer_orchestrator.k:79:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  input  wire        semaphore_full_14_in,
  output wire        incr_semaphore_thread_count_14_out,
  output wire [64:0] fifo_data_out_0,
  output wire        fifo_wren_0,
  output wire        context_saver_caller_wren_1,
  output wire        context_saver_caller_loop_count_1,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [63:0] data_in_58,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  logic        done_out_0;	// layer_orchestrator.k:79:9
  logic        incr_semaphore_thread_count_14_out_0;	// layer_orchestrator.k:79:9
  logic [64:0] fifo_data_out_0_0;	// layer_orchestrator.k:79:9
  logic        fifo_wren_0_0;	// layer_orchestrator.k:79:9
  logic        context_saver_caller_wren_1_0;	// layer_orchestrator.k:79:9
  logic        context_saver_caller_loop_count_1_0;	// layer_orchestrator.k:79:9
  logic        input_rdy_0_0;	// layer_orchestrator.k:79:9
  logic [7:0]  control_state_out_0;	// layer_orchestrator.k:79:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out & ~semaphore_full_14_in;	// layer_orchestrator.k:79:9
  wire         _GEN_0 = _GEN & input_valid_0;	// layer_orchestrator.k:79:9
  always_comb begin	// layer_orchestrator.k:79:9
    input_rdy_0_0 = _GEN;	// layer_orchestrator.k:79:9
    incr_semaphore_thread_count_14_out_0 = _GEN_0;	// layer_orchestrator.k:79:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       1'h0,
       semaphore_full_14_in,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// layer_orchestrator.k:79:9
  end // always_comb
  reg   [15:0] p0_x_even;	// layer_orchestrator.k:79:9
  reg   [15:0] p0_x_odd;	// layer_orchestrator.k:79:9
  reg   [15:0] p0_cos_val;	// layer_orchestrator.k:79:9
  reg   [15:0] p0_sin_val;	// layer_orchestrator.k:79:9
  reg          p0_stage1_enable = 1'h0;	// layer_orchestrator.k:79:9
  reg   [15:0] p0_sin_val_0;	// layer_orchestrator.k:79:9
  reg   [15:0] p0_cos_val_0;	// layer_orchestrator.k:79:9
  reg   [15:0] p0_x_odd_0;	// layer_orchestrator.k:79:9
  reg   [15:0] p0_x_even_0;	// layer_orchestrator.k:79:9
  reg          p0_stage2_enable = 1'h0;	// layer_orchestrator.k:79:9
  always @(posedge clk) begin	// layer_orchestrator.k:79:9
    p0_x_even <= data_in_58[15:0];	// layer_orchestrator.k:79:9
    p0_x_odd <= data_in_58[31:16];	// layer_orchestrator.k:79:9
    p0_cos_val <= data_in_58[47:32];	// layer_orchestrator.k:79:9
    p0_sin_val <= data_in_58[63:48];	// layer_orchestrator.k:79:9
    if (rst)	// layer_orchestrator.k:79:9
      p0_stage1_enable <= 1'h0;	// layer_orchestrator.k:79:9
    else	// layer_orchestrator.k:79:9
      p0_stage1_enable <= _GEN_0;	// layer_orchestrator.k:79:9
    p0_sin_val_0 <= p0_sin_val;	// layer_orchestrator.k:79:9
    p0_cos_val_0 <= p0_cos_val;	// layer_orchestrator.k:79:9
    p0_x_odd_0 <= p0_x_odd;	// layer_orchestrator.k:79:9
    p0_x_even_0 <= p0_x_even;	// layer_orchestrator.k:79:9
    if (rst)	// layer_orchestrator.k:79:9
      p0_stage2_enable <= 1'h0;	// layer_orchestrator.k:79:9
    else	// layer_orchestrator.k:79:9
      p0_stage2_enable <= p0_stage1_enable;	// layer_orchestrator.k:79:9
  end // always @(posedge)
  always_comb begin	// layer_orchestrator.k:79:9
    context_saver_caller_wren_1_0 = p0_stage2_enable;	// layer_orchestrator.k:79:{9,16}
    context_saver_caller_loop_count_1_0 = 1'h1;	// layer_orchestrator.k:79:16
    fifo_wren_0_0 = p0_stage2_enable;	// layer_orchestrator.k:79:{9,16}
    fifo_data_out_0_0 = {1'h0, p0_sin_val_0, p0_cos_val_0, p0_x_odd_0, p0_x_even_0};	// layer_orchestrator.k:79:{9,16}
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// layer_orchestrator.k:79:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// layer_orchestrator.k:79:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  layer_orchestratorDebugView_rotate_oddEntry layer_orchestratorDebugView_rotate_oddEntry_instance (	// layer_orchestrator.k:78:5
    .clk       (clk),	// layer_orchestrator.k:78:5
    ._x_even   (p0_stage1_enable ? p0_x_even : 'x),	// layer_orchestrator.k:78:5, :79:9
    ._x_odd    (p0_stage1_enable ? p0_x_odd : 'x),	// layer_orchestrator.k:78:5, :79:9
    ._cos_val  (p0_stage1_enable ? p0_cos_val : 'x),	// layer_orchestrator.k:78:5, :79:9
    ._sin_val  (p0_stage1_enable ? p0_sin_val : 'x),	// layer_orchestrator.k:78:5, :79:9
    .valid     (p0_stage1_enable),	// layer_orchestrator.k:79:9
    .valid_out (/* unused */)
  );	// layer_orchestrator.k:78:5
  assign done_out = p0_stage2_enable;	// layer_orchestrator.k:79:9
  assign incr_semaphore_thread_count_14_out = incr_semaphore_thread_count_14_out_0;	// layer_orchestrator.k:79:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// layer_orchestrator.k:79:9
  assign fifo_wren_0 = fifo_wren_0_0;	// layer_orchestrator.k:79:9
  assign context_saver_caller_wren_1 = context_saver_caller_wren_1_0;	// layer_orchestrator.k:79:9
  assign context_saver_caller_loop_count_1 = context_saver_caller_loop_count_1_0;	// layer_orchestrator.k:79:9
  assign input_rdy_0 = input_rdy_0_0;	// layer_orchestrator.k:79:9
  assign control_state_out = control_state_out_0;	// layer_orchestrator.k:79:9
endmodule

module layer_orchestrator_rotate_even_BasicBlock_1(	// layer_orchestrator.k:76:16
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  output wire        decr_semaphore_thread_count_13_out,
  output wire [15:0] fifo_data_out_0,
  output wire        fifo_wren_0,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [15:0] data_in_57,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  logic        done_out_0;	// layer_orchestrator.k:76:16
  logic        decr_semaphore_thread_count_13_out_0;	// layer_orchestrator.k:76:16
  logic [15:0] fifo_data_out_0_0;	// layer_orchestrator.k:76:16
  logic        fifo_wren_0_0;	// layer_orchestrator.k:76:16
  logic        input_rdy_0_0;	// layer_orchestrator.k:76:16
  logic [7:0]  control_state_out_0;	// layer_orchestrator.k:76:16
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// layer_orchestrator.k:76:16
  always_comb begin	// layer_orchestrator.k:76:16
    input_rdy_0_0 = _GEN;	// layer_orchestrator.k:76:16
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// layer_orchestrator.k:76:16
  end // always_comb
  reg   [15:0] p0_data_in_57;	// layer_orchestrator.k:76:16
  reg          p0_stage1_enable = 1'h0;	// layer_orchestrator.k:76:16
  reg   [15:0] p0_data_in_57_0;	// layer_orchestrator.k:76:16
  reg          p0_stage2_enable = 1'h0;	// layer_orchestrator.k:76:16
  always @(posedge clk) begin	// layer_orchestrator.k:76:16
    p0_data_in_57 <= data_in_57;	// layer_orchestrator.k:76:16
    if (rst)	// layer_orchestrator.k:76:16
      p0_stage1_enable <= 1'h0;	// layer_orchestrator.k:76:16
    else	// layer_orchestrator.k:76:16
      p0_stage1_enable <= _GEN & input_valid_0;	// layer_orchestrator.k:76:16
    p0_data_in_57_0 <= p0_data_in_57;	// layer_orchestrator.k:76:16
    if (rst)	// layer_orchestrator.k:76:16
      p0_stage2_enable <= 1'h0;	// layer_orchestrator.k:76:16
    else	// layer_orchestrator.k:76:16
      p0_stage2_enable <= p0_stage1_enable;	// layer_orchestrator.k:76:16
  end // always @(posedge)
  always_comb begin	// layer_orchestrator.k:76:16
    fifo_wren_0_0 = p0_stage2_enable;	// layer_orchestrator.k:75:5, :76:16
    fifo_data_out_0_0 = p0_data_in_57_0;	// layer_orchestrator.k:75:5, :76:16
  end // always_comb
  assign decr_semaphore_thread_count_13_out_0 = p0_stage2_enable;	// layer_orchestrator.k:76:16
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// layer_orchestrator.k:76:16
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// layer_orchestrator.k:76:16
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  layer_orchestratorDebugView_rotate_evenExit layer_orchestratorDebugView_rotate_evenExit_instance (	// layer_orchestrator.k:75:5
    .clk          (clk),	// layer_orchestrator.k:75:5
    ._ReturnValue (p0_stage1_enable ? p0_data_in_57 : 'x),	// layer_orchestrator.k:75:5, :76:16
    .valid        (p0_stage1_enable),	// layer_orchestrator.k:76:16
    .valid_out    (/* unused */)
  );	// layer_orchestrator.k:75:5
  assign done_out = p0_stage2_enable;	// layer_orchestrator.k:76:16
  assign decr_semaphore_thread_count_13_out = decr_semaphore_thread_count_13_out_0;	// layer_orchestrator.k:76:16
  assign fifo_data_out_0 = fifo_data_out_0_0;	// layer_orchestrator.k:76:16
  assign fifo_wren_0 = fifo_wren_0_0;	// layer_orchestrator.k:76:16
  assign input_rdy_0 = input_rdy_0_0;	// layer_orchestrator.k:76:16
  assign control_state_out = control_state_out_0;	// layer_orchestrator.k:76:16
endmodule

module layer_orchestrator_rotate_even_BasicBlock_0(	// layer_orchestrator.k:76:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  input  wire        semaphore_full_13_in,
  output wire        incr_semaphore_thread_count_13_out,
  output wire [64:0] fifo_data_out_0,
  output wire        fifo_wren_0,
  output wire        context_saver_caller_wren_1,
  output wire        context_saver_caller_loop_count_1,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [63:0] data_in_56,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  logic        done_out_0;	// layer_orchestrator.k:76:9
  logic        incr_semaphore_thread_count_13_out_0;	// layer_orchestrator.k:76:9
  logic [64:0] fifo_data_out_0_0;	// layer_orchestrator.k:76:9
  logic        fifo_wren_0_0;	// layer_orchestrator.k:76:9
  logic        context_saver_caller_wren_1_0;	// layer_orchestrator.k:76:9
  logic        context_saver_caller_loop_count_1_0;	// layer_orchestrator.k:76:9
  logic        input_rdy_0_0;	// layer_orchestrator.k:76:9
  logic [7:0]  control_state_out_0;	// layer_orchestrator.k:76:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out & ~semaphore_full_13_in;	// layer_orchestrator.k:76:9
  wire         _GEN_0 = _GEN & input_valid_0;	// layer_orchestrator.k:76:9
  always_comb begin	// layer_orchestrator.k:76:9
    input_rdy_0_0 = _GEN;	// layer_orchestrator.k:76:9
    incr_semaphore_thread_count_13_out_0 = _GEN_0;	// layer_orchestrator.k:76:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       1'h0,
       semaphore_full_13_in,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// layer_orchestrator.k:76:9
  end // always_comb
  reg   [15:0] p0_x_even;	// layer_orchestrator.k:76:9
  reg   [15:0] p0_x_odd;	// layer_orchestrator.k:76:9
  reg   [15:0] p0_cos_val;	// layer_orchestrator.k:76:9
  reg   [15:0] p0_sin_val;	// layer_orchestrator.k:76:9
  reg          p0_stage1_enable = 1'h0;	// layer_orchestrator.k:76:9
  reg   [15:0] p0_sin_val_0;	// layer_orchestrator.k:76:9
  reg   [15:0] p0_cos_val_0;	// layer_orchestrator.k:76:9
  reg   [15:0] p0_x_odd_0;	// layer_orchestrator.k:76:9
  reg   [15:0] p0_x_even_0;	// layer_orchestrator.k:76:9
  reg          p0_stage2_enable = 1'h0;	// layer_orchestrator.k:76:9
  always @(posedge clk) begin	// layer_orchestrator.k:76:9
    p0_x_even <= data_in_56[15:0];	// layer_orchestrator.k:76:9
    p0_x_odd <= data_in_56[31:16];	// layer_orchestrator.k:76:9
    p0_cos_val <= data_in_56[47:32];	// layer_orchestrator.k:76:9
    p0_sin_val <= data_in_56[63:48];	// layer_orchestrator.k:76:9
    if (rst)	// layer_orchestrator.k:76:9
      p0_stage1_enable <= 1'h0;	// layer_orchestrator.k:76:9
    else	// layer_orchestrator.k:76:9
      p0_stage1_enable <= _GEN_0;	// layer_orchestrator.k:76:9
    p0_sin_val_0 <= p0_sin_val;	// layer_orchestrator.k:76:9
    p0_cos_val_0 <= p0_cos_val;	// layer_orchestrator.k:76:9
    p0_x_odd_0 <= p0_x_odd;	// layer_orchestrator.k:76:9
    p0_x_even_0 <= p0_x_even;	// layer_orchestrator.k:76:9
    if (rst)	// layer_orchestrator.k:76:9
      p0_stage2_enable <= 1'h0;	// layer_orchestrator.k:76:9
    else	// layer_orchestrator.k:76:9
      p0_stage2_enable <= p0_stage1_enable;	// layer_orchestrator.k:76:9
  end // always @(posedge)
  always_comb begin	// layer_orchestrator.k:76:9
    context_saver_caller_wren_1_0 = p0_stage2_enable;	// layer_orchestrator.k:76:{9,16}
    context_saver_caller_loop_count_1_0 = 1'h1;	// layer_orchestrator.k:76:16
    fifo_wren_0_0 = p0_stage2_enable;	// layer_orchestrator.k:76:{9,16}
    fifo_data_out_0_0 = {1'h0, p0_sin_val_0, p0_cos_val_0, p0_x_odd_0, p0_x_even_0};	// layer_orchestrator.k:76:{9,16}
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// layer_orchestrator.k:76:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// layer_orchestrator.k:76:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  layer_orchestratorDebugView_rotate_evenEntry layer_orchestratorDebugView_rotate_evenEntry_instance (	// layer_orchestrator.k:75:5
    .clk       (clk),	// layer_orchestrator.k:75:5
    ._x_even   (p0_stage1_enable ? p0_x_even : 'x),	// layer_orchestrator.k:75:5, :76:9
    ._x_odd    (p0_stage1_enable ? p0_x_odd : 'x),	// layer_orchestrator.k:75:5, :76:9
    ._cos_val  (p0_stage1_enable ? p0_cos_val : 'x),	// layer_orchestrator.k:75:5, :76:9
    ._sin_val  (p0_stage1_enable ? p0_sin_val : 'x),	// layer_orchestrator.k:75:5, :76:9
    .valid     (p0_stage1_enable),	// layer_orchestrator.k:76:9
    .valid_out (/* unused */)
  );	// layer_orchestrator.k:75:5
  assign done_out = p0_stage2_enable;	// layer_orchestrator.k:76:9
  assign incr_semaphore_thread_count_13_out = incr_semaphore_thread_count_13_out_0;	// layer_orchestrator.k:76:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// layer_orchestrator.k:76:9
  assign fifo_wren_0 = fifo_wren_0_0;	// layer_orchestrator.k:76:9
  assign context_saver_caller_wren_1 = context_saver_caller_wren_1_0;	// layer_orchestrator.k:76:9
  assign context_saver_caller_loop_count_1 = context_saver_caller_loop_count_1_0;	// layer_orchestrator.k:76:9
  assign input_rdy_0 = input_rdy_0_0;	// layer_orchestrator.k:76:9
  assign control_state_out = control_state_out_0;	// layer_orchestrator.k:76:9
endmodule

module layer_orchestrator_residual_add_step_BasicBlock_1(	// layer_orchestrator.k:71:16
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  output wire        decr_semaphore_thread_count_12_out,
  output wire [15:0] fifo_data_out_0,
  output wire        fifo_wren_0,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [15:0] data_in_55,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  logic        done_out_0;	// layer_orchestrator.k:71:16
  logic        decr_semaphore_thread_count_12_out_0;	// layer_orchestrator.k:71:16
  logic [15:0] fifo_data_out_0_0;	// layer_orchestrator.k:71:16
  logic        fifo_wren_0_0;	// layer_orchestrator.k:71:16
  logic        input_rdy_0_0;	// layer_orchestrator.k:71:16
  logic [7:0]  control_state_out_0;	// layer_orchestrator.k:71:16
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// layer_orchestrator.k:71:16
  always_comb begin	// layer_orchestrator.k:71:16
    input_rdy_0_0 = _GEN;	// layer_orchestrator.k:71:16
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// layer_orchestrator.k:71:16
  end // always_comb
  reg   [15:0] p0_data_in_55;	// layer_orchestrator.k:71:16
  reg          p0_stage1_enable = 1'h0;	// layer_orchestrator.k:71:16
  reg   [15:0] p0_data_in_55_0;	// layer_orchestrator.k:71:16
  reg          p0_stage2_enable = 1'h0;	// layer_orchestrator.k:71:16
  always @(posedge clk) begin	// layer_orchestrator.k:71:16
    p0_data_in_55 <= data_in_55;	// layer_orchestrator.k:71:16
    if (rst)	// layer_orchestrator.k:71:16
      p0_stage1_enable <= 1'h0;	// layer_orchestrator.k:71:16
    else	// layer_orchestrator.k:71:16
      p0_stage1_enable <= _GEN & input_valid_0;	// layer_orchestrator.k:71:16
    p0_data_in_55_0 <= p0_data_in_55;	// layer_orchestrator.k:71:16
    if (rst)	// layer_orchestrator.k:71:16
      p0_stage2_enable <= 1'h0;	// layer_orchestrator.k:71:16
    else	// layer_orchestrator.k:71:16
      p0_stage2_enable <= p0_stage1_enable;	// layer_orchestrator.k:71:16
  end // always @(posedge)
  always_comb begin	// layer_orchestrator.k:71:16
    fifo_wren_0_0 = p0_stage2_enable;	// layer_orchestrator.k:70:5, :71:16
    fifo_data_out_0_0 = p0_data_in_55_0;	// layer_orchestrator.k:70:5, :71:16
  end // always_comb
  assign decr_semaphore_thread_count_12_out_0 = p0_stage2_enable;	// layer_orchestrator.k:71:16
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// layer_orchestrator.k:71:16
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// layer_orchestrator.k:71:16
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  layer_orchestratorDebugView_residual_add_stepExit layer_orchestratorDebugView_residual_add_stepExit_instance (	// layer_orchestrator.k:70:5
    .clk          (clk),	// layer_orchestrator.k:70:5
    ._ReturnValue (p0_stage1_enable ? p0_data_in_55 : 'x),	// layer_orchestrator.k:70:5, :71:16
    .valid        (p0_stage1_enable),	// layer_orchestrator.k:71:16
    .valid_out    (/* unused */)
  );	// layer_orchestrator.k:70:5
  assign done_out = p0_stage2_enable;	// layer_orchestrator.k:71:16
  assign decr_semaphore_thread_count_12_out = decr_semaphore_thread_count_12_out_0;	// layer_orchestrator.k:71:16
  assign fifo_data_out_0 = fifo_data_out_0_0;	// layer_orchestrator.k:71:16
  assign fifo_wren_0 = fifo_wren_0_0;	// layer_orchestrator.k:71:16
  assign input_rdy_0 = input_rdy_0_0;	// layer_orchestrator.k:71:16
  assign control_state_out = control_state_out_0;	// layer_orchestrator.k:71:16
endmodule

module layer_orchestrator_residual_add_step_BasicBlock_0(	// layer_orchestrator.k:71:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  input  wire        semaphore_full_12_in,
  output wire        incr_semaphore_thread_count_12_out,
  output wire [32:0] fifo_data_out_0,
  output wire        fifo_wren_0,
  output wire        context_saver_caller_wren_1,
  output wire        context_saver_caller_loop_count_1,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [31:0] data_in_54,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  logic        done_out_0;	// layer_orchestrator.k:71:9
  logic        incr_semaphore_thread_count_12_out_0;	// layer_orchestrator.k:71:9
  logic [32:0] fifo_data_out_0_0;	// layer_orchestrator.k:71:9
  logic        fifo_wren_0_0;	// layer_orchestrator.k:71:9
  logic        context_saver_caller_wren_1_0;	// layer_orchestrator.k:71:9
  logic        context_saver_caller_loop_count_1_0;	// layer_orchestrator.k:71:9
  logic        input_rdy_0_0;	// layer_orchestrator.k:71:9
  logic [7:0]  control_state_out_0;	// layer_orchestrator.k:71:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out & ~semaphore_full_12_in;	// layer_orchestrator.k:71:9
  wire         _GEN_0 = _GEN & input_valid_0;	// layer_orchestrator.k:71:9
  always_comb begin	// layer_orchestrator.k:71:9
    input_rdy_0_0 = _GEN;	// layer_orchestrator.k:71:9
    incr_semaphore_thread_count_12_out_0 = _GEN_0;	// layer_orchestrator.k:71:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       1'h0,
       semaphore_full_12_in,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// layer_orchestrator.k:71:9
  end // always_comb
  reg   [15:0] p0_a_bf16;	// layer_orchestrator.k:71:9
  reg   [15:0] p0_b_bf16;	// layer_orchestrator.k:71:9
  reg          p0_stage1_enable = 1'h0;	// layer_orchestrator.k:71:9
  reg   [15:0] p0_b_bf16_0;	// layer_orchestrator.k:71:9
  reg   [15:0] p0_a_bf16_0;	// layer_orchestrator.k:71:9
  reg          p0_stage2_enable = 1'h0;	// layer_orchestrator.k:71:9
  always @(posedge clk) begin	// layer_orchestrator.k:71:9
    p0_a_bf16 <= data_in_54[15:0];	// layer_orchestrator.k:71:9
    p0_b_bf16 <= data_in_54[31:16];	// layer_orchestrator.k:71:9
    if (rst)	// layer_orchestrator.k:71:9
      p0_stage1_enable <= 1'h0;	// layer_orchestrator.k:71:9
    else	// layer_orchestrator.k:71:9
      p0_stage1_enable <= _GEN_0;	// layer_orchestrator.k:71:9
    p0_b_bf16_0 <= p0_b_bf16;	// layer_orchestrator.k:71:9
    p0_a_bf16_0 <= p0_a_bf16;	// layer_orchestrator.k:71:9
    if (rst)	// layer_orchestrator.k:71:9
      p0_stage2_enable <= 1'h0;	// layer_orchestrator.k:71:9
    else	// layer_orchestrator.k:71:9
      p0_stage2_enable <= p0_stage1_enable;	// layer_orchestrator.k:71:9
  end // always @(posedge)
  always_comb begin	// layer_orchestrator.k:71:9
    context_saver_caller_wren_1_0 = p0_stage2_enable;	// layer_orchestrator.k:71:{9,16}
    context_saver_caller_loop_count_1_0 = 1'h1;	// layer_orchestrator.k:71:16
    fifo_wren_0_0 = p0_stage2_enable;	// layer_orchestrator.k:71:{9,16}
    fifo_data_out_0_0 = {1'h0, p0_b_bf16_0, p0_a_bf16_0};	// layer_orchestrator.k:71:{9,16}
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// layer_orchestrator.k:71:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// layer_orchestrator.k:71:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  layer_orchestratorDebugView_residual_add_stepEntry layer_orchestratorDebugView_residual_add_stepEntry_instance (	// layer_orchestrator.k:70:5
    .clk       (clk),	// layer_orchestrator.k:70:5
    ._a_bf16   (p0_stage1_enable ? p0_a_bf16 : 'x),	// layer_orchestrator.k:70:5, :71:9
    ._b_bf16   (p0_stage1_enable ? p0_b_bf16 : 'x),	// layer_orchestrator.k:70:5, :71:9
    .valid     (p0_stage1_enable),	// layer_orchestrator.k:71:9
    .valid_out (/* unused */)
  );	// layer_orchestrator.k:70:5
  assign done_out = p0_stage2_enable;	// layer_orchestrator.k:71:9
  assign incr_semaphore_thread_count_12_out = incr_semaphore_thread_count_12_out_0;	// layer_orchestrator.k:71:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// layer_orchestrator.k:71:9
  assign fifo_wren_0 = fifo_wren_0_0;	// layer_orchestrator.k:71:9
  assign context_saver_caller_wren_1 = context_saver_caller_wren_1_0;	// layer_orchestrator.k:71:9
  assign context_saver_caller_loop_count_1 = context_saver_caller_loop_count_1_0;	// layer_orchestrator.k:71:9
  assign input_rdy_0 = input_rdy_0_0;	// layer_orchestrator.k:71:9
  assign control_state_out = control_state_out_0;	// layer_orchestrator.k:71:9
endmodule

module layer_orchestrator_swiglu_step_BasicBlock_1(	// layer_orchestrator.k:66:16
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  output wire        decr_semaphore_thread_count_11_out,
  output wire [15:0] fifo_data_out_0,
  output wire        fifo_wren_0,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [15:0] data_in_53,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  logic        done_out_0;	// layer_orchestrator.k:66:16
  logic        decr_semaphore_thread_count_11_out_0;	// layer_orchestrator.k:66:16
  logic [15:0] fifo_data_out_0_0;	// layer_orchestrator.k:66:16
  logic        fifo_wren_0_0;	// layer_orchestrator.k:66:16
  logic        input_rdy_0_0;	// layer_orchestrator.k:66:16
  logic [7:0]  control_state_out_0;	// layer_orchestrator.k:66:16
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// layer_orchestrator.k:66:16
  always_comb begin	// layer_orchestrator.k:66:16
    input_rdy_0_0 = _GEN;	// layer_orchestrator.k:66:16
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// layer_orchestrator.k:66:16
  end // always_comb
  reg   [15:0] p0_data_in_53;	// layer_orchestrator.k:66:16
  reg          p0_stage1_enable = 1'h0;	// layer_orchestrator.k:66:16
  reg   [15:0] p0_data_in_53_0;	// layer_orchestrator.k:66:16
  reg          p0_stage2_enable = 1'h0;	// layer_orchestrator.k:66:16
  always @(posedge clk) begin	// layer_orchestrator.k:66:16
    p0_data_in_53 <= data_in_53;	// layer_orchestrator.k:66:16
    if (rst)	// layer_orchestrator.k:66:16
      p0_stage1_enable <= 1'h0;	// layer_orchestrator.k:66:16
    else	// layer_orchestrator.k:66:16
      p0_stage1_enable <= _GEN & input_valid_0;	// layer_orchestrator.k:66:16
    p0_data_in_53_0 <= p0_data_in_53;	// layer_orchestrator.k:66:16
    if (rst)	// layer_orchestrator.k:66:16
      p0_stage2_enable <= 1'h0;	// layer_orchestrator.k:66:16
    else	// layer_orchestrator.k:66:16
      p0_stage2_enable <= p0_stage1_enable;	// layer_orchestrator.k:66:16
  end // always @(posedge)
  always_comb begin	// layer_orchestrator.k:66:16
    fifo_wren_0_0 = p0_stage2_enable;	// layer_orchestrator.k:65:5, :66:16
    fifo_data_out_0_0 = p0_data_in_53_0;	// layer_orchestrator.k:65:5, :66:16
  end // always_comb
  assign decr_semaphore_thread_count_11_out_0 = p0_stage2_enable;	// layer_orchestrator.k:66:16
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// layer_orchestrator.k:66:16
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// layer_orchestrator.k:66:16
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  layer_orchestratorDebugView_swiglu_stepExit layer_orchestratorDebugView_swiglu_stepExit_instance (	// layer_orchestrator.k:65:5
    .clk          (clk),	// layer_orchestrator.k:65:5
    ._ReturnValue (p0_stage1_enable ? p0_data_in_53 : 'x),	// layer_orchestrator.k:65:5, :66:16
    .valid        (p0_stage1_enable),	// layer_orchestrator.k:66:16
    .valid_out    (/* unused */)
  );	// layer_orchestrator.k:65:5
  assign done_out = p0_stage2_enable;	// layer_orchestrator.k:66:16
  assign decr_semaphore_thread_count_11_out = decr_semaphore_thread_count_11_out_0;	// layer_orchestrator.k:66:16
  assign fifo_data_out_0 = fifo_data_out_0_0;	// layer_orchestrator.k:66:16
  assign fifo_wren_0 = fifo_wren_0_0;	// layer_orchestrator.k:66:16
  assign input_rdy_0 = input_rdy_0_0;	// layer_orchestrator.k:66:16
  assign control_state_out = control_state_out_0;	// layer_orchestrator.k:66:16
endmodule

module layer_orchestrator_swiglu_step_BasicBlock_0(	// layer_orchestrator.k:66:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  input  wire        semaphore_full_11_in,
  output wire        incr_semaphore_thread_count_11_out,
  output wire [32:0] fifo_data_out_0,
  output wire        fifo_wren_0,
  output wire        context_saver_caller_wren_1,
  output wire        context_saver_caller_loop_count_1,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [31:0] data_in_52,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  logic        done_out_0;	// layer_orchestrator.k:66:9
  logic        incr_semaphore_thread_count_11_out_0;	// layer_orchestrator.k:66:9
  logic [32:0] fifo_data_out_0_0;	// layer_orchestrator.k:66:9
  logic        fifo_wren_0_0;	// layer_orchestrator.k:66:9
  logic        context_saver_caller_wren_1_0;	// layer_orchestrator.k:66:9
  logic        context_saver_caller_loop_count_1_0;	// layer_orchestrator.k:66:9
  logic        input_rdy_0_0;	// layer_orchestrator.k:66:9
  logic [7:0]  control_state_out_0;	// layer_orchestrator.k:66:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out & ~semaphore_full_11_in;	// layer_orchestrator.k:66:9
  wire         _GEN_0 = _GEN & input_valid_0;	// layer_orchestrator.k:66:9
  always_comb begin	// layer_orchestrator.k:66:9
    input_rdy_0_0 = _GEN;	// layer_orchestrator.k:66:9
    incr_semaphore_thread_count_11_out_0 = _GEN_0;	// layer_orchestrator.k:66:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       1'h0,
       semaphore_full_11_in,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// layer_orchestrator.k:66:9
  end // always_comb
  reg   [15:0] p0_gate_bf16;	// layer_orchestrator.k:66:9
  reg   [15:0] p0_up_bf16;	// layer_orchestrator.k:66:9
  reg          p0_stage1_enable = 1'h0;	// layer_orchestrator.k:66:9
  reg   [15:0] p0_up_bf16_0;	// layer_orchestrator.k:66:9
  reg   [15:0] p0_gate_bf16_0;	// layer_orchestrator.k:66:9
  reg          p0_stage2_enable = 1'h0;	// layer_orchestrator.k:66:9
  always @(posedge clk) begin	// layer_orchestrator.k:66:9
    p0_gate_bf16 <= data_in_52[15:0];	// layer_orchestrator.k:66:9
    p0_up_bf16 <= data_in_52[31:16];	// layer_orchestrator.k:66:9
    if (rst)	// layer_orchestrator.k:66:9
      p0_stage1_enable <= 1'h0;	// layer_orchestrator.k:66:9
    else	// layer_orchestrator.k:66:9
      p0_stage1_enable <= _GEN_0;	// layer_orchestrator.k:66:9
    p0_up_bf16_0 <= p0_up_bf16;	// layer_orchestrator.k:66:9
    p0_gate_bf16_0 <= p0_gate_bf16;	// layer_orchestrator.k:66:9
    if (rst)	// layer_orchestrator.k:66:9
      p0_stage2_enable <= 1'h0;	// layer_orchestrator.k:66:9
    else	// layer_orchestrator.k:66:9
      p0_stage2_enable <= p0_stage1_enable;	// layer_orchestrator.k:66:9
  end // always @(posedge)
  always_comb begin	// layer_orchestrator.k:66:9
    context_saver_caller_wren_1_0 = p0_stage2_enable;	// layer_orchestrator.k:66:{9,16}
    context_saver_caller_loop_count_1_0 = 1'h1;	// layer_orchestrator.k:66:16
    fifo_wren_0_0 = p0_stage2_enable;	// layer_orchestrator.k:66:{9,16}
    fifo_data_out_0_0 = {1'h0, p0_up_bf16_0, p0_gate_bf16_0};	// layer_orchestrator.k:66:{9,16}
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// layer_orchestrator.k:66:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// layer_orchestrator.k:66:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  layer_orchestratorDebugView_swiglu_stepEntry layer_orchestratorDebugView_swiglu_stepEntry_instance (	// layer_orchestrator.k:65:5
    .clk        (clk),	// layer_orchestrator.k:65:5
    ._gate_bf16 (p0_stage1_enable ? p0_gate_bf16 : 'x),	// layer_orchestrator.k:65:5, :66:9
    ._up_bf16   (p0_stage1_enable ? p0_up_bf16 : 'x),	// layer_orchestrator.k:65:5, :66:9
    .valid      (p0_stage1_enable),	// layer_orchestrator.k:66:9
    .valid_out  (/* unused */)
  );	// layer_orchestrator.k:65:5
  assign done_out = p0_stage2_enable;	// layer_orchestrator.k:66:9
  assign incr_semaphore_thread_count_11_out = incr_semaphore_thread_count_11_out_0;	// layer_orchestrator.k:66:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// layer_orchestrator.k:66:9
  assign fifo_wren_0 = fifo_wren_0_0;	// layer_orchestrator.k:66:9
  assign context_saver_caller_wren_1 = context_saver_caller_wren_1_0;	// layer_orchestrator.k:66:9
  assign context_saver_caller_loop_count_1 = context_saver_caller_loop_count_1_0;	// layer_orchestrator.k:66:9
  assign input_rdy_0 = input_rdy_0_0;	// layer_orchestrator.k:66:9
  assign control_state_out = control_state_out_0;	// layer_orchestrator.k:66:9
endmodule

module layer_orchestrator_rmsnorm_step_BasicBlock_1(	// layer_orchestrator.k:62:40
  input  wire       clk,
  input  wire       rst,
  output wire       done_out,
  output wire       decr_semaphore_thread_count_10_out,
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
  logic       done_out_0;	// layer_orchestrator.k:62:40
  logic       decr_semaphore_thread_count_10_out_0;	// layer_orchestrator.k:62:40
  logic       fifo_wren_0_0;	// layer_orchestrator.k:62:40
  logic       input_rdy_0_0;	// layer_orchestrator.k:62:40
  logic [7:0] control_state_out_0;	// layer_orchestrator.k:62:40
  wire        _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// layer_orchestrator.k:62:40
  always_comb begin	// layer_orchestrator.k:62:40
    input_rdy_0_0 = _GEN;	// layer_orchestrator.k:62:40
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// layer_orchestrator.k:62:40
  end // always_comb
  reg         p0_stage1_enable = 1'h0;	// layer_orchestrator.k:62:40
  reg         p0_stage2_enable = 1'h0;	// layer_orchestrator.k:62:40
  always @(posedge clk) begin	// layer_orchestrator.k:62:40
    if (rst) begin	// layer_orchestrator.k:62:40
      p0_stage1_enable <= 1'h0;	// layer_orchestrator.k:62:40
      p0_stage2_enable <= 1'h0;	// layer_orchestrator.k:62:40
    end
    else begin	// layer_orchestrator.k:62:40
      p0_stage1_enable <= _GEN & input_valid_0;	// layer_orchestrator.k:62:40
      p0_stage2_enable <= p0_stage1_enable;	// layer_orchestrator.k:62:40
    end
  end // always @(posedge)
  always_comb	// layer_orchestrator.k:62:40
    fifo_wren_0_0 = p0_stage2_enable;	// layer_orchestrator.k:62:40
  assign decr_semaphore_thread_count_10_out_0 = p0_stage2_enable;	// layer_orchestrator.k:62:40
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// layer_orchestrator.k:62:40
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// layer_orchestrator.k:62:40
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  assign done_out = p0_stage2_enable;	// layer_orchestrator.k:62:40
  assign decr_semaphore_thread_count_10_out = decr_semaphore_thread_count_10_out_0;	// layer_orchestrator.k:62:40
  assign fifo_wren_0 = fifo_wren_0_0;	// layer_orchestrator.k:62:40
  assign input_rdy_0 = input_rdy_0_0;	// layer_orchestrator.k:62:40
  assign control_state_out = control_state_out_0;	// layer_orchestrator.k:62:40
endmodule

module layer_orchestrator_rmsnorm_step_BasicBlock_0(	// layer_orchestrator.k:62:40
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  input  wire        semaphore_full_10_in,
  output wire        incr_semaphore_thread_count_10_out,
  output wire [16:0] fifo_data_out_0,
  output wire        fifo_wren_0,
  output wire        context_saver_caller_wren_1,
  output wire        context_saver_caller_loop_count_1,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [15:0] data_in_50,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  logic        done_out_0;	// layer_orchestrator.k:62:40
  logic        incr_semaphore_thread_count_10_out_0;	// layer_orchestrator.k:62:40
  logic [16:0] fifo_data_out_0_0;	// layer_orchestrator.k:62:40
  logic        fifo_wren_0_0;	// layer_orchestrator.k:62:40
  logic        context_saver_caller_wren_1_0;	// layer_orchestrator.k:62:40
  logic        context_saver_caller_loop_count_1_0;	// layer_orchestrator.k:62:40
  logic        input_rdy_0_0;	// layer_orchestrator.k:62:40
  logic [7:0]  control_state_out_0;	// layer_orchestrator.k:62:40
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out & ~semaphore_full_10_in;	// layer_orchestrator.k:62:40
  wire         _GEN_0 = _GEN & input_valid_0;	// layer_orchestrator.k:62:40
  always_comb begin	// layer_orchestrator.k:62:40
    input_rdy_0_0 = _GEN;	// layer_orchestrator.k:62:40
    incr_semaphore_thread_count_10_out_0 = _GEN_0;	// layer_orchestrator.k:62:40
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       1'h0,
       semaphore_full_10_in,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// layer_orchestrator.k:62:40
  end // always_comb
  reg   [15:0] p0_data_in_50;	// layer_orchestrator.k:62:40
  reg          p0_stage1_enable = 1'h0;	// layer_orchestrator.k:62:40
  reg   [15:0] p0_data_in_50_0;	// layer_orchestrator.k:62:40
  reg          p0_stage2_enable = 1'h0;	// layer_orchestrator.k:62:40
  always @(posedge clk) begin	// layer_orchestrator.k:62:40
    p0_data_in_50 <= data_in_50;	// layer_orchestrator.k:62:40
    if (rst)	// layer_orchestrator.k:62:40
      p0_stage1_enable <= 1'h0;	// layer_orchestrator.k:62:40
    else	// layer_orchestrator.k:62:40
      p0_stage1_enable <= _GEN_0;	// layer_orchestrator.k:62:40
    p0_data_in_50_0 <= p0_data_in_50;	// layer_orchestrator.k:62:40
    if (rst)	// layer_orchestrator.k:62:40
      p0_stage2_enable <= 1'h0;	// layer_orchestrator.k:62:40
    else	// layer_orchestrator.k:62:40
      p0_stage2_enable <= p0_stage1_enable;	// layer_orchestrator.k:62:40
  end // always @(posedge)
  always_comb begin	// layer_orchestrator.k:62:40
    context_saver_caller_wren_1_0 = p0_stage2_enable;	// layer_orchestrator.k:62:40
    context_saver_caller_loop_count_1_0 = 1'h1;	// layer_orchestrator.k:62:40
    fifo_wren_0_0 = p0_stage2_enable;	// layer_orchestrator.k:62:40
    fifo_data_out_0_0 = {1'h0, p0_data_in_50_0};	// layer_orchestrator.k:62:40
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// layer_orchestrator.k:62:40
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// layer_orchestrator.k:62:40
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  layer_orchestratorDebugView_rmsnorm_stepEntry layer_orchestratorDebugView_rmsnorm_stepEntry_instance (	// layer_orchestrator.k:62:40
    .clk       (clk),	// layer_orchestrator.k:62:40
    ._x_bf16   (p0_stage1_enable ? p0_data_in_50 : 'x),	// layer_orchestrator.k:62:40
    .valid     (p0_stage1_enable),	// layer_orchestrator.k:62:40
    .valid_out (/* unused */)
  );	// layer_orchestrator.k:62:40
  assign done_out = p0_stage2_enable;	// layer_orchestrator.k:62:40
  assign incr_semaphore_thread_count_10_out = incr_semaphore_thread_count_10_out_0;	// layer_orchestrator.k:62:40
  assign fifo_data_out_0 = fifo_data_out_0_0;	// layer_orchestrator.k:62:40
  assign fifo_wren_0 = fifo_wren_0_0;	// layer_orchestrator.k:62:40
  assign context_saver_caller_wren_1 = context_saver_caller_wren_1_0;	// layer_orchestrator.k:62:40
  assign context_saver_caller_loop_count_1 = context_saver_caller_loop_count_1_0;	// layer_orchestrator.k:62:40
  assign input_rdy_0 = input_rdy_0_0;	// layer_orchestrator.k:62:40
  assign control_state_out = control_state_out_0;	// layer_orchestrator.k:62:40
endmodule

module layer_orchestrator_rmsnorm_get_sum_BasicBlock_1(	// layer_orchestrator.k:57:39
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  output wire        decr_semaphore_thread_count_9_out,
  output wire [31:0] fifo_data_out_0,
  output wire        fifo_wren_0,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [31:0] data_in_49,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  logic        done_out_0;	// layer_orchestrator.k:57:39
  logic        decr_semaphore_thread_count_9_out_0;	// layer_orchestrator.k:57:39
  logic [31:0] fifo_data_out_0_0;	// layer_orchestrator.k:57:39
  logic        fifo_wren_0_0;	// layer_orchestrator.k:57:39
  logic        input_rdy_0_0;	// layer_orchestrator.k:57:39
  logic [7:0]  control_state_out_0;	// layer_orchestrator.k:57:39
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// layer_orchestrator.k:57:39
  always_comb begin	// layer_orchestrator.k:57:39
    input_rdy_0_0 = _GEN;	// layer_orchestrator.k:57:39
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// layer_orchestrator.k:57:39
  end // always_comb
  reg   [31:0] p0_data_in_49;	// layer_orchestrator.k:57:39
  reg          p0_stage1_enable = 1'h0;	// layer_orchestrator.k:57:39
  reg   [31:0] p0_data_in_49_0;	// layer_orchestrator.k:57:39
  reg          p0_stage2_enable = 1'h0;	// layer_orchestrator.k:57:39
  always @(posedge clk) begin	// layer_orchestrator.k:57:39
    p0_data_in_49 <= data_in_49;	// layer_orchestrator.k:57:39
    if (rst)	// layer_orchestrator.k:57:39
      p0_stage1_enable <= 1'h0;	// layer_orchestrator.k:57:39
    else	// layer_orchestrator.k:57:39
      p0_stage1_enable <= _GEN & input_valid_0;	// layer_orchestrator.k:57:39
    p0_data_in_49_0 <= p0_data_in_49;	// layer_orchestrator.k:57:39
    if (rst)	// layer_orchestrator.k:57:39
      p0_stage2_enable <= 1'h0;	// layer_orchestrator.k:57:39
    else	// layer_orchestrator.k:57:39
      p0_stage2_enable <= p0_stage1_enable;	// layer_orchestrator.k:57:39
  end // always @(posedge)
  always_comb begin	// layer_orchestrator.k:57:39
    fifo_wren_0_0 = p0_stage2_enable;	// layer_orchestrator.k:57:{5,39}
    fifo_data_out_0_0 = p0_data_in_49_0;	// layer_orchestrator.k:57:{5,39}
  end // always_comb
  assign decr_semaphore_thread_count_9_out_0 = p0_stage2_enable;	// layer_orchestrator.k:57:39
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// layer_orchestrator.k:57:39
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// layer_orchestrator.k:57:39
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  layer_orchestratorDebugView_rmsnorm_get_sumExit layer_orchestratorDebugView_rmsnorm_get_sumExit_instance (	// layer_orchestrator.k:57:5
    .clk          (clk),	// layer_orchestrator.k:57:5
    ._ReturnValue (p0_stage1_enable ? p0_data_in_49 : 'x),	// layer_orchestrator.k:57:{5,39}
    .valid        (p0_stage1_enable),	// layer_orchestrator.k:57:39
    .valid_out    (/* unused */)
  );	// layer_orchestrator.k:57:5
  assign done_out = p0_stage2_enable;	// layer_orchestrator.k:57:39
  assign decr_semaphore_thread_count_9_out = decr_semaphore_thread_count_9_out_0;	// layer_orchestrator.k:57:39
  assign fifo_data_out_0 = fifo_data_out_0_0;	// layer_orchestrator.k:57:39
  assign fifo_wren_0 = fifo_wren_0_0;	// layer_orchestrator.k:57:39
  assign input_rdy_0 = input_rdy_0_0;	// layer_orchestrator.k:57:39
  assign control_state_out = control_state_out_0;	// layer_orchestrator.k:57:39
endmodule

module layer_orchestrator_rmsnorm_get_sum_BasicBlock_0(	// layer_orchestrator.k:57:32
  input  wire       clk,
  input  wire       rst,
  output wire       done_out,
  input  wire       semaphore_full_9_in,
  output wire       incr_semaphore_thread_count_9_out,
  output wire       fifo_data_out_0,
  output wire       fifo_wren_0,
  output wire       context_saver_caller_wren_1,
  output wire       context_saver_caller_loop_count_1,
  input  wire       fifo_almost_full_in_raw_0,
  input  wire       fifo_overflow_in_0,
  input  wire       input_fifo_underflow_0,
  output wire       input_rdy_0,
  input  wire       input_valid_0,
  output wire [7:0] control_state_out
);

  wire        _fifo_overflow_ffc_0_data_out;
  wire        _fifo_almostfull_ffc_0_data_out;
  logic       done_out_0;	// layer_orchestrator.k:57:32
  logic       incr_semaphore_thread_count_9_out_0;	// layer_orchestrator.k:57:32
  logic       fifo_data_out_0_0;	// layer_orchestrator.k:57:32
  logic       fifo_wren_0_0;	// layer_orchestrator.k:57:32
  logic       context_saver_caller_wren_1_0;	// layer_orchestrator.k:57:32
  logic       context_saver_caller_loop_count_1_0;	// layer_orchestrator.k:57:32
  logic       input_rdy_0_0;	// layer_orchestrator.k:57:32
  logic [7:0] control_state_out_0;	// layer_orchestrator.k:57:32
  wire        _GEN = ~rst & _fifo_almostfull_ffc_0_data_out & ~semaphore_full_9_in;	// layer_orchestrator.k:57:32
  wire        _GEN_0 = _GEN & input_valid_0;	// layer_orchestrator.k:57:32
  always_comb begin	// layer_orchestrator.k:57:32
    input_rdy_0_0 = _GEN;	// layer_orchestrator.k:57:32
    incr_semaphore_thread_count_9_out_0 = _GEN_0;	// layer_orchestrator.k:57:32
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       1'h0,
       semaphore_full_9_in,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// layer_orchestrator.k:57:32
  end // always_comb
  reg         p0_stage1_enable = 1'h0;	// layer_orchestrator.k:57:32
  reg         p0_stage2_enable = 1'h0;	// layer_orchestrator.k:57:32
  always @(posedge clk) begin	// layer_orchestrator.k:57:32
    if (rst) begin	// layer_orchestrator.k:57:32
      p0_stage1_enable <= 1'h0;	// layer_orchestrator.k:57:32
      p0_stage2_enable <= 1'h0;	// layer_orchestrator.k:57:32
    end
    else begin	// layer_orchestrator.k:57:32
      p0_stage1_enable <= _GEN_0;	// layer_orchestrator.k:57:32
      p0_stage2_enable <= p0_stage1_enable;	// layer_orchestrator.k:57:32
    end
  end // always @(posedge)
  always_comb begin	// layer_orchestrator.k:57:32
    context_saver_caller_wren_1_0 = p0_stage2_enable;	// layer_orchestrator.k:57:{32,39}
    context_saver_caller_loop_count_1_0 = 1'h1;	// layer_orchestrator.k:57:39
    fifo_wren_0_0 = p0_stage2_enable;	// layer_orchestrator.k:57:{32,39}
    fifo_data_out_0_0 = 1'h0;	// layer_orchestrator.k:57:{32,39}
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// layer_orchestrator.k:57:32
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// layer_orchestrator.k:57:32
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  assign done_out = p0_stage2_enable;	// layer_orchestrator.k:57:32
  assign incr_semaphore_thread_count_9_out = incr_semaphore_thread_count_9_out_0;	// layer_orchestrator.k:57:32
  assign fifo_data_out_0 = fifo_data_out_0_0;	// layer_orchestrator.k:57:32
  assign fifo_wren_0 = fifo_wren_0_0;	// layer_orchestrator.k:57:32
  assign context_saver_caller_wren_1 = context_saver_caller_wren_1_0;	// layer_orchestrator.k:57:32
  assign context_saver_caller_loop_count_1 = context_saver_caller_loop_count_1_0;	// layer_orchestrator.k:57:32
  assign input_rdy_0 = input_rdy_0_0;	// layer_orchestrator.k:57:32
  assign control_state_out = control_state_out_0;	// layer_orchestrator.k:57:32
endmodule

module layer_orchestrator_rmsnorm_reset_BasicBlock_1(	// layer_orchestrator.k:56:28
  input  wire       clk,
  input  wire       rst,
  output wire       done_out,
  output wire       decr_semaphore_thread_count_8_out,
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
  logic       done_out_0;	// layer_orchestrator.k:56:28
  logic       decr_semaphore_thread_count_8_out_0;	// layer_orchestrator.k:56:28
  logic       fifo_wren_0_0;	// layer_orchestrator.k:56:28
  logic       input_rdy_0_0;	// layer_orchestrator.k:56:28
  logic [7:0] control_state_out_0;	// layer_orchestrator.k:56:28
  wire        _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// layer_orchestrator.k:56:28
  always_comb begin	// layer_orchestrator.k:56:28
    input_rdy_0_0 = _GEN;	// layer_orchestrator.k:56:28
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// layer_orchestrator.k:56:28
  end // always_comb
  reg         p0_stage1_enable = 1'h0;	// layer_orchestrator.k:56:28
  reg         p0_stage2_enable = 1'h0;	// layer_orchestrator.k:56:28
  always @(posedge clk) begin	// layer_orchestrator.k:56:28
    if (rst) begin	// layer_orchestrator.k:56:28
      p0_stage1_enable <= 1'h0;	// layer_orchestrator.k:56:28
      p0_stage2_enable <= 1'h0;	// layer_orchestrator.k:56:28
    end
    else begin	// layer_orchestrator.k:56:28
      p0_stage1_enable <= _GEN & input_valid_0;	// layer_orchestrator.k:56:28
      p0_stage2_enable <= p0_stage1_enable;	// layer_orchestrator.k:56:28
    end
  end // always @(posedge)
  always_comb	// layer_orchestrator.k:56:28
    fifo_wren_0_0 = p0_stage2_enable;	// layer_orchestrator.k:56:28
  assign decr_semaphore_thread_count_8_out_0 = p0_stage2_enable;	// layer_orchestrator.k:56:28
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// layer_orchestrator.k:56:28
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// layer_orchestrator.k:56:28
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  assign done_out = p0_stage2_enable;	// layer_orchestrator.k:56:28
  assign decr_semaphore_thread_count_8_out = decr_semaphore_thread_count_8_out_0;	// layer_orchestrator.k:56:28
  assign fifo_wren_0 = fifo_wren_0_0;	// layer_orchestrator.k:56:28
  assign input_rdy_0 = input_rdy_0_0;	// layer_orchestrator.k:56:28
  assign control_state_out = control_state_out_0;	// layer_orchestrator.k:56:28
endmodule

module layer_orchestrator_rmsnorm_reset_BasicBlock_0(	// layer_orchestrator.k:56:28
  input  wire       clk,
  input  wire       rst,
  output wire       done_out,
  input  wire       semaphore_full_8_in,
  output wire       incr_semaphore_thread_count_8_out,
  output wire       fifo_data_out_0,
  output wire       fifo_wren_0,
  output wire       context_saver_caller_wren_1,
  output wire       context_saver_caller_loop_count_1,
  input  wire       fifo_almost_full_in_raw_0,
  input  wire       fifo_overflow_in_0,
  input  wire       input_fifo_underflow_0,
  output wire       input_rdy_0,
  input  wire       input_valid_0,
  output wire [7:0] control_state_out
);

  wire        _fifo_overflow_ffc_0_data_out;
  wire        _fifo_almostfull_ffc_0_data_out;
  logic       done_out_0;	// layer_orchestrator.k:56:28
  logic       incr_semaphore_thread_count_8_out_0;	// layer_orchestrator.k:56:28
  logic       fifo_data_out_0_0;	// layer_orchestrator.k:56:28
  logic       fifo_wren_0_0;	// layer_orchestrator.k:56:28
  logic       context_saver_caller_wren_1_0;	// layer_orchestrator.k:56:28
  logic       context_saver_caller_loop_count_1_0;	// layer_orchestrator.k:56:28
  logic       input_rdy_0_0;	// layer_orchestrator.k:56:28
  logic [7:0] control_state_out_0;	// layer_orchestrator.k:56:28
  wire        _GEN = ~rst & _fifo_almostfull_ffc_0_data_out & ~semaphore_full_8_in;	// layer_orchestrator.k:56:28
  wire        _GEN_0 = _GEN & input_valid_0;	// layer_orchestrator.k:56:28
  always_comb begin	// layer_orchestrator.k:56:28
    input_rdy_0_0 = _GEN;	// layer_orchestrator.k:56:28
    incr_semaphore_thread_count_8_out_0 = _GEN_0;	// layer_orchestrator.k:56:28
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       1'h0,
       semaphore_full_8_in,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// layer_orchestrator.k:56:28
  end // always_comb
  reg         p0_stage1_enable = 1'h0;	// layer_orchestrator.k:56:28
  reg         p0_stage2_enable = 1'h0;	// layer_orchestrator.k:56:28
  always @(posedge clk) begin	// layer_orchestrator.k:56:28
    if (rst) begin	// layer_orchestrator.k:56:28
      p0_stage1_enable <= 1'h0;	// layer_orchestrator.k:56:28
      p0_stage2_enable <= 1'h0;	// layer_orchestrator.k:56:28
    end
    else begin	// layer_orchestrator.k:56:28
      p0_stage1_enable <= _GEN_0;	// layer_orchestrator.k:56:28
      p0_stage2_enable <= p0_stage1_enable;	// layer_orchestrator.k:56:28
    end
  end // always @(posedge)
  always_comb begin	// layer_orchestrator.k:56:28
    context_saver_caller_wren_1_0 = p0_stage2_enable;	// layer_orchestrator.k:56:28
    context_saver_caller_loop_count_1_0 = 1'h1;	// layer_orchestrator.k:56:28
    fifo_wren_0_0 = p0_stage2_enable;	// layer_orchestrator.k:56:28
    fifo_data_out_0_0 = 1'h0;	// layer_orchestrator.k:56:28
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// layer_orchestrator.k:56:28
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// layer_orchestrator.k:56:28
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  assign done_out = p0_stage2_enable;	// layer_orchestrator.k:56:28
  assign incr_semaphore_thread_count_8_out = incr_semaphore_thread_count_8_out_0;	// layer_orchestrator.k:56:28
  assign fifo_data_out_0 = fifo_data_out_0_0;	// layer_orchestrator.k:56:28
  assign fifo_wren_0 = fifo_wren_0_0;	// layer_orchestrator.k:56:28
  assign context_saver_caller_wren_1 = context_saver_caller_wren_1_0;	// layer_orchestrator.k:56:28
  assign context_saver_caller_loop_count_1 = context_saver_caller_loop_count_1_0;	// layer_orchestrator.k:56:28
  assign input_rdy_0 = input_rdy_0_0;	// layer_orchestrator.k:56:28
  assign control_state_out = control_state_out_0;	// layer_orchestrator.k:56:28
endmodule

module layer_orchestrator_prog_sigmoid_lut_BasicBlock_1(	// layer_orchestrator.k:45:56
  input  wire       clk,
  input  wire       rst,
  output wire       done_out,
  output wire       decr_semaphore_thread_count_7_out,
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
  logic       done_out_0;	// layer_orchestrator.k:45:56
  logic       decr_semaphore_thread_count_7_out_0;	// layer_orchestrator.k:45:56
  logic       fifo_wren_0_0;	// layer_orchestrator.k:45:56
  logic       input_rdy_0_0;	// layer_orchestrator.k:45:56
  logic [7:0] control_state_out_0;	// layer_orchestrator.k:45:56
  wire        _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// layer_orchestrator.k:45:56
  always_comb begin	// layer_orchestrator.k:45:56
    input_rdy_0_0 = _GEN;	// layer_orchestrator.k:45:56
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// layer_orchestrator.k:45:56
  end // always_comb
  reg         p0_stage1_enable = 1'h0;	// layer_orchestrator.k:45:56
  reg         p0_stage2_enable = 1'h0;	// layer_orchestrator.k:45:56
  always @(posedge clk) begin	// layer_orchestrator.k:45:56
    if (rst) begin	// layer_orchestrator.k:45:56
      p0_stage1_enable <= 1'h0;	// layer_orchestrator.k:45:56
      p0_stage2_enable <= 1'h0;	// layer_orchestrator.k:45:56
    end
    else begin	// layer_orchestrator.k:45:56
      p0_stage1_enable <= _GEN & input_valid_0;	// layer_orchestrator.k:45:56
      p0_stage2_enable <= p0_stage1_enable;	// layer_orchestrator.k:45:56
    end
  end // always @(posedge)
  always_comb	// layer_orchestrator.k:45:56
    fifo_wren_0_0 = p0_stage2_enable;	// layer_orchestrator.k:45:56
  assign decr_semaphore_thread_count_7_out_0 = p0_stage2_enable;	// layer_orchestrator.k:45:56
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// layer_orchestrator.k:45:56
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// layer_orchestrator.k:45:56
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  assign done_out = p0_stage2_enable;	// layer_orchestrator.k:45:56
  assign decr_semaphore_thread_count_7_out = decr_semaphore_thread_count_7_out_0;	// layer_orchestrator.k:45:56
  assign fifo_wren_0 = fifo_wren_0_0;	// layer_orchestrator.k:45:56
  assign input_rdy_0 = input_rdy_0_0;	// layer_orchestrator.k:45:56
  assign control_state_out = control_state_out_0;	// layer_orchestrator.k:45:56
endmodule

module layer_orchestrator_prog_sigmoid_lut_BasicBlock_0(	// layer_orchestrator.k:45:56
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  input  wire        semaphore_full_7_in,
  output wire        incr_semaphore_thread_count_7_out,
  output wire [24:0] fifo_data_out_0,
  output wire        fifo_wren_0,
  output wire        context_saver_caller_wren_1,
  output wire        context_saver_caller_loop_count_1,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [23:0] data_in_44,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  logic        done_out_0;	// layer_orchestrator.k:45:56
  logic        incr_semaphore_thread_count_7_out_0;	// layer_orchestrator.k:45:56
  logic [24:0] fifo_data_out_0_0;	// layer_orchestrator.k:45:56
  logic        fifo_wren_0_0;	// layer_orchestrator.k:45:56
  logic        context_saver_caller_wren_1_0;	// layer_orchestrator.k:45:56
  logic        context_saver_caller_loop_count_1_0;	// layer_orchestrator.k:45:56
  logic        input_rdy_0_0;	// layer_orchestrator.k:45:56
  logic [7:0]  control_state_out_0;	// layer_orchestrator.k:45:56
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out & ~semaphore_full_7_in;	// layer_orchestrator.k:45:56
  wire         _GEN_0 = _GEN & input_valid_0;	// layer_orchestrator.k:45:56
  always_comb begin	// layer_orchestrator.k:45:56
    input_rdy_0_0 = _GEN;	// layer_orchestrator.k:45:56
    incr_semaphore_thread_count_7_out_0 = _GEN_0;	// layer_orchestrator.k:45:56
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       1'h0,
       semaphore_full_7_in,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// layer_orchestrator.k:45:56
  end // always_comb
  reg   [7:0]  p0_idx;	// layer_orchestrator.k:45:56
  reg   [15:0] p0_val;	// layer_orchestrator.k:45:56
  reg          p0_stage1_enable = 1'h0;	// layer_orchestrator.k:45:56
  reg   [15:0] p0_val_0;	// layer_orchestrator.k:45:56
  reg   [7:0]  p0_idx_0;	// layer_orchestrator.k:45:56
  reg          p0_stage2_enable = 1'h0;	// layer_orchestrator.k:45:56
  always @(posedge clk) begin	// layer_orchestrator.k:45:56
    p0_idx <= data_in_44[7:0];	// layer_orchestrator.k:45:56
    p0_val <= data_in_44[23:8];	// layer_orchestrator.k:45:56
    if (rst)	// layer_orchestrator.k:45:56
      p0_stage1_enable <= 1'h0;	// layer_orchestrator.k:45:56
    else	// layer_orchestrator.k:45:56
      p0_stage1_enable <= _GEN_0;	// layer_orchestrator.k:45:56
    p0_val_0 <= p0_val;	// layer_orchestrator.k:45:56
    p0_idx_0 <= p0_idx;	// layer_orchestrator.k:45:56
    if (rst)	// layer_orchestrator.k:45:56
      p0_stage2_enable <= 1'h0;	// layer_orchestrator.k:45:56
    else	// layer_orchestrator.k:45:56
      p0_stage2_enable <= p0_stage1_enable;	// layer_orchestrator.k:45:56
  end // always @(posedge)
  always_comb begin	// layer_orchestrator.k:45:56
    context_saver_caller_wren_1_0 = p0_stage2_enable;	// layer_orchestrator.k:45:56
    context_saver_caller_loop_count_1_0 = 1'h1;	// layer_orchestrator.k:45:56
    fifo_wren_0_0 = p0_stage2_enable;	// layer_orchestrator.k:45:56
    fifo_data_out_0_0 = {1'h0, p0_val_0, p0_idx_0};	// layer_orchestrator.k:45:56
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// layer_orchestrator.k:45:56
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// layer_orchestrator.k:45:56
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  layer_orchestratorDebugView_prog_sigmoid_lutEntry layer_orchestratorDebugView_prog_sigmoid_lutEntry_instance (	// layer_orchestrator.k:45:56
    .clk       (clk),	// layer_orchestrator.k:45:56
    ._idx      (p0_stage1_enable ? p0_idx : 'x),	// layer_orchestrator.k:45:56
    ._val      (p0_stage1_enable ? p0_val : 'x),	// layer_orchestrator.k:45:56
    .valid     (p0_stage1_enable),	// layer_orchestrator.k:45:56
    .valid_out (/* unused */)
  );	// layer_orchestrator.k:45:56
  assign done_out = p0_stage2_enable;	// layer_orchestrator.k:45:56
  assign incr_semaphore_thread_count_7_out = incr_semaphore_thread_count_7_out_0;	// layer_orchestrator.k:45:56
  assign fifo_data_out_0 = fifo_data_out_0_0;	// layer_orchestrator.k:45:56
  assign fifo_wren_0 = fifo_wren_0_0;	// layer_orchestrator.k:45:56
  assign context_saver_caller_wren_1 = context_saver_caller_wren_1_0;	// layer_orchestrator.k:45:56
  assign context_saver_caller_loop_count_1 = context_saver_caller_loop_count_1_0;	// layer_orchestrator.k:45:56
  assign input_rdy_0 = input_rdy_0_0;	// layer_orchestrator.k:45:56
  assign control_state_out = control_state_out_0;	// layer_orchestrator.k:45:56
endmodule

module layer_orchestrator_prog_rsqrt_lut_BasicBlock_1(	// layer_orchestrator.k:44:56
  input  wire       clk,
  input  wire       rst,
  output wire       done_out,
  output wire       decr_semaphore_thread_count_6_out,
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
  logic       done_out_0;	// layer_orchestrator.k:44:56
  logic       decr_semaphore_thread_count_6_out_0;	// layer_orchestrator.k:44:56
  logic       fifo_wren_0_0;	// layer_orchestrator.k:44:56
  logic       input_rdy_0_0;	// layer_orchestrator.k:44:56
  logic [7:0] control_state_out_0;	// layer_orchestrator.k:44:56
  wire        _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// layer_orchestrator.k:44:56
  always_comb begin	// layer_orchestrator.k:44:56
    input_rdy_0_0 = _GEN;	// layer_orchestrator.k:44:56
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// layer_orchestrator.k:44:56
  end // always_comb
  reg         p0_stage1_enable = 1'h0;	// layer_orchestrator.k:44:56
  reg         p0_stage2_enable = 1'h0;	// layer_orchestrator.k:44:56
  always @(posedge clk) begin	// layer_orchestrator.k:44:56
    if (rst) begin	// layer_orchestrator.k:44:56
      p0_stage1_enable <= 1'h0;	// layer_orchestrator.k:44:56
      p0_stage2_enable <= 1'h0;	// layer_orchestrator.k:44:56
    end
    else begin	// layer_orchestrator.k:44:56
      p0_stage1_enable <= _GEN & input_valid_0;	// layer_orchestrator.k:44:56
      p0_stage2_enable <= p0_stage1_enable;	// layer_orchestrator.k:44:56
    end
  end // always @(posedge)
  always_comb	// layer_orchestrator.k:44:56
    fifo_wren_0_0 = p0_stage2_enable;	// layer_orchestrator.k:44:56
  assign decr_semaphore_thread_count_6_out_0 = p0_stage2_enable;	// layer_orchestrator.k:44:56
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// layer_orchestrator.k:44:56
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// layer_orchestrator.k:44:56
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  assign done_out = p0_stage2_enable;	// layer_orchestrator.k:44:56
  assign decr_semaphore_thread_count_6_out = decr_semaphore_thread_count_6_out_0;	// layer_orchestrator.k:44:56
  assign fifo_wren_0 = fifo_wren_0_0;	// layer_orchestrator.k:44:56
  assign input_rdy_0 = input_rdy_0_0;	// layer_orchestrator.k:44:56
  assign control_state_out = control_state_out_0;	// layer_orchestrator.k:44:56
endmodule

module layer_orchestrator_prog_rsqrt_lut_BasicBlock_0(	// layer_orchestrator.k:44:56
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  input  wire        semaphore_full_6_in,
  output wire        incr_semaphore_thread_count_6_out,
  output wire [24:0] fifo_data_out_0,
  output wire        fifo_wren_0,
  output wire        context_saver_caller_wren_1,
  output wire        context_saver_caller_loop_count_1,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [23:0] data_in_42,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  logic        done_out_0;	// layer_orchestrator.k:44:56
  logic        incr_semaphore_thread_count_6_out_0;	// layer_orchestrator.k:44:56
  logic [24:0] fifo_data_out_0_0;	// layer_orchestrator.k:44:56
  logic        fifo_wren_0_0;	// layer_orchestrator.k:44:56
  logic        context_saver_caller_wren_1_0;	// layer_orchestrator.k:44:56
  logic        context_saver_caller_loop_count_1_0;	// layer_orchestrator.k:44:56
  logic        input_rdy_0_0;	// layer_orchestrator.k:44:56
  logic [7:0]  control_state_out_0;	// layer_orchestrator.k:44:56
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out & ~semaphore_full_6_in;	// layer_orchestrator.k:44:56
  wire         _GEN_0 = _GEN & input_valid_0;	// layer_orchestrator.k:44:56
  always_comb begin	// layer_orchestrator.k:44:56
    input_rdy_0_0 = _GEN;	// layer_orchestrator.k:44:56
    incr_semaphore_thread_count_6_out_0 = _GEN_0;	// layer_orchestrator.k:44:56
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       1'h0,
       semaphore_full_6_in,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// layer_orchestrator.k:44:56
  end // always_comb
  reg   [7:0]  p0_idx;	// layer_orchestrator.k:44:56
  reg   [15:0] p0_val;	// layer_orchestrator.k:44:56
  reg          p0_stage1_enable = 1'h0;	// layer_orchestrator.k:44:56
  reg   [15:0] p0_val_0;	// layer_orchestrator.k:44:56
  reg   [7:0]  p0_idx_0;	// layer_orchestrator.k:44:56
  reg          p0_stage2_enable = 1'h0;	// layer_orchestrator.k:44:56
  always @(posedge clk) begin	// layer_orchestrator.k:44:56
    p0_idx <= data_in_42[7:0];	// layer_orchestrator.k:44:56
    p0_val <= data_in_42[23:8];	// layer_orchestrator.k:44:56
    if (rst)	// layer_orchestrator.k:44:56
      p0_stage1_enable <= 1'h0;	// layer_orchestrator.k:44:56
    else	// layer_orchestrator.k:44:56
      p0_stage1_enable <= _GEN_0;	// layer_orchestrator.k:44:56
    p0_val_0 <= p0_val;	// layer_orchestrator.k:44:56
    p0_idx_0 <= p0_idx;	// layer_orchestrator.k:44:56
    if (rst)	// layer_orchestrator.k:44:56
      p0_stage2_enable <= 1'h0;	// layer_orchestrator.k:44:56
    else	// layer_orchestrator.k:44:56
      p0_stage2_enable <= p0_stage1_enable;	// layer_orchestrator.k:44:56
  end // always @(posedge)
  always_comb begin	// layer_orchestrator.k:44:56
    context_saver_caller_wren_1_0 = p0_stage2_enable;	// layer_orchestrator.k:44:56
    context_saver_caller_loop_count_1_0 = 1'h1;	// layer_orchestrator.k:44:56
    fifo_wren_0_0 = p0_stage2_enable;	// layer_orchestrator.k:44:56
    fifo_data_out_0_0 = {1'h0, p0_val_0, p0_idx_0};	// layer_orchestrator.k:44:56
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// layer_orchestrator.k:44:56
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// layer_orchestrator.k:44:56
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  layer_orchestratorDebugView_prog_rsqrt_lutEntry layer_orchestratorDebugView_prog_rsqrt_lutEntry_instance (	// layer_orchestrator.k:44:56
    .clk       (clk),	// layer_orchestrator.k:44:56
    ._idx      (p0_stage1_enable ? p0_idx : 'x),	// layer_orchestrator.k:44:56
    ._val      (p0_stage1_enable ? p0_val : 'x),	// layer_orchestrator.k:44:56
    .valid     (p0_stage1_enable),	// layer_orchestrator.k:44:56
    .valid_out (/* unused */)
  );	// layer_orchestrator.k:44:56
  assign done_out = p0_stage2_enable;	// layer_orchestrator.k:44:56
  assign incr_semaphore_thread_count_6_out = incr_semaphore_thread_count_6_out_0;	// layer_orchestrator.k:44:56
  assign fifo_data_out_0 = fifo_data_out_0_0;	// layer_orchestrator.k:44:56
  assign fifo_wren_0 = fifo_wren_0_0;	// layer_orchestrator.k:44:56
  assign context_saver_caller_wren_1 = context_saver_caller_wren_1_0;	// layer_orchestrator.k:44:56
  assign context_saver_caller_loop_count_1 = context_saver_caller_loop_count_1_0;	// layer_orchestrator.k:44:56
  assign input_rdy_0 = input_rdy_0_0;	// layer_orchestrator.k:44:56
  assign control_state_out = control_state_out_0;	// layer_orchestrator.k:44:56
endmodule

module layer_orchestrator_prog_gamma_pre_mlp_BasicBlock_1(	// layer_orchestrator.k:43:56
  input  wire       clk,
  input  wire       rst,
  output wire       done_out,
  output wire       decr_semaphore_thread_count_5_out,
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
  logic       done_out_0;	// layer_orchestrator.k:43:56
  logic       decr_semaphore_thread_count_5_out_0;	// layer_orchestrator.k:43:56
  logic       fifo_wren_0_0;	// layer_orchestrator.k:43:56
  logic       input_rdy_0_0;	// layer_orchestrator.k:43:56
  logic [7:0] control_state_out_0;	// layer_orchestrator.k:43:56
  wire        _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// layer_orchestrator.k:43:56
  always_comb begin	// layer_orchestrator.k:43:56
    input_rdy_0_0 = _GEN;	// layer_orchestrator.k:43:56
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// layer_orchestrator.k:43:56
  end // always_comb
  reg         p0_stage1_enable = 1'h0;	// layer_orchestrator.k:43:56
  reg         p0_stage2_enable = 1'h0;	// layer_orchestrator.k:43:56
  always @(posedge clk) begin	// layer_orchestrator.k:43:56
    if (rst) begin	// layer_orchestrator.k:43:56
      p0_stage1_enable <= 1'h0;	// layer_orchestrator.k:43:56
      p0_stage2_enable <= 1'h0;	// layer_orchestrator.k:43:56
    end
    else begin	// layer_orchestrator.k:43:56
      p0_stage1_enable <= _GEN & input_valid_0;	// layer_orchestrator.k:43:56
      p0_stage2_enable <= p0_stage1_enable;	// layer_orchestrator.k:43:56
    end
  end // always @(posedge)
  always_comb	// layer_orchestrator.k:43:56
    fifo_wren_0_0 = p0_stage2_enable;	// layer_orchestrator.k:43:56
  assign decr_semaphore_thread_count_5_out_0 = p0_stage2_enable;	// layer_orchestrator.k:43:56
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// layer_orchestrator.k:43:56
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// layer_orchestrator.k:43:56
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  assign done_out = p0_stage2_enable;	// layer_orchestrator.k:43:56
  assign decr_semaphore_thread_count_5_out = decr_semaphore_thread_count_5_out_0;	// layer_orchestrator.k:43:56
  assign fifo_wren_0 = fifo_wren_0_0;	// layer_orchestrator.k:43:56
  assign input_rdy_0 = input_rdy_0_0;	// layer_orchestrator.k:43:56
  assign control_state_out = control_state_out_0;	// layer_orchestrator.k:43:56
endmodule

module layer_orchestrator_prog_gamma_pre_mlp_BasicBlock_0(	// layer_orchestrator.k:43:56
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  input  wire        semaphore_full_5_in,
  output wire        incr_semaphore_thread_count_5_out,
  output wire [32:0] fifo_data_out_0,
  output wire        fifo_wren_0,
  output wire        context_saver_caller_wren_1,
  output wire        context_saver_caller_loop_count_1,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [31:0] data_in_40,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  logic        done_out_0;	// layer_orchestrator.k:43:56
  logic        incr_semaphore_thread_count_5_out_0;	// layer_orchestrator.k:43:56
  logic [32:0] fifo_data_out_0_0;	// layer_orchestrator.k:43:56
  logic        fifo_wren_0_0;	// layer_orchestrator.k:43:56
  logic        context_saver_caller_wren_1_0;	// layer_orchestrator.k:43:56
  logic        context_saver_caller_loop_count_1_0;	// layer_orchestrator.k:43:56
  logic        input_rdy_0_0;	// layer_orchestrator.k:43:56
  logic [7:0]  control_state_out_0;	// layer_orchestrator.k:43:56
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out & ~semaphore_full_5_in;	// layer_orchestrator.k:43:56
  wire         _GEN_0 = _GEN & input_valid_0;	// layer_orchestrator.k:43:56
  always_comb begin	// layer_orchestrator.k:43:56
    input_rdy_0_0 = _GEN;	// layer_orchestrator.k:43:56
    incr_semaphore_thread_count_5_out_0 = _GEN_0;	// layer_orchestrator.k:43:56
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       1'h0,
       semaphore_full_5_in,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// layer_orchestrator.k:43:56
  end // always_comb
  reg   [15:0] p0_idx;	// layer_orchestrator.k:43:56
  reg   [15:0] p0_val;	// layer_orchestrator.k:43:56
  reg          p0_stage1_enable = 1'h0;	// layer_orchestrator.k:43:56
  reg   [15:0] p0_val_0;	// layer_orchestrator.k:43:56
  reg   [15:0] p0_idx_0;	// layer_orchestrator.k:43:56
  reg          p0_stage2_enable = 1'h0;	// layer_orchestrator.k:43:56
  always @(posedge clk) begin	// layer_orchestrator.k:43:56
    p0_idx <= data_in_40[15:0];	// layer_orchestrator.k:43:56
    p0_val <= data_in_40[31:16];	// layer_orchestrator.k:43:56
    if (rst)	// layer_orchestrator.k:43:56
      p0_stage1_enable <= 1'h0;	// layer_orchestrator.k:43:56
    else	// layer_orchestrator.k:43:56
      p0_stage1_enable <= _GEN_0;	// layer_orchestrator.k:43:56
    p0_val_0 <= p0_val;	// layer_orchestrator.k:43:56
    p0_idx_0 <= p0_idx;	// layer_orchestrator.k:43:56
    if (rst)	// layer_orchestrator.k:43:56
      p0_stage2_enable <= 1'h0;	// layer_orchestrator.k:43:56
    else	// layer_orchestrator.k:43:56
      p0_stage2_enable <= p0_stage1_enable;	// layer_orchestrator.k:43:56
  end // always @(posedge)
  always_comb begin	// layer_orchestrator.k:43:56
    context_saver_caller_wren_1_0 = p0_stage2_enable;	// layer_orchestrator.k:43:56
    context_saver_caller_loop_count_1_0 = 1'h1;	// layer_orchestrator.k:43:56
    fifo_wren_0_0 = p0_stage2_enable;	// layer_orchestrator.k:43:56
    fifo_data_out_0_0 = {1'h0, p0_val_0, p0_idx_0};	// layer_orchestrator.k:43:56
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// layer_orchestrator.k:43:56
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// layer_orchestrator.k:43:56
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  layer_orchestratorDebugView_prog_gamma_pre_mlpEntry layer_orchestratorDebugView_prog_gamma_pre_mlpEntry_instance (	// layer_orchestrator.k:43:56
    .clk       (clk),	// layer_orchestrator.k:43:56
    ._idx      (p0_stage1_enable ? p0_idx : 'x),	// layer_orchestrator.k:43:56
    ._val      (p0_stage1_enable ? p0_val : 'x),	// layer_orchestrator.k:43:56
    .valid     (p0_stage1_enable),	// layer_orchestrator.k:43:56
    .valid_out (/* unused */)
  );	// layer_orchestrator.k:43:56
  assign done_out = p0_stage2_enable;	// layer_orchestrator.k:43:56
  assign incr_semaphore_thread_count_5_out = incr_semaphore_thread_count_5_out_0;	// layer_orchestrator.k:43:56
  assign fifo_data_out_0 = fifo_data_out_0_0;	// layer_orchestrator.k:43:56
  assign fifo_wren_0 = fifo_wren_0_0;	// layer_orchestrator.k:43:56
  assign context_saver_caller_wren_1 = context_saver_caller_wren_1_0;	// layer_orchestrator.k:43:56
  assign context_saver_caller_loop_count_1 = context_saver_caller_loop_count_1_0;	// layer_orchestrator.k:43:56
  assign input_rdy_0 = input_rdy_0_0;	// layer_orchestrator.k:43:56
  assign control_state_out = control_state_out_0;	// layer_orchestrator.k:43:56
endmodule

module layer_orchestrator_prog_gamma_pre_attn_BasicBlock_1(	// layer_orchestrator.k:42:56
  input  wire       clk,
  input  wire       rst,
  output wire       done_out,
  output wire       decr_semaphore_thread_count_4_out,
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
  logic       done_out_0;	// layer_orchestrator.k:42:56
  logic       decr_semaphore_thread_count_4_out_0;	// layer_orchestrator.k:42:56
  logic       fifo_wren_0_0;	// layer_orchestrator.k:42:56
  logic       input_rdy_0_0;	// layer_orchestrator.k:42:56
  logic [7:0] control_state_out_0;	// layer_orchestrator.k:42:56
  wire        _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// layer_orchestrator.k:42:56
  always_comb begin	// layer_orchestrator.k:42:56
    input_rdy_0_0 = _GEN;	// layer_orchestrator.k:42:56
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// layer_orchestrator.k:42:56
  end // always_comb
  reg         p0_stage1_enable = 1'h0;	// layer_orchestrator.k:42:56
  reg         p0_stage2_enable = 1'h0;	// layer_orchestrator.k:42:56
  always @(posedge clk) begin	// layer_orchestrator.k:42:56
    if (rst) begin	// layer_orchestrator.k:42:56
      p0_stage1_enable <= 1'h0;	// layer_orchestrator.k:42:56
      p0_stage2_enable <= 1'h0;	// layer_orchestrator.k:42:56
    end
    else begin	// layer_orchestrator.k:42:56
      p0_stage1_enable <= _GEN & input_valid_0;	// layer_orchestrator.k:42:56
      p0_stage2_enable <= p0_stage1_enable;	// layer_orchestrator.k:42:56
    end
  end // always @(posedge)
  always_comb	// layer_orchestrator.k:42:56
    fifo_wren_0_0 = p0_stage2_enable;	// layer_orchestrator.k:42:56
  assign decr_semaphore_thread_count_4_out_0 = p0_stage2_enable;	// layer_orchestrator.k:42:56
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// layer_orchestrator.k:42:56
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// layer_orchestrator.k:42:56
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  assign done_out = p0_stage2_enable;	// layer_orchestrator.k:42:56
  assign decr_semaphore_thread_count_4_out = decr_semaphore_thread_count_4_out_0;	// layer_orchestrator.k:42:56
  assign fifo_wren_0 = fifo_wren_0_0;	// layer_orchestrator.k:42:56
  assign input_rdy_0 = input_rdy_0_0;	// layer_orchestrator.k:42:56
  assign control_state_out = control_state_out_0;	// layer_orchestrator.k:42:56
endmodule

module layer_orchestrator_prog_gamma_pre_attn_BasicBlock_0(	// layer_orchestrator.k:42:56
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  input  wire        semaphore_full_4_in,
  output wire        incr_semaphore_thread_count_4_out,
  output wire [32:0] fifo_data_out_0,
  output wire        fifo_wren_0,
  output wire        context_saver_caller_wren_1,
  output wire        context_saver_caller_loop_count_1,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [31:0] data_in_38,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  logic        done_out_0;	// layer_orchestrator.k:42:56
  logic        incr_semaphore_thread_count_4_out_0;	// layer_orchestrator.k:42:56
  logic [32:0] fifo_data_out_0_0;	// layer_orchestrator.k:42:56
  logic        fifo_wren_0_0;	// layer_orchestrator.k:42:56
  logic        context_saver_caller_wren_1_0;	// layer_orchestrator.k:42:56
  logic        context_saver_caller_loop_count_1_0;	// layer_orchestrator.k:42:56
  logic        input_rdy_0_0;	// layer_orchestrator.k:42:56
  logic [7:0]  control_state_out_0;	// layer_orchestrator.k:42:56
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out & ~semaphore_full_4_in;	// layer_orchestrator.k:42:56
  wire         _GEN_0 = _GEN & input_valid_0;	// layer_orchestrator.k:42:56
  always_comb begin	// layer_orchestrator.k:42:56
    input_rdy_0_0 = _GEN;	// layer_orchestrator.k:42:56
    incr_semaphore_thread_count_4_out_0 = _GEN_0;	// layer_orchestrator.k:42:56
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       1'h0,
       semaphore_full_4_in,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// layer_orchestrator.k:42:56
  end // always_comb
  reg   [15:0] p0_idx;	// layer_orchestrator.k:42:56
  reg   [15:0] p0_val;	// layer_orchestrator.k:42:56
  reg          p0_stage1_enable = 1'h0;	// layer_orchestrator.k:42:56
  reg   [15:0] p0_val_0;	// layer_orchestrator.k:42:56
  reg   [15:0] p0_idx_0;	// layer_orchestrator.k:42:56
  reg          p0_stage2_enable = 1'h0;	// layer_orchestrator.k:42:56
  always @(posedge clk) begin	// layer_orchestrator.k:42:56
    p0_idx <= data_in_38[15:0];	// layer_orchestrator.k:42:56
    p0_val <= data_in_38[31:16];	// layer_orchestrator.k:42:56
    if (rst)	// layer_orchestrator.k:42:56
      p0_stage1_enable <= 1'h0;	// layer_orchestrator.k:42:56
    else	// layer_orchestrator.k:42:56
      p0_stage1_enable <= _GEN_0;	// layer_orchestrator.k:42:56
    p0_val_0 <= p0_val;	// layer_orchestrator.k:42:56
    p0_idx_0 <= p0_idx;	// layer_orchestrator.k:42:56
    if (rst)	// layer_orchestrator.k:42:56
      p0_stage2_enable <= 1'h0;	// layer_orchestrator.k:42:56
    else	// layer_orchestrator.k:42:56
      p0_stage2_enable <= p0_stage1_enable;	// layer_orchestrator.k:42:56
  end // always @(posedge)
  always_comb begin	// layer_orchestrator.k:42:56
    context_saver_caller_wren_1_0 = p0_stage2_enable;	// layer_orchestrator.k:42:56
    context_saver_caller_loop_count_1_0 = 1'h1;	// layer_orchestrator.k:42:56
    fifo_wren_0_0 = p0_stage2_enable;	// layer_orchestrator.k:42:56
    fifo_data_out_0_0 = {1'h0, p0_val_0, p0_idx_0};	// layer_orchestrator.k:42:56
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// layer_orchestrator.k:42:56
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// layer_orchestrator.k:42:56
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  layer_orchestratorDebugView_prog_gamma_pre_attnEntry layer_orchestratorDebugView_prog_gamma_pre_attnEntry_instance (	// layer_orchestrator.k:42:56
    .clk       (clk),	// layer_orchestrator.k:42:56
    ._idx      (p0_stage1_enable ? p0_idx : 'x),	// layer_orchestrator.k:42:56
    ._val      (p0_stage1_enable ? p0_val : 'x),	// layer_orchestrator.k:42:56
    .valid     (p0_stage1_enable),	// layer_orchestrator.k:42:56
    .valid_out (/* unused */)
  );	// layer_orchestrator.k:42:56
  assign done_out = p0_stage2_enable;	// layer_orchestrator.k:42:56
  assign incr_semaphore_thread_count_4_out = incr_semaphore_thread_count_4_out_0;	// layer_orchestrator.k:42:56
  assign fifo_data_out_0 = fifo_data_out_0_0;	// layer_orchestrator.k:42:56
  assign fifo_wren_0 = fifo_wren_0_0;	// layer_orchestrator.k:42:56
  assign context_saver_caller_wren_1 = context_saver_caller_wren_1_0;	// layer_orchestrator.k:42:56
  assign context_saver_caller_loop_count_1 = context_saver_caller_loop_count_1_0;	// layer_orchestrator.k:42:56
  assign input_rdy_0 = input_rdy_0_0;	// layer_orchestrator.k:42:56
  assign control_state_out = control_state_out_0;	// layer_orchestrator.k:42:56
endmodule

module layer_orchestrator_read_sin_forwarded_BasicBlock_1(	// layer_orchestrator.k:36:58
  input  wire         clk,
  input  wire         rst,
  output wire         done_out,
  output wire         decr_semaphore_thread_count_3_out,
  output wire [255:0] fifo_data_out_0,
  output wire         fifo_wren_0,
  input  wire         fifo_almost_full_in_raw_0,
  input  wire         fifo_overflow_in_0,
  input  wire [255:0] data_in_37,
  input  wire         input_fifo_underflow_0,
  output wire         input_rdy_0,
  input  wire         input_valid_0,
  output wire [7:0]   control_state_out
);

  wire          _fifo_overflow_ffc_0_data_out;
  wire          _fifo_almostfull_ffc_0_data_out;
  logic         done_out_0;	// layer_orchestrator.k:36:58
  logic         decr_semaphore_thread_count_3_out_0;	// layer_orchestrator.k:36:58
  logic [255:0] fifo_data_out_0_0;	// layer_orchestrator.k:36:58
  logic         fifo_wren_0_0;	// layer_orchestrator.k:36:58
  logic         input_rdy_0_0;	// layer_orchestrator.k:36:58
  logic [7:0]   control_state_out_0;	// layer_orchestrator.k:36:58
  wire          _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// layer_orchestrator.k:36:58
  always_comb begin	// layer_orchestrator.k:36:58
    input_rdy_0_0 = _GEN;	// layer_orchestrator.k:36:58
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// layer_orchestrator.k:36:58
  end // always_comb
  reg   [255:0] p0_data_in_37;	// layer_orchestrator.k:36:58
  reg           p0_stage1_enable = 1'h0;	// layer_orchestrator.k:36:58
  reg   [255:0] p0_data_in_37_0;	// layer_orchestrator.k:36:58
  reg           p0_stage2_enable = 1'h0;	// layer_orchestrator.k:36:58
  always @(posedge clk) begin	// layer_orchestrator.k:36:58
    p0_data_in_37 <= data_in_37;	// layer_orchestrator.k:36:58
    if (rst)	// layer_orchestrator.k:36:58
      p0_stage1_enable <= 1'h0;	// layer_orchestrator.k:36:58
    else	// layer_orchestrator.k:36:58
      p0_stage1_enable <= _GEN & input_valid_0;	// layer_orchestrator.k:36:58
    p0_data_in_37_0 <= p0_data_in_37;	// layer_orchestrator.k:36:58
    if (rst)	// layer_orchestrator.k:36:58
      p0_stage2_enable <= 1'h0;	// layer_orchestrator.k:36:58
    else	// layer_orchestrator.k:36:58
      p0_stage2_enable <= p0_stage1_enable;	// layer_orchestrator.k:36:58
  end // always @(posedge)
  always_comb begin	// layer_orchestrator.k:36:58
    fifo_wren_0_0 = p0_stage2_enable;	// layer_orchestrator.k:36:{5,58}
    fifo_data_out_0_0 = p0_data_in_37_0;	// layer_orchestrator.k:36:{5,58}
  end // always_comb
  assign decr_semaphore_thread_count_3_out_0 = p0_stage2_enable;	// layer_orchestrator.k:36:58
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// layer_orchestrator.k:36:58
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// layer_orchestrator.k:36:58
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  layer_orchestratorDebugView_read_sin_forwardedExit layer_orchestratorDebugView_read_sin_forwardedExit_instance (	// layer_orchestrator.k:36:5
    .clk          (clk),	// layer_orchestrator.k:36:5
    ._ReturnValue (p0_stage1_enable ? p0_data_in_37 : 'x),	// layer_orchestrator.k:36:{5,58}
    .valid        (p0_stage1_enable),	// layer_orchestrator.k:36:58
    .valid_out    (/* unused */)
  );	// layer_orchestrator.k:36:5
  assign done_out = p0_stage2_enable;	// layer_orchestrator.k:36:58
  assign decr_semaphore_thread_count_3_out = decr_semaphore_thread_count_3_out_0;	// layer_orchestrator.k:36:58
  assign fifo_data_out_0 = fifo_data_out_0_0;	// layer_orchestrator.k:36:58
  assign fifo_wren_0 = fifo_wren_0_0;	// layer_orchestrator.k:36:58
  assign input_rdy_0 = input_rdy_0_0;	// layer_orchestrator.k:36:58
  assign control_state_out = control_state_out_0;	// layer_orchestrator.k:36:58
endmodule

module layer_orchestrator_read_sin_forwarded_BasicBlock_0(	// layer_orchestrator.k:36:51
  input  wire       clk,
  input  wire       rst,
  output wire       done_out,
  input  wire       semaphore_full_3_in,
  output wire       incr_semaphore_thread_count_3_out,
  output wire [2:0] fifo_data_out_0,
  output wire       fifo_wren_0,
  output wire       context_saver_caller_wren_1,
  output wire       context_saver_caller_loop_count_1,
  input  wire       fifo_almost_full_in_raw_0,
  input  wire       fifo_overflow_in_0,
  input  wire [1:0] data_in_36,
  input  wire       input_fifo_underflow_0,
  output wire       input_rdy_0,
  input  wire       input_valid_0,
  output wire [7:0] control_state_out
);

  wire        _fifo_overflow_ffc_0_data_out;
  wire        _fifo_almostfull_ffc_0_data_out;
  logic       done_out_0;	// layer_orchestrator.k:36:51
  logic       incr_semaphore_thread_count_3_out_0;	// layer_orchestrator.k:36:51
  logic [2:0] fifo_data_out_0_0;	// layer_orchestrator.k:36:51
  logic       fifo_wren_0_0;	// layer_orchestrator.k:36:51
  logic       context_saver_caller_wren_1_0;	// layer_orchestrator.k:36:51
  logic       context_saver_caller_loop_count_1_0;	// layer_orchestrator.k:36:51
  logic       input_rdy_0_0;	// layer_orchestrator.k:36:51
  logic [7:0] control_state_out_0;	// layer_orchestrator.k:36:51
  wire        _GEN = ~rst & _fifo_almostfull_ffc_0_data_out & ~semaphore_full_3_in;	// layer_orchestrator.k:36:51
  wire        _GEN_0 = _GEN & input_valid_0;	// layer_orchestrator.k:36:51
  always_comb begin	// layer_orchestrator.k:36:51
    input_rdy_0_0 = _GEN;	// layer_orchestrator.k:36:51
    incr_semaphore_thread_count_3_out_0 = _GEN_0;	// layer_orchestrator.k:36:51
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       1'h0,
       semaphore_full_3_in,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// layer_orchestrator.k:36:51
  end // always_comb
  reg   [1:0] p0_data_in_36;	// layer_orchestrator.k:36:51
  reg         p0_stage1_enable = 1'h0;	// layer_orchestrator.k:36:51
  reg   [1:0] p0_data_in_36_0;	// layer_orchestrator.k:36:51
  reg         p0_stage2_enable = 1'h0;	// layer_orchestrator.k:36:51
  always @(posedge clk) begin	// layer_orchestrator.k:36:51
    p0_data_in_36 <= data_in_36;	// layer_orchestrator.k:36:51
    if (rst)	// layer_orchestrator.k:36:51
      p0_stage1_enable <= 1'h0;	// layer_orchestrator.k:36:51
    else	// layer_orchestrator.k:36:51
      p0_stage1_enable <= _GEN_0;	// layer_orchestrator.k:36:51
    p0_data_in_36_0 <= p0_data_in_36;	// layer_orchestrator.k:36:51
    if (rst)	// layer_orchestrator.k:36:51
      p0_stage2_enable <= 1'h0;	// layer_orchestrator.k:36:51
    else	// layer_orchestrator.k:36:51
      p0_stage2_enable <= p0_stage1_enable;	// layer_orchestrator.k:36:51
  end // always @(posedge)
  always_comb begin	// layer_orchestrator.k:36:51
    context_saver_caller_wren_1_0 = p0_stage2_enable;	// layer_orchestrator.k:36:{51,58}
    context_saver_caller_loop_count_1_0 = 1'h1;	// layer_orchestrator.k:36:58
    fifo_wren_0_0 = p0_stage2_enable;	// layer_orchestrator.k:36:{51,58}
    fifo_data_out_0_0 = {1'h0, p0_data_in_36_0};	// layer_orchestrator.k:36:{51,58}
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// layer_orchestrator.k:36:51
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// layer_orchestrator.k:36:51
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  layer_orchestratorDebugView_read_sin_forwardedEntry layer_orchestratorDebugView_read_sin_forwardedEntry_instance (	// layer_orchestrator.k:36:5
    .clk       (clk),	// layer_orchestrator.k:36:5
    ._phase    (p0_stage1_enable ? p0_data_in_36 : 'x),	// layer_orchestrator.k:36:{5,51}
    .valid     (p0_stage1_enable),	// layer_orchestrator.k:36:51
    .valid_out (/* unused */)
  );	// layer_orchestrator.k:36:5
  assign done_out = p0_stage2_enable;	// layer_orchestrator.k:36:51
  assign incr_semaphore_thread_count_3_out = incr_semaphore_thread_count_3_out_0;	// layer_orchestrator.k:36:51
  assign fifo_data_out_0 = fifo_data_out_0_0;	// layer_orchestrator.k:36:51
  assign fifo_wren_0 = fifo_wren_0_0;	// layer_orchestrator.k:36:51
  assign context_saver_caller_wren_1 = context_saver_caller_wren_1_0;	// layer_orchestrator.k:36:51
  assign context_saver_caller_loop_count_1 = context_saver_caller_loop_count_1_0;	// layer_orchestrator.k:36:51
  assign input_rdy_0 = input_rdy_0_0;	// layer_orchestrator.k:36:51
  assign control_state_out = control_state_out_0;	// layer_orchestrator.k:36:51
endmodule

module layer_orchestrator_read_cos_forwarded_BasicBlock_1(	// layer_orchestrator.k:35:58
  input  wire         clk,
  input  wire         rst,
  output wire         done_out,
  output wire         decr_semaphore_thread_count_2_out,
  output wire [255:0] fifo_data_out_0,
  output wire         fifo_wren_0,
  input  wire         fifo_almost_full_in_raw_0,
  input  wire         fifo_overflow_in_0,
  input  wire [255:0] data_in_35,
  input  wire         input_fifo_underflow_0,
  output wire         input_rdy_0,
  input  wire         input_valid_0,
  output wire [7:0]   control_state_out
);

  wire          _fifo_overflow_ffc_0_data_out;
  wire          _fifo_almostfull_ffc_0_data_out;
  logic         done_out_0;	// layer_orchestrator.k:35:58
  logic         decr_semaphore_thread_count_2_out_0;	// layer_orchestrator.k:35:58
  logic [255:0] fifo_data_out_0_0;	// layer_orchestrator.k:35:58
  logic         fifo_wren_0_0;	// layer_orchestrator.k:35:58
  logic         input_rdy_0_0;	// layer_orchestrator.k:35:58
  logic [7:0]   control_state_out_0;	// layer_orchestrator.k:35:58
  wire          _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// layer_orchestrator.k:35:58
  always_comb begin	// layer_orchestrator.k:35:58
    input_rdy_0_0 = _GEN;	// layer_orchestrator.k:35:58
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// layer_orchestrator.k:35:58
  end // always_comb
  reg   [255:0] p0_data_in_35;	// layer_orchestrator.k:35:58
  reg           p0_stage1_enable = 1'h0;	// layer_orchestrator.k:35:58
  reg   [255:0] p0_data_in_35_0;	// layer_orchestrator.k:35:58
  reg           p0_stage2_enable = 1'h0;	// layer_orchestrator.k:35:58
  always @(posedge clk) begin	// layer_orchestrator.k:35:58
    p0_data_in_35 <= data_in_35;	// layer_orchestrator.k:35:58
    if (rst)	// layer_orchestrator.k:35:58
      p0_stage1_enable <= 1'h0;	// layer_orchestrator.k:35:58
    else	// layer_orchestrator.k:35:58
      p0_stage1_enable <= _GEN & input_valid_0;	// layer_orchestrator.k:35:58
    p0_data_in_35_0 <= p0_data_in_35;	// layer_orchestrator.k:35:58
    if (rst)	// layer_orchestrator.k:35:58
      p0_stage2_enable <= 1'h0;	// layer_orchestrator.k:35:58
    else	// layer_orchestrator.k:35:58
      p0_stage2_enable <= p0_stage1_enable;	// layer_orchestrator.k:35:58
  end // always @(posedge)
  always_comb begin	// layer_orchestrator.k:35:58
    fifo_wren_0_0 = p0_stage2_enable;	// layer_orchestrator.k:35:{5,58}
    fifo_data_out_0_0 = p0_data_in_35_0;	// layer_orchestrator.k:35:{5,58}
  end // always_comb
  assign decr_semaphore_thread_count_2_out_0 = p0_stage2_enable;	// layer_orchestrator.k:35:58
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// layer_orchestrator.k:35:58
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// layer_orchestrator.k:35:58
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  layer_orchestratorDebugView_read_cos_forwardedExit layer_orchestratorDebugView_read_cos_forwardedExit_instance (	// layer_orchestrator.k:35:5
    .clk          (clk),	// layer_orchestrator.k:35:5
    ._ReturnValue (p0_stage1_enable ? p0_data_in_35 : 'x),	// layer_orchestrator.k:35:{5,58}
    .valid        (p0_stage1_enable),	// layer_orchestrator.k:35:58
    .valid_out    (/* unused */)
  );	// layer_orchestrator.k:35:5
  assign done_out = p0_stage2_enable;	// layer_orchestrator.k:35:58
  assign decr_semaphore_thread_count_2_out = decr_semaphore_thread_count_2_out_0;	// layer_orchestrator.k:35:58
  assign fifo_data_out_0 = fifo_data_out_0_0;	// layer_orchestrator.k:35:58
  assign fifo_wren_0 = fifo_wren_0_0;	// layer_orchestrator.k:35:58
  assign input_rdy_0 = input_rdy_0_0;	// layer_orchestrator.k:35:58
  assign control_state_out = control_state_out_0;	// layer_orchestrator.k:35:58
endmodule

module layer_orchestrator_read_cos_forwarded_BasicBlock_0(	// layer_orchestrator.k:35:51
  input  wire       clk,
  input  wire       rst,
  output wire       done_out,
  input  wire       semaphore_full_2_in,
  output wire       incr_semaphore_thread_count_2_out,
  output wire [2:0] fifo_data_out_0,
  output wire       fifo_wren_0,
  output wire       context_saver_caller_wren_1,
  output wire       context_saver_caller_loop_count_1,
  input  wire       fifo_almost_full_in_raw_0,
  input  wire       fifo_overflow_in_0,
  input  wire [1:0] data_in_34,
  input  wire       input_fifo_underflow_0,
  output wire       input_rdy_0,
  input  wire       input_valid_0,
  output wire [7:0] control_state_out
);

  wire        _fifo_overflow_ffc_0_data_out;
  wire        _fifo_almostfull_ffc_0_data_out;
  logic       done_out_0;	// layer_orchestrator.k:35:51
  logic       incr_semaphore_thread_count_2_out_0;	// layer_orchestrator.k:35:51
  logic [2:0] fifo_data_out_0_0;	// layer_orchestrator.k:35:51
  logic       fifo_wren_0_0;	// layer_orchestrator.k:35:51
  logic       context_saver_caller_wren_1_0;	// layer_orchestrator.k:35:51
  logic       context_saver_caller_loop_count_1_0;	// layer_orchestrator.k:35:51
  logic       input_rdy_0_0;	// layer_orchestrator.k:35:51
  logic [7:0] control_state_out_0;	// layer_orchestrator.k:35:51
  wire        _GEN = ~rst & _fifo_almostfull_ffc_0_data_out & ~semaphore_full_2_in;	// layer_orchestrator.k:35:51
  wire        _GEN_0 = _GEN & input_valid_0;	// layer_orchestrator.k:35:51
  always_comb begin	// layer_orchestrator.k:35:51
    input_rdy_0_0 = _GEN;	// layer_orchestrator.k:35:51
    incr_semaphore_thread_count_2_out_0 = _GEN_0;	// layer_orchestrator.k:35:51
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       1'h0,
       semaphore_full_2_in,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// layer_orchestrator.k:35:51
  end // always_comb
  reg   [1:0] p0_data_in_34;	// layer_orchestrator.k:35:51
  reg         p0_stage1_enable = 1'h0;	// layer_orchestrator.k:35:51
  reg   [1:0] p0_data_in_34_0;	// layer_orchestrator.k:35:51
  reg         p0_stage2_enable = 1'h0;	// layer_orchestrator.k:35:51
  always @(posedge clk) begin	// layer_orchestrator.k:35:51
    p0_data_in_34 <= data_in_34;	// layer_orchestrator.k:35:51
    if (rst)	// layer_orchestrator.k:35:51
      p0_stage1_enable <= 1'h0;	// layer_orchestrator.k:35:51
    else	// layer_orchestrator.k:35:51
      p0_stage1_enable <= _GEN_0;	// layer_orchestrator.k:35:51
    p0_data_in_34_0 <= p0_data_in_34;	// layer_orchestrator.k:35:51
    if (rst)	// layer_orchestrator.k:35:51
      p0_stage2_enable <= 1'h0;	// layer_orchestrator.k:35:51
    else	// layer_orchestrator.k:35:51
      p0_stage2_enable <= p0_stage1_enable;	// layer_orchestrator.k:35:51
  end // always @(posedge)
  always_comb begin	// layer_orchestrator.k:35:51
    context_saver_caller_wren_1_0 = p0_stage2_enable;	// layer_orchestrator.k:35:{51,58}
    context_saver_caller_loop_count_1_0 = 1'h1;	// layer_orchestrator.k:35:58
    fifo_wren_0_0 = p0_stage2_enable;	// layer_orchestrator.k:35:{51,58}
    fifo_data_out_0_0 = {1'h0, p0_data_in_34_0};	// layer_orchestrator.k:35:{51,58}
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// layer_orchestrator.k:35:51
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// layer_orchestrator.k:35:51
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  layer_orchestratorDebugView_read_cos_forwardedEntry layer_orchestratorDebugView_read_cos_forwardedEntry_instance (	// layer_orchestrator.k:35:5
    .clk       (clk),	// layer_orchestrator.k:35:5
    ._phase    (p0_stage1_enable ? p0_data_in_34 : 'x),	// layer_orchestrator.k:35:{5,51}
    .valid     (p0_stage1_enable),	// layer_orchestrator.k:35:51
    .valid_out (/* unused */)
  );	// layer_orchestrator.k:35:5
  assign done_out = p0_stage2_enable;	// layer_orchestrator.k:35:51
  assign incr_semaphore_thread_count_2_out = incr_semaphore_thread_count_2_out_0;	// layer_orchestrator.k:35:51
  assign fifo_data_out_0 = fifo_data_out_0_0;	// layer_orchestrator.k:35:51
  assign fifo_wren_0 = fifo_wren_0_0;	// layer_orchestrator.k:35:51
  assign context_saver_caller_wren_1 = context_saver_caller_wren_1_0;	// layer_orchestrator.k:35:51
  assign context_saver_caller_loop_count_1 = context_saver_caller_loop_count_1_0;	// layer_orchestrator.k:35:51
  assign input_rdy_0 = input_rdy_0_0;	// layer_orchestrator.k:35:51
  assign control_state_out = control_state_out_0;	// layer_orchestrator.k:35:51
endmodule

module layer_orchestrator_forward_sin_BasicBlock_1(	// layer_orchestrator.k:34:51
  input  wire       clk,
  input  wire       rst,
  output wire       done_out,
  output wire       decr_semaphore_thread_count_1_out,
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
  logic       done_out_0;	// layer_orchestrator.k:34:51
  logic       decr_semaphore_thread_count_1_out_0;	// layer_orchestrator.k:34:51
  logic       fifo_wren_0_0;	// layer_orchestrator.k:34:51
  logic       input_rdy_0_0;	// layer_orchestrator.k:34:51
  logic [7:0] control_state_out_0;	// layer_orchestrator.k:34:51
  wire        _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// layer_orchestrator.k:34:51
  always_comb begin	// layer_orchestrator.k:34:51
    input_rdy_0_0 = _GEN;	// layer_orchestrator.k:34:51
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// layer_orchestrator.k:34:51
  end // always_comb
  reg         p0_stage1_enable = 1'h0;	// layer_orchestrator.k:34:51
  reg         p0_stage2_enable = 1'h0;	// layer_orchestrator.k:34:51
  always @(posedge clk) begin	// layer_orchestrator.k:34:51
    if (rst) begin	// layer_orchestrator.k:34:51
      p0_stage1_enable <= 1'h0;	// layer_orchestrator.k:34:51
      p0_stage2_enable <= 1'h0;	// layer_orchestrator.k:34:51
    end
    else begin	// layer_orchestrator.k:34:51
      p0_stage1_enable <= _GEN & input_valid_0;	// layer_orchestrator.k:34:51
      p0_stage2_enable <= p0_stage1_enable;	// layer_orchestrator.k:34:51
    end
  end // always @(posedge)
  always_comb	// layer_orchestrator.k:34:51
    fifo_wren_0_0 = p0_stage2_enable;	// layer_orchestrator.k:34:51
  assign decr_semaphore_thread_count_1_out_0 = p0_stage2_enable;	// layer_orchestrator.k:34:51
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// layer_orchestrator.k:34:51
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// layer_orchestrator.k:34:51
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  assign done_out = p0_stage2_enable;	// layer_orchestrator.k:34:51
  assign decr_semaphore_thread_count_1_out = decr_semaphore_thread_count_1_out_0;	// layer_orchestrator.k:34:51
  assign fifo_wren_0 = fifo_wren_0_0;	// layer_orchestrator.k:34:51
  assign input_rdy_0 = input_rdy_0_0;	// layer_orchestrator.k:34:51
  assign control_state_out = control_state_out_0;	// layer_orchestrator.k:34:51
endmodule

module layer_orchestrator_forward_sin_BasicBlock_0(	// layer_orchestrator.k:34:51
  input  wire         clk,
  input  wire         rst,
  output wire         done_out,
  input  wire         semaphore_full_1_in,
  output wire         incr_semaphore_thread_count_1_out,
  output wire [258:0] fifo_data_out_0,
  output wire         fifo_wren_0,
  output wire         context_saver_caller_wren_1,
  output wire         context_saver_caller_loop_count_1,
  input  wire         fifo_almost_full_in_raw_0,
  input  wire         fifo_overflow_in_0,
  input  wire [257:0] data_in_32,
  input  wire         input_fifo_underflow_0,
  output wire         input_rdy_0,
  input  wire         input_valid_0,
  output wire [7:0]   control_state_out
);

  wire          _fifo_overflow_ffc_0_data_out;
  wire          _fifo_almostfull_ffc_0_data_out;
  logic         done_out_0;	// layer_orchestrator.k:34:51
  logic         incr_semaphore_thread_count_1_out_0;	// layer_orchestrator.k:34:51
  logic [258:0] fifo_data_out_0_0;	// layer_orchestrator.k:34:51
  logic         fifo_wren_0_0;	// layer_orchestrator.k:34:51
  logic         context_saver_caller_wren_1_0;	// layer_orchestrator.k:34:51
  logic         context_saver_caller_loop_count_1_0;	// layer_orchestrator.k:34:51
  logic         input_rdy_0_0;	// layer_orchestrator.k:34:51
  logic [7:0]   control_state_out_0;	// layer_orchestrator.k:34:51
  wire          _GEN = ~rst & _fifo_almostfull_ffc_0_data_out & ~semaphore_full_1_in;	// layer_orchestrator.k:34:51
  wire          _GEN_0 = _GEN & input_valid_0;	// layer_orchestrator.k:34:51
  always_comb begin	// layer_orchestrator.k:34:51
    input_rdy_0_0 = _GEN;	// layer_orchestrator.k:34:51
    incr_semaphore_thread_count_1_out_0 = _GEN_0;	// layer_orchestrator.k:34:51
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       1'h0,
       semaphore_full_1_in,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// layer_orchestrator.k:34:51
  end // always_comb
  reg   [1:0]   p0_phase;	// layer_orchestrator.k:34:51
  reg   [255:0] p0_v;	// layer_orchestrator.k:34:51
  reg           p0_stage1_enable = 1'h0;	// layer_orchestrator.k:34:51
  reg   [255:0] p0_v_0;	// layer_orchestrator.k:34:51
  reg   [1:0]   p0_phase_0;	// layer_orchestrator.k:34:51
  reg           p0_stage2_enable = 1'h0;	// layer_orchestrator.k:34:51
  always @(posedge clk) begin	// layer_orchestrator.k:34:51
    p0_phase <= data_in_32[1:0];	// layer_orchestrator.k:34:51
    p0_v <= data_in_32[257:2];	// layer_orchestrator.k:34:51
    if (rst)	// layer_orchestrator.k:34:51
      p0_stage1_enable <= 1'h0;	// layer_orchestrator.k:34:51
    else	// layer_orchestrator.k:34:51
      p0_stage1_enable <= _GEN_0;	// layer_orchestrator.k:34:51
    p0_v_0 <= p0_v;	// layer_orchestrator.k:34:51
    p0_phase_0 <= p0_phase;	// layer_orchestrator.k:34:51
    if (rst)	// layer_orchestrator.k:34:51
      p0_stage2_enable <= 1'h0;	// layer_orchestrator.k:34:51
    else	// layer_orchestrator.k:34:51
      p0_stage2_enable <= p0_stage1_enable;	// layer_orchestrator.k:34:51
  end // always @(posedge)
  always_comb begin	// layer_orchestrator.k:34:51
    context_saver_caller_wren_1_0 = p0_stage2_enable;	// layer_orchestrator.k:34:51
    context_saver_caller_loop_count_1_0 = 1'h1;	// layer_orchestrator.k:34:51
    fifo_wren_0_0 = p0_stage2_enable;	// layer_orchestrator.k:34:51
    fifo_data_out_0_0 = {1'h0, p0_v_0, p0_phase_0};	// layer_orchestrator.k:34:51
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// layer_orchestrator.k:34:51
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// layer_orchestrator.k:34:51
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  layer_orchestratorDebugView_forward_sinEntry layer_orchestratorDebugView_forward_sinEntry_instance (	// layer_orchestrator.k:34:51
    .clk       (clk),	// layer_orchestrator.k:34:51
    ._phase    (p0_stage1_enable ? p0_phase : 'x),	// layer_orchestrator.k:34:51
    ._v        (p0_stage1_enable ? p0_v : 'x),	// layer_orchestrator.k:34:51
    .valid     (p0_stage1_enable),	// layer_orchestrator.k:34:51
    .valid_out (/* unused */)
  );	// layer_orchestrator.k:34:51
  assign done_out = p0_stage2_enable;	// layer_orchestrator.k:34:51
  assign incr_semaphore_thread_count_1_out = incr_semaphore_thread_count_1_out_0;	// layer_orchestrator.k:34:51
  assign fifo_data_out_0 = fifo_data_out_0_0;	// layer_orchestrator.k:34:51
  assign fifo_wren_0 = fifo_wren_0_0;	// layer_orchestrator.k:34:51
  assign context_saver_caller_wren_1 = context_saver_caller_wren_1_0;	// layer_orchestrator.k:34:51
  assign context_saver_caller_loop_count_1 = context_saver_caller_loop_count_1_0;	// layer_orchestrator.k:34:51
  assign input_rdy_0 = input_rdy_0_0;	// layer_orchestrator.k:34:51
  assign control_state_out = control_state_out_0;	// layer_orchestrator.k:34:51
endmodule

module layer_orchestrator_forward_cos_BasicBlock_1(	// layer_orchestrator.k:33:51
  input  wire       clk,
  input  wire       rst,
  output wire       done_out,
  output wire       decr_semaphore_thread_count_0_out,
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
  logic       done_out_0;	// layer_orchestrator.k:33:51
  logic       decr_semaphore_thread_count_0_out_0;	// layer_orchestrator.k:33:51
  logic       fifo_wren_0_0;	// layer_orchestrator.k:33:51
  logic       input_rdy_0_0;	// layer_orchestrator.k:33:51
  logic [7:0] control_state_out_0;	// layer_orchestrator.k:33:51
  wire        _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// layer_orchestrator.k:33:51
  always_comb begin	// layer_orchestrator.k:33:51
    input_rdy_0_0 = _GEN;	// layer_orchestrator.k:33:51
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// layer_orchestrator.k:33:51
  end // always_comb
  reg         p0_stage1_enable = 1'h0;	// layer_orchestrator.k:33:51
  reg         p0_stage2_enable = 1'h0;	// layer_orchestrator.k:33:51
  always @(posedge clk) begin	// layer_orchestrator.k:33:51
    if (rst) begin	// layer_orchestrator.k:33:51
      p0_stage1_enable <= 1'h0;	// layer_orchestrator.k:33:51
      p0_stage2_enable <= 1'h0;	// layer_orchestrator.k:33:51
    end
    else begin	// layer_orchestrator.k:33:51
      p0_stage1_enable <= _GEN & input_valid_0;	// layer_orchestrator.k:33:51
      p0_stage2_enable <= p0_stage1_enable;	// layer_orchestrator.k:33:51
    end
  end // always @(posedge)
  always_comb	// layer_orchestrator.k:33:51
    fifo_wren_0_0 = p0_stage2_enable;	// layer_orchestrator.k:33:51
  assign decr_semaphore_thread_count_0_out_0 = p0_stage2_enable;	// layer_orchestrator.k:33:51
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// layer_orchestrator.k:33:51
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// layer_orchestrator.k:33:51
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  assign done_out = p0_stage2_enable;	// layer_orchestrator.k:33:51
  assign decr_semaphore_thread_count_0_out = decr_semaphore_thread_count_0_out_0;	// layer_orchestrator.k:33:51
  assign fifo_wren_0 = fifo_wren_0_0;	// layer_orchestrator.k:33:51
  assign input_rdy_0 = input_rdy_0_0;	// layer_orchestrator.k:33:51
  assign control_state_out = control_state_out_0;	// layer_orchestrator.k:33:51
endmodule

module layer_orchestrator_forward_cos_BasicBlock_0(	// layer_orchestrator.k:33:51
  input  wire         clk,
  input  wire         rst,
  output wire         done_out,
  input  wire         semaphore_full_0_in,
  output wire         incr_semaphore_thread_count_0_out,
  output wire [258:0] fifo_data_out_0,
  output wire         fifo_wren_0,
  output wire         context_saver_caller_wren_1,
  output wire         context_saver_caller_loop_count_1,
  input  wire         fifo_almost_full_in_raw_0,
  input  wire         fifo_overflow_in_0,
  input  wire [257:0] data_in_30,
  input  wire         input_fifo_underflow_0,
  output wire         input_rdy_0,
  input  wire         input_valid_0,
  output wire [7:0]   control_state_out
);

  wire          _fifo_overflow_ffc_0_data_out;
  wire          _fifo_almostfull_ffc_0_data_out;
  logic         done_out_0;	// layer_orchestrator.k:33:51
  logic         incr_semaphore_thread_count_0_out_0;	// layer_orchestrator.k:33:51
  logic [258:0] fifo_data_out_0_0;	// layer_orchestrator.k:33:51
  logic         fifo_wren_0_0;	// layer_orchestrator.k:33:51
  logic         context_saver_caller_wren_1_0;	// layer_orchestrator.k:33:51
  logic         context_saver_caller_loop_count_1_0;	// layer_orchestrator.k:33:51
  logic         input_rdy_0_0;	// layer_orchestrator.k:33:51
  logic [7:0]   control_state_out_0;	// layer_orchestrator.k:33:51
  wire          _GEN = ~rst & _fifo_almostfull_ffc_0_data_out & ~semaphore_full_0_in;	// layer_orchestrator.k:33:51
  wire          _GEN_0 = _GEN & input_valid_0;	// layer_orchestrator.k:33:51
  always_comb begin	// layer_orchestrator.k:33:51
    input_rdy_0_0 = _GEN;	// layer_orchestrator.k:33:51
    incr_semaphore_thread_count_0_out_0 = _GEN_0;	// layer_orchestrator.k:33:51
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       1'h0,
       semaphore_full_0_in,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// layer_orchestrator.k:33:51
  end // always_comb
  reg   [1:0]   p0_phase;	// layer_orchestrator.k:33:51
  reg   [255:0] p0_v;	// layer_orchestrator.k:33:51
  reg           p0_stage1_enable = 1'h0;	// layer_orchestrator.k:33:51
  reg   [255:0] p0_v_0;	// layer_orchestrator.k:33:51
  reg   [1:0]   p0_phase_0;	// layer_orchestrator.k:33:51
  reg           p0_stage2_enable = 1'h0;	// layer_orchestrator.k:33:51
  always @(posedge clk) begin	// layer_orchestrator.k:33:51
    p0_phase <= data_in_30[1:0];	// layer_orchestrator.k:33:51
    p0_v <= data_in_30[257:2];	// layer_orchestrator.k:33:51
    if (rst)	// layer_orchestrator.k:33:51
      p0_stage1_enable <= 1'h0;	// layer_orchestrator.k:33:51
    else	// layer_orchestrator.k:33:51
      p0_stage1_enable <= _GEN_0;	// layer_orchestrator.k:33:51
    p0_v_0 <= p0_v;	// layer_orchestrator.k:33:51
    p0_phase_0 <= p0_phase;	// layer_orchestrator.k:33:51
    if (rst)	// layer_orchestrator.k:33:51
      p0_stage2_enable <= 1'h0;	// layer_orchestrator.k:33:51
    else	// layer_orchestrator.k:33:51
      p0_stage2_enable <= p0_stage1_enable;	// layer_orchestrator.k:33:51
  end // always @(posedge)
  always_comb begin	// layer_orchestrator.k:33:51
    context_saver_caller_wren_1_0 = p0_stage2_enable;	// layer_orchestrator.k:33:51
    context_saver_caller_loop_count_1_0 = 1'h1;	// layer_orchestrator.k:33:51
    fifo_wren_0_0 = p0_stage2_enable;	// layer_orchestrator.k:33:51
    fifo_data_out_0_0 = {1'h0, p0_v_0, p0_phase_0};	// layer_orchestrator.k:33:51
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// layer_orchestrator.k:33:51
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// layer_orchestrator.k:33:51
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  layer_orchestratorDebugView_forward_cosEntry layer_orchestratorDebugView_forward_cosEntry_instance (	// layer_orchestrator.k:33:51
    .clk       (clk),	// layer_orchestrator.k:33:51
    ._phase    (p0_stage1_enable ? p0_phase : 'x),	// layer_orchestrator.k:33:51
    ._v        (p0_stage1_enable ? p0_v : 'x),	// layer_orchestrator.k:33:51
    .valid     (p0_stage1_enable),	// layer_orchestrator.k:33:51
    .valid_out (/* unused */)
  );	// layer_orchestrator.k:33:51
  assign done_out = p0_stage2_enable;	// layer_orchestrator.k:33:51
  assign incr_semaphore_thread_count_0_out = incr_semaphore_thread_count_0_out_0;	// layer_orchestrator.k:33:51
  assign fifo_data_out_0 = fifo_data_out_0_0;	// layer_orchestrator.k:33:51
  assign fifo_wren_0 = fifo_wren_0_0;	// layer_orchestrator.k:33:51
  assign context_saver_caller_wren_1 = context_saver_caller_wren_1_0;	// layer_orchestrator.k:33:51
  assign context_saver_caller_loop_count_1 = context_saver_caller_loop_count_1_0;	// layer_orchestrator.k:33:51
  assign input_rdy_0 = input_rdy_0_0;	// layer_orchestrator.k:33:51
  assign control_state_out = control_state_out_0;	// layer_orchestrator.k:33:51
endmodule

module layer_orchestrator(
  input  wire         clk,
  input  wire         rst,
  input  wire         forward_cos_valid_in,
  input  wire [1:0]   forward_cos_phase_in,
  input  wire [255:0] forward_cos_v_in,
  input  wire         forward_cos_rden_in,
  input  wire         forward_sin_valid_in,
  input  wire [1:0]   forward_sin_phase_in,
  input  wire [255:0] forward_sin_v_in,
  input  wire         forward_sin_rden_in,
  input  wire         read_cos_forwarded_valid_in,
  input  wire [1:0]   read_cos_forwarded_phase_in,
  input  wire         read_cos_forwarded_rden_in,
  input  wire         read_sin_forwarded_valid_in,
  input  wire [1:0]   read_sin_forwarded_phase_in,
  input  wire         read_sin_forwarded_rden_in,
  input  wire         prog_gamma_pre_attn_valid_in,
  input  wire [15:0]  prog_gamma_pre_attn_idx_in,
  input  wire [15:0]  prog_gamma_pre_attn_val_in,
  input  wire         prog_gamma_pre_attn_rden_in,
  input  wire         prog_gamma_pre_mlp_valid_in,
  input  wire [15:0]  prog_gamma_pre_mlp_idx_in,
  input  wire [15:0]  prog_gamma_pre_mlp_val_in,
  input  wire         prog_gamma_pre_mlp_rden_in,
  input  wire         prog_rsqrt_lut_valid_in,
  input  wire [7:0]   prog_rsqrt_lut_idx_in,
  input  wire [15:0]  prog_rsqrt_lut_val_in,
  input  wire         prog_rsqrt_lut_rden_in,
  input  wire         prog_sigmoid_lut_valid_in,
  input  wire [7:0]   prog_sigmoid_lut_idx_in,
  input  wire [15:0]  prog_sigmoid_lut_val_in,
  input  wire         prog_sigmoid_lut_rden_in,
  input  wire         rmsnorm_reset_valid_in,
  input  wire         rmsnorm_reset_rden_in,
  input  wire         rmsnorm_get_sum_valid_in,
  input  wire         rmsnorm_get_sum_rden_in,
  input  wire         rmsnorm_step_valid_in,
  input  wire [15:0]  rmsnorm_step_x_bf16_in,
  input  wire         rmsnorm_step_rden_in,
  input  wire         swiglu_step_valid_in,
  input  wire [15:0]  swiglu_step_gate_bf16_in,
  input  wire [15:0]  swiglu_step_up_bf16_in,
  input  wire         swiglu_step_rden_in,
  input  wire         residual_add_step_valid_in,
  input  wire [15:0]  residual_add_step_a_bf16_in,
  input  wire [15:0]  residual_add_step_b_bf16_in,
  input  wire         residual_add_step_rden_in,
  input  wire         rotate_even_valid_in,
  input  wire [15:0]  rotate_even_x_even_in,
  input  wire [15:0]  rotate_even_x_odd_in,
  input  wire [15:0]  rotate_even_cos_val_in,
  input  wire [15:0]  rotate_even_sin_val_in,
  input  wire         rotate_even_rden_in,
  input  wire         rotate_odd_valid_in,
  input  wire [15:0]  rotate_odd_x_even_in,
  input  wire [15:0]  rotate_odd_x_odd_in,
  input  wire [15:0]  rotate_odd_cos_val_in,
  input  wire [15:0]  rotate_odd_sin_val_in,
  input  wire         rotate_odd_rden_in,
  input  wire [2:0]   stall_rate_in,
  input  wire         stall_rate_valid_in,
  output wire         rst_and_startup_done_out,
  output wire         forward_cos_rdy_out,
  output wire         forward_cos_empty_out,
  output wire         forward_sin_rdy_out,
  output wire         forward_sin_empty_out,
  output wire         read_cos_forwarded_rdy_out,
  output wire         read_cos_forwarded_empty_out,
  output wire [255:0] read_cos_forwarded_result_out,
  output wire         read_sin_forwarded_rdy_out,
  output wire         read_sin_forwarded_empty_out,
  output wire [255:0] read_sin_forwarded_result_out,
  output wire         prog_gamma_pre_attn_rdy_out,
  output wire         prog_gamma_pre_attn_empty_out,
  output wire         prog_gamma_pre_mlp_rdy_out,
  output wire         prog_gamma_pre_mlp_empty_out,
  output wire         prog_rsqrt_lut_rdy_out,
  output wire         prog_rsqrt_lut_empty_out,
  output wire         prog_sigmoid_lut_rdy_out,
  output wire         prog_sigmoid_lut_empty_out,
  output wire         rmsnorm_reset_rdy_out,
  output wire         rmsnorm_reset_empty_out,
  output wire         rmsnorm_get_sum_rdy_out,
  output wire         rmsnorm_get_sum_empty_out,
  output wire [31:0]  rmsnorm_get_sum_result_out,
  output wire         rmsnorm_step_rdy_out,
  output wire         rmsnorm_step_empty_out,
  output wire         swiglu_step_rdy_out,
  output wire         swiglu_step_empty_out,
  output wire [15:0]  swiglu_step_result_out,
  output wire         residual_add_step_rdy_out,
  output wire         residual_add_step_empty_out,
  output wire [15:0]  residual_add_step_result_out,
  output wire         rotate_even_rdy_out,
  output wire         rotate_even_empty_out,
  output wire [15:0]  rotate_even_result_out,
  output wire         rotate_odd_rdy_out,
  output wire         rotate_odd_empty_out,
  output wire [15:0]  rotate_odd_result_out,
  output wire         stall_rate_supported_out
);

  wire         _rotate_odd_BasicBlock_1Impl_decr_semaphore_thread_count_14_out;	// layer_orchestrator.k:79:16
  wire [15:0]  _rotate_odd_BasicBlock_1Impl_fifo_data_out_0;	// layer_orchestrator.k:79:16
  wire         _rotate_odd_BasicBlock_1Impl_fifo_wren_0;	// layer_orchestrator.k:79:16
  wire         _rotate_odd_BasicBlock_1Impl_input_rdy_0;	// layer_orchestrator.k:79:16
  wire         _rotate_odd_BasicBlock_0Impl_incr_semaphore_thread_count_14_out;	// layer_orchestrator.k:79:9
  wire [64:0]  _rotate_odd_BasicBlock_0Impl_fifo_data_out_0;	// layer_orchestrator.k:79:9
  wire         _rotate_odd_BasicBlock_0Impl_fifo_wren_0;	// layer_orchestrator.k:79:9
  wire         _rotate_odd_BasicBlock_0Impl_context_saver_caller_wren_1;	// layer_orchestrator.k:79:9
  wire         _rotate_odd_BasicBlock_0Impl_context_saver_caller_loop_count_1;	// layer_orchestrator.k:79:9
  wire         _rotate_odd_BasicBlock_0Impl_input_rdy_0;	// layer_orchestrator.k:79:9
  wire         _rotate_even_BasicBlock_1Impl_decr_semaphore_thread_count_13_out;	// layer_orchestrator.k:76:16
  wire [15:0]  _rotate_even_BasicBlock_1Impl_fifo_data_out_0;	// layer_orchestrator.k:76:16
  wire         _rotate_even_BasicBlock_1Impl_fifo_wren_0;	// layer_orchestrator.k:76:16
  wire         _rotate_even_BasicBlock_1Impl_input_rdy_0;	// layer_orchestrator.k:76:16
  wire         _rotate_even_BasicBlock_0Impl_incr_semaphore_thread_count_13_out;	// layer_orchestrator.k:76:9
  wire [64:0]  _rotate_even_BasicBlock_0Impl_fifo_data_out_0;	// layer_orchestrator.k:76:9
  wire         _rotate_even_BasicBlock_0Impl_fifo_wren_0;	// layer_orchestrator.k:76:9
  wire         _rotate_even_BasicBlock_0Impl_context_saver_caller_wren_1;	// layer_orchestrator.k:76:9
  wire         _rotate_even_BasicBlock_0Impl_context_saver_caller_loop_count_1;	// layer_orchestrator.k:76:9
  wire         _rotate_even_BasicBlock_0Impl_input_rdy_0;	// layer_orchestrator.k:76:9
  wire         _residual_add_step_BasicBlock_1Impl_decr_semaphore_thread_count_12_out;	// layer_orchestrator.k:71:16
  wire [15:0]  _residual_add_step_BasicBlock_1Impl_fifo_data_out_0;	// layer_orchestrator.k:71:16
  wire         _residual_add_step_BasicBlock_1Impl_fifo_wren_0;	// layer_orchestrator.k:71:16
  wire         _residual_add_step_BasicBlock_1Impl_input_rdy_0;	// layer_orchestrator.k:71:16
  wire         _residual_add_step_BasicBlock_0Impl_incr_semaphore_thread_count_12_out;	// layer_orchestrator.k:71:9
  wire [32:0]  _residual_add_step_BasicBlock_0Impl_fifo_data_out_0;	// layer_orchestrator.k:71:9
  wire         _residual_add_step_BasicBlock_0Impl_fifo_wren_0;	// layer_orchestrator.k:71:9
  wire         _residual_add_step_BasicBlock_0Impl_context_saver_caller_wren_1;	// layer_orchestrator.k:71:9
  wire         _residual_add_step_BasicBlock_0Impl_context_saver_caller_loop_count_1;	// layer_orchestrator.k:71:9
  wire         _residual_add_step_BasicBlock_0Impl_input_rdy_0;	// layer_orchestrator.k:71:9
  wire         _swiglu_step_BasicBlock_1Impl_decr_semaphore_thread_count_11_out;	// layer_orchestrator.k:66:16
  wire [15:0]  _swiglu_step_BasicBlock_1Impl_fifo_data_out_0;	// layer_orchestrator.k:66:16
  wire         _swiglu_step_BasicBlock_1Impl_fifo_wren_0;	// layer_orchestrator.k:66:16
  wire         _swiglu_step_BasicBlock_1Impl_input_rdy_0;	// layer_orchestrator.k:66:16
  wire         _swiglu_step_BasicBlock_0Impl_incr_semaphore_thread_count_11_out;	// layer_orchestrator.k:66:9
  wire [32:0]  _swiglu_step_BasicBlock_0Impl_fifo_data_out_0;	// layer_orchestrator.k:66:9
  wire         _swiglu_step_BasicBlock_0Impl_fifo_wren_0;	// layer_orchestrator.k:66:9
  wire         _swiglu_step_BasicBlock_0Impl_context_saver_caller_wren_1;	// layer_orchestrator.k:66:9
  wire         _swiglu_step_BasicBlock_0Impl_context_saver_caller_loop_count_1;	// layer_orchestrator.k:66:9
  wire         _swiglu_step_BasicBlock_0Impl_input_rdy_0;	// layer_orchestrator.k:66:9
  wire         _rmsnorm_step_BasicBlock_1Impl_decr_semaphore_thread_count_10_out;	// layer_orchestrator.k:62:40
  wire         _rmsnorm_step_BasicBlock_1Impl_fifo_wren_0;	// layer_orchestrator.k:62:40
  wire         _rmsnorm_step_BasicBlock_1Impl_input_rdy_0;	// layer_orchestrator.k:62:40
  wire         _rmsnorm_step_BasicBlock_0Impl_incr_semaphore_thread_count_10_out;	// layer_orchestrator.k:62:40
  wire [16:0]  _rmsnorm_step_BasicBlock_0Impl_fifo_data_out_0;	// layer_orchestrator.k:62:40
  wire         _rmsnorm_step_BasicBlock_0Impl_fifo_wren_0;	// layer_orchestrator.k:62:40
  wire         _rmsnorm_step_BasicBlock_0Impl_context_saver_caller_wren_1;	// layer_orchestrator.k:62:40
  wire         _rmsnorm_step_BasicBlock_0Impl_context_saver_caller_loop_count_1;	// layer_orchestrator.k:62:40
  wire         _rmsnorm_step_BasicBlock_0Impl_input_rdy_0;	// layer_orchestrator.k:62:40
  wire         _rmsnorm_get_sum_BasicBlock_1Impl_decr_semaphore_thread_count_9_out;	// layer_orchestrator.k:57:39
  wire [31:0]  _rmsnorm_get_sum_BasicBlock_1Impl_fifo_data_out_0;	// layer_orchestrator.k:57:39
  wire         _rmsnorm_get_sum_BasicBlock_1Impl_fifo_wren_0;	// layer_orchestrator.k:57:39
  wire         _rmsnorm_get_sum_BasicBlock_1Impl_input_rdy_0;	// layer_orchestrator.k:57:39
  wire         _rmsnorm_get_sum_BasicBlock_0Impl_incr_semaphore_thread_count_9_out;	// layer_orchestrator.k:57:32
  wire         _rmsnorm_get_sum_BasicBlock_0Impl_fifo_data_out_0;	// layer_orchestrator.k:57:32
  wire         _rmsnorm_get_sum_BasicBlock_0Impl_fifo_wren_0;	// layer_orchestrator.k:57:32
  wire         _rmsnorm_get_sum_BasicBlock_0Impl_context_saver_caller_wren_1;	// layer_orchestrator.k:57:32
  wire         _rmsnorm_get_sum_BasicBlock_0Impl_context_saver_caller_loop_count_1;	// layer_orchestrator.k:57:32
  wire         _rmsnorm_get_sum_BasicBlock_0Impl_input_rdy_0;	// layer_orchestrator.k:57:32
  wire         _rmsnorm_reset_BasicBlock_1Impl_decr_semaphore_thread_count_8_out;	// layer_orchestrator.k:56:28
  wire         _rmsnorm_reset_BasicBlock_1Impl_fifo_wren_0;	// layer_orchestrator.k:56:28
  wire         _rmsnorm_reset_BasicBlock_1Impl_input_rdy_0;	// layer_orchestrator.k:56:28
  wire         _rmsnorm_reset_BasicBlock_0Impl_incr_semaphore_thread_count_8_out;	// layer_orchestrator.k:56:28
  wire         _rmsnorm_reset_BasicBlock_0Impl_fifo_data_out_0;	// layer_orchestrator.k:56:28
  wire         _rmsnorm_reset_BasicBlock_0Impl_fifo_wren_0;	// layer_orchestrator.k:56:28
  wire         _rmsnorm_reset_BasicBlock_0Impl_context_saver_caller_wren_1;	// layer_orchestrator.k:56:28
  wire         _rmsnorm_reset_BasicBlock_0Impl_context_saver_caller_loop_count_1;	// layer_orchestrator.k:56:28
  wire         _rmsnorm_reset_BasicBlock_0Impl_input_rdy_0;	// layer_orchestrator.k:56:28
  wire         _prog_sigmoid_lut_BasicBlock_1Impl_decr_semaphore_thread_count_7_out;	// layer_orchestrator.k:45:56
  wire         _prog_sigmoid_lut_BasicBlock_1Impl_fifo_wren_0;	// layer_orchestrator.k:45:56
  wire         _prog_sigmoid_lut_BasicBlock_1Impl_input_rdy_0;	// layer_orchestrator.k:45:56
  wire         _prog_sigmoid_lut_BasicBlock_0Impl_incr_semaphore_thread_count_7_out;	// layer_orchestrator.k:45:56
  wire [24:0]  _prog_sigmoid_lut_BasicBlock_0Impl_fifo_data_out_0;	// layer_orchestrator.k:45:56
  wire         _prog_sigmoid_lut_BasicBlock_0Impl_fifo_wren_0;	// layer_orchestrator.k:45:56
  wire         _prog_sigmoid_lut_BasicBlock_0Impl_context_saver_caller_wren_1;	// layer_orchestrator.k:45:56
  wire         _prog_sigmoid_lut_BasicBlock_0Impl_context_saver_caller_loop_count_1;	// layer_orchestrator.k:45:56
  wire         _prog_sigmoid_lut_BasicBlock_0Impl_input_rdy_0;	// layer_orchestrator.k:45:56
  wire         _prog_rsqrt_lut_BasicBlock_1Impl_decr_semaphore_thread_count_6_out;	// layer_orchestrator.k:44:56
  wire         _prog_rsqrt_lut_BasicBlock_1Impl_fifo_wren_0;	// layer_orchestrator.k:44:56
  wire         _prog_rsqrt_lut_BasicBlock_1Impl_input_rdy_0;	// layer_orchestrator.k:44:56
  wire         _prog_rsqrt_lut_BasicBlock_0Impl_incr_semaphore_thread_count_6_out;	// layer_orchestrator.k:44:56
  wire [24:0]  _prog_rsqrt_lut_BasicBlock_0Impl_fifo_data_out_0;	// layer_orchestrator.k:44:56
  wire         _prog_rsqrt_lut_BasicBlock_0Impl_fifo_wren_0;	// layer_orchestrator.k:44:56
  wire         _prog_rsqrt_lut_BasicBlock_0Impl_context_saver_caller_wren_1;	// layer_orchestrator.k:44:56
  wire         _prog_rsqrt_lut_BasicBlock_0Impl_context_saver_caller_loop_count_1;	// layer_orchestrator.k:44:56
  wire         _prog_rsqrt_lut_BasicBlock_0Impl_input_rdy_0;	// layer_orchestrator.k:44:56
  wire         _prog_gamma_pre_mlp_BasicBlock_1Impl_decr_semaphore_thread_count_5_out;	// layer_orchestrator.k:43:56
  wire         _prog_gamma_pre_mlp_BasicBlock_1Impl_fifo_wren_0;	// layer_orchestrator.k:43:56
  wire         _prog_gamma_pre_mlp_BasicBlock_1Impl_input_rdy_0;	// layer_orchestrator.k:43:56
  wire         _prog_gamma_pre_mlp_BasicBlock_0Impl_incr_semaphore_thread_count_5_out;	// layer_orchestrator.k:43:56
  wire [32:0]  _prog_gamma_pre_mlp_BasicBlock_0Impl_fifo_data_out_0;	// layer_orchestrator.k:43:56
  wire         _prog_gamma_pre_mlp_BasicBlock_0Impl_fifo_wren_0;	// layer_orchestrator.k:43:56
  wire         _prog_gamma_pre_mlp_BasicBlock_0Impl_context_saver_caller_wren_1;	// layer_orchestrator.k:43:56
  wire         _prog_gamma_pre_mlp_BasicBlock_0Impl_context_saver_caller_loop_count_1;	// layer_orchestrator.k:43:56
  wire         _prog_gamma_pre_mlp_BasicBlock_0Impl_input_rdy_0;	// layer_orchestrator.k:43:56
  wire         _prog_gamma_pre_attn_BasicBlock_1Impl_decr_semaphore_thread_count_4_out;	// layer_orchestrator.k:42:56
  wire         _prog_gamma_pre_attn_BasicBlock_1Impl_fifo_wren_0;	// layer_orchestrator.k:42:56
  wire         _prog_gamma_pre_attn_BasicBlock_1Impl_input_rdy_0;	// layer_orchestrator.k:42:56
  wire         _prog_gamma_pre_attn_BasicBlock_0Impl_incr_semaphore_thread_count_4_out;	// layer_orchestrator.k:42:56
  wire [32:0]  _prog_gamma_pre_attn_BasicBlock_0Impl_fifo_data_out_0;	// layer_orchestrator.k:42:56
  wire         _prog_gamma_pre_attn_BasicBlock_0Impl_fifo_wren_0;	// layer_orchestrator.k:42:56
  wire         _prog_gamma_pre_attn_BasicBlock_0Impl_context_saver_caller_wren_1;	// layer_orchestrator.k:42:56
  wire         _prog_gamma_pre_attn_BasicBlock_0Impl_context_saver_caller_loop_count_1;	// layer_orchestrator.k:42:56
  wire         _prog_gamma_pre_attn_BasicBlock_0Impl_input_rdy_0;	// layer_orchestrator.k:42:56
  wire         _read_sin_forwarded_BasicBlock_1Impl_decr_semaphore_thread_count_3_out;	// layer_orchestrator.k:36:58
  wire [255:0] _read_sin_forwarded_BasicBlock_1Impl_fifo_data_out_0;	// layer_orchestrator.k:36:58
  wire         _read_sin_forwarded_BasicBlock_1Impl_fifo_wren_0;	// layer_orchestrator.k:36:58
  wire         _read_sin_forwarded_BasicBlock_1Impl_input_rdy_0;	// layer_orchestrator.k:36:58
  wire         _read_sin_forwarded_BasicBlock_0Impl_incr_semaphore_thread_count_3_out;	// layer_orchestrator.k:36:51
  wire [2:0]   _read_sin_forwarded_BasicBlock_0Impl_fifo_data_out_0;	// layer_orchestrator.k:36:51
  wire         _read_sin_forwarded_BasicBlock_0Impl_fifo_wren_0;	// layer_orchestrator.k:36:51
  wire         _read_sin_forwarded_BasicBlock_0Impl_context_saver_caller_wren_1;	// layer_orchestrator.k:36:51
  wire         _read_sin_forwarded_BasicBlock_0Impl_context_saver_caller_loop_count_1;	// layer_orchestrator.k:36:51
  wire         _read_sin_forwarded_BasicBlock_0Impl_input_rdy_0;	// layer_orchestrator.k:36:51
  wire         _read_cos_forwarded_BasicBlock_1Impl_decr_semaphore_thread_count_2_out;	// layer_orchestrator.k:35:58
  wire [255:0] _read_cos_forwarded_BasicBlock_1Impl_fifo_data_out_0;	// layer_orchestrator.k:35:58
  wire         _read_cos_forwarded_BasicBlock_1Impl_fifo_wren_0;	// layer_orchestrator.k:35:58
  wire         _read_cos_forwarded_BasicBlock_1Impl_input_rdy_0;	// layer_orchestrator.k:35:58
  wire         _read_cos_forwarded_BasicBlock_0Impl_incr_semaphore_thread_count_2_out;	// layer_orchestrator.k:35:51
  wire [2:0]   _read_cos_forwarded_BasicBlock_0Impl_fifo_data_out_0;	// layer_orchestrator.k:35:51
  wire         _read_cos_forwarded_BasicBlock_0Impl_fifo_wren_0;	// layer_orchestrator.k:35:51
  wire         _read_cos_forwarded_BasicBlock_0Impl_context_saver_caller_wren_1;	// layer_orchestrator.k:35:51
  wire         _read_cos_forwarded_BasicBlock_0Impl_context_saver_caller_loop_count_1;	// layer_orchestrator.k:35:51
  wire         _read_cos_forwarded_BasicBlock_0Impl_input_rdy_0;	// layer_orchestrator.k:35:51
  wire         _forward_sin_BasicBlock_1Impl_decr_semaphore_thread_count_1_out;	// layer_orchestrator.k:34:51
  wire         _forward_sin_BasicBlock_1Impl_fifo_wren_0;	// layer_orchestrator.k:34:51
  wire         _forward_sin_BasicBlock_1Impl_input_rdy_0;	// layer_orchestrator.k:34:51
  wire         _forward_sin_BasicBlock_0Impl_incr_semaphore_thread_count_1_out;	// layer_orchestrator.k:34:51
  wire [258:0] _forward_sin_BasicBlock_0Impl_fifo_data_out_0;	// layer_orchestrator.k:34:51
  wire         _forward_sin_BasicBlock_0Impl_fifo_wren_0;	// layer_orchestrator.k:34:51
  wire         _forward_sin_BasicBlock_0Impl_context_saver_caller_wren_1;	// layer_orchestrator.k:34:51
  wire         _forward_sin_BasicBlock_0Impl_context_saver_caller_loop_count_1;	// layer_orchestrator.k:34:51
  wire         _forward_sin_BasicBlock_0Impl_input_rdy_0;	// layer_orchestrator.k:34:51
  wire         _forward_cos_BasicBlock_1Impl_decr_semaphore_thread_count_0_out;	// layer_orchestrator.k:33:51
  wire         _forward_cos_BasicBlock_1Impl_fifo_wren_0;	// layer_orchestrator.k:33:51
  wire         _forward_cos_BasicBlock_1Impl_input_rdy_0;	// layer_orchestrator.k:33:51
  wire         _forward_cos_BasicBlock_0Impl_incr_semaphore_thread_count_0_out;	// layer_orchestrator.k:33:51
  wire [258:0] _forward_cos_BasicBlock_0Impl_fifo_data_out_0;	// layer_orchestrator.k:33:51
  wire         _forward_cos_BasicBlock_0Impl_fifo_wren_0;	// layer_orchestrator.k:33:51
  wire         _forward_cos_BasicBlock_0Impl_context_saver_caller_wren_1;	// layer_orchestrator.k:33:51
  wire         _forward_cos_BasicBlock_0Impl_context_saver_caller_loop_count_1;	// layer_orchestrator.k:33:51
  wire         _forward_cos_BasicBlock_0Impl_input_rdy_0;	// layer_orchestrator.k:33:51
  wire         _context_saver_89_rotate_odd_ContextSaver_caller_almost_full_out;
  wire         _context_saver_89_rotate_odd_ContextSaver_callee_rden_out;
  wire         _context_saver_89_rotate_odd_ContextSaver_valid_out;
  wire [15:0]  _context_saver_89_rotate_odd_ContextSaver_callee_data_out;
  wire         _context_saver_89_rotate_odd_ContextSaver_caller_data_out;
  wire         _context_saver_87_rotate_even_ContextSaver_caller_almost_full_out;
  wire         _context_saver_87_rotate_even_ContextSaver_callee_rden_out;
  wire         _context_saver_87_rotate_even_ContextSaver_valid_out;
  wire [15:0]  _context_saver_87_rotate_even_ContextSaver_callee_data_out;
  wire         _context_saver_87_rotate_even_ContextSaver_caller_data_out;
  wire         _context_saver_85_residual_add_ContextSaver_caller_almost_full_out;
  wire         _context_saver_85_residual_add_ContextSaver_callee_rden_out;
  wire         _context_saver_85_residual_add_ContextSaver_valid_out;
  wire [15:0]  _context_saver_85_residual_add_ContextSaver_callee_data_out;
  wire         _context_saver_85_residual_add_ContextSaver_caller_data_out;
  wire         _context_saver_83_swiglu_compute_ContextSaver_caller_almost_full_out;
  wire         _context_saver_83_swiglu_compute_ContextSaver_callee_rden_out;
  wire         _context_saver_83_swiglu_compute_ContextSaver_valid_out;
  wire [15:0]  _context_saver_83_swiglu_compute_ContextSaver_callee_data_out;
  wire         _context_saver_83_swiglu_compute_ContextSaver_caller_data_out;
  wire         _context_saver_81_rmsnorm_accumulate_ContextSaver_caller_almost_full_out;
  wire         _context_saver_81_rmsnorm_accumulate_ContextSaver_callee_rden_out;
  wire         _context_saver_81_rmsnorm_accumulate_ContextSaver_valid_out;
  wire         _context_saver_81_rmsnorm_accumulate_ContextSaver_callee_data_out;
  wire         _context_saver_81_rmsnorm_accumulate_ContextSaver_caller_data_out;
  wire         _context_saver_79_rmsnorm_get_sum_ContextSaver_caller_almost_full_out;
  wire         _context_saver_79_rmsnorm_get_sum_ContextSaver_callee_rden_out;
  wire         _context_saver_79_rmsnorm_get_sum_ContextSaver_valid_out;
  wire [31:0]  _context_saver_79_rmsnorm_get_sum_ContextSaver_callee_data_out;
  wire         _context_saver_79_rmsnorm_get_sum_ContextSaver_caller_data_out;
  wire         _context_saver_77_rmsnorm_reset_ContextSaver_caller_almost_full_out;
  wire         _context_saver_77_rmsnorm_reset_ContextSaver_callee_rden_out;
  wire         _context_saver_77_rmsnorm_reset_ContextSaver_valid_out;
  wire         _context_saver_77_rmsnorm_reset_ContextSaver_callee_data_out;
  wire         _context_saver_77_rmsnorm_reset_ContextSaver_caller_data_out;
  wire         _context_saver_75_set_sigmoid_lut_ContextSaver_caller_almost_full_out;
  wire         _context_saver_75_set_sigmoid_lut_ContextSaver_callee_rden_out;
  wire         _context_saver_75_set_sigmoid_lut_ContextSaver_valid_out;
  wire         _context_saver_75_set_sigmoid_lut_ContextSaver_callee_data_out;
  wire         _context_saver_75_set_sigmoid_lut_ContextSaver_caller_data_out;
  wire         _context_saver_73_set_rsqrt_lut_ContextSaver_caller_almost_full_out;
  wire         _context_saver_73_set_rsqrt_lut_ContextSaver_callee_rden_out;
  wire         _context_saver_73_set_rsqrt_lut_ContextSaver_valid_out;
  wire         _context_saver_73_set_rsqrt_lut_ContextSaver_callee_data_out;
  wire         _context_saver_73_set_rsqrt_lut_ContextSaver_caller_data_out;
  wire         _context_saver_71_set_gamma_pre_mlp_ContextSaver_caller_almost_full_out;
  wire         _context_saver_71_set_gamma_pre_mlp_ContextSaver_callee_rden_out;
  wire         _context_saver_71_set_gamma_pre_mlp_ContextSaver_valid_out;
  wire         _context_saver_71_set_gamma_pre_mlp_ContextSaver_callee_data_out;
  wire         _context_saver_71_set_gamma_pre_mlp_ContextSaver_caller_data_out;
  wire         _context_saver_69_set_gamma_pre_attn_ContextSaver_caller_almost_full_out;
  wire         _context_saver_69_set_gamma_pre_attn_ContextSaver_callee_rden_out;
  wire         _context_saver_69_set_gamma_pre_attn_ContextSaver_valid_out;
  wire         _context_saver_69_set_gamma_pre_attn_ContextSaver_callee_data_out;
  wire         _context_saver_69_set_gamma_pre_attn_ContextSaver_caller_data_out;
  wire         _context_saver_67_read_sin_forwarded_ContextSaver_caller_almost_full_out;
  wire         _context_saver_67_read_sin_forwarded_ContextSaver_callee_rden_out;
  wire         _context_saver_67_read_sin_forwarded_ContextSaver_valid_out;
  wire [255:0] _context_saver_67_read_sin_forwarded_ContextSaver_callee_data_out;
  wire         _context_saver_67_read_sin_forwarded_ContextSaver_caller_data_out;
  wire         _context_saver_65_read_cos_forwarded_ContextSaver_caller_almost_full_out;
  wire         _context_saver_65_read_cos_forwarded_ContextSaver_callee_rden_out;
  wire         _context_saver_65_read_cos_forwarded_ContextSaver_valid_out;
  wire [255:0] _context_saver_65_read_cos_forwarded_ContextSaver_callee_data_out;
  wire         _context_saver_65_read_cos_forwarded_ContextSaver_caller_data_out;
  wire         _context_saver_63_forward_sin_ContextSaver_caller_almost_full_out;
  wire         _context_saver_63_forward_sin_ContextSaver_callee_rden_out;
  wire         _context_saver_63_forward_sin_ContextSaver_valid_out;
  wire         _context_saver_63_forward_sin_ContextSaver_callee_data_out;
  wire         _context_saver_63_forward_sin_ContextSaver_caller_data_out;
  wire         _context_saver_61_forward_cos_ContextSaver_caller_almost_full_out;
  wire         _context_saver_61_forward_cos_ContextSaver_callee_rden_out;
  wire         _context_saver_61_forward_cos_ContextSaver_valid_out;
  wire         _context_saver_61_forward_cos_ContextSaver_callee_data_out;
  wire         _context_saver_61_forward_cos_ContextSaver_caller_data_out;
  wire         _fifo_88_rotate_odd_FromCallee_overflow_out;
  wire         _fifo_88_rotate_odd_FromCallee_underflow_out;
  wire         _fifo_88_rotate_odd_FromCallee_empty;
  wire         _fifo_88_rotate_odd_FromCallee_full;
  wire [15:0]  _fifo_88_rotate_odd_FromCallee_q;
  wire         _fifo_86_rotate_even_FromCallee_overflow_out;
  wire         _fifo_86_rotate_even_FromCallee_underflow_out;
  wire         _fifo_86_rotate_even_FromCallee_empty;
  wire         _fifo_86_rotate_even_FromCallee_full;
  wire [15:0]  _fifo_86_rotate_even_FromCallee_q;
  wire         _fifo_84_residual_add_FromCallee_overflow_out;
  wire         _fifo_84_residual_add_FromCallee_underflow_out;
  wire         _fifo_84_residual_add_FromCallee_empty;
  wire         _fifo_84_residual_add_FromCallee_full;
  wire [15:0]  _fifo_84_residual_add_FromCallee_q;
  wire         _fifo_82_swiglu_compute_FromCallee_overflow_out;
  wire         _fifo_82_swiglu_compute_FromCallee_underflow_out;
  wire         _fifo_82_swiglu_compute_FromCallee_empty;
  wire         _fifo_82_swiglu_compute_FromCallee_full;
  wire [15:0]  _fifo_82_swiglu_compute_FromCallee_q;
  wire         _fifo_80_rmsnorm_accumulate_FromCallee_overflow_out;
  wire         _fifo_80_rmsnorm_accumulate_FromCallee_underflow_out;
  wire         _fifo_80_rmsnorm_accumulate_FromCallee_empty;
  wire         _fifo_80_rmsnorm_accumulate_FromCallee_full;
  wire         _fifo_78_rmsnorm_get_sum_FromCallee_overflow_out;
  wire         _fifo_78_rmsnorm_get_sum_FromCallee_underflow_out;
  wire         _fifo_78_rmsnorm_get_sum_FromCallee_empty;
  wire         _fifo_78_rmsnorm_get_sum_FromCallee_full;
  wire [31:0]  _fifo_78_rmsnorm_get_sum_FromCallee_q;
  wire         _fifo_76_rmsnorm_reset_FromCallee_overflow_out;
  wire         _fifo_76_rmsnorm_reset_FromCallee_underflow_out;
  wire         _fifo_76_rmsnorm_reset_FromCallee_empty;
  wire         _fifo_76_rmsnorm_reset_FromCallee_full;
  wire         _fifo_74_set_sigmoid_lut_FromCallee_overflow_out;
  wire         _fifo_74_set_sigmoid_lut_FromCallee_underflow_out;
  wire         _fifo_74_set_sigmoid_lut_FromCallee_empty;
  wire         _fifo_74_set_sigmoid_lut_FromCallee_full;
  wire         _fifo_72_set_rsqrt_lut_FromCallee_overflow_out;
  wire         _fifo_72_set_rsqrt_lut_FromCallee_underflow_out;
  wire         _fifo_72_set_rsqrt_lut_FromCallee_empty;
  wire         _fifo_72_set_rsqrt_lut_FromCallee_full;
  wire         _fifo_70_set_gamma_pre_mlp_FromCallee_overflow_out;
  wire         _fifo_70_set_gamma_pre_mlp_FromCallee_underflow_out;
  wire         _fifo_70_set_gamma_pre_mlp_FromCallee_empty;
  wire         _fifo_70_set_gamma_pre_mlp_FromCallee_full;
  wire         _fifo_68_set_gamma_pre_attn_FromCallee_overflow_out;
  wire         _fifo_68_set_gamma_pre_attn_FromCallee_underflow_out;
  wire         _fifo_68_set_gamma_pre_attn_FromCallee_empty;
  wire         _fifo_68_set_gamma_pre_attn_FromCallee_full;
  wire         _fifo_66_read_sin_forwarded_FromCallee_overflow_out;
  wire         _fifo_66_read_sin_forwarded_FromCallee_underflow_out;
  wire         _fifo_66_read_sin_forwarded_FromCallee_empty;
  wire         _fifo_66_read_sin_forwarded_FromCallee_full;
  wire [255:0] _fifo_66_read_sin_forwarded_FromCallee_q;
  wire         _fifo_64_read_cos_forwarded_FromCallee_overflow_out;
  wire         _fifo_64_read_cos_forwarded_FromCallee_underflow_out;
  wire         _fifo_64_read_cos_forwarded_FromCallee_empty;
  wire         _fifo_64_read_cos_forwarded_FromCallee_full;
  wire [255:0] _fifo_64_read_cos_forwarded_FromCallee_q;
  wire         _fifo_62_forward_sin_FromCallee_overflow_out;
  wire         _fifo_62_forward_sin_FromCallee_underflow_out;
  wire         _fifo_62_forward_sin_FromCallee_empty;
  wire         _fifo_62_forward_sin_FromCallee_full;
  wire         _fifo_60_forward_cos_FromCallee_overflow_out;
  wire         _fifo_60_forward_cos_FromCallee_underflow_out;
  wire         _fifo_60_forward_cos_FromCallee_empty;
  wire         _fifo_60_forward_cos_FromCallee_full;
  wire         _fifo_29_residual_add_Entry_overflow_out;
  wire         _fifo_29_residual_add_Entry_underflow_out;
  wire         _fifo_29_residual_add_Entry_empty;
  wire         _fifo_29_residual_add_Entry_full;
  wire [31:0]  _fifo_29_residual_add_Entry_q;
  wire         _fifo_28_swiglu_compute_Entry_overflow_out;
  wire         _fifo_28_swiglu_compute_Entry_underflow_out;
  wire         _fifo_28_swiglu_compute_Entry_empty;
  wire         _fifo_28_swiglu_compute_Entry_full;
  wire [31:0]  _fifo_28_swiglu_compute_Entry_q;
  wire         _fifo_27_set_sigmoid_lut_Entry_overflow_out;
  wire         _fifo_27_set_sigmoid_lut_Entry_underflow_out;
  wire         _fifo_27_set_sigmoid_lut_Entry_empty;
  wire         _fifo_27_set_sigmoid_lut_Entry_full;
  wire [23:0]  _fifo_27_set_sigmoid_lut_Entry_q;
  wire         _fifo_26_set_rsqrt_lut_Entry_overflow_out;
  wire         _fifo_26_set_rsqrt_lut_Entry_underflow_out;
  wire         _fifo_26_set_rsqrt_lut_Entry_empty;
  wire         _fifo_26_set_rsqrt_lut_Entry_full;
  wire [23:0]  _fifo_26_set_rsqrt_lut_Entry_q;
  wire         _fifo_25_set_gamma_pre_mlp_Entry_overflow_out;
  wire         _fifo_25_set_gamma_pre_mlp_Entry_underflow_out;
  wire         _fifo_25_set_gamma_pre_mlp_Entry_empty;
  wire         _fifo_25_set_gamma_pre_mlp_Entry_full;
  wire [31:0]  _fifo_25_set_gamma_pre_mlp_Entry_q;
  wire         _fifo_24_set_gamma_pre_attn_Entry_overflow_out;
  wire         _fifo_24_set_gamma_pre_attn_Entry_underflow_out;
  wire         _fifo_24_set_gamma_pre_attn_Entry_empty;
  wire         _fifo_24_set_gamma_pre_attn_Entry_full;
  wire [31:0]  _fifo_24_set_gamma_pre_attn_Entry_q;
  wire         _fifo_23_rmsnorm_reset_Entry_overflow_out;
  wire         _fifo_23_rmsnorm_reset_Entry_underflow_out;
  wire         _fifo_23_rmsnorm_reset_Entry_empty;
  wire         _fifo_23_rmsnorm_reset_Entry_full;
  wire         _fifo_22_rmsnorm_get_sum_Entry_overflow_out;
  wire         _fifo_22_rmsnorm_get_sum_Entry_underflow_out;
  wire         _fifo_22_rmsnorm_get_sum_Entry_empty;
  wire         _fifo_22_rmsnorm_get_sum_Entry_full;
  wire         _fifo_21_rmsnorm_accumulate_Entry_overflow_out;
  wire         _fifo_21_rmsnorm_accumulate_Entry_underflow_out;
  wire         _fifo_21_rmsnorm_accumulate_Entry_empty;
  wire         _fifo_21_rmsnorm_accumulate_Entry_full;
  wire [15:0]  _fifo_21_rmsnorm_accumulate_Entry_q;
  wire         _fifo_20_rotate_odd_Entry_overflow_out;
  wire         _fifo_20_rotate_odd_Entry_underflow_out;
  wire         _fifo_20_rotate_odd_Entry_empty;
  wire         _fifo_20_rotate_odd_Entry_full;
  wire [63:0]  _fifo_20_rotate_odd_Entry_q;
  wire         _fifo_19_rotate_even_Entry_overflow_out;
  wire         _fifo_19_rotate_even_Entry_underflow_out;
  wire         _fifo_19_rotate_even_Entry_empty;
  wire         _fifo_19_rotate_even_Entry_full;
  wire [63:0]  _fifo_19_rotate_even_Entry_q;
  wire         _fifo_18_read_sin_forwarded_Entry_overflow_out;
  wire         _fifo_18_read_sin_forwarded_Entry_underflow_out;
  wire         _fifo_18_read_sin_forwarded_Entry_empty;
  wire         _fifo_18_read_sin_forwarded_Entry_full;
  wire [1:0]   _fifo_18_read_sin_forwarded_Entry_q;
  wire         _fifo_17_read_cos_forwarded_Entry_overflow_out;
  wire         _fifo_17_read_cos_forwarded_Entry_underflow_out;
  wire         _fifo_17_read_cos_forwarded_Entry_empty;
  wire         _fifo_17_read_cos_forwarded_Entry_full;
  wire [1:0]   _fifo_17_read_cos_forwarded_Entry_q;
  wire         _fifo_16_forward_sin_Entry_overflow_out;
  wire         _fifo_16_forward_sin_Entry_underflow_out;
  wire         _fifo_16_forward_sin_Entry_empty;
  wire         _fifo_16_forward_sin_Entry_full;
  wire [257:0] _fifo_16_forward_sin_Entry_q;
  wire         _fifo_15_forward_cos_Entry_overflow_out;
  wire         _fifo_15_forward_cos_Entry_underflow_out;
  wire         _fifo_15_forward_cos_Entry_empty;
  wire         _fifo_15_forward_cos_Entry_full;
  wire [257:0] _fifo_15_forward_cos_Entry_q;
  wire         _fifo_14_rotate_odd_Return_overflow_out;
  wire         _fifo_14_rotate_odd_Return_underflow_out;
  wire         _fifo_14_rotate_odd_Return_empty;
  wire         _fifo_14_rotate_odd_Return_full;
  wire [15:0]  _fifo_14_rotate_odd_Return_q;
  wire         _fifo_13_rotate_even_Return_overflow_out;
  wire         _fifo_13_rotate_even_Return_underflow_out;
  wire         _fifo_13_rotate_even_Return_empty;
  wire         _fifo_13_rotate_even_Return_full;
  wire [15:0]  _fifo_13_rotate_even_Return_q;
  wire         _fifo_12_residual_add_step_Return_overflow_out;
  wire         _fifo_12_residual_add_step_Return_underflow_out;
  wire         _fifo_12_residual_add_step_Return_empty;
  wire         _fifo_12_residual_add_step_Return_full;
  wire [15:0]  _fifo_12_residual_add_step_Return_q;
  wire         _fifo_11_swiglu_step_Return_overflow_out;
  wire         _fifo_11_swiglu_step_Return_underflow_out;
  wire         _fifo_11_swiglu_step_Return_empty;
  wire         _fifo_11_swiglu_step_Return_full;
  wire [15:0]  _fifo_11_swiglu_step_Return_q;
  wire         _fifo_10_rmsnorm_step_Return_overflow_out;
  wire         _fifo_10_rmsnorm_step_Return_underflow_out;
  wire         _fifo_10_rmsnorm_step_Return_empty;
  wire         _fifo_10_rmsnorm_step_Return_full;
  wire         _fifo_9_rmsnorm_get_sum_Return_overflow_out;
  wire         _fifo_9_rmsnorm_get_sum_Return_underflow_out;
  wire         _fifo_9_rmsnorm_get_sum_Return_empty;
  wire         _fifo_9_rmsnorm_get_sum_Return_full;
  wire [31:0]  _fifo_9_rmsnorm_get_sum_Return_q;
  wire         _fifo_8_rmsnorm_reset_Return_overflow_out;
  wire         _fifo_8_rmsnorm_reset_Return_underflow_out;
  wire         _fifo_8_rmsnorm_reset_Return_empty;
  wire         _fifo_8_rmsnorm_reset_Return_full;
  wire         _fifo_7_prog_sigmoid_lut_Return_overflow_out;
  wire         _fifo_7_prog_sigmoid_lut_Return_underflow_out;
  wire         _fifo_7_prog_sigmoid_lut_Return_empty;
  wire         _fifo_7_prog_sigmoid_lut_Return_full;
  wire         _fifo_6_prog_rsqrt_lut_Return_overflow_out;
  wire         _fifo_6_prog_rsqrt_lut_Return_underflow_out;
  wire         _fifo_6_prog_rsqrt_lut_Return_empty;
  wire         _fifo_6_prog_rsqrt_lut_Return_full;
  wire         _fifo_5_prog_gamma_pre_mlp_Return_overflow_out;
  wire         _fifo_5_prog_gamma_pre_mlp_Return_underflow_out;
  wire         _fifo_5_prog_gamma_pre_mlp_Return_empty;
  wire         _fifo_5_prog_gamma_pre_mlp_Return_full;
  wire         _fifo_4_prog_gamma_pre_attn_Return_overflow_out;
  wire         _fifo_4_prog_gamma_pre_attn_Return_underflow_out;
  wire         _fifo_4_prog_gamma_pre_attn_Return_empty;
  wire         _fifo_4_prog_gamma_pre_attn_Return_full;
  wire         _fifo_3_read_sin_forwarded_Return_overflow_out;
  wire         _fifo_3_read_sin_forwarded_Return_underflow_out;
  wire         _fifo_3_read_sin_forwarded_Return_empty;
  wire         _fifo_3_read_sin_forwarded_Return_full;
  wire [255:0] _fifo_3_read_sin_forwarded_Return_q;
  wire         _fifo_2_read_cos_forwarded_Return_overflow_out;
  wire         _fifo_2_read_cos_forwarded_Return_underflow_out;
  wire         _fifo_2_read_cos_forwarded_Return_empty;
  wire         _fifo_2_read_cos_forwarded_Return_full;
  wire [255:0] _fifo_2_read_cos_forwarded_Return_q;
  wire         _fifo_1_forward_sin_Return_overflow_out;
  wire         _fifo_1_forward_sin_Return_underflow_out;
  wire         _fifo_1_forward_sin_Return_empty;
  wire         _fifo_1_forward_sin_Return_full;
  wire         _fifo_0_forward_cos_Return_overflow_out;
  wire         _fifo_0_forward_cos_Return_underflow_out;
  wire         _fifo_0_forward_cos_Return_empty;
  wire         _fifo_0_forward_cos_Return_full;
  wire         _has_startup_completed_delayed_29_delay_chain_data_out;
  wire         _has_startup_completed_delayed_28_delay_chain_data_out;
  wire         _has_startup_completed_delayed_27_delay_chain_data_out;
  wire         _has_startup_completed_delayed_26_delay_chain_data_out;
  wire         _has_startup_completed_delayed_25_delay_chain_data_out;
  wire         _has_startup_completed_delayed_24_delay_chain_data_out;
  wire         _has_startup_completed_delayed_23_delay_chain_data_out;
  wire         _has_startup_completed_delayed_22_delay_chain_data_out;
  wire         _has_startup_completed_delayed_21_delay_chain_data_out;
  wire         _has_startup_completed_delayed_20_delay_chain_data_out;
  wire         _has_startup_completed_delayed_19_delay_chain_data_out;
  wire         _has_startup_completed_delayed_18_delay_chain_data_out;
  wire         _has_startup_completed_delayed_17_delay_chain_data_out;
  wire         _has_startup_completed_delayed_16_delay_chain_data_out;
  wire         _has_startup_completed_delayed_15_delay_chain_data_out;
  wire         _has_startup_completed_delayed_14_delay_chain_data_out;
  wire         _has_startup_completed_delayed_13_delay_chain_data_out;
  wire         _has_startup_completed_delayed_12_delay_chain_data_out;
  wire         _has_startup_completed_delayed_11_delay_chain_data_out;
  wire         _has_startup_completed_delayed_10_delay_chain_data_out;
  wire         _has_startup_completed_delayed_9_delay_chain_data_out;
  wire         _has_startup_completed_delayed_8_delay_chain_data_out;
  wire         _has_startup_completed_delayed_7_delay_chain_data_out;
  wire         _has_startup_completed_delayed_6_delay_chain_data_out;
  wire         _has_startup_completed_delayed_5_delay_chain_data_out;
  wire         _has_startup_completed_delayed_4_delay_chain_data_out;
  wire         _has_startup_completed_delayed_3_delay_chain_data_out;
  wire         _has_startup_completed_delayed_2_delay_chain_data_out;
  wire         _has_startup_completed_delayed_1_delay_chain_data_out;
  wire         _has_startup_completed_delayed_0_delay_chain_data_out;
  wire         _thread_count___globalObject___rotate_odd_14_counter_full_out;
  wire         _thread_count___globalObject___rotate_even_13_counter_full_out;
  wire         _thread_count___globalObject___residual_add_step_12_counter_full_out;
  wire         _thread_count___globalObject___swiglu_step_11_counter_full_out;
  wire         _thread_count___globalObject___rmsnorm_step_10_counter_full_out;
  wire         _thread_count___globalObject___rmsnorm_get_sum_9_counter_full_out;
  wire         _thread_count___globalObject___rmsnorm_reset_8_counter_full_out;
  wire         _thread_count___globalObject___prog_sigmoid_lut_7_counter_full_out;
  wire         _thread_count___globalObject___prog_rsqrt_lut_6_counter_full_out;
  wire         _thread_count___globalObject___prog_gamma_pre_mlp_5_counter_full_out;
  wire         _thread_count___globalObject___prog_gamma_pre_attn_4_counter_full_out;
  wire         _thread_count___globalObject___read_sin_forwarded_3_counter_full_out;
  wire         _thread_count___globalObject___read_cos_forwarded_2_counter_full_out;
  wire         _thread_count___globalObject___forward_sin_1_counter_full_out;
  wire         _thread_count___globalObject___forward_cos_0_counter_full_out;
  wire         _reset_control_rst_and_startup_done_out;
  wire [121:0] _reset_control_rst_delayed_out;
  wire         _reset_control_reset_sequence_finished_this_cycle_out;
  logic  stall_rate_supported_out_net;
  logic  rotate_odd_empty_out_net;
  logic [15:0] rotate_odd_result_out_net;
  logic  rotate_odd_rdy_out_net;
  logic  rotate_even_empty_out_net;
  logic [15:0] rotate_even_result_out_net;
  logic  rotate_even_rdy_out_net;
  logic  residual_add_step_empty_out_net;
  logic [15:0] residual_add_step_result_out_net;
  logic  residual_add_step_rdy_out_net;
  logic  swiglu_step_empty_out_net;
  logic [15:0] swiglu_step_result_out_net;
  logic  swiglu_step_rdy_out_net;
  logic  rmsnorm_step_empty_out_net;
  logic  rmsnorm_step_rdy_out_net;
  logic  rmsnorm_get_sum_empty_out_net;
  logic [31:0] rmsnorm_get_sum_result_out_net;
  logic  rmsnorm_get_sum_rdy_out_net;
  logic  rmsnorm_reset_empty_out_net;
  logic  rmsnorm_reset_rdy_out_net;
  logic  prog_sigmoid_lut_empty_out_net;
  logic  prog_sigmoid_lut_rdy_out_net;
  logic  prog_rsqrt_lut_empty_out_net;
  logic  prog_rsqrt_lut_rdy_out_net;
  logic  prog_gamma_pre_mlp_empty_out_net;
  logic  prog_gamma_pre_mlp_rdy_out_net;
  logic  prog_gamma_pre_attn_empty_out_net;
  logic  prog_gamma_pre_attn_rdy_out_net;
  logic  read_sin_forwarded_empty_out_net;
  logic [255:0] read_sin_forwarded_result_out_net;
  logic  read_sin_forwarded_rdy_out_net;
  logic  read_cos_forwarded_empty_out_net;
  logic [255:0] read_cos_forwarded_result_out_net;
  logic  read_cos_forwarded_rdy_out_net;
  logic  forward_sin_empty_out_net;
  logic  forward_sin_rdy_out_net;
  logic  forward_cos_empty_out_net;
  logic  forward_cos_rdy_out_net;
  logic  rst_and_startup_done_out_net;

  logic [31:0] dropped_commands;
  //synopsys translate_off
  KanagawaStringTable string_table(.clk(clk));
  //synopsys translate_on
  logic [121:0] reg_rst_delayed;
  logic combined_reset;
  assign combined_reset = rst;
  logic reset_sequence_finished_this_cycle;
  logic has_startup_completed_raw;
  logic has_mem_init_completed;
  logic has_others_completed;
  assign has_others_completed = has_startup_completed_raw;

  logic rst_and_startup_done_raw;
  logic _rope__rope_apply_rst_and_startup_done_out;
  logic _vpu__vector_unit_rst_and_startup_done_out;

  logic [0:0] rst_array;
  assign rst_array[0] = combined_reset;
  struct packed {
      logic incr_count;
      logic decr_count;
      logic full;
  } thread_count___globalObject___forward_cos_0;
  wire         thread_count___globalObject___forward_cos_0_counter_incr_count_in__circt =
    thread_count___globalObject___forward_cos_0.incr_count;
  wire         thread_count___globalObject___forward_cos_0_counter_decr_count_in__circt =
    thread_count___globalObject___forward_cos_0.decr_count;

  struct packed {
      logic incr_count;
      logic decr_count;
      logic full;
  } thread_count___globalObject___forward_sin_1;
  wire         thread_count___globalObject___forward_sin_1_counter_incr_count_in__circt =
    thread_count___globalObject___forward_sin_1.incr_count;
  wire         thread_count___globalObject___forward_sin_1_counter_decr_count_in__circt =
    thread_count___globalObject___forward_sin_1.decr_count;

  struct packed {
      logic incr_count;
      logic decr_count;
      logic full;
  } thread_count___globalObject___read_cos_forwarded_2;
  wire
    thread_count___globalObject___read_cos_forwarded_2_counter_incr_count_in__circt =
    thread_count___globalObject___read_cos_forwarded_2.incr_count;
  wire
    thread_count___globalObject___read_cos_forwarded_2_counter_decr_count_in__circt =
    thread_count___globalObject___read_cos_forwarded_2.decr_count;

  struct packed {
      logic incr_count;
      logic decr_count;
      logic full;
  } thread_count___globalObject___read_sin_forwarded_3;
  wire
    thread_count___globalObject___read_sin_forwarded_3_counter_incr_count_in__circt =
    thread_count___globalObject___read_sin_forwarded_3.incr_count;
  wire
    thread_count___globalObject___read_sin_forwarded_3_counter_decr_count_in__circt =
    thread_count___globalObject___read_sin_forwarded_3.decr_count;

  struct packed {
      logic incr_count;
      logic decr_count;
      logic full;
  } thread_count___globalObject___prog_gamma_pre_attn_4;
  wire
    thread_count___globalObject___prog_gamma_pre_attn_4_counter_incr_count_in__circt =
    thread_count___globalObject___prog_gamma_pre_attn_4.incr_count;
  wire
    thread_count___globalObject___prog_gamma_pre_attn_4_counter_decr_count_in__circt =
    thread_count___globalObject___prog_gamma_pre_attn_4.decr_count;

  struct packed {
      logic incr_count;
      logic decr_count;
      logic full;
  } thread_count___globalObject___prog_gamma_pre_mlp_5;
  wire
    thread_count___globalObject___prog_gamma_pre_mlp_5_counter_incr_count_in__circt =
    thread_count___globalObject___prog_gamma_pre_mlp_5.incr_count;
  wire
    thread_count___globalObject___prog_gamma_pre_mlp_5_counter_decr_count_in__circt =
    thread_count___globalObject___prog_gamma_pre_mlp_5.decr_count;

  struct packed {
      logic incr_count;
      logic decr_count;
      logic full;
  } thread_count___globalObject___prog_rsqrt_lut_6;
  wire         thread_count___globalObject___prog_rsqrt_lut_6_counter_incr_count_in__circt
    = thread_count___globalObject___prog_rsqrt_lut_6.incr_count;
  wire         thread_count___globalObject___prog_rsqrt_lut_6_counter_decr_count_in__circt
    = thread_count___globalObject___prog_rsqrt_lut_6.decr_count;

  struct packed {
      logic incr_count;
      logic decr_count;
      logic full;
  } thread_count___globalObject___prog_sigmoid_lut_7;
  wire
    thread_count___globalObject___prog_sigmoid_lut_7_counter_incr_count_in__circt =
    thread_count___globalObject___prog_sigmoid_lut_7.incr_count;
  wire
    thread_count___globalObject___prog_sigmoid_lut_7_counter_decr_count_in__circt =
    thread_count___globalObject___prog_sigmoid_lut_7.decr_count;

  struct packed {
      logic incr_count;
      logic decr_count;
      logic full;
  } thread_count___globalObject___rmsnorm_reset_8;
  wire         thread_count___globalObject___rmsnorm_reset_8_counter_incr_count_in__circt
    = thread_count___globalObject___rmsnorm_reset_8.incr_count;
  wire         thread_count___globalObject___rmsnorm_reset_8_counter_decr_count_in__circt
    = thread_count___globalObject___rmsnorm_reset_8.decr_count;

  struct packed {
      logic incr_count;
      logic decr_count;
      logic full;
  } thread_count___globalObject___rmsnorm_get_sum_9;
  wire
    thread_count___globalObject___rmsnorm_get_sum_9_counter_incr_count_in__circt =
    thread_count___globalObject___rmsnorm_get_sum_9.incr_count;
  wire
    thread_count___globalObject___rmsnorm_get_sum_9_counter_decr_count_in__circt =
    thread_count___globalObject___rmsnorm_get_sum_9.decr_count;

  struct packed {
      logic incr_count;
      logic decr_count;
      logic full;
  } thread_count___globalObject___rmsnorm_step_10;
  wire         thread_count___globalObject___rmsnorm_step_10_counter_incr_count_in__circt
    = thread_count___globalObject___rmsnorm_step_10.incr_count;
  wire         thread_count___globalObject___rmsnorm_step_10_counter_decr_count_in__circt
    = thread_count___globalObject___rmsnorm_step_10.decr_count;

  struct packed {
      logic incr_count;
      logic decr_count;
      logic full;
  } thread_count___globalObject___swiglu_step_11;
  wire         thread_count___globalObject___swiglu_step_11_counter_incr_count_in__circt =
    thread_count___globalObject___swiglu_step_11.incr_count;
  wire         thread_count___globalObject___swiglu_step_11_counter_decr_count_in__circt =
    thread_count___globalObject___swiglu_step_11.decr_count;

  struct packed {
      logic incr_count;
      logic decr_count;
      logic full;
  } thread_count___globalObject___residual_add_step_12;
  wire
    thread_count___globalObject___residual_add_step_12_counter_incr_count_in__circt =
    thread_count___globalObject___residual_add_step_12.incr_count;
  wire
    thread_count___globalObject___residual_add_step_12_counter_decr_count_in__circt =
    thread_count___globalObject___residual_add_step_12.decr_count;

  struct packed {
      logic incr_count;
      logic decr_count;
      logic full;
  } thread_count___globalObject___rotate_even_13;
  wire         thread_count___globalObject___rotate_even_13_counter_incr_count_in__circt =
    thread_count___globalObject___rotate_even_13.incr_count;
  wire         thread_count___globalObject___rotate_even_13_counter_decr_count_in__circt =
    thread_count___globalObject___rotate_even_13.decr_count;

  struct packed {
      logic incr_count;
      logic decr_count;
      logic full;
  } thread_count___globalObject___rotate_odd_14;
  wire         thread_count___globalObject___rotate_odd_14_counter_incr_count_in__circt =
    thread_count___globalObject___rotate_odd_14.incr_count;
  wire         thread_count___globalObject___rotate_odd_14_counter_decr_count_in__circt =
    thread_count___globalObject___rotate_odd_14.decr_count;

  logic _rope_rope_apply__forward_cos_rden;
  logic _rope_rope_apply__forward_cos_rdy_export_class;
  logic [1:0] _rope_rope_apply__forward_cos_phase;
  logic [255:0] _rope_rope_apply__forward_cos_v;
  logic _rope_rope_apply__forward_cos_empty;
  logic _rope_rope_apply__forward_cos_valid_export_class;
  logic _rope_rope_apply__forward_cos_valid;
  logic _rope_rope_apply__forward_cos_empty_export_class;
  logic _rope_rope_apply__forward_cos_rdy;
  logic _rope_rope_apply__forward_cos_rden_export_class;
  logic _rope_rope_apply__forward_sin_rden;
  logic _rope_rope_apply__forward_sin_rdy_export_class;
  logic [1:0] _rope_rope_apply__forward_sin_phase;
  logic [255:0] _rope_rope_apply__forward_sin_v;
  logic _rope_rope_apply__forward_sin_empty;
  logic _rope_rope_apply__forward_sin_valid_export_class;
  logic _rope_rope_apply__forward_sin_valid;
  logic _rope_rope_apply__forward_sin_empty_export_class;
  logic _rope_rope_apply__forward_sin_rdy;
  logic _rope_rope_apply__forward_sin_rden_export_class;
  logic _rope_rope_apply__read_cos_forwarded_rden;
  logic _rope_rope_apply__read_cos_forwarded_rdy_export_class;
  logic [1:0] _rope_rope_apply__read_cos_forwarded_phase;
  logic _rope_rope_apply__read_cos_forwarded_empty;
  logic _rope_rope_apply__read_cos_forwarded_valid_export_class;
  logic _rope_rope_apply__read_cos_forwarded_valid;
  logic _rope_rope_apply__read_cos_forwarded_empty_export_class;
  logic [255:0] _rope_rope_apply__read_cos_forwarded_result;
  logic _rope_rope_apply__read_cos_forwarded_rdy;
  logic _rope_rope_apply__read_cos_forwarded_rden_export_class;
  logic _rope_rope_apply__read_sin_forwarded_rden;
  logic _rope_rope_apply__read_sin_forwarded_rdy_export_class;
  logic [1:0] _rope_rope_apply__read_sin_forwarded_phase;
  logic _rope_rope_apply__read_sin_forwarded_empty;
  logic _rope_rope_apply__read_sin_forwarded_valid_export_class;
  logic _rope_rope_apply__read_sin_forwarded_valid;
  logic _rope_rope_apply__read_sin_forwarded_empty_export_class;
  logic [255:0] _rope_rope_apply__read_sin_forwarded_result;
  logic _rope_rope_apply__read_sin_forwarded_rdy;
  logic _rope_rope_apply__read_sin_forwarded_rden_export_class;
  logic _rope_rope_apply__rotate_even_rden;
  logic _rope_rope_apply__rotate_even_rdy_export_class;
  logic [15:0] _rope_rope_apply__rotate_even_x_even;
  logic [15:0] _rope_rope_apply__rotate_even_x_odd;
  logic [15:0] _rope_rope_apply__rotate_even_cos_val;
  logic [15:0] _rope_rope_apply__rotate_even_sin_val;
  logic _rope_rope_apply__rotate_even_empty;
  logic _rope_rope_apply__rotate_even_valid_export_class;
  logic _rope_rope_apply__rotate_even_valid;
  logic _rope_rope_apply__rotate_even_empty_export_class;
  logic [15:0] _rope_rope_apply__rotate_even_result;
  logic _rope_rope_apply__rotate_even_rdy;
  logic _rope_rope_apply__rotate_even_rden_export_class;
  logic _rope_rope_apply__rotate_odd_rden;
  logic _rope_rope_apply__rotate_odd_rdy_export_class;
  logic [15:0] _rope_rope_apply__rotate_odd_x_even;
  logic [15:0] _rope_rope_apply__rotate_odd_x_odd;
  logic [15:0] _rope_rope_apply__rotate_odd_cos_val;
  logic [15:0] _rope_rope_apply__rotate_odd_sin_val;
  logic _rope_rope_apply__rotate_odd_empty;
  logic _rope_rope_apply__rotate_odd_valid_export_class;
  logic _rope_rope_apply__rotate_odd_valid;
  logic _rope_rope_apply__rotate_odd_empty_export_class;
  logic [15:0] _rope_rope_apply__rotate_odd_result;
  logic _rope_rope_apply__rotate_odd_rdy;
  logic _rope_rope_apply__rotate_odd_rden_export_class;
  rope_apply _rope__rope_apply_inst
  (
      .clk(clk),
      .rst(reg_rst_delayed[15]),
      .rst_and_startup_done_out(_rope__rope_apply_rst_and_startup_done_out),
      .stall_rate_in(stall_rate_in),
      .stall_rate_valid_in(stall_rate_valid_in),
      .stall_rate_supported_out(),
      .forward_cos_rdy_out(_rope_rope_apply__forward_cos_rdy_export_class),
      .forward_cos_phase_in(_rope_rope_apply__forward_cos_phase),
      .forward_cos_v_in(_rope_rope_apply__forward_cos_v),
      .forward_cos_valid_in(_rope_rope_apply__forward_cos_valid_export_class),
      .forward_cos_empty_out(_rope_rope_apply__forward_cos_empty_export_class),
      .forward_cos_rden_in(_rope_rope_apply__forward_cos_rden_export_class),
      .forward_sin_rdy_out(_rope_rope_apply__forward_sin_rdy_export_class),
      .forward_sin_phase_in(_rope_rope_apply__forward_sin_phase),
      .forward_sin_v_in(_rope_rope_apply__forward_sin_v),
      .forward_sin_valid_in(_rope_rope_apply__forward_sin_valid_export_class),
      .forward_sin_empty_out(_rope_rope_apply__forward_sin_empty_export_class),
      .forward_sin_rden_in(_rope_rope_apply__forward_sin_rden_export_class),
      .read_cos_forwarded_rdy_out(_rope_rope_apply__read_cos_forwarded_rdy_export_class),
      .read_cos_forwarded_phase_in(_rope_rope_apply__read_cos_forwarded_phase),
      .read_cos_forwarded_valid_in(_rope_rope_apply__read_cos_forwarded_valid_export_class),
      .read_cos_forwarded_empty_out(_rope_rope_apply__read_cos_forwarded_empty_export_class),
      .read_cos_forwarded_result_out(_rope_rope_apply__read_cos_forwarded_result),
      .read_cos_forwarded_rden_in(_rope_rope_apply__read_cos_forwarded_rden_export_class),
      .read_sin_forwarded_rdy_out(_rope_rope_apply__read_sin_forwarded_rdy_export_class),
      .read_sin_forwarded_phase_in(_rope_rope_apply__read_sin_forwarded_phase),
      .read_sin_forwarded_valid_in(_rope_rope_apply__read_sin_forwarded_valid_export_class),
      .read_sin_forwarded_empty_out(_rope_rope_apply__read_sin_forwarded_empty_export_class),
      .read_sin_forwarded_result_out(_rope_rope_apply__read_sin_forwarded_result),
      .read_sin_forwarded_rden_in(_rope_rope_apply__read_sin_forwarded_rden_export_class),
      .rotate_even_rdy_out(_rope_rope_apply__rotate_even_rdy_export_class),
      .rotate_even_x_even_in(_rope_rope_apply__rotate_even_x_even),
      .rotate_even_x_odd_in(_rope_rope_apply__rotate_even_x_odd),
      .rotate_even_cos_val_in(_rope_rope_apply__rotate_even_cos_val),
      .rotate_even_sin_val_in(_rope_rope_apply__rotate_even_sin_val),
      .rotate_even_valid_in(_rope_rope_apply__rotate_even_valid_export_class),
      .rotate_even_empty_out(_rope_rope_apply__rotate_even_empty_export_class),
      .rotate_even_result_out(_rope_rope_apply__rotate_even_result),
      .rotate_even_rden_in(_rope_rope_apply__rotate_even_rden_export_class),
      .rotate_odd_rdy_out(_rope_rope_apply__rotate_odd_rdy_export_class),
      .rotate_odd_x_even_in(_rope_rope_apply__rotate_odd_x_even),
      .rotate_odd_x_odd_in(_rope_rope_apply__rotate_odd_x_odd),
      .rotate_odd_cos_val_in(_rope_rope_apply__rotate_odd_cos_val),
      .rotate_odd_sin_val_in(_rope_rope_apply__rotate_odd_sin_val),
      .rotate_odd_valid_in(_rope_rope_apply__rotate_odd_valid_export_class),
      .rotate_odd_empty_out(_rope_rope_apply__rotate_odd_empty_export_class),
      .rotate_odd_result_out(_rope_rope_apply__rotate_odd_result),
      .rotate_odd_rden_in(_rope_rope_apply__rotate_odd_rden_export_class)
  );
  assign _rope_rope_apply__forward_cos_rden = _rope_rope_apply__forward_cos_rdy_export_class & ~_rope_rope_apply__forward_cos_empty;
  assign _rope_rope_apply__forward_cos_valid_export_class = _rope_rope_apply__forward_cos_rden;
  assign _rope_rope_apply__forward_cos_valid = ~_rope_rope_apply__forward_cos_empty_export_class;
  assign _rope_rope_apply__forward_cos_rden_export_class = _rope_rope_apply__forward_cos_valid & _rope_rope_apply__forward_cos_rdy;
  assign _rope_rope_apply__forward_sin_rden = _rope_rope_apply__forward_sin_rdy_export_class & ~_rope_rope_apply__forward_sin_empty;
  assign _rope_rope_apply__forward_sin_valid_export_class = _rope_rope_apply__forward_sin_rden;
  assign _rope_rope_apply__forward_sin_valid = ~_rope_rope_apply__forward_sin_empty_export_class;
  assign _rope_rope_apply__forward_sin_rden_export_class = _rope_rope_apply__forward_sin_valid & _rope_rope_apply__forward_sin_rdy;
  assign _rope_rope_apply__read_cos_forwarded_rden = _rope_rope_apply__read_cos_forwarded_rdy_export_class & ~_rope_rope_apply__read_cos_forwarded_empty;
  assign _rope_rope_apply__read_cos_forwarded_valid_export_class = _rope_rope_apply__read_cos_forwarded_rden;
  assign _rope_rope_apply__read_cos_forwarded_valid = ~_rope_rope_apply__read_cos_forwarded_empty_export_class;
  assign _rope_rope_apply__read_cos_forwarded_rden_export_class = _rope_rope_apply__read_cos_forwarded_valid & _rope_rope_apply__read_cos_forwarded_rdy;
  assign _rope_rope_apply__read_sin_forwarded_rden = _rope_rope_apply__read_sin_forwarded_rdy_export_class & ~_rope_rope_apply__read_sin_forwarded_empty;
  assign _rope_rope_apply__read_sin_forwarded_valid_export_class = _rope_rope_apply__read_sin_forwarded_rden;
  assign _rope_rope_apply__read_sin_forwarded_valid = ~_rope_rope_apply__read_sin_forwarded_empty_export_class;
  assign _rope_rope_apply__read_sin_forwarded_rden_export_class = _rope_rope_apply__read_sin_forwarded_valid & _rope_rope_apply__read_sin_forwarded_rdy;
  assign _rope_rope_apply__rotate_even_rden = _rope_rope_apply__rotate_even_rdy_export_class & ~_rope_rope_apply__rotate_even_empty;
  assign _rope_rope_apply__rotate_even_valid_export_class = _rope_rope_apply__rotate_even_rden;
  assign _rope_rope_apply__rotate_even_valid = ~_rope_rope_apply__rotate_even_empty_export_class;
  assign _rope_rope_apply__rotate_even_rden_export_class = _rope_rope_apply__rotate_even_valid & _rope_rope_apply__rotate_even_rdy;
  assign _rope_rope_apply__rotate_odd_rden = _rope_rope_apply__rotate_odd_rdy_export_class & ~_rope_rope_apply__rotate_odd_empty;
  assign _rope_rope_apply__rotate_odd_valid_export_class = _rope_rope_apply__rotate_odd_rden;
  assign _rope_rope_apply__rotate_odd_valid = ~_rope_rope_apply__rotate_odd_empty_export_class;
  assign _rope_rope_apply__rotate_odd_rden_export_class = _rope_rope_apply__rotate_odd_valid & _rope_rope_apply__rotate_odd_rdy;
  logic _vpu_vector_unit__rmsnorm_accumulate_rden;
  logic _vpu_vector_unit__rmsnorm_accumulate_rdy_export_class;
  logic [15:0] _vpu_vector_unit__rmsnorm_accumulate_x_bf16;
  logic _vpu_vector_unit__rmsnorm_accumulate_empty;
  logic _vpu_vector_unit__rmsnorm_accumulate_valid_export_class;
  logic _vpu_vector_unit__rmsnorm_accumulate_valid;
  logic _vpu_vector_unit__rmsnorm_accumulate_empty_export_class;
  logic _vpu_vector_unit__rmsnorm_accumulate_rdy;
  logic _vpu_vector_unit__rmsnorm_accumulate_rden_export_class;
  logic _vpu_vector_unit__rmsnorm_get_sum_rden;
  logic _vpu_vector_unit__rmsnorm_get_sum_rdy_export_class;
  logic _vpu_vector_unit__rmsnorm_get_sum_empty;
  logic _vpu_vector_unit__rmsnorm_get_sum_valid_export_class;
  logic _vpu_vector_unit__rmsnorm_get_sum_valid;
  logic _vpu_vector_unit__rmsnorm_get_sum_empty_export_class;
  logic [31:0] _vpu_vector_unit__rmsnorm_get_sum_result;
  logic _vpu_vector_unit__rmsnorm_get_sum_rdy;
  logic _vpu_vector_unit__rmsnorm_get_sum_rden_export_class;
  logic _vpu_vector_unit__rmsnorm_reset_rden;
  logic _vpu_vector_unit__rmsnorm_reset_rdy_export_class;
  logic _vpu_vector_unit__rmsnorm_reset_empty;
  logic _vpu_vector_unit__rmsnorm_reset_valid_export_class;
  logic _vpu_vector_unit__rmsnorm_reset_valid;
  logic _vpu_vector_unit__rmsnorm_reset_empty_export_class;
  logic _vpu_vector_unit__rmsnorm_reset_rdy;
  logic _vpu_vector_unit__rmsnorm_reset_rden_export_class;
  logic _vpu_vector_unit__set_gamma_pre_attn_rden;
  logic _vpu_vector_unit__set_gamma_pre_attn_rdy_export_class;
  logic [15:0] _vpu_vector_unit__set_gamma_pre_attn_index;
  logic [15:0] _vpu_vector_unit__set_gamma_pre_attn_value;
  logic _vpu_vector_unit__set_gamma_pre_attn_empty;
  logic _vpu_vector_unit__set_gamma_pre_attn_valid_export_class;
  logic _vpu_vector_unit__set_gamma_pre_attn_valid;
  logic _vpu_vector_unit__set_gamma_pre_attn_empty_export_class;
  logic _vpu_vector_unit__set_gamma_pre_attn_rdy;
  logic _vpu_vector_unit__set_gamma_pre_attn_rden_export_class;
  logic _vpu_vector_unit__set_gamma_pre_mlp_rden;
  logic _vpu_vector_unit__set_gamma_pre_mlp_rdy_export_class;
  logic [15:0] _vpu_vector_unit__set_gamma_pre_mlp_index;
  logic [15:0] _vpu_vector_unit__set_gamma_pre_mlp_value;
  logic _vpu_vector_unit__set_gamma_pre_mlp_empty;
  logic _vpu_vector_unit__set_gamma_pre_mlp_valid_export_class;
  logic _vpu_vector_unit__set_gamma_pre_mlp_valid;
  logic _vpu_vector_unit__set_gamma_pre_mlp_empty_export_class;
  logic _vpu_vector_unit__set_gamma_pre_mlp_rdy;
  logic _vpu_vector_unit__set_gamma_pre_mlp_rden_export_class;
  logic _vpu_vector_unit__set_rsqrt_lut_rden;
  logic _vpu_vector_unit__set_rsqrt_lut_rdy_export_class;
  logic [7:0] _vpu_vector_unit__set_rsqrt_lut_index;
  logic [15:0] _vpu_vector_unit__set_rsqrt_lut_value;
  logic _vpu_vector_unit__set_rsqrt_lut_empty;
  logic _vpu_vector_unit__set_rsqrt_lut_valid_export_class;
  logic _vpu_vector_unit__set_rsqrt_lut_valid;
  logic _vpu_vector_unit__set_rsqrt_lut_empty_export_class;
  logic _vpu_vector_unit__set_rsqrt_lut_rdy;
  logic _vpu_vector_unit__set_rsqrt_lut_rden_export_class;
  logic _vpu_vector_unit__set_sigmoid_lut_rden;
  logic _vpu_vector_unit__set_sigmoid_lut_rdy_export_class;
  logic [7:0] _vpu_vector_unit__set_sigmoid_lut_index;
  logic [15:0] _vpu_vector_unit__set_sigmoid_lut_value;
  logic _vpu_vector_unit__set_sigmoid_lut_empty;
  logic _vpu_vector_unit__set_sigmoid_lut_valid_export_class;
  logic _vpu_vector_unit__set_sigmoid_lut_valid;
  logic _vpu_vector_unit__set_sigmoid_lut_empty_export_class;
  logic _vpu_vector_unit__set_sigmoid_lut_rdy;
  logic _vpu_vector_unit__set_sigmoid_lut_rden_export_class;
  logic _vpu_vector_unit__swiglu_compute_rden;
  logic _vpu_vector_unit__swiglu_compute_rdy_export_class;
  logic [15:0] _vpu_vector_unit__swiglu_compute_gate_bf16;
  logic [15:0] _vpu_vector_unit__swiglu_compute_up_bf16;
  logic _vpu_vector_unit__swiglu_compute_empty;
  logic _vpu_vector_unit__swiglu_compute_valid_export_class;
  logic _vpu_vector_unit__swiglu_compute_valid;
  logic _vpu_vector_unit__swiglu_compute_empty_export_class;
  logic [15:0] _vpu_vector_unit__swiglu_compute_result;
  logic _vpu_vector_unit__swiglu_compute_rdy;
  logic _vpu_vector_unit__swiglu_compute_rden_export_class;
  logic _vpu_vector_unit__residual_add_rden;
  logic _vpu_vector_unit__residual_add_rdy_export_class;
  logic [15:0] _vpu_vector_unit__residual_add_a_bf16;
  logic [15:0] _vpu_vector_unit__residual_add_b_bf16;
  logic _vpu_vector_unit__residual_add_empty;
  logic _vpu_vector_unit__residual_add_valid_export_class;
  logic _vpu_vector_unit__residual_add_valid;
  logic _vpu_vector_unit__residual_add_empty_export_class;
  logic [15:0] _vpu_vector_unit__residual_add_result;
  logic _vpu_vector_unit__residual_add_rdy;
  logic _vpu_vector_unit__residual_add_rden_export_class;
  vector_unit _vpu__vector_unit_inst
  (
      .clk(clk),
      .rst(reg_rst_delayed[16]),
      .rst_and_startup_done_out(_vpu__vector_unit_rst_and_startup_done_out),
      .stall_rate_in(stall_rate_in),
      .stall_rate_valid_in(stall_rate_valid_in),
      .stall_rate_supported_out(),
      .dequantize_rdy_out(),
      .dequantize_valid_in(1'b0),
      .dequantize_accum_in('0),
      .dequantize_super_scale_bf16_in('0),
      .dequantize_sub_scale_in('0),
      .dequantize_empty_out(),
      .dequantize_result_out(),
      .dequantize_rden_in(1'b0),
      .get_gamma_pre_attn_rdy_out(),
      .get_gamma_pre_attn_valid_in(1'b0),
      .get_gamma_pre_attn_index_in('0),
      .get_gamma_pre_attn_empty_out(),
      .get_gamma_pre_attn_result_out(),
      .get_gamma_pre_attn_rden_in(1'b0),
      .get_gamma_pre_mlp_rdy_out(),
      .get_gamma_pre_mlp_valid_in(1'b0),
      .get_gamma_pre_mlp_index_in('0),
      .get_gamma_pre_mlp_empty_out(),
      .get_gamma_pre_mlp_result_out(),
      .get_gamma_pre_mlp_rden_in(1'b0),
      .lookup_rsqrt_rdy_out(),
      .lookup_rsqrt_valid_in(1'b0),
      .lookup_rsqrt_index_in('0),
      .lookup_rsqrt_empty_out(),
      .lookup_rsqrt_result_out(),
      .lookup_rsqrt_rden_in(1'b0),
      .rmsnorm_accumulate_rdy_out(_vpu_vector_unit__rmsnorm_accumulate_rdy_export_class),
      .rmsnorm_accumulate_x_bf16_in(_vpu_vector_unit__rmsnorm_accumulate_x_bf16),
      .rmsnorm_accumulate_valid_in(_vpu_vector_unit__rmsnorm_accumulate_valid_export_class),
      .rmsnorm_accumulate_empty_out(_vpu_vector_unit__rmsnorm_accumulate_empty_export_class),
      .rmsnorm_accumulate_rden_in(_vpu_vector_unit__rmsnorm_accumulate_rden_export_class),
      .rmsnorm_get_sum_rdy_out(_vpu_vector_unit__rmsnorm_get_sum_rdy_export_class),
      .rmsnorm_get_sum_valid_in(_vpu_vector_unit__rmsnorm_get_sum_valid_export_class),
      .rmsnorm_get_sum_empty_out(_vpu_vector_unit__rmsnorm_get_sum_empty_export_class),
      .rmsnorm_get_sum_result_out(_vpu_vector_unit__rmsnorm_get_sum_result),
      .rmsnorm_get_sum_rden_in(_vpu_vector_unit__rmsnorm_get_sum_rden_export_class),
      .rmsnorm_reset_rdy_out(_vpu_vector_unit__rmsnorm_reset_rdy_export_class),
      .rmsnorm_reset_valid_in(_vpu_vector_unit__rmsnorm_reset_valid_export_class),
      .rmsnorm_reset_empty_out(_vpu_vector_unit__rmsnorm_reset_empty_export_class),
      .rmsnorm_reset_rden_in(_vpu_vector_unit__rmsnorm_reset_rden_export_class),
      .set_gamma_pre_attn_rdy_out(_vpu_vector_unit__set_gamma_pre_attn_rdy_export_class),
      .set_gamma_pre_attn_index_in(_vpu_vector_unit__set_gamma_pre_attn_index),
      .set_gamma_pre_attn_value_in(_vpu_vector_unit__set_gamma_pre_attn_value),
      .set_gamma_pre_attn_valid_in(_vpu_vector_unit__set_gamma_pre_attn_valid_export_class),
      .set_gamma_pre_attn_empty_out(_vpu_vector_unit__set_gamma_pre_attn_empty_export_class),
      .set_gamma_pre_attn_rden_in(_vpu_vector_unit__set_gamma_pre_attn_rden_export_class),
      .set_gamma_pre_mlp_rdy_out(_vpu_vector_unit__set_gamma_pre_mlp_rdy_export_class),
      .set_gamma_pre_mlp_index_in(_vpu_vector_unit__set_gamma_pre_mlp_index),
      .set_gamma_pre_mlp_value_in(_vpu_vector_unit__set_gamma_pre_mlp_value),
      .set_gamma_pre_mlp_valid_in(_vpu_vector_unit__set_gamma_pre_mlp_valid_export_class),
      .set_gamma_pre_mlp_empty_out(_vpu_vector_unit__set_gamma_pre_mlp_empty_export_class),
      .set_gamma_pre_mlp_rden_in(_vpu_vector_unit__set_gamma_pre_mlp_rden_export_class),
      .set_rsqrt_lut_rdy_out(_vpu_vector_unit__set_rsqrt_lut_rdy_export_class),
      .set_rsqrt_lut_index_in(_vpu_vector_unit__set_rsqrt_lut_index),
      .set_rsqrt_lut_value_in(_vpu_vector_unit__set_rsqrt_lut_value),
      .set_rsqrt_lut_valid_in(_vpu_vector_unit__set_rsqrt_lut_valid_export_class),
      .set_rsqrt_lut_empty_out(_vpu_vector_unit__set_rsqrt_lut_empty_export_class),
      .set_rsqrt_lut_rden_in(_vpu_vector_unit__set_rsqrt_lut_rden_export_class),
      .set_sigmoid_lut_rdy_out(_vpu_vector_unit__set_sigmoid_lut_rdy_export_class),
      .set_sigmoid_lut_index_in(_vpu_vector_unit__set_sigmoid_lut_index),
      .set_sigmoid_lut_value_in(_vpu_vector_unit__set_sigmoid_lut_value),
      .set_sigmoid_lut_valid_in(_vpu_vector_unit__set_sigmoid_lut_valid_export_class),
      .set_sigmoid_lut_empty_out(_vpu_vector_unit__set_sigmoid_lut_empty_export_class),
      .set_sigmoid_lut_rden_in(_vpu_vector_unit__set_sigmoid_lut_rden_export_class),
      .swiglu_compute_rdy_out(_vpu_vector_unit__swiglu_compute_rdy_export_class),
      .swiglu_compute_gate_bf16_in(_vpu_vector_unit__swiglu_compute_gate_bf16),
      .swiglu_compute_up_bf16_in(_vpu_vector_unit__swiglu_compute_up_bf16),
      .swiglu_compute_valid_in(_vpu_vector_unit__swiglu_compute_valid_export_class),
      .swiglu_compute_empty_out(_vpu_vector_unit__swiglu_compute_empty_export_class),
      .swiglu_compute_result_out(_vpu_vector_unit__swiglu_compute_result),
      .swiglu_compute_rden_in(_vpu_vector_unit__swiglu_compute_rden_export_class),
      .residual_add_rdy_out(_vpu_vector_unit__residual_add_rdy_export_class),
      .residual_add_a_bf16_in(_vpu_vector_unit__residual_add_a_bf16),
      .residual_add_b_bf16_in(_vpu_vector_unit__residual_add_b_bf16),
      .residual_add_valid_in(_vpu_vector_unit__residual_add_valid_export_class),
      .residual_add_empty_out(_vpu_vector_unit__residual_add_empty_export_class),
      .residual_add_result_out(_vpu_vector_unit__residual_add_result),
      .residual_add_rden_in(_vpu_vector_unit__residual_add_rden_export_class)
  );
  assign _vpu_vector_unit__rmsnorm_accumulate_rden = _vpu_vector_unit__rmsnorm_accumulate_rdy_export_class & ~_vpu_vector_unit__rmsnorm_accumulate_empty;
  assign _vpu_vector_unit__rmsnorm_accumulate_valid_export_class = _vpu_vector_unit__rmsnorm_accumulate_rden;
  assign _vpu_vector_unit__rmsnorm_accumulate_valid = ~_vpu_vector_unit__rmsnorm_accumulate_empty_export_class;
  assign _vpu_vector_unit__rmsnorm_accumulate_rden_export_class = _vpu_vector_unit__rmsnorm_accumulate_valid & _vpu_vector_unit__rmsnorm_accumulate_rdy;
  assign _vpu_vector_unit__rmsnorm_get_sum_rden = _vpu_vector_unit__rmsnorm_get_sum_rdy_export_class & ~_vpu_vector_unit__rmsnorm_get_sum_empty;
  assign _vpu_vector_unit__rmsnorm_get_sum_valid_export_class = _vpu_vector_unit__rmsnorm_get_sum_rden;
  assign _vpu_vector_unit__rmsnorm_get_sum_valid = ~_vpu_vector_unit__rmsnorm_get_sum_empty_export_class;
  assign _vpu_vector_unit__rmsnorm_get_sum_rden_export_class = _vpu_vector_unit__rmsnorm_get_sum_valid & _vpu_vector_unit__rmsnorm_get_sum_rdy;
  assign _vpu_vector_unit__rmsnorm_reset_rden = _vpu_vector_unit__rmsnorm_reset_rdy_export_class & ~_vpu_vector_unit__rmsnorm_reset_empty;
  assign _vpu_vector_unit__rmsnorm_reset_valid_export_class = _vpu_vector_unit__rmsnorm_reset_rden;
  assign _vpu_vector_unit__rmsnorm_reset_valid = ~_vpu_vector_unit__rmsnorm_reset_empty_export_class;
  assign _vpu_vector_unit__rmsnorm_reset_rden_export_class = _vpu_vector_unit__rmsnorm_reset_valid & _vpu_vector_unit__rmsnorm_reset_rdy;
  assign _vpu_vector_unit__set_gamma_pre_attn_rden = _vpu_vector_unit__set_gamma_pre_attn_rdy_export_class & ~_vpu_vector_unit__set_gamma_pre_attn_empty;
  assign _vpu_vector_unit__set_gamma_pre_attn_valid_export_class = _vpu_vector_unit__set_gamma_pre_attn_rden;
  assign _vpu_vector_unit__set_gamma_pre_attn_valid = ~_vpu_vector_unit__set_gamma_pre_attn_empty_export_class;
  assign _vpu_vector_unit__set_gamma_pre_attn_rden_export_class = _vpu_vector_unit__set_gamma_pre_attn_valid & _vpu_vector_unit__set_gamma_pre_attn_rdy;
  assign _vpu_vector_unit__set_gamma_pre_mlp_rden = _vpu_vector_unit__set_gamma_pre_mlp_rdy_export_class & ~_vpu_vector_unit__set_gamma_pre_mlp_empty;
  assign _vpu_vector_unit__set_gamma_pre_mlp_valid_export_class = _vpu_vector_unit__set_gamma_pre_mlp_rden;
  assign _vpu_vector_unit__set_gamma_pre_mlp_valid = ~_vpu_vector_unit__set_gamma_pre_mlp_empty_export_class;
  assign _vpu_vector_unit__set_gamma_pre_mlp_rden_export_class = _vpu_vector_unit__set_gamma_pre_mlp_valid & _vpu_vector_unit__set_gamma_pre_mlp_rdy;
  assign _vpu_vector_unit__set_rsqrt_lut_rden = _vpu_vector_unit__set_rsqrt_lut_rdy_export_class & ~_vpu_vector_unit__set_rsqrt_lut_empty;
  assign _vpu_vector_unit__set_rsqrt_lut_valid_export_class = _vpu_vector_unit__set_rsqrt_lut_rden;
  assign _vpu_vector_unit__set_rsqrt_lut_valid = ~_vpu_vector_unit__set_rsqrt_lut_empty_export_class;
  assign _vpu_vector_unit__set_rsqrt_lut_rden_export_class = _vpu_vector_unit__set_rsqrt_lut_valid & _vpu_vector_unit__set_rsqrt_lut_rdy;
  assign _vpu_vector_unit__set_sigmoid_lut_rden = _vpu_vector_unit__set_sigmoid_lut_rdy_export_class & ~_vpu_vector_unit__set_sigmoid_lut_empty;
  assign _vpu_vector_unit__set_sigmoid_lut_valid_export_class = _vpu_vector_unit__set_sigmoid_lut_rden;
  assign _vpu_vector_unit__set_sigmoid_lut_valid = ~_vpu_vector_unit__set_sigmoid_lut_empty_export_class;
  assign _vpu_vector_unit__set_sigmoid_lut_rden_export_class = _vpu_vector_unit__set_sigmoid_lut_valid & _vpu_vector_unit__set_sigmoid_lut_rdy;
  assign _vpu_vector_unit__swiglu_compute_rden = _vpu_vector_unit__swiglu_compute_rdy_export_class & ~_vpu_vector_unit__swiglu_compute_empty;
  assign _vpu_vector_unit__swiglu_compute_valid_export_class = _vpu_vector_unit__swiglu_compute_rden;
  assign _vpu_vector_unit__swiglu_compute_valid = ~_vpu_vector_unit__swiglu_compute_empty_export_class;
  assign _vpu_vector_unit__swiglu_compute_rden_export_class = _vpu_vector_unit__swiglu_compute_valid & _vpu_vector_unit__swiglu_compute_rdy;
  assign _vpu_vector_unit__residual_add_rden = _vpu_vector_unit__residual_add_rdy_export_class & ~_vpu_vector_unit__residual_add_empty;
  assign _vpu_vector_unit__residual_add_valid_export_class = _vpu_vector_unit__residual_add_rden;
  assign _vpu_vector_unit__residual_add_valid = ~_vpu_vector_unit__residual_add_empty_export_class;
  assign _vpu_vector_unit__residual_add_rden_export_class = _vpu_vector_unit__residual_add_valid & _vpu_vector_unit__residual_add_rdy;
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

  logic has_startup_completed_delayed_10;

  logic has_startup_completed_delayed_11;

  logic has_startup_completed_delayed_12;

  logic has_startup_completed_delayed_13;

  logic has_startup_completed_delayed_14;

  logic has_startup_completed_delayed_15;

  logic has_startup_completed_delayed_16;

  logic has_startup_completed_delayed_17;

  logic has_startup_completed_delayed_18;

  logic has_startup_completed_delayed_19;

  logic has_startup_completed_delayed_20;

  logic has_startup_completed_delayed_21;

  logic has_startup_completed_delayed_22;

  logic has_startup_completed_delayed_23;

  logic has_startup_completed_delayed_24;

  logic has_startup_completed_delayed_25;

  logic has_startup_completed_delayed_26;

  logic has_startup_completed_delayed_27;

  logic has_startup_completed_delayed_28;

  logic has_startup_completed_delayed_29;

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
      logic [255:0] data_in;
      logic [255:0] data_out;
      logic overflow;
      logic underflow;
  } fifo_data_2;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [255:0] data_in;
      logic [255:0] data_out;
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
      logic overflow;
      logic underflow;
  } fifo_data_5;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
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
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [31:0] data_in;
      logic [31:0] data_out;
      logic overflow;
      logic underflow;
  } fifo_data_9;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic overflow;
      logic underflow;
  } fifo_data_10;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [15:0] data_in;
      logic [15:0] data_out;
      logic overflow;
      logic underflow;
  } fifo_data_11;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [15:0] data_in;
      logic [15:0] data_out;
      logic overflow;
      logic underflow;
  } fifo_data_12;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [15:0] data_in;
      logic [15:0] data_out;
      logic overflow;
      logic underflow;
  } fifo_data_13;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [15:0] data_in;
      logic [15:0] data_out;
      logic overflow;
      logic underflow;
  } fifo_data_14;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [258:0] data_in;
      logic [258:0] data_out;
      logic [257:0] encoded_data_in;
      logic [257:0] encoded_data_out;
      logic overflow;
      logic underflow;
  } fifo_data_15;
  assign fifo_data_15.encoded_data_in[1:0] = fifo_data_15.data_in[1:0];
  assign fifo_data_15.encoded_data_in[257:2] = fifo_data_15.data_in[257:2];
  assign fifo_data_15.data_out[1:0] = fifo_data_15.encoded_data_out[1:0];
  assign fifo_data_15.data_out[257:2] = fifo_data_15.encoded_data_out[257:2];
  assign fifo_data_15.data_out[258:258] = 1'h0;
  logic rst_or_not_startup_completed_delayed_0;
  assign rst_or_not_startup_completed_delayed_0 = (reg_rst_delayed[32] | !has_startup_completed_delayed_0);
  wire         fifo_15_forward_cos_Entry_rst__circt =
    rst_or_not_startup_completed_delayed_0;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [258:0] data_in;
      logic [258:0] data_out;
      logic [257:0] encoded_data_in;
      logic [257:0] encoded_data_out;
      logic overflow;
      logic underflow;
  } fifo_data_16;
  assign fifo_data_16.encoded_data_in[1:0] = fifo_data_16.data_in[1:0];
  assign fifo_data_16.encoded_data_in[257:2] = fifo_data_16.data_in[257:2];
  assign fifo_data_16.data_out[1:0] = fifo_data_16.encoded_data_out[1:0];
  assign fifo_data_16.data_out[257:2] = fifo_data_16.encoded_data_out[257:2];
  assign fifo_data_16.data_out[258:258] = 1'h0;
  logic rst_or_not_startup_completed_delayed_1;
  assign rst_or_not_startup_completed_delayed_1 = (reg_rst_delayed[33] | !has_startup_completed_delayed_1);
  wire         fifo_16_forward_sin_Entry_rst__circt =
    rst_or_not_startup_completed_delayed_1;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [2:0] data_in;
      logic [2:0] data_out;
      logic [1:0] encoded_data_in;
      logic [1:0] encoded_data_out;
      logic overflow;
      logic underflow;
  } fifo_data_17;
  assign fifo_data_17.encoded_data_in[1:0] = fifo_data_17.data_in[1:0];
  assign fifo_data_17.data_out[1:0] = fifo_data_17.encoded_data_out[1:0];
  assign fifo_data_17.data_out[2:2] = 1'h0;
  logic rst_or_not_startup_completed_delayed_2;
  assign rst_or_not_startup_completed_delayed_2 = (reg_rst_delayed[34] | !has_startup_completed_delayed_2);
  wire         fifo_17_read_cos_forwarded_Entry_rst__circt =
    rst_or_not_startup_completed_delayed_2;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [2:0] data_in;
      logic [2:0] data_out;
      logic [1:0] encoded_data_in;
      logic [1:0] encoded_data_out;
      logic overflow;
      logic underflow;
  } fifo_data_18;
  assign fifo_data_18.encoded_data_in[1:0] = fifo_data_18.data_in[1:0];
  assign fifo_data_18.data_out[1:0] = fifo_data_18.encoded_data_out[1:0];
  assign fifo_data_18.data_out[2:2] = 1'h0;
  logic rst_or_not_startup_completed_delayed_3;
  assign rst_or_not_startup_completed_delayed_3 = (reg_rst_delayed[35] | !has_startup_completed_delayed_3);
  wire         fifo_18_read_sin_forwarded_Entry_rst__circt =
    rst_or_not_startup_completed_delayed_3;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [64:0] data_in;
      logic [64:0] data_out;
      logic [63:0] encoded_data_in;
      logic [63:0] encoded_data_out;
      logic overflow;
      logic underflow;
  } fifo_data_19;
  assign fifo_data_19.encoded_data_in[15:0] = fifo_data_19.data_in[15:0];
  assign fifo_data_19.encoded_data_in[31:16] = fifo_data_19.data_in[31:16];
  assign fifo_data_19.encoded_data_in[47:32] = fifo_data_19.data_in[47:32];
  assign fifo_data_19.encoded_data_in[63:48] = fifo_data_19.data_in[63:48];
  assign fifo_data_19.data_out[15:0] = fifo_data_19.encoded_data_out[15:0];
  assign fifo_data_19.data_out[31:16] = fifo_data_19.encoded_data_out[31:16];
  assign fifo_data_19.data_out[47:32] = fifo_data_19.encoded_data_out[47:32];
  assign fifo_data_19.data_out[63:48] = fifo_data_19.encoded_data_out[63:48];
  assign fifo_data_19.data_out[64:64] = 1'h0;
  logic rst_or_not_startup_completed_delayed_4;
  assign rst_or_not_startup_completed_delayed_4 = (reg_rst_delayed[36] | !has_startup_completed_delayed_4);
  wire         fifo_19_rotate_even_Entry_rst__circt =
    rst_or_not_startup_completed_delayed_4;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [64:0] data_in;
      logic [64:0] data_out;
      logic [63:0] encoded_data_in;
      logic [63:0] encoded_data_out;
      logic overflow;
      logic underflow;
  } fifo_data_20;
  assign fifo_data_20.encoded_data_in[15:0] = fifo_data_20.data_in[15:0];
  assign fifo_data_20.encoded_data_in[31:16] = fifo_data_20.data_in[31:16];
  assign fifo_data_20.encoded_data_in[47:32] = fifo_data_20.data_in[47:32];
  assign fifo_data_20.encoded_data_in[63:48] = fifo_data_20.data_in[63:48];
  assign fifo_data_20.data_out[15:0] = fifo_data_20.encoded_data_out[15:0];
  assign fifo_data_20.data_out[31:16] = fifo_data_20.encoded_data_out[31:16];
  assign fifo_data_20.data_out[47:32] = fifo_data_20.encoded_data_out[47:32];
  assign fifo_data_20.data_out[63:48] = fifo_data_20.encoded_data_out[63:48];
  assign fifo_data_20.data_out[64:64] = 1'h0;
  logic rst_or_not_startup_completed_delayed_5;
  assign rst_or_not_startup_completed_delayed_5 = (reg_rst_delayed[37] | !has_startup_completed_delayed_5);
  wire         fifo_20_rotate_odd_Entry_rst__circt =
    rst_or_not_startup_completed_delayed_5;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [16:0] data_in;
      logic [16:0] data_out;
      logic [15:0] encoded_data_in;
      logic [15:0] encoded_data_out;
      logic overflow;
      logic underflow;
  } fifo_data_21;
  assign fifo_data_21.encoded_data_in[15:0] = fifo_data_21.data_in[15:0];
  assign fifo_data_21.data_out[15:0] = fifo_data_21.encoded_data_out[15:0];
  assign fifo_data_21.data_out[16:16] = 1'h0;
  logic rst_or_not_startup_completed_delayed_6;
  assign rst_or_not_startup_completed_delayed_6 = (reg_rst_delayed[38] | !has_startup_completed_delayed_6);
  wire         fifo_21_rmsnorm_accumulate_Entry_rst__circt =
    rst_or_not_startup_completed_delayed_6;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [0:0] data_in;
      logic [0:0] data_out;
      logic overflow;
      logic underflow;
  } fifo_data_22;
  assign fifo_data_22.data_out[0:0] = 1'h0;
  logic rst_or_not_startup_completed_delayed_7;
  assign rst_or_not_startup_completed_delayed_7 = (reg_rst_delayed[39] | !has_startup_completed_delayed_7);
  wire         fifo_22_rmsnorm_get_sum_Entry_rst__circt =
    rst_or_not_startup_completed_delayed_7;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [0:0] data_in;
      logic [0:0] data_out;
      logic overflow;
      logic underflow;
  } fifo_data_23;
  assign fifo_data_23.data_out[0:0] = 1'h0;
  logic rst_or_not_startup_completed_delayed_8;
  assign rst_or_not_startup_completed_delayed_8 = (reg_rst_delayed[40] | !has_startup_completed_delayed_8);
  wire         fifo_23_rmsnorm_reset_Entry_rst__circt =
    rst_or_not_startup_completed_delayed_8;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [32:0] data_in;
      logic [32:0] data_out;
      logic [31:0] encoded_data_in;
      logic [31:0] encoded_data_out;
      logic overflow;
      logic underflow;
  } fifo_data_24;
  assign fifo_data_24.encoded_data_in[15:0] = fifo_data_24.data_in[15:0];
  assign fifo_data_24.encoded_data_in[31:16] = fifo_data_24.data_in[31:16];
  assign fifo_data_24.data_out[15:0] = fifo_data_24.encoded_data_out[15:0];
  assign fifo_data_24.data_out[31:16] = fifo_data_24.encoded_data_out[31:16];
  assign fifo_data_24.data_out[32:32] = 1'h0;
  logic rst_or_not_startup_completed_delayed_9;
  assign rst_or_not_startup_completed_delayed_9 = (reg_rst_delayed[41] | !has_startup_completed_delayed_9);
  wire         fifo_24_set_gamma_pre_attn_Entry_rst__circt =
    rst_or_not_startup_completed_delayed_9;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [32:0] data_in;
      logic [32:0] data_out;
      logic [31:0] encoded_data_in;
      logic [31:0] encoded_data_out;
      logic overflow;
      logic underflow;
  } fifo_data_25;
  assign fifo_data_25.encoded_data_in[15:0] = fifo_data_25.data_in[15:0];
  assign fifo_data_25.encoded_data_in[31:16] = fifo_data_25.data_in[31:16];
  assign fifo_data_25.data_out[15:0] = fifo_data_25.encoded_data_out[15:0];
  assign fifo_data_25.data_out[31:16] = fifo_data_25.encoded_data_out[31:16];
  assign fifo_data_25.data_out[32:32] = 1'h0;
  logic rst_or_not_startup_completed_delayed_10;
  assign rst_or_not_startup_completed_delayed_10 = (reg_rst_delayed[42] | !has_startup_completed_delayed_10);
  wire         fifo_25_set_gamma_pre_mlp_Entry_rst__circt =
    rst_or_not_startup_completed_delayed_10;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [24:0] data_in;
      logic [24:0] data_out;
      logic [23:0] encoded_data_in;
      logic [23:0] encoded_data_out;
      logic overflow;
      logic underflow;
  } fifo_data_26;
  assign fifo_data_26.encoded_data_in[7:0] = fifo_data_26.data_in[7:0];
  assign fifo_data_26.encoded_data_in[23:8] = fifo_data_26.data_in[23:8];
  assign fifo_data_26.data_out[7:0] = fifo_data_26.encoded_data_out[7:0];
  assign fifo_data_26.data_out[23:8] = fifo_data_26.encoded_data_out[23:8];
  assign fifo_data_26.data_out[24:24] = 1'h0;
  logic rst_or_not_startup_completed_delayed_11;
  assign rst_or_not_startup_completed_delayed_11 = (reg_rst_delayed[43] | !has_startup_completed_delayed_11);
  wire         fifo_26_set_rsqrt_lut_Entry_rst__circt =
    rst_or_not_startup_completed_delayed_11;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [24:0] data_in;
      logic [24:0] data_out;
      logic [23:0] encoded_data_in;
      logic [23:0] encoded_data_out;
      logic overflow;
      logic underflow;
  } fifo_data_27;
  assign fifo_data_27.encoded_data_in[7:0] = fifo_data_27.data_in[7:0];
  assign fifo_data_27.encoded_data_in[23:8] = fifo_data_27.data_in[23:8];
  assign fifo_data_27.data_out[7:0] = fifo_data_27.encoded_data_out[7:0];
  assign fifo_data_27.data_out[23:8] = fifo_data_27.encoded_data_out[23:8];
  assign fifo_data_27.data_out[24:24] = 1'h0;
  logic rst_or_not_startup_completed_delayed_12;
  assign rst_or_not_startup_completed_delayed_12 = (reg_rst_delayed[44] | !has_startup_completed_delayed_12);
  wire         fifo_27_set_sigmoid_lut_Entry_rst__circt =
    rst_or_not_startup_completed_delayed_12;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [32:0] data_in;
      logic [32:0] data_out;
      logic [31:0] encoded_data_in;
      logic [31:0] encoded_data_out;
      logic overflow;
      logic underflow;
  } fifo_data_28;
  assign fifo_data_28.encoded_data_in[15:0] = fifo_data_28.data_in[15:0];
  assign fifo_data_28.encoded_data_in[31:16] = fifo_data_28.data_in[31:16];
  assign fifo_data_28.data_out[15:0] = fifo_data_28.encoded_data_out[15:0];
  assign fifo_data_28.data_out[31:16] = fifo_data_28.encoded_data_out[31:16];
  assign fifo_data_28.data_out[32:32] = 1'h0;
  logic rst_or_not_startup_completed_delayed_13;
  assign rst_or_not_startup_completed_delayed_13 = (reg_rst_delayed[45] | !has_startup_completed_delayed_13);
  wire         fifo_28_swiglu_compute_Entry_rst__circt =
    rst_or_not_startup_completed_delayed_13;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [32:0] data_in;
      logic [32:0] data_out;
      logic [31:0] encoded_data_in;
      logic [31:0] encoded_data_out;
      logic overflow;
      logic underflow;
  } fifo_data_29;
  assign fifo_data_29.encoded_data_in[15:0] = fifo_data_29.data_in[15:0];
  assign fifo_data_29.encoded_data_in[31:16] = fifo_data_29.data_in[31:16];
  assign fifo_data_29.data_out[15:0] = fifo_data_29.encoded_data_out[15:0];
  assign fifo_data_29.data_out[31:16] = fifo_data_29.encoded_data_out[31:16];
  assign fifo_data_29.data_out[32:32] = 1'h0;
  logic rst_or_not_startup_completed_delayed_14;
  assign rst_or_not_startup_completed_delayed_14 = (reg_rst_delayed[46] | !has_startup_completed_delayed_14);
  wire         fifo_29_residual_add_Entry_rst__circt =
    rst_or_not_startup_completed_delayed_14;

  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [257:0] data;
      logic underflow;
  } passthrough_data_30;
  assign passthrough_data_30.underflow = 1'b0;
  assign passthrough_data_30.rdy_ext = passthrough_data_30.rdy_int & !(!has_startup_completed_delayed_15);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic underflow;
  } passthrough_data_31;
  assign passthrough_data_31.underflow = 1'b0;
  assign passthrough_data_31.rdy_ext = passthrough_data_31.rdy_int;
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [257:0] data;
      logic underflow;
  } passthrough_data_32;
  assign passthrough_data_32.underflow = 1'b0;
  assign passthrough_data_32.rdy_ext = passthrough_data_32.rdy_int & !(!has_startup_completed_delayed_16);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic underflow;
  } passthrough_data_33;
  assign passthrough_data_33.underflow = 1'b0;
  assign passthrough_data_33.rdy_ext = passthrough_data_33.rdy_int;
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [1:0] data;
      logic underflow;
  } passthrough_data_34;
  assign passthrough_data_34.underflow = 1'b0;
  assign passthrough_data_34.rdy_ext = passthrough_data_34.rdy_int & !(!has_startup_completed_delayed_17);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [255:0] data;
      logic underflow;
  } passthrough_data_35;
  assign passthrough_data_35.underflow = 1'b0;
  assign passthrough_data_35.rdy_ext = passthrough_data_35.rdy_int;
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [1:0] data;
      logic underflow;
  } passthrough_data_36;
  assign passthrough_data_36.underflow = 1'b0;
  assign passthrough_data_36.rdy_ext = passthrough_data_36.rdy_int & !(!has_startup_completed_delayed_18);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [255:0] data;
      logic underflow;
  } passthrough_data_37;
  assign passthrough_data_37.underflow = 1'b0;
  assign passthrough_data_37.rdy_ext = passthrough_data_37.rdy_int;
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [31:0] data;
      logic underflow;
  } passthrough_data_38;
  assign passthrough_data_38.underflow = 1'b0;
  assign passthrough_data_38.rdy_ext = passthrough_data_38.rdy_int & !(!has_startup_completed_delayed_19);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic underflow;
  } passthrough_data_39;
  assign passthrough_data_39.underflow = 1'b0;
  assign passthrough_data_39.rdy_ext = passthrough_data_39.rdy_int;
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [31:0] data;
      logic underflow;
  } passthrough_data_40;
  assign passthrough_data_40.underflow = 1'b0;
  assign passthrough_data_40.rdy_ext = passthrough_data_40.rdy_int & !(!has_startup_completed_delayed_20);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic underflow;
  } passthrough_data_41;
  assign passthrough_data_41.underflow = 1'b0;
  assign passthrough_data_41.rdy_ext = passthrough_data_41.rdy_int;
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [23:0] data;
      logic underflow;
  } passthrough_data_42;
  assign passthrough_data_42.underflow = 1'b0;
  assign passthrough_data_42.rdy_ext = passthrough_data_42.rdy_int & !(!has_startup_completed_delayed_21);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic underflow;
  } passthrough_data_43;
  assign passthrough_data_43.underflow = 1'b0;
  assign passthrough_data_43.rdy_ext = passthrough_data_43.rdy_int;
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [23:0] data;
      logic underflow;
  } passthrough_data_44;
  assign passthrough_data_44.underflow = 1'b0;
  assign passthrough_data_44.rdy_ext = passthrough_data_44.rdy_int & !(!has_startup_completed_delayed_22);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic underflow;
  } passthrough_data_45;
  assign passthrough_data_45.underflow = 1'b0;
  assign passthrough_data_45.rdy_ext = passthrough_data_45.rdy_int;
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic underflow;
  } passthrough_data_46;
  assign passthrough_data_46.underflow = 1'b0;
  assign passthrough_data_46.rdy_ext = passthrough_data_46.rdy_int & !(!has_startup_completed_delayed_23);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic underflow;
  } passthrough_data_47;
  assign passthrough_data_47.underflow = 1'b0;
  assign passthrough_data_47.rdy_ext = passthrough_data_47.rdy_int;
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic underflow;
  } passthrough_data_48;
  assign passthrough_data_48.underflow = 1'b0;
  assign passthrough_data_48.rdy_ext = passthrough_data_48.rdy_int & !(!has_startup_completed_delayed_24);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [31:0] data;
      logic underflow;
  } passthrough_data_49;
  assign passthrough_data_49.underflow = 1'b0;
  assign passthrough_data_49.rdy_ext = passthrough_data_49.rdy_int;
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [15:0] data;
      logic underflow;
  } passthrough_data_50;
  assign passthrough_data_50.underflow = 1'b0;
  assign passthrough_data_50.rdy_ext = passthrough_data_50.rdy_int & !(!has_startup_completed_delayed_25);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic underflow;
  } passthrough_data_51;
  assign passthrough_data_51.underflow = 1'b0;
  assign passthrough_data_51.rdy_ext = passthrough_data_51.rdy_int;
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [31:0] data;
      logic underflow;
  } passthrough_data_52;
  assign passthrough_data_52.underflow = 1'b0;
  assign passthrough_data_52.rdy_ext = passthrough_data_52.rdy_int & !(!has_startup_completed_delayed_26);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [15:0] data;
      logic underflow;
  } passthrough_data_53;
  assign passthrough_data_53.underflow = 1'b0;
  assign passthrough_data_53.rdy_ext = passthrough_data_53.rdy_int;
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [31:0] data;
      logic underflow;
  } passthrough_data_54;
  assign passthrough_data_54.underflow = 1'b0;
  assign passthrough_data_54.rdy_ext = passthrough_data_54.rdy_int & !(!has_startup_completed_delayed_27);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [15:0] data;
      logic underflow;
  } passthrough_data_55;
  assign passthrough_data_55.underflow = 1'b0;
  assign passthrough_data_55.rdy_ext = passthrough_data_55.rdy_int;
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [63:0] data;
      logic underflow;
  } passthrough_data_56;
  assign passthrough_data_56.underflow = 1'b0;
  assign passthrough_data_56.rdy_ext = passthrough_data_56.rdy_int & !(!has_startup_completed_delayed_28);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [15:0] data;
      logic underflow;
  } passthrough_data_57;
  assign passthrough_data_57.underflow = 1'b0;
  assign passthrough_data_57.rdy_ext = passthrough_data_57.rdy_int;
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [63:0] data;
      logic underflow;
  } passthrough_data_58;
  assign passthrough_data_58.underflow = 1'b0;
  assign passthrough_data_58.rdy_ext = passthrough_data_58.rdy_int & !(!has_startup_completed_delayed_29);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [15:0] data;
      logic underflow;
  } passthrough_data_59;
  assign passthrough_data_59.underflow = 1'b0;
  assign passthrough_data_59.rdy_ext = passthrough_data_59.rdy_int;
  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic overflow;
      logic underflow;
  } fifo_data_60;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic overflow;
      logic underflow;
  } fifo_data_62;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [255:0] data_in;
      logic [255:0] data_out;
      logic overflow;
      logic underflow;
  } fifo_data_64;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [255:0] data_in;
      logic [255:0] data_out;
      logic overflow;
      logic underflow;
  } fifo_data_66;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic overflow;
      logic underflow;
  } fifo_data_68;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic overflow;
      logic underflow;
  } fifo_data_70;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic overflow;
      logic underflow;
  } fifo_data_72;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic overflow;
      logic underflow;
  } fifo_data_74;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic overflow;
      logic underflow;
  } fifo_data_76;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [31:0] data_in;
      logic [31:0] data_out;
      logic overflow;
      logic underflow;
  } fifo_data_78;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic overflow;
      logic underflow;
  } fifo_data_80;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [15:0] data_in;
      logic [15:0] data_out;
      logic overflow;
      logic underflow;
  } fifo_data_82;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [15:0] data_in;
      logic [15:0] data_out;
      logic overflow;
      logic underflow;
  } fifo_data_84;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [15:0] data_in;
      logic [15:0] data_out;
      logic overflow;
      logic underflow;
  } fifo_data_86;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [15:0] data_in;
      logic [15:0] data_out;
      logic overflow;
      logic underflow;
  } fifo_data_88;

  pd_fifo_intf #( .DATA_WIDTH(1) ) extern_return_router__rope_rope_apply__forward_cos_input_index_intf();
  pd_fifo_intf #( .DATA_WIDTH(1) ) extern_return_router__rope_rope_apply__forward_cos_input_data_intf();
  pd_fifo_intf #( .DATA_WIDTH(1) ) extern_return_router__rope_rope_apply__forward_cos_switch_output_intfs[1]();
  assign extern_return_router__rope_rope_apply__forward_cos_input_data_intf.valid = _rope_rope_apply__forward_cos_valid;
  assign _rope_rope_apply__forward_cos_rdy = extern_return_router__rope_rope_apply__forward_cos_input_data_intf.ready;
  assign extern_return_router__rope_rope_apply__forward_cos_input_data_intf.data = 0;
  assign extern_return_router__rope_rope_apply__forward_cos_input_index_intf.valid = fifo_data_15.wren;
  assign extern_return_router__rope_rope_apply__forward_cos_input_index_intf.data = fifo_data_15.data_in[258:258];
  KanagawaExternReturnRouter
  #(
      .DUAL_CLOCK(0),
      .LOG_DEPTH(9),
      .INDEX_WIDTH(1),
      .DATA_WIDTH(1),
      .USE_LUTRAM(0),
      .NUM_OUTPUT_PORTS(1),
      .PORT_INDEX_MAP_VALUE_WIDTH(1),
      .PORT_INDEX_MAP_DEPTH(2),
      .PORT_INDEX_MAP({ 1'h1, 1'h1 })
  )
  extern_return_router__rope_rope_apply__forward_cos
  (
      .input_clk(clk),
      .input_rst(reg_rst_delayed[62]),
      .input_index_intf(extern_return_router__rope_rope_apply__forward_cos_input_index_intf),
      .output_clk(clk),
      .output_rst(reg_rst_delayed[62]),
      .input_data_intf(extern_return_router__rope_rope_apply__forward_cos_input_data_intf),
      .output_switch_node_intfs(extern_return_router__rope_rope_apply__forward_cos_switch_output_intfs)
  );
  pd_fifo_intf #( .DATA_WIDTH(1) ) extern_return_router__rope_rope_apply__forward_sin_input_index_intf();
  pd_fifo_intf #( .DATA_WIDTH(1) ) extern_return_router__rope_rope_apply__forward_sin_input_data_intf();
  pd_fifo_intf #( .DATA_WIDTH(1) ) extern_return_router__rope_rope_apply__forward_sin_switch_output_intfs[1]();
  assign extern_return_router__rope_rope_apply__forward_sin_input_data_intf.valid = _rope_rope_apply__forward_sin_valid;
  assign _rope_rope_apply__forward_sin_rdy = extern_return_router__rope_rope_apply__forward_sin_input_data_intf.ready;
  assign extern_return_router__rope_rope_apply__forward_sin_input_data_intf.data = 0;
  assign extern_return_router__rope_rope_apply__forward_sin_input_index_intf.valid = fifo_data_16.wren;
  assign extern_return_router__rope_rope_apply__forward_sin_input_index_intf.data = fifo_data_16.data_in[258:258];
  KanagawaExternReturnRouter
  #(
      .DUAL_CLOCK(0),
      .LOG_DEPTH(9),
      .INDEX_WIDTH(1),
      .DATA_WIDTH(1),
      .USE_LUTRAM(0),
      .NUM_OUTPUT_PORTS(1),
      .PORT_INDEX_MAP_VALUE_WIDTH(1),
      .PORT_INDEX_MAP_DEPTH(2),
      .PORT_INDEX_MAP({ 1'h1, 1'h1 })
  )
  extern_return_router__rope_rope_apply__forward_sin
  (
      .input_clk(clk),
      .input_rst(reg_rst_delayed[63]),
      .input_index_intf(extern_return_router__rope_rope_apply__forward_sin_input_index_intf),
      .output_clk(clk),
      .output_rst(reg_rst_delayed[63]),
      .input_data_intf(extern_return_router__rope_rope_apply__forward_sin_input_data_intf),
      .output_switch_node_intfs(extern_return_router__rope_rope_apply__forward_sin_switch_output_intfs)
  );
  pd_fifo_intf #( .DATA_WIDTH(1) ) extern_return_router__rope_rope_apply__read_cos_forwarded_input_index_intf();
  pd_fifo_intf #( .DATA_WIDTH(256) ) extern_return_router__rope_rope_apply__read_cos_forwarded_input_data_intf();
  pd_fifo_intf #( .DATA_WIDTH(256) ) extern_return_router__rope_rope_apply__read_cos_forwarded_switch_output_intfs[1]();
  assign extern_return_router__rope_rope_apply__read_cos_forwarded_input_data_intf.valid = _rope_rope_apply__read_cos_forwarded_valid;
  assign _rope_rope_apply__read_cos_forwarded_rdy = extern_return_router__rope_rope_apply__read_cos_forwarded_input_data_intf.ready;
  assign extern_return_router__rope_rope_apply__read_cos_forwarded_input_data_intf.data = _rope_rope_apply__read_cos_forwarded_result;
  assign extern_return_router__rope_rope_apply__read_cos_forwarded_input_index_intf.valid = fifo_data_17.wren;
  assign extern_return_router__rope_rope_apply__read_cos_forwarded_input_index_intf.data = fifo_data_17.data_in[2:2];
  KanagawaExternReturnRouter
  #(
      .DUAL_CLOCK(0),
      .LOG_DEPTH(9),
      .INDEX_WIDTH(1),
      .DATA_WIDTH(256),
      .USE_LUTRAM(0),
      .NUM_OUTPUT_PORTS(1),
      .PORT_INDEX_MAP_VALUE_WIDTH(1),
      .PORT_INDEX_MAP_DEPTH(2),
      .PORT_INDEX_MAP({ 1'h1, 1'h1 })
  )
  extern_return_router__rope_rope_apply__read_cos_forwarded
  (
      .input_clk(clk),
      .input_rst(reg_rst_delayed[64]),
      .input_index_intf(extern_return_router__rope_rope_apply__read_cos_forwarded_input_index_intf),
      .output_clk(clk),
      .output_rst(reg_rst_delayed[64]),
      .input_data_intf(extern_return_router__rope_rope_apply__read_cos_forwarded_input_data_intf),
      .output_switch_node_intfs(extern_return_router__rope_rope_apply__read_cos_forwarded_switch_output_intfs)
  );
  pd_fifo_intf #( .DATA_WIDTH(1) ) extern_return_router__rope_rope_apply__read_sin_forwarded_input_index_intf();
  pd_fifo_intf #( .DATA_WIDTH(256) ) extern_return_router__rope_rope_apply__read_sin_forwarded_input_data_intf();
  pd_fifo_intf #( .DATA_WIDTH(256) ) extern_return_router__rope_rope_apply__read_sin_forwarded_switch_output_intfs[1]();
  assign extern_return_router__rope_rope_apply__read_sin_forwarded_input_data_intf.valid = _rope_rope_apply__read_sin_forwarded_valid;
  assign _rope_rope_apply__read_sin_forwarded_rdy = extern_return_router__rope_rope_apply__read_sin_forwarded_input_data_intf.ready;
  assign extern_return_router__rope_rope_apply__read_sin_forwarded_input_data_intf.data = _rope_rope_apply__read_sin_forwarded_result;
  assign extern_return_router__rope_rope_apply__read_sin_forwarded_input_index_intf.valid = fifo_data_18.wren;
  assign extern_return_router__rope_rope_apply__read_sin_forwarded_input_index_intf.data = fifo_data_18.data_in[2:2];
  KanagawaExternReturnRouter
  #(
      .DUAL_CLOCK(0),
      .LOG_DEPTH(9),
      .INDEX_WIDTH(1),
      .DATA_WIDTH(256),
      .USE_LUTRAM(0),
      .NUM_OUTPUT_PORTS(1),
      .PORT_INDEX_MAP_VALUE_WIDTH(1),
      .PORT_INDEX_MAP_DEPTH(2),
      .PORT_INDEX_MAP({ 1'h1, 1'h1 })
  )
  extern_return_router__rope_rope_apply__read_sin_forwarded
  (
      .input_clk(clk),
      .input_rst(reg_rst_delayed[65]),
      .input_index_intf(extern_return_router__rope_rope_apply__read_sin_forwarded_input_index_intf),
      .output_clk(clk),
      .output_rst(reg_rst_delayed[65]),
      .input_data_intf(extern_return_router__rope_rope_apply__read_sin_forwarded_input_data_intf),
      .output_switch_node_intfs(extern_return_router__rope_rope_apply__read_sin_forwarded_switch_output_intfs)
  );
  pd_fifo_intf #( .DATA_WIDTH(1) ) extern_return_router__rope_rope_apply__rotate_even_input_index_intf();
  pd_fifo_intf #( .DATA_WIDTH(16) ) extern_return_router__rope_rope_apply__rotate_even_input_data_intf();
  pd_fifo_intf #( .DATA_WIDTH(16) ) extern_return_router__rope_rope_apply__rotate_even_switch_output_intfs[1]();
  assign extern_return_router__rope_rope_apply__rotate_even_input_data_intf.valid = _rope_rope_apply__rotate_even_valid;
  assign _rope_rope_apply__rotate_even_rdy = extern_return_router__rope_rope_apply__rotate_even_input_data_intf.ready;
  assign extern_return_router__rope_rope_apply__rotate_even_input_data_intf.data = _rope_rope_apply__rotate_even_result;
  assign extern_return_router__rope_rope_apply__rotate_even_input_index_intf.valid = fifo_data_19.wren;
  assign extern_return_router__rope_rope_apply__rotate_even_input_index_intf.data = fifo_data_19.data_in[64:64];
  KanagawaExternReturnRouter
  #(
      .DUAL_CLOCK(0),
      .LOG_DEPTH(9),
      .INDEX_WIDTH(1),
      .DATA_WIDTH(16),
      .USE_LUTRAM(0),
      .NUM_OUTPUT_PORTS(1),
      .PORT_INDEX_MAP_VALUE_WIDTH(1),
      .PORT_INDEX_MAP_DEPTH(2),
      .PORT_INDEX_MAP({ 1'h1, 1'h1 })
  )
  extern_return_router__rope_rope_apply__rotate_even
  (
      .input_clk(clk),
      .input_rst(reg_rst_delayed[66]),
      .input_index_intf(extern_return_router__rope_rope_apply__rotate_even_input_index_intf),
      .output_clk(clk),
      .output_rst(reg_rst_delayed[66]),
      .input_data_intf(extern_return_router__rope_rope_apply__rotate_even_input_data_intf),
      .output_switch_node_intfs(extern_return_router__rope_rope_apply__rotate_even_switch_output_intfs)
  );
  pd_fifo_intf #( .DATA_WIDTH(1) ) extern_return_router__rope_rope_apply__rotate_odd_input_index_intf();
  pd_fifo_intf #( .DATA_WIDTH(16) ) extern_return_router__rope_rope_apply__rotate_odd_input_data_intf();
  pd_fifo_intf #( .DATA_WIDTH(16) ) extern_return_router__rope_rope_apply__rotate_odd_switch_output_intfs[1]();
  assign extern_return_router__rope_rope_apply__rotate_odd_input_data_intf.valid = _rope_rope_apply__rotate_odd_valid;
  assign _rope_rope_apply__rotate_odd_rdy = extern_return_router__rope_rope_apply__rotate_odd_input_data_intf.ready;
  assign extern_return_router__rope_rope_apply__rotate_odd_input_data_intf.data = _rope_rope_apply__rotate_odd_result;
  assign extern_return_router__rope_rope_apply__rotate_odd_input_index_intf.valid = fifo_data_20.wren;
  assign extern_return_router__rope_rope_apply__rotate_odd_input_index_intf.data = fifo_data_20.data_in[64:64];
  KanagawaExternReturnRouter
  #(
      .DUAL_CLOCK(0),
      .LOG_DEPTH(9),
      .INDEX_WIDTH(1),
      .DATA_WIDTH(16),
      .USE_LUTRAM(0),
      .NUM_OUTPUT_PORTS(1),
      .PORT_INDEX_MAP_VALUE_WIDTH(1),
      .PORT_INDEX_MAP_DEPTH(2),
      .PORT_INDEX_MAP({ 1'h1, 1'h1 })
  )
  extern_return_router__rope_rope_apply__rotate_odd
  (
      .input_clk(clk),
      .input_rst(reg_rst_delayed[67]),
      .input_index_intf(extern_return_router__rope_rope_apply__rotate_odd_input_index_intf),
      .output_clk(clk),
      .output_rst(reg_rst_delayed[67]),
      .input_data_intf(extern_return_router__rope_rope_apply__rotate_odd_input_data_intf),
      .output_switch_node_intfs(extern_return_router__rope_rope_apply__rotate_odd_switch_output_intfs)
  );
  pd_fifo_intf #( .DATA_WIDTH(1) ) extern_return_router__vpu_vector_unit__rmsnorm_accumulate_input_index_intf();
  pd_fifo_intf #( .DATA_WIDTH(1) ) extern_return_router__vpu_vector_unit__rmsnorm_accumulate_input_data_intf();
  pd_fifo_intf #( .DATA_WIDTH(1) ) extern_return_router__vpu_vector_unit__rmsnorm_accumulate_switch_output_intfs[1]();
  assign extern_return_router__vpu_vector_unit__rmsnorm_accumulate_input_data_intf.valid = _vpu_vector_unit__rmsnorm_accumulate_valid;
  assign _vpu_vector_unit__rmsnorm_accumulate_rdy = extern_return_router__vpu_vector_unit__rmsnorm_accumulate_input_data_intf.ready;
  assign extern_return_router__vpu_vector_unit__rmsnorm_accumulate_input_data_intf.data = 0;
  assign extern_return_router__vpu_vector_unit__rmsnorm_accumulate_input_index_intf.valid = fifo_data_21.wren;
  assign extern_return_router__vpu_vector_unit__rmsnorm_accumulate_input_index_intf.data = fifo_data_21.data_in[16:16];
  KanagawaExternReturnRouter
  #(
      .DUAL_CLOCK(0),
      .LOG_DEPTH(9),
      .INDEX_WIDTH(1),
      .DATA_WIDTH(1),
      .USE_LUTRAM(0),
      .NUM_OUTPUT_PORTS(1),
      .PORT_INDEX_MAP_VALUE_WIDTH(1),
      .PORT_INDEX_MAP_DEPTH(2),
      .PORT_INDEX_MAP({ 1'h1, 1'h1 })
  )
  extern_return_router__vpu_vector_unit__rmsnorm_accumulate
  (
      .input_clk(clk),
      .input_rst(reg_rst_delayed[68]),
      .input_index_intf(extern_return_router__vpu_vector_unit__rmsnorm_accumulate_input_index_intf),
      .output_clk(clk),
      .output_rst(reg_rst_delayed[68]),
      .input_data_intf(extern_return_router__vpu_vector_unit__rmsnorm_accumulate_input_data_intf),
      .output_switch_node_intfs(extern_return_router__vpu_vector_unit__rmsnorm_accumulate_switch_output_intfs)
  );
  pd_fifo_intf #( .DATA_WIDTH(1) ) extern_return_router__vpu_vector_unit__rmsnorm_get_sum_input_index_intf();
  pd_fifo_intf #( .DATA_WIDTH(32) ) extern_return_router__vpu_vector_unit__rmsnorm_get_sum_input_data_intf();
  pd_fifo_intf #( .DATA_WIDTH(32) ) extern_return_router__vpu_vector_unit__rmsnorm_get_sum_switch_output_intfs[1]();
  assign extern_return_router__vpu_vector_unit__rmsnorm_get_sum_input_data_intf.valid = _vpu_vector_unit__rmsnorm_get_sum_valid;
  assign _vpu_vector_unit__rmsnorm_get_sum_rdy = extern_return_router__vpu_vector_unit__rmsnorm_get_sum_input_data_intf.ready;
  assign extern_return_router__vpu_vector_unit__rmsnorm_get_sum_input_data_intf.data = _vpu_vector_unit__rmsnorm_get_sum_result;
  assign extern_return_router__vpu_vector_unit__rmsnorm_get_sum_input_index_intf.valid = fifo_data_22.wren;
  assign extern_return_router__vpu_vector_unit__rmsnorm_get_sum_input_index_intf.data = fifo_data_22.data_in[0:0];
  KanagawaExternReturnRouter
  #(
      .DUAL_CLOCK(0),
      .LOG_DEPTH(9),
      .INDEX_WIDTH(1),
      .DATA_WIDTH(32),
      .USE_LUTRAM(0),
      .NUM_OUTPUT_PORTS(1),
      .PORT_INDEX_MAP_VALUE_WIDTH(1),
      .PORT_INDEX_MAP_DEPTH(2),
      .PORT_INDEX_MAP({ 1'h1, 1'h1 })
  )
  extern_return_router__vpu_vector_unit__rmsnorm_get_sum
  (
      .input_clk(clk),
      .input_rst(reg_rst_delayed[69]),
      .input_index_intf(extern_return_router__vpu_vector_unit__rmsnorm_get_sum_input_index_intf),
      .output_clk(clk),
      .output_rst(reg_rst_delayed[69]),
      .input_data_intf(extern_return_router__vpu_vector_unit__rmsnorm_get_sum_input_data_intf),
      .output_switch_node_intfs(extern_return_router__vpu_vector_unit__rmsnorm_get_sum_switch_output_intfs)
  );
  pd_fifo_intf #( .DATA_WIDTH(1) ) extern_return_router__vpu_vector_unit__rmsnorm_reset_input_index_intf();
  pd_fifo_intf #( .DATA_WIDTH(1) ) extern_return_router__vpu_vector_unit__rmsnorm_reset_input_data_intf();
  pd_fifo_intf #( .DATA_WIDTH(1) ) extern_return_router__vpu_vector_unit__rmsnorm_reset_switch_output_intfs[1]();
  assign extern_return_router__vpu_vector_unit__rmsnorm_reset_input_data_intf.valid = _vpu_vector_unit__rmsnorm_reset_valid;
  assign _vpu_vector_unit__rmsnorm_reset_rdy = extern_return_router__vpu_vector_unit__rmsnorm_reset_input_data_intf.ready;
  assign extern_return_router__vpu_vector_unit__rmsnorm_reset_input_data_intf.data = 0;
  assign extern_return_router__vpu_vector_unit__rmsnorm_reset_input_index_intf.valid = fifo_data_23.wren;
  assign extern_return_router__vpu_vector_unit__rmsnorm_reset_input_index_intf.data = fifo_data_23.data_in[0:0];
  KanagawaExternReturnRouter
  #(
      .DUAL_CLOCK(0),
      .LOG_DEPTH(9),
      .INDEX_WIDTH(1),
      .DATA_WIDTH(1),
      .USE_LUTRAM(0),
      .NUM_OUTPUT_PORTS(1),
      .PORT_INDEX_MAP_VALUE_WIDTH(1),
      .PORT_INDEX_MAP_DEPTH(2),
      .PORT_INDEX_MAP({ 1'h1, 1'h1 })
  )
  extern_return_router__vpu_vector_unit__rmsnorm_reset
  (
      .input_clk(clk),
      .input_rst(reg_rst_delayed[70]),
      .input_index_intf(extern_return_router__vpu_vector_unit__rmsnorm_reset_input_index_intf),
      .output_clk(clk),
      .output_rst(reg_rst_delayed[70]),
      .input_data_intf(extern_return_router__vpu_vector_unit__rmsnorm_reset_input_data_intf),
      .output_switch_node_intfs(extern_return_router__vpu_vector_unit__rmsnorm_reset_switch_output_intfs)
  );
  pd_fifo_intf #( .DATA_WIDTH(1) ) extern_return_router__vpu_vector_unit__set_gamma_pre_attn_input_index_intf();
  pd_fifo_intf #( .DATA_WIDTH(1) ) extern_return_router__vpu_vector_unit__set_gamma_pre_attn_input_data_intf();
  pd_fifo_intf #( .DATA_WIDTH(1) ) extern_return_router__vpu_vector_unit__set_gamma_pre_attn_switch_output_intfs[1]();
  assign extern_return_router__vpu_vector_unit__set_gamma_pre_attn_input_data_intf.valid = _vpu_vector_unit__set_gamma_pre_attn_valid;
  assign _vpu_vector_unit__set_gamma_pre_attn_rdy = extern_return_router__vpu_vector_unit__set_gamma_pre_attn_input_data_intf.ready;
  assign extern_return_router__vpu_vector_unit__set_gamma_pre_attn_input_data_intf.data = 0;
  assign extern_return_router__vpu_vector_unit__set_gamma_pre_attn_input_index_intf.valid = fifo_data_24.wren;
  assign extern_return_router__vpu_vector_unit__set_gamma_pre_attn_input_index_intf.data = fifo_data_24.data_in[32:32];
  KanagawaExternReturnRouter
  #(
      .DUAL_CLOCK(0),
      .LOG_DEPTH(9),
      .INDEX_WIDTH(1),
      .DATA_WIDTH(1),
      .USE_LUTRAM(0),
      .NUM_OUTPUT_PORTS(1),
      .PORT_INDEX_MAP_VALUE_WIDTH(1),
      .PORT_INDEX_MAP_DEPTH(2),
      .PORT_INDEX_MAP({ 1'h1, 1'h1 })
  )
  extern_return_router__vpu_vector_unit__set_gamma_pre_attn
  (
      .input_clk(clk),
      .input_rst(reg_rst_delayed[71]),
      .input_index_intf(extern_return_router__vpu_vector_unit__set_gamma_pre_attn_input_index_intf),
      .output_clk(clk),
      .output_rst(reg_rst_delayed[71]),
      .input_data_intf(extern_return_router__vpu_vector_unit__set_gamma_pre_attn_input_data_intf),
      .output_switch_node_intfs(extern_return_router__vpu_vector_unit__set_gamma_pre_attn_switch_output_intfs)
  );
  pd_fifo_intf #( .DATA_WIDTH(1) ) extern_return_router__vpu_vector_unit__set_gamma_pre_mlp_input_index_intf();
  pd_fifo_intf #( .DATA_WIDTH(1) ) extern_return_router__vpu_vector_unit__set_gamma_pre_mlp_input_data_intf();
  pd_fifo_intf #( .DATA_WIDTH(1) ) extern_return_router__vpu_vector_unit__set_gamma_pre_mlp_switch_output_intfs[1]();
  assign extern_return_router__vpu_vector_unit__set_gamma_pre_mlp_input_data_intf.valid = _vpu_vector_unit__set_gamma_pre_mlp_valid;
  assign _vpu_vector_unit__set_gamma_pre_mlp_rdy = extern_return_router__vpu_vector_unit__set_gamma_pre_mlp_input_data_intf.ready;
  assign extern_return_router__vpu_vector_unit__set_gamma_pre_mlp_input_data_intf.data = 0;
  assign extern_return_router__vpu_vector_unit__set_gamma_pre_mlp_input_index_intf.valid = fifo_data_25.wren;
  assign extern_return_router__vpu_vector_unit__set_gamma_pre_mlp_input_index_intf.data = fifo_data_25.data_in[32:32];
  KanagawaExternReturnRouter
  #(
      .DUAL_CLOCK(0),
      .LOG_DEPTH(9),
      .INDEX_WIDTH(1),
      .DATA_WIDTH(1),
      .USE_LUTRAM(0),
      .NUM_OUTPUT_PORTS(1),
      .PORT_INDEX_MAP_VALUE_WIDTH(1),
      .PORT_INDEX_MAP_DEPTH(2),
      .PORT_INDEX_MAP({ 1'h1, 1'h1 })
  )
  extern_return_router__vpu_vector_unit__set_gamma_pre_mlp
  (
      .input_clk(clk),
      .input_rst(reg_rst_delayed[72]),
      .input_index_intf(extern_return_router__vpu_vector_unit__set_gamma_pre_mlp_input_index_intf),
      .output_clk(clk),
      .output_rst(reg_rst_delayed[72]),
      .input_data_intf(extern_return_router__vpu_vector_unit__set_gamma_pre_mlp_input_data_intf),
      .output_switch_node_intfs(extern_return_router__vpu_vector_unit__set_gamma_pre_mlp_switch_output_intfs)
  );
  pd_fifo_intf #( .DATA_WIDTH(1) ) extern_return_router__vpu_vector_unit__set_rsqrt_lut_input_index_intf();
  pd_fifo_intf #( .DATA_WIDTH(1) ) extern_return_router__vpu_vector_unit__set_rsqrt_lut_input_data_intf();
  pd_fifo_intf #( .DATA_WIDTH(1) ) extern_return_router__vpu_vector_unit__set_rsqrt_lut_switch_output_intfs[1]();
  assign extern_return_router__vpu_vector_unit__set_rsqrt_lut_input_data_intf.valid = _vpu_vector_unit__set_rsqrt_lut_valid;
  assign _vpu_vector_unit__set_rsqrt_lut_rdy = extern_return_router__vpu_vector_unit__set_rsqrt_lut_input_data_intf.ready;
  assign extern_return_router__vpu_vector_unit__set_rsqrt_lut_input_data_intf.data = 0;
  assign extern_return_router__vpu_vector_unit__set_rsqrt_lut_input_index_intf.valid = fifo_data_26.wren;
  assign extern_return_router__vpu_vector_unit__set_rsqrt_lut_input_index_intf.data = fifo_data_26.data_in[24:24];
  KanagawaExternReturnRouter
  #(
      .DUAL_CLOCK(0),
      .LOG_DEPTH(9),
      .INDEX_WIDTH(1),
      .DATA_WIDTH(1),
      .USE_LUTRAM(0),
      .NUM_OUTPUT_PORTS(1),
      .PORT_INDEX_MAP_VALUE_WIDTH(1),
      .PORT_INDEX_MAP_DEPTH(2),
      .PORT_INDEX_MAP({ 1'h1, 1'h1 })
  )
  extern_return_router__vpu_vector_unit__set_rsqrt_lut
  (
      .input_clk(clk),
      .input_rst(reg_rst_delayed[73]),
      .input_index_intf(extern_return_router__vpu_vector_unit__set_rsqrt_lut_input_index_intf),
      .output_clk(clk),
      .output_rst(reg_rst_delayed[73]),
      .input_data_intf(extern_return_router__vpu_vector_unit__set_rsqrt_lut_input_data_intf),
      .output_switch_node_intfs(extern_return_router__vpu_vector_unit__set_rsqrt_lut_switch_output_intfs)
  );
  pd_fifo_intf #( .DATA_WIDTH(1) ) extern_return_router__vpu_vector_unit__set_sigmoid_lut_input_index_intf();
  pd_fifo_intf #( .DATA_WIDTH(1) ) extern_return_router__vpu_vector_unit__set_sigmoid_lut_input_data_intf();
  pd_fifo_intf #( .DATA_WIDTH(1) ) extern_return_router__vpu_vector_unit__set_sigmoid_lut_switch_output_intfs[1]();
  assign extern_return_router__vpu_vector_unit__set_sigmoid_lut_input_data_intf.valid = _vpu_vector_unit__set_sigmoid_lut_valid;
  assign _vpu_vector_unit__set_sigmoid_lut_rdy = extern_return_router__vpu_vector_unit__set_sigmoid_lut_input_data_intf.ready;
  assign extern_return_router__vpu_vector_unit__set_sigmoid_lut_input_data_intf.data = 0;
  assign extern_return_router__vpu_vector_unit__set_sigmoid_lut_input_index_intf.valid = fifo_data_27.wren;
  assign extern_return_router__vpu_vector_unit__set_sigmoid_lut_input_index_intf.data = fifo_data_27.data_in[24:24];
  KanagawaExternReturnRouter
  #(
      .DUAL_CLOCK(0),
      .LOG_DEPTH(9),
      .INDEX_WIDTH(1),
      .DATA_WIDTH(1),
      .USE_LUTRAM(0),
      .NUM_OUTPUT_PORTS(1),
      .PORT_INDEX_MAP_VALUE_WIDTH(1),
      .PORT_INDEX_MAP_DEPTH(2),
      .PORT_INDEX_MAP({ 1'h1, 1'h1 })
  )
  extern_return_router__vpu_vector_unit__set_sigmoid_lut
  (
      .input_clk(clk),
      .input_rst(reg_rst_delayed[74]),
      .input_index_intf(extern_return_router__vpu_vector_unit__set_sigmoid_lut_input_index_intf),
      .output_clk(clk),
      .output_rst(reg_rst_delayed[74]),
      .input_data_intf(extern_return_router__vpu_vector_unit__set_sigmoid_lut_input_data_intf),
      .output_switch_node_intfs(extern_return_router__vpu_vector_unit__set_sigmoid_lut_switch_output_intfs)
  );
  pd_fifo_intf #( .DATA_WIDTH(1) ) extern_return_router__vpu_vector_unit__swiglu_compute_input_index_intf();
  pd_fifo_intf #( .DATA_WIDTH(16) ) extern_return_router__vpu_vector_unit__swiglu_compute_input_data_intf();
  pd_fifo_intf #( .DATA_WIDTH(16) ) extern_return_router__vpu_vector_unit__swiglu_compute_switch_output_intfs[1]();
  assign extern_return_router__vpu_vector_unit__swiglu_compute_input_data_intf.valid = _vpu_vector_unit__swiglu_compute_valid;
  assign _vpu_vector_unit__swiglu_compute_rdy = extern_return_router__vpu_vector_unit__swiglu_compute_input_data_intf.ready;
  assign extern_return_router__vpu_vector_unit__swiglu_compute_input_data_intf.data = _vpu_vector_unit__swiglu_compute_result;
  assign extern_return_router__vpu_vector_unit__swiglu_compute_input_index_intf.valid = fifo_data_28.wren;
  assign extern_return_router__vpu_vector_unit__swiglu_compute_input_index_intf.data = fifo_data_28.data_in[32:32];
  KanagawaExternReturnRouter
  #(
      .DUAL_CLOCK(0),
      .LOG_DEPTH(9),
      .INDEX_WIDTH(1),
      .DATA_WIDTH(16),
      .USE_LUTRAM(0),
      .NUM_OUTPUT_PORTS(1),
      .PORT_INDEX_MAP_VALUE_WIDTH(1),
      .PORT_INDEX_MAP_DEPTH(2),
      .PORT_INDEX_MAP({ 1'h1, 1'h1 })
  )
  extern_return_router__vpu_vector_unit__swiglu_compute
  (
      .input_clk(clk),
      .input_rst(reg_rst_delayed[75]),
      .input_index_intf(extern_return_router__vpu_vector_unit__swiglu_compute_input_index_intf),
      .output_clk(clk),
      .output_rst(reg_rst_delayed[75]),
      .input_data_intf(extern_return_router__vpu_vector_unit__swiglu_compute_input_data_intf),
      .output_switch_node_intfs(extern_return_router__vpu_vector_unit__swiglu_compute_switch_output_intfs)
  );
  pd_fifo_intf #( .DATA_WIDTH(1) ) extern_return_router__vpu_vector_unit__residual_add_input_index_intf();
  pd_fifo_intf #( .DATA_WIDTH(16) ) extern_return_router__vpu_vector_unit__residual_add_input_data_intf();
  pd_fifo_intf #( .DATA_WIDTH(16) ) extern_return_router__vpu_vector_unit__residual_add_switch_output_intfs[1]();
  assign extern_return_router__vpu_vector_unit__residual_add_input_data_intf.valid = _vpu_vector_unit__residual_add_valid;
  assign _vpu_vector_unit__residual_add_rdy = extern_return_router__vpu_vector_unit__residual_add_input_data_intf.ready;
  assign extern_return_router__vpu_vector_unit__residual_add_input_data_intf.data = _vpu_vector_unit__residual_add_result;
  assign extern_return_router__vpu_vector_unit__residual_add_input_index_intf.valid = fifo_data_29.wren;
  assign extern_return_router__vpu_vector_unit__residual_add_input_index_intf.data = fifo_data_29.data_in[32:32];
  KanagawaExternReturnRouter
  #(
      .DUAL_CLOCK(0),
      .LOG_DEPTH(9),
      .INDEX_WIDTH(1),
      .DATA_WIDTH(16),
      .USE_LUTRAM(0),
      .NUM_OUTPUT_PORTS(1),
      .PORT_INDEX_MAP_VALUE_WIDTH(1),
      .PORT_INDEX_MAP_DEPTH(2),
      .PORT_INDEX_MAP({ 1'h1, 1'h1 })
  )
  extern_return_router__vpu_vector_unit__residual_add
  (
      .input_clk(clk),
      .input_rst(reg_rst_delayed[76]),
      .input_index_intf(extern_return_router__vpu_vector_unit__residual_add_input_index_intf),
      .output_clk(clk),
      .output_rst(reg_rst_delayed[76]),
      .input_data_intf(extern_return_router__vpu_vector_unit__residual_add_input_data_intf),
      .output_switch_node_intfs(extern_return_router__vpu_vector_unit__residual_add_switch_output_intfs)
  );
  assign forward_cos_rdy_out_net = passthrough_data_30.rdy_ext;
  assign passthrough_data_30.valid = forward_cos_rdy_out & forward_cos_valid_in;
  assign passthrough_data_30.data = { forward_cos_v_in, forward_cos_phase_in };
  assign fifo_data_0.rden = forward_cos_rden_in;
  assign forward_cos_empty_out_net = fifo_data_0.empty;
  assign forward_sin_rdy_out_net = passthrough_data_32.rdy_ext;
  assign passthrough_data_32.valid = forward_sin_rdy_out & forward_sin_valid_in;
  assign passthrough_data_32.data = { forward_sin_v_in, forward_sin_phase_in };
  assign fifo_data_1.rden = forward_sin_rden_in;
  assign forward_sin_empty_out_net = fifo_data_1.empty;
  assign read_cos_forwarded_rdy_out_net = passthrough_data_34.rdy_ext;
  assign passthrough_data_34.valid = read_cos_forwarded_rdy_out & read_cos_forwarded_valid_in;
  assign passthrough_data_34.data = { read_cos_forwarded_phase_in };
  assign fifo_data_2.rden = read_cos_forwarded_rden_in;
  assign read_cos_forwarded_result_out_net = fifo_data_2.data_out;
  assign read_cos_forwarded_empty_out_net = fifo_data_2.empty;
  assign read_sin_forwarded_rdy_out_net = passthrough_data_36.rdy_ext;
  assign passthrough_data_36.valid = read_sin_forwarded_rdy_out & read_sin_forwarded_valid_in;
  assign passthrough_data_36.data = { read_sin_forwarded_phase_in };
  assign fifo_data_3.rden = read_sin_forwarded_rden_in;
  assign read_sin_forwarded_result_out_net = fifo_data_3.data_out;
  assign read_sin_forwarded_empty_out_net = fifo_data_3.empty;
  assign prog_gamma_pre_attn_rdy_out_net = passthrough_data_38.rdy_ext;
  assign passthrough_data_38.valid = prog_gamma_pre_attn_rdy_out & prog_gamma_pre_attn_valid_in;
  assign passthrough_data_38.data = { prog_gamma_pre_attn_val_in, prog_gamma_pre_attn_idx_in };
  assign fifo_data_4.rden = prog_gamma_pre_attn_rden_in;
  assign prog_gamma_pre_attn_empty_out_net = fifo_data_4.empty;
  assign prog_gamma_pre_mlp_rdy_out_net = passthrough_data_40.rdy_ext;
  assign passthrough_data_40.valid = prog_gamma_pre_mlp_rdy_out & prog_gamma_pre_mlp_valid_in;
  assign passthrough_data_40.data = { prog_gamma_pre_mlp_val_in, prog_gamma_pre_mlp_idx_in };
  assign fifo_data_5.rden = prog_gamma_pre_mlp_rden_in;
  assign prog_gamma_pre_mlp_empty_out_net = fifo_data_5.empty;
  assign prog_rsqrt_lut_rdy_out_net = passthrough_data_42.rdy_ext;
  assign passthrough_data_42.valid = prog_rsqrt_lut_rdy_out & prog_rsqrt_lut_valid_in;
  assign passthrough_data_42.data = { prog_rsqrt_lut_val_in, prog_rsqrt_lut_idx_in };
  assign fifo_data_6.rden = prog_rsqrt_lut_rden_in;
  assign prog_rsqrt_lut_empty_out_net = fifo_data_6.empty;
  assign prog_sigmoid_lut_rdy_out_net = passthrough_data_44.rdy_ext;
  assign passthrough_data_44.valid = prog_sigmoid_lut_rdy_out & prog_sigmoid_lut_valid_in;
  assign passthrough_data_44.data = { prog_sigmoid_lut_val_in, prog_sigmoid_lut_idx_in };
  assign fifo_data_7.rden = prog_sigmoid_lut_rden_in;
  assign prog_sigmoid_lut_empty_out_net = fifo_data_7.empty;
  assign rmsnorm_reset_rdy_out_net = passthrough_data_46.rdy_ext;
  assign passthrough_data_46.valid = rmsnorm_reset_rdy_out & rmsnorm_reset_valid_in;
  assign fifo_data_8.rden = rmsnorm_reset_rden_in;
  assign rmsnorm_reset_empty_out_net = fifo_data_8.empty;
  assign rmsnorm_get_sum_rdy_out_net = passthrough_data_48.rdy_ext;
  assign passthrough_data_48.valid = rmsnorm_get_sum_rdy_out & rmsnorm_get_sum_valid_in;
  assign fifo_data_9.rden = rmsnorm_get_sum_rden_in;
  assign rmsnorm_get_sum_result_out_net = fifo_data_9.data_out;
  assign rmsnorm_get_sum_empty_out_net = fifo_data_9.empty;
  assign rmsnorm_step_rdy_out_net = passthrough_data_50.rdy_ext;
  assign passthrough_data_50.valid = rmsnorm_step_rdy_out & rmsnorm_step_valid_in;
  assign passthrough_data_50.data = { rmsnorm_step_x_bf16_in };
  assign fifo_data_10.rden = rmsnorm_step_rden_in;
  assign rmsnorm_step_empty_out_net = fifo_data_10.empty;
  assign swiglu_step_rdy_out_net = passthrough_data_52.rdy_ext;
  assign passthrough_data_52.valid = swiglu_step_rdy_out & swiglu_step_valid_in;
  assign passthrough_data_52.data = { swiglu_step_up_bf16_in, swiglu_step_gate_bf16_in };
  assign fifo_data_11.rden = swiglu_step_rden_in;
  assign swiglu_step_result_out_net = fifo_data_11.data_out;
  assign swiglu_step_empty_out_net = fifo_data_11.empty;
  assign residual_add_step_rdy_out_net = passthrough_data_54.rdy_ext;
  assign passthrough_data_54.valid = residual_add_step_rdy_out & residual_add_step_valid_in;
  assign passthrough_data_54.data = { residual_add_step_b_bf16_in, residual_add_step_a_bf16_in };
  assign fifo_data_12.rden = residual_add_step_rden_in;
  assign residual_add_step_result_out_net = fifo_data_12.data_out;
  assign residual_add_step_empty_out_net = fifo_data_12.empty;
  assign rotate_even_rdy_out_net = passthrough_data_56.rdy_ext;
  assign passthrough_data_56.valid = rotate_even_rdy_out & rotate_even_valid_in;
  assign passthrough_data_56.data = { rotate_even_sin_val_in, rotate_even_cos_val_in, rotate_even_x_odd_in, rotate_even_x_even_in };
  assign fifo_data_13.rden = rotate_even_rden_in;
  assign rotate_even_result_out_net = fifo_data_13.data_out;
  assign rotate_even_empty_out_net = fifo_data_13.empty;
  assign rotate_odd_rdy_out_net = passthrough_data_58.rdy_ext;
  assign passthrough_data_58.valid = rotate_odd_rdy_out & rotate_odd_valid_in;
  assign passthrough_data_58.data = { rotate_odd_sin_val_in, rotate_odd_cos_val_in, rotate_odd_x_odd_in, rotate_odd_x_even_in };
  assign fifo_data_14.rden = rotate_odd_rden_in;
  assign rotate_odd_result_out_net = fifo_data_14.data_out;
  assign rotate_odd_empty_out_net = fifo_data_14.empty;
  assign fifo_data_15.rden = _rope_rope_apply__forward_cos_rden;
  assign _rope_rope_apply__forward_cos_phase = fifo_data_15.data_out[1:0];
  assign _rope_rope_apply__forward_cos_v = fifo_data_15.data_out[257:2];
  assign _rope_rope_apply__forward_cos_empty = fifo_data_15.empty;
  assign fifo_data_60.wren = extern_return_router__rope_rope_apply__forward_cos_switch_output_intfs[0].valid & extern_return_router__rope_rope_apply__forward_cos_switch_output_intfs[0].ready;
  assign extern_return_router__rope_rope_apply__forward_cos_switch_output_intfs[0].ready = ~fifo_data_60.almost_full;
  assign fifo_data_16.rden = _rope_rope_apply__forward_sin_rden;
  assign _rope_rope_apply__forward_sin_phase = fifo_data_16.data_out[1:0];
  assign _rope_rope_apply__forward_sin_v = fifo_data_16.data_out[257:2];
  assign _rope_rope_apply__forward_sin_empty = fifo_data_16.empty;
  assign fifo_data_62.wren = extern_return_router__rope_rope_apply__forward_sin_switch_output_intfs[0].valid & extern_return_router__rope_rope_apply__forward_sin_switch_output_intfs[0].ready;
  assign extern_return_router__rope_rope_apply__forward_sin_switch_output_intfs[0].ready = ~fifo_data_62.almost_full;
  assign fifo_data_17.rden = _rope_rope_apply__read_cos_forwarded_rden;
  assign _rope_rope_apply__read_cos_forwarded_phase = fifo_data_17.data_out[1:0];
  assign _rope_rope_apply__read_cos_forwarded_empty = fifo_data_17.empty;
  assign fifo_data_64.wren = extern_return_router__rope_rope_apply__read_cos_forwarded_switch_output_intfs[0].valid & extern_return_router__rope_rope_apply__read_cos_forwarded_switch_output_intfs[0].ready;
  assign extern_return_router__rope_rope_apply__read_cos_forwarded_switch_output_intfs[0].ready = ~fifo_data_64.almost_full;
  assign fifo_data_64.data_in = extern_return_router__rope_rope_apply__read_cos_forwarded_switch_output_intfs[0].data;
  assign fifo_data_18.rden = _rope_rope_apply__read_sin_forwarded_rden;
  assign _rope_rope_apply__read_sin_forwarded_phase = fifo_data_18.data_out[1:0];
  assign _rope_rope_apply__read_sin_forwarded_empty = fifo_data_18.empty;
  assign fifo_data_66.wren = extern_return_router__rope_rope_apply__read_sin_forwarded_switch_output_intfs[0].valid & extern_return_router__rope_rope_apply__read_sin_forwarded_switch_output_intfs[0].ready;
  assign extern_return_router__rope_rope_apply__read_sin_forwarded_switch_output_intfs[0].ready = ~fifo_data_66.almost_full;
  assign fifo_data_66.data_in = extern_return_router__rope_rope_apply__read_sin_forwarded_switch_output_intfs[0].data;
  assign fifo_data_19.rden = _rope_rope_apply__rotate_even_rden;
  assign _rope_rope_apply__rotate_even_x_even = fifo_data_19.data_out[15:0];
  assign _rope_rope_apply__rotate_even_x_odd = fifo_data_19.data_out[31:16];
  assign _rope_rope_apply__rotate_even_cos_val = fifo_data_19.data_out[47:32];
  assign _rope_rope_apply__rotate_even_sin_val = fifo_data_19.data_out[63:48];
  assign _rope_rope_apply__rotate_even_empty = fifo_data_19.empty;
  assign fifo_data_86.wren = extern_return_router__rope_rope_apply__rotate_even_switch_output_intfs[0].valid & extern_return_router__rope_rope_apply__rotate_even_switch_output_intfs[0].ready;
  assign extern_return_router__rope_rope_apply__rotate_even_switch_output_intfs[0].ready = ~fifo_data_86.almost_full;
  assign fifo_data_86.data_in = extern_return_router__rope_rope_apply__rotate_even_switch_output_intfs[0].data;
  assign fifo_data_20.rden = _rope_rope_apply__rotate_odd_rden;
  assign _rope_rope_apply__rotate_odd_x_even = fifo_data_20.data_out[15:0];
  assign _rope_rope_apply__rotate_odd_x_odd = fifo_data_20.data_out[31:16];
  assign _rope_rope_apply__rotate_odd_cos_val = fifo_data_20.data_out[47:32];
  assign _rope_rope_apply__rotate_odd_sin_val = fifo_data_20.data_out[63:48];
  assign _rope_rope_apply__rotate_odd_empty = fifo_data_20.empty;
  assign fifo_data_88.wren = extern_return_router__rope_rope_apply__rotate_odd_switch_output_intfs[0].valid & extern_return_router__rope_rope_apply__rotate_odd_switch_output_intfs[0].ready;
  assign extern_return_router__rope_rope_apply__rotate_odd_switch_output_intfs[0].ready = ~fifo_data_88.almost_full;
  assign fifo_data_88.data_in = extern_return_router__rope_rope_apply__rotate_odd_switch_output_intfs[0].data;
  assign fifo_data_21.rden = _vpu_vector_unit__rmsnorm_accumulate_rden;
  assign _vpu_vector_unit__rmsnorm_accumulate_x_bf16 = fifo_data_21.data_out[15:0];
  assign _vpu_vector_unit__rmsnorm_accumulate_empty = fifo_data_21.empty;
  assign fifo_data_80.wren = extern_return_router__vpu_vector_unit__rmsnorm_accumulate_switch_output_intfs[0].valid & extern_return_router__vpu_vector_unit__rmsnorm_accumulate_switch_output_intfs[0].ready;
  assign extern_return_router__vpu_vector_unit__rmsnorm_accumulate_switch_output_intfs[0].ready = ~fifo_data_80.almost_full;
  assign fifo_data_22.rden = _vpu_vector_unit__rmsnorm_get_sum_rden;
  assign _vpu_vector_unit__rmsnorm_get_sum_empty = fifo_data_22.empty;
  assign fifo_data_78.wren = extern_return_router__vpu_vector_unit__rmsnorm_get_sum_switch_output_intfs[0].valid & extern_return_router__vpu_vector_unit__rmsnorm_get_sum_switch_output_intfs[0].ready;
  assign extern_return_router__vpu_vector_unit__rmsnorm_get_sum_switch_output_intfs[0].ready = ~fifo_data_78.almost_full;
  assign fifo_data_78.data_in = extern_return_router__vpu_vector_unit__rmsnorm_get_sum_switch_output_intfs[0].data;
  assign fifo_data_23.rden = _vpu_vector_unit__rmsnorm_reset_rden;
  assign _vpu_vector_unit__rmsnorm_reset_empty = fifo_data_23.empty;
  assign fifo_data_76.wren = extern_return_router__vpu_vector_unit__rmsnorm_reset_switch_output_intfs[0].valid & extern_return_router__vpu_vector_unit__rmsnorm_reset_switch_output_intfs[0].ready;
  assign extern_return_router__vpu_vector_unit__rmsnorm_reset_switch_output_intfs[0].ready = ~fifo_data_76.almost_full;
  assign fifo_data_24.rden = _vpu_vector_unit__set_gamma_pre_attn_rden;
  assign _vpu_vector_unit__set_gamma_pre_attn_index = fifo_data_24.data_out[15:0];
  assign _vpu_vector_unit__set_gamma_pre_attn_value = fifo_data_24.data_out[31:16];
  assign _vpu_vector_unit__set_gamma_pre_attn_empty = fifo_data_24.empty;
  assign fifo_data_68.wren = extern_return_router__vpu_vector_unit__set_gamma_pre_attn_switch_output_intfs[0].valid & extern_return_router__vpu_vector_unit__set_gamma_pre_attn_switch_output_intfs[0].ready;
  assign extern_return_router__vpu_vector_unit__set_gamma_pre_attn_switch_output_intfs[0].ready = ~fifo_data_68.almost_full;
  assign fifo_data_25.rden = _vpu_vector_unit__set_gamma_pre_mlp_rden;
  assign _vpu_vector_unit__set_gamma_pre_mlp_index = fifo_data_25.data_out[15:0];
  assign _vpu_vector_unit__set_gamma_pre_mlp_value = fifo_data_25.data_out[31:16];
  assign _vpu_vector_unit__set_gamma_pre_mlp_empty = fifo_data_25.empty;
  assign fifo_data_70.wren = extern_return_router__vpu_vector_unit__set_gamma_pre_mlp_switch_output_intfs[0].valid & extern_return_router__vpu_vector_unit__set_gamma_pre_mlp_switch_output_intfs[0].ready;
  assign extern_return_router__vpu_vector_unit__set_gamma_pre_mlp_switch_output_intfs[0].ready = ~fifo_data_70.almost_full;
  assign fifo_data_26.rden = _vpu_vector_unit__set_rsqrt_lut_rden;
  assign _vpu_vector_unit__set_rsqrt_lut_index = fifo_data_26.data_out[7:0];
  assign _vpu_vector_unit__set_rsqrt_lut_value = fifo_data_26.data_out[23:8];
  assign _vpu_vector_unit__set_rsqrt_lut_empty = fifo_data_26.empty;
  assign fifo_data_72.wren = extern_return_router__vpu_vector_unit__set_rsqrt_lut_switch_output_intfs[0].valid & extern_return_router__vpu_vector_unit__set_rsqrt_lut_switch_output_intfs[0].ready;
  assign extern_return_router__vpu_vector_unit__set_rsqrt_lut_switch_output_intfs[0].ready = ~fifo_data_72.almost_full;
  assign fifo_data_27.rden = _vpu_vector_unit__set_sigmoid_lut_rden;
  assign _vpu_vector_unit__set_sigmoid_lut_index = fifo_data_27.data_out[7:0];
  assign _vpu_vector_unit__set_sigmoid_lut_value = fifo_data_27.data_out[23:8];
  assign _vpu_vector_unit__set_sigmoid_lut_empty = fifo_data_27.empty;
  assign fifo_data_74.wren = extern_return_router__vpu_vector_unit__set_sigmoid_lut_switch_output_intfs[0].valid & extern_return_router__vpu_vector_unit__set_sigmoid_lut_switch_output_intfs[0].ready;
  assign extern_return_router__vpu_vector_unit__set_sigmoid_lut_switch_output_intfs[0].ready = ~fifo_data_74.almost_full;
  assign fifo_data_28.rden = _vpu_vector_unit__swiglu_compute_rden;
  assign _vpu_vector_unit__swiglu_compute_gate_bf16 = fifo_data_28.data_out[15:0];
  assign _vpu_vector_unit__swiglu_compute_up_bf16 = fifo_data_28.data_out[31:16];
  assign _vpu_vector_unit__swiglu_compute_empty = fifo_data_28.empty;
  assign fifo_data_82.wren = extern_return_router__vpu_vector_unit__swiglu_compute_switch_output_intfs[0].valid & extern_return_router__vpu_vector_unit__swiglu_compute_switch_output_intfs[0].ready;
  assign extern_return_router__vpu_vector_unit__swiglu_compute_switch_output_intfs[0].ready = ~fifo_data_82.almost_full;
  assign fifo_data_82.data_in = extern_return_router__vpu_vector_unit__swiglu_compute_switch_output_intfs[0].data;
  assign fifo_data_29.rden = _vpu_vector_unit__residual_add_rden;
  assign _vpu_vector_unit__residual_add_a_bf16 = fifo_data_29.data_out[15:0];
  assign _vpu_vector_unit__residual_add_b_bf16 = fifo_data_29.data_out[31:16];
  assign _vpu_vector_unit__residual_add_empty = fifo_data_29.empty;
  assign fifo_data_84.wren = extern_return_router__vpu_vector_unit__residual_add_switch_output_intfs[0].valid & extern_return_router__vpu_vector_unit__residual_add_switch_output_intfs[0].ready;
  assign extern_return_router__vpu_vector_unit__residual_add_switch_output_intfs[0].ready = ~fifo_data_84.almost_full;
  assign fifo_data_84.data_in = extern_return_router__vpu_vector_unit__residual_add_switch_output_intfs[0].data;
  struct packed {
      logic caller_wren;
      // coverage off
      logic [0:0] caller_data;
      // coverage on
      logic [0:0] caller_loop_count;
      logic caller_almost_full;
      logic [0:0] output_callee_data;
      logic [0:0] output_caller_data;
  } context_saver_data_61;
  assign context_saver_data_61.caller_data = '0;
  wire         context_saver_61_forward_cos_ContextSaver_caller_wren_in__circt =
    context_saver_data_61.caller_wren;
  wire         context_saver_61_forward_cos_ContextSaver_caller_data_in__circt =
    context_saver_data_61.caller_data;
  wire         context_saver_61_forward_cos_ContextSaver_caller_loop_count_in__circt =
    context_saver_data_61.caller_loop_count;

  struct packed {
      logic caller_wren;
      // coverage off
      logic [0:0] caller_data;
      // coverage on
      logic [0:0] caller_loop_count;
      logic caller_almost_full;
      logic [0:0] output_callee_data;
      logic [0:0] output_caller_data;
  } context_saver_data_63;
  assign context_saver_data_63.caller_data = '0;
  wire         context_saver_63_forward_sin_ContextSaver_caller_wren_in__circt =
    context_saver_data_63.caller_wren;
  wire         context_saver_63_forward_sin_ContextSaver_caller_data_in__circt =
    context_saver_data_63.caller_data;
  wire         context_saver_63_forward_sin_ContextSaver_caller_loop_count_in__circt =
    context_saver_data_63.caller_loop_count;

  struct packed {
      logic caller_wren;
      // coverage off
      logic [0:0] caller_data;
      // coverage on
      logic [0:0] caller_loop_count;
      logic caller_almost_full;
      logic [255:0] output_callee_data;
      logic [0:0] output_caller_data;
  } context_saver_data_65;
  assign context_saver_data_65.caller_data = '0;
  layer_orchestrator_ContextSaverMerger65 context_saver_merger_read_cos_forwarded_65
  (
      .callee_data(context_saver_data_65.output_callee_data),
      .output_data(passthrough_data_35.data)
  );
  wire         context_saver_65_read_cos_forwarded_ContextSaver_caller_wren_in__circt =
    context_saver_data_65.caller_wren;
  wire         context_saver_65_read_cos_forwarded_ContextSaver_caller_data_in__circt =
    context_saver_data_65.caller_data;
  wire
    context_saver_65_read_cos_forwarded_ContextSaver_caller_loop_count_in__circt =
    context_saver_data_65.caller_loop_count;

  struct packed {
      logic caller_wren;
      // coverage off
      logic [0:0] caller_data;
      // coverage on
      logic [0:0] caller_loop_count;
      logic caller_almost_full;
      logic [255:0] output_callee_data;
      logic [0:0] output_caller_data;
  } context_saver_data_67;
  assign context_saver_data_67.caller_data = '0;
  layer_orchestrator_ContextSaverMerger67 context_saver_merger_read_sin_forwarded_67
  (
      .callee_data(context_saver_data_67.output_callee_data),
      .output_data(passthrough_data_37.data)
  );
  wire         context_saver_67_read_sin_forwarded_ContextSaver_caller_wren_in__circt =
    context_saver_data_67.caller_wren;
  wire         context_saver_67_read_sin_forwarded_ContextSaver_caller_data_in__circt =
    context_saver_data_67.caller_data;
  wire
    context_saver_67_read_sin_forwarded_ContextSaver_caller_loop_count_in__circt =
    context_saver_data_67.caller_loop_count;

  struct packed {
      logic caller_wren;
      // coverage off
      logic [0:0] caller_data;
      // coverage on
      logic [0:0] caller_loop_count;
      logic caller_almost_full;
      logic [0:0] output_callee_data;
      logic [0:0] output_caller_data;
  } context_saver_data_69;
  assign context_saver_data_69.caller_data = '0;
  wire         context_saver_69_set_gamma_pre_attn_ContextSaver_caller_wren_in__circt =
    context_saver_data_69.caller_wren;
  wire         context_saver_69_set_gamma_pre_attn_ContextSaver_caller_data_in__circt =
    context_saver_data_69.caller_data;
  wire
    context_saver_69_set_gamma_pre_attn_ContextSaver_caller_loop_count_in__circt =
    context_saver_data_69.caller_loop_count;

  struct packed {
      logic caller_wren;
      // coverage off
      logic [0:0] caller_data;
      // coverage on
      logic [0:0] caller_loop_count;
      logic caller_almost_full;
      logic [0:0] output_callee_data;
      logic [0:0] output_caller_data;
  } context_saver_data_71;
  assign context_saver_data_71.caller_data = '0;
  wire         context_saver_71_set_gamma_pre_mlp_ContextSaver_caller_wren_in__circt =
    context_saver_data_71.caller_wren;
  wire         context_saver_71_set_gamma_pre_mlp_ContextSaver_caller_data_in__circt =
    context_saver_data_71.caller_data;
  wire         context_saver_71_set_gamma_pre_mlp_ContextSaver_caller_loop_count_in__circt
    = context_saver_data_71.caller_loop_count;

  struct packed {
      logic caller_wren;
      // coverage off
      logic [0:0] caller_data;
      // coverage on
      logic [0:0] caller_loop_count;
      logic caller_almost_full;
      logic [0:0] output_callee_data;
      logic [0:0] output_caller_data;
  } context_saver_data_73;
  assign context_saver_data_73.caller_data = '0;
  wire         context_saver_73_set_rsqrt_lut_ContextSaver_caller_wren_in__circt =
    context_saver_data_73.caller_wren;
  wire         context_saver_73_set_rsqrt_lut_ContextSaver_caller_data_in__circt =
    context_saver_data_73.caller_data;
  wire         context_saver_73_set_rsqrt_lut_ContextSaver_caller_loop_count_in__circt =
    context_saver_data_73.caller_loop_count;

  struct packed {
      logic caller_wren;
      // coverage off
      logic [0:0] caller_data;
      // coverage on
      logic [0:0] caller_loop_count;
      logic caller_almost_full;
      logic [0:0] output_callee_data;
      logic [0:0] output_caller_data;
  } context_saver_data_75;
  assign context_saver_data_75.caller_data = '0;
  wire         context_saver_75_set_sigmoid_lut_ContextSaver_caller_wren_in__circt =
    context_saver_data_75.caller_wren;
  wire         context_saver_75_set_sigmoid_lut_ContextSaver_caller_data_in__circt =
    context_saver_data_75.caller_data;
  wire         context_saver_75_set_sigmoid_lut_ContextSaver_caller_loop_count_in__circt =
    context_saver_data_75.caller_loop_count;

  struct packed {
      logic caller_wren;
      // coverage off
      logic [0:0] caller_data;
      // coverage on
      logic [0:0] caller_loop_count;
      logic caller_almost_full;
      logic [0:0] output_callee_data;
      logic [0:0] output_caller_data;
  } context_saver_data_77;
  assign context_saver_data_77.caller_data = '0;
  wire         context_saver_77_rmsnorm_reset_ContextSaver_caller_wren_in__circt =
    context_saver_data_77.caller_wren;
  wire         context_saver_77_rmsnorm_reset_ContextSaver_caller_data_in__circt =
    context_saver_data_77.caller_data;
  wire         context_saver_77_rmsnorm_reset_ContextSaver_caller_loop_count_in__circt =
    context_saver_data_77.caller_loop_count;

  struct packed {
      logic caller_wren;
      // coverage off
      logic [0:0] caller_data;
      // coverage on
      logic [0:0] caller_loop_count;
      logic caller_almost_full;
      logic [31:0] output_callee_data;
      logic [0:0] output_caller_data;
  } context_saver_data_79;
  assign context_saver_data_79.caller_data = '0;
  layer_orchestrator_ContextSaverMerger79 context_saver_merger_rmsnorm_get_sum_79
  (
      .callee_data(context_saver_data_79.output_callee_data),
      .output_data(passthrough_data_49.data)
  );
  wire         context_saver_79_rmsnorm_get_sum_ContextSaver_caller_wren_in__circt =
    context_saver_data_79.caller_wren;
  wire         context_saver_79_rmsnorm_get_sum_ContextSaver_caller_data_in__circt =
    context_saver_data_79.caller_data;
  wire         context_saver_79_rmsnorm_get_sum_ContextSaver_caller_loop_count_in__circt =
    context_saver_data_79.caller_loop_count;

  struct packed {
      logic caller_wren;
      // coverage off
      logic [0:0] caller_data;
      // coverage on
      logic [0:0] caller_loop_count;
      logic caller_almost_full;
      logic [0:0] output_callee_data;
      logic [0:0] output_caller_data;
  } context_saver_data_81;
  assign context_saver_data_81.caller_data = '0;
  wire         context_saver_81_rmsnorm_accumulate_ContextSaver_caller_wren_in__circt =
    context_saver_data_81.caller_wren;
  wire         context_saver_81_rmsnorm_accumulate_ContextSaver_caller_data_in__circt =
    context_saver_data_81.caller_data;
  wire
    context_saver_81_rmsnorm_accumulate_ContextSaver_caller_loop_count_in__circt =
    context_saver_data_81.caller_loop_count;

  struct packed {
      logic caller_wren;
      // coverage off
      logic [0:0] caller_data;
      // coverage on
      logic [0:0] caller_loop_count;
      logic caller_almost_full;
      logic [15:0] output_callee_data;
      logic [0:0] output_caller_data;
  } context_saver_data_83;
  assign context_saver_data_83.caller_data = '0;
  layer_orchestrator_ContextSaverMerger83 context_saver_merger_swiglu_compute_83
  (
      .callee_data(context_saver_data_83.output_callee_data),
      .output_data(passthrough_data_53.data)
  );
  wire         context_saver_83_swiglu_compute_ContextSaver_caller_wren_in__circt =
    context_saver_data_83.caller_wren;
  wire         context_saver_83_swiglu_compute_ContextSaver_caller_data_in__circt =
    context_saver_data_83.caller_data;
  wire         context_saver_83_swiglu_compute_ContextSaver_caller_loop_count_in__circt =
    context_saver_data_83.caller_loop_count;

  struct packed {
      logic caller_wren;
      // coverage off
      logic [0:0] caller_data;
      // coverage on
      logic [0:0] caller_loop_count;
      logic caller_almost_full;
      logic [15:0] output_callee_data;
      logic [0:0] output_caller_data;
  } context_saver_data_85;
  assign context_saver_data_85.caller_data = '0;
  layer_orchestrator_ContextSaverMerger85 context_saver_merger_residual_add_85
  (
      .callee_data(context_saver_data_85.output_callee_data),
      .output_data(passthrough_data_55.data)
  );
  wire         context_saver_85_residual_add_ContextSaver_caller_wren_in__circt =
    context_saver_data_85.caller_wren;
  wire         context_saver_85_residual_add_ContextSaver_caller_data_in__circt =
    context_saver_data_85.caller_data;
  wire         context_saver_85_residual_add_ContextSaver_caller_loop_count_in__circt =
    context_saver_data_85.caller_loop_count;

  struct packed {
      logic caller_wren;
      // coverage off
      logic [0:0] caller_data;
      // coverage on
      logic [0:0] caller_loop_count;
      logic caller_almost_full;
      logic [15:0] output_callee_data;
      logic [0:0] output_caller_data;
  } context_saver_data_87;
  assign context_saver_data_87.caller_data = '0;
  layer_orchestrator_ContextSaverMerger87 context_saver_merger_rotate_even_87
  (
      .callee_data(context_saver_data_87.output_callee_data),
      .output_data(passthrough_data_57.data)
  );
  wire         context_saver_87_rotate_even_ContextSaver_caller_wren_in__circt =
    context_saver_data_87.caller_wren;
  wire         context_saver_87_rotate_even_ContextSaver_caller_data_in__circt =
    context_saver_data_87.caller_data;
  wire         context_saver_87_rotate_even_ContextSaver_caller_loop_count_in__circt =
    context_saver_data_87.caller_loop_count;

  struct packed {
      logic caller_wren;
      // coverage off
      logic [0:0] caller_data;
      // coverage on
      logic [0:0] caller_loop_count;
      logic caller_almost_full;
      logic [15:0] output_callee_data;
      logic [0:0] output_caller_data;
  } context_saver_data_89;
  assign context_saver_data_89.caller_data = '0;
  layer_orchestrator_ContextSaverMerger89 context_saver_merger_rotate_odd_89
  (
      .callee_data(context_saver_data_89.output_callee_data),
      .output_data(passthrough_data_59.data)
  );
  wire         context_saver_89_rotate_odd_ContextSaver_caller_wren_in__circt =
    context_saver_data_89.caller_wren;
  wire         context_saver_89_rotate_odd_ContextSaver_caller_data_in__circt =
    context_saver_data_89.caller_data;
  wire         context_saver_89_rotate_odd_ContextSaver_caller_loop_count_in__circt =
    context_saver_data_89.caller_loop_count;
  wire         forward_cos_BasicBlock_0Impl_semaphore_full_0_in__circt =
    thread_count___globalObject___forward_cos_0.full;	// layer_orchestrator.k:33:51
  wire         forward_sin_BasicBlock_0Impl_semaphore_full_1_in__circt =
    thread_count___globalObject___forward_sin_1.full;	// layer_orchestrator.k:34:51
  wire         read_cos_forwarded_BasicBlock_0Impl_semaphore_full_2_in__circt =
    thread_count___globalObject___read_cos_forwarded_2.full;	// layer_orchestrator.k:35:51
  wire         read_sin_forwarded_BasicBlock_0Impl_semaphore_full_3_in__circt =
    thread_count___globalObject___read_sin_forwarded_3.full;	// layer_orchestrator.k:36:51
  wire         prog_gamma_pre_attn_BasicBlock_0Impl_semaphore_full_4_in__circt =
    thread_count___globalObject___prog_gamma_pre_attn_4.full;	// layer_orchestrator.k:42:56
  wire         prog_gamma_pre_mlp_BasicBlock_0Impl_semaphore_full_5_in__circt =
    thread_count___globalObject___prog_gamma_pre_mlp_5.full;	// layer_orchestrator.k:43:56
  wire         prog_rsqrt_lut_BasicBlock_0Impl_semaphore_full_6_in__circt =
    thread_count___globalObject___prog_rsqrt_lut_6.full;	// layer_orchestrator.k:44:56
  wire         prog_sigmoid_lut_BasicBlock_0Impl_semaphore_full_7_in__circt =
    thread_count___globalObject___prog_sigmoid_lut_7.full;	// layer_orchestrator.k:45:56
  wire         rmsnorm_reset_BasicBlock_0Impl_semaphore_full_8_in__circt =
    thread_count___globalObject___rmsnorm_reset_8.full;	// layer_orchestrator.k:56:28
  wire         rmsnorm_get_sum_BasicBlock_0Impl_semaphore_full_9_in__circt =
    thread_count___globalObject___rmsnorm_get_sum_9.full;	// layer_orchestrator.k:57:32
  wire         rmsnorm_step_BasicBlock_0Impl_semaphore_full_10_in__circt =
    thread_count___globalObject___rmsnorm_step_10.full;	// layer_orchestrator.k:62:40
  wire         swiglu_step_BasicBlock_0Impl_semaphore_full_11_in__circt =
    thread_count___globalObject___swiglu_step_11.full;	// layer_orchestrator.k:66:9
  wire         residual_add_step_BasicBlock_0Impl_semaphore_full_12_in__circt =
    thread_count___globalObject___residual_add_step_12.full;	// layer_orchestrator.k:71:9
  wire         rotate_even_BasicBlock_0Impl_semaphore_full_13_in__circt =
    thread_count___globalObject___rotate_even_13.full;	// layer_orchestrator.k:76:9
  wire         rotate_odd_BasicBlock_0Impl_semaphore_full_14_in__circt =
    thread_count___globalObject___rotate_odd_14.full;	// layer_orchestrator.k:79:9
  always_comb begin
    rst_and_startup_done_out_net = _reset_control_rst_and_startup_done_out;
    reg_rst_delayed = _reset_control_rst_delayed_out;
    reset_sequence_finished_this_cycle = _reset_control_reset_sequence_finished_this_cycle_out;
    thread_count___globalObject___forward_cos_0.full = _thread_count___globalObject___forward_cos_0_counter_full_out;
    thread_count___globalObject___forward_sin_1.full = _thread_count___globalObject___forward_sin_1_counter_full_out;
    thread_count___globalObject___read_cos_forwarded_2.full = _thread_count___globalObject___read_cos_forwarded_2_counter_full_out;
    thread_count___globalObject___read_sin_forwarded_3.full = _thread_count___globalObject___read_sin_forwarded_3_counter_full_out;
    thread_count___globalObject___prog_gamma_pre_attn_4.full = _thread_count___globalObject___prog_gamma_pre_attn_4_counter_full_out;
    thread_count___globalObject___prog_gamma_pre_mlp_5.full = _thread_count___globalObject___prog_gamma_pre_mlp_5_counter_full_out;
    thread_count___globalObject___prog_rsqrt_lut_6.full = _thread_count___globalObject___prog_rsqrt_lut_6_counter_full_out;
    thread_count___globalObject___prog_sigmoid_lut_7.full = _thread_count___globalObject___prog_sigmoid_lut_7_counter_full_out;
    thread_count___globalObject___rmsnorm_reset_8.full = _thread_count___globalObject___rmsnorm_reset_8_counter_full_out;
    thread_count___globalObject___rmsnorm_get_sum_9.full = _thread_count___globalObject___rmsnorm_get_sum_9_counter_full_out;
    thread_count___globalObject___rmsnorm_step_10.full = _thread_count___globalObject___rmsnorm_step_10_counter_full_out;
    thread_count___globalObject___swiglu_step_11.full = _thread_count___globalObject___swiglu_step_11_counter_full_out;
    thread_count___globalObject___residual_add_step_12.full = _thread_count___globalObject___residual_add_step_12_counter_full_out;
    thread_count___globalObject___rotate_even_13.full = _thread_count___globalObject___rotate_even_13_counter_full_out;
    thread_count___globalObject___rotate_odd_14.full = _thread_count___globalObject___rotate_odd_14_counter_full_out;
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
    has_startup_completed_delayed_10 = _has_startup_completed_delayed_10_delay_chain_data_out;
    has_startup_completed_delayed_11 = _has_startup_completed_delayed_11_delay_chain_data_out;
    has_startup_completed_delayed_12 = _has_startup_completed_delayed_12_delay_chain_data_out;
    has_startup_completed_delayed_13 = _has_startup_completed_delayed_13_delay_chain_data_out;
    has_startup_completed_delayed_14 = _has_startup_completed_delayed_14_delay_chain_data_out;
    has_startup_completed_delayed_15 = _has_startup_completed_delayed_15_delay_chain_data_out;
    has_startup_completed_delayed_16 = _has_startup_completed_delayed_16_delay_chain_data_out;
    has_startup_completed_delayed_17 = _has_startup_completed_delayed_17_delay_chain_data_out;
    has_startup_completed_delayed_18 = _has_startup_completed_delayed_18_delay_chain_data_out;
    has_startup_completed_delayed_19 = _has_startup_completed_delayed_19_delay_chain_data_out;
    has_startup_completed_delayed_20 = _has_startup_completed_delayed_20_delay_chain_data_out;
    has_startup_completed_delayed_21 = _has_startup_completed_delayed_21_delay_chain_data_out;
    has_startup_completed_delayed_22 = _has_startup_completed_delayed_22_delay_chain_data_out;
    has_startup_completed_delayed_23 = _has_startup_completed_delayed_23_delay_chain_data_out;
    has_startup_completed_delayed_24 = _has_startup_completed_delayed_24_delay_chain_data_out;
    has_startup_completed_delayed_25 = _has_startup_completed_delayed_25_delay_chain_data_out;
    has_startup_completed_delayed_26 = _has_startup_completed_delayed_26_delay_chain_data_out;
    has_startup_completed_delayed_27 = _has_startup_completed_delayed_27_delay_chain_data_out;
    has_startup_completed_delayed_28 = _has_startup_completed_delayed_28_delay_chain_data_out;
    has_startup_completed_delayed_29 = _has_startup_completed_delayed_29_delay_chain_data_out;
    fifo_data_0.overflow = _fifo_0_forward_cos_Return_overflow_out;
    fifo_data_0.underflow = _fifo_0_forward_cos_Return_underflow_out;
    fifo_data_0.empty = _fifo_0_forward_cos_Return_empty;
    fifo_data_0.almost_full = _fifo_0_forward_cos_Return_full;
    fifo_data_1.overflow = _fifo_1_forward_sin_Return_overflow_out;
    fifo_data_1.underflow = _fifo_1_forward_sin_Return_underflow_out;
    fifo_data_1.empty = _fifo_1_forward_sin_Return_empty;
    fifo_data_1.almost_full = _fifo_1_forward_sin_Return_full;
    fifo_data_2.overflow = _fifo_2_read_cos_forwarded_Return_overflow_out;
    fifo_data_2.underflow = _fifo_2_read_cos_forwarded_Return_underflow_out;
    fifo_data_2.empty = _fifo_2_read_cos_forwarded_Return_empty;
    fifo_data_2.almost_full = _fifo_2_read_cos_forwarded_Return_full;
    fifo_data_2.data_out = _fifo_2_read_cos_forwarded_Return_q;
    fifo_data_3.overflow = _fifo_3_read_sin_forwarded_Return_overflow_out;
    fifo_data_3.underflow = _fifo_3_read_sin_forwarded_Return_underflow_out;
    fifo_data_3.empty = _fifo_3_read_sin_forwarded_Return_empty;
    fifo_data_3.almost_full = _fifo_3_read_sin_forwarded_Return_full;
    fifo_data_3.data_out = _fifo_3_read_sin_forwarded_Return_q;
    fifo_data_4.overflow = _fifo_4_prog_gamma_pre_attn_Return_overflow_out;
    fifo_data_4.underflow = _fifo_4_prog_gamma_pre_attn_Return_underflow_out;
    fifo_data_4.empty = _fifo_4_prog_gamma_pre_attn_Return_empty;
    fifo_data_4.almost_full = _fifo_4_prog_gamma_pre_attn_Return_full;
    fifo_data_5.overflow = _fifo_5_prog_gamma_pre_mlp_Return_overflow_out;
    fifo_data_5.underflow = _fifo_5_prog_gamma_pre_mlp_Return_underflow_out;
    fifo_data_5.empty = _fifo_5_prog_gamma_pre_mlp_Return_empty;
    fifo_data_5.almost_full = _fifo_5_prog_gamma_pre_mlp_Return_full;
    fifo_data_6.overflow = _fifo_6_prog_rsqrt_lut_Return_overflow_out;
    fifo_data_6.underflow = _fifo_6_prog_rsqrt_lut_Return_underflow_out;
    fifo_data_6.empty = _fifo_6_prog_rsqrt_lut_Return_empty;
    fifo_data_6.almost_full = _fifo_6_prog_rsqrt_lut_Return_full;
    fifo_data_7.overflow = _fifo_7_prog_sigmoid_lut_Return_overflow_out;
    fifo_data_7.underflow = _fifo_7_prog_sigmoid_lut_Return_underflow_out;
    fifo_data_7.empty = _fifo_7_prog_sigmoid_lut_Return_empty;
    fifo_data_7.almost_full = _fifo_7_prog_sigmoid_lut_Return_full;
    fifo_data_8.overflow = _fifo_8_rmsnorm_reset_Return_overflow_out;
    fifo_data_8.underflow = _fifo_8_rmsnorm_reset_Return_underflow_out;
    fifo_data_8.empty = _fifo_8_rmsnorm_reset_Return_empty;
    fifo_data_8.almost_full = _fifo_8_rmsnorm_reset_Return_full;
    fifo_data_9.overflow = _fifo_9_rmsnorm_get_sum_Return_overflow_out;
    fifo_data_9.underflow = _fifo_9_rmsnorm_get_sum_Return_underflow_out;
    fifo_data_9.empty = _fifo_9_rmsnorm_get_sum_Return_empty;
    fifo_data_9.almost_full = _fifo_9_rmsnorm_get_sum_Return_full;
    fifo_data_9.data_out = _fifo_9_rmsnorm_get_sum_Return_q;
    fifo_data_10.overflow = _fifo_10_rmsnorm_step_Return_overflow_out;
    fifo_data_10.underflow = _fifo_10_rmsnorm_step_Return_underflow_out;
    fifo_data_10.empty = _fifo_10_rmsnorm_step_Return_empty;
    fifo_data_10.almost_full = _fifo_10_rmsnorm_step_Return_full;
    fifo_data_11.overflow = _fifo_11_swiglu_step_Return_overflow_out;
    fifo_data_11.underflow = _fifo_11_swiglu_step_Return_underflow_out;
    fifo_data_11.empty = _fifo_11_swiglu_step_Return_empty;
    fifo_data_11.almost_full = _fifo_11_swiglu_step_Return_full;
    fifo_data_11.data_out = _fifo_11_swiglu_step_Return_q;
    fifo_data_12.overflow = _fifo_12_residual_add_step_Return_overflow_out;
    fifo_data_12.underflow = _fifo_12_residual_add_step_Return_underflow_out;
    fifo_data_12.empty = _fifo_12_residual_add_step_Return_empty;
    fifo_data_12.almost_full = _fifo_12_residual_add_step_Return_full;
    fifo_data_12.data_out = _fifo_12_residual_add_step_Return_q;
    fifo_data_13.overflow = _fifo_13_rotate_even_Return_overflow_out;
    fifo_data_13.underflow = _fifo_13_rotate_even_Return_underflow_out;
    fifo_data_13.empty = _fifo_13_rotate_even_Return_empty;
    fifo_data_13.almost_full = _fifo_13_rotate_even_Return_full;
    fifo_data_13.data_out = _fifo_13_rotate_even_Return_q;
    fifo_data_14.overflow = _fifo_14_rotate_odd_Return_overflow_out;
    fifo_data_14.underflow = _fifo_14_rotate_odd_Return_underflow_out;
    fifo_data_14.empty = _fifo_14_rotate_odd_Return_empty;
    fifo_data_14.almost_full = _fifo_14_rotate_odd_Return_full;
    fifo_data_14.data_out = _fifo_14_rotate_odd_Return_q;
    fifo_data_15.overflow = _fifo_15_forward_cos_Entry_overflow_out;
    fifo_data_15.underflow = _fifo_15_forward_cos_Entry_underflow_out;
    fifo_data_15.empty = _fifo_15_forward_cos_Entry_empty;
    fifo_data_15.almost_full = _fifo_15_forward_cos_Entry_full;
    fifo_data_15.encoded_data_out = _fifo_15_forward_cos_Entry_q;
    fifo_data_16.overflow = _fifo_16_forward_sin_Entry_overflow_out;
    fifo_data_16.underflow = _fifo_16_forward_sin_Entry_underflow_out;
    fifo_data_16.empty = _fifo_16_forward_sin_Entry_empty;
    fifo_data_16.almost_full = _fifo_16_forward_sin_Entry_full;
    fifo_data_16.encoded_data_out = _fifo_16_forward_sin_Entry_q;
    fifo_data_17.overflow = _fifo_17_read_cos_forwarded_Entry_overflow_out;
    fifo_data_17.underflow = _fifo_17_read_cos_forwarded_Entry_underflow_out;
    fifo_data_17.empty = _fifo_17_read_cos_forwarded_Entry_empty;
    fifo_data_17.almost_full = _fifo_17_read_cos_forwarded_Entry_full;
    fifo_data_17.encoded_data_out = _fifo_17_read_cos_forwarded_Entry_q;
    fifo_data_18.overflow = _fifo_18_read_sin_forwarded_Entry_overflow_out;
    fifo_data_18.underflow = _fifo_18_read_sin_forwarded_Entry_underflow_out;
    fifo_data_18.empty = _fifo_18_read_sin_forwarded_Entry_empty;
    fifo_data_18.almost_full = _fifo_18_read_sin_forwarded_Entry_full;
    fifo_data_18.encoded_data_out = _fifo_18_read_sin_forwarded_Entry_q;
    fifo_data_19.overflow = _fifo_19_rotate_even_Entry_overflow_out;
    fifo_data_19.underflow = _fifo_19_rotate_even_Entry_underflow_out;
    fifo_data_19.empty = _fifo_19_rotate_even_Entry_empty;
    fifo_data_19.almost_full = _fifo_19_rotate_even_Entry_full;
    fifo_data_19.encoded_data_out = _fifo_19_rotate_even_Entry_q;
    fifo_data_20.overflow = _fifo_20_rotate_odd_Entry_overflow_out;
    fifo_data_20.underflow = _fifo_20_rotate_odd_Entry_underflow_out;
    fifo_data_20.empty = _fifo_20_rotate_odd_Entry_empty;
    fifo_data_20.almost_full = _fifo_20_rotate_odd_Entry_full;
    fifo_data_20.encoded_data_out = _fifo_20_rotate_odd_Entry_q;
    fifo_data_21.overflow = _fifo_21_rmsnorm_accumulate_Entry_overflow_out;
    fifo_data_21.underflow = _fifo_21_rmsnorm_accumulate_Entry_underflow_out;
    fifo_data_21.empty = _fifo_21_rmsnorm_accumulate_Entry_empty;
    fifo_data_21.almost_full = _fifo_21_rmsnorm_accumulate_Entry_full;
    fifo_data_21.encoded_data_out = _fifo_21_rmsnorm_accumulate_Entry_q;
    fifo_data_22.overflow = _fifo_22_rmsnorm_get_sum_Entry_overflow_out;
    fifo_data_22.underflow = _fifo_22_rmsnorm_get_sum_Entry_underflow_out;
    fifo_data_22.empty = _fifo_22_rmsnorm_get_sum_Entry_empty;
    fifo_data_22.almost_full = _fifo_22_rmsnorm_get_sum_Entry_full;
    fifo_data_23.overflow = _fifo_23_rmsnorm_reset_Entry_overflow_out;
    fifo_data_23.underflow = _fifo_23_rmsnorm_reset_Entry_underflow_out;
    fifo_data_23.empty = _fifo_23_rmsnorm_reset_Entry_empty;
    fifo_data_23.almost_full = _fifo_23_rmsnorm_reset_Entry_full;
    fifo_data_24.overflow = _fifo_24_set_gamma_pre_attn_Entry_overflow_out;
    fifo_data_24.underflow = _fifo_24_set_gamma_pre_attn_Entry_underflow_out;
    fifo_data_24.empty = _fifo_24_set_gamma_pre_attn_Entry_empty;
    fifo_data_24.almost_full = _fifo_24_set_gamma_pre_attn_Entry_full;
    fifo_data_24.encoded_data_out = _fifo_24_set_gamma_pre_attn_Entry_q;
    fifo_data_25.overflow = _fifo_25_set_gamma_pre_mlp_Entry_overflow_out;
    fifo_data_25.underflow = _fifo_25_set_gamma_pre_mlp_Entry_underflow_out;
    fifo_data_25.empty = _fifo_25_set_gamma_pre_mlp_Entry_empty;
    fifo_data_25.almost_full = _fifo_25_set_gamma_pre_mlp_Entry_full;
    fifo_data_25.encoded_data_out = _fifo_25_set_gamma_pre_mlp_Entry_q;
    fifo_data_26.overflow = _fifo_26_set_rsqrt_lut_Entry_overflow_out;
    fifo_data_26.underflow = _fifo_26_set_rsqrt_lut_Entry_underflow_out;
    fifo_data_26.empty = _fifo_26_set_rsqrt_lut_Entry_empty;
    fifo_data_26.almost_full = _fifo_26_set_rsqrt_lut_Entry_full;
    fifo_data_26.encoded_data_out = _fifo_26_set_rsqrt_lut_Entry_q;
    fifo_data_27.overflow = _fifo_27_set_sigmoid_lut_Entry_overflow_out;
    fifo_data_27.underflow = _fifo_27_set_sigmoid_lut_Entry_underflow_out;
    fifo_data_27.empty = _fifo_27_set_sigmoid_lut_Entry_empty;
    fifo_data_27.almost_full = _fifo_27_set_sigmoid_lut_Entry_full;
    fifo_data_27.encoded_data_out = _fifo_27_set_sigmoid_lut_Entry_q;
    fifo_data_28.overflow = _fifo_28_swiglu_compute_Entry_overflow_out;
    fifo_data_28.underflow = _fifo_28_swiglu_compute_Entry_underflow_out;
    fifo_data_28.empty = _fifo_28_swiglu_compute_Entry_empty;
    fifo_data_28.almost_full = _fifo_28_swiglu_compute_Entry_full;
    fifo_data_28.encoded_data_out = _fifo_28_swiglu_compute_Entry_q;
    fifo_data_29.overflow = _fifo_29_residual_add_Entry_overflow_out;
    fifo_data_29.underflow = _fifo_29_residual_add_Entry_underflow_out;
    fifo_data_29.empty = _fifo_29_residual_add_Entry_empty;
    fifo_data_29.almost_full = _fifo_29_residual_add_Entry_full;
    fifo_data_29.encoded_data_out = _fifo_29_residual_add_Entry_q;
    fifo_data_60.overflow = _fifo_60_forward_cos_FromCallee_overflow_out;
    fifo_data_60.underflow = _fifo_60_forward_cos_FromCallee_underflow_out;
    fifo_data_60.empty = _fifo_60_forward_cos_FromCallee_empty;
    fifo_data_60.almost_full = _fifo_60_forward_cos_FromCallee_full;
    fifo_data_62.overflow = _fifo_62_forward_sin_FromCallee_overflow_out;
    fifo_data_62.underflow = _fifo_62_forward_sin_FromCallee_underflow_out;
    fifo_data_62.empty = _fifo_62_forward_sin_FromCallee_empty;
    fifo_data_62.almost_full = _fifo_62_forward_sin_FromCallee_full;
    fifo_data_64.overflow = _fifo_64_read_cos_forwarded_FromCallee_overflow_out;
    fifo_data_64.underflow = _fifo_64_read_cos_forwarded_FromCallee_underflow_out;
    fifo_data_64.empty = _fifo_64_read_cos_forwarded_FromCallee_empty;
    fifo_data_64.almost_full = _fifo_64_read_cos_forwarded_FromCallee_full;
    fifo_data_64.data_out = _fifo_64_read_cos_forwarded_FromCallee_q;
    fifo_data_66.overflow = _fifo_66_read_sin_forwarded_FromCallee_overflow_out;
    fifo_data_66.underflow = _fifo_66_read_sin_forwarded_FromCallee_underflow_out;
    fifo_data_66.empty = _fifo_66_read_sin_forwarded_FromCallee_empty;
    fifo_data_66.almost_full = _fifo_66_read_sin_forwarded_FromCallee_full;
    fifo_data_66.data_out = _fifo_66_read_sin_forwarded_FromCallee_q;
    fifo_data_68.overflow = _fifo_68_set_gamma_pre_attn_FromCallee_overflow_out;
    fifo_data_68.underflow = _fifo_68_set_gamma_pre_attn_FromCallee_underflow_out;
    fifo_data_68.empty = _fifo_68_set_gamma_pre_attn_FromCallee_empty;
    fifo_data_68.almost_full = _fifo_68_set_gamma_pre_attn_FromCallee_full;
    fifo_data_70.overflow = _fifo_70_set_gamma_pre_mlp_FromCallee_overflow_out;
    fifo_data_70.underflow = _fifo_70_set_gamma_pre_mlp_FromCallee_underflow_out;
    fifo_data_70.empty = _fifo_70_set_gamma_pre_mlp_FromCallee_empty;
    fifo_data_70.almost_full = _fifo_70_set_gamma_pre_mlp_FromCallee_full;
    fifo_data_72.overflow = _fifo_72_set_rsqrt_lut_FromCallee_overflow_out;
    fifo_data_72.underflow = _fifo_72_set_rsqrt_lut_FromCallee_underflow_out;
    fifo_data_72.empty = _fifo_72_set_rsqrt_lut_FromCallee_empty;
    fifo_data_72.almost_full = _fifo_72_set_rsqrt_lut_FromCallee_full;
    fifo_data_74.overflow = _fifo_74_set_sigmoid_lut_FromCallee_overflow_out;
    fifo_data_74.underflow = _fifo_74_set_sigmoid_lut_FromCallee_underflow_out;
    fifo_data_74.empty = _fifo_74_set_sigmoid_lut_FromCallee_empty;
    fifo_data_74.almost_full = _fifo_74_set_sigmoid_lut_FromCallee_full;
    fifo_data_76.overflow = _fifo_76_rmsnorm_reset_FromCallee_overflow_out;
    fifo_data_76.underflow = _fifo_76_rmsnorm_reset_FromCallee_underflow_out;
    fifo_data_76.empty = _fifo_76_rmsnorm_reset_FromCallee_empty;
    fifo_data_76.almost_full = _fifo_76_rmsnorm_reset_FromCallee_full;
    fifo_data_78.overflow = _fifo_78_rmsnorm_get_sum_FromCallee_overflow_out;
    fifo_data_78.underflow = _fifo_78_rmsnorm_get_sum_FromCallee_underflow_out;
    fifo_data_78.empty = _fifo_78_rmsnorm_get_sum_FromCallee_empty;
    fifo_data_78.almost_full = _fifo_78_rmsnorm_get_sum_FromCallee_full;
    fifo_data_78.data_out = _fifo_78_rmsnorm_get_sum_FromCallee_q;
    fifo_data_80.overflow = _fifo_80_rmsnorm_accumulate_FromCallee_overflow_out;
    fifo_data_80.underflow = _fifo_80_rmsnorm_accumulate_FromCallee_underflow_out;
    fifo_data_80.empty = _fifo_80_rmsnorm_accumulate_FromCallee_empty;
    fifo_data_80.almost_full = _fifo_80_rmsnorm_accumulate_FromCallee_full;
    fifo_data_82.overflow = _fifo_82_swiglu_compute_FromCallee_overflow_out;
    fifo_data_82.underflow = _fifo_82_swiglu_compute_FromCallee_underflow_out;
    fifo_data_82.empty = _fifo_82_swiglu_compute_FromCallee_empty;
    fifo_data_82.almost_full = _fifo_82_swiglu_compute_FromCallee_full;
    fifo_data_82.data_out = _fifo_82_swiglu_compute_FromCallee_q;
    fifo_data_84.overflow = _fifo_84_residual_add_FromCallee_overflow_out;
    fifo_data_84.underflow = _fifo_84_residual_add_FromCallee_underflow_out;
    fifo_data_84.empty = _fifo_84_residual_add_FromCallee_empty;
    fifo_data_84.almost_full = _fifo_84_residual_add_FromCallee_full;
    fifo_data_84.data_out = _fifo_84_residual_add_FromCallee_q;
    fifo_data_86.overflow = _fifo_86_rotate_even_FromCallee_overflow_out;
    fifo_data_86.underflow = _fifo_86_rotate_even_FromCallee_underflow_out;
    fifo_data_86.empty = _fifo_86_rotate_even_FromCallee_empty;
    fifo_data_86.almost_full = _fifo_86_rotate_even_FromCallee_full;
    fifo_data_86.data_out = _fifo_86_rotate_even_FromCallee_q;
    fifo_data_88.overflow = _fifo_88_rotate_odd_FromCallee_overflow_out;
    fifo_data_88.underflow = _fifo_88_rotate_odd_FromCallee_underflow_out;
    fifo_data_88.empty = _fifo_88_rotate_odd_FromCallee_empty;
    fifo_data_88.almost_full = _fifo_88_rotate_odd_FromCallee_full;
    fifo_data_88.data_out = _fifo_88_rotate_odd_FromCallee_q;
    context_saver_data_61.caller_almost_full = _context_saver_61_forward_cos_ContextSaver_caller_almost_full_out;
    fifo_data_60.rden = _context_saver_61_forward_cos_ContextSaver_callee_rden_out;
    passthrough_data_31.valid = _context_saver_61_forward_cos_ContextSaver_valid_out;
    context_saver_data_61.output_callee_data = _context_saver_61_forward_cos_ContextSaver_callee_data_out;
    context_saver_data_61.output_caller_data = _context_saver_61_forward_cos_ContextSaver_caller_data_out;
    context_saver_data_63.caller_almost_full = _context_saver_63_forward_sin_ContextSaver_caller_almost_full_out;
    fifo_data_62.rden = _context_saver_63_forward_sin_ContextSaver_callee_rden_out;
    passthrough_data_33.valid = _context_saver_63_forward_sin_ContextSaver_valid_out;
    context_saver_data_63.output_callee_data = _context_saver_63_forward_sin_ContextSaver_callee_data_out;
    context_saver_data_63.output_caller_data = _context_saver_63_forward_sin_ContextSaver_caller_data_out;
    context_saver_data_65.caller_almost_full = _context_saver_65_read_cos_forwarded_ContextSaver_caller_almost_full_out;
    fifo_data_64.rden = _context_saver_65_read_cos_forwarded_ContextSaver_callee_rden_out;
    passthrough_data_35.valid = _context_saver_65_read_cos_forwarded_ContextSaver_valid_out;
    context_saver_data_65.output_callee_data = _context_saver_65_read_cos_forwarded_ContextSaver_callee_data_out;
    context_saver_data_65.output_caller_data = _context_saver_65_read_cos_forwarded_ContextSaver_caller_data_out;
    context_saver_data_67.caller_almost_full = _context_saver_67_read_sin_forwarded_ContextSaver_caller_almost_full_out;
    fifo_data_66.rden = _context_saver_67_read_sin_forwarded_ContextSaver_callee_rden_out;
    passthrough_data_37.valid = _context_saver_67_read_sin_forwarded_ContextSaver_valid_out;
    context_saver_data_67.output_callee_data = _context_saver_67_read_sin_forwarded_ContextSaver_callee_data_out;
    context_saver_data_67.output_caller_data = _context_saver_67_read_sin_forwarded_ContextSaver_caller_data_out;
    context_saver_data_69.caller_almost_full = _context_saver_69_set_gamma_pre_attn_ContextSaver_caller_almost_full_out;
    fifo_data_68.rden = _context_saver_69_set_gamma_pre_attn_ContextSaver_callee_rden_out;
    passthrough_data_39.valid = _context_saver_69_set_gamma_pre_attn_ContextSaver_valid_out;
    context_saver_data_69.output_callee_data = _context_saver_69_set_gamma_pre_attn_ContextSaver_callee_data_out;
    context_saver_data_69.output_caller_data = _context_saver_69_set_gamma_pre_attn_ContextSaver_caller_data_out;
    context_saver_data_71.caller_almost_full = _context_saver_71_set_gamma_pre_mlp_ContextSaver_caller_almost_full_out;
    fifo_data_70.rden = _context_saver_71_set_gamma_pre_mlp_ContextSaver_callee_rden_out;
    passthrough_data_41.valid = _context_saver_71_set_gamma_pre_mlp_ContextSaver_valid_out;
    context_saver_data_71.output_callee_data = _context_saver_71_set_gamma_pre_mlp_ContextSaver_callee_data_out;
    context_saver_data_71.output_caller_data = _context_saver_71_set_gamma_pre_mlp_ContextSaver_caller_data_out;
    context_saver_data_73.caller_almost_full = _context_saver_73_set_rsqrt_lut_ContextSaver_caller_almost_full_out;
    fifo_data_72.rden = _context_saver_73_set_rsqrt_lut_ContextSaver_callee_rden_out;
    passthrough_data_43.valid = _context_saver_73_set_rsqrt_lut_ContextSaver_valid_out;
    context_saver_data_73.output_callee_data = _context_saver_73_set_rsqrt_lut_ContextSaver_callee_data_out;
    context_saver_data_73.output_caller_data = _context_saver_73_set_rsqrt_lut_ContextSaver_caller_data_out;
    context_saver_data_75.caller_almost_full = _context_saver_75_set_sigmoid_lut_ContextSaver_caller_almost_full_out;
    fifo_data_74.rden = _context_saver_75_set_sigmoid_lut_ContextSaver_callee_rden_out;
    passthrough_data_45.valid = _context_saver_75_set_sigmoid_lut_ContextSaver_valid_out;
    context_saver_data_75.output_callee_data = _context_saver_75_set_sigmoid_lut_ContextSaver_callee_data_out;
    context_saver_data_75.output_caller_data = _context_saver_75_set_sigmoid_lut_ContextSaver_caller_data_out;
    context_saver_data_77.caller_almost_full = _context_saver_77_rmsnorm_reset_ContextSaver_caller_almost_full_out;
    fifo_data_76.rden = _context_saver_77_rmsnorm_reset_ContextSaver_callee_rden_out;
    passthrough_data_47.valid = _context_saver_77_rmsnorm_reset_ContextSaver_valid_out;
    context_saver_data_77.output_callee_data = _context_saver_77_rmsnorm_reset_ContextSaver_callee_data_out;
    context_saver_data_77.output_caller_data = _context_saver_77_rmsnorm_reset_ContextSaver_caller_data_out;
    context_saver_data_79.caller_almost_full = _context_saver_79_rmsnorm_get_sum_ContextSaver_caller_almost_full_out;
    fifo_data_78.rden = _context_saver_79_rmsnorm_get_sum_ContextSaver_callee_rden_out;
    passthrough_data_49.valid = _context_saver_79_rmsnorm_get_sum_ContextSaver_valid_out;
    context_saver_data_79.output_callee_data = _context_saver_79_rmsnorm_get_sum_ContextSaver_callee_data_out;
    context_saver_data_79.output_caller_data = _context_saver_79_rmsnorm_get_sum_ContextSaver_caller_data_out;
    context_saver_data_81.caller_almost_full = _context_saver_81_rmsnorm_accumulate_ContextSaver_caller_almost_full_out;
    fifo_data_80.rden = _context_saver_81_rmsnorm_accumulate_ContextSaver_callee_rden_out;
    passthrough_data_51.valid = _context_saver_81_rmsnorm_accumulate_ContextSaver_valid_out;
    context_saver_data_81.output_callee_data = _context_saver_81_rmsnorm_accumulate_ContextSaver_callee_data_out;
    context_saver_data_81.output_caller_data = _context_saver_81_rmsnorm_accumulate_ContextSaver_caller_data_out;
    context_saver_data_83.caller_almost_full = _context_saver_83_swiglu_compute_ContextSaver_caller_almost_full_out;
    fifo_data_82.rden = _context_saver_83_swiglu_compute_ContextSaver_callee_rden_out;
    passthrough_data_53.valid = _context_saver_83_swiglu_compute_ContextSaver_valid_out;
    context_saver_data_83.output_callee_data = _context_saver_83_swiglu_compute_ContextSaver_callee_data_out;
    context_saver_data_83.output_caller_data = _context_saver_83_swiglu_compute_ContextSaver_caller_data_out;
    context_saver_data_85.caller_almost_full = _context_saver_85_residual_add_ContextSaver_caller_almost_full_out;
    fifo_data_84.rden = _context_saver_85_residual_add_ContextSaver_callee_rden_out;
    passthrough_data_55.valid = _context_saver_85_residual_add_ContextSaver_valid_out;
    context_saver_data_85.output_callee_data = _context_saver_85_residual_add_ContextSaver_callee_data_out;
    context_saver_data_85.output_caller_data = _context_saver_85_residual_add_ContextSaver_caller_data_out;
    context_saver_data_87.caller_almost_full = _context_saver_87_rotate_even_ContextSaver_caller_almost_full_out;
    fifo_data_86.rden = _context_saver_87_rotate_even_ContextSaver_callee_rden_out;
    passthrough_data_57.valid = _context_saver_87_rotate_even_ContextSaver_valid_out;
    context_saver_data_87.output_callee_data = _context_saver_87_rotate_even_ContextSaver_callee_data_out;
    context_saver_data_87.output_caller_data = _context_saver_87_rotate_even_ContextSaver_caller_data_out;
    context_saver_data_89.caller_almost_full = _context_saver_89_rotate_odd_ContextSaver_caller_almost_full_out;
    fifo_data_88.rden = _context_saver_89_rotate_odd_ContextSaver_callee_rden_out;
    passthrough_data_59.valid = _context_saver_89_rotate_odd_ContextSaver_valid_out;
    context_saver_data_89.output_callee_data = _context_saver_89_rotate_odd_ContextSaver_callee_data_out;
    context_saver_data_89.output_caller_data = _context_saver_89_rotate_odd_ContextSaver_caller_data_out;
    thread_count___globalObject___forward_cos_0.incr_count = _forward_cos_BasicBlock_0Impl_incr_semaphore_thread_count_0_out;	// layer_orchestrator.k:33:51
    fifo_data_15.data_in = _forward_cos_BasicBlock_0Impl_fifo_data_out_0;	// layer_orchestrator.k:33:51
    fifo_data_15.wren = _forward_cos_BasicBlock_0Impl_fifo_wren_0;	// layer_orchestrator.k:33:51
    context_saver_data_61.caller_wren = _forward_cos_BasicBlock_0Impl_context_saver_caller_wren_1;	// layer_orchestrator.k:33:51
    context_saver_data_61.caller_loop_count = _forward_cos_BasicBlock_0Impl_context_saver_caller_loop_count_1;	// layer_orchestrator.k:33:51
    passthrough_data_30.rdy_int = _forward_cos_BasicBlock_0Impl_input_rdy_0;	// layer_orchestrator.k:33:51
    thread_count___globalObject___forward_cos_0.decr_count = _forward_cos_BasicBlock_1Impl_decr_semaphore_thread_count_0_out;	// layer_orchestrator.k:33:51
    fifo_data_0.wren = _forward_cos_BasicBlock_1Impl_fifo_wren_0;	// layer_orchestrator.k:33:51
    passthrough_data_31.rdy_int = _forward_cos_BasicBlock_1Impl_input_rdy_0;	// layer_orchestrator.k:33:51
    thread_count___globalObject___forward_sin_1.incr_count = _forward_sin_BasicBlock_0Impl_incr_semaphore_thread_count_1_out;	// layer_orchestrator.k:34:51
    fifo_data_16.data_in = _forward_sin_BasicBlock_0Impl_fifo_data_out_0;	// layer_orchestrator.k:34:51
    fifo_data_16.wren = _forward_sin_BasicBlock_0Impl_fifo_wren_0;	// layer_orchestrator.k:34:51
    context_saver_data_63.caller_wren = _forward_sin_BasicBlock_0Impl_context_saver_caller_wren_1;	// layer_orchestrator.k:34:51
    context_saver_data_63.caller_loop_count = _forward_sin_BasicBlock_0Impl_context_saver_caller_loop_count_1;	// layer_orchestrator.k:34:51
    passthrough_data_32.rdy_int = _forward_sin_BasicBlock_0Impl_input_rdy_0;	// layer_orchestrator.k:34:51
    thread_count___globalObject___forward_sin_1.decr_count = _forward_sin_BasicBlock_1Impl_decr_semaphore_thread_count_1_out;	// layer_orchestrator.k:34:51
    fifo_data_1.wren = _forward_sin_BasicBlock_1Impl_fifo_wren_0;	// layer_orchestrator.k:34:51
    passthrough_data_33.rdy_int = _forward_sin_BasicBlock_1Impl_input_rdy_0;	// layer_orchestrator.k:34:51
    thread_count___globalObject___read_cos_forwarded_2.incr_count = _read_cos_forwarded_BasicBlock_0Impl_incr_semaphore_thread_count_2_out;	// layer_orchestrator.k:35:51
    fifo_data_17.data_in = _read_cos_forwarded_BasicBlock_0Impl_fifo_data_out_0;	// layer_orchestrator.k:35:51
    fifo_data_17.wren = _read_cos_forwarded_BasicBlock_0Impl_fifo_wren_0;	// layer_orchestrator.k:35:51
    context_saver_data_65.caller_wren = _read_cos_forwarded_BasicBlock_0Impl_context_saver_caller_wren_1;	// layer_orchestrator.k:35:51
    context_saver_data_65.caller_loop_count = _read_cos_forwarded_BasicBlock_0Impl_context_saver_caller_loop_count_1;	// layer_orchestrator.k:35:51
    passthrough_data_34.rdy_int = _read_cos_forwarded_BasicBlock_0Impl_input_rdy_0;	// layer_orchestrator.k:35:51
    thread_count___globalObject___read_cos_forwarded_2.decr_count = _read_cos_forwarded_BasicBlock_1Impl_decr_semaphore_thread_count_2_out;	// layer_orchestrator.k:35:58
    fifo_data_2.data_in = _read_cos_forwarded_BasicBlock_1Impl_fifo_data_out_0;	// layer_orchestrator.k:35:58
    fifo_data_2.wren = _read_cos_forwarded_BasicBlock_1Impl_fifo_wren_0;	// layer_orchestrator.k:35:58
    passthrough_data_35.rdy_int = _read_cos_forwarded_BasicBlock_1Impl_input_rdy_0;	// layer_orchestrator.k:35:58
    thread_count___globalObject___read_sin_forwarded_3.incr_count = _read_sin_forwarded_BasicBlock_0Impl_incr_semaphore_thread_count_3_out;	// layer_orchestrator.k:36:51
    fifo_data_18.data_in = _read_sin_forwarded_BasicBlock_0Impl_fifo_data_out_0;	// layer_orchestrator.k:36:51
    fifo_data_18.wren = _read_sin_forwarded_BasicBlock_0Impl_fifo_wren_0;	// layer_orchestrator.k:36:51
    context_saver_data_67.caller_wren = _read_sin_forwarded_BasicBlock_0Impl_context_saver_caller_wren_1;	// layer_orchestrator.k:36:51
    context_saver_data_67.caller_loop_count = _read_sin_forwarded_BasicBlock_0Impl_context_saver_caller_loop_count_1;	// layer_orchestrator.k:36:51
    passthrough_data_36.rdy_int = _read_sin_forwarded_BasicBlock_0Impl_input_rdy_0;	// layer_orchestrator.k:36:51
    thread_count___globalObject___read_sin_forwarded_3.decr_count = _read_sin_forwarded_BasicBlock_1Impl_decr_semaphore_thread_count_3_out;	// layer_orchestrator.k:36:58
    fifo_data_3.data_in = _read_sin_forwarded_BasicBlock_1Impl_fifo_data_out_0;	// layer_orchestrator.k:36:58
    fifo_data_3.wren = _read_sin_forwarded_BasicBlock_1Impl_fifo_wren_0;	// layer_orchestrator.k:36:58
    passthrough_data_37.rdy_int = _read_sin_forwarded_BasicBlock_1Impl_input_rdy_0;	// layer_orchestrator.k:36:58
    thread_count___globalObject___prog_gamma_pre_attn_4.incr_count = _prog_gamma_pre_attn_BasicBlock_0Impl_incr_semaphore_thread_count_4_out;	// layer_orchestrator.k:42:56
    fifo_data_24.data_in = _prog_gamma_pre_attn_BasicBlock_0Impl_fifo_data_out_0;	// layer_orchestrator.k:42:56
    fifo_data_24.wren = _prog_gamma_pre_attn_BasicBlock_0Impl_fifo_wren_0;	// layer_orchestrator.k:42:56
    context_saver_data_69.caller_wren = _prog_gamma_pre_attn_BasicBlock_0Impl_context_saver_caller_wren_1;	// layer_orchestrator.k:42:56
    context_saver_data_69.caller_loop_count = _prog_gamma_pre_attn_BasicBlock_0Impl_context_saver_caller_loop_count_1;	// layer_orchestrator.k:42:56
    passthrough_data_38.rdy_int = _prog_gamma_pre_attn_BasicBlock_0Impl_input_rdy_0;	// layer_orchestrator.k:42:56
    thread_count___globalObject___prog_gamma_pre_attn_4.decr_count = _prog_gamma_pre_attn_BasicBlock_1Impl_decr_semaphore_thread_count_4_out;	// layer_orchestrator.k:42:56
    fifo_data_4.wren = _prog_gamma_pre_attn_BasicBlock_1Impl_fifo_wren_0;	// layer_orchestrator.k:42:56
    passthrough_data_39.rdy_int = _prog_gamma_pre_attn_BasicBlock_1Impl_input_rdy_0;	// layer_orchestrator.k:42:56
    thread_count___globalObject___prog_gamma_pre_mlp_5.incr_count = _prog_gamma_pre_mlp_BasicBlock_0Impl_incr_semaphore_thread_count_5_out;	// layer_orchestrator.k:43:56
    fifo_data_25.data_in = _prog_gamma_pre_mlp_BasicBlock_0Impl_fifo_data_out_0;	// layer_orchestrator.k:43:56
    fifo_data_25.wren = _prog_gamma_pre_mlp_BasicBlock_0Impl_fifo_wren_0;	// layer_orchestrator.k:43:56
    context_saver_data_71.caller_wren = _prog_gamma_pre_mlp_BasicBlock_0Impl_context_saver_caller_wren_1;	// layer_orchestrator.k:43:56
    context_saver_data_71.caller_loop_count = _prog_gamma_pre_mlp_BasicBlock_0Impl_context_saver_caller_loop_count_1;	// layer_orchestrator.k:43:56
    passthrough_data_40.rdy_int = _prog_gamma_pre_mlp_BasicBlock_0Impl_input_rdy_0;	// layer_orchestrator.k:43:56
    thread_count___globalObject___prog_gamma_pre_mlp_5.decr_count = _prog_gamma_pre_mlp_BasicBlock_1Impl_decr_semaphore_thread_count_5_out;	// layer_orchestrator.k:43:56
    fifo_data_5.wren = _prog_gamma_pre_mlp_BasicBlock_1Impl_fifo_wren_0;	// layer_orchestrator.k:43:56
    passthrough_data_41.rdy_int = _prog_gamma_pre_mlp_BasicBlock_1Impl_input_rdy_0;	// layer_orchestrator.k:43:56
    thread_count___globalObject___prog_rsqrt_lut_6.incr_count = _prog_rsqrt_lut_BasicBlock_0Impl_incr_semaphore_thread_count_6_out;	// layer_orchestrator.k:44:56
    fifo_data_26.data_in = _prog_rsqrt_lut_BasicBlock_0Impl_fifo_data_out_0;	// layer_orchestrator.k:44:56
    fifo_data_26.wren = _prog_rsqrt_lut_BasicBlock_0Impl_fifo_wren_0;	// layer_orchestrator.k:44:56
    context_saver_data_73.caller_wren = _prog_rsqrt_lut_BasicBlock_0Impl_context_saver_caller_wren_1;	// layer_orchestrator.k:44:56
    context_saver_data_73.caller_loop_count = _prog_rsqrt_lut_BasicBlock_0Impl_context_saver_caller_loop_count_1;	// layer_orchestrator.k:44:56
    passthrough_data_42.rdy_int = _prog_rsqrt_lut_BasicBlock_0Impl_input_rdy_0;	// layer_orchestrator.k:44:56
    thread_count___globalObject___prog_rsqrt_lut_6.decr_count = _prog_rsqrt_lut_BasicBlock_1Impl_decr_semaphore_thread_count_6_out;	// layer_orchestrator.k:44:56
    fifo_data_6.wren = _prog_rsqrt_lut_BasicBlock_1Impl_fifo_wren_0;	// layer_orchestrator.k:44:56
    passthrough_data_43.rdy_int = _prog_rsqrt_lut_BasicBlock_1Impl_input_rdy_0;	// layer_orchestrator.k:44:56
    thread_count___globalObject___prog_sigmoid_lut_7.incr_count = _prog_sigmoid_lut_BasicBlock_0Impl_incr_semaphore_thread_count_7_out;	// layer_orchestrator.k:45:56
    fifo_data_27.data_in = _prog_sigmoid_lut_BasicBlock_0Impl_fifo_data_out_0;	// layer_orchestrator.k:45:56
    fifo_data_27.wren = _prog_sigmoid_lut_BasicBlock_0Impl_fifo_wren_0;	// layer_orchestrator.k:45:56
    context_saver_data_75.caller_wren = _prog_sigmoid_lut_BasicBlock_0Impl_context_saver_caller_wren_1;	// layer_orchestrator.k:45:56
    context_saver_data_75.caller_loop_count = _prog_sigmoid_lut_BasicBlock_0Impl_context_saver_caller_loop_count_1;	// layer_orchestrator.k:45:56
    passthrough_data_44.rdy_int = _prog_sigmoid_lut_BasicBlock_0Impl_input_rdy_0;	// layer_orchestrator.k:45:56
    thread_count___globalObject___prog_sigmoid_lut_7.decr_count = _prog_sigmoid_lut_BasicBlock_1Impl_decr_semaphore_thread_count_7_out;	// layer_orchestrator.k:45:56
    fifo_data_7.wren = _prog_sigmoid_lut_BasicBlock_1Impl_fifo_wren_0;	// layer_orchestrator.k:45:56
    passthrough_data_45.rdy_int = _prog_sigmoid_lut_BasicBlock_1Impl_input_rdy_0;	// layer_orchestrator.k:45:56
    thread_count___globalObject___rmsnorm_reset_8.incr_count = _rmsnorm_reset_BasicBlock_0Impl_incr_semaphore_thread_count_8_out;	// layer_orchestrator.k:56:28
    fifo_data_23.data_in = _rmsnorm_reset_BasicBlock_0Impl_fifo_data_out_0;	// layer_orchestrator.k:56:28
    fifo_data_23.wren = _rmsnorm_reset_BasicBlock_0Impl_fifo_wren_0;	// layer_orchestrator.k:56:28
    context_saver_data_77.caller_wren = _rmsnorm_reset_BasicBlock_0Impl_context_saver_caller_wren_1;	// layer_orchestrator.k:56:28
    context_saver_data_77.caller_loop_count = _rmsnorm_reset_BasicBlock_0Impl_context_saver_caller_loop_count_1;	// layer_orchestrator.k:56:28
    passthrough_data_46.rdy_int = _rmsnorm_reset_BasicBlock_0Impl_input_rdy_0;	// layer_orchestrator.k:56:28
    thread_count___globalObject___rmsnorm_reset_8.decr_count = _rmsnorm_reset_BasicBlock_1Impl_decr_semaphore_thread_count_8_out;	// layer_orchestrator.k:56:28
    fifo_data_8.wren = _rmsnorm_reset_BasicBlock_1Impl_fifo_wren_0;	// layer_orchestrator.k:56:28
    passthrough_data_47.rdy_int = _rmsnorm_reset_BasicBlock_1Impl_input_rdy_0;	// layer_orchestrator.k:56:28
    thread_count___globalObject___rmsnorm_get_sum_9.incr_count = _rmsnorm_get_sum_BasicBlock_0Impl_incr_semaphore_thread_count_9_out;	// layer_orchestrator.k:57:32
    fifo_data_22.data_in = _rmsnorm_get_sum_BasicBlock_0Impl_fifo_data_out_0;	// layer_orchestrator.k:57:32
    fifo_data_22.wren = _rmsnorm_get_sum_BasicBlock_0Impl_fifo_wren_0;	// layer_orchestrator.k:57:32
    context_saver_data_79.caller_wren = _rmsnorm_get_sum_BasicBlock_0Impl_context_saver_caller_wren_1;	// layer_orchestrator.k:57:32
    context_saver_data_79.caller_loop_count = _rmsnorm_get_sum_BasicBlock_0Impl_context_saver_caller_loop_count_1;	// layer_orchestrator.k:57:32
    passthrough_data_48.rdy_int = _rmsnorm_get_sum_BasicBlock_0Impl_input_rdy_0;	// layer_orchestrator.k:57:32
    thread_count___globalObject___rmsnorm_get_sum_9.decr_count = _rmsnorm_get_sum_BasicBlock_1Impl_decr_semaphore_thread_count_9_out;	// layer_orchestrator.k:57:39
    fifo_data_9.data_in = _rmsnorm_get_sum_BasicBlock_1Impl_fifo_data_out_0;	// layer_orchestrator.k:57:39
    fifo_data_9.wren = _rmsnorm_get_sum_BasicBlock_1Impl_fifo_wren_0;	// layer_orchestrator.k:57:39
    passthrough_data_49.rdy_int = _rmsnorm_get_sum_BasicBlock_1Impl_input_rdy_0;	// layer_orchestrator.k:57:39
    thread_count___globalObject___rmsnorm_step_10.incr_count = _rmsnorm_step_BasicBlock_0Impl_incr_semaphore_thread_count_10_out;	// layer_orchestrator.k:62:40
    fifo_data_21.data_in = _rmsnorm_step_BasicBlock_0Impl_fifo_data_out_0;	// layer_orchestrator.k:62:40
    fifo_data_21.wren = _rmsnorm_step_BasicBlock_0Impl_fifo_wren_0;	// layer_orchestrator.k:62:40
    context_saver_data_81.caller_wren = _rmsnorm_step_BasicBlock_0Impl_context_saver_caller_wren_1;	// layer_orchestrator.k:62:40
    context_saver_data_81.caller_loop_count = _rmsnorm_step_BasicBlock_0Impl_context_saver_caller_loop_count_1;	// layer_orchestrator.k:62:40
    passthrough_data_50.rdy_int = _rmsnorm_step_BasicBlock_0Impl_input_rdy_0;	// layer_orchestrator.k:62:40
    thread_count___globalObject___rmsnorm_step_10.decr_count = _rmsnorm_step_BasicBlock_1Impl_decr_semaphore_thread_count_10_out;	// layer_orchestrator.k:62:40
    fifo_data_10.wren = _rmsnorm_step_BasicBlock_1Impl_fifo_wren_0;	// layer_orchestrator.k:62:40
    passthrough_data_51.rdy_int = _rmsnorm_step_BasicBlock_1Impl_input_rdy_0;	// layer_orchestrator.k:62:40
    thread_count___globalObject___swiglu_step_11.incr_count = _swiglu_step_BasicBlock_0Impl_incr_semaphore_thread_count_11_out;	// layer_orchestrator.k:66:9
    fifo_data_28.data_in = _swiglu_step_BasicBlock_0Impl_fifo_data_out_0;	// layer_orchestrator.k:66:9
    fifo_data_28.wren = _swiglu_step_BasicBlock_0Impl_fifo_wren_0;	// layer_orchestrator.k:66:9
    context_saver_data_83.caller_wren = _swiglu_step_BasicBlock_0Impl_context_saver_caller_wren_1;	// layer_orchestrator.k:66:9
    context_saver_data_83.caller_loop_count = _swiglu_step_BasicBlock_0Impl_context_saver_caller_loop_count_1;	// layer_orchestrator.k:66:9
    passthrough_data_52.rdy_int = _swiglu_step_BasicBlock_0Impl_input_rdy_0;	// layer_orchestrator.k:66:9
    thread_count___globalObject___swiglu_step_11.decr_count = _swiglu_step_BasicBlock_1Impl_decr_semaphore_thread_count_11_out;	// layer_orchestrator.k:66:16
    fifo_data_11.data_in = _swiglu_step_BasicBlock_1Impl_fifo_data_out_0;	// layer_orchestrator.k:66:16
    fifo_data_11.wren = _swiglu_step_BasicBlock_1Impl_fifo_wren_0;	// layer_orchestrator.k:66:16
    passthrough_data_53.rdy_int = _swiglu_step_BasicBlock_1Impl_input_rdy_0;	// layer_orchestrator.k:66:16
    thread_count___globalObject___residual_add_step_12.incr_count = _residual_add_step_BasicBlock_0Impl_incr_semaphore_thread_count_12_out;	// layer_orchestrator.k:71:9
    fifo_data_29.data_in = _residual_add_step_BasicBlock_0Impl_fifo_data_out_0;	// layer_orchestrator.k:71:9
    fifo_data_29.wren = _residual_add_step_BasicBlock_0Impl_fifo_wren_0;	// layer_orchestrator.k:71:9
    context_saver_data_85.caller_wren = _residual_add_step_BasicBlock_0Impl_context_saver_caller_wren_1;	// layer_orchestrator.k:71:9
    context_saver_data_85.caller_loop_count = _residual_add_step_BasicBlock_0Impl_context_saver_caller_loop_count_1;	// layer_orchestrator.k:71:9
    passthrough_data_54.rdy_int = _residual_add_step_BasicBlock_0Impl_input_rdy_0;	// layer_orchestrator.k:71:9
    thread_count___globalObject___residual_add_step_12.decr_count = _residual_add_step_BasicBlock_1Impl_decr_semaphore_thread_count_12_out;	// layer_orchestrator.k:71:16
    fifo_data_12.data_in = _residual_add_step_BasicBlock_1Impl_fifo_data_out_0;	// layer_orchestrator.k:71:16
    fifo_data_12.wren = _residual_add_step_BasicBlock_1Impl_fifo_wren_0;	// layer_orchestrator.k:71:16
    passthrough_data_55.rdy_int = _residual_add_step_BasicBlock_1Impl_input_rdy_0;	// layer_orchestrator.k:71:16
    thread_count___globalObject___rotate_even_13.incr_count = _rotate_even_BasicBlock_0Impl_incr_semaphore_thread_count_13_out;	// layer_orchestrator.k:76:9
    fifo_data_19.data_in = _rotate_even_BasicBlock_0Impl_fifo_data_out_0;	// layer_orchestrator.k:76:9
    fifo_data_19.wren = _rotate_even_BasicBlock_0Impl_fifo_wren_0;	// layer_orchestrator.k:76:9
    context_saver_data_87.caller_wren = _rotate_even_BasicBlock_0Impl_context_saver_caller_wren_1;	// layer_orchestrator.k:76:9
    context_saver_data_87.caller_loop_count = _rotate_even_BasicBlock_0Impl_context_saver_caller_loop_count_1;	// layer_orchestrator.k:76:9
    passthrough_data_56.rdy_int = _rotate_even_BasicBlock_0Impl_input_rdy_0;	// layer_orchestrator.k:76:9
    thread_count___globalObject___rotate_even_13.decr_count = _rotate_even_BasicBlock_1Impl_decr_semaphore_thread_count_13_out;	// layer_orchestrator.k:76:16
    fifo_data_13.data_in = _rotate_even_BasicBlock_1Impl_fifo_data_out_0;	// layer_orchestrator.k:76:16
    fifo_data_13.wren = _rotate_even_BasicBlock_1Impl_fifo_wren_0;	// layer_orchestrator.k:76:16
    passthrough_data_57.rdy_int = _rotate_even_BasicBlock_1Impl_input_rdy_0;	// layer_orchestrator.k:76:16
    thread_count___globalObject___rotate_odd_14.incr_count = _rotate_odd_BasicBlock_0Impl_incr_semaphore_thread_count_14_out;	// layer_orchestrator.k:79:9
    fifo_data_20.data_in = _rotate_odd_BasicBlock_0Impl_fifo_data_out_0;	// layer_orchestrator.k:79:9
    fifo_data_20.wren = _rotate_odd_BasicBlock_0Impl_fifo_wren_0;	// layer_orchestrator.k:79:9
    context_saver_data_89.caller_wren = _rotate_odd_BasicBlock_0Impl_context_saver_caller_wren_1;	// layer_orchestrator.k:79:9
    context_saver_data_89.caller_loop_count = _rotate_odd_BasicBlock_0Impl_context_saver_caller_loop_count_1;	// layer_orchestrator.k:79:9
    passthrough_data_58.rdy_int = _rotate_odd_BasicBlock_0Impl_input_rdy_0;	// layer_orchestrator.k:79:9
    thread_count___globalObject___rotate_odd_14.decr_count = _rotate_odd_BasicBlock_1Impl_decr_semaphore_thread_count_14_out;	// layer_orchestrator.k:79:16
    fifo_data_14.data_in = _rotate_odd_BasicBlock_1Impl_fifo_data_out_0;	// layer_orchestrator.k:79:16
    fifo_data_14.wren = _rotate_odd_BasicBlock_1Impl_fifo_wren_0;	// layer_orchestrator.k:79:16
    passthrough_data_59.rdy_int = _rotate_odd_BasicBlock_1Impl_input_rdy_0;	// layer_orchestrator.k:79:16
  end // always_comb

  assign has_startup_completed_raw = 1'b1;
  assign stall_rate_supported_out_net = 1'b0;
  KanagawaResetControl #(
    .WIDTH(122),
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
  KanagawaSemaphore #(
    .MAX_VALUE(512),
    .SEM_DELAY(3)
  ) thread_count___globalObject___forward_cos_0_counter (
    .clk           (clk),
    .rst           (reg_rst_delayed[0]),
    .incr_count_in
      (thread_count___globalObject___forward_cos_0_counter_incr_count_in__circt),
    .decr_count_in
      (thread_count___globalObject___forward_cos_0_counter_decr_count_in__circt),
    .full_out      (_thread_count___globalObject___forward_cos_0_counter_full_out)
  );
  KanagawaSemaphore #(
    .MAX_VALUE(512),
    .SEM_DELAY(3)
  ) thread_count___globalObject___forward_sin_1_counter (
    .clk           (clk),
    .rst           (reg_rst_delayed[1]),
    .incr_count_in
      (thread_count___globalObject___forward_sin_1_counter_incr_count_in__circt),
    .decr_count_in
      (thread_count___globalObject___forward_sin_1_counter_decr_count_in__circt),
    .full_out      (_thread_count___globalObject___forward_sin_1_counter_full_out)
  );
  KanagawaSemaphore #(
    .MAX_VALUE(512),
    .SEM_DELAY(3)
  ) thread_count___globalObject___read_cos_forwarded_2_counter (
    .clk           (clk),
    .rst           (reg_rst_delayed[2]),
    .incr_count_in
      (thread_count___globalObject___read_cos_forwarded_2_counter_incr_count_in__circt),
    .decr_count_in
      (thread_count___globalObject___read_cos_forwarded_2_counter_decr_count_in__circt),
    .full_out      (_thread_count___globalObject___read_cos_forwarded_2_counter_full_out)
  );
  KanagawaSemaphore #(
    .MAX_VALUE(512),
    .SEM_DELAY(3)
  ) thread_count___globalObject___read_sin_forwarded_3_counter (
    .clk           (clk),
    .rst           (reg_rst_delayed[3]),
    .incr_count_in
      (thread_count___globalObject___read_sin_forwarded_3_counter_incr_count_in__circt),
    .decr_count_in
      (thread_count___globalObject___read_sin_forwarded_3_counter_decr_count_in__circt),
    .full_out      (_thread_count___globalObject___read_sin_forwarded_3_counter_full_out)
  );
  KanagawaSemaphore #(
    .MAX_VALUE(512),
    .SEM_DELAY(3)
  ) thread_count___globalObject___prog_gamma_pre_attn_4_counter (
    .clk           (clk),
    .rst           (reg_rst_delayed[4]),
    .incr_count_in
      (thread_count___globalObject___prog_gamma_pre_attn_4_counter_incr_count_in__circt),
    .decr_count_in
      (thread_count___globalObject___prog_gamma_pre_attn_4_counter_decr_count_in__circt),
    .full_out      (_thread_count___globalObject___prog_gamma_pre_attn_4_counter_full_out)
  );
  KanagawaSemaphore #(
    .MAX_VALUE(512),
    .SEM_DELAY(3)
  ) thread_count___globalObject___prog_gamma_pre_mlp_5_counter (
    .clk           (clk),
    .rst           (reg_rst_delayed[5]),
    .incr_count_in
      (thread_count___globalObject___prog_gamma_pre_mlp_5_counter_incr_count_in__circt),
    .decr_count_in
      (thread_count___globalObject___prog_gamma_pre_mlp_5_counter_decr_count_in__circt),
    .full_out      (_thread_count___globalObject___prog_gamma_pre_mlp_5_counter_full_out)
  );
  KanagawaSemaphore #(
    .MAX_VALUE(512),
    .SEM_DELAY(3)
  ) thread_count___globalObject___prog_rsqrt_lut_6_counter (
    .clk           (clk),
    .rst           (reg_rst_delayed[6]),
    .incr_count_in
      (thread_count___globalObject___prog_rsqrt_lut_6_counter_incr_count_in__circt),
    .decr_count_in
      (thread_count___globalObject___prog_rsqrt_lut_6_counter_decr_count_in__circt),
    .full_out      (_thread_count___globalObject___prog_rsqrt_lut_6_counter_full_out)
  );
  KanagawaSemaphore #(
    .MAX_VALUE(512),
    .SEM_DELAY(3)
  ) thread_count___globalObject___prog_sigmoid_lut_7_counter (
    .clk           (clk),
    .rst           (reg_rst_delayed[7]),
    .incr_count_in
      (thread_count___globalObject___prog_sigmoid_lut_7_counter_incr_count_in__circt),
    .decr_count_in
      (thread_count___globalObject___prog_sigmoid_lut_7_counter_decr_count_in__circt),
    .full_out      (_thread_count___globalObject___prog_sigmoid_lut_7_counter_full_out)
  );
  KanagawaSemaphore #(
    .MAX_VALUE(512),
    .SEM_DELAY(3)
  ) thread_count___globalObject___rmsnorm_reset_8_counter (
    .clk           (clk),
    .rst           (reg_rst_delayed[8]),
    .incr_count_in
      (thread_count___globalObject___rmsnorm_reset_8_counter_incr_count_in__circt),
    .decr_count_in
      (thread_count___globalObject___rmsnorm_reset_8_counter_decr_count_in__circt),
    .full_out      (_thread_count___globalObject___rmsnorm_reset_8_counter_full_out)
  );
  KanagawaSemaphore #(
    .MAX_VALUE(512),
    .SEM_DELAY(3)
  ) thread_count___globalObject___rmsnorm_get_sum_9_counter (
    .clk           (clk),
    .rst           (reg_rst_delayed[9]),
    .incr_count_in
      (thread_count___globalObject___rmsnorm_get_sum_9_counter_incr_count_in__circt),
    .decr_count_in
      (thread_count___globalObject___rmsnorm_get_sum_9_counter_decr_count_in__circt),
    .full_out      (_thread_count___globalObject___rmsnorm_get_sum_9_counter_full_out)
  );
  KanagawaSemaphore #(
    .MAX_VALUE(512),
    .SEM_DELAY(3)
  ) thread_count___globalObject___rmsnorm_step_10_counter (
    .clk           (clk),
    .rst           (reg_rst_delayed[10]),
    .incr_count_in
      (thread_count___globalObject___rmsnorm_step_10_counter_incr_count_in__circt),
    .decr_count_in
      (thread_count___globalObject___rmsnorm_step_10_counter_decr_count_in__circt),
    .full_out      (_thread_count___globalObject___rmsnorm_step_10_counter_full_out)
  );
  KanagawaSemaphore #(
    .MAX_VALUE(512),
    .SEM_DELAY(3)
  ) thread_count___globalObject___swiglu_step_11_counter (
    .clk           (clk),
    .rst           (reg_rst_delayed[11]),
    .incr_count_in
      (thread_count___globalObject___swiglu_step_11_counter_incr_count_in__circt),
    .decr_count_in
      (thread_count___globalObject___swiglu_step_11_counter_decr_count_in__circt),
    .full_out      (_thread_count___globalObject___swiglu_step_11_counter_full_out)
  );
  KanagawaSemaphore #(
    .MAX_VALUE(512),
    .SEM_DELAY(3)
  ) thread_count___globalObject___residual_add_step_12_counter (
    .clk           (clk),
    .rst           (reg_rst_delayed[12]),
    .incr_count_in
      (thread_count___globalObject___residual_add_step_12_counter_incr_count_in__circt),
    .decr_count_in
      (thread_count___globalObject___residual_add_step_12_counter_decr_count_in__circt),
    .full_out      (_thread_count___globalObject___residual_add_step_12_counter_full_out)
  );
  KanagawaSemaphore #(
    .MAX_VALUE(512),
    .SEM_DELAY(3)
  ) thread_count___globalObject___rotate_even_13_counter (
    .clk           (clk),
    .rst           (reg_rst_delayed[13]),
    .incr_count_in
      (thread_count___globalObject___rotate_even_13_counter_incr_count_in__circt),
    .decr_count_in
      (thread_count___globalObject___rotate_even_13_counter_decr_count_in__circt),
    .full_out      (_thread_count___globalObject___rotate_even_13_counter_full_out)
  );
  KanagawaSemaphore #(
    .MAX_VALUE(512),
    .SEM_DELAY(3)
  ) thread_count___globalObject___rotate_odd_14_counter (
    .clk           (clk),
    .rst           (reg_rst_delayed[14]),
    .incr_count_in
      (thread_count___globalObject___rotate_odd_14_counter_incr_count_in__circt),
    .decr_count_in
      (thread_count___globalObject___rotate_odd_14_counter_decr_count_in__circt),
    .full_out      (_thread_count___globalObject___rotate_odd_14_counter_full_out)
  );
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
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) has_startup_completed_delayed_10_delay_chain (
    .clk      (clk),
    .data_in  (has_others_completed),
    .data_out (_has_startup_completed_delayed_10_delay_chain_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) has_startup_completed_delayed_11_delay_chain (
    .clk      (clk),
    .data_in  (has_others_completed),
    .data_out (_has_startup_completed_delayed_11_delay_chain_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) has_startup_completed_delayed_12_delay_chain (
    .clk      (clk),
    .data_in  (has_others_completed),
    .data_out (_has_startup_completed_delayed_12_delay_chain_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) has_startup_completed_delayed_13_delay_chain (
    .clk      (clk),
    .data_in  (has_others_completed),
    .data_out (_has_startup_completed_delayed_13_delay_chain_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) has_startup_completed_delayed_14_delay_chain (
    .clk      (clk),
    .data_in  (has_others_completed),
    .data_out (_has_startup_completed_delayed_14_delay_chain_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) has_startup_completed_delayed_15_delay_chain (
    .clk      (clk),
    .data_in  (has_others_completed),
    .data_out (_has_startup_completed_delayed_15_delay_chain_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) has_startup_completed_delayed_16_delay_chain (
    .clk      (clk),
    .data_in  (has_others_completed),
    .data_out (_has_startup_completed_delayed_16_delay_chain_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) has_startup_completed_delayed_17_delay_chain (
    .clk      (clk),
    .data_in  (has_others_completed),
    .data_out (_has_startup_completed_delayed_17_delay_chain_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) has_startup_completed_delayed_18_delay_chain (
    .clk      (clk),
    .data_in  (has_others_completed),
    .data_out (_has_startup_completed_delayed_18_delay_chain_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) has_startup_completed_delayed_19_delay_chain (
    .clk      (clk),
    .data_in  (has_others_completed),
    .data_out (_has_startup_completed_delayed_19_delay_chain_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) has_startup_completed_delayed_20_delay_chain (
    .clk      (clk),
    .data_in  (has_others_completed),
    .data_out (_has_startup_completed_delayed_20_delay_chain_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) has_startup_completed_delayed_21_delay_chain (
    .clk      (clk),
    .data_in  (has_others_completed),
    .data_out (_has_startup_completed_delayed_21_delay_chain_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) has_startup_completed_delayed_22_delay_chain (
    .clk      (clk),
    .data_in  (has_others_completed),
    .data_out (_has_startup_completed_delayed_22_delay_chain_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) has_startup_completed_delayed_23_delay_chain (
    .clk      (clk),
    .data_in  (has_others_completed),
    .data_out (_has_startup_completed_delayed_23_delay_chain_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) has_startup_completed_delayed_24_delay_chain (
    .clk      (clk),
    .data_in  (has_others_completed),
    .data_out (_has_startup_completed_delayed_24_delay_chain_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) has_startup_completed_delayed_25_delay_chain (
    .clk      (clk),
    .data_in  (has_others_completed),
    .data_out (_has_startup_completed_delayed_25_delay_chain_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) has_startup_completed_delayed_26_delay_chain (
    .clk      (clk),
    .data_in  (has_others_completed),
    .data_out (_has_startup_completed_delayed_26_delay_chain_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) has_startup_completed_delayed_27_delay_chain (
    .clk      (clk),
    .data_in  (has_others_completed),
    .data_out (_has_startup_completed_delayed_27_delay_chain_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) has_startup_completed_delayed_28_delay_chain (
    .clk      (clk),
    .data_in  (has_others_completed),
    .data_out (_has_startup_completed_delayed_28_delay_chain_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) has_startup_completed_delayed_29_delay_chain (
    .clk      (clk),
    .data_in  (has_others_completed),
    .data_out (_has_startup_completed_delayed_29_delay_chain_data_out)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(0),
    .PORT_WIDTH(1),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_0_forward_cos_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(0)
  ) fifo_0_forward_cos_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[17]),
    .overflow_out  (_fifo_0_forward_cos_Return_overflow_out),
    .underflow_out (_fifo_0_forward_cos_Return_underflow_out),
    .empty         (_fifo_0_forward_cos_Return_empty),
    .rdreq         (fifo_data_0.rden),
    .full          (_fifo_0_forward_cos_Return_full),
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
    .AUTO_PIPELINE_GROUP("fifo_1_forward_sin_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(0)
  ) fifo_1_forward_sin_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[18]),
    .overflow_out  (_fifo_1_forward_sin_Return_overflow_out),
    .underflow_out (_fifo_1_forward_sin_Return_underflow_out),
    .empty         (_fifo_1_forward_sin_Return_empty),
    .rdreq         (fifo_data_1.rden),
    .full          (_fifo_1_forward_sin_Return_full),
    .wrreq         (fifo_data_1.wren),
    .data          ('0),
    .q             (/* unused */)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(256),
    .PORT_WIDTH(256),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_2_read_cos_forwarded_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(1)
  ) fifo_2_read_cos_forwarded_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[19]),
    .overflow_out  (_fifo_2_read_cos_forwarded_Return_overflow_out),
    .underflow_out (_fifo_2_read_cos_forwarded_Return_underflow_out),
    .empty         (_fifo_2_read_cos_forwarded_Return_empty),
    .rdreq         (fifo_data_2.rden),
    .full          (_fifo_2_read_cos_forwarded_Return_full),
    .wrreq         (fifo_data_2.wren),
    .data          (fifo_data_2.data_in),
    .q             (_fifo_2_read_cos_forwarded_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(256),
    .PORT_WIDTH(256),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_3_read_sin_forwarded_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(1)
  ) fifo_3_read_sin_forwarded_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[20]),
    .overflow_out  (_fifo_3_read_sin_forwarded_Return_overflow_out),
    .underflow_out (_fifo_3_read_sin_forwarded_Return_underflow_out),
    .empty         (_fifo_3_read_sin_forwarded_Return_empty),
    .rdreq         (fifo_data_3.rden),
    .full          (_fifo_3_read_sin_forwarded_Return_full),
    .wrreq         (fifo_data_3.wren),
    .data          (fifo_data_3.data_in),
    .q             (_fifo_3_read_sin_forwarded_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(0),
    .PORT_WIDTH(1),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_4_prog_gamma_pre_attn_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(0)
  ) fifo_4_prog_gamma_pre_attn_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[21]),
    .overflow_out  (_fifo_4_prog_gamma_pre_attn_Return_overflow_out),
    .underflow_out (_fifo_4_prog_gamma_pre_attn_Return_underflow_out),
    .empty         (_fifo_4_prog_gamma_pre_attn_Return_empty),
    .rdreq         (fifo_data_4.rden),
    .full          (_fifo_4_prog_gamma_pre_attn_Return_full),
    .wrreq         (fifo_data_4.wren),
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
    .AUTO_PIPELINE_GROUP("fifo_5_prog_gamma_pre_mlp_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(0)
  ) fifo_5_prog_gamma_pre_mlp_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[22]),
    .overflow_out  (_fifo_5_prog_gamma_pre_mlp_Return_overflow_out),
    .underflow_out (_fifo_5_prog_gamma_pre_mlp_Return_underflow_out),
    .empty         (_fifo_5_prog_gamma_pre_mlp_Return_empty),
    .rdreq         (fifo_data_5.rden),
    .full          (_fifo_5_prog_gamma_pre_mlp_Return_full),
    .wrreq         (fifo_data_5.wren),
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
    .AUTO_PIPELINE_GROUP("fifo_6_prog_rsqrt_lut_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(0)
  ) fifo_6_prog_rsqrt_lut_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[23]),
    .overflow_out  (_fifo_6_prog_rsqrt_lut_Return_overflow_out),
    .underflow_out (_fifo_6_prog_rsqrt_lut_Return_underflow_out),
    .empty         (_fifo_6_prog_rsqrt_lut_Return_empty),
    .rdreq         (fifo_data_6.rden),
    .full          (_fifo_6_prog_rsqrt_lut_Return_full),
    .wrreq         (fifo_data_6.wren),
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
    .AUTO_PIPELINE_GROUP("fifo_7_prog_sigmoid_lut_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(0)
  ) fifo_7_prog_sigmoid_lut_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[24]),
    .overflow_out  (_fifo_7_prog_sigmoid_lut_Return_overflow_out),
    .underflow_out (_fifo_7_prog_sigmoid_lut_Return_underflow_out),
    .empty         (_fifo_7_prog_sigmoid_lut_Return_empty),
    .rdreq         (fifo_data_7.rden),
    .full          (_fifo_7_prog_sigmoid_lut_Return_full),
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
    .AUTO_PIPELINE_GROUP("fifo_8_rmsnorm_reset_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(0)
  ) fifo_8_rmsnorm_reset_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[25]),
    .overflow_out  (_fifo_8_rmsnorm_reset_Return_overflow_out),
    .underflow_out (_fifo_8_rmsnorm_reset_Return_underflow_out),
    .empty         (_fifo_8_rmsnorm_reset_Return_empty),
    .rdreq         (fifo_data_8.rden),
    .full          (_fifo_8_rmsnorm_reset_Return_full),
    .wrreq         (fifo_data_8.wren),
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
    .AUTO_PIPELINE_GROUP("fifo_9_rmsnorm_get_sum_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(1)
  ) fifo_9_rmsnorm_get_sum_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[26]),
    .overflow_out  (_fifo_9_rmsnorm_get_sum_Return_overflow_out),
    .underflow_out (_fifo_9_rmsnorm_get_sum_Return_underflow_out),
    .empty         (_fifo_9_rmsnorm_get_sum_Return_empty),
    .rdreq         (fifo_data_9.rden),
    .full          (_fifo_9_rmsnorm_get_sum_Return_full),
    .wrreq         (fifo_data_9.wren),
    .data          (fifo_data_9.data_in),
    .q             (_fifo_9_rmsnorm_get_sum_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(0),
    .PORT_WIDTH(1),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_10_rmsnorm_step_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(0)
  ) fifo_10_rmsnorm_step_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[27]),
    .overflow_out  (_fifo_10_rmsnorm_step_Return_overflow_out),
    .underflow_out (_fifo_10_rmsnorm_step_Return_underflow_out),
    .empty         (_fifo_10_rmsnorm_step_Return_empty),
    .rdreq         (fifo_data_10.rden),
    .full          (_fifo_10_rmsnorm_step_Return_full),
    .wrreq         (fifo_data_10.wren),
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
    .AUTO_PIPELINE_GROUP("fifo_11_swiglu_step_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(1)
  ) fifo_11_swiglu_step_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[28]),
    .overflow_out  (_fifo_11_swiglu_step_Return_overflow_out),
    .underflow_out (_fifo_11_swiglu_step_Return_underflow_out),
    .empty         (_fifo_11_swiglu_step_Return_empty),
    .rdreq         (fifo_data_11.rden),
    .full          (_fifo_11_swiglu_step_Return_full),
    .wrreq         (fifo_data_11.wren),
    .data          (fifo_data_11.data_in),
    .q             (_fifo_11_swiglu_step_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(16),
    .PORT_WIDTH(16),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_12_residual_add_step_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(1)
  ) fifo_12_residual_add_step_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[29]),
    .overflow_out  (_fifo_12_residual_add_step_Return_overflow_out),
    .underflow_out (_fifo_12_residual_add_step_Return_underflow_out),
    .empty         (_fifo_12_residual_add_step_Return_empty),
    .rdreq         (fifo_data_12.rden),
    .full          (_fifo_12_residual_add_step_Return_full),
    .wrreq         (fifo_data_12.wren),
    .data          (fifo_data_12.data_in),
    .q             (_fifo_12_residual_add_step_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(16),
    .PORT_WIDTH(16),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_13_rotate_even_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(1)
  ) fifo_13_rotate_even_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[30]),
    .overflow_out  (_fifo_13_rotate_even_Return_overflow_out),
    .underflow_out (_fifo_13_rotate_even_Return_underflow_out),
    .empty         (_fifo_13_rotate_even_Return_empty),
    .rdreq         (fifo_data_13.rden),
    .full          (_fifo_13_rotate_even_Return_full),
    .wrreq         (fifo_data_13.wren),
    .data          (fifo_data_13.data_in),
    .q             (_fifo_13_rotate_even_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(16),
    .PORT_WIDTH(16),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_14_rotate_odd_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(1)
  ) fifo_14_rotate_odd_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[31]),
    .overflow_out  (_fifo_14_rotate_odd_Return_overflow_out),
    .underflow_out (_fifo_14_rotate_odd_Return_underflow_out),
    .empty         (_fifo_14_rotate_odd_Return_empty),
    .rdreq         (fifo_data_14.rden),
    .full          (_fifo_14_rotate_odd_Return_full),
    .wrreq         (fifo_data_14.wren),
    .data          (fifo_data_14.data_in),
    .q             (_fifo_14_rotate_odd_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(258),
    .PORT_WIDTH(258),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_15_forward_cos_Entry"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(1)
  ) fifo_15_forward_cos_Entry (
    .clock         (clk),
    .rst           (fifo_15_forward_cos_Entry_rst__circt),
    .overflow_out  (_fifo_15_forward_cos_Entry_overflow_out),
    .underflow_out (_fifo_15_forward_cos_Entry_underflow_out),
    .empty         (_fifo_15_forward_cos_Entry_empty),
    .rdreq         (fifo_data_15.rden),
    .full          (_fifo_15_forward_cos_Entry_full),
    .wrreq         (fifo_data_15.wren),
    .data          (fifo_data_15.encoded_data_in),
    .q             (_fifo_15_forward_cos_Entry_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(258),
    .PORT_WIDTH(258),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_16_forward_sin_Entry"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(1)
  ) fifo_16_forward_sin_Entry (
    .clock         (clk),
    .rst           (fifo_16_forward_sin_Entry_rst__circt),
    .overflow_out  (_fifo_16_forward_sin_Entry_overflow_out),
    .underflow_out (_fifo_16_forward_sin_Entry_underflow_out),
    .empty         (_fifo_16_forward_sin_Entry_empty),
    .rdreq         (fifo_data_16.rden),
    .full          (_fifo_16_forward_sin_Entry_full),
    .wrreq         (fifo_data_16.wren),
    .data          (fifo_data_16.encoded_data_in),
    .q             (_fifo_16_forward_sin_Entry_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(2),
    .PORT_WIDTH(2),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_17_read_cos_forwarded_Entry"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(1)
  ) fifo_17_read_cos_forwarded_Entry (
    .clock         (clk),
    .rst           (fifo_17_read_cos_forwarded_Entry_rst__circt),
    .overflow_out  (_fifo_17_read_cos_forwarded_Entry_overflow_out),
    .underflow_out (_fifo_17_read_cos_forwarded_Entry_underflow_out),
    .empty         (_fifo_17_read_cos_forwarded_Entry_empty),
    .rdreq         (fifo_data_17.rden),
    .full          (_fifo_17_read_cos_forwarded_Entry_full),
    .wrreq         (fifo_data_17.wren),
    .data          (fifo_data_17.encoded_data_in),
    .q             (_fifo_17_read_cos_forwarded_Entry_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(2),
    .PORT_WIDTH(2),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_18_read_sin_forwarded_Entry"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(1)
  ) fifo_18_read_sin_forwarded_Entry (
    .clock         (clk),
    .rst           (fifo_18_read_sin_forwarded_Entry_rst__circt),
    .overflow_out  (_fifo_18_read_sin_forwarded_Entry_overflow_out),
    .underflow_out (_fifo_18_read_sin_forwarded_Entry_underflow_out),
    .empty         (_fifo_18_read_sin_forwarded_Entry_empty),
    .rdreq         (fifo_data_18.rden),
    .full          (_fifo_18_read_sin_forwarded_Entry_full),
    .wrreq         (fifo_data_18.wren),
    .data          (fifo_data_18.encoded_data_in),
    .q             (_fifo_18_read_sin_forwarded_Entry_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(64),
    .PORT_WIDTH(64),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_19_rotate_even_Entry"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(1)
  ) fifo_19_rotate_even_Entry (
    .clock         (clk),
    .rst           (fifo_19_rotate_even_Entry_rst__circt),
    .overflow_out  (_fifo_19_rotate_even_Entry_overflow_out),
    .underflow_out (_fifo_19_rotate_even_Entry_underflow_out),
    .empty         (_fifo_19_rotate_even_Entry_empty),
    .rdreq         (fifo_data_19.rden),
    .full          (_fifo_19_rotate_even_Entry_full),
    .wrreq         (fifo_data_19.wren),
    .data          (fifo_data_19.encoded_data_in),
    .q             (_fifo_19_rotate_even_Entry_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(64),
    .PORT_WIDTH(64),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_20_rotate_odd_Entry"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(1)
  ) fifo_20_rotate_odd_Entry (
    .clock         (clk),
    .rst           (fifo_20_rotate_odd_Entry_rst__circt),
    .overflow_out  (_fifo_20_rotate_odd_Entry_overflow_out),
    .underflow_out (_fifo_20_rotate_odd_Entry_underflow_out),
    .empty         (_fifo_20_rotate_odd_Entry_empty),
    .rdreq         (fifo_data_20.rden),
    .full          (_fifo_20_rotate_odd_Entry_full),
    .wrreq         (fifo_data_20.wren),
    .data          (fifo_data_20.encoded_data_in),
    .q             (_fifo_20_rotate_odd_Entry_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(16),
    .PORT_WIDTH(16),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_21_rmsnorm_accumulate_Entry"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(1)
  ) fifo_21_rmsnorm_accumulate_Entry (
    .clock         (clk),
    .rst           (fifo_21_rmsnorm_accumulate_Entry_rst__circt),
    .overflow_out  (_fifo_21_rmsnorm_accumulate_Entry_overflow_out),
    .underflow_out (_fifo_21_rmsnorm_accumulate_Entry_underflow_out),
    .empty         (_fifo_21_rmsnorm_accumulate_Entry_empty),
    .rdreq         (fifo_data_21.rden),
    .full          (_fifo_21_rmsnorm_accumulate_Entry_full),
    .wrreq         (fifo_data_21.wren),
    .data          (fifo_data_21.encoded_data_in),
    .q             (_fifo_21_rmsnorm_accumulate_Entry_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(0),
    .PORT_WIDTH(1),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_22_rmsnorm_get_sum_Entry"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(0)
  ) fifo_22_rmsnorm_get_sum_Entry (
    .clock         (clk),
    .rst           (fifo_22_rmsnorm_get_sum_Entry_rst__circt),
    .overflow_out  (_fifo_22_rmsnorm_get_sum_Entry_overflow_out),
    .underflow_out (_fifo_22_rmsnorm_get_sum_Entry_underflow_out),
    .empty         (_fifo_22_rmsnorm_get_sum_Entry_empty),
    .rdreq         (fifo_data_22.rden),
    .full          (_fifo_22_rmsnorm_get_sum_Entry_full),
    .wrreq         (fifo_data_22.wren),
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
    .AUTO_PIPELINE_GROUP("fifo_23_rmsnorm_reset_Entry"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(0)
  ) fifo_23_rmsnorm_reset_Entry (
    .clock         (clk),
    .rst           (fifo_23_rmsnorm_reset_Entry_rst__circt),
    .overflow_out  (_fifo_23_rmsnorm_reset_Entry_overflow_out),
    .underflow_out (_fifo_23_rmsnorm_reset_Entry_underflow_out),
    .empty         (_fifo_23_rmsnorm_reset_Entry_empty),
    .rdreq         (fifo_data_23.rden),
    .full          (_fifo_23_rmsnorm_reset_Entry_full),
    .wrreq         (fifo_data_23.wren),
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
    .AUTO_PIPELINE_GROUP("fifo_24_set_gamma_pre_attn_Entry"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(1)
  ) fifo_24_set_gamma_pre_attn_Entry (
    .clock         (clk),
    .rst           (fifo_24_set_gamma_pre_attn_Entry_rst__circt),
    .overflow_out  (_fifo_24_set_gamma_pre_attn_Entry_overflow_out),
    .underflow_out (_fifo_24_set_gamma_pre_attn_Entry_underflow_out),
    .empty         (_fifo_24_set_gamma_pre_attn_Entry_empty),
    .rdreq         (fifo_data_24.rden),
    .full          (_fifo_24_set_gamma_pre_attn_Entry_full),
    .wrreq         (fifo_data_24.wren),
    .data          (fifo_data_24.encoded_data_in),
    .q             (_fifo_24_set_gamma_pre_attn_Entry_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(32),
    .PORT_WIDTH(32),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_25_set_gamma_pre_mlp_Entry"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(1)
  ) fifo_25_set_gamma_pre_mlp_Entry (
    .clock         (clk),
    .rst           (fifo_25_set_gamma_pre_mlp_Entry_rst__circt),
    .overflow_out  (_fifo_25_set_gamma_pre_mlp_Entry_overflow_out),
    .underflow_out (_fifo_25_set_gamma_pre_mlp_Entry_underflow_out),
    .empty         (_fifo_25_set_gamma_pre_mlp_Entry_empty),
    .rdreq         (fifo_data_25.rden),
    .full          (_fifo_25_set_gamma_pre_mlp_Entry_full),
    .wrreq         (fifo_data_25.wren),
    .data          (fifo_data_25.encoded_data_in),
    .q             (_fifo_25_set_gamma_pre_mlp_Entry_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(24),
    .PORT_WIDTH(24),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_26_set_rsqrt_lut_Entry"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(1)
  ) fifo_26_set_rsqrt_lut_Entry (
    .clock         (clk),
    .rst           (fifo_26_set_rsqrt_lut_Entry_rst__circt),
    .overflow_out  (_fifo_26_set_rsqrt_lut_Entry_overflow_out),
    .underflow_out (_fifo_26_set_rsqrt_lut_Entry_underflow_out),
    .empty         (_fifo_26_set_rsqrt_lut_Entry_empty),
    .rdreq         (fifo_data_26.rden),
    .full          (_fifo_26_set_rsqrt_lut_Entry_full),
    .wrreq         (fifo_data_26.wren),
    .data          (fifo_data_26.encoded_data_in),
    .q             (_fifo_26_set_rsqrt_lut_Entry_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(24),
    .PORT_WIDTH(24),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_27_set_sigmoid_lut_Entry"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(1)
  ) fifo_27_set_sigmoid_lut_Entry (
    .clock         (clk),
    .rst           (fifo_27_set_sigmoid_lut_Entry_rst__circt),
    .overflow_out  (_fifo_27_set_sigmoid_lut_Entry_overflow_out),
    .underflow_out (_fifo_27_set_sigmoid_lut_Entry_underflow_out),
    .empty         (_fifo_27_set_sigmoid_lut_Entry_empty),
    .rdreq         (fifo_data_27.rden),
    .full          (_fifo_27_set_sigmoid_lut_Entry_full),
    .wrreq         (fifo_data_27.wren),
    .data          (fifo_data_27.encoded_data_in),
    .q             (_fifo_27_set_sigmoid_lut_Entry_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(32),
    .PORT_WIDTH(32),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_28_swiglu_compute_Entry"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(1)
  ) fifo_28_swiglu_compute_Entry (
    .clock         (clk),
    .rst           (fifo_28_swiglu_compute_Entry_rst__circt),
    .overflow_out  (_fifo_28_swiglu_compute_Entry_overflow_out),
    .underflow_out (_fifo_28_swiglu_compute_Entry_underflow_out),
    .empty         (_fifo_28_swiglu_compute_Entry_empty),
    .rdreq         (fifo_data_28.rden),
    .full          (_fifo_28_swiglu_compute_Entry_full),
    .wrreq         (fifo_data_28.wren),
    .data          (fifo_data_28.encoded_data_in),
    .q             (_fifo_28_swiglu_compute_Entry_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(32),
    .PORT_WIDTH(32),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_29_residual_add_Entry"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(1)
  ) fifo_29_residual_add_Entry (
    .clock         (clk),
    .rst           (fifo_29_residual_add_Entry_rst__circt),
    .overflow_out  (_fifo_29_residual_add_Entry_overflow_out),
    .underflow_out (_fifo_29_residual_add_Entry_underflow_out),
    .empty         (_fifo_29_residual_add_Entry_empty),
    .rdreq         (fifo_data_29.rden),
    .full          (_fifo_29_residual_add_Entry_full),
    .wrreq         (fifo_data_29.wren),
    .data          (fifo_data_29.encoded_data_in),
    .q             (_fifo_29_residual_add_Entry_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(0),
    .PORT_WIDTH(1),
    .WRITE_DELAY(1),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(1),
    .AUTO_PIPELINE_GROUP("fifo_60_forward_cos_FromCallee"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(1),
    .USE_LUTRAM(0)
  ) fifo_60_forward_cos_FromCallee (
    .clock         (clk),
    .rst           (reg_rst_delayed[47]),
    .overflow_out  (_fifo_60_forward_cos_FromCallee_overflow_out),
    .underflow_out (_fifo_60_forward_cos_FromCallee_underflow_out),
    .empty         (_fifo_60_forward_cos_FromCallee_empty),
    .rdreq         (fifo_data_60.rden),
    .full          (_fifo_60_forward_cos_FromCallee_full),
    .wrreq         (fifo_data_60.wren),
    .data          ('0),
    .q             (/* unused */)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(0),
    .PORT_WIDTH(1),
    .WRITE_DELAY(1),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(1),
    .AUTO_PIPELINE_GROUP("fifo_62_forward_sin_FromCallee"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(1),
    .USE_LUTRAM(0)
  ) fifo_62_forward_sin_FromCallee (
    .clock         (clk),
    .rst           (reg_rst_delayed[48]),
    .overflow_out  (_fifo_62_forward_sin_FromCallee_overflow_out),
    .underflow_out (_fifo_62_forward_sin_FromCallee_underflow_out),
    .empty         (_fifo_62_forward_sin_FromCallee_empty),
    .rdreq         (fifo_data_62.rden),
    .full          (_fifo_62_forward_sin_FromCallee_full),
    .wrreq         (fifo_data_62.wren),
    .data          ('0),
    .q             (/* unused */)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(256),
    .PORT_WIDTH(256),
    .WRITE_DELAY(1),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(1),
    .AUTO_PIPELINE_GROUP("fifo_64_read_cos_forwarded_FromCallee"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(1),
    .USE_LUTRAM(1)
  ) fifo_64_read_cos_forwarded_FromCallee (
    .clock         (clk),
    .rst           (reg_rst_delayed[49]),
    .overflow_out  (_fifo_64_read_cos_forwarded_FromCallee_overflow_out),
    .underflow_out (_fifo_64_read_cos_forwarded_FromCallee_underflow_out),
    .empty         (_fifo_64_read_cos_forwarded_FromCallee_empty),
    .rdreq         (fifo_data_64.rden),
    .full          (_fifo_64_read_cos_forwarded_FromCallee_full),
    .wrreq         (fifo_data_64.wren),
    .data          (fifo_data_64.data_in),
    .q             (_fifo_64_read_cos_forwarded_FromCallee_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(256),
    .PORT_WIDTH(256),
    .WRITE_DELAY(1),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(1),
    .AUTO_PIPELINE_GROUP("fifo_66_read_sin_forwarded_FromCallee"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(1),
    .USE_LUTRAM(1)
  ) fifo_66_read_sin_forwarded_FromCallee (
    .clock         (clk),
    .rst           (reg_rst_delayed[50]),
    .overflow_out  (_fifo_66_read_sin_forwarded_FromCallee_overflow_out),
    .underflow_out (_fifo_66_read_sin_forwarded_FromCallee_underflow_out),
    .empty         (_fifo_66_read_sin_forwarded_FromCallee_empty),
    .rdreq         (fifo_data_66.rden),
    .full          (_fifo_66_read_sin_forwarded_FromCallee_full),
    .wrreq         (fifo_data_66.wren),
    .data          (fifo_data_66.data_in),
    .q             (_fifo_66_read_sin_forwarded_FromCallee_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(0),
    .PORT_WIDTH(1),
    .WRITE_DELAY(1),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(1),
    .AUTO_PIPELINE_GROUP("fifo_68_set_gamma_pre_attn_FromCallee"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(1),
    .USE_LUTRAM(0)
  ) fifo_68_set_gamma_pre_attn_FromCallee (
    .clock         (clk),
    .rst           (reg_rst_delayed[51]),
    .overflow_out  (_fifo_68_set_gamma_pre_attn_FromCallee_overflow_out),
    .underflow_out (_fifo_68_set_gamma_pre_attn_FromCallee_underflow_out),
    .empty         (_fifo_68_set_gamma_pre_attn_FromCallee_empty),
    .rdreq         (fifo_data_68.rden),
    .full          (_fifo_68_set_gamma_pre_attn_FromCallee_full),
    .wrreq         (fifo_data_68.wren),
    .data          ('0),
    .q             (/* unused */)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(0),
    .PORT_WIDTH(1),
    .WRITE_DELAY(1),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(1),
    .AUTO_PIPELINE_GROUP("fifo_70_set_gamma_pre_mlp_FromCallee"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(1),
    .USE_LUTRAM(0)
  ) fifo_70_set_gamma_pre_mlp_FromCallee (
    .clock         (clk),
    .rst           (reg_rst_delayed[52]),
    .overflow_out  (_fifo_70_set_gamma_pre_mlp_FromCallee_overflow_out),
    .underflow_out (_fifo_70_set_gamma_pre_mlp_FromCallee_underflow_out),
    .empty         (_fifo_70_set_gamma_pre_mlp_FromCallee_empty),
    .rdreq         (fifo_data_70.rden),
    .full          (_fifo_70_set_gamma_pre_mlp_FromCallee_full),
    .wrreq         (fifo_data_70.wren),
    .data          ('0),
    .q             (/* unused */)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(0),
    .PORT_WIDTH(1),
    .WRITE_DELAY(1),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(1),
    .AUTO_PIPELINE_GROUP("fifo_72_set_rsqrt_lut_FromCallee"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(1),
    .USE_LUTRAM(0)
  ) fifo_72_set_rsqrt_lut_FromCallee (
    .clock         (clk),
    .rst           (reg_rst_delayed[53]),
    .overflow_out  (_fifo_72_set_rsqrt_lut_FromCallee_overflow_out),
    .underflow_out (_fifo_72_set_rsqrt_lut_FromCallee_underflow_out),
    .empty         (_fifo_72_set_rsqrt_lut_FromCallee_empty),
    .rdreq         (fifo_data_72.rden),
    .full          (_fifo_72_set_rsqrt_lut_FromCallee_full),
    .wrreq         (fifo_data_72.wren),
    .data          ('0),
    .q             (/* unused */)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(0),
    .PORT_WIDTH(1),
    .WRITE_DELAY(1),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(1),
    .AUTO_PIPELINE_GROUP("fifo_74_set_sigmoid_lut_FromCallee"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(1),
    .USE_LUTRAM(0)
  ) fifo_74_set_sigmoid_lut_FromCallee (
    .clock         (clk),
    .rst           (reg_rst_delayed[54]),
    .overflow_out  (_fifo_74_set_sigmoid_lut_FromCallee_overflow_out),
    .underflow_out (_fifo_74_set_sigmoid_lut_FromCallee_underflow_out),
    .empty         (_fifo_74_set_sigmoid_lut_FromCallee_empty),
    .rdreq         (fifo_data_74.rden),
    .full          (_fifo_74_set_sigmoid_lut_FromCallee_full),
    .wrreq         (fifo_data_74.wren),
    .data          ('0),
    .q             (/* unused */)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(0),
    .PORT_WIDTH(1),
    .WRITE_DELAY(1),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(1),
    .AUTO_PIPELINE_GROUP("fifo_76_rmsnorm_reset_FromCallee"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(1),
    .USE_LUTRAM(0)
  ) fifo_76_rmsnorm_reset_FromCallee (
    .clock         (clk),
    .rst           (reg_rst_delayed[55]),
    .overflow_out  (_fifo_76_rmsnorm_reset_FromCallee_overflow_out),
    .underflow_out (_fifo_76_rmsnorm_reset_FromCallee_underflow_out),
    .empty         (_fifo_76_rmsnorm_reset_FromCallee_empty),
    .rdreq         (fifo_data_76.rden),
    .full          (_fifo_76_rmsnorm_reset_FromCallee_full),
    .wrreq         (fifo_data_76.wren),
    .data          ('0),
    .q             (/* unused */)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(32),
    .PORT_WIDTH(32),
    .WRITE_DELAY(1),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(1),
    .AUTO_PIPELINE_GROUP("fifo_78_rmsnorm_get_sum_FromCallee"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(1),
    .USE_LUTRAM(1)
  ) fifo_78_rmsnorm_get_sum_FromCallee (
    .clock         (clk),
    .rst           (reg_rst_delayed[56]),
    .overflow_out  (_fifo_78_rmsnorm_get_sum_FromCallee_overflow_out),
    .underflow_out (_fifo_78_rmsnorm_get_sum_FromCallee_underflow_out),
    .empty         (_fifo_78_rmsnorm_get_sum_FromCallee_empty),
    .rdreq         (fifo_data_78.rden),
    .full          (_fifo_78_rmsnorm_get_sum_FromCallee_full),
    .wrreq         (fifo_data_78.wren),
    .data          (fifo_data_78.data_in),
    .q             (_fifo_78_rmsnorm_get_sum_FromCallee_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(0),
    .PORT_WIDTH(1),
    .WRITE_DELAY(1),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(1),
    .AUTO_PIPELINE_GROUP("fifo_80_rmsnorm_accumulate_FromCallee"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(1),
    .USE_LUTRAM(0)
  ) fifo_80_rmsnorm_accumulate_FromCallee (
    .clock         (clk),
    .rst           (reg_rst_delayed[57]),
    .overflow_out  (_fifo_80_rmsnorm_accumulate_FromCallee_overflow_out),
    .underflow_out (_fifo_80_rmsnorm_accumulate_FromCallee_underflow_out),
    .empty         (_fifo_80_rmsnorm_accumulate_FromCallee_empty),
    .rdreq         (fifo_data_80.rden),
    .full          (_fifo_80_rmsnorm_accumulate_FromCallee_full),
    .wrreq         (fifo_data_80.wren),
    .data          ('0),
    .q             (/* unused */)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(16),
    .PORT_WIDTH(16),
    .WRITE_DELAY(1),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(1),
    .AUTO_PIPELINE_GROUP("fifo_82_swiglu_compute_FromCallee"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(1),
    .USE_LUTRAM(1)
  ) fifo_82_swiglu_compute_FromCallee (
    .clock         (clk),
    .rst           (reg_rst_delayed[58]),
    .overflow_out  (_fifo_82_swiglu_compute_FromCallee_overflow_out),
    .underflow_out (_fifo_82_swiglu_compute_FromCallee_underflow_out),
    .empty         (_fifo_82_swiglu_compute_FromCallee_empty),
    .rdreq         (fifo_data_82.rden),
    .full          (_fifo_82_swiglu_compute_FromCallee_full),
    .wrreq         (fifo_data_82.wren),
    .data          (fifo_data_82.data_in),
    .q             (_fifo_82_swiglu_compute_FromCallee_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(16),
    .PORT_WIDTH(16),
    .WRITE_DELAY(1),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(1),
    .AUTO_PIPELINE_GROUP("fifo_84_residual_add_FromCallee"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(1),
    .USE_LUTRAM(1)
  ) fifo_84_residual_add_FromCallee (
    .clock         (clk),
    .rst           (reg_rst_delayed[59]),
    .overflow_out  (_fifo_84_residual_add_FromCallee_overflow_out),
    .underflow_out (_fifo_84_residual_add_FromCallee_underflow_out),
    .empty         (_fifo_84_residual_add_FromCallee_empty),
    .rdreq         (fifo_data_84.rden),
    .full          (_fifo_84_residual_add_FromCallee_full),
    .wrreq         (fifo_data_84.wren),
    .data          (fifo_data_84.data_in),
    .q             (_fifo_84_residual_add_FromCallee_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(16),
    .PORT_WIDTH(16),
    .WRITE_DELAY(1),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(1),
    .AUTO_PIPELINE_GROUP("fifo_86_rotate_even_FromCallee"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(1),
    .USE_LUTRAM(1)
  ) fifo_86_rotate_even_FromCallee (
    .clock         (clk),
    .rst           (reg_rst_delayed[60]),
    .overflow_out  (_fifo_86_rotate_even_FromCallee_overflow_out),
    .underflow_out (_fifo_86_rotate_even_FromCallee_underflow_out),
    .empty         (_fifo_86_rotate_even_FromCallee_empty),
    .rdreq         (fifo_data_86.rden),
    .full          (_fifo_86_rotate_even_FromCallee_full),
    .wrreq         (fifo_data_86.wren),
    .data          (fifo_data_86.data_in),
    .q             (_fifo_86_rotate_even_FromCallee_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(16),
    .PORT_WIDTH(16),
    .WRITE_DELAY(1),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(1),
    .AUTO_PIPELINE_GROUP("fifo_88_rotate_odd_FromCallee"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(1),
    .USE_LUTRAM(1)
  ) fifo_88_rotate_odd_FromCallee (
    .clock         (clk),
    .rst           (reg_rst_delayed[61]),
    .overflow_out  (_fifo_88_rotate_odd_FromCallee_overflow_out),
    .underflow_out (_fifo_88_rotate_odd_FromCallee_underflow_out),
    .empty         (_fifo_88_rotate_odd_FromCallee_empty),
    .rdreq         (fifo_data_88.rden),
    .full          (_fifo_88_rotate_odd_FromCallee_full),
    .wrreq         (fifo_data_88.wren),
    .data          (fifo_data_88.data_in),
    .q             (_fifo_88_rotate_odd_FromCallee_q)
  );
  ContextSaverOrdered #(
    .DST_WIDTH(1),
    .CALLEE_IN_WIDTH(1),
    .CALLEE_OUT_WIDTH(1),
    .CALLER_WIDTH(1),
    .LOG_DEPTH(9),
    .DEPTH(512),
    .USE_LUTRAM(0),
    .ALMOSTFULL_ENTRIES(0),
    .IS_PIPELINED(0),
    .LOOP_COUNT_WIDTH(1),
    .PENDING_COUNT_WIDTH(0),
    .RETURN_ELEMENT_WIDTH(1),
    .RETURN_ELEMENT_COUNT(1),
    .ALMOSTEMPTY_VAL(0),
    .WRITE_DELAY(0),
    .BUFFER_FIFO_OPTIMIZATION(0),
    .CALLEE_VOID_RETURN_TYPE(1)
  ) context_saver_61_forward_cos_ContextSaver (
    .clk                    (clk),
    .rst                    (reg_rst_delayed[77]),
    .caller_wren_in
      (context_saver_61_forward_cos_ContextSaver_caller_wren_in__circt),
    .caller_data_in
      (context_saver_61_forward_cos_ContextSaver_caller_data_in__circt),
    .caller_loop_count_in
      (context_saver_61_forward_cos_ContextSaver_caller_loop_count_in__circt),
    .caller_almost_full_out
      (_context_saver_61_forward_cos_ContextSaver_caller_almost_full_out),
    .callee_empty_in        (fifo_data_60.empty),
    .callee_data_in         ('0),
    .callee_rden_out        (_context_saver_61_forward_cos_ContextSaver_callee_rden_out),
    .output_rdy_in          (passthrough_data_31.rdy_ext),
    .valid_out              (_context_saver_61_forward_cos_ContextSaver_valid_out),
    .callee_data_out        (_context_saver_61_forward_cos_ContextSaver_callee_data_out),
    .caller_data_out        (_context_saver_61_forward_cos_ContextSaver_caller_data_out)
  );
  ContextSaverOrdered #(
    .DST_WIDTH(1),
    .CALLEE_IN_WIDTH(1),
    .CALLEE_OUT_WIDTH(1),
    .CALLER_WIDTH(1),
    .LOG_DEPTH(9),
    .DEPTH(512),
    .USE_LUTRAM(0),
    .ALMOSTFULL_ENTRIES(0),
    .IS_PIPELINED(0),
    .LOOP_COUNT_WIDTH(1),
    .PENDING_COUNT_WIDTH(0),
    .RETURN_ELEMENT_WIDTH(1),
    .RETURN_ELEMENT_COUNT(1),
    .ALMOSTEMPTY_VAL(0),
    .WRITE_DELAY(0),
    .BUFFER_FIFO_OPTIMIZATION(0),
    .CALLEE_VOID_RETURN_TYPE(1)
  ) context_saver_63_forward_sin_ContextSaver (
    .clk                    (clk),
    .rst                    (reg_rst_delayed[78]),
    .caller_wren_in
      (context_saver_63_forward_sin_ContextSaver_caller_wren_in__circt),
    .caller_data_in
      (context_saver_63_forward_sin_ContextSaver_caller_data_in__circt),
    .caller_loop_count_in
      (context_saver_63_forward_sin_ContextSaver_caller_loop_count_in__circt),
    .caller_almost_full_out
      (_context_saver_63_forward_sin_ContextSaver_caller_almost_full_out),
    .callee_empty_in        (fifo_data_62.empty),
    .callee_data_in         ('0),
    .callee_rden_out        (_context_saver_63_forward_sin_ContextSaver_callee_rden_out),
    .output_rdy_in          (passthrough_data_33.rdy_ext),
    .valid_out              (_context_saver_63_forward_sin_ContextSaver_valid_out),
    .callee_data_out        (_context_saver_63_forward_sin_ContextSaver_callee_data_out),
    .caller_data_out        (_context_saver_63_forward_sin_ContextSaver_caller_data_out)
  );
  ContextSaverOrdered #(
    .DST_WIDTH(256),
    .CALLEE_IN_WIDTH(256),
    .CALLEE_OUT_WIDTH(256),
    .CALLER_WIDTH(1),
    .LOG_DEPTH(9),
    .DEPTH(512),
    .USE_LUTRAM(0),
    .ALMOSTFULL_ENTRIES(0),
    .IS_PIPELINED(0),
    .LOOP_COUNT_WIDTH(1),
    .PENDING_COUNT_WIDTH(0),
    .RETURN_ELEMENT_WIDTH(256),
    .RETURN_ELEMENT_COUNT(1),
    .ALMOSTEMPTY_VAL(0),
    .WRITE_DELAY(0),
    .BUFFER_FIFO_OPTIMIZATION(0),
    .CALLEE_VOID_RETURN_TYPE(0)
  ) context_saver_65_read_cos_forwarded_ContextSaver (
    .clk                    (clk),
    .rst                    (reg_rst_delayed[79]),
    .caller_wren_in
      (context_saver_65_read_cos_forwarded_ContextSaver_caller_wren_in__circt),
    .caller_data_in
      (context_saver_65_read_cos_forwarded_ContextSaver_caller_data_in__circt),
    .caller_loop_count_in
      (context_saver_65_read_cos_forwarded_ContextSaver_caller_loop_count_in__circt),
    .caller_almost_full_out
      (_context_saver_65_read_cos_forwarded_ContextSaver_caller_almost_full_out),
    .callee_empty_in        (fifo_data_64.empty),
    .callee_data_in         (fifo_data_64.data_out),
    .callee_rden_out
      (_context_saver_65_read_cos_forwarded_ContextSaver_callee_rden_out),
    .output_rdy_in          (passthrough_data_35.rdy_ext),
    .valid_out              (_context_saver_65_read_cos_forwarded_ContextSaver_valid_out),
    .callee_data_out
      (_context_saver_65_read_cos_forwarded_ContextSaver_callee_data_out),
    .caller_data_out
      (_context_saver_65_read_cos_forwarded_ContextSaver_caller_data_out)
  );
  ContextSaverOrdered #(
    .DST_WIDTH(256),
    .CALLEE_IN_WIDTH(256),
    .CALLEE_OUT_WIDTH(256),
    .CALLER_WIDTH(1),
    .LOG_DEPTH(9),
    .DEPTH(512),
    .USE_LUTRAM(0),
    .ALMOSTFULL_ENTRIES(0),
    .IS_PIPELINED(0),
    .LOOP_COUNT_WIDTH(1),
    .PENDING_COUNT_WIDTH(0),
    .RETURN_ELEMENT_WIDTH(256),
    .RETURN_ELEMENT_COUNT(1),
    .ALMOSTEMPTY_VAL(0),
    .WRITE_DELAY(0),
    .BUFFER_FIFO_OPTIMIZATION(0),
    .CALLEE_VOID_RETURN_TYPE(0)
  ) context_saver_67_read_sin_forwarded_ContextSaver (
    .clk                    (clk),
    .rst                    (reg_rst_delayed[80]),
    .caller_wren_in
      (context_saver_67_read_sin_forwarded_ContextSaver_caller_wren_in__circt),
    .caller_data_in
      (context_saver_67_read_sin_forwarded_ContextSaver_caller_data_in__circt),
    .caller_loop_count_in
      (context_saver_67_read_sin_forwarded_ContextSaver_caller_loop_count_in__circt),
    .caller_almost_full_out
      (_context_saver_67_read_sin_forwarded_ContextSaver_caller_almost_full_out),
    .callee_empty_in        (fifo_data_66.empty),
    .callee_data_in         (fifo_data_66.data_out),
    .callee_rden_out
      (_context_saver_67_read_sin_forwarded_ContextSaver_callee_rden_out),
    .output_rdy_in          (passthrough_data_37.rdy_ext),
    .valid_out              (_context_saver_67_read_sin_forwarded_ContextSaver_valid_out),
    .callee_data_out
      (_context_saver_67_read_sin_forwarded_ContextSaver_callee_data_out),
    .caller_data_out
      (_context_saver_67_read_sin_forwarded_ContextSaver_caller_data_out)
  );
  ContextSaverOrdered #(
    .DST_WIDTH(1),
    .CALLEE_IN_WIDTH(1),
    .CALLEE_OUT_WIDTH(1),
    .CALLER_WIDTH(1),
    .LOG_DEPTH(9),
    .DEPTH(512),
    .USE_LUTRAM(0),
    .ALMOSTFULL_ENTRIES(0),
    .IS_PIPELINED(0),
    .LOOP_COUNT_WIDTH(1),
    .PENDING_COUNT_WIDTH(0),
    .RETURN_ELEMENT_WIDTH(1),
    .RETURN_ELEMENT_COUNT(1),
    .ALMOSTEMPTY_VAL(0),
    .WRITE_DELAY(0),
    .BUFFER_FIFO_OPTIMIZATION(0),
    .CALLEE_VOID_RETURN_TYPE(1)
  ) context_saver_69_set_gamma_pre_attn_ContextSaver (
    .clk                    (clk),
    .rst                    (reg_rst_delayed[81]),
    .caller_wren_in
      (context_saver_69_set_gamma_pre_attn_ContextSaver_caller_wren_in__circt),
    .caller_data_in
      (context_saver_69_set_gamma_pre_attn_ContextSaver_caller_data_in__circt),
    .caller_loop_count_in
      (context_saver_69_set_gamma_pre_attn_ContextSaver_caller_loop_count_in__circt),
    .caller_almost_full_out
      (_context_saver_69_set_gamma_pre_attn_ContextSaver_caller_almost_full_out),
    .callee_empty_in        (fifo_data_68.empty),
    .callee_data_in         ('0),
    .callee_rden_out
      (_context_saver_69_set_gamma_pre_attn_ContextSaver_callee_rden_out),
    .output_rdy_in          (passthrough_data_39.rdy_ext),
    .valid_out              (_context_saver_69_set_gamma_pre_attn_ContextSaver_valid_out),
    .callee_data_out
      (_context_saver_69_set_gamma_pre_attn_ContextSaver_callee_data_out),
    .caller_data_out
      (_context_saver_69_set_gamma_pre_attn_ContextSaver_caller_data_out)
  );
  ContextSaverOrdered #(
    .DST_WIDTH(1),
    .CALLEE_IN_WIDTH(1),
    .CALLEE_OUT_WIDTH(1),
    .CALLER_WIDTH(1),
    .LOG_DEPTH(9),
    .DEPTH(512),
    .USE_LUTRAM(0),
    .ALMOSTFULL_ENTRIES(0),
    .IS_PIPELINED(0),
    .LOOP_COUNT_WIDTH(1),
    .PENDING_COUNT_WIDTH(0),
    .RETURN_ELEMENT_WIDTH(1),
    .RETURN_ELEMENT_COUNT(1),
    .ALMOSTEMPTY_VAL(0),
    .WRITE_DELAY(0),
    .BUFFER_FIFO_OPTIMIZATION(0),
    .CALLEE_VOID_RETURN_TYPE(1)
  ) context_saver_71_set_gamma_pre_mlp_ContextSaver (
    .clk                    (clk),
    .rst                    (reg_rst_delayed[82]),
    .caller_wren_in
      (context_saver_71_set_gamma_pre_mlp_ContextSaver_caller_wren_in__circt),
    .caller_data_in
      (context_saver_71_set_gamma_pre_mlp_ContextSaver_caller_data_in__circt),
    .caller_loop_count_in
      (context_saver_71_set_gamma_pre_mlp_ContextSaver_caller_loop_count_in__circt),
    .caller_almost_full_out
      (_context_saver_71_set_gamma_pre_mlp_ContextSaver_caller_almost_full_out),
    .callee_empty_in        (fifo_data_70.empty),
    .callee_data_in         ('0),
    .callee_rden_out
      (_context_saver_71_set_gamma_pre_mlp_ContextSaver_callee_rden_out),
    .output_rdy_in          (passthrough_data_41.rdy_ext),
    .valid_out              (_context_saver_71_set_gamma_pre_mlp_ContextSaver_valid_out),
    .callee_data_out
      (_context_saver_71_set_gamma_pre_mlp_ContextSaver_callee_data_out),
    .caller_data_out
      (_context_saver_71_set_gamma_pre_mlp_ContextSaver_caller_data_out)
  );
  ContextSaverOrdered #(
    .DST_WIDTH(1),
    .CALLEE_IN_WIDTH(1),
    .CALLEE_OUT_WIDTH(1),
    .CALLER_WIDTH(1),
    .LOG_DEPTH(9),
    .DEPTH(512),
    .USE_LUTRAM(0),
    .ALMOSTFULL_ENTRIES(0),
    .IS_PIPELINED(0),
    .LOOP_COUNT_WIDTH(1),
    .PENDING_COUNT_WIDTH(0),
    .RETURN_ELEMENT_WIDTH(1),
    .RETURN_ELEMENT_COUNT(1),
    .ALMOSTEMPTY_VAL(0),
    .WRITE_DELAY(0),
    .BUFFER_FIFO_OPTIMIZATION(0),
    .CALLEE_VOID_RETURN_TYPE(1)
  ) context_saver_73_set_rsqrt_lut_ContextSaver (
    .clk                    (clk),
    .rst                    (reg_rst_delayed[83]),
    .caller_wren_in
      (context_saver_73_set_rsqrt_lut_ContextSaver_caller_wren_in__circt),
    .caller_data_in
      (context_saver_73_set_rsqrt_lut_ContextSaver_caller_data_in__circt),
    .caller_loop_count_in
      (context_saver_73_set_rsqrt_lut_ContextSaver_caller_loop_count_in__circt),
    .caller_almost_full_out
      (_context_saver_73_set_rsqrt_lut_ContextSaver_caller_almost_full_out),
    .callee_empty_in        (fifo_data_72.empty),
    .callee_data_in         ('0),
    .callee_rden_out
      (_context_saver_73_set_rsqrt_lut_ContextSaver_callee_rden_out),
    .output_rdy_in          (passthrough_data_43.rdy_ext),
    .valid_out              (_context_saver_73_set_rsqrt_lut_ContextSaver_valid_out),
    .callee_data_out
      (_context_saver_73_set_rsqrt_lut_ContextSaver_callee_data_out),
    .caller_data_out        (_context_saver_73_set_rsqrt_lut_ContextSaver_caller_data_out)
  );
  ContextSaverOrdered #(
    .DST_WIDTH(1),
    .CALLEE_IN_WIDTH(1),
    .CALLEE_OUT_WIDTH(1),
    .CALLER_WIDTH(1),
    .LOG_DEPTH(9),
    .DEPTH(512),
    .USE_LUTRAM(0),
    .ALMOSTFULL_ENTRIES(0),
    .IS_PIPELINED(0),
    .LOOP_COUNT_WIDTH(1),
    .PENDING_COUNT_WIDTH(0),
    .RETURN_ELEMENT_WIDTH(1),
    .RETURN_ELEMENT_COUNT(1),
    .ALMOSTEMPTY_VAL(0),
    .WRITE_DELAY(0),
    .BUFFER_FIFO_OPTIMIZATION(0),
    .CALLEE_VOID_RETURN_TYPE(1)
  ) context_saver_75_set_sigmoid_lut_ContextSaver (
    .clk                    (clk),
    .rst                    (reg_rst_delayed[84]),
    .caller_wren_in
      (context_saver_75_set_sigmoid_lut_ContextSaver_caller_wren_in__circt),
    .caller_data_in
      (context_saver_75_set_sigmoid_lut_ContextSaver_caller_data_in__circt),
    .caller_loop_count_in
      (context_saver_75_set_sigmoid_lut_ContextSaver_caller_loop_count_in__circt),
    .caller_almost_full_out
      (_context_saver_75_set_sigmoid_lut_ContextSaver_caller_almost_full_out),
    .callee_empty_in        (fifo_data_74.empty),
    .callee_data_in         ('0),
    .callee_rden_out
      (_context_saver_75_set_sigmoid_lut_ContextSaver_callee_rden_out),
    .output_rdy_in          (passthrough_data_45.rdy_ext),
    .valid_out              (_context_saver_75_set_sigmoid_lut_ContextSaver_valid_out),
    .callee_data_out
      (_context_saver_75_set_sigmoid_lut_ContextSaver_callee_data_out),
    .caller_data_out
      (_context_saver_75_set_sigmoid_lut_ContextSaver_caller_data_out)
  );
  ContextSaverOrdered #(
    .DST_WIDTH(1),
    .CALLEE_IN_WIDTH(1),
    .CALLEE_OUT_WIDTH(1),
    .CALLER_WIDTH(1),
    .LOG_DEPTH(9),
    .DEPTH(512),
    .USE_LUTRAM(0),
    .ALMOSTFULL_ENTRIES(0),
    .IS_PIPELINED(0),
    .LOOP_COUNT_WIDTH(1),
    .PENDING_COUNT_WIDTH(0),
    .RETURN_ELEMENT_WIDTH(1),
    .RETURN_ELEMENT_COUNT(1),
    .ALMOSTEMPTY_VAL(0),
    .WRITE_DELAY(0),
    .BUFFER_FIFO_OPTIMIZATION(0),
    .CALLEE_VOID_RETURN_TYPE(1)
  ) context_saver_77_rmsnorm_reset_ContextSaver (
    .clk                    (clk),
    .rst                    (reg_rst_delayed[85]),
    .caller_wren_in
      (context_saver_77_rmsnorm_reset_ContextSaver_caller_wren_in__circt),
    .caller_data_in
      (context_saver_77_rmsnorm_reset_ContextSaver_caller_data_in__circt),
    .caller_loop_count_in
      (context_saver_77_rmsnorm_reset_ContextSaver_caller_loop_count_in__circt),
    .caller_almost_full_out
      (_context_saver_77_rmsnorm_reset_ContextSaver_caller_almost_full_out),
    .callee_empty_in        (fifo_data_76.empty),
    .callee_data_in         ('0),
    .callee_rden_out
      (_context_saver_77_rmsnorm_reset_ContextSaver_callee_rden_out),
    .output_rdy_in          (passthrough_data_47.rdy_ext),
    .valid_out              (_context_saver_77_rmsnorm_reset_ContextSaver_valid_out),
    .callee_data_out
      (_context_saver_77_rmsnorm_reset_ContextSaver_callee_data_out),
    .caller_data_out        (_context_saver_77_rmsnorm_reset_ContextSaver_caller_data_out)
  );
  ContextSaverOrdered #(
    .DST_WIDTH(32),
    .CALLEE_IN_WIDTH(32),
    .CALLEE_OUT_WIDTH(32),
    .CALLER_WIDTH(1),
    .LOG_DEPTH(9),
    .DEPTH(512),
    .USE_LUTRAM(0),
    .ALMOSTFULL_ENTRIES(0),
    .IS_PIPELINED(0),
    .LOOP_COUNT_WIDTH(1),
    .PENDING_COUNT_WIDTH(0),
    .RETURN_ELEMENT_WIDTH(32),
    .RETURN_ELEMENT_COUNT(1),
    .ALMOSTEMPTY_VAL(0),
    .WRITE_DELAY(0),
    .BUFFER_FIFO_OPTIMIZATION(0),
    .CALLEE_VOID_RETURN_TYPE(0)
  ) context_saver_79_rmsnorm_get_sum_ContextSaver (
    .clk                    (clk),
    .rst                    (reg_rst_delayed[86]),
    .caller_wren_in
      (context_saver_79_rmsnorm_get_sum_ContextSaver_caller_wren_in__circt),
    .caller_data_in
      (context_saver_79_rmsnorm_get_sum_ContextSaver_caller_data_in__circt),
    .caller_loop_count_in
      (context_saver_79_rmsnorm_get_sum_ContextSaver_caller_loop_count_in__circt),
    .caller_almost_full_out
      (_context_saver_79_rmsnorm_get_sum_ContextSaver_caller_almost_full_out),
    .callee_empty_in        (fifo_data_78.empty),
    .callee_data_in         (fifo_data_78.data_out),
    .callee_rden_out
      (_context_saver_79_rmsnorm_get_sum_ContextSaver_callee_rden_out),
    .output_rdy_in          (passthrough_data_49.rdy_ext),
    .valid_out              (_context_saver_79_rmsnorm_get_sum_ContextSaver_valid_out),
    .callee_data_out
      (_context_saver_79_rmsnorm_get_sum_ContextSaver_callee_data_out),
    .caller_data_out
      (_context_saver_79_rmsnorm_get_sum_ContextSaver_caller_data_out)
  );
  ContextSaverOrdered #(
    .DST_WIDTH(1),
    .CALLEE_IN_WIDTH(1),
    .CALLEE_OUT_WIDTH(1),
    .CALLER_WIDTH(1),
    .LOG_DEPTH(9),
    .DEPTH(512),
    .USE_LUTRAM(0),
    .ALMOSTFULL_ENTRIES(0),
    .IS_PIPELINED(0),
    .LOOP_COUNT_WIDTH(1),
    .PENDING_COUNT_WIDTH(0),
    .RETURN_ELEMENT_WIDTH(1),
    .RETURN_ELEMENT_COUNT(1),
    .ALMOSTEMPTY_VAL(0),
    .WRITE_DELAY(0),
    .BUFFER_FIFO_OPTIMIZATION(0),
    .CALLEE_VOID_RETURN_TYPE(1)
  ) context_saver_81_rmsnorm_accumulate_ContextSaver (
    .clk                    (clk),
    .rst                    (reg_rst_delayed[87]),
    .caller_wren_in
      (context_saver_81_rmsnorm_accumulate_ContextSaver_caller_wren_in__circt),
    .caller_data_in
      (context_saver_81_rmsnorm_accumulate_ContextSaver_caller_data_in__circt),
    .caller_loop_count_in
      (context_saver_81_rmsnorm_accumulate_ContextSaver_caller_loop_count_in__circt),
    .caller_almost_full_out
      (_context_saver_81_rmsnorm_accumulate_ContextSaver_caller_almost_full_out),
    .callee_empty_in        (fifo_data_80.empty),
    .callee_data_in         ('0),
    .callee_rden_out
      (_context_saver_81_rmsnorm_accumulate_ContextSaver_callee_rden_out),
    .output_rdy_in          (passthrough_data_51.rdy_ext),
    .valid_out              (_context_saver_81_rmsnorm_accumulate_ContextSaver_valid_out),
    .callee_data_out
      (_context_saver_81_rmsnorm_accumulate_ContextSaver_callee_data_out),
    .caller_data_out
      (_context_saver_81_rmsnorm_accumulate_ContextSaver_caller_data_out)
  );
  ContextSaverOrdered #(
    .DST_WIDTH(16),
    .CALLEE_IN_WIDTH(16),
    .CALLEE_OUT_WIDTH(16),
    .CALLER_WIDTH(1),
    .LOG_DEPTH(9),
    .DEPTH(512),
    .USE_LUTRAM(0),
    .ALMOSTFULL_ENTRIES(0),
    .IS_PIPELINED(0),
    .LOOP_COUNT_WIDTH(1),
    .PENDING_COUNT_WIDTH(0),
    .RETURN_ELEMENT_WIDTH(16),
    .RETURN_ELEMENT_COUNT(1),
    .ALMOSTEMPTY_VAL(0),
    .WRITE_DELAY(0),
    .BUFFER_FIFO_OPTIMIZATION(0),
    .CALLEE_VOID_RETURN_TYPE(0)
  ) context_saver_83_swiglu_compute_ContextSaver (
    .clk                    (clk),
    .rst                    (reg_rst_delayed[88]),
    .caller_wren_in
      (context_saver_83_swiglu_compute_ContextSaver_caller_wren_in__circt),
    .caller_data_in
      (context_saver_83_swiglu_compute_ContextSaver_caller_data_in__circt),
    .caller_loop_count_in
      (context_saver_83_swiglu_compute_ContextSaver_caller_loop_count_in__circt),
    .caller_almost_full_out
      (_context_saver_83_swiglu_compute_ContextSaver_caller_almost_full_out),
    .callee_empty_in        (fifo_data_82.empty),
    .callee_data_in         (fifo_data_82.data_out),
    .callee_rden_out
      (_context_saver_83_swiglu_compute_ContextSaver_callee_rden_out),
    .output_rdy_in          (passthrough_data_53.rdy_ext),
    .valid_out              (_context_saver_83_swiglu_compute_ContextSaver_valid_out),
    .callee_data_out
      (_context_saver_83_swiglu_compute_ContextSaver_callee_data_out),
    .caller_data_out
      (_context_saver_83_swiglu_compute_ContextSaver_caller_data_out)
  );
  ContextSaverOrdered #(
    .DST_WIDTH(16),
    .CALLEE_IN_WIDTH(16),
    .CALLEE_OUT_WIDTH(16),
    .CALLER_WIDTH(1),
    .LOG_DEPTH(9),
    .DEPTH(512),
    .USE_LUTRAM(0),
    .ALMOSTFULL_ENTRIES(0),
    .IS_PIPELINED(0),
    .LOOP_COUNT_WIDTH(1),
    .PENDING_COUNT_WIDTH(0),
    .RETURN_ELEMENT_WIDTH(16),
    .RETURN_ELEMENT_COUNT(1),
    .ALMOSTEMPTY_VAL(0),
    .WRITE_DELAY(0),
    .BUFFER_FIFO_OPTIMIZATION(0),
    .CALLEE_VOID_RETURN_TYPE(0)
  ) context_saver_85_residual_add_ContextSaver (
    .clk                    (clk),
    .rst                    (reg_rst_delayed[89]),
    .caller_wren_in
      (context_saver_85_residual_add_ContextSaver_caller_wren_in__circt),
    .caller_data_in
      (context_saver_85_residual_add_ContextSaver_caller_data_in__circt),
    .caller_loop_count_in
      (context_saver_85_residual_add_ContextSaver_caller_loop_count_in__circt),
    .caller_almost_full_out
      (_context_saver_85_residual_add_ContextSaver_caller_almost_full_out),
    .callee_empty_in        (fifo_data_84.empty),
    .callee_data_in         (fifo_data_84.data_out),
    .callee_rden_out        (_context_saver_85_residual_add_ContextSaver_callee_rden_out),
    .output_rdy_in          (passthrough_data_55.rdy_ext),
    .valid_out              (_context_saver_85_residual_add_ContextSaver_valid_out),
    .callee_data_out        (_context_saver_85_residual_add_ContextSaver_callee_data_out),
    .caller_data_out        (_context_saver_85_residual_add_ContextSaver_caller_data_out)
  );
  ContextSaverOrdered #(
    .DST_WIDTH(16),
    .CALLEE_IN_WIDTH(16),
    .CALLEE_OUT_WIDTH(16),
    .CALLER_WIDTH(1),
    .LOG_DEPTH(9),
    .DEPTH(512),
    .USE_LUTRAM(0),
    .ALMOSTFULL_ENTRIES(0),
    .IS_PIPELINED(0),
    .LOOP_COUNT_WIDTH(1),
    .PENDING_COUNT_WIDTH(0),
    .RETURN_ELEMENT_WIDTH(16),
    .RETURN_ELEMENT_COUNT(1),
    .ALMOSTEMPTY_VAL(0),
    .WRITE_DELAY(0),
    .BUFFER_FIFO_OPTIMIZATION(0),
    .CALLEE_VOID_RETURN_TYPE(0)
  ) context_saver_87_rotate_even_ContextSaver (
    .clk                    (clk),
    .rst                    (reg_rst_delayed[90]),
    .caller_wren_in
      (context_saver_87_rotate_even_ContextSaver_caller_wren_in__circt),
    .caller_data_in
      (context_saver_87_rotate_even_ContextSaver_caller_data_in__circt),
    .caller_loop_count_in
      (context_saver_87_rotate_even_ContextSaver_caller_loop_count_in__circt),
    .caller_almost_full_out
      (_context_saver_87_rotate_even_ContextSaver_caller_almost_full_out),
    .callee_empty_in        (fifo_data_86.empty),
    .callee_data_in         (fifo_data_86.data_out),
    .callee_rden_out        (_context_saver_87_rotate_even_ContextSaver_callee_rden_out),
    .output_rdy_in          (passthrough_data_57.rdy_ext),
    .valid_out              (_context_saver_87_rotate_even_ContextSaver_valid_out),
    .callee_data_out        (_context_saver_87_rotate_even_ContextSaver_callee_data_out),
    .caller_data_out        (_context_saver_87_rotate_even_ContextSaver_caller_data_out)
  );
  ContextSaverOrdered #(
    .DST_WIDTH(16),
    .CALLEE_IN_WIDTH(16),
    .CALLEE_OUT_WIDTH(16),
    .CALLER_WIDTH(1),
    .LOG_DEPTH(9),
    .DEPTH(512),
    .USE_LUTRAM(0),
    .ALMOSTFULL_ENTRIES(0),
    .IS_PIPELINED(0),
    .LOOP_COUNT_WIDTH(1),
    .PENDING_COUNT_WIDTH(0),
    .RETURN_ELEMENT_WIDTH(16),
    .RETURN_ELEMENT_COUNT(1),
    .ALMOSTEMPTY_VAL(0),
    .WRITE_DELAY(0),
    .BUFFER_FIFO_OPTIMIZATION(0),
    .CALLEE_VOID_RETURN_TYPE(0)
  ) context_saver_89_rotate_odd_ContextSaver (
    .clk                    (clk),
    .rst                    (reg_rst_delayed[91]),
    .caller_wren_in
      (context_saver_89_rotate_odd_ContextSaver_caller_wren_in__circt),
    .caller_data_in
      (context_saver_89_rotate_odd_ContextSaver_caller_data_in__circt),
    .caller_loop_count_in
      (context_saver_89_rotate_odd_ContextSaver_caller_loop_count_in__circt),
    .caller_almost_full_out
      (_context_saver_89_rotate_odd_ContextSaver_caller_almost_full_out),
    .callee_empty_in        (fifo_data_88.empty),
    .callee_data_in         (fifo_data_88.data_out),
    .callee_rden_out        (_context_saver_89_rotate_odd_ContextSaver_callee_rden_out),
    .output_rdy_in          (passthrough_data_59.rdy_ext),
    .valid_out              (_context_saver_89_rotate_odd_ContextSaver_valid_out),
    .callee_data_out        (_context_saver_89_rotate_odd_ContextSaver_callee_data_out),
    .caller_data_out        (_context_saver_89_rotate_odd_ContextSaver_caller_data_out)
  );
  layer_orchestrator_forward_cos_BasicBlock_0 forward_cos_BasicBlock_0Impl (	// layer_orchestrator.k:33:51
    .clk                               (clk),	// layer_orchestrator.k:33:51
    .rst                               (reg_rst_delayed[92]),	// layer_orchestrator.k:33:51
    .done_out                          (/* unused */),
    .semaphore_full_0_in
      (forward_cos_BasicBlock_0Impl_semaphore_full_0_in__circt),	// layer_orchestrator.k:33:51
    .incr_semaphore_thread_count_0_out
      (_forward_cos_BasicBlock_0Impl_incr_semaphore_thread_count_0_out),
    .fifo_data_out_0                   (_forward_cos_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0                       (_forward_cos_BasicBlock_0Impl_fifo_wren_0),
    .context_saver_caller_wren_1
      (_forward_cos_BasicBlock_0Impl_context_saver_caller_wren_1),
    .context_saver_caller_loop_count_1
      (_forward_cos_BasicBlock_0Impl_context_saver_caller_loop_count_1),
    .fifo_almost_full_in_raw_0         (fifo_data_15.almost_full),	// layer_orchestrator.k:33:51
    .fifo_overflow_in_0                (fifo_data_15.overflow),	// layer_orchestrator.k:33:51
    .data_in_30                        (passthrough_data_30.data),	// layer_orchestrator.k:33:51
    .input_fifo_underflow_0            (passthrough_data_30.underflow),	// layer_orchestrator.k:33:51
    .input_rdy_0                       (_forward_cos_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0                     (passthrough_data_30.valid),	// layer_orchestrator.k:33:51
    .control_state_out                 (/* unused */)
  );	// layer_orchestrator.k:33:51
  layer_orchestrator_forward_cos_BasicBlock_1 forward_cos_BasicBlock_1Impl (	// layer_orchestrator.k:33:51
    .clk                               (clk),	// layer_orchestrator.k:33:51
    .rst                               (reg_rst_delayed[93]),	// layer_orchestrator.k:33:51
    .done_out                          (/* unused */),
    .decr_semaphore_thread_count_0_out
      (_forward_cos_BasicBlock_1Impl_decr_semaphore_thread_count_0_out),
    .fifo_wren_0                       (_forward_cos_BasicBlock_1Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0         (fifo_data_0.almost_full),	// layer_orchestrator.k:33:51
    .fifo_overflow_in_0                (fifo_data_0.overflow),	// layer_orchestrator.k:33:51
    .input_fifo_underflow_0            (passthrough_data_31.underflow),	// layer_orchestrator.k:33:51
    .input_rdy_0                       (_forward_cos_BasicBlock_1Impl_input_rdy_0),
    .input_valid_0                     (passthrough_data_31.valid),	// layer_orchestrator.k:33:51
    .control_state_out                 (/* unused */)
  );	// layer_orchestrator.k:33:51
  layer_orchestrator_forward_sin_BasicBlock_0 forward_sin_BasicBlock_0Impl (	// layer_orchestrator.k:34:51
    .clk                               (clk),	// layer_orchestrator.k:34:51
    .rst                               (reg_rst_delayed[94]),	// layer_orchestrator.k:34:51
    .done_out                          (/* unused */),
    .semaphore_full_1_in
      (forward_sin_BasicBlock_0Impl_semaphore_full_1_in__circt),	// layer_orchestrator.k:34:51
    .incr_semaphore_thread_count_1_out
      (_forward_sin_BasicBlock_0Impl_incr_semaphore_thread_count_1_out),
    .fifo_data_out_0                   (_forward_sin_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0                       (_forward_sin_BasicBlock_0Impl_fifo_wren_0),
    .context_saver_caller_wren_1
      (_forward_sin_BasicBlock_0Impl_context_saver_caller_wren_1),
    .context_saver_caller_loop_count_1
      (_forward_sin_BasicBlock_0Impl_context_saver_caller_loop_count_1),
    .fifo_almost_full_in_raw_0         (fifo_data_16.almost_full),	// layer_orchestrator.k:34:51
    .fifo_overflow_in_0                (fifo_data_16.overflow),	// layer_orchestrator.k:34:51
    .data_in_32                        (passthrough_data_32.data),	// layer_orchestrator.k:34:51
    .input_fifo_underflow_0            (passthrough_data_32.underflow),	// layer_orchestrator.k:34:51
    .input_rdy_0                       (_forward_sin_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0                     (passthrough_data_32.valid),	// layer_orchestrator.k:34:51
    .control_state_out                 (/* unused */)
  );	// layer_orchestrator.k:34:51
  layer_orchestrator_forward_sin_BasicBlock_1 forward_sin_BasicBlock_1Impl (	// layer_orchestrator.k:34:51
    .clk                               (clk),	// layer_orchestrator.k:34:51
    .rst                               (reg_rst_delayed[95]),	// layer_orchestrator.k:34:51
    .done_out                          (/* unused */),
    .decr_semaphore_thread_count_1_out
      (_forward_sin_BasicBlock_1Impl_decr_semaphore_thread_count_1_out),
    .fifo_wren_0                       (_forward_sin_BasicBlock_1Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0         (fifo_data_1.almost_full),	// layer_orchestrator.k:34:51
    .fifo_overflow_in_0                (fifo_data_1.overflow),	// layer_orchestrator.k:34:51
    .input_fifo_underflow_0            (passthrough_data_33.underflow),	// layer_orchestrator.k:34:51
    .input_rdy_0                       (_forward_sin_BasicBlock_1Impl_input_rdy_0),
    .input_valid_0                     (passthrough_data_33.valid),	// layer_orchestrator.k:34:51
    .control_state_out                 (/* unused */)
  );	// layer_orchestrator.k:34:51
  layer_orchestrator_read_cos_forwarded_BasicBlock_0 read_cos_forwarded_BasicBlock_0Impl (	// layer_orchestrator.k:35:51
    .clk                               (clk),	// layer_orchestrator.k:35:51
    .rst                               (reg_rst_delayed[96]),	// layer_orchestrator.k:35:51
    .done_out                          (/* unused */),
    .semaphore_full_2_in
      (read_cos_forwarded_BasicBlock_0Impl_semaphore_full_2_in__circt),	// layer_orchestrator.k:35:51
    .incr_semaphore_thread_count_2_out
      (_read_cos_forwarded_BasicBlock_0Impl_incr_semaphore_thread_count_2_out),
    .fifo_data_out_0
      (_read_cos_forwarded_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0                       (_read_cos_forwarded_BasicBlock_0Impl_fifo_wren_0),
    .context_saver_caller_wren_1
      (_read_cos_forwarded_BasicBlock_0Impl_context_saver_caller_wren_1),
    .context_saver_caller_loop_count_1
      (_read_cos_forwarded_BasicBlock_0Impl_context_saver_caller_loop_count_1),
    .fifo_almost_full_in_raw_0         (fifo_data_17.almost_full),	// layer_orchestrator.k:35:51
    .fifo_overflow_in_0                (fifo_data_17.overflow),	// layer_orchestrator.k:35:51
    .data_in_34                        (passthrough_data_34.data),	// layer_orchestrator.k:35:51
    .input_fifo_underflow_0            (passthrough_data_34.underflow),	// layer_orchestrator.k:35:51
    .input_rdy_0                       (_read_cos_forwarded_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0                     (passthrough_data_34.valid),	// layer_orchestrator.k:35:51
    .control_state_out                 (/* unused */)
  );	// layer_orchestrator.k:35:51
  layer_orchestrator_read_cos_forwarded_BasicBlock_1 read_cos_forwarded_BasicBlock_1Impl (	// layer_orchestrator.k:35:58
    .clk                               (clk),	// layer_orchestrator.k:35:58
    .rst                               (reg_rst_delayed[97]),	// layer_orchestrator.k:35:58
    .done_out                          (/* unused */),
    .decr_semaphore_thread_count_2_out
      (_read_cos_forwarded_BasicBlock_1Impl_decr_semaphore_thread_count_2_out),
    .fifo_data_out_0
      (_read_cos_forwarded_BasicBlock_1Impl_fifo_data_out_0),
    .fifo_wren_0                       (_read_cos_forwarded_BasicBlock_1Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0         (fifo_data_2.almost_full),	// layer_orchestrator.k:35:58
    .fifo_overflow_in_0                (fifo_data_2.overflow),	// layer_orchestrator.k:35:58
    .data_in_35                        (passthrough_data_35.data),	// layer_orchestrator.k:35:58
    .input_fifo_underflow_0            (passthrough_data_35.underflow),	// layer_orchestrator.k:35:58
    .input_rdy_0                       (_read_cos_forwarded_BasicBlock_1Impl_input_rdy_0),
    .input_valid_0                     (passthrough_data_35.valid),	// layer_orchestrator.k:35:58
    .control_state_out                 (/* unused */)
  );	// layer_orchestrator.k:35:58
  layer_orchestrator_read_sin_forwarded_BasicBlock_0 read_sin_forwarded_BasicBlock_0Impl (	// layer_orchestrator.k:36:51
    .clk                               (clk),	// layer_orchestrator.k:36:51
    .rst                               (reg_rst_delayed[98]),	// layer_orchestrator.k:36:51
    .done_out                          (/* unused */),
    .semaphore_full_3_in
      (read_sin_forwarded_BasicBlock_0Impl_semaphore_full_3_in__circt),	// layer_orchestrator.k:36:51
    .incr_semaphore_thread_count_3_out
      (_read_sin_forwarded_BasicBlock_0Impl_incr_semaphore_thread_count_3_out),
    .fifo_data_out_0
      (_read_sin_forwarded_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0                       (_read_sin_forwarded_BasicBlock_0Impl_fifo_wren_0),
    .context_saver_caller_wren_1
      (_read_sin_forwarded_BasicBlock_0Impl_context_saver_caller_wren_1),
    .context_saver_caller_loop_count_1
      (_read_sin_forwarded_BasicBlock_0Impl_context_saver_caller_loop_count_1),
    .fifo_almost_full_in_raw_0         (fifo_data_18.almost_full),	// layer_orchestrator.k:36:51
    .fifo_overflow_in_0                (fifo_data_18.overflow),	// layer_orchestrator.k:36:51
    .data_in_36                        (passthrough_data_36.data),	// layer_orchestrator.k:36:51
    .input_fifo_underflow_0            (passthrough_data_36.underflow),	// layer_orchestrator.k:36:51
    .input_rdy_0                       (_read_sin_forwarded_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0                     (passthrough_data_36.valid),	// layer_orchestrator.k:36:51
    .control_state_out                 (/* unused */)
  );	// layer_orchestrator.k:36:51
  layer_orchestrator_read_sin_forwarded_BasicBlock_1 read_sin_forwarded_BasicBlock_1Impl (	// layer_orchestrator.k:36:58
    .clk                               (clk),	// layer_orchestrator.k:36:58
    .rst                               (reg_rst_delayed[99]),	// layer_orchestrator.k:36:58
    .done_out                          (/* unused */),
    .decr_semaphore_thread_count_3_out
      (_read_sin_forwarded_BasicBlock_1Impl_decr_semaphore_thread_count_3_out),
    .fifo_data_out_0
      (_read_sin_forwarded_BasicBlock_1Impl_fifo_data_out_0),
    .fifo_wren_0                       (_read_sin_forwarded_BasicBlock_1Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0         (fifo_data_3.almost_full),	// layer_orchestrator.k:36:58
    .fifo_overflow_in_0                (fifo_data_3.overflow),	// layer_orchestrator.k:36:58
    .data_in_37                        (passthrough_data_37.data),	// layer_orchestrator.k:36:58
    .input_fifo_underflow_0            (passthrough_data_37.underflow),	// layer_orchestrator.k:36:58
    .input_rdy_0                       (_read_sin_forwarded_BasicBlock_1Impl_input_rdy_0),
    .input_valid_0                     (passthrough_data_37.valid),	// layer_orchestrator.k:36:58
    .control_state_out                 (/* unused */)
  );	// layer_orchestrator.k:36:58
  layer_orchestrator_prog_gamma_pre_attn_BasicBlock_0 prog_gamma_pre_attn_BasicBlock_0Impl (	// layer_orchestrator.k:42:56
    .clk                               (clk),	// layer_orchestrator.k:42:56
    .rst                               (reg_rst_delayed[100]),	// layer_orchestrator.k:42:56
    .done_out                          (/* unused */),
    .semaphore_full_4_in
      (prog_gamma_pre_attn_BasicBlock_0Impl_semaphore_full_4_in__circt),	// layer_orchestrator.k:42:56
    .incr_semaphore_thread_count_4_out
      (_prog_gamma_pre_attn_BasicBlock_0Impl_incr_semaphore_thread_count_4_out),
    .fifo_data_out_0
      (_prog_gamma_pre_attn_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0
      (_prog_gamma_pre_attn_BasicBlock_0Impl_fifo_wren_0),
    .context_saver_caller_wren_1
      (_prog_gamma_pre_attn_BasicBlock_0Impl_context_saver_caller_wren_1),
    .context_saver_caller_loop_count_1
      (_prog_gamma_pre_attn_BasicBlock_0Impl_context_saver_caller_loop_count_1),
    .fifo_almost_full_in_raw_0         (fifo_data_24.almost_full),	// layer_orchestrator.k:42:56
    .fifo_overflow_in_0                (fifo_data_24.overflow),	// layer_orchestrator.k:42:56
    .data_in_38                        (passthrough_data_38.data),	// layer_orchestrator.k:42:56
    .input_fifo_underflow_0            (passthrough_data_38.underflow),	// layer_orchestrator.k:42:56
    .input_rdy_0
      (_prog_gamma_pre_attn_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0                     (passthrough_data_38.valid),	// layer_orchestrator.k:42:56
    .control_state_out                 (/* unused */)
  );	// layer_orchestrator.k:42:56
  layer_orchestrator_prog_gamma_pre_attn_BasicBlock_1 prog_gamma_pre_attn_BasicBlock_1Impl (	// layer_orchestrator.k:42:56
    .clk                               (clk),	// layer_orchestrator.k:42:56
    .rst                               (reg_rst_delayed[101]),	// layer_orchestrator.k:42:56
    .done_out                          (/* unused */),
    .decr_semaphore_thread_count_4_out
      (_prog_gamma_pre_attn_BasicBlock_1Impl_decr_semaphore_thread_count_4_out),
    .fifo_wren_0
      (_prog_gamma_pre_attn_BasicBlock_1Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0         (fifo_data_4.almost_full),	// layer_orchestrator.k:42:56
    .fifo_overflow_in_0                (fifo_data_4.overflow),	// layer_orchestrator.k:42:56
    .input_fifo_underflow_0            (passthrough_data_39.underflow),	// layer_orchestrator.k:42:56
    .input_rdy_0
      (_prog_gamma_pre_attn_BasicBlock_1Impl_input_rdy_0),
    .input_valid_0                     (passthrough_data_39.valid),	// layer_orchestrator.k:42:56
    .control_state_out                 (/* unused */)
  );	// layer_orchestrator.k:42:56
  layer_orchestrator_prog_gamma_pre_mlp_BasicBlock_0 prog_gamma_pre_mlp_BasicBlock_0Impl (	// layer_orchestrator.k:43:56
    .clk                               (clk),	// layer_orchestrator.k:43:56
    .rst                               (reg_rst_delayed[102]),	// layer_orchestrator.k:43:56
    .done_out                          (/* unused */),
    .semaphore_full_5_in
      (prog_gamma_pre_mlp_BasicBlock_0Impl_semaphore_full_5_in__circt),	// layer_orchestrator.k:43:56
    .incr_semaphore_thread_count_5_out
      (_prog_gamma_pre_mlp_BasicBlock_0Impl_incr_semaphore_thread_count_5_out),
    .fifo_data_out_0
      (_prog_gamma_pre_mlp_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0                       (_prog_gamma_pre_mlp_BasicBlock_0Impl_fifo_wren_0),
    .context_saver_caller_wren_1
      (_prog_gamma_pre_mlp_BasicBlock_0Impl_context_saver_caller_wren_1),
    .context_saver_caller_loop_count_1
      (_prog_gamma_pre_mlp_BasicBlock_0Impl_context_saver_caller_loop_count_1),
    .fifo_almost_full_in_raw_0         (fifo_data_25.almost_full),	// layer_orchestrator.k:43:56
    .fifo_overflow_in_0                (fifo_data_25.overflow),	// layer_orchestrator.k:43:56
    .data_in_40                        (passthrough_data_40.data),	// layer_orchestrator.k:43:56
    .input_fifo_underflow_0            (passthrough_data_40.underflow),	// layer_orchestrator.k:43:56
    .input_rdy_0                       (_prog_gamma_pre_mlp_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0                     (passthrough_data_40.valid),	// layer_orchestrator.k:43:56
    .control_state_out                 (/* unused */)
  );	// layer_orchestrator.k:43:56
  layer_orchestrator_prog_gamma_pre_mlp_BasicBlock_1 prog_gamma_pre_mlp_BasicBlock_1Impl (	// layer_orchestrator.k:43:56
    .clk                               (clk),	// layer_orchestrator.k:43:56
    .rst                               (reg_rst_delayed[103]),	// layer_orchestrator.k:43:56
    .done_out                          (/* unused */),
    .decr_semaphore_thread_count_5_out
      (_prog_gamma_pre_mlp_BasicBlock_1Impl_decr_semaphore_thread_count_5_out),
    .fifo_wren_0                       (_prog_gamma_pre_mlp_BasicBlock_1Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0         (fifo_data_5.almost_full),	// layer_orchestrator.k:43:56
    .fifo_overflow_in_0                (fifo_data_5.overflow),	// layer_orchestrator.k:43:56
    .input_fifo_underflow_0            (passthrough_data_41.underflow),	// layer_orchestrator.k:43:56
    .input_rdy_0                       (_prog_gamma_pre_mlp_BasicBlock_1Impl_input_rdy_0),
    .input_valid_0                     (passthrough_data_41.valid),	// layer_orchestrator.k:43:56
    .control_state_out                 (/* unused */)
  );	// layer_orchestrator.k:43:56
  layer_orchestrator_prog_rsqrt_lut_BasicBlock_0 prog_rsqrt_lut_BasicBlock_0Impl (	// layer_orchestrator.k:44:56
    .clk                               (clk),	// layer_orchestrator.k:44:56
    .rst                               (reg_rst_delayed[104]),	// layer_orchestrator.k:44:56
    .done_out                          (/* unused */),
    .semaphore_full_6_in
      (prog_rsqrt_lut_BasicBlock_0Impl_semaphore_full_6_in__circt),	// layer_orchestrator.k:44:56
    .incr_semaphore_thread_count_6_out
      (_prog_rsqrt_lut_BasicBlock_0Impl_incr_semaphore_thread_count_6_out),
    .fifo_data_out_0                   (_prog_rsqrt_lut_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0                       (_prog_rsqrt_lut_BasicBlock_0Impl_fifo_wren_0),
    .context_saver_caller_wren_1
      (_prog_rsqrt_lut_BasicBlock_0Impl_context_saver_caller_wren_1),
    .context_saver_caller_loop_count_1
      (_prog_rsqrt_lut_BasicBlock_0Impl_context_saver_caller_loop_count_1),
    .fifo_almost_full_in_raw_0         (fifo_data_26.almost_full),	// layer_orchestrator.k:44:56
    .fifo_overflow_in_0                (fifo_data_26.overflow),	// layer_orchestrator.k:44:56
    .data_in_42                        (passthrough_data_42.data),	// layer_orchestrator.k:44:56
    .input_fifo_underflow_0            (passthrough_data_42.underflow),	// layer_orchestrator.k:44:56
    .input_rdy_0                       (_prog_rsqrt_lut_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0                     (passthrough_data_42.valid),	// layer_orchestrator.k:44:56
    .control_state_out                 (/* unused */)
  );	// layer_orchestrator.k:44:56
  layer_orchestrator_prog_rsqrt_lut_BasicBlock_1 prog_rsqrt_lut_BasicBlock_1Impl (	// layer_orchestrator.k:44:56
    .clk                               (clk),	// layer_orchestrator.k:44:56
    .rst                               (reg_rst_delayed[105]),	// layer_orchestrator.k:44:56
    .done_out                          (/* unused */),
    .decr_semaphore_thread_count_6_out
      (_prog_rsqrt_lut_BasicBlock_1Impl_decr_semaphore_thread_count_6_out),
    .fifo_wren_0                       (_prog_rsqrt_lut_BasicBlock_1Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0         (fifo_data_6.almost_full),	// layer_orchestrator.k:44:56
    .fifo_overflow_in_0                (fifo_data_6.overflow),	// layer_orchestrator.k:44:56
    .input_fifo_underflow_0            (passthrough_data_43.underflow),	// layer_orchestrator.k:44:56
    .input_rdy_0                       (_prog_rsqrt_lut_BasicBlock_1Impl_input_rdy_0),
    .input_valid_0                     (passthrough_data_43.valid),	// layer_orchestrator.k:44:56
    .control_state_out                 (/* unused */)
  );	// layer_orchestrator.k:44:56
  layer_orchestrator_prog_sigmoid_lut_BasicBlock_0 prog_sigmoid_lut_BasicBlock_0Impl (	// layer_orchestrator.k:45:56
    .clk                               (clk),	// layer_orchestrator.k:45:56
    .rst                               (reg_rst_delayed[106]),	// layer_orchestrator.k:45:56
    .done_out                          (/* unused */),
    .semaphore_full_7_in
      (prog_sigmoid_lut_BasicBlock_0Impl_semaphore_full_7_in__circt),	// layer_orchestrator.k:45:56
    .incr_semaphore_thread_count_7_out
      (_prog_sigmoid_lut_BasicBlock_0Impl_incr_semaphore_thread_count_7_out),
    .fifo_data_out_0
      (_prog_sigmoid_lut_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0                       (_prog_sigmoid_lut_BasicBlock_0Impl_fifo_wren_0),
    .context_saver_caller_wren_1
      (_prog_sigmoid_lut_BasicBlock_0Impl_context_saver_caller_wren_1),
    .context_saver_caller_loop_count_1
      (_prog_sigmoid_lut_BasicBlock_0Impl_context_saver_caller_loop_count_1),
    .fifo_almost_full_in_raw_0         (fifo_data_27.almost_full),	// layer_orchestrator.k:45:56
    .fifo_overflow_in_0                (fifo_data_27.overflow),	// layer_orchestrator.k:45:56
    .data_in_44                        (passthrough_data_44.data),	// layer_orchestrator.k:45:56
    .input_fifo_underflow_0            (passthrough_data_44.underflow),	// layer_orchestrator.k:45:56
    .input_rdy_0                       (_prog_sigmoid_lut_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0                     (passthrough_data_44.valid),	// layer_orchestrator.k:45:56
    .control_state_out                 (/* unused */)
  );	// layer_orchestrator.k:45:56
  layer_orchestrator_prog_sigmoid_lut_BasicBlock_1 prog_sigmoid_lut_BasicBlock_1Impl (	// layer_orchestrator.k:45:56
    .clk                               (clk),	// layer_orchestrator.k:45:56
    .rst                               (reg_rst_delayed[107]),	// layer_orchestrator.k:45:56
    .done_out                          (/* unused */),
    .decr_semaphore_thread_count_7_out
      (_prog_sigmoid_lut_BasicBlock_1Impl_decr_semaphore_thread_count_7_out),
    .fifo_wren_0                       (_prog_sigmoid_lut_BasicBlock_1Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0         (fifo_data_7.almost_full),	// layer_orchestrator.k:45:56
    .fifo_overflow_in_0                (fifo_data_7.overflow),	// layer_orchestrator.k:45:56
    .input_fifo_underflow_0            (passthrough_data_45.underflow),	// layer_orchestrator.k:45:56
    .input_rdy_0                       (_prog_sigmoid_lut_BasicBlock_1Impl_input_rdy_0),
    .input_valid_0                     (passthrough_data_45.valid),	// layer_orchestrator.k:45:56
    .control_state_out                 (/* unused */)
  );	// layer_orchestrator.k:45:56
  layer_orchestrator_rmsnorm_reset_BasicBlock_0 rmsnorm_reset_BasicBlock_0Impl (	// layer_orchestrator.k:56:28
    .clk                               (clk),	// layer_orchestrator.k:56:28
    .rst                               (reg_rst_delayed[108]),	// layer_orchestrator.k:56:28
    .done_out                          (/* unused */),
    .semaphore_full_8_in
      (rmsnorm_reset_BasicBlock_0Impl_semaphore_full_8_in__circt),	// layer_orchestrator.k:56:28
    .incr_semaphore_thread_count_8_out
      (_rmsnorm_reset_BasicBlock_0Impl_incr_semaphore_thread_count_8_out),
    .fifo_data_out_0                   (_rmsnorm_reset_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0                       (_rmsnorm_reset_BasicBlock_0Impl_fifo_wren_0),
    .context_saver_caller_wren_1
      (_rmsnorm_reset_BasicBlock_0Impl_context_saver_caller_wren_1),
    .context_saver_caller_loop_count_1
      (_rmsnorm_reset_BasicBlock_0Impl_context_saver_caller_loop_count_1),
    .fifo_almost_full_in_raw_0         (fifo_data_23.almost_full),	// layer_orchestrator.k:56:28
    .fifo_overflow_in_0                (fifo_data_23.overflow),	// layer_orchestrator.k:56:28
    .input_fifo_underflow_0            (passthrough_data_46.underflow),	// layer_orchestrator.k:56:28
    .input_rdy_0                       (_rmsnorm_reset_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0                     (passthrough_data_46.valid),	// layer_orchestrator.k:56:28
    .control_state_out                 (/* unused */)
  );	// layer_orchestrator.k:56:28
  layer_orchestrator_rmsnorm_reset_BasicBlock_1 rmsnorm_reset_BasicBlock_1Impl (	// layer_orchestrator.k:56:28
    .clk                               (clk),	// layer_orchestrator.k:56:28
    .rst                               (reg_rst_delayed[109]),	// layer_orchestrator.k:56:28
    .done_out                          (/* unused */),
    .decr_semaphore_thread_count_8_out
      (_rmsnorm_reset_BasicBlock_1Impl_decr_semaphore_thread_count_8_out),
    .fifo_wren_0                       (_rmsnorm_reset_BasicBlock_1Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0         (fifo_data_8.almost_full),	// layer_orchestrator.k:56:28
    .fifo_overflow_in_0                (fifo_data_8.overflow),	// layer_orchestrator.k:56:28
    .input_fifo_underflow_0            (passthrough_data_47.underflow),	// layer_orchestrator.k:56:28
    .input_rdy_0                       (_rmsnorm_reset_BasicBlock_1Impl_input_rdy_0),
    .input_valid_0                     (passthrough_data_47.valid),	// layer_orchestrator.k:56:28
    .control_state_out                 (/* unused */)
  );	// layer_orchestrator.k:56:28
  layer_orchestrator_rmsnorm_get_sum_BasicBlock_0 rmsnorm_get_sum_BasicBlock_0Impl (	// layer_orchestrator.k:57:32
    .clk                               (clk),	// layer_orchestrator.k:57:32
    .rst                               (reg_rst_delayed[110]),	// layer_orchestrator.k:57:32
    .done_out                          (/* unused */),
    .semaphore_full_9_in
      (rmsnorm_get_sum_BasicBlock_0Impl_semaphore_full_9_in__circt),	// layer_orchestrator.k:57:32
    .incr_semaphore_thread_count_9_out
      (_rmsnorm_get_sum_BasicBlock_0Impl_incr_semaphore_thread_count_9_out),
    .fifo_data_out_0
      (_rmsnorm_get_sum_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0                       (_rmsnorm_get_sum_BasicBlock_0Impl_fifo_wren_0),
    .context_saver_caller_wren_1
      (_rmsnorm_get_sum_BasicBlock_0Impl_context_saver_caller_wren_1),
    .context_saver_caller_loop_count_1
      (_rmsnorm_get_sum_BasicBlock_0Impl_context_saver_caller_loop_count_1),
    .fifo_almost_full_in_raw_0         (fifo_data_22.almost_full),	// layer_orchestrator.k:57:32
    .fifo_overflow_in_0                (fifo_data_22.overflow),	// layer_orchestrator.k:57:32
    .input_fifo_underflow_0            (passthrough_data_48.underflow),	// layer_orchestrator.k:57:32
    .input_rdy_0                       (_rmsnorm_get_sum_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0                     (passthrough_data_48.valid),	// layer_orchestrator.k:57:32
    .control_state_out                 (/* unused */)
  );	// layer_orchestrator.k:57:32
  layer_orchestrator_rmsnorm_get_sum_BasicBlock_1 rmsnorm_get_sum_BasicBlock_1Impl (	// layer_orchestrator.k:57:39
    .clk                               (clk),	// layer_orchestrator.k:57:39
    .rst                               (reg_rst_delayed[111]),	// layer_orchestrator.k:57:39
    .done_out                          (/* unused */),
    .decr_semaphore_thread_count_9_out
      (_rmsnorm_get_sum_BasicBlock_1Impl_decr_semaphore_thread_count_9_out),
    .fifo_data_out_0
      (_rmsnorm_get_sum_BasicBlock_1Impl_fifo_data_out_0),
    .fifo_wren_0                       (_rmsnorm_get_sum_BasicBlock_1Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0         (fifo_data_9.almost_full),	// layer_orchestrator.k:57:39
    .fifo_overflow_in_0                (fifo_data_9.overflow),	// layer_orchestrator.k:57:39
    .data_in_49                        (passthrough_data_49.data),	// layer_orchestrator.k:57:39
    .input_fifo_underflow_0            (passthrough_data_49.underflow),	// layer_orchestrator.k:57:39
    .input_rdy_0                       (_rmsnorm_get_sum_BasicBlock_1Impl_input_rdy_0),
    .input_valid_0                     (passthrough_data_49.valid),	// layer_orchestrator.k:57:39
    .control_state_out                 (/* unused */)
  );	// layer_orchestrator.k:57:39
  layer_orchestrator_rmsnorm_step_BasicBlock_0 rmsnorm_step_BasicBlock_0Impl (	// layer_orchestrator.k:62:40
    .clk                                (clk),	// layer_orchestrator.k:62:40
    .rst                                (reg_rst_delayed[112]),	// layer_orchestrator.k:62:40
    .done_out                           (/* unused */),
    .semaphore_full_10_in
      (rmsnorm_step_BasicBlock_0Impl_semaphore_full_10_in__circt),	// layer_orchestrator.k:62:40
    .incr_semaphore_thread_count_10_out
      (_rmsnorm_step_BasicBlock_0Impl_incr_semaphore_thread_count_10_out),
    .fifo_data_out_0                    (_rmsnorm_step_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0                        (_rmsnorm_step_BasicBlock_0Impl_fifo_wren_0),
    .context_saver_caller_wren_1
      (_rmsnorm_step_BasicBlock_0Impl_context_saver_caller_wren_1),
    .context_saver_caller_loop_count_1
      (_rmsnorm_step_BasicBlock_0Impl_context_saver_caller_loop_count_1),
    .fifo_almost_full_in_raw_0          (fifo_data_21.almost_full),	// layer_orchestrator.k:62:40
    .fifo_overflow_in_0                 (fifo_data_21.overflow),	// layer_orchestrator.k:62:40
    .data_in_50                         (passthrough_data_50.data),	// layer_orchestrator.k:62:40
    .input_fifo_underflow_0             (passthrough_data_50.underflow),	// layer_orchestrator.k:62:40
    .input_rdy_0                        (_rmsnorm_step_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0                      (passthrough_data_50.valid),	// layer_orchestrator.k:62:40
    .control_state_out                  (/* unused */)
  );	// layer_orchestrator.k:62:40
  layer_orchestrator_rmsnorm_step_BasicBlock_1 rmsnorm_step_BasicBlock_1Impl (	// layer_orchestrator.k:62:40
    .clk                                (clk),	// layer_orchestrator.k:62:40
    .rst                                (reg_rst_delayed[113]),	// layer_orchestrator.k:62:40
    .done_out                           (/* unused */),
    .decr_semaphore_thread_count_10_out
      (_rmsnorm_step_BasicBlock_1Impl_decr_semaphore_thread_count_10_out),
    .fifo_wren_0                        (_rmsnorm_step_BasicBlock_1Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0          (fifo_data_10.almost_full),	// layer_orchestrator.k:62:40
    .fifo_overflow_in_0                 (fifo_data_10.overflow),	// layer_orchestrator.k:62:40
    .input_fifo_underflow_0             (passthrough_data_51.underflow),	// layer_orchestrator.k:62:40
    .input_rdy_0                        (_rmsnorm_step_BasicBlock_1Impl_input_rdy_0),
    .input_valid_0                      (passthrough_data_51.valid),	// layer_orchestrator.k:62:40
    .control_state_out                  (/* unused */)
  );	// layer_orchestrator.k:62:40
  layer_orchestrator_swiglu_step_BasicBlock_0 swiglu_step_BasicBlock_0Impl (	// layer_orchestrator.k:66:9
    .clk                                (clk),	// layer_orchestrator.k:66:9
    .rst                                (reg_rst_delayed[114]),	// layer_orchestrator.k:66:9
    .done_out                           (/* unused */),
    .semaphore_full_11_in
      (swiglu_step_BasicBlock_0Impl_semaphore_full_11_in__circt),	// layer_orchestrator.k:66:9
    .incr_semaphore_thread_count_11_out
      (_swiglu_step_BasicBlock_0Impl_incr_semaphore_thread_count_11_out),
    .fifo_data_out_0                    (_swiglu_step_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0                        (_swiglu_step_BasicBlock_0Impl_fifo_wren_0),
    .context_saver_caller_wren_1
      (_swiglu_step_BasicBlock_0Impl_context_saver_caller_wren_1),
    .context_saver_caller_loop_count_1
      (_swiglu_step_BasicBlock_0Impl_context_saver_caller_loop_count_1),
    .fifo_almost_full_in_raw_0          (fifo_data_28.almost_full),	// layer_orchestrator.k:66:9
    .fifo_overflow_in_0                 (fifo_data_28.overflow),	// layer_orchestrator.k:66:9
    .data_in_52                         (passthrough_data_52.data),	// layer_orchestrator.k:66:9
    .input_fifo_underflow_0             (passthrough_data_52.underflow),	// layer_orchestrator.k:66:9
    .input_rdy_0                        (_swiglu_step_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0                      (passthrough_data_52.valid),	// layer_orchestrator.k:66:9
    .control_state_out                  (/* unused */)
  );	// layer_orchestrator.k:66:9
  layer_orchestrator_swiglu_step_BasicBlock_1 swiglu_step_BasicBlock_1Impl (	// layer_orchestrator.k:66:16
    .clk                                (clk),	// layer_orchestrator.k:66:16
    .rst                                (reg_rst_delayed[115]),	// layer_orchestrator.k:66:16
    .done_out                           (/* unused */),
    .decr_semaphore_thread_count_11_out
      (_swiglu_step_BasicBlock_1Impl_decr_semaphore_thread_count_11_out),
    .fifo_data_out_0                    (_swiglu_step_BasicBlock_1Impl_fifo_data_out_0),
    .fifo_wren_0                        (_swiglu_step_BasicBlock_1Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0          (fifo_data_11.almost_full),	// layer_orchestrator.k:66:16
    .fifo_overflow_in_0                 (fifo_data_11.overflow),	// layer_orchestrator.k:66:16
    .data_in_53                         (passthrough_data_53.data),	// layer_orchestrator.k:66:16
    .input_fifo_underflow_0             (passthrough_data_53.underflow),	// layer_orchestrator.k:66:16
    .input_rdy_0                        (_swiglu_step_BasicBlock_1Impl_input_rdy_0),
    .input_valid_0                      (passthrough_data_53.valid),	// layer_orchestrator.k:66:16
    .control_state_out                  (/* unused */)
  );	// layer_orchestrator.k:66:16
  layer_orchestrator_residual_add_step_BasicBlock_0 residual_add_step_BasicBlock_0Impl (	// layer_orchestrator.k:71:9
    .clk                                (clk),	// layer_orchestrator.k:71:9
    .rst                                (reg_rst_delayed[116]),	// layer_orchestrator.k:71:9
    .done_out                           (/* unused */),
    .semaphore_full_12_in
      (residual_add_step_BasicBlock_0Impl_semaphore_full_12_in__circt),	// layer_orchestrator.k:71:9
    .incr_semaphore_thread_count_12_out
      (_residual_add_step_BasicBlock_0Impl_incr_semaphore_thread_count_12_out),
    .fifo_data_out_0
      (_residual_add_step_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0                        (_residual_add_step_BasicBlock_0Impl_fifo_wren_0),
    .context_saver_caller_wren_1
      (_residual_add_step_BasicBlock_0Impl_context_saver_caller_wren_1),
    .context_saver_caller_loop_count_1
      (_residual_add_step_BasicBlock_0Impl_context_saver_caller_loop_count_1),
    .fifo_almost_full_in_raw_0          (fifo_data_29.almost_full),	// layer_orchestrator.k:71:9
    .fifo_overflow_in_0                 (fifo_data_29.overflow),	// layer_orchestrator.k:71:9
    .data_in_54                         (passthrough_data_54.data),	// layer_orchestrator.k:71:9
    .input_fifo_underflow_0             (passthrough_data_54.underflow),	// layer_orchestrator.k:71:9
    .input_rdy_0                        (_residual_add_step_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0                      (passthrough_data_54.valid),	// layer_orchestrator.k:71:9
    .control_state_out                  (/* unused */)
  );	// layer_orchestrator.k:71:9
  layer_orchestrator_residual_add_step_BasicBlock_1 residual_add_step_BasicBlock_1Impl (	// layer_orchestrator.k:71:16
    .clk                                (clk),	// layer_orchestrator.k:71:16
    .rst                                (reg_rst_delayed[117]),	// layer_orchestrator.k:71:16
    .done_out                           (/* unused */),
    .decr_semaphore_thread_count_12_out
      (_residual_add_step_BasicBlock_1Impl_decr_semaphore_thread_count_12_out),
    .fifo_data_out_0
      (_residual_add_step_BasicBlock_1Impl_fifo_data_out_0),
    .fifo_wren_0                        (_residual_add_step_BasicBlock_1Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0          (fifo_data_12.almost_full),	// layer_orchestrator.k:71:16
    .fifo_overflow_in_0                 (fifo_data_12.overflow),	// layer_orchestrator.k:71:16
    .data_in_55                         (passthrough_data_55.data),	// layer_orchestrator.k:71:16
    .input_fifo_underflow_0             (passthrough_data_55.underflow),	// layer_orchestrator.k:71:16
    .input_rdy_0                        (_residual_add_step_BasicBlock_1Impl_input_rdy_0),
    .input_valid_0                      (passthrough_data_55.valid),	// layer_orchestrator.k:71:16
    .control_state_out                  (/* unused */)
  );	// layer_orchestrator.k:71:16
  layer_orchestrator_rotate_even_BasicBlock_0 rotate_even_BasicBlock_0Impl (	// layer_orchestrator.k:76:9
    .clk                                (clk),	// layer_orchestrator.k:76:9
    .rst                                (reg_rst_delayed[118]),	// layer_orchestrator.k:76:9
    .done_out                           (/* unused */),
    .semaphore_full_13_in
      (rotate_even_BasicBlock_0Impl_semaphore_full_13_in__circt),	// layer_orchestrator.k:76:9
    .incr_semaphore_thread_count_13_out
      (_rotate_even_BasicBlock_0Impl_incr_semaphore_thread_count_13_out),
    .fifo_data_out_0                    (_rotate_even_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0                        (_rotate_even_BasicBlock_0Impl_fifo_wren_0),
    .context_saver_caller_wren_1
      (_rotate_even_BasicBlock_0Impl_context_saver_caller_wren_1),
    .context_saver_caller_loop_count_1
      (_rotate_even_BasicBlock_0Impl_context_saver_caller_loop_count_1),
    .fifo_almost_full_in_raw_0          (fifo_data_19.almost_full),	// layer_orchestrator.k:76:9
    .fifo_overflow_in_0                 (fifo_data_19.overflow),	// layer_orchestrator.k:76:9
    .data_in_56                         (passthrough_data_56.data),	// layer_orchestrator.k:76:9
    .input_fifo_underflow_0             (passthrough_data_56.underflow),	// layer_orchestrator.k:76:9
    .input_rdy_0                        (_rotate_even_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0                      (passthrough_data_56.valid),	// layer_orchestrator.k:76:9
    .control_state_out                  (/* unused */)
  );	// layer_orchestrator.k:76:9
  layer_orchestrator_rotate_even_BasicBlock_1 rotate_even_BasicBlock_1Impl (	// layer_orchestrator.k:76:16
    .clk                                (clk),	// layer_orchestrator.k:76:16
    .rst                                (reg_rst_delayed[119]),	// layer_orchestrator.k:76:16
    .done_out                           (/* unused */),
    .decr_semaphore_thread_count_13_out
      (_rotate_even_BasicBlock_1Impl_decr_semaphore_thread_count_13_out),
    .fifo_data_out_0                    (_rotate_even_BasicBlock_1Impl_fifo_data_out_0),
    .fifo_wren_0                        (_rotate_even_BasicBlock_1Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0          (fifo_data_13.almost_full),	// layer_orchestrator.k:76:16
    .fifo_overflow_in_0                 (fifo_data_13.overflow),	// layer_orchestrator.k:76:16
    .data_in_57                         (passthrough_data_57.data),	// layer_orchestrator.k:76:16
    .input_fifo_underflow_0             (passthrough_data_57.underflow),	// layer_orchestrator.k:76:16
    .input_rdy_0                        (_rotate_even_BasicBlock_1Impl_input_rdy_0),
    .input_valid_0                      (passthrough_data_57.valid),	// layer_orchestrator.k:76:16
    .control_state_out                  (/* unused */)
  );	// layer_orchestrator.k:76:16
  layer_orchestrator_rotate_odd_BasicBlock_0 rotate_odd_BasicBlock_0Impl (	// layer_orchestrator.k:79:9
    .clk                                (clk),	// layer_orchestrator.k:79:9
    .rst                                (reg_rst_delayed[120]),	// layer_orchestrator.k:79:9
    .done_out                           (/* unused */),
    .semaphore_full_14_in
      (rotate_odd_BasicBlock_0Impl_semaphore_full_14_in__circt),	// layer_orchestrator.k:79:9
    .incr_semaphore_thread_count_14_out
      (_rotate_odd_BasicBlock_0Impl_incr_semaphore_thread_count_14_out),
    .fifo_data_out_0                    (_rotate_odd_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0                        (_rotate_odd_BasicBlock_0Impl_fifo_wren_0),
    .context_saver_caller_wren_1
      (_rotate_odd_BasicBlock_0Impl_context_saver_caller_wren_1),
    .context_saver_caller_loop_count_1
      (_rotate_odd_BasicBlock_0Impl_context_saver_caller_loop_count_1),
    .fifo_almost_full_in_raw_0          (fifo_data_20.almost_full),	// layer_orchestrator.k:79:9
    .fifo_overflow_in_0                 (fifo_data_20.overflow),	// layer_orchestrator.k:79:9
    .data_in_58                         (passthrough_data_58.data),	// layer_orchestrator.k:79:9
    .input_fifo_underflow_0             (passthrough_data_58.underflow),	// layer_orchestrator.k:79:9
    .input_rdy_0                        (_rotate_odd_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0                      (passthrough_data_58.valid),	// layer_orchestrator.k:79:9
    .control_state_out                  (/* unused */)
  );	// layer_orchestrator.k:79:9
  layer_orchestrator_rotate_odd_BasicBlock_1 rotate_odd_BasicBlock_1Impl (	// layer_orchestrator.k:79:16
    .clk                                (clk),	// layer_orchestrator.k:79:16
    .rst                                (reg_rst_delayed[121]),	// layer_orchestrator.k:79:16
    .done_out                           (/* unused */),
    .decr_semaphore_thread_count_14_out
      (_rotate_odd_BasicBlock_1Impl_decr_semaphore_thread_count_14_out),
    .fifo_data_out_0                    (_rotate_odd_BasicBlock_1Impl_fifo_data_out_0),
    .fifo_wren_0                        (_rotate_odd_BasicBlock_1Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0          (fifo_data_14.almost_full),	// layer_orchestrator.k:79:16
    .fifo_overflow_in_0                 (fifo_data_14.overflow),	// layer_orchestrator.k:79:16
    .data_in_59                         (passthrough_data_59.data),	// layer_orchestrator.k:79:16
    .input_fifo_underflow_0             (passthrough_data_59.underflow),	// layer_orchestrator.k:79:16
    .input_rdy_0                        (_rotate_odd_BasicBlock_1Impl_input_rdy_0),
    .input_valid_0                      (passthrough_data_59.valid),	// layer_orchestrator.k:79:16
    .control_state_out                  (/* unused */)
  );	// layer_orchestrator.k:79:16
  assign rst_and_startup_done_out = rst_and_startup_done_out_net;
  assign forward_cos_rdy_out = forward_cos_rdy_out_net;
  assign forward_cos_empty_out = forward_cos_empty_out_net;
  assign forward_sin_rdy_out = forward_sin_rdy_out_net;
  assign forward_sin_empty_out = forward_sin_empty_out_net;
  assign read_cos_forwarded_rdy_out = read_cos_forwarded_rdy_out_net;
  assign read_cos_forwarded_empty_out = read_cos_forwarded_empty_out_net;
  assign read_cos_forwarded_result_out = read_cos_forwarded_result_out_net;
  assign read_sin_forwarded_rdy_out = read_sin_forwarded_rdy_out_net;
  assign read_sin_forwarded_empty_out = read_sin_forwarded_empty_out_net;
  assign read_sin_forwarded_result_out = read_sin_forwarded_result_out_net;
  assign prog_gamma_pre_attn_rdy_out = prog_gamma_pre_attn_rdy_out_net;
  assign prog_gamma_pre_attn_empty_out = prog_gamma_pre_attn_empty_out_net;
  assign prog_gamma_pre_mlp_rdy_out = prog_gamma_pre_mlp_rdy_out_net;
  assign prog_gamma_pre_mlp_empty_out = prog_gamma_pre_mlp_empty_out_net;
  assign prog_rsqrt_lut_rdy_out = prog_rsqrt_lut_rdy_out_net;
  assign prog_rsqrt_lut_empty_out = prog_rsqrt_lut_empty_out_net;
  assign prog_sigmoid_lut_rdy_out = prog_sigmoid_lut_rdy_out_net;
  assign prog_sigmoid_lut_empty_out = prog_sigmoid_lut_empty_out_net;
  assign rmsnorm_reset_rdy_out = rmsnorm_reset_rdy_out_net;
  assign rmsnorm_reset_empty_out = rmsnorm_reset_empty_out_net;
  assign rmsnorm_get_sum_rdy_out = rmsnorm_get_sum_rdy_out_net;
  assign rmsnorm_get_sum_empty_out = rmsnorm_get_sum_empty_out_net;
  assign rmsnorm_get_sum_result_out = rmsnorm_get_sum_result_out_net;
  assign rmsnorm_step_rdy_out = rmsnorm_step_rdy_out_net;
  assign rmsnorm_step_empty_out = rmsnorm_step_empty_out_net;
  assign swiglu_step_rdy_out = swiglu_step_rdy_out_net;
  assign swiglu_step_empty_out = swiglu_step_empty_out_net;
  assign swiglu_step_result_out = swiglu_step_result_out_net;
  assign residual_add_step_rdy_out = residual_add_step_rdy_out_net;
  assign residual_add_step_empty_out = residual_add_step_empty_out_net;
  assign residual_add_step_result_out = residual_add_step_result_out_net;
  assign rotate_even_rdy_out = rotate_even_rdy_out_net;
  assign rotate_even_empty_out = rotate_even_empty_out_net;
  assign rotate_even_result_out = rotate_even_result_out_net;
  assign rotate_odd_rdy_out = rotate_odd_rdy_out_net;
  assign rotate_odd_empty_out = rotate_odd_empty_out_net;
  assign rotate_odd_result_out = rotate_odd_result_out_net;
  assign stall_rate_supported_out = stall_rate_supported_out_net;
endmodule

module layer_orchestrator_EsiWrapper(
     input  wire                                                                                                       clk,
     input  wire                                                                                                       rst,
     input  wire [2:0]                                                                                                 stall_rate_in,
     input  wire                                                                                                       stall_rate_valid_in,
     input  wire struct packed {logic [1:0] phase; logic [255:0] v; }                                                  forward_cos_arg,
     input  wire                                                                                                       forward_cos_arg_valid,
     input  wire struct packed {logic [1:0] phase; logic [255:0] v; }                                                  forward_sin_arg,
     input  wire                                                                                                       forward_sin_arg_valid,
     input  wire struct packed {logic [15:0] idx; logic [15:0] val; }                                                  prog_gamma_pre_attn_arg,
     input  wire                                                                                                       prog_gamma_pre_attn_arg_valid,
     input  wire struct packed {logic [15:0] idx; logic [15:0] val; }                                                  prog_gamma_pre_mlp_arg,
     input  wire                                                                                                       prog_gamma_pre_mlp_arg_valid,
     input  wire struct packed {logic [7:0] idx; logic [15:0] val; }                                                   prog_rsqrt_lut_arg,
     input  wire                                                                                                       prog_rsqrt_lut_arg_valid,
     input  wire struct packed {logic [7:0] idx; logic [15:0] val; }                                                   prog_sigmoid_lut_arg,
     input  wire                                                                                                       prog_sigmoid_lut_arg_valid,
     input  wire struct packed {logic [1:0] phase; }                                                                   read_cos_forwarded_arg,
     input  wire                                                                                                       read_cos_forwarded_arg_valid,
     input  wire struct packed {logic [1:0] phase; }                                                                   read_sin_forwarded_arg,
     input  wire                                                                                                       read_sin_forwarded_arg_valid,
     input  wire struct packed {logic [15:0] a_bf16; logic [15:0] b_bf16; }                                            residual_add_step_arg,
     input  wire                                                                                                       residual_add_step_arg_valid,
  // input  wire /*Zero Width*/                                                                                        rmsnorm_get_sum_arg,
     input  wire                                                                                                       rmsnorm_get_sum_arg_valid,
  // input  wire /*Zero Width*/                                                                                        rmsnorm_reset_arg,
     input  wire                                                                                                       rmsnorm_reset_arg_valid,
     input  wire struct packed {logic [15:0] x_bf16; }                                                                 rmsnorm_step_arg,
     input  wire                                                                                                       rmsnorm_step_arg_valid,
     input  wire struct packed {logic [15:0] x_even; logic [15:0] x_odd; logic [15:0] cos_val; logic [15:0] sin_val; } rotate_even_arg,
     input  wire                                                                                                       rotate_even_arg_valid,
     input  wire struct packed {logic [15:0] x_even; logic [15:0] x_odd; logic [15:0] cos_val; logic [15:0] sin_val; } rotate_odd_arg,
     input  wire                                                                                                       rotate_odd_arg_valid,
     input  wire struct packed {logic [15:0] gate_bf16; logic [15:0] up_bf16; }                                        swiglu_step_arg,
     input  wire                                                                                                       swiglu_step_arg_valid,
     input  wire                                                                                                       forward_cos_result_rden,
     input  wire                                                                                                       forward_sin_result_rden,
     input  wire                                                                                                       prog_gamma_pre_attn_result_rden,
     input  wire                                                                                                       prog_gamma_pre_mlp_result_rden,
     input  wire                                                                                                       prog_rsqrt_lut_result_rden,
     input  wire                                                                                                       prog_sigmoid_lut_result_rden,
     input  wire                                                                                                       read_cos_forwarded_result_rden,
     input  wire                                                                                                       read_sin_forwarded_result_rden,
     input  wire                                                                                                       residual_add_step_result_rden,
     input  wire                                                                                                       rmsnorm_get_sum_result_rden,
     input  wire                                                                                                       rmsnorm_reset_result_rden,
     input  wire                                                                                                       rmsnorm_step_result_rden,
     input  wire                                                                                                       rotate_even_result_rden,
     input  wire                                                                                                       rotate_odd_result_rden,
     input  wire                                                                                                       swiglu_step_result_rden,
     output wire                                                                                                       forward_cos_arg_ready,
     output wire                                                                                                       forward_sin_arg_ready,
     output wire                                                                                                       prog_gamma_pre_attn_arg_ready,
     output wire                                                                                                       prog_gamma_pre_mlp_arg_ready,
     output wire                                                                                                       prog_rsqrt_lut_arg_ready,
     output wire                                                                                                       prog_sigmoid_lut_arg_ready,
     output wire                                                                                                       read_cos_forwarded_arg_ready,
     output wire                                                                                                       read_sin_forwarded_arg_ready,
     output wire                                                                                                       residual_add_step_arg_ready,
     output wire                                                                                                       rmsnorm_get_sum_arg_ready,
     output wire                                                                                                       rmsnorm_reset_arg_ready,
     output wire                                                                                                       rmsnorm_step_arg_ready,
     output wire                                                                                                       rotate_even_arg_ready,
     output wire                                                                                                       rotate_odd_arg_ready,
     output wire                                                                                                       swiglu_step_arg_ready,
  // output wire /*Zero Width*/                                                                                        forward_cos_result,
     output wire                                                                                                       forward_cos_result_empty,
  // output wire /*Zero Width*/                                                                                        forward_sin_result,
     output wire                                                                                                       forward_sin_result_empty,
  // output wire /*Zero Width*/                                                                                        prog_gamma_pre_attn_result,
     output wire                                                                                                       prog_gamma_pre_attn_result_empty,
  // output wire /*Zero Width*/                                                                                        prog_gamma_pre_mlp_result,
     output wire                                                                                                       prog_gamma_pre_mlp_result_empty,
  // output wire /*Zero Width*/                                                                                        prog_rsqrt_lut_result,
     output wire                                                                                                       prog_rsqrt_lut_result_empty,
  // output wire /*Zero Width*/                                                                                        prog_sigmoid_lut_result,
     output wire                                                                                                       prog_sigmoid_lut_result_empty,
     output wire [255:0]                                                                                               read_cos_forwarded_result,
     output wire                                                                                                       read_cos_forwarded_result_empty,
     output wire [255:0]                                                                                               read_sin_forwarded_result,
     output wire                                                                                                       read_sin_forwarded_result_empty,
     output wire [15:0]                                                                                                residual_add_step_result,
     output wire                                                                                                       residual_add_step_result_empty,
     output wire [31:0]                                                                                                rmsnorm_get_sum_result,
     output wire                                                                                                       rmsnorm_get_sum_result_empty,
  // output wire /*Zero Width*/                                                                                        rmsnorm_reset_result,
     output wire                                                                                                       rmsnorm_reset_result_empty,
  // output wire /*Zero Width*/                                                                                        rmsnorm_step_result,
     output wire                                                                                                       rmsnorm_step_result_empty,
     output wire [15:0]                                                                                                rotate_even_result,
     output wire                                                                                                       rotate_even_result_empty,
     output wire [15:0]                                                                                                rotate_odd_result,
     output wire                                                                                                       rotate_odd_result_empty,
     output wire [15:0]                                                                                                swiglu_step_result,
     output wire                                                                                                       swiglu_step_result_empty,
     output wire                                                                                                       rst_and_startup_done_out,
     output wire                                                                                                       stall_rate_supported_out
);

  wire [255:0] _EsiWrapped_read_cos_forwarded_result_out;
  wire [255:0] _EsiWrapped_read_sin_forwarded_result_out;
  wire [31:0]  _EsiWrapped_rmsnorm_get_sum_result_out;
  wire [15:0]  _EsiWrapped_swiglu_step_result_out;
  wire [15:0]  _EsiWrapped_residual_add_step_result_out;
  wire [15:0]  _EsiWrapped_rotate_even_result_out;
  wire [15:0]  _EsiWrapped_rotate_odd_result_out;
  layer_orchestrator EsiWrapped (
    .clk                           (clk),
    .rst                           (rst),
    .forward_cos_valid_in          (forward_cos_arg_valid),
    .forward_cos_phase_in          (forward_cos_arg.phase),
    .forward_cos_v_in              (forward_cos_arg.v),
    .forward_cos_rden_in           (forward_cos_result_rden),
    .forward_sin_valid_in          (forward_sin_arg_valid),
    .forward_sin_phase_in          (forward_sin_arg.phase),
    .forward_sin_v_in              (forward_sin_arg.v),
    .forward_sin_rden_in           (forward_sin_result_rden),
    .read_cos_forwarded_valid_in   (read_cos_forwarded_arg_valid),
    .read_cos_forwarded_phase_in   (read_cos_forwarded_arg.phase),
    .read_cos_forwarded_rden_in    (read_cos_forwarded_result_rden),
    .read_sin_forwarded_valid_in   (read_sin_forwarded_arg_valid),
    .read_sin_forwarded_phase_in   (read_sin_forwarded_arg.phase),
    .read_sin_forwarded_rden_in    (read_sin_forwarded_result_rden),
    .prog_gamma_pre_attn_valid_in  (prog_gamma_pre_attn_arg_valid),
    .prog_gamma_pre_attn_idx_in    (prog_gamma_pre_attn_arg.idx),
    .prog_gamma_pre_attn_val_in    (prog_gamma_pre_attn_arg.val),
    .prog_gamma_pre_attn_rden_in   (prog_gamma_pre_attn_result_rden),
    .prog_gamma_pre_mlp_valid_in   (prog_gamma_pre_mlp_arg_valid),
    .prog_gamma_pre_mlp_idx_in     (prog_gamma_pre_mlp_arg.idx),
    .prog_gamma_pre_mlp_val_in     (prog_gamma_pre_mlp_arg.val),
    .prog_gamma_pre_mlp_rden_in    (prog_gamma_pre_mlp_result_rden),
    .prog_rsqrt_lut_valid_in       (prog_rsqrt_lut_arg_valid),
    .prog_rsqrt_lut_idx_in         (prog_rsqrt_lut_arg.idx),
    .prog_rsqrt_lut_val_in         (prog_rsqrt_lut_arg.val),
    .prog_rsqrt_lut_rden_in        (prog_rsqrt_lut_result_rden),
    .prog_sigmoid_lut_valid_in     (prog_sigmoid_lut_arg_valid),
    .prog_sigmoid_lut_idx_in       (prog_sigmoid_lut_arg.idx),
    .prog_sigmoid_lut_val_in       (prog_sigmoid_lut_arg.val),
    .prog_sigmoid_lut_rden_in      (prog_sigmoid_lut_result_rden),
    .rmsnorm_reset_valid_in        (rmsnorm_reset_arg_valid),
    .rmsnorm_reset_rden_in         (rmsnorm_reset_result_rden),
    .rmsnorm_get_sum_valid_in      (rmsnorm_get_sum_arg_valid),
    .rmsnorm_get_sum_rden_in       (rmsnorm_get_sum_result_rden),
    .rmsnorm_step_valid_in         (rmsnorm_step_arg_valid),
    .rmsnorm_step_x_bf16_in        (rmsnorm_step_arg.x_bf16),
    .rmsnorm_step_rden_in          (rmsnorm_step_result_rden),
    .swiglu_step_valid_in          (swiglu_step_arg_valid),
    .swiglu_step_gate_bf16_in      (swiglu_step_arg.gate_bf16),
    .swiglu_step_up_bf16_in        (swiglu_step_arg.up_bf16),
    .swiglu_step_rden_in           (swiglu_step_result_rden),
    .residual_add_step_valid_in    (residual_add_step_arg_valid),
    .residual_add_step_a_bf16_in   (residual_add_step_arg.a_bf16),
    .residual_add_step_b_bf16_in   (residual_add_step_arg.b_bf16),
    .residual_add_step_rden_in     (residual_add_step_result_rden),
    .rotate_even_valid_in          (rotate_even_arg_valid),
    .rotate_even_x_even_in         (rotate_even_arg.x_even),
    .rotate_even_x_odd_in          (rotate_even_arg.x_odd),
    .rotate_even_cos_val_in        (rotate_even_arg.cos_val),
    .rotate_even_sin_val_in        (rotate_even_arg.sin_val),
    .rotate_even_rden_in           (rotate_even_result_rden),
    .rotate_odd_valid_in           (rotate_odd_arg_valid),
    .rotate_odd_x_even_in          (rotate_odd_arg.x_even),
    .rotate_odd_x_odd_in           (rotate_odd_arg.x_odd),
    .rotate_odd_cos_val_in         (rotate_odd_arg.cos_val),
    .rotate_odd_sin_val_in         (rotate_odd_arg.sin_val),
    .rotate_odd_rden_in            (rotate_odd_result_rden),
    .stall_rate_in                 (stall_rate_in),
    .stall_rate_valid_in           (stall_rate_valid_in),
    .rst_and_startup_done_out      (rst_and_startup_done_out),
    .forward_cos_rdy_out           (forward_cos_arg_ready),
    .forward_cos_empty_out         (forward_cos_result_empty),
    .forward_sin_rdy_out           (forward_sin_arg_ready),
    .forward_sin_empty_out         (forward_sin_result_empty),
    .read_cos_forwarded_rdy_out    (read_cos_forwarded_arg_ready),
    .read_cos_forwarded_empty_out  (read_cos_forwarded_result_empty),
    .read_cos_forwarded_result_out (_EsiWrapped_read_cos_forwarded_result_out),
    .read_sin_forwarded_rdy_out    (read_sin_forwarded_arg_ready),
    .read_sin_forwarded_empty_out  (read_sin_forwarded_result_empty),
    .read_sin_forwarded_result_out (_EsiWrapped_read_sin_forwarded_result_out),
    .prog_gamma_pre_attn_rdy_out   (prog_gamma_pre_attn_arg_ready),
    .prog_gamma_pre_attn_empty_out (prog_gamma_pre_attn_result_empty),
    .prog_gamma_pre_mlp_rdy_out    (prog_gamma_pre_mlp_arg_ready),
    .prog_gamma_pre_mlp_empty_out  (prog_gamma_pre_mlp_result_empty),
    .prog_rsqrt_lut_rdy_out        (prog_rsqrt_lut_arg_ready),
    .prog_rsqrt_lut_empty_out      (prog_rsqrt_lut_result_empty),
    .prog_sigmoid_lut_rdy_out      (prog_sigmoid_lut_arg_ready),
    .prog_sigmoid_lut_empty_out    (prog_sigmoid_lut_result_empty),
    .rmsnorm_reset_rdy_out         (rmsnorm_reset_arg_ready),
    .rmsnorm_reset_empty_out       (rmsnorm_reset_result_empty),
    .rmsnorm_get_sum_rdy_out       (rmsnorm_get_sum_arg_ready),
    .rmsnorm_get_sum_empty_out     (rmsnorm_get_sum_result_empty),
    .rmsnorm_get_sum_result_out    (_EsiWrapped_rmsnorm_get_sum_result_out),
    .rmsnorm_step_rdy_out          (rmsnorm_step_arg_ready),
    .rmsnorm_step_empty_out        (rmsnorm_step_result_empty),
    .swiglu_step_rdy_out           (swiglu_step_arg_ready),
    .swiglu_step_empty_out         (swiglu_step_result_empty),
    .swiglu_step_result_out        (_EsiWrapped_swiglu_step_result_out),
    .residual_add_step_rdy_out     (residual_add_step_arg_ready),
    .residual_add_step_empty_out   (residual_add_step_result_empty),
    .residual_add_step_result_out  (_EsiWrapped_residual_add_step_result_out),
    .rotate_even_rdy_out           (rotate_even_arg_ready),
    .rotate_even_empty_out         (rotate_even_result_empty),
    .rotate_even_result_out        (_EsiWrapped_rotate_even_result_out),
    .rotate_odd_rdy_out            (rotate_odd_arg_ready),
    .rotate_odd_empty_out          (rotate_odd_result_empty),
    .rotate_odd_result_out         (_EsiWrapped_rotate_odd_result_out),
    .stall_rate_supported_out      (stall_rate_supported_out)
  );
  // Zero width: assign forward_cos_result = /*Zero width*/;
  // Zero width: assign forward_sin_result = /*Zero width*/;
  // Zero width: assign prog_gamma_pre_attn_result = /*Zero width*/;
  // Zero width: assign prog_gamma_pre_mlp_result = /*Zero width*/;
  // Zero width: assign prog_rsqrt_lut_result = /*Zero width*/;
  // Zero width: assign prog_sigmoid_lut_result = /*Zero width*/;
  assign read_cos_forwarded_result = _EsiWrapped_read_cos_forwarded_result_out;
  assign read_sin_forwarded_result = _EsiWrapped_read_sin_forwarded_result_out;
  assign residual_add_step_result = _EsiWrapped_residual_add_step_result_out;
  assign rmsnorm_get_sum_result = _EsiWrapped_rmsnorm_get_sum_result_out;
  // Zero width: assign rmsnorm_reset_result = /*Zero width*/;
  // Zero width: assign rmsnorm_step_result = /*Zero width*/;
  assign rotate_even_result = _EsiWrapped_rotate_even_result_out;
  assign rotate_odd_result = _EsiWrapped_rotate_odd_result_out;
  assign swiglu_step_result = _EsiWrapped_swiglu_step_result_out;
endmodule


module layer_orchestrator_ContextSaverMerger65
(
    input wire [255:0] callee_data,
    output logic [255:0] output_data
);
    always_comb begin
        output_data[255:0] = callee_data[255:0];
    end
endmodule
module layer_orchestrator_ContextSaverMerger67
(
    input wire [255:0] callee_data,
    output logic [255:0] output_data
);
    always_comb begin
        output_data[255:0] = callee_data[255:0];
    end
endmodule
module layer_orchestrator_ContextSaverMerger79
(
    input wire [31:0] callee_data,
    output logic [31:0] output_data
);
    always_comb begin
        output_data[31:0] = callee_data[31:0];
    end
endmodule
module layer_orchestrator_ContextSaverMerger83
(
    input wire [15:0] callee_data,
    output logic [15:0] output_data
);
    always_comb begin
        output_data[15:0] = callee_data[15:0];
    end
endmodule
module layer_orchestrator_ContextSaverMerger85
(
    input wire [15:0] callee_data,
    output logic [15:0] output_data
);
    always_comb begin
        output_data[15:0] = callee_data[15:0];
    end
endmodule
module layer_orchestrator_ContextSaverMerger87
(
    input wire [15:0] callee_data,
    output logic [15:0] output_data
);
    always_comb begin
        output_data[15:0] = callee_data[15:0];
    end
endmodule
module layer_orchestrator_ContextSaverMerger89
(
    input wire [15:0] callee_data,
    output logic [15:0] output_data
);
    always_comb begin
        output_data[15:0] = callee_data[15:0];
    end
endmodule
