# plot file for diffeq_oscillations
set timestamp
#
set title 'Variations in energy vs time'


# plot of kinetic energy and potential energy versus time
set xlabel 't'
set ylabel 'Computed energy - actual energy'
plot "diffeq_oscillations.dat" using ($1):($4 + $5 - 0.5) title 'E(t)' with lines
     #"diffeq_oscillations.dat" using ($1):($5) title 'PE(t)' with lines
 
