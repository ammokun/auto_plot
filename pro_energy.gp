#gnuplot -persist  -e "file='00002'" pro_tetg.gp
 
load "template.gp"

set yrange [1:*]
set xrange [0:3]
set ytics nomirror
set size square
set y2tics
set y2range [0:1.5E4]

set nokey
set logscale y 
set lmargin 10
set xtics 0.5


#plot file.".dat" u ($1/100):($52) axis x1y1 w l lw 2 lc rgb"blue" title "electron energy"
#replot file.".dat" u ($1/100):($58/1.602176e-19) axis x1y1 w l lw 2 lc rgb"purple" title "vibrational energy" 
plot file.".dat" u ($1/100):($18) axis x1y1 w l lw 2 lc rgb"orange" title "joule" 
replot file.".dat" u ($1/100):($24*$3*1.60E-19) axis x1y1 w p lw 2 lc rgb"red" title "vib rate" #J/m3/s
#plot file.".dat" u ($1/100):($24) axis x1y1 w l lw 2 lc rgb"red" title "vib rate" #J/m3/s
#replot file.".dat" u ($1/100):($26*$3*1.60E-19) axis x1y1 w l lw 2 lc rgb"red" title "ion rate" #J/m3/s
#replot file.".dat" u ($1/100):($26) axis x1y1 w l lw 2 lc rgb"red" title "ion rate" #J/m3/s
replot file.".dat" u ($1/100):($50*$3*1.60E-19) axis x1y1 w l dt(10,5) lw 2 lc rgb"dark-green" title "loss inelastic"
#replot file.".dat" u ($1/100):($20) axis x1y1 w l lw 2 lc rgb"orange" title "jouleZDP(i)"
replot file.".dat" u ($1/100):($61) axis x1y1 w l lw 2 lc rgb"blue" title "ex_relax" #J/m3/s
replot file.".dat" u ($1/100):($21) axis x1y1 w l  dt(10,5) lw 2 lc rgb"purple" title "vib_relax" #J/m3/s
replot file.".dat" u ($1/100):(-$63) axis x1y1 w l  dt(10,5) lw 2 lc rgb"dark-grey" title "vib_diss" #J/m3/s
replot file.".dat" u ($1/100):($15) axis x1y2 w l  lw 2 lc rgb"magenta" title "T_v" #Td
replot file.".dat" u ($1/100):($16) axis x1y2 w l  lw 2 lc rgb"red" title "T_g" #Td
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
