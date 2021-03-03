#file: gse_vs_b.plt

set timestamp

set title 'Relative Error in Ground State Energy'
set xlabel 'dimension of basis'
set ylabel 'Relative Error'

set format y "10^{%L}"

f(x) = a*x**b
fit [12:45] f(x) "ground_state_energy.dat" using ($1):($2) via a,b
fit_label = sprintf("%.5e*x^{%-+4.1f}",a,b)

set logscale

set key bottom right
set grid

plot "ground_state_energy.dat" using 1:2 title 'ground state relative error',\
[12:45] a*x**b title fit_label

replot
