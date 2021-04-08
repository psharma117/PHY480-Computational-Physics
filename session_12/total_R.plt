#  file: gaussian_random_new.plt 
#
#  Gnuplot plot file for gaussian_random_new histograms
#  
#  Programmer:  Dick Furnstahl  furnstahl.1@osu.edu
# 
#  Revision history
#   2004-03-05  original version for 780.20 session 12
#   2016-03-29  fixed logscale and sprintf for newer versions of gnuplot
#

# record the time and date the graph was generated
set timestamp

# titles and labels
set title 'Average distance traveled in random walk'
set xlabel '# Points'
set ylabel 'Average distance traveled'
set logscale xy

# move the legend to a free space
set key left

# fit the curve
f(x) = a*sqrt(x)
fit [3:25600] f(x) "total_R.dat" using ($1):($2) via a
ptitle = sprintf("%-4.5f*sqrt(x)", a)
#set term x11


# plot 
plot "total_R.dat" using ($1):($2) title 'averaged data', \
a*sqrt(x) title ptitle


