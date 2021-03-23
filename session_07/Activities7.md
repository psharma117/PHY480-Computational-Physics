## Grade: Check + (see expanded explanation for the p=3 search for resonance)
I did finish the first order RK in session 6, so I move on to the start of this week's activities.

## More on C++ Classes: `eigen_basis_class`

### Take a look at the eigen_basis_class.cpp printout and note how the Hamiltonian class is re-used without modification. (If you haven't done so yet, read the discussion of this class in the Session 7 notes.) The only tricky change is that matrix indices go from 1 to dimension rather than from 0 to dimension-1. What parts of the Hamiltonian class implementation do you not yet understand?

The implementation of the Hamiltonian class feels pretty clear, I'm still kind of fuzzy on how the gsl routine works under the hood, but that's not really a feature of this class implementation, just my own discomfort at not knowing what's behind the curtain.

### The potential is another good candidate for a class. We'd like to just evaluate the potential at r without having to use constructions like the switch statement in the Hij_integrand function with all the messy void parameters. (Think about how awkward and prone to error it is to add another potential.) What would you like the declaration statement for the Potential class to look like? What method(s) would you like the class to have?

I think I'd like the potential declaration statement to go like
```cpp
Potential my_potential;
my_potential.set_harmonic_oscillator();
```
with call statements like
```cpp
v = my_potential.get_value(r);
```

So I'd use methods to set the functional profile of the potential, and I'd have a method to extract the value of the potential given an input r value.

### Give at least one example of an additional class that would be useful to define.

A class that wraps up all the solution material for the system could be nice, with methods like

```cpp
solutions.get_eigvec(n);
solutions.get_eigval(n);
```
with further functionality to plot energies/eigenstates using GNUplot or Matplotlib with a system call to an external file/script.

## Driven Nonlinear Oscillations

### Use make_diffeq_oscillations to create diffeq_oscillations. This code outputs to the file diffeq_oscillations.dat five columns of data: t, x(t), v(t), kinetic energy, and potential energy. There are four gnuplot plot files provided (diffeq_oscillations1.plt, etc.), each of which generates a different type of plot. Run diffeq_oscillations with the default values (enter "0" when it says "What do you want to change?") to calculate a data set. Start gnuplot and "load diffeq_oscillations1.plt" and then "load diffeq_oscillations2.plt". (Once you've given these commands once, you can use just use the arrows to go back and forth.) Briefly, what do each of these plots show?

The first plot shows the straightforward plot of position vs time of the particle as it oscillates. The second shows the phase space chart (x vs v) of the oscillation - a closed ellipse as expected.

### It's always a question whether or not you have coded a problem correctly, so you should always seek ways to check your results. One possibility is if we have a known solution. This works for p=2 (simple harmonic oscillator). What about other p? Another check is to identify a quantity that shouldn't change with time. Create a plot of such a quantity (you'll want to increase `t_end`) and observe the effect of changing the step size h to a larger value [e.g., try 10 and 100 times larger]. How do you decide on a reasonable h to use?

I tried using h = 0.1, 0.01, 0.001, 0.0001, 0.00001. I found that energies varied on the order of 10^-2, 10^-7, 10^-12, 10^-14, and 10^-14 for each of these respective values. I'll pick the value that gives me the smallest energy variation without taking an unreasonable amount of time to run, so 0.0001.

### Verify that different amplitudes (e.g., different initial conditions determined by x0 and v0) lead to different periods for an anharmonic oscillator (p<2 or p>2). [Hint: You might find the "append" option useful.] Can you identify a qualitative rule? E.g., does larger amplitude mean shorter or longer period always? Try to explain the rule?

Increasing the amplitude seems to decrease the period for p = 4. I ran the code for initial amplitudes of 1, 2, and 4 and found that the period halved each time from the previous case, so I'd roughly expect that the period goes like 1/amplitude for this potential. Physically, I'd justify this to myself by noting that the quartic potential is quite steep compared to the quadratic potential, so the particle feels a much greater restoring force for a given increase in amplitude.

### Go back to the original parameters (quit the program and start it again), which has p=2. Now add a driving force f_ext=10 with w_ext=1 and look at the time dependence and phase-space plots. Then increase w_ext to 3.14 and then to w_ext=6.28. What are you observing? Now repeat with p=3 (starting with f=0). Can you find resonant behavior?

I am observing a resonance at the final w_ext = 2pi, as expected. There is no resonance for p = 3 because there's no oscillatory behavior from the potential on its own. In fact, the only thing keeping the motion from going unbounded is the driving force periodically changing signs.

Right. You can think of it as follows. For p=2, when F_ext is tuned to the
natural frequency, each cycle it "hits" the oscillator in phase since
the period/amplitude are independent. But for p=3, the period of Oscillation DOES depend on the amplitude. So as the amplitude begins to grow from the
initial "hits" of the external force, the period changes and the F_ext is
no longer in phase. No resonance.

### Introduce the damping parameter "b" into the code. Did it work?

My case statement and menu item work, though the menu item doesn't quite fit with the nice justification of the items that was there previously. The initial value of 0 is correctly implemented - not changing the default parameters results in a standard harmonic oscillator plot.

### Modify the "rhs" routine to include damping (you're on your own here!). What did you add?

I added `-b*y[1]` to the equation modifying `y[1]` before dividing by the mass in all 3 cases.

### Identify the three regimes described in the Session 7 notes: underdamped, critically damped, and overdamped.

![oscillator plots](https://github.com/psharma117/PHY480-Computational-Physics/blob/main/session_07/oscillator-regimes.png)
