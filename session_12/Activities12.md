## grade: check +
## Random Number Generation

### Look at the gaussian_random.cpp code (there is a printout) and identify where the random number generators are allocated, seeded, and called. If you were creating a RandomNumber class, what statement(s) would you put in the constructor and destructor? What private variables would you define?

I'd put statements to allocate and seed the random number generator from the GSL library. I'd probably set the seed as a private variable.

### Devise and carry out a way to use gnuplot to roughly check that the random numbers are uniformly distributed. [Hint: Read the notes. Your eye is a good judge of nonuniformity in two dimensions.] What did you do?

I simply plotted the first two columns as x-y coordinates and viewed the resultant plot, finding indeed that the points look uniformly distributed.

![](https://github.com/psharma117/PHY480-Computational-Physics/blob/main/session_12/uniform-rng.png)

### You can check the distributions more quantitatively by making histograms of the random numbers. Think about how you would do that. Then take a look at gaussian_random_new.cpp, which has added crude histogramming (as well as automatic seeding). Use the makefile to compile and run with about 100,000 points. Look at random_histogram.dat. Use gnuplot to plot appropriate columns (with appropriate ranges of y) to check the uniform and gaussian distributions. Do they look random? In what way?

![](https://github.com/psharma117/PHY480-Computational-Physics/blob/main/session_12/uniform-histogram.png)|![](https://github.com/psharma117/PHY480-Computational-Physics/blob/main/session_12/gaussian-histogram.png)

### Run gaussian_random_new.plt to plot and fit the gaussian distributions with gnuplot. Try 1,000,000 points and 10,000 points. Do you reproduce the parameters of the gaussian distribution? (You may need to set b to a reasonable starting point such as the approximate peak height to get a useful fit.)

I reproduced the parameters of the gaussian distribution for 10^5 points, 10^6 wasn't able to reproduce the parameters without adjusting b as suggested.

## Random Walking

### What is the rms step length? (Note: this is tricky!)

The rms step length with our parameters should be 2, since <dx^2 + dy^2> = <r^2> = 4, and rms step length is then sqrt(4) = 2.

### Plot the random walk (stored in "random_walk.dat") using gnuplot (use "with lines" to connect the points). Repeat a couple of times to get some intuition for what the walks look like.

![](https://github.com/psharma117/PHY480-Computational-Physics/blob/main/session_12/random-walk.png)

### Check (using an editor) for the endpoints of a few walks. Roughly how does a typical distance R from the origin scale with N? (Can you reproduce the derivation from the notes of how the average of R scales with N?)

I found that with N = 6400, the distance between start and end points was 163.6, for N=3200 it was 121.65, for N=1600 it was 49.6, and for 400 it was 3.98. The expected scaling law of sqrt(N) doesn't fit quite right here, but I attribute this to randomness. If I were to compute the average distance over multiple runs for each N value I'd recover the sqrt(N) behavior.

### Now we'll study more systematically how the final distance from the origin R = sqrt(x_final^2 + y_final^2) scales with the number of steps N. Note that now we don't need to save anything from a run except the value of R. The value of R will fluctuate from run to run, so for each N we want to average over a number of trials. How many trials should you use?

I'll probably use 1000 trials per N value.

###  Edit the code to make multiple runs for each value of N and takes the average of R. Make (and sketch) an appropriate plot that reveals the dependence of R on N. [The code random_walk_length.cpp and plot file random_walk_length.plt implement this task. Try it yourself before looking at those.] Does it agree with expectations?

I see very good agreement with expected behavior:
![](https://github.com/psharma117/PHY480-Computational-Physics/blob/main/session_12/total_R.png)

## Monte Carlo Integration: Uniform and Gaussian Sampling
### Look at mc_integration.cpp to see how this is implemented for our test integral. Because the integral has infinite limits, we approximate it with finite lower and upper limits. How would you choose these?

I'd keep increasing the bounds till my value from the integral stops changing appreciably when I change my bounds.

### The dimension is initially set to D=1 (called dim in the code). Compile it with make_mc_integration and run it several times. After each run, use mc_integration.plt to make a fitted plot of the error. What do you observe?

I see that the error generally falls off like 1/sqrt(N) with some error.

### Next try changing the dimension to 3 and then to 10, repeating the last part. What do you observe? Is it consistent with the notes?

The 3D case is just like the 1D case, but the 10D case seems to change, error goes like N^-0.25 on average instead of -0.5. I'm puzzled as to why this would be, as the scaling should be the same for any dimension. Doing more testing, this starts at D=7.

## Monte Carlo Integration: GSL Routines
### The initial integral is not a great test. After compiling and running the program, change the integrand to something more interesting (use your imagination!). Don't worry about knowing the exact answer; compare the results from the different routines. What do you find?

The vegas algorithm takes time to converge but it seems to zero in on the right answer with greater precision.

## C++ Class for a Random Walk
### Compare the old and new code (you have printouts of each). Discuss with your partner the advantages (and any disadvantages) of the definition of RandomWalk as a class. List some.

The class definition makes it far easier to run different tests changing different parameters without having to significantly alter the main code. It is harder to see what's going on in the code overall now, and I'm sure if we were doing huge runs we'd notice the extra overhead of the class, but for the scale we're working with it's not really an issue.  

### An advantage of programming with classes is the ease of extending or generalizing a code. List two ways to extend the class definition.

The class definition can be extended to include variable lower and upper limits and the option for a custom seed.
