// hal_sparse_ram.sv — Drop-in replacement for KanagawaHALDualPortRAM
// Uses SV associative arrays (sparse) instead of flat arrays.
// Only written entries consume memory — enables simulation of modules
// with huge address spaces (embed_rom: 4M, lm_head: 525M entries).

`ifndef SIMULATION
    `error "This file is only supported in simulation"
`endif

/* verilator lint_off DECLFILENAME */
module KanagawaHALDualPortRAM
#(
    parameter DATA_WIDTH = 32,
    parameter ADDR_WIDTH = 6,
    parameter DEPTH = 2**ADDR_WIDTH,
    parameter USE_OUTPUT_REG = 0,
    parameter INITIAL_DATA_FILE = "UNUSED",
    parameter TRUE_DUAL_PORT = 0,
    parameter USE_HARDENED_BYPASS = 0,
/* verilator lint_off UNUSEDPARAM */
    parameter MAX_DEPTH = 0,
    parameter DEVICE_FAMILY = "mock",
    parameter USE_LUTRAM = 0,
    parameter USE_BRAM = 0,
    parameter SUPPORTS_RW_COLLISIONS = 0,
    parameter RW_COLLISIONS_IMPOSSIBLE = 0,
    parameter ECC
/* verilator lint_on UNUSEDPARAM */
)
(
    input wire clk,

    input wire [1:0][ADDR_WIDTH-1:0] addr_in,

    // writes
    input wire [1:0] wren_in,
    input wire [1:0][DATA_WIDTH-1:0] data_in,
    input wire inject_correctable_error_in,
    input wire inject_uncorrectable_error_in,

    // reads
    input wire [1:0] rden_in,
    output logic [1:0][DATA_WIDTH-1:0] data_out,
    output logic error_detected_out,
    output logic data_valid_out
);

    typedef logic [DATA_WIDTH-1:0] data_t;
    typedef logic [ADDR_WIDTH-1:0] addr_t;

    // Sparse storage — only written entries consume memory
    data_t mem [addr_t];

    logic [1:0][DATA_WIDTH-1:0] internal_rddata;

    initial begin
        if (USE_HARDENED_BYPASS != 0) begin
            $error("%m: Hardened bypass not supported in sparse HAL module");
        end
    end

    // Writes
    always @(posedge clk) begin
        if (wren_in[0]) begin
            mem[addr_in[0]] <= data_in[0];
        end
        else if ((TRUE_DUAL_PORT != 0) && wren_in[1]) begin
            mem[addr_in[1]] <= data_in[1];
        end
    end

    // Reads — return 0 for unwritten addresses
    always_ff @(posedge clk) begin
        if (rden_in[1]) begin
            if (mem.exists(addr_in[1]))
                internal_rddata[1] <= mem[addr_in[1]];
            else
                internal_rddata[1] <= '0;
        end
        if ((TRUE_DUAL_PORT != 0) && rden_in[0]) begin
            if (mem.exists(addr_in[0]))
                internal_rddata[0] <= mem[addr_in[0]];
            else
                internal_rddata[0] <= '0;
        end
    end

    generate
        if (USE_OUTPUT_REG) begin : gen_use_output_reg
            always_ff @(posedge clk) begin
                data_out <= internal_rddata;
                error_detected_out <= 1'b0;
                data_valid_out <= 1'b1;
            end
        end
        else begin : gen_no_output_reg
            always_comb begin
                data_out = internal_rddata;
                error_detected_out = 1'b0;
                data_valid_out = 1'b1;
            end
        end
    endgenerate

endmodule
/* verilator lint_on DECLFILENAME */
