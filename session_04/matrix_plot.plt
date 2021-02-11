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
set title 'Time taken to find eigenvalues of an NxN Hilbert Matrix'
set xlabel 'N (side length of matrix)'
set ylabel 'time taken'

# move the legend to a free space
set key left

# set the x and y axis scales (already logs)
#set xrange [-10:-1]
#set yrange [-12:0]

# fit the forward diff curve
f(x) = a*x**-b
fit[8:312] f(x) "matrix_times.dat" using ($1):($2) via a,b
fit_title = sprintf("*x^{%+4.1f}",b)

# set the terminal type to be the screen (which is x11 here)
#set term x11

# plot the data as well as the fit, with appropriate titles 
print(b)
plot "matrix_times.dat" using ($1):($2) title 'Times taken', \
	 a*x**b title fit_title

# output the plot to the file derivative_test_plt.ps   
#set out "derivative_test_plt.png"
#set term postscript color enhanced
replot
