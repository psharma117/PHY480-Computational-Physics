
## Grade check +
(see comment on roundoff error for trapezoid rule though)
## Comparing Floating Point Numbers
### Look at the file `number_comparison.cpp` in an editor. What does it do?

This file compares the ratio cos(pi/4)/sin(pi/4) to the float 1.0. The ratio should be 1.0 in normal math, however it seems like it won't be when I compile and run this.

### Compile, link, and run the program (there is a makefile). Why doesn't it give the answer you want?

I suspect that I don't get the answer I want because finite precision in pi and truncation error in the computation of sin and cos are working against me. Numerically, pi/4.0 will not be the same number as pi/4 in regular math, so I'm already slightly off from the number that should make these trig functions equal. Since sin and cos are computed via some finite series expansion, I'm also not getting full precision when I compute either to begin with.

### Add statements to print out x1 and x2 to check your response. What did you add?

I added a `cout` statement with relevant precision to the `else` statement in the code:
```cpp
cout << "x1 = " << setprecision(16) << x1  
	<< ", x2 = " << setprecision(16) << x2 << endl;
```
The addition of `setprecision` was necessary, as otherwise the default string formatting rounded both numbers to 1.

### Suggest a better way to compare two numbers based on the idea that the relative inaccuracy of any number can be as large as a specified precision eps (which may be greater than the machine precision).

This can be accomplished by adding a variable `eps` to the code and changing the `if` statement to say
```cpp
if(abs(x1 - x2) > eps)
```
and then proceeding as before.

## Numerical Derivatives: Pass 1
### Look at the file `derivative_test_simple.cpp` while reviewing the discussion in the notes. (Also look at the last section in the notes, which describes pointers to functions, which are used here.) What part(s) of the code do you not understand? What is being printed?

I understand this code. It computes the central and forward difference approximations of the derivative of an exponential. Both of these are compared to the exact solution and the relative error of each is output to the file `derivative_test_simple.dat` along with the log of the mesh spacing in scientific notation to 8 digits of accuracy.

### Make a graph with gnuplot with two plots: the logarithm of the relative error for forward difference vs. the logarithm of h (which is Delta-x) and the analogous plot for central difference. (Make sure you include a pdf, png, or ps of your plots when you turn in the activity sheet.)

![Plots of Relative Error](https://github.com/psharma117/PHY480-Computational-Physics/blob/main/session_03/derivative_test_simple.png)

### Are the slopes in each region consistent with the analysis of errors in the ch3 notes? Which is the better algorithm and why?

These slopes are consistent with the analysis of errors from the notes. In both cases, at the smallest h, the derivatives exhibit the same behavior: eps_m/h. When h is too large for this to matter, the central difference algorithm wins out, proving to be much more accurate at every value of h before machine precision rears its head. The central difference also has a higher optimal value of h from looking at the plot, which agrees with the error analysis from the notes.

### In the ch 3 notes, we discuss how one can estimate a-priori the optimal choice for h by setting the truncation error equal to the roundoff error and solving for h (see eqs. 3.9 and 3.13.) Plug in #'s to find the optimal h values for the two algorithms. Does these theoretical estimates agree with what your graphs are telling you?

Plugging in x = alpha = 1 and using eps_m = 1.158e-16 from week 1, I find that the optimal value of h for the forward difference is about 2.509e-8 and the for the central difference it's about 1.962e-5. Both of these match wonderfully with the minima for the respective approximations on the graph.

### If you switched to single precision, would the slopes of the lines in your plots change? What would the graph look like?

If I switched to single precision, I'd have a much higher machine precision eps_m. As a result, my optimal h would be larger in both cases, however I think that with single precision, the slopes of both lines would become less steep as the relative error wouldn't get as low as it does with double precision.

## Makefiles for multiple project files (including header file)
### Compare the trapezoid_rule and Simpsons_rule functions in integ_routines.cpp to equations (3.15)-(3.19) and the table in the Session 3 class notes. Can you see how the algorithms are implemented? What is the advantage of having the routines in a separate file from the main program if you want to test that they work on known integrals or if you later improve the algorithm?

Both algorithms start from the first interior point to the last interior point, and then add the endpoint contributions. In the case of Simpson's rule, every other point is summed for each weight since a consecutive sequence of points has alternating weight factors. A loop is run for the even and odd points so that everything is accounted for. Having the routines in a separate file keeps the main code cleaner and easier to read, and it allows me to still call the functions as I would with any other functions. The fact that it's in a separate file also means that the programmer only has to compile the routines once, which doesn't matter here but I imagine that this can grow to matter quite quickly for heavier calculations.

### Create the executable integ_test using the makefile make_integ_test and run it to generate the integ.dat output file. Does the output file makes sense?

The output file makes sense, the absolute errors decrease quite quickly in the beginning before eventually staying roughly constant, as expected for the power law behavior of 1/N that we got for the error.

### Use Gnuplot to reproduce the figure in Section 3d of the notes. Briefly explain what you can learn from the plot. I.e., are there different "regions" where the slopes are qualitatively different? If so, what does each region signify?

![Plots of integral relative error](https://github.com/psharma117/PHY480-Computational-Physics/blob/main/session_03/integ_test.png)

Until about 20 intervals Simpson's rule has a definite downward slope on the log plot. I think this is roughly -4 as expected, but it's hard to be sure without grid lines. Around 20 intervals, the slope just becomes 0 with some noise, as subtractive cancellations start to occur. Gauss quad is a champ and doesn't really vary much with number of intervals until larger numbers of intervals are used and (I assume) the same subtractive cancellations are met. Trapezoid rule stays at a consistent slope because it takes significantly longer to reach the values that would allow for subtractive cancellations to occur, resulting in a fairly uniform line going down with a slope of -2.

### Change the loop in integ_test.cpp so that the points on the log-log plot are evenly spaced. What did you change?

All I had to change was the way the number of intervals increments: I changed `i+=2` to `i*=2` so that the number of intervals grew exponentially which translates to a straight line on a log scale.

![Evenly spaced plot](https://github.com/psharma117/PHY480-Computational-Physics/blob/main/session_03/even_integ_test.png)

### What are the slopes of the trapezoid and Simpson's rule plots in the regions where they are linear?

The slope of the trapezoid plot is -2.09 with less than 1% error in the region where it's linear. The slope of the Simpson plot is -4.467 with about 2% error in the region where it's linear. On the plot, I made a typo in the key with the slope of the trapezoid fit, but I didn't notice this till it was too late.
![Plots of fits to error on log scale](https://github.com/psharma117/PHY480-Computational-Physics/blob/main/session_03/fit_integ_test.png)

### Are the slopes consistent with the analysis in the text? Now try to fit the round-off error region and interpret the "slope".

The slopes are roughly consistent with the analysis in the text, but the error was definitely noticeable as the slopes weren't perfect. In the roundoff error region I get that the trapezoid error slope is -1.999 while the simpson slope is 0.3857. I think the trapezoid rule has a ways to go before it starts facing serious roundoff errors that increase the relative error of the integral approximation, while simpson's rule is already past the breaking point and so we see relative error increasing with a slope of 0.3857, just shy of sqrt(# of intervals).I'll take this to be the same kind of phenomenon that we saw with the derivative error, at this point we get growing roundoff error that follows a power law with a positive power less than 1.

*SB: Note that you can get the proper roundoff slope for the trapezoid rule by going out to large N_intervals*
