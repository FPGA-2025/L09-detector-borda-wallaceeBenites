module tb();

    reg clk;
    reg rst;
    reg [1:0] entrada;
    wire [1:0] detector;


    reg [1:0] dados_arquivo [0:4];


    detector_borda d(
        .clk(clk),
        .rst(rst),
        .entrada(entrada),
        .detector(detector)
    );

    integer i;

    always #1 clk = (clk===1'b0);

    initial begin
        $readmemb("teste.txt", dados_arquivo); // le o arquivo de entrada e guarda em dados_arquivo

        $dumpfile("saida.vcd"); // gera um arquivo .vcd para visualização no gtkwave
        $dumpvars(0, tb); // salva as variáveis do módulo tb_hamming

        // $monitor("entrada=%b, h15=%b, n=%b, injeta_erro=%b, alterado=%b, saida=%b", entrada, h15, n, injeta_erro, alterado, saida);
        $monitor("entrada[0]=%b, detector[0]=%b, entrada[1]=%b, detector[1]=%b", entrada[0], detector[0], entrada[1], detector[1]);

        rst = 1'b1;
        #2;
        rst = 1'b0;
        for (i = 0; i < 5; i = i + 1) begin
            entrada = dados_arquivo[i][1:0];
            #2;
        end
        #2
        $finish;
    end

endmodule