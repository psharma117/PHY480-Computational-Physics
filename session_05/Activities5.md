## Nan's and Inf's
### What do you think the result of 0.*(1./0.) will be? Predict and then modify the code to check it out. [Note: Use the variables "numerator" and "denominator" to calculate (1./0.).]

I suspect that this will still return `inf`. Upon running the code, I was wrong. It returned `-nan`.

## Bound States by Matrix Diagonalization in Coordinate Representation
### Using make_eigen_tridiagonal, compile and run the code a few times to see how it works. Try various values of Rmax and N such as Rmax=3, N=20 or 50 (make a chart here of Rmax, N and the two lowest eigenvalues for five pairs of Rmax,N). How can you verify that the code is working?

| Rmax | N  | Ground state energy | First excited energy | 
| ---- | -  | ------------------- | -------------------- |
| 3    | 20 | `1.681778e+00`      | `5.083030e+00`       |
| 10   | 30 | `1.491264e+00`      | `3.456030e+00`       |
| 10   | 50 | `1.496868e+00`      | `3.484303e+00`       |
| 20   | 30 | `1.464343e+00`      | `3.316207e+00`       |
| 20   | 50 | `1.487385e+00`      | `3.436305e+00`       |

### Change the code so that only the lowest few eigenvalues are printed out. Look at the output file eigen_tridiagonal.dat and plot it with gnuplot. Sketch your plot. What is this function? The value at r=0 is not given; what should it be?

![Wavefunction plot](https://github.com/psharma117/PHY480-Computational-Physics/blob/main/session_05/ground_state_oscillator.png)
At r=0, the radial wavefunction should be 0. This way, we get a Gaussian when considering the full wavefunction, with no singularities at the origin. 

### You need to pick a reasonable value of Rmax. Justify your choice based on the eigen_tridiagonal.dat plot:

I chose Rmax = 6, as this fully displays the Gaussian tail of the wavefunction.



