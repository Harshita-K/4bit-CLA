.include TSMC_180nm.txt
.param SUPPLY=1.8
.param LAMBDA=0.09u
.global gnd vdd
.param width_P=2*width_N
.param width_N=3*LAMBDA

Vdd	vdd	gnd	'SUPPLY'
VX1 p1 gnd 1.8
VX2 c1 gnd pulse 0 1.8 0ns 100ps 100ps 10ns 20ns
VX4 p3 gnd pulse 0 1.8 0ns 100ps 100ps 15ns 30ns
VX11 c3 gnd pulse 0 1.8 0ns 100ps 100ps 10ns 20ns
VX21 p2 gnd 0
VX31 c2 gnd pulse 0 1.8 0ns 100ps 100ps 10ns 20ns
VX41 p0 gnd pulse 0 1.8 0ns 100ps 100ps 10ns 20ns
VX0 c0 gnd 1.8

.subckt inv y x vdd gnd
M1      y       x       gnd     gnd  CMOSN   W={width_N}   L={2*LAMBDA}
+ AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
M2      y       x       vdd     vdd  CMOSP   W={width_P}   L={2*LAMBDA}
+ AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}
.ends inv

.subckt xor outf in1 in2
.param width_N={6*LAMBDA}
X1 in1n in1 vdd gnd inv
X2 in2n in2 vdd gnd inv
M3      out      in1    in2     gnd   CMOSN   W={width_N}   L={LAMBDA}
+ AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
M4      out      in1n     in2n    gnd    CMOSN   W={width_N}   L={LAMBDA}
+ AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
X3 outf out vdd gnd inv
.ends

X2   s0  p0  c0  xor
X7   s1  p1  c1  xor
X11  s2  p2  c2  xor
X18  s3  p3  c3  xor

.tran 1n 80n 0n
.measure tran tpd_rise
+ TRIG v(b0) VAL='SUPPLY/2' RISE=1
+ TARG v(s3) VAL='SUPPLY/2' FALL=1
.measure tran tpd_fall
+ TRIG v(b0) VAL='SUPPLY/2' FALL=1
+ TARG v(s3) VAL='SUPPLY/2' RISE=1
.measure tran total_prop_delay param='(tpd_rise+tpd_fall)/2'
.control

run
set hcopypscolor = 1 *White background for saving plots
set color0=white ** color0 is used to set the background of the plot (manual sec:17.7))
set color1=black ** color1 is used to set the grid color of the plot (manual sec:17.7))
set curplottitle= harshita_2023102073

plot v(c0) v(p0)+2 v(s0)-2
plot v(p1)+2 v(c1) v(s1)-2
plot v(p2)+2 v(c2) v(s2)-2
plot v(p3)+2 v(c3) v(s3)-2

;plot v(c)

.endc
