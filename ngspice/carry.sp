.include TSMC_180nm.txt
.param SUPPLY=1.8
.param LAMBDA=0.09u
.global gnd vdd
.param width_P=2*width_N
.param width_N=3*LAMBDA

Vdd	vdd	gnd	'SUPPLY'
VX1 a0 gnd 1.8
VX2 p1 gnd pulse 0 1.8 0ns 100ps 100ps 10ns 20ns
VX3 p2 gnd 0
VX4 p3 gnd pulse 0 1.8 0ns 100ps 100ps 15ns 30ns
VX11 b0 gnd pulse 0 1.8 0ns 100ps 100ps 10ns 20ns
VX21 g1 gnd pulse 0 1.8 0ns 100ps 100ps 15ns 30ns
VX31 g2 gnd pulse 0 1.8 0ns 100ps 100ps 5ns 10ns
VX41 g3 gnd 0
VX0 c0 gnd 0

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

.subckt cmosnand out in1 in2
.param width_P={6*LAMBDA}
.param width_N={6*LAMBDA}
M1      out      in2     vdd     vdd  CMOSP   W={width_P}   L={LAMBDA}
+ AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}
M2      out      in1     vdd     vdd  CMOSP   W={width_P}   L={LAMBDA}
+ AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}
M3      out      in1     n       gnd   CMOSN   W={width_N}   L={LAMBDA}
+ AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
M4      n        in2     gnd     gnd   CMOSN   W={width_N}   L={LAMBDA}
+ AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
.ends 

.subckt andor2 outf p c g
.param width_P={12*LAMBDA}
.param width_N={6*LAMBDA}
M1      out      p     n      n     CMOSP   W={width_P}   L={LAMBDA}
+ AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}
M2      out     c     n     n      CMOSP   W={width_P}   L={LAMBDA}
+ AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}
M3      n      g     vdd     vdd  CMOSP   W={width_P}   L={LAMBDA}
+ AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}
M4      out      p     m     m    CMOSN   W={width_N}   L={LAMBDA}
+ AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
M5     m      c     gnd   gnd    CMOSN   W={width_N}   L={LAMBDA}
+ AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
M6      out       g     gnd       gnd   CMOSN   W={width_N}   L={LAMBDA}
+ AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
X1 outf out vdd gnd inv
.ends

.subckt 3and outf in1 in2 in3
.param width_P={12*LAMBDA}
.param width_N={9*LAMBDA}
M1      out      in1    vdd     vdd    CMOSP   W={width_P}   L={LAMBDA}
+ AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}
M2      out     in2    vdd     vdd    CMOSP   W={width_P}   L={LAMBDA}
+ AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}
M3      out      in3    vdd     vdd    CMOSP   W={width_P}   L={LAMBDA}
+ AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}
M4      out      in1     m     m    CMOSN   W={width_N}   L={LAMBDA}
+ AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
M5     m      in2     n       n       CMOSN   W={width_N}   L={LAMBDA}
+ AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
M6      n      in3     gnd       gnd   CMOSN   W={width_N}   L={LAMBDA}
+ AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
X1 outf out vdd gnd inv
.ends

.subckt 4and outf in1 in2 in3 in4
.param width_P={12*LAMBDA}
.param width_N={9*LAMBDA}
M1      out      in1    vdd     vdd    CMOSP   W={width_P}   L={LAMBDA}
+ AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}
M2      out     in2    vdd     vdd    CMOSP   W={width_P}   L={LAMBDA}
+ AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}
M3      out      in3    vdd     vdd    CMOSP   W={width_P}   L={LAMBDA}
+ AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}
M7      out      in4    vdd     vdd    CMOSP   W={width_P}   L={LAMBDA}
+ AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}
M8      out      in4     p     p      CMOSN   W={width_N}   L={LAMBDA}
+ AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
M4      p      in1     m     m    CMOSN   W={width_N}   L={LAMBDA}
+ AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
M5     m      in2     n       n       CMOSN   W={width_N}   L={LAMBDA}
+ AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
M6      n      in3     gnd       gnd   CMOSN   W={width_N}   L={LAMBDA}
+ AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
X1 outf out vdd gnd inv
.ends

.subckt 2or outf in1 in2
.param width_P={12*LAMBDA}
.param width_N={6*LAMBDA}
M1      n      in1    vdd     vdd    CMOSP   W={width_P}   L={LAMBDA}
+ AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}
M2      out     in2    n     n      CMOSP   W={width_P}   L={LAMBDA}
+ AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}
M5     out      in2     gnd       gnd     CMOSN   W={width_N}   L={LAMBDA}
+ AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
M6      out      in1     gnd       gnd   CMOSN   W={width_N}   L={LAMBDA}
+ AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
X1 outf out vdd gnd inv
.ends

X1  p0  a0  b0  xor
X3  h1  c0  p0  cmosnand
X4  h2  a0  b0  cmosnand
X5  c1  h1  h2  cmosnand 

X9  c2  p1  c1  g1  andor2  

X14  k1  p1 p2 c1 3and
X15  k2  p2 g1 g2 andor2
X16  c3  k1 k2    2or

X21  j1  p3  g2  g3  andor2
X22  j2  p3  p2  g1  3and
X23  j3  p3  p2  p1  c1  4and
X24  j4  j1  j2  2or
X25  c4  j3  j4  2or

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

plot v(b0)-2 v(a0)-2 v(p0) v(c1)+2
plot v(c1)-2 v(g1) v(p1)+2 v(c2)+4
plot v(c2)-2 v(p2) v(g2)+2 p(c3)+4
plot v(c4)-2 v(c3) v(g3)+2 v(p3)+4

;plot v(c)

.endc
