import numpy as np
import matplotlib.pyplot as plt

spins = np.loadtxt('spins.dat', dtype=int, skiprows=1)
plt.imshow(spins)
plt.show()

