# gnuplot plot file: quad_eq.plt
#set terminal x11   # terminal type: for a Mac, use "aqua" instead of "x11"
set title 'Relative error for Forward and Central Differences'
set xlabel 'log(h)'
set ylabel 'relative error'
set logscale
set pointsize 1.5   # set the size of the plotted points
set key top left    # move the key away from the lines
set timestamp	  # turn on a date/time indicator
plot "derivative_test_simple.dat" using 1:2 title 'Forward Difference',\
     "derivative_test_simple.dat" using 1:3 title 'Central Difference'
replot  		  	# plot to the file
