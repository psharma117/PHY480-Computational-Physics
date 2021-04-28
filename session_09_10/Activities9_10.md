## grade: check (missing some spline plots/questions)
## Revisiting area.cpp with a C++ Class

### Look at the online printout with `test_Circle.cpp` and the old `area.cpp`, with the Circle class definitions. Note how all of the details of the area calculation are now hidden. Any questions on the Class definition? Predict where in the `test_Circle.cpp` code the two circles will be created and where they will be destroyed. Why do we define `get_radius` and `set_radius` methods?

The class definition seems reasonable and straightforward. I think that the circles are created when the objects are initiated and destroyed at the end of the block where they're created. We define `get_radius` and `set_radius` methods because we have `radius` as a variable in the class, so we can't just edit it from the main `test` program.

### Using make_test_Circle, compile and link test_Circle.cpp with the class files. Run it and note where the circles are created and destroyed. Do you understand why they are destroyed in this order?

As suspected, the circles are destroyed based on whose code block ends first. Since circle 1 is created in a code block that contains circle 2's creation in it, circle 1 is alive to see the creation and destruction of circle 2.

### Add a method to Circle.cpp (and Circle.h!) so that we can get the circumfrence from my_circle.circumfrence(). Try it out in test_Circle.cpp. Did you succeed?

I did. It'll show up in running `test_Circle.x`.

### Take a look at the `private_vs_public.cpp` code, which is a self-contained class and main program. Notice how the main program can access and change the x value and use the xsq function. But try changing from x to y in the statements getting, printing, and changing the value of x. What happens? Why does the `get_y` function work?

The `get_y` function works because we're not modifying the private variable. It's like a shop display: look but don't touch. This is why we get an error when we try to set a new value for the y variable.

### (Extra, only do this if you are fast.) Make a Sphere class with Sphere.cpp and Sphere.h, and try it out by adding to test_Circle.cpp to create a Sphere and print out its radius. Did you succeed?

I did, nearly forgot to edit the makefile though.

## Optimization 101: Squaring a Number

### Compile square_test.cpp (using make_square_test) and run it. Adjust "repeat" if the minimum time is too small. Record the times here. Which way to square x is more efficient?

```
 Evaluating 100000000 pow(x,2)'s took 2.19099 seconds

 Evaluating 100000000 x*x's took 0.217733 seconds
```
Just computing `x*x` is more efficient.

### Add to `square_test.cpp` a function:
`double squareit (double x)`
### that returns `x*x`. Add a section to the code that times how long this takes (just copy one of the other timing sections and edit it appropriately, making sure to keep the "final y" cout statement). How does it compare to the others? What is the "overhead" in calling a function (that is, how much extra time does it take)? When is the overhead worthwhile?

The function takes 0.352289 seconds, slower than just `x*x` but still way faster than `pow`. I think that if there are plenty of longer expressions to square, having a function like this will significantly improve the readability at the cost of very small fractions of a second when it comes to execution time, so I think it's generally worth it unless squared expressions are very simple.

### Another alternative, common from C programming: use #define to define a macro that squares a number. Add
`define sqr(z) ((z)*(z))`
###somewhere before the start of main. (The extra ()'s are safeguards against unexpected behavior; always include them!) Add a section to the code to time how long this macro takes; what do you find?

The macro is actually the fastest consistently - 0.216503 seconds or something differing only in the 4th decimal point.

### One final alternative: add an "inline" function called square:
`inline double square (double x) { return (x*x); };`
### that is a function prototype and the function itself. Put it up top with the squareit prototype. Add a section to the code to time how long this function takes. What is your conclusion about which of these methods to use?

The inline function took pretty much the same time as the `squareit` function, slightly longer in the 4th decimal place.

I think overall I'd still just use the macro.

### Finally, we'll try the simplest way to optimize a code: let the compiler do it for you! Change the compile flag -O0 (no optimization) to -O2 (that's the uppercase letter O, not a zero). Recompile and run the code. How do the times for each operation compare to the times before you optimized? What do you conclude?

The times all dropped by 5 orders of magnitude. With the flag, `squareit` looks the fastest at 1e-06s, so I'd use that.

## GSL Differential Equation Solver

### Use gnuplot to make phase-space plots of all three cases on a single plot, noting where they begin and end. Sketch it and describe what you observe. This is called an isolated attractor.

![](https://github.com/psharma117/PHY480-Computational-Physics/blob/main/session_09_10/phase-plot.png)

## GSL Interpolation Routines

### Start with the gsl_spline_test_class.cpp code (and corresponding makefile). Take a look at the printout and try running the code. Note that we've used a Spline class as a "wrapper" for the GSL functions, just as we did earlier with the Hamiltonian class. Compare the implementation to the example on the "Using GSL Interpolation Functions" handout. Questions?

I'm curious how the freeing of the spline object is handled in the class since there's no way to indicate to the class when the main program is done with it.

### Use the code to generate a cubic spline interpolation for the cross section from 0 to 200 MeV in steps of 5 MeV. Output this data and the exact results from equation (10.7) in the notes to a file for plotting with gnuplot and try it out. Plot the exact results "with lines" and the spline using "with linespoints" (or "w linesp"), so you can see both the individual points and the trends.
<<<<<<< HEAD

![](https://github.com/psharma117/PHY480-Computational-Physics/blob/main/session_09_10/cubic-spline.png)

### Now modify the Spline class to allow for a polynomial interpolation (see the GSL handout) and change the gsl_spline_test_class.cpp main program to generate linear and polynomial interpolations as well and add code to print the results to your output file. Did you succeed?

I did, I just had to add a test case to the class and then copy/paste the same line 3 times.

### Generate a graph with all three interpolations plotted along with the exact result. Comment here (a sketch might help) on the strengths and weaknesses of the different interpolation methods, both near the peak and globally.

![](https://github.com/psharma117/PHY480-Computational-Physics/blob/main/session_09_10/all-interpolations.png)

The cubic spline noticeably misses the value near the resonance point, while the polynomial and linear points seem to hit it. However, farther away, the cubic spline lies right on top of the predicted curve. 


## Command Line Mystery

###  The "Command Line Mystery" is a whodunit designed to give you some practice with useful shell commands and how to string them together (with "pipes"). Follow the instructions on the clmystery handout. Did you solve the mystery? 

I did, the perp was Jeremy Bowers.

## Python Scripts for C++ Programs

### Look at area_cmdline.cpp first and try it out (there is a makefile), first omitting an argument when executing it. Then look at and try run_area_cmdline1.py. Change the list of numbers to generate the area for radii from 5 to 25 spaced by 5. Did you succeed?

I did, after converting some outdated python 2.x syntax.

### Modify both area_cmdline.cpp so that it takes two arguments, the radius and an integer called again. Change the code so the output line is repeated again times. Modify run_area_cmdline1.py so it works with this new version. Did you succeed?

I did. 

### Try out run_area_cmdline2.py, modifying value_list1 and value_list2 to help you understand how they work. Questions? [Note: this might fail on Cygwin]

Nope, very straightforward.

## Cubic Splining

### Your task is to determine how many (equally spaced) points to use to represent the wave function. Suppose you need the derivative of the wave function to be accurate to one part in 10^6 for 1 < r < 4 (absolute, not relative error) Devise (and carry out!) a plan that will tell you the spacing and the number of points needed to reach this goals. What did you do?




=======
>>>>>>> 4490f93670f0804a6cbdeff45669f62bcf6f962a
