module control(clk, reset, start, found, up, en1, en2);
input logic clk;
input logic reset;
input logic start;
input logic found;

output logic up;
output logic en1;
output logic en2;

typedef enum logic [1:0] {idle, upcount, store, foundkey} statetype;
statetype state, nextstate;

always_ff @(posedge clk, posedge reset)
    if(reset) state <= idle;
    else state <= nextstate;

always_comb 
    case(state)
        idle: begin
            up <= 1'b0;
            en1 <= 1'b0;
            en2 <= 1'b0;

            if(start) nextstate <= upcount;
            else nextstate <= idle;
        end

        upcount: begin
            up <= 1'b1;
            en1 <= 1'b0;
            en2 <= 1'b0;

            nextstate <= store;
        end

        store: begin
            up <= 1'b0;
            en1 <= 1'b1;
            en2 <= 1'b0;

            if(found) nextstate <= foundkey;
            else nextstate <= upcount;
        end

        foundkey: begin
            up <= 1'b0;
            en1 <= 1'b0;
            en2 <= 1'b1;

            if(!start) nextstate <= idle;
        end

        default: begin
            up <= 1'b0;
            en1 <= 1'b0;
            en2 <= 1'b0;

            nextstate <= idle;
        end
    endcase


endmodule


