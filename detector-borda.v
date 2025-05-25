module detector_borda (
    input clk,
    input rst,
    input [1:0] entrada,
    output reg [1:0] detector
);
    reg [1:0] entrada_reg; 

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            entrada_reg <= 2'b00;
            detector <= 2'b00;
        end else begin
            entrada_reg <= entrada;
            detector <= entrada & ~entrada_reg;
        end
    end

endmodule
