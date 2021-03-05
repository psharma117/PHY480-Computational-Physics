# plot file for diffeq_test_exp_back
set timestamp

set xlabel 'h'
set ylabel 'Relative error'
set logscale

set format xy "10^{%L}"

set title 'Comparing Diff-Eq Algorithm Errors'
set key bottom right

plot \
  "diffeq_test.dat" using ($1):(abs($2 - $4)/$4) title 'Euler', \
  "diffeq_test.dat" using ($1):(abs($3 - $4)/$4) title 'RK4'
  #"diffeq_testh1.dat" using ($1):(abs($2 - $4)/$4) title 'Euler, h = 0.01', \
  #"diffeq_testh1.dat" using ($1):(abs($3 - $4)/$4) title 'RK4, h = 0.01'
