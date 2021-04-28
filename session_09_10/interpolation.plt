# plot file for diffeq_oscillations
set timestamp

set title 'Cross sections'

set xlabel 'E'
set ylabel '{Cross Section}'
plot "cross_section_th.dat" using ($1):($2) title 'Cubic Spline' w linesp, \
	 "cross_section_th.dat" using ($1):($3) title 'Poly Spline' w linesp, \
	 "cross_section_th.dat" using ($1):($4) title 'Linear Spline' w linesp, \
	 "cross_section_th.dat" using ($1):($5) title 'Breit Wigner' w lines

