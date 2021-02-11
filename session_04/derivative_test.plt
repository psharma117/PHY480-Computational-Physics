#  file: derivative_test.plt 
#
#  Gnuplot plot file for derivative_test output
#  
#  Programmer:  Dick Furnstahl  furnstahl.1@osu.edu
# 
#  Revision history
#   2004-01-24  original version for 780.20 session 5
#   2004-01-16  added postscript enhanced and comments for session 4
#

# record the time and date the graph was generated
set timestamp

# titles and labels
set title 'Test of Numerical Derivatives using alpha*x^{beta}'
set xlabel 'log10(mesh size)'
set ylabel 'relative error'

# move the legend to a free space
set key left

# set the x and y axis scales (already logs)
set xrange [-10:-1]
set yrange [-12:0]

# fit the forward diff curve
f1(x) = a1*x + b1
fit [-7.25:-1] f1(x) "derivative_test.dat" using ($1):($2) via a1,b1 
fit_title1 = sprintf("%-+4.1f*x %-+4.1f",a1,b1)

# fit the central diff curve
f2(x) = a2*x + b2
fit [-4:-1] f2(x) "derivative_test.dat" using ($1):($3) via a2,b2 
fit_title2 = sprintf("%-+4.1f*x %-+4.1f",a2,b2)

# fit the extrapolated curve
f3(x) = a3*x + b3
fit [-1.75:-1] f3(x) "derivative_test.dat" using ($1):($4) via a3,b3 
fit_title3 = sprintf("%-+4.1f*x %-+4.1f",a3,b3)
# set the terminal type to be the screen (which is x11 here)
#set term x11

# plot the data as well as the fit, with appropriate titles 
plot "derivative_test.dat" using ($1):($2) title 'forward difference', \
	"derivative_test.dat" using ($1):($3) title 'central difference', \
	"derivative_test.dat" using ($1):($4) title 'Richardson extrap', \
	 a1*x + b1 title fit_title1, \
	 a2*x + b2 title fit_title2, \
	 a3*x + b3 title fit_title3

# output the plot to the file derivative_test_plt.ps   
set out "derivative_test_plt.png"
#set term postscript color enhanced
replot
