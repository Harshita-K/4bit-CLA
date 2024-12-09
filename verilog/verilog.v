module dff(input clk, input [3:0] D, output reg [3:0] Q);
    always @(posedge clk) begin
        Q <= D;
    end
endmodule

module dff1b(input clk, input D, output reg Q);
    always @(posedge clk) begin
        Q <= D;
    end
endmodule

module pcg(input p , input c , input g , output out);
    wire k,l;
    and u1(k,p,c);
    nor u2(l,k,g);
    not u3(out,l);
endmodule

module combine (
    input clk,
    input [3:0] a, // 4-bit input vector for a0, a1, a2, a3
    input [3:0] b, // 4-bit input vector for b0, b1, b2, b3
    input c0,      // Single-bit carry-in
    output [3:0] s, // 4-bit sum output vector
    output cout      // Single-bit carry-out
);
    wire [3:0] aa;
    wire [3:0] bb;
    wire [3:0] s0;
    wire cin,cc;

    dff A1 ( .clk(clk) , .D(a)  , .Q(aa));
    dff B1 ( .clk(clk) , .D(b)  , .Q(bb));
    dff1b C( .clk(clk) , .D(c0) , .Q(cin));
    adder2 add( .a(aa) , .b(bb) , .c0(cin) , .s(s0) , .cout(cc) );
    dff S1 ( .clk(clk) , .D(s0)  , .Q(s));
    dff1b C1( .clk(clk) , .D(cc) , .Q(cout));

endmodule

module adder2 (
    input [3:0] a, // 4-bit input vector for a0, a1, a2, a3
    input [3:0] b, // 4-bit input vector for b0, b1, b2, b3
    input c0,      // Single-bit carry-in
    output [3:0] s, // 4-bit sum output vector
    output cout      // Single-bit carry-out
);
    wire [3:0] p; // Propagate signals
    wire [3:0] g; // Generate signals
    wire [3:0] c; // Carry signals
    wire [3:0] h; // Intermediate wires for NAND logic
    wire [3:0] k; // Intermediate wires for AND logic
    wire [3:0] j; // Intermediate wires for OR logic

    assign c[0] = c0; // Initial carry-in

    // Bit 0 Logic
    xor u1(p[0], a[0], b[0]);
    xor u2(s[0], p[0], c[0]);
    nand u11(h[0], p[0], c[0]);
    nand u12(h[1], a[0], b[0]);
    nand u13(c[1], h[0], h[1]);

    // Bit 1 Logic
    xor u3(p[1], a[1], b[1]);
    xor u4(s[1], p[1], c[1]);
    and u21(g[1], a[1], b[1]);
    pcg u22(.out(c[2]), .p(p[1]), .c(c[1]), .g(g[1]));

    // Bit 2 Logic
    xor u5(p[2], a[2], b[2]);
    xor u6(s[2], p[2], c[2]);
    and u31(g[2], a[2], b[2]);
    and u32(k[1], p[1], p[2], c[1]);
    pcg u33(.out(k[2]), .p(p[2]), .c(g[1]), .g(g[2]));
    or  u34(c[3], k[1], k[2]);

    // Bit 3 Logic
    xor u7(p[3], a[3], b[3]);
    xor u8(s[3], p[3], c[3]);
    and u41(g[3], a[3], b[3]);
    pcg u42(.out(j[1]), .p(p[3]), .c(g[2]), .g(g[3]));
    and u43(j[2], p[1], p[2], p[3], c[1]);
    and u44(j[3], p[2], p[3], g[1]);
    or  u45(cout, j[1], j[2], j[3]);

endmodule

module dff_tb;
    reg clk; reg [3:0] d; wire [3:0] q;
    dff uut( .clk(clk), .D(d), .Q(q) );
    initial begin
        $dumpfile("dff2.vcd");
        $dumpvars(0, dff_tb);
        $monitor($time," D = %b, clk = %b, Q = %b", d, clk, q);
        clk = 0;
        d = 4'b0101;
        #10;
        d = 4'b0010;
        #10
        $finish;
    end
    always #3 clk = ~clk;
endmodule

module adder2_tb;
    reg [3:0] a, b;
    wire [3:0] s;
    wire cout;

    adder2 uut(
        .a(a), .b(b), .c0(1'b0), .s(s), .cout(cout)
    );

    initial begin
        $dumpfile("adder.vcd");
        $dumpvars(0, adder2_tb);
        $monitor($time, " a = %b, b = %b, s = %b, cout = %b", a, b, s, cout);

        a = 4'b1111;
        b = 4'b1111;
        #10;

        a = 4'b1001;
        b = 4'b1010;
        #20

        $finish;
    end
endmodule

module combine_tb;
    reg clk;
    reg [3:0] a, b;
    wire [3:0] s;
    wire cout;

    combine uut(
        .clk(clk), .a(a), .b(b), .c0(1'b0), .s(s), .cout(cout)
    );

    initial begin
        $dumpfile("combine.vcd");
        $dumpvars(0, combine_tb);
        $monitor($time, " a = %b, b = %b, s = %b, cout = %b", a, b, s, cout);
        clk = 0;
        a = 4'b0001;
        b = 4'b0010;
        #5;

        a = 4'b1101;
        b = 4'b1010;
        #5

        a = 4'b1011;
        b = 4'b1001;
        #5

        $finish;
    end
    always #2 clk = ~clk;
endmodule
