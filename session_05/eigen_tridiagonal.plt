set timestamp

set title 'Ground state radial wavefunction for spherical oscillator'
set xlabel 'r'
set ylabel 'u(r)'

set key left
set grid

plot "eigen_tridiagonal.dat" using 1:2 title 'u(r)'

replot
