.include TSMC_180nm.txt
.param SUPPLY=1.8
.param LAMBDA=0.09u
.global gnd vdd
.param width_P=2*width_N
.param width_N=3*LAMBDA

Vdd	vdd	gnd	'SUPPLY'
VX1 a0 gnd 1.8
VX2 a1 gnd pulse 0 1.8 0ns 100ps 100ps 10ns 20ns
VX3 a2 gnd 0
VX4 a3 gnd pulse 0 1.8 0ns 100ps 100ps 5ns 10ns
VX11 b0 gnd pulse 0 1.8 0ns 100ps 100ps 10ns 20ns
VX21 b1 gnd pulse 0 1.8 0ns 100ps 100ps 5ns 10ns
VX31 b2 gnd pulse 0 1.8 0ns 100ps 100ps 5ns 10ns
VX41 b3 gnd 0
VX0 c0 gnd pulse 0 1.8 0ns 100ps 100ps 15ns 30ns

* SPICE3 file created from prop_gen.ext - technology: scmos

.option scale=90n

M1000 gnd A0 K0 Gnd CMOSN w=6 l=2
+  ad=29.999998p pd=22u as=29.999998p ps=22u
M1001 G1 M2 vdd vdd CMOSP w=6 l=2
+  ad=29.999998p pd=22u as=29.999998p ps=22u
M1002 P2 X2 vdd vdd CMOSP w=6 l=2
+  ad=29.999998p pd=22u as=29.999998p ps=22u
M1003 B2N1 B2 gnd Gnd CMOSN w=3 l=2
+  ad=19p pd=18u as=19p ps=18u
M1004 G3 M4 gnd Gnd CMOSN w=3 l=2
+  ad=19p pd=18u as=19p ps=18u
M1005 G1 M2 gnd Gnd CMOSN w=3 l=2
+  ad=19p pd=18u as=19p ps=18u
M1006 A0N1 A0 vdd vdd CMOSP w=6 l=2
+  ad=29.999998p pd=22u as=29.999998p ps=22u
M1007 M3 B2 K3 Gnd CMOSN w=6 l=2
+  ad=29.999998p pd=22u as=29.999998p ps=22u
M1008 A1N1 A1 vdd vdd CMOSP w=6 l=2
+  ad=29.999998p pd=22u as=29.999998p ps=22u
M1009 B1N1 B1 gnd Gnd CMOSN w=3 l=2
+  ad=19p pd=18u as=19p ps=18u
M1010 gnd A3 K4 Gnd CMOSN w=6 l=2
+  ad=29.999998p pd=22u as=29.999998p ps=22u
M1011 A3N1 A3 gnd Gnd CMOSN w=3 l=2
+  ad=19p pd=18u as=19p ps=18u
M1012 P0 X0 vdd vdd CMOSP w=6 l=2
+  ad=29.999998p pd=22u as=29.999998p ps=22u
M1013 B0N1 B0 vdd vdd CMOSP w=6 l=2
+  ad=29.999998p pd=22u as=29.999998p ps=22u
M1014 X3 B3N1 A3N1 Gnd CMOSN w=6 l=2
+  ad=59.999996p pd=32u as=54p ps=30u
M1015 P0 X0 gnd Gnd CMOSN w=3 l=2
+  ad=19p pd=18u as=19p ps=18u
M1016 M4 A3 vdd vdd CMOSP w=6 l=2
+  ad=29.999998p pd=22u as=29.999998p ps=22u
M1017 M2 A1 vdd vdd CMOSP w=6 l=2
+  ad=29.999998p pd=22u as=29.999998p ps=22u
M1018 X3 B3 A3 Gnd CMOSN w=6 l=2
+  ad=59.999996p pd=32u as=54p ps=30u
M1019 B0N1 B0 gnd Gnd CMOSN w=3 l=2
+  ad=19p pd=18u as=19p ps=18u
M1020 B2N1 B2 vdd vdd CMOSP w=6 l=2
+  ad=29.999998p pd=22u as=29.999998p ps=22u
M1021 X1 B1N1 A1N1 Gnd CMOSN w=6 l=2
+  ad=59.999996p pd=32u as=54p ps=30u
M1022 B3N1 B3 gnd Gnd CMOSN w=3 l=2
+  ad=19p pd=18u as=19p ps=18u
M1023 G2 M3 vdd vdd CMOSP w=6 l=2
+  ad=29.999998p pd=22u as=29.999998p ps=22u
M1024 P1 X1 vdd vdd CMOSP w=6 l=2
+  ad=29.999998p pd=22u as=29.999998p ps=22u
M1025 A0N1 A0 gnd Gnd CMOSN w=3 l=2
+  ad=19p pd=18u as=19p ps=18u
M1026 M4 B3 vdd vdd CMOSP w=6 l=2
+  ad=29.999998p pd=22u as=29.999998p ps=22u
M1027 M0 A0 vdd vdd CMOSP w=6 l=2
+  ad=29.999998p pd=22u as=29.999998p ps=22u
M1028 A2N1 A2 gnd Gnd CMOSN w=3 l=2
+  ad=19p pd=18u as=19p ps=18u
M1029 P3 X3 gnd Gnd CMOSN w=3 l=2
+  ad=19p pd=18u as=19p ps=18u
M1030 X2 B2N1 A2N1 Gnd CMOSN w=6 l=2
+  ad=59.999996p pd=32u as=54p ps=30u
M1031 M0 B0 vdd vdd CMOSP w=6 l=2
+  ad=29.999998p pd=22u as=29.999998p ps=22u
M1032 A2N1 A2 vdd vdd CMOSP w=6 l=2
+  ad=29.999998p pd=22u as=29.999998p ps=22u
M1033 X2 B2 A2 Gnd CMOSN w=6 l=2
+  ad=59.999996p pd=32u as=54p ps=30u
M1034 A3N1 A3 vdd vdd CMOSP w=6 l=2
+  ad=29.999998p pd=22u as=29.999998p ps=22u
M1035 B3N1 B3 vdd vdd CMOSP w=6 l=2
+  ad=29.999998p pd=22u as=29.999998p ps=22u
M1036 P2 X2 gnd Gnd CMOSN w=3 l=2
+  ad=19p pd=18u as=19p ps=18u
M1037 X0 B0 A0 Gnd CMOSN w=6 l=2
+  ad=59.999996p pd=32u as=54p ps=30u
M1038 G2 M3 gnd Gnd CMOSN w=3 l=2
+  ad=19p pd=18u as=19p ps=18u
M1039 M2 B1 vdd vdd CMOSP w=6 l=2
+  ad=29.999998p pd=22u as=29.999998p ps=22u
M1040 M4 B3 K4 Gnd CMOSN w=6 l=2
+  ad=29.999998p pd=22u as=29.999998p ps=22u
M1041 G3 M4 vdd vdd CMOSP w=6 l=2
+  ad=29.999998p pd=22u as=29.999998p ps=22u
M1042 A1N1 A1 gnd Gnd CMOSN w=3 l=2
+  ad=19p pd=18u as=19p ps=18u
M1043 X0 B0N1 A0N1 Gnd CMOSN w=6 l=2
+  ad=59.999996p pd=32u as=54p ps=30u
M1044 M3 B2 vdd vdd CMOSP w=6 l=2
+  ad=29.999998p pd=22u as=29.999998p ps=22u
M1045 M2 B1 K2 Gnd CMOSN w=6 l=2
+  ad=29.999998p pd=22u as=29.999998p ps=22u
M1046 P1 X1 gnd Gnd CMOSN w=3 l=2
+  ad=19p pd=18u as=19p ps=18u
M1047 B1N1 B1 vdd vdd CMOSP w=6 l=2
+  ad=29.999998p pd=22u as=29.999998p ps=22u
M1048 M0 B0 K0 Gnd CMOSN w=6 l=2
+  ad=29.999998p pd=22u as=29.999998p ps=22u
M1049 G0 M0 vdd vdd CMOSP w=6 l=2
+  ad=29.999998p pd=22u as=29.999998p ps=22u
M1050 gnd A2 K3 Gnd CMOSN w=6 l=2
+  ad=29.999998p pd=22u as=29.999998p ps=22u
M1051 P3 X3 vdd vdd CMOSP w=6 l=2
+  ad=29.999998p pd=22u as=29.999998p ps=22u
M1052 G0 M0 gnd Gnd CMOSN w=3 l=2
+  ad=19p pd=18u as=19p ps=18u
M1053 X1 B1 A1 Gnd CMOSN w=6 l=2
+  ad=59.999996p pd=32u as=54p ps=30u
M1054 M3 A2 vdd vdd CMOSP w=6 l=2
+  ad=29.999998p pd=22u as=29.999998p ps=22u
M1055 gnd A1 K2 Gnd CMOSN w=6 l=2
+  ad=29.999998p pd=22u as=29.999998p ps=22u
C0 vdd m3_1225_55# 0.001731f
C1 A0 K0 0.055711f
C2 A2N1 vdd 0.094864f
C3 P2 gnd 0.072183f
C4 vdd m2_1008_n31# 0.004941f
C5 B2 M3 0.11336f
C6 P3 vdd 0.102929f
C7 B0N1 B0 1.62e-19
C8 A2 gnd 0.056518f
C9 X2 P2 0.058778f
C10 K4 gnd 0.061857f
C11 P2 vdd 0.102929f
C12 B3 m3_1441_48# 0.007496f
C13 G0 gnd 0.072183f
C14 A2 vdd 0.4263f
C15 B3 m2_1441_n4# 3.61e-19
C16 K3 gnd 0.061857f
C17 X0 P0 0.058778f
C18 A0 A0N1 1.62e-19
C19 G0 vdd 0.102905f
C20 M0 gnd 0.056518f
C21 B2 m3_1225_55# 0.007496f
C22 B0 m2_816_n100# 3.61e-19
C23 B1 m2_1008_n31# 3.61e-19
C24 A3 M4 0.162736f
C25 X3 B3 0.001447f
C26 M4 G3 0.058778f
C27 B0 gnd 0.059283f
C28 A0 m3_816_n48# 1.13e-19
C29 B0N1 m2_816_n100# 0.001081f
C30 A3 B3 0.265023f
C31 M0 vdd 0.232636f
C32 B0N1 gnd 0.072183f
C33 X1 B1N1 4.82e-19
C34 B0 vdd 0.179844f
C35 B1N1 gnd 0.072183f
C36 A2 B2 0.265023f
C37 B0N1 vdd 0.094864f
C38 B3N1 gnd 0.072183f
C39 B3 M4 0.11336f
C40 B1N1 vdd 0.094864f
C41 m2_1225_3# m3_1225_55# 4.06e-19
C42 A1 m3_1008_21# 1.13e-19
C43 A2N1 m2_1225_3# 2.88e-19
C44 A3N1 gnd 0.072183f
C45 B2 K3 0.055711f
C46 B3N1 vdd 0.094864f
C47 X1 gnd 0.080082f
C48 X3 P3 0.058778f
C49 vdd m3_1008_21# 0.001731f
C50 A3N1 vdd 0.094864f
C51 A1 gnd 0.056518f
C52 vdd m2_816_n100# 0.004941f
C53 X1 vdd 0.067556f
C54 X2 gnd 0.080082f
C55 A0 M0 0.162736f
C56 B1N1 B1 1.62e-19
C57 A1 vdd 0.4263f
C58 K2 gnd 0.061857f
C59 A1 K2 0.055711f
C60 X2 vdd 0.067556f
C61 A3 K4 0.055711f
C62 A0 B0 0.259328f
C63 G2 gnd 0.072183f
C64 B1 m3_1008_21# 0.007496f
C65 M2 gnd 0.056518f
C66 A0N1 m3_816_n48# 3.33e-19
C67 A1 M2 0.162736f
C68 X1 B1 0.001447f
C69 G2 vdd 0.102905f
C70 B1 gnd 0.059283f
C71 A1 B1 0.261949f
C72 M4 K4 0.061857f
C73 M2 vdd 0.232636f
C74 B2 gnd 0.059283f
C75 B3 K4 0.055711f
C76 M2 K2 0.061857f
C77 B1 vdd 0.179921f
C78 B3N1 m2_1441_n4# 0.001081f
C79 P0 gnd 0.072183f
C80 A3N1 m3_1441_48# 3.33e-19
C81 X2 B2 0.001447f
C82 A2 M3 0.162736f
C83 M0 K0 0.061857f
C84 B1 K2 0.055711f
C85 B2 vdd 0.179921f
C86 A0 gnd 0.245034f
C87 A3N1 m2_1441_n4# 2.88e-19
C88 A2N1 m3_1225_55# 3.33e-19
C89 A1N1 m2_1008_n31# 2.88e-19
C90 X3 B3N1 4.82e-19
C91 P0 vdd 0.102929f
C92 B0 K0 0.055711f
C93 B2N1 gnd 0.072183f
C94 X1 P1 0.058778f
C95 M3 K3 0.061857f
C96 B1 M2 0.11336f
C97 A0 vdd 0.449933f
C98 P1 gnd 0.072183f
C99 X2 B2N1 4.82e-19
C100 A3 A3N1 1.62e-19
C101 vdd m3_1441_48# 0.001731f
C102 B2N1 vdd 0.094864f
C103 X3 gnd 0.080082f
C104 A2 m3_1225_55# 1.13e-19
C105 A2 A2N1 1.62e-19
C106 vdd m2_1441_n4# 0.004941f
C107 P1 vdd 0.102929f
C108 A3 gnd 0.056518f
C109 vdd m2_1225_3# 0.004941f
C110 G3 gnd 0.072183f
C111 X3 vdd 0.067556f
C112 G1 gnd 0.072183f
C113 B3N1 B3 1.62e-19
C114 X0 B0 0.001447f
C115 A3 vdd 0.4263f
C116 vdd G3 0.102905f
C117 K0 gnd 0.061857f
C118 B0 m3_816_n48# 0.007496f
C119 X0 B0N1 4.82e-19
C120 G1 vdd 0.102905f
C121 M4 gnd 0.056518f
C122 B2N1 B2 1.62e-19
C123 B3 gnd 0.059283f
C124 A2 K3 0.055711f
C125 M4 vdd 0.232635f
C126 B2 m2_1225_3# 3.61e-19
C127 M3 gnd 0.056518f
C128 A0N1 m2_816_n100# 2.88e-19
C129 M2 G1 0.058778f
C130 B3 vdd 0.179921f
C131 A0N1 gnd 0.072183f
C132 A1N1 m3_1008_21# 3.33e-19
C133 B1N1 m2_1008_n31# 0.001081f
C134 M0 G0 0.058778f
C135 M3 vdd 0.232635f
C136 m2_1441_n4# m3_1441_48# 4.06e-19
C137 m2_816_n100# m3_816_n48# 4.06e-19
C138 X0 gnd 0.080082f
C139 A0N1 vdd 0.094864f
C140 m2_1008_n31# m3_1008_21# 4.06e-19
C141 A1N1 gnd 0.072183f
C142 B2N1 m2_1225_3# 0.001081f
C143 A1 A1N1 1.62e-19
C144 M3 G2 0.058778f
C145 X0 vdd 0.067556f
C146 A3 m3_1441_48# 1.13e-19
C147 A2N1 gnd 0.072183f
C148 vdd m3_816_n48# 0.001731f
C149 A1N1 vdd 0.094864f
C150 B0 M0 0.11336f
C151 P3 gnd 0.072183f
C152 m3_816_n48# 0 0.084889f
C153 m3_1441_48# 0 0.084889f
C154 m3_1008_21# 0 0.084889f
C155 m3_1225_55# 0 0.084889f
C156 m2_1441_n4# 0 0.787321f
C157 m2_816_n100# 0 0.787321f
C158 m2_1008_n31# 0 0.787321f
C159 m2_1225_3# 0 0.787321f
C160 gnd 0 1.502551f 
C161 G3 0 0.067827f 
C162 vdd 0 16.439486f 
C163 K4 0 0.077618f 
C164 G1 0 0.129911f 
C165 K2 0 0.077618f 
C166 G0 0 0.084165f 
C167 K0 0 0.077618f 
C168 G2 0 0.093967f 
C169 K3 0 0.077618f 
C170 M4 0 0.488017f 
C171 M2 0 0.488017f 
C172 M0 0 0.488017f 
C173 B3 0 4.377186f 
C174 B1 0 4.156897f 
C175 B0 0 3.251197f 
C176 M3 0 0.488017f 
C177 B2 0 4.377186f 
C178 B0N1 0 0.143763f 
C179 A0N1 0 0.041372f 
C180 P0 0 0.07107f 
C181 B1N1 0 0.143763f 
C182 X0 0 0.316742f 
C183 A0 0 1.54804f 
C184 B3N1 0 0.143763f 
C185 A1N1 0 0.041372f 
C186 B2N1 0 0.143763f 
C187 A3N1 0 0.041372f 
C188 A2N1 0 0.041372f 
C189 P1 0 0.110281f 
C190 X1 0 0.316742f 
C191 P3 0 0.126619f 
C192 X3 0 0.316742f 
C193 A1 0 1.85438f 
C194 P2 0 0.113549f 
C195 A3 0 1.91973f 
C196 X2 0 0.316742f 
C197 A2 0 1.91973f 



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

plot v(b0)+2 v(a0) v(p0)+4 v(g0)+6
plot v(b1)+2 v(a1) v(p1)+4 v(g1)+6
plot v(b2)+2 v(a2) v(p2)+4 v(g2)+6
plot v(b3)+2 v(a3) v(p3)+4 v(g3)+6

;plot v(c)

.endc
