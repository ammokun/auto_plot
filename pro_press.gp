
load "template.gp"

set yrange [1:*]
set xrange [0:3]
set size square
set y2tics
set y2range [0:*]
set ytics nomirror
set key outside
set logscale y
plot file.".dat" u ($1/100):($3*1E-6) axis x1y1 w l lw 2 lc rgb"blue" title "n_e" #*1E4 [K]
replot file.".dat" u ($1/100):($10) axis x1y2 w l lw 2 lc rgb"red" title "Pressure" #*1E4 [K]
