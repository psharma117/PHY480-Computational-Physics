# record the time and date the graph was generated
set timestamp

# titles and labels
set title 'Relative Error between Bessel Recursion formulas'
set xlabel 'x'
set ylabel 'Relative Error'
#set format x "10^{%L}"
#set format y "10^{%L}"

# move the legend to a free space
set key left

set logscale y
# set the x and y axis scales (already logs)

# fit the forward diff curve
#f(x) = a*x**b
#fit [2e4:1e6] f(x) "summations.dat" using ($1):($2) via a,b 
#fit [300:10000] f(x) "summations.dat" using ($1):($2) via a1,b1 
#fit_title = sprintf("%e*x^{-%-4.1f}",a,b)

# set the terminal type to be the screen (which is x11 here)
#set term x11

# plot the data as well as the fit, with appropriate titles 
plot "bessel.dat" using ($1):($2) title 'Relative Error down',\
"bessel.dat" using ($1):($3) title 'Relative Error up'
#[2e4:1e6] a*x**b title fit_title

# output the plot to the file derivative_test_plt.ps   
#set out "derivative_test_plt.png"
#set term postscript color enhanced
replot
