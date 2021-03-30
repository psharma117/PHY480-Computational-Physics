# plot file for diffeq_oscillations
set timestamp

set title 'Phase plot'

# simple plot versus time
pi = 3.141592653589793
k = (2.*pi)**2
m = 1
omega = sqrt(k/m)
set xlabel 'x'
set ylabel 'v'
plot "ode_test_x0_-1.5_v0_2.dat" using ($2):($3) title 'x_0 = -1.5, v_0 = 2', \
	 "ode_test_x0_0.1_v0_0.dat" using ($2):($3) title 'x_0 = 0.1, v_0 = 0', \
	 "ode_test_x0_1_v0_0.dat" using ($2):($3) title 'x_0 = 1.0, v_0 = 0'
#plot "diffeq_oscillations.dat" using ($1):($2) title 'p=?' with lines # , \
#  (1/omega)*sin(omega*x)

