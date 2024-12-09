.include TSMC_180nm.txt
.param SUPPLY=1.8
.param LAMBDA=0.09u
.global gnd vdd
.param width_P=2*width_N
.param width_N=3*LAMBDA

Vdd	vdd	gnd	'SUPPLY'
VX1 aa0 gnd 1.8
VX2 aa1 gnd 1.8
VX3 aa2 gnd 0
VX4 aa3 gnd 1.8
VX11 bb0 gnd 0
VX21 bb1 gnd 0
VX31 bb2 gnd 0
VX41 bb3 gnd 1.8
VX0 cc0 gnd 0
VC clk gnd pulse 0 1.8 2ns 100ps 100ps 20ns 40ns

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

.subckt dff Q D clk 
.param width_P={6*LAMBDA}
.param width_N={3*LAMBDA}
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
.ends dff

XD1 a0 aa0 clk dff
XD2 a1 aa1 clk dff
XD3 a2 aa2 clk dff
XD4 a3 aa3 clk dff
XD5 b0 bb0 clk dff
XD6 b1 bb1 clk dff
XD7 b2 bb2 clk dff
XD8 b3 bb3 clk dff
XD9 c0 cc0 clk dff
XD10 ss0 s0 clk dff
XD11 ss1 s1 clk dff
XD12 ss2 s2 clk dff
XD13 ss3 s3 clk dff
XD14 cc4 c4 clk dff

X1  p0  a0  b0  xor
X2  s0  p0  c0  xor
X3  h1  c0  p0  cmosnand
X4  h2  a0  b0  cmosnand
X5  c1  h1  h2  cmosnand 

X6  p1  a1  b1  xor
X0  s1  p1  c1  xor
X7  g1n a1  b1  cmosnand
X8  g1  g1n vdd gnd inv
X9  c2  p1  c1  g1  andor2  

X10  p2  a2  b2  xor
X11  s2  p2  c2  xor
X12  g2n a2  b2  cmosnand
X13  g2  g2n vdd gnd inv

X14  k1  p1 p2 c1 3and
X15  k2  p2 g1 g2 andor2
X16  c3  k1 k2    2or

X17  p3  a3  b3  xor
X18  s3  p3  c3  xor
X19  g3n a3  b3  cmosnand
X20  g3  g3n vdd gnd inv

X21  j1  p3  g2  g3  andor2
X22  j2  p3  p2  g1  3and
X23  j3  p3  p2  p1  c1  4and
X24  j4  j1  j2  2or
X25  c4  j3  j4  2or

.ic v(ss0) = 0
.ic v(cc4) = 0
.ic v(s0) = 0
.ic v(s1) = 0
.ic v(s2) = 0
.ic v(s3) = 0
.ic v(a0) = 0
.ic v(a1) = 0
.ic v(a2) = 0
.ic v(a3) = 0
.ic v(b0) = 0
.ic v(b1) = 0
.ic v(b2) = 0
.ic v(b3) = 0

.tran 1n 160n 0n
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

plot v(clk) -2 v(a0) v(aa0) +2 v(s0) +4 v(ss0) +6
plot v(clk) -2 v(a1) v(aa1) +2 v(s1) +4 v(ss1) +6
plot v(clk) -2 v(a2) v(aa2) +2 v(s2) +4 v(ss2) +6
plot v(clk) -2 v(a3) v(aa3) +2 v(s3) +4 v(ss3) +6
plot v(clk) -2 v(c4) v(cc4) +2 
plot v(c1) -2 v(c2) v(c3) +2 
;plot v(c)

.endc
