#gnuplot -persist  -e "file='00002'" electron_rate.gp

set terminal aqua dashed 
set yrange [100:*]
set xrange [0:3]

set logscale y
set xtics 0.5
#set mxtics 

set size square
set xlabel font "Arial, 15"
set ylabel font "Arial, 15"
set tics font "Arial, 15"
set ytics format "10^{%L}"
set key font "Arial, 15"
set lmargin 5
set bmargin 5

set nokey

plot file.".dat" u ($1/100):($32*1E-6) w l lw 2 lc rgb"blue" title "O2"
replot file.".dat" u ($1/100):($33*1E-6) w l lw 2 lc rgb"green" title "O2(a1)"
replot file.".dat" u ($1/100):($34*1E-6) w l lw 2 lc rgb"red" title "O2(b1)"
replot file.".dat" u ($1/100):($35*1E-6) w l lw 2 lc rgb"dark-goldenrod" title "O2(4.5eV)"
replot file.".dat" u ($1/100):($36*1E-6) w l lw 2 lc rgb"cyan" title "O"
replot file.".dat" u ($1/100):($37*1E-6) w l lw 2 dt (10,5) lc rgb"blue" title "O(D)"
replot file.".dat" u ($1/100):($37*1E-6) w l lw 2 dt (10,5) lc rgb"pink" title "O(s)"
#replot file.".dat" u ($1/100):($39*1E-6) w l lw 2 lc rgb"brown" title "O3"
replot file.".dat" u ($1/100):($2*1E-6) w l lw 2 lc rgb"black" title "E"

replot file.".dat" u ($1/100):($28*1E-6) w l lw 2 lc rgb"purple" title "N2(C4)

#set arrow from 189,1E10 to 189,1E30 nohead dt (10,5) lc rgb "medium-blue" 

replot

set terminal postscript eps color enhanced
#set terminal jpeg

set out "temp_fig/image1.eps"
replot
set key outside
set xrange [ion_front/100.0-0.25:ion_front/100.0+0.25]
set xtics 0.1
set terminal postscript eps color enhanced
#set terminal jpeg
set out "temp_fig/image2.eps"
replot