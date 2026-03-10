// async_fifo.sv — Parameterized dual-clock async FIFO using gray-code CDC
//
// Standard gray-code synchronizer design for clock domain crossing.
// Write and read pointers are maintained as binary counters with an extra
// MSB for wrap detection, converted to gray code before synchronization
// across clock domains via 2-FF synchronizer chains.
//
// Full condition:  wr_gray matches rd_gray_sync with top 2 bits inverted.
// Empty condition: rd_gray matches wr_gray_sync exactly.
//
// Parameters:
//   DATA_WIDTH — payload width in bits (default 16)
//   DEPTH      — number of entries, must be a power of 2 (default 4)

`default_nettype none

module async_fifo #(
    parameter int DATA_WIDTH = 16,
    parameter int DEPTH      = 4
) (
    // Write side
    input  logic                  wr_clk,
    input  logic                  wr_rst_n,
    input  logic                  wr_en,
    input  logic [DATA_WIDTH-1:0] wr_data,
    output logic                  wr_full,

    // Read side
    input  logic                  rd_clk,
    input  logic                  rd_rst_n,
    input  logic                  rd_en,
    output logic [DATA_WIDTH-1:0] rd_data,
    output logic                  rd_empty
);

    localparam int ADDR_WIDTH = $clog2(DEPTH);
    localparam int PTR_WIDTH  = ADDR_WIDTH + 1;  // extra MSB for wrap detection

    // -----------------------------------------------------------------------
    // Dual-port RAM
    // -----------------------------------------------------------------------
    logic [DATA_WIDTH-1:0] mem [0:DEPTH-1];

    // -----------------------------------------------------------------------
    // Write-domain signals
    // -----------------------------------------------------------------------
    logic [PTR_WIDTH-1:0] wr_bin;       // binary write pointer
    logic [PTR_WIDTH-1:0] wr_gray;      // gray-coded write pointer
    logic [ADDR_WIDTH-1:0] wr_addr;

    // Synchronized read gray pointer (into write clock domain)
    logic [PTR_WIDTH-1:0] rd_gray_sync0_wr;
    logic [PTR_WIDTH-1:0] rd_gray_sync1_wr;

    // -----------------------------------------------------------------------
    // Read-domain signals
    // -----------------------------------------------------------------------
    logic [PTR_WIDTH-1:0] rd_bin;       // binary read pointer
    logic [PTR_WIDTH-1:0] rd_gray;      // gray-coded read pointer
    logic [ADDR_WIDTH-1:0] rd_addr;

    // Synchronized write gray pointer (into read clock domain)
    logic [PTR_WIDTH-1:0] wr_gray_sync0_rd;
    logic [PTR_WIDTH-1:0] wr_gray_sync1_rd;

    // -----------------------------------------------------------------------
    // Gray-code conversion function
    // -----------------------------------------------------------------------
    function automatic logic [PTR_WIDTH-1:0] bin2gray (
        input logic [PTR_WIDTH-1:0] bin
    );
        return bin ^ (bin >> 1);
    endfunction

    // -----------------------------------------------------------------------
    // Write side — pointer update and RAM write
    // -----------------------------------------------------------------------
    always_ff @(posedge wr_clk or negedge wr_rst_n) begin
        if (!wr_rst_n) begin
            wr_bin <= '0;
        end else if (wr_en && !wr_full) begin
            wr_bin <= wr_bin + 1'b1;
        end
    end

    always_comb begin
        wr_gray = bin2gray(wr_bin);
        wr_addr = wr_bin[ADDR_WIDTH-1:0];
    end

    always_ff @(posedge wr_clk) begin
        if (wr_en && !wr_full) begin
            mem[wr_addr] <= wr_data;
        end
    end

    // -----------------------------------------------------------------------
    // 2-FF synchronizer: rd_gray into write clock domain
    // -----------------------------------------------------------------------
    always_ff @(posedge wr_clk or negedge wr_rst_n) begin
        if (!wr_rst_n) begin
            rd_gray_sync0_wr <= '0;
            rd_gray_sync1_wr <= '0;
        end else begin
            rd_gray_sync0_wr <= rd_gray;
            rd_gray_sync1_wr <= rd_gray_sync0_wr;
        end
    end

    // Full: gray pointers match with top 2 bits of write pointer inverted
    always_comb begin
        wr_full = (wr_gray == {~rd_gray_sync1_wr[PTR_WIDTH-1:PTR_WIDTH-2],
                                rd_gray_sync1_wr[PTR_WIDTH-3:0]});
    end

    // -----------------------------------------------------------------------
    // Read side — pointer update and RAM read
    // -----------------------------------------------------------------------
    always_ff @(posedge rd_clk or negedge rd_rst_n) begin
        if (!rd_rst_n) begin
            rd_bin <= '0;
        end else if (rd_en && !rd_empty) begin
            rd_bin <= rd_bin + 1'b1;
        end
    end

    always_comb begin
        rd_gray = bin2gray(rd_bin);
        rd_addr = rd_bin[ADDR_WIDTH-1:0];
        rd_data = mem[rd_addr];
    end

    // -----------------------------------------------------------------------
    // 2-FF synchronizer: wr_gray into read clock domain
    // -----------------------------------------------------------------------
    always_ff @(posedge rd_clk or negedge rd_rst_n) begin
        if (!rd_rst_n) begin
            wr_gray_sync0_rd <= '0;
            wr_gray_sync1_rd <= '0;
        end else begin
            wr_gray_sync0_rd <= wr_gray;
            wr_gray_sync1_rd <= wr_gray_sync0_rd;
        end
    end

    // Empty: gray pointers are equal
    always_comb begin
        rd_empty = (rd_gray == wr_gray_sync1_rd);
    end

endmodule

`default_nettype wire
