.include TSMC_180nm.txt
.param SUPPLY=1.8
.param LAMBDA=0.09u
.global gnd vdd
.param width_P=2*width_N
.param width_N=3*LAMBDA ;3LAMBDA gives 87pico

Vdd	vdd	gnd	'SUPPLY'
;MN and MP defined as ( drain , gate ,source , body )
; y is output, x is input, vdd is power supply, gnd is ground

VX1 clk gnd pulse 0 1.8 0ns 100ps 100ps 5ns 10ns
VX2 D gnd pulse 0 1.8 10.018ns 100ps 100ps 10ns 20ns
* SPICE3 file created from dff1.ext - technology: scmos

.option scale=90n

M1000 C clk G Gnd CMOSN w=6 l=2
+  ad=36p pd=24u as=29.999998p ps=22u
M1001 G B gnd Gnd CMOSN w=6 l=2
+  ad=36p pd=24u as=29.999998p ps=22u
M1002 B A E Gnd CMOSN w=6 l=2
+  ad=36p pd=24u as=29.999998p ps=22u
M1003 vdd D F vdd CMOSP w=12 l=2
+  ad=59.999996p pd=34u as=59.999996p ps=34u
M1004 E clk gnd Gnd CMOSN w=6 l=2
+  ad=36p pd=24u as=29.999998p ps=22u
M1005 F clk A vdd CMOSP w=12 l=2
+  ad=59.999996p pd=34u as=59.999996p ps=34u
M1006 vdd B C vdd CMOSP w=6 l=2
+  ad=29.999998p pd=22u as=29.999998p ps=22u
M1007 A D gnd Gnd CMOSN w=3 l=2
+  ad=19p pd=18u as=19p ps=18u
M1008 Q C vdd vdd CMOSP w=6 l=2
+  ad=29.999998p pd=22u as=29.999998p ps=22u
M1009 vdd clk B vdd CMOSP w=6 l=2
+  ad=29.999998p pd=22u as=29.999998p ps=22u
M1010 Q C gnd Gnd CMOSN w=3 l=2
+  ad=19p pd=18u as=19p ps=18u
C0 gnd D 0.028273f
C1 Q gnd 0.030928f
C2 F A 0.041238f
C3 vdd A 0.011011f
C4 C gnd 0.041884f
C5 vdd B 0.110159f
C6 C Q 0.062171f
C7 gnd G 0.03299f
C8 B E 0.024743f
C9 vdd D 0.08284f
C10 C G 0.024743f
C11 vdd Q 0.110448f
C12 C vdd 0.103144f
C13 gnd E 0.03299f
C14 A D 0.019725f
C15 F clk 0.017673f
C16 A gnd 0.041238f
C17 vdd clk 0.083552f
C18 vdd F 0.049206f
C19 clk 0 0.490504f 
C20 D 0 0.2767f 
C21 E 0 0.056386f 
C22 G 0 0.056386f 
C23 gnd 0 0.938691f 
C24 A 0 0.360696f 
C25 F 0 0.024877f 
C26 Q 0 0.097838f 
C27 B 0 0.707796f 
C28 vdd 0 5.55324f 
C29 C 0 0.444956f 


.ic v(Q) = 1.8
.tran 1e-3n 80n 0n
.measure tran tpd_rise
+ TRIG v(clk) VAL='SUPPLY/2' RISE=2
+ TARG v(Q) VAL='SUPPLY/2' RISE=1
.measure tran tpd_fall
+ TRIG v(clk) VAL='SUPPLY/2' RISE=1
+ TARG v(Q) VAL='SUPPLY/2' FALL=1
.measure tran total_prop_delay param='(tpd_rise+tpd_fall)/2'
.control

run
set hcopypscolor = 1 *White background for saving plots
set color0=white ** color0 is used to set the background of the plot (manual sec:17.7))
set color1=black ** color1 is used to set the grid color of the plot (manual sec:17.7))
set curplottitle= harshita_2023102073

plot v(D)+2 v(clk) v(Q)+4
.endc
