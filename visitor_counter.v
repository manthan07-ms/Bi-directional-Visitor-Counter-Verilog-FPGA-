module visitor_counter(clk, reset, entry, exit, seg0, seg1, seg2,slow_clock);
input clk, reset, entry, exit;
output reg [6:0] seg0, seg1, seg2;
output reg slow_clock;

reg pre_entry = 1, pre_exit = 1;

reg [9:0] count;
reg [3:0] hundreds, tens, ones;
reg [22:0]counter;

always @(posedge clk) begin
	counter = counter + 1;
	if(counter == 5000000)begin
		counter <= 0;
		slow_clock <= ~slow_clock;
	end
end
always @(posedge slow_clock or posedge reset) begin
    if (reset)
        count <= 0;
    else begin
        if ((pre_entry) && (!entry) && (count < 999)) begin
            count <= count + 1;
				pre_entry <= entry;
			end

        if ((pre_exit) && (!exit) && (count > 0))begin
            count <= count - 1;
				pre_exit <= exit;
			end
    end
end

always @(*) begin
    hundreds = count / 100;
    tens = (count % 100) / 10;
    ones = count % 10;

    case (hundreds)
        4'd0: seg2 = 7'b0000001;
        4'd1: seg2 = 7'b1001111;
        4'd2: seg2 = 7'b0010010;
        4'd3: seg2 = 7'b0000110;
        4'd4: seg2 = 7'b1001100;
        4'd5: seg2 = 7'b0100100;
        4'd6: seg2 = 7'b0100000;
        4'd7: seg2 = 7'b0001111;
        4'd8: seg2 = 7'b0000000;
        4'd9: seg2 = 7'b0000100;
    endcase

    case (tens)
        4'd0: seg1 = 7'b0000001;
        4'd1: seg1 = 7'b1001111;
        4'd2: seg1 = 7'b0010010;
        4'd3: seg1 = 7'b0000110;
        4'd4: seg1 = 7'b1001100;
        4'd5: seg1 = 7'b0100100;
        4'd6: seg1 = 7'b0100000;
        4'd7: seg1 = 7'b0001111;
        4'd8: seg1 = 7'b0000000;
        4'd9: seg1 = 7'b0000100;
    endcase

    case (ones)
        4'd0: seg0 = 7'b0000001;
        4'd1: seg0 = 7'b1001111;
        4'd2: seg0 = 7'b0010010;
        4'd3: seg0 = 7'b0000110;
        4'd4: seg0 = 7'b1001100;
        4'd5: seg0 = 7'b0100100;
        4'd6: seg0 = 7'b0100000;
        4'd7: seg0 = 7'b0001111;
        4'd8: seg0 = 7'b0000000;
        4'd9: seg0 = 7'b0000100;
    endcase 
end
endmodule


 