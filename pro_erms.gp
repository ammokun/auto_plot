
load "template.gp"

set yrange [0:*]
set xrange [0:3]
set size square
set y2tics
set y2range [0:*]
set ytics nomirror
set key outside

plot file.".dat" u ($1/100):($3*1E-6) axis x1y1 w l lw 2 lc rgb"black" title "n_e" #*1E4 [K]
replot file.".dat" u ($1/100):($7) axis x1y2 w l lw 2 lc rgb"blue" title "E_rms" #*1E4 [K]
