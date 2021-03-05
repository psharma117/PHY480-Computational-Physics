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

I chose Rmax = 6, as this fully displays the Gaussian tail of the wavefunction. I think this suitably captures all relevant behavior of the wavefunction to a reasonable degree. 

### For your choice of Rmax, try N = 4,8,16,32,64,128,256,512,1024 (you could add a loop to calculate these). How does the relative error for the lowest eigenvalue scale with N? Sketch the plot to validate your answer.

![gse error](https://github.com/psharma117/PHY480-Computational-Physics/blob/main/session_05/gse_error.png)

The relative error scales roughly as N^-2

### Explain the slope you found based on the approximation to the second derivative.
The slope corresponds to the truncation error of the finite difference method used here: the error is O(h^2) and that's what we see here on the log-log plot for decreasing h. 

## Bound States from Diagonalizing the Hamiltonian in a Basis
### Find the bound-state energies for the square well parameters used here (you need to change the notebook parameters!).

There are 3 bound states for a well with these parameters: one with energy E = -45.9321, one with E = -33.8733, and one with E = -14.5248. 

### Based on the "exact" results from Mathematica, which of the approximate eigenvalue(s) for the square well are most reliable? Why do you think this is?

The ground state energy is the most reliable. Expanding the square well eigenstates as a superposition of harmonic oscillator eigenstates, the nth states of each system will have the most overlap with each other as they share the same number of nodes, but each square well eigenstate carries nonzero overlap with subsequent eigenstates of the harmonic oscillator (and overlap much closer to 0 for eigenstates lower than n). As such, truncating the basis gives the square well ground state the longest expansion in terms of the harmonic oscillator eigenstates, resulting in a more accurate energy. To make a simpler analogy, we're giving the ground state more terms in the Taylor series. 

### Considering all three of the lowest eigenvalues, which are calculated most effectively, those of the Coulomb potential or the square well potential? Can you explain your observation?

The square well potential is more effectively calculated with this basis. I think this is because the square well as a potential is much closer to the harmonic oscillator than the Coulomb system with 0 angular momentum. As a result, there's a much closer correspondence between the qualitative shapes of the probability amplitudes over positions for the square well and the oscillator.

### For a fixed basis size (pick one that reproduces the ground state reasonably), how do you find the optimum b? (Hint: think gnuplot!) Can you qualitatively (or semi-quantitatively) account for your result? (Think about the potentials and guess what the lowest wave functions will look like and what changes about the basis when the harmonic oscillator parameter b is changed.)

I can find the optimum b by plotting the relative error in the ground state energy vs b. Using gnuplot (see below), I find that b = 0.2 works pretty well. The ground state wavefunction for the square well goes to 0 in a different manner compared to the harmonic oscillator wavefunction, the exponential tails don't behave quite the same. The harmonic oscillator parameter controls the width of the (normalized) wavefunction through the width of the well that the wavefunction is a solution to. Narrowing the wavefunctions used allows for an estimate that's closer to the actual square well wavefunction. 

![gse vs b](https://github.com/psharma117/PHY480-Computational-Physics/blob/main/session_05/gse_vs_b.png)

### If you now fix b (if you have time you can consider two or three different values in turn), how can you find how the accuracy of the ground state energy scales with the basis size? Make an appropriate plot.

![gse vs n](https://github.com/psharma117/PHY480-Computational-Physics/blob/main/session_05/gse_vs_dim.png)

Plotting the relative error vs basis dimension shows a roughly linear plot for larger N, so I could fit a power law to at least that region to find the scaling law. I find that the error scales like the dimension^2. 

### Look at the code. How could you make it more efficient? (What do you think is the limiting factor based on the scaling of the time with the size of the basis?) For example, could you speed it up by almost a factor of two? (Hint, hint!)

We don't need to iterate over the entirety of the matrix to solve this problem, it's Hermitian and real valued so we can just compute the top triangle of the matrix values and then just copy them over to the lower triangle of values. 

### (For a later HW set, so no need to finish.) How would you find the wave function that corresponds to a given state (e.g., the ground state)? Add code to generate the lowest wave function for the lowest bound state (hint: it involves the eigenvector). 

The eigenvector is the set of coefficients for harmonic oscillator eigenstates that make up the eigenstate of the given system. So we can find the wavefunction that corresponds to a given energy by simply using the components of the eigenvector as coefficients of harmonic oscillator eigenstates in a series. 

