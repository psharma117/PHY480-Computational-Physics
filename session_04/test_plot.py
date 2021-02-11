import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import curve_fit

def f(x, a, b):
    return a*x**b

data = np.loadtxt('matrix_times.dat')
print(data.shape)
x = data[:,0]
y = data[:,1]
plt.scatter(x,y, label='data')
popt, pcov = curve_fit(f, x, y)
print(popt)
a = popt[0]
b = popt[1]
fit_label = 'fit: ' + str(np.format_float_scientific(a,precision=3)) + '*x^' + str(np.format_float_scientific(b, precision=3))
plt.plot(x, f(x, a, b), color='red', label=fit_label)
plt.title('Time taken to diagonalize an NxN Hilbert Matrix')
plt.xlabel('N (side length of matrix)')
plt.ylabel('Time taken(s)')
plt.legend()
plt.grid()
plt.show()

