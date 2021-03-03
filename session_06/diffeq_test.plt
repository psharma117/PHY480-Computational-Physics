# plot file for diffeq_test_exp_back
set timestamp

set xlabel 't'
set ylabel 'Relative error'
set logscale

set title 'Comparing Diff-Eq Algorithm Errors'
set key bottom left

plot \
  "diffeq_test.dat" using ($1):(abs($2 - $4)/$4) title 'Euler', \
  "diffeq_test.dat" using ($1):(abs($3 - $4)/$4) title '4th order Runge-Kutta'
  #"diffeq_test.dat" using ($1):($4) title 'exact'
