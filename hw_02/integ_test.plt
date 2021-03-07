#file: integ_test.plt

set timestamp

set xlabel 'log_{10}(# of points)'
set ylabel 'log_{10}(Relative Error)'

#set format xy "10^{%L}"

f1(x) = a1*x + b1
f2(x) = a2*x + b2

fit [:3.00] f1(x) "integ_test.dat" using 1:2 via a1, b1
fit [:2.2] f2(x) "integ_test.dat" using 1:3 via a2, b2

fit_label1 = sprintf("%.5fx + %.5f", a1, b1)
fit_label2 = sprintf("%.5fx + %.5f", a2, b2)

set title 'Comparing numerical integration errors'

plot \
	"integ_test.dat" using ($1):($2) title 'Simpson', \
	[0:3.00] a1*x + b1 title fit_label1, \
	"integ_test.dat" using ($1):($3) title 'Milne', \
	[0:2.25] a2*x + b2 title fit_label2, \
	"integ_test.dat" using ($1):($4) title 'gsl qags'
