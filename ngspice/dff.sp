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
VX2 D gnd pulse 0 1.8 10.014ns 100ps 100ps 10ns 20ns

.subckt inv y x vdd gnd
.param width_P={6*LAMBDA}
.param width_N={3*LAMBDA}
MN y x gnd gnd CMOSN W={width_N} L={2*LAMBDA} AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
MP y x vdd vdd CMOSP W={width_P} L={2*LAMBDA} AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}
.ends inv 

M1      A       D       vdd     vdd  CMOSP   W={2*width_P}   L={2*LAMBDA}
+ AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}
M2      B       clk       A    A    CMOSP   W={2*width_P}   L={2*LAMBDA}
+ AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}
M3      B       D       gnd     gnd  CMOSN   W={width_N}   L={2*LAMBDA}
+ AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

M4      E       clk       vdd     vdd  CMOSP   W={width_P}   L={2*LAMBDA}
+ AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}
M5      E       B       C     C    CMOSN   W={2*width_N}   L={2*LAMBDA}
+ AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
M6      C      clk       gnd     gnd  CMOSN   W={2*width_N}   L={2*LAMBDA}
+ AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

M7      F       E       vdd     vdd  CMOSP   W={width_P}   L={2*LAMBDA}
+ AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}
M8      F       clk       G     G    CMOSN   W={2*width_N}   L={2*LAMBDA}
+ AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
M9      G       E       gnd     gnd  CMOSN   W={2*width_N}   L={2*LAMBDA}
+ AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

M10      Q       F       vdd     vdd  CMOSP   W={width_P}   L={2*LAMBDA}
+ AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}
M11      Q       F       gnd     gnd  CMOSN   W={width_N}   L={2*LAMBDA}
+ AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}


.ic v(Q) = 1.8
.tran 1e-3n 40n 0n
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
