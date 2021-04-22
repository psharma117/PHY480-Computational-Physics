# plot file for diffeq_oscillations
set timestamp

set title 'Ising Model Energy vs time'

# simple plot versus time
set xlabel 't'
set ylabel 'E'
plot "ising_model_05.dat" using ($1):($2) title 'kT=0.5' with lines , \
"ising_model_10.dat" using ($1):($2) title 'kT=1.0' with lines , \
"ising_model_20.dat" using ($1):($2) title 'kT=2.0' with lines 

#plot "diffeq_oscillations.dat" using ($1):($2) title 'p=?' with lines # , \
#  (1/omega)*sin(omega*x)

# plot the potential
#set xlabel 'x'
#set ylabel 'V(x)'
#plot "diffeq_oscillations.dat" using ($2):($5) title 'V(x)' with lines

# phase space plot
#set xlabel 'x(t)'
#set ylabel 'v(t)'
#plot "diffeq_oscillations.dat" using ($2):($3) title 'phase-space plot' with lines

# plot of kinetic energy and potential energy versus time
#set xlabel 't'
#set ylabel 'energy'
#plot "diffeq_oscillations.dat" using ($1):($4) title 'KE(t)' with lines, \
#     "diffeq_oscillations.dat" using ($1):($5) title 'PE(t)' with lines
 
