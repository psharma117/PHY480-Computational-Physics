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

### Look at the file `derivative_test_simple.cpp` while reviewing the discussion in the notes. (Also look at the last section in the notes, which describes pointers to functions, which are used here.) What part(s) of the code do you not understand? What is being printed?

I understand this code. It computes the central and forward difference approximations of the derivative of an exponential. Both of these are compared to the exact solution and the relative error of each is output to the file `derivative_test_simple.dat` along with the log of the mesh spacing in scientific notation to 8 digits of accuracy.

### Are the slopes in each region consistent with the analysis of errors in the ch3 notes? Which is the better algorithm and why?

These slopes are consistent with the analysis of errors from the notes. In both cases, at the smallest h, the derivatives exhibit the same behavior: eps_m/h. When h is too large for this to matter, the central difference algorithm wins out, proving to be much more accurate at every value of h before machine precision rears its head. The central difference also has a higher optimal value of h from looking at the plot, which agrees with the error analysis from the notes. 

### In the ch 3 notes, we discuss how one can estimate a-priori the optimal choice for h by setting the truncation error equal to the roundoff error and solving for h (see eqs. 3.9 and 3.13.) Plug in #'s to find the optimal h values for the two algorithms. Does these theoretical estimates agree with what your graphs are telling you?

Plugging in x = alpha = 1 and using eps_m = 1.158e-16 from week 1, I find that the optimal value of h for the forward difference is about 2.509e-8 and the for the central difference it's about 1.962e-5. Both of these match wonderfully with the minima for the respective approximations on the graph.

