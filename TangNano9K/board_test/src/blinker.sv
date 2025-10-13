module board_test_Blinker (
    output var bit led1     ,
    output var bit led2     ,
    output var bit led3     ,
    output var bit led4     ,
    output var bit led5     ,
    output var bit led6     ,
    input  var bit s1       ,
    input  var bit s2       ,
    output var bit clock_out
);
    bit [6-1:0] led;
    // !led is not bitwise NOT.
    always_comb {led6, led5, led4, led3, led2, led1} = ~led;
    // assign led1 = led[0];
    // assign led2 = led[1];
    // assign led3 = led[2];
    // assign led4 = led[3];
    // assign led5 = led[4];
    // assign led6 = led[5];

    logic rst; always_comb rst = s1 & s2;

    logic int_clock;
    // 2.62MHz at FREQ_DIV = 100
    // Max. freq. will be 131MHz with FREQ_DIV = 2
    Gowin_OSC osc (
        .oscout (int_clock //output oscout
        )
    );
    always_comb clock_out = int_clock;

    int unsigned counter;
    always_ff @ (posedge int_clock, negedge rst) begin
        if (!rst) begin
            led     <= 0;
            counter <= 0;
        end else begin
            if (counter > 16'hffff) begin
                counter <= 0;

                led <= led + (1);
                // if led >: 6'b100_000 {
                //     led = !1;
                // } else {
                //     led += 1;
                // }
            end else begin
                counter <= counter + (1);
            end
        end
    end
endmodule
//# sourceMappingURL=blinker.sv.map
