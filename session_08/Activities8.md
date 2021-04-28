
## Grade: check +

## Strings and Things


### Modify the code so that there is a loop running from 0 to 3 with index variable j. For each j, open a file with a name that includes the current value of j. Write "This is file j", where "j" here is the current value, into each file and then close it. Did you succeed?

I did, the files are called `file_j.out`.

### Modify the code to input a double named alpha and open a filename with 3 digits of alpha as part of the name. (E.g., something like pendulum_alpha5.22_plot.dat if alpha = 5.21934.) Output something appropriate to the file. Did it work?

It did work, I used a few digits of pi and called my output file `hamiltonian_[alpha].dat`.

## Damped (Underiven) Pendulum

### Modify the code so that the output file includes two digits of the variable alpha in the name. Did you succeed?

I did, a file with the default value of 0.2 can be found in the directory.

###  Set f_ext=0 (no external driving force) and then do four runs with four values of alpha corresponding to undamped, underdamped, critically damped, and overdamped (convert from the conditions on b discussed in the background notes). What values of theta0 and alpha did you use?

I used theta0 = 0.05 in all cases. For alpha, I used 0, 0.2, 1, 2 for the respective cases.

Undamped, alpha = 0	|Underdamped, alpha = 0.2
:------------------:|:-----------------:
![](https://github.com/psharma117/PHY480-Computational-Physics/blob/main/session_08/pendulum_00.png)|![](https://github.com/psharma117/PHY480-Computational-Physics/blob/main/session_08/pendulum_02.png)
Critically damped, alpha = 1.0 | Overdamped, alpha = 2.0
![](https://github.com/psharma117/PHY480-Computational-Physics/blob/main/session_08/pendulum_10.png)|![](https://github.com/psharma117/PHY480-Computational-Physics/blob/main/session_08/pendulum_20.png)

## Damped, Driven Pendulum

### Restart the program so that we use the defaults. There is both damping and an external driving force, with frequency w_ext = 0.689. The initial plot is from t=0 to t=100. Run it. The green points are plotted once every period of the external force. What good are they?

The green points indicate when the period becomes stable, aka when the transients die out and the driving force wins. This happens when they start to lie on top of each other.

### Note that it seems to settle down to a periodic orbit after a while. Plot ("by hand" with gnuplot) theta vs. t from the output file diffeq_pendulum.dat and see how long it takes to become periodic.

It takes about 35s to become periodic.
![](https://github.com/psharma117/PHY480-Computational-Physics/blob/main/session_08/pendulum_theta_t.png)

### Run the code again with "plot_start" set to the time you just found. Have you gotten rid of the transients? What is the frequency of the asymptotic theta(t)?

From looking at both the automatic phase space plot and the theta(t) plot, I can see that I'm right at the end of the transients. There's a slight wobble but it's clearly at fairly periodic behavior now. The period is just shy of 10 so I'll guess it's 9. I validated this by noting that 2pi/9 = 0.698 which is precisely the given angular frequency in the code, so the linear frequency is going to be 1/9.

![](https://github.com/psharma117/PHY480-Computational-Physics/blob/main/session_08/pendulum_asymptotic.png)

## Looking for Chaos

###  Can you tell how many "periods" the limit cycles have from the graphs? How might you identify whether a function of time f(t) is built from one, two, three, ... frequencies?

The first blank option (0.2, 0.52, 0.689, -0.8, 0.1234) had 2 "periods" as far as I can tell. The second blank option (0.2, 0.52, 0.694, 0.8, 0.8) had 2 periods as well. So did the final blank option (0.2, 0.52, 0.689, 0.8, 0.8)

### One characteristic of chaos is an "exponential sensitivity to initial conditions." For the last combination, vary the initial conditions very slightly (e.g., change x0 by 0.01 or 0.001); what happens?

Even changing by 0.0001 gives a completely different phase space trajectory eventually, though it starts out the same as before. This matches what I saw in my mechanics class: chaotic trajectories through phase space that start out close together will diverge from each other exponentially, so the differences between trajectories won't be apparent for very small times, but the amount that it changes continuously increases.
