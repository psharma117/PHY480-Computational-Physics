#histogram.plt

#
set timestamp
set title 'uniform RNG histogram'

set xlabel 'x\_uniform'
set ylabel 'y\_uniform'

binwidth=0.2
bin(x, width) = width*floor(x/width)

plot "random_histogram.dat" using ($2):($3) smooth freq with boxes title "uniform1", \
"random_histogram.dat" using ($2):($4) smooth freq with boxes title "uniform2"

set term qt 2 title "Gaussian RNG histogram"  # plot window 2
set timestamp
set title 'Gaussian RNG histogram'
set xlabel 'x\_uniform'
set ylabel 'y\_uniform'
plot "random_histogram.dat" using ($5):($6) smooth freq with boxes title "gaussian1", \
"random_histogram.dat" using ($5):($7) smooth freq with boxes title "gaussian2"

