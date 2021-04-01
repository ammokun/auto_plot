#gnuplot -persist  -e "file='00002'" electron_rate.gp

 load "template.gp"
#set ylabel 'Partial S_e [cm^-^3s^-^1]'
#set y2label "Total S_e [10^2^2cm^-^3s^-^1]" 
set yrange [1E10:*]
set xrange [0:3]
set ytics format "10^{%L}"
set y2tics
set y2range[0:*]
set xtics 0.5
set size square
set ytics nomirror
set logscale y
set xlabel font "Arial, 15"
set ylabel font "Arial, 15"
set y2label font "Arial, 15"
set tics font "Arial, 15"
set key font "Arial, 15"

set lmargin 15
set bmargin 5
set nokey
plot file.".dat" u ($1/100):($32*1E-6) axis x1y1 w l lw 2 lc rgb"red" title "Electron collision"
replot file.".dat" u ($1/100):($33*1E-6) axis x1y1 w l lw 2 lc rgb"orange" title "Neutral collision"
replot file.".dat" u ($1/100):($35*1E-6) axis x1y1 w l lw 2 lc rgb"coral" title "E detachment"
replot file.".dat" u ($1/100):($44*1E-6) axis x1y1 w l lw 2 lc rgb"purple" title "Photo-ionization"
replot file.".dat" u ($1/100):($36*1E-6) axis x1y1 w l lw 2 lc rgb"blue" title "E-Ion recombination"
replot file.".dat" u ($1/100):($34*1E-6) axis x1y1 w l lw 2 lc rgb"dark-green" title "E attachment"

replot file.".dat" u ($1/100):($9) axis x1y2 w l dt(10,5) lw 2 lc rgb"black" title "E/N"

#set arrow from 189,1E10 to 189,1E30 nohead dt (10,5) lc rgb "medium-blue" 

replot

set terminal postscript eps color enhanced
#set terminal jpeg size 1280,960

set out "temp_fig/image1.eps"
replot

set key outside
set xrange [ion_front/100.0-0.25:ion_front/100.0+0.25]
set xtics 0.1
set terminal postscript eps color enhanced
#set terminal jpeg size 1280,960
set out "temp_fig/image2.eps"
replot
