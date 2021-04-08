#uniformity.plt

#
set timestamp

set title 'pairs of random values'

set xlabel 'x'
set ylabel 'y'

plot "random_numbers.dat" using ($1):($2)


