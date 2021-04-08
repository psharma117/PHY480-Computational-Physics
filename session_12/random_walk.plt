#random_walk.plt

set timestamp
set title 'random walk - 6400 steps'

set xlabel 'x'
set ylabel 'y'
plot 'random_walk.dat' using ($1):($2) with lines
