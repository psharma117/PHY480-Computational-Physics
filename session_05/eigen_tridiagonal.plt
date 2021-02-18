set timestamp

set title 'Relative Error in Ground State Energy'
set xlabel 'N'
set ylabel 'E_0'

#set format y "10^{%L}"

f(x) = a*x + b
fit [0.6:3] f(x) "eigen_tridiagonal.dat" using ($1):($2) via a,b
fit_label = sprintf("%-+4.1f*x %-+4.1f",a,b)

#set logscale

set key right
set grid

plot "eigen_tridiagonal.dat" using 1:2 title 'E_0',\
[0.6:3] a*x + b title fit_label

replot
