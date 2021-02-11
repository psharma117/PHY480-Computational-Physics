## Numerical Derivatives and Richardson Extrapolation
### Edit the plot file to add the corresponding plots and fits for the central derivative and extrapolated central derivative approximations. Sketch the plot here and also generate a ps,png or pdf.

![Derivative plot](https://github.com/psharma117/PHY480-Computational-Physics/blob/main/session_04/derivative_test_plt.png) 

### In Session 3, you saw the functions forward_diff and central_diff (notice that the function name is passed as a pointer). Explain the slope of the extrap_diff graph (see the discussion in the Session 4 notes).
The error for the Richardson extrapolated central difference goes as h^4 now, and we're plotting on a log-log scale. So log(error) = log(h^4) = 4log(h) which means the slope should be 4.

### This method is an example of "Richardson extrapolation," in which you use calculations at two different mesh sizes to derive a much better estimate than either one individually. Describe how you would get an even higher-order result.
I could extrapolate the extrapolation further, using the extrapolated derivatives now where the standard central difference was used before.

### What is the source of error on the left side of the graph (smaller mesh sizes)? Why are the slopes the same?
As with last week, the error on the left side of the graph is from round-off errors. These all depend on machine precision in the same way, so they should have the same slopes.

## Pointer Games
### Test the numerical derivatives at x=2. Use the gnuplot plot file with small modifications generate a plot. Sketch what you get.

![power law plot](https://github.com/psharma117/PHY480-Computational-Physics/blob/main/session_04/power_law_deriv.png)

### Did you find the same slopes with your new function? Why are the slopes the same but the intercepts different? 

The slopes are the same because the relative errors still follow the same power laws respectively. However, the power law isn't an exponential, so the exact points when machine precision rears its ugly head have changed, resulting in different intercepts.

## Linear Algebra with GSL Routines
### Can you make a theoretic guess of how the execution time scales with the size n of the matrix? E.g., is it a power law? If so, what is the exponent? Explain your reasoning. 

I expect execution time to scale like a power law, since there will likely be a fixed number of steps per matrix size, which means that the total number of operations needed to diagonalize the matrix will depend on the number of elements, which is a power law. I'd guess that the exponent is larger than 2, since otherwise there are N^2 operations for N^2 elements, one operation per element makes no sense. Since GSL is an industry standard, I'd imagine it's fairly well optimized, so it's probably not greater than 4, however without knowledge of the algorithm that they use, I can't be sure of any guess of higher precision. I'll guess 4. 

### Now figure out a way to determine how the execution time scales with the size of the matrix using the code and an appropriate graph that shows the scaling, with a fit. Does it agree with your expectations? Make sure you include a png, ps, or pdf of your plot.

Fitting a power law to the time taken for several different matrix sizes seems to be the easiest way to determine this information without knowledge of the numerical method used in the algorithm, which the code doesn't share tell me. Unfortunately, GNUplot's 'fit' function was rather uncooperative, insisting that the data was an inverse power law (so ax^-b) and returning nonsensical plots. Not wanting to leave this unanswered, I proceeded using SciPy's `optimize.curve_fit` method in python. The resultant plot is displayed below and confirms that the execution time scales as N^3.


![matrix time plot](https://github.com/psharma117/PHY480-Computational-Physics/blob/main/session_04/matrix_times.png)

