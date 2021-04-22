#histogram.plt

#
set timestamp
set title 'Energy Distributions'

set xlabel 'Energy(E)'
set ylabel 'P(E)'

binwidth=4
bin(x, width) = width*floor(x/width)

plot "energy_dist.dat" using ($1):($2) smooth freq with boxes title "Exact", \
"energy_dist.dat" using ($1):($3) smooth freq with boxes title "Random", \
"energy_dist.dat" using ($1):($4) smooth freq with boxes title "Metropolis"

#set term qt 2 title "Gaussian RNG histogram"  # plot window 2
#set timestamp
#set title 'Gaussian RNG histogram'
#set xlabel 'x\_uniform'
#set ylabel 'y\_uniform'
#plot "random_histogram.dat" using ($5):($6) smooth freq with boxes title "gaussian1", \
#"random_histogram.dat" using ($5):($7) smooth freq with boxes title "gaussian2"

