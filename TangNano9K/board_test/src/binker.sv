module board_test_Blinker (
    output var bit led1,
    output var bit led2,
    output var bit led3,
    output var bit led4,
    output var bit led5,
    output var bit led6,
    input  var bit s1  ,
    input  var bit s2  
);
    bit [6-1:0] led;
    always_comb {led6, led6, led4, led3, led2, led1} = led;
    // assign led1 = led[0];
    // assign led2 = led[1];
    // assign led3 = led[2];
    // assign led4 = led[3];
    // assign led5 = led[4];
    // assign led6 = led[5];

    logic rst; always_comb rst = s1 & s2;

    logic int_clock;
    Gowin_OSC osc (
        .oscout (int_clock //output oscout
        )
    );

    always_ff @ (posedge int_clock, negedge rst) begin
        if (!rst) begin
            led <= 1;
        end else begin
            if (led == 6'b100_000) begin
                led <= 1;
            end else begin
                led <= led << 1;
            end
        end
    end
endmodule
//# sourceMappingURL=binker.sv.map
