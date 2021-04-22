## Overview: Simulation of 2D Ising Model [HTML5 version]
### What are the characteristics of the system? Are there any large areas of all blue or all yellow? How large is the magnetization per spin (roughly)? Is it constant?

There are no large areas of all blue or yellow since the temperature is so high (washing out the coupling energy). The magnetization per spin is basically 0 but it fluctuates rapidly as the Markov Chain progresses.

###  Does it always end up in a uniform ferromagnetic state? If not, why not? Estimate the magnetization per spin in each case. 

The system does always end up uniform, though it can sometimes take a while if a domain wall is formed as they take much longer to break. When the system is uniform, the magnetization per spin is trivially 1 or -1. When there are still domain walls, I'd estimate it to be around 0.4-0.6, but this is just a transient state. 

### Characterize the behavior of the system as it heats through the critical temperature to high temperature. What happens at 2.27 (restart the page to get there exactly)? Make a sketch of the magnetization as a function of temperature. 

At higher temperatures, we see short range, rapid fluctuations. These start to calm down as we cool, and below the critical point we see longer range correlations. The magnetization goes from being pretty much 0 to having some noticeable nonzero total value. As we cool to the minimum temperature, we see the system start to homogenize and become one (or sometimes temporarily two) big patch.

### What differences do you observe in the size of the fluctuations and the behavior of the magnetization?

The size of the fluctuations gets smaller with high temperatures as the spacing between sites has effectively reduced. Near the critical point, changing the size of the lattice doesn't really change much about the magnetization. 

## Monte Carlo Sampling
### How does the "J" in the Ising model determine whether we will have a ferromagnet or an anti-ferromagnet? Which choice does the code start with? What does the ground state (lowest energy state) of a ferromagnet look like?

The sign of J determines whether a material will be ferromagnetic or anti-ferromagnetic: positive J will be ferromagnetic and negative J will be anti-ferromagnetic (assuming the Hamiltonian goes like `-J\sigma_i\sigma_j`). 

### How would you add an external magnetic field H_ext to the code? [See Eq.(13.6) in the notes for the Hamiltonian.] 

The magnetic field as shown in the notes is uniform over space, so I could just sum over every site on the lattice and multiply the end result by some `double mag_field`.

### How many total "microstates" are there for a 1-D Ising model with the number of sites in the code? (I.e., how many possible "configurations" of spins are there?) If calculating the energy of each configuration takes the same amount of time, how much longer would it take to calculate a lattice with twice the number of sites? 

There are 20 sites in the code and each site can have 2 possible spin values so there are 2^20 total microstates. To double the number of sites is equivalent to multiplying the number of sites by 2^20, so we square our time taken.

### Given a number of lattice sites, what are the values of the minimum and maximum energies? How many different energy values are possible? (Hint: You can't get every integer energy between the minimum and maximum.) 

The minimum energy is the energy of the state when the spins are all aligned and the max energy is when the spins look like a checkerboard. There are 4 nearest neighbors per site so there are N edges per site (4N nearest neighbours, divided by 4 to fix double counting). Then the smallest energy is -NJ and the largest energy is NJ.

### What are the boundary conditions for the line of spins? Find where it is used in the code. What other set of boundary conditions could be used?

The spins obey periodic boundary conditions, this is all effectively on a torus. We could have also used anti-periodic boundary conditions, or simply allowed the end spins to have fewer nearest neighbors. 

### Find the calculation of the exact partition function in the code. How is this equal to the same result as (2.1.5) in the Binder/Heerman notes? [Hint: You can add exp(-Ei/kT) for each spin configuration separately, or group all those with the same energy together and multiply by how many have that energy.] 

Each individual microstate contributes to the partition function in principle, however the weighting of each state is the Boltzmann factor that depends on the total energy of each configuration. There are several microstates that yield the same energy, for example: I can have the whole lattice aligned barring one spin, and I get the same energy no matter which particular spin I choose. Then, I may as well just sum over all possible energies and multiply the corresponding boltzmann factor by the *multiplicity* of the energy state (number of microstates that yield the energy) which is precisely what's being done in the code. 

###  Can you explain how the complete set of configurations are constructed in the code using the "next_configuration" function? 

The function is given a configuration and an initial starting point. If the spin starts down, it's flipped to up and the program moves on. If the spin starts up, it's flipped to down and every subsequent spin is put through the same process.

### Compile and link sampling_test.cpp (using make_sampling_test) and run it to see what the output looks like. Did you get the correct answer above for the number of configurations and the possible energies? (If not, rethink!) 

I did get the correct answers above.

### Generate and sketch a gnuplot graph of the probability of energy E [called P(E)] vs. the energy (this is what is output to the screen) for kT = 10. and kT = 1.

[]!()

### Why is the distribution for ordinary random sampling centered at E=0? Based on this distribution, what kind of temperature does ordinary random sampling correspond to? [Hint: What Boltzmann factor would result in a distribution like this?]

The random sampled distribution is centered at 0 because there are far more microstates that yield 0 energy than other energies. Ordinary random sampling like this corresponds to high temperature which makes sense: low temperatures suppress states as they get further from the ground state while high temperatures allow more variation in configurations and the distribution follows multiplicity instead.

### Compare the exact P(E) for a canonical distribution to those of random sampling and the Metropolis algorithm. Will the Metropolis algorithm be effective in doing importance sampling (which concentrates points where the integrand is large)? Why will the random sampling be a problem for evaluating thermal averages [see figure 2.3 and the discussion after equation (2.1.33) in Biner/Heermann]? 

Yes, the distribution from the metropolis algorithm lies right on top of the exact (canonical) distribution in both cases. Random sampling isn't ideal for evaluating thermal averages because it's picking from every single state instead of focusing on states that are most probable at the given temperature. 


### Verify that the transition probabilities in (2.1.39a) and (2.1.39b) both satisfy the condition (2.1.38). Which one is implemented in the code? Bonus: Switch to the other and check that it works. 

The second equation is implemented in the code, (2.1.39b)

###  How do you calculate the average energy at a given temperature? Modify the code to calculate the average energy at kT = 1. and kT = 10. using the Metropolis sampling methods and compare to the exact average energy (according to the canonical Boltzmann distribution). 

The average energy at a given temperature is given by equation 13.9 in the notes with A(E) = E. 
I just sum E multiplied by the relevant Boltzmann factor and multiplicity and divide by the partition function. With the way the code is set up, most of this is already taken care of for me.

At kT = 1, 
`Exact average: -15.2792 Metropolis average: -15.2709`

At kT = 10, 
`Exact average: -1.99336 Metropolis average: -1.9996`

## The 2D Ising Model

### Take a look at ising_model.cpp and note that one can switch between the one-d and two-d Ising models by commenting and uncommenting some lines. The default is the two-d model. What are the differences between the one-d and two-d versions? 

The calculation for the 2D version is simply repeated an extra time with the `linear_sites` variable. Otherwise, things look pretty much the same as the implementation of the 1D case here, periodic BCs and all.

### Equilibration. Compile and link ising_model.cpp (use make_ising_model) and run for several temperatures.

###    Make a gnuplot graph (and sketch it here) of the energy vs. time for kT = 2.0, 1.0, and 0.5 (all on the same graph, so rename your files appropriately). Run repeatedly at kT = 1.0 until you see that you don't always get the same answer at large times. What does this mean?

[]!()

At large times for T = 1, I think we're near enough to the critical point for fluctuations to have significant impact, so we can get different behaviors.

### Look at the small time region. How long does it take at each temperature to reach "equilibrium"? If you were going to use the configurations generated here to calculate thermal averages, would you want to use the configurations at the beginning? How can you deal with this? 

For T = 0.5, it takes about 200 s for everything to roughly equilibrate. For T = 1, it takes closer to 50 seconds, and for T = 2, it also takes around 50 seconds. I'd want to use equilibrium values to take thermal averages, and I'd probably deal with that here by looking at relative variation over some number of iterations.o

### Modify the code to change it from ferromagnetic to anti-ferromagnetic (only one line needs to be changed!). What did you change? 

I just changed the sign of the coupling.

### Cooling. At present, the code starts from a random configuration. Modify the code to implement "cooling" by looping through temperatures kT = 2.0, 1.0, then 0.5 but start the simulation at each successive temperature using the final configuration of the higher temperature as the initial configuration of the lower temperature. Generate a gnuplot graph of the energy vs. time for each of the temperatures (and sketch it here) and compare to your previous results. Conclusions? 

[]!()
These 3 temperatures pass through the critical temperature, so energy changes noticeably as we cool the system.
At 2.0 the energy will be about 0 as it's above the critical point so there's no real preferred direction for the spins to be aligned in.
As we lower to 0.5, we get spin patches which start adding together to actually give nonzero negative total energy.

### The current approach compares energies of new and old configurations by calculating the full energy of each and subtracting. Can you devise a (much) more efficient approach? (You don't need to implement it here.) 

We can compute the energy contributions just from the site that was picked and the energy change from just that site.

### Modify the optimized code `ising_opt.cpp` to calculate the absolute value of the magnetization of the system (with linear size L=5) for various temperatures. Starting at kT=4.0, cool down the system by Delta kT =0.2 until kT=1.0. What do you observe about the behavior of magnetization? (Make a plot in gnuplot and sketch it here) 

The magnetization is about 0 until we get to lower temperatures where it starts to gain some nonzero value.

### When we calculate the magnetization, we use the absolute value of it, why? It may help to look at the time dependence of the magnetization around kT=2 with size L=5 or less. [Bonus: Can you explain your observation in terms of "spontaneous symmetry breaking"?] Will this problem get better or worse when you increase the system size? [Hint: Would it be possible for an infinite system to change from a state with all up spins to one with all down spins?]

The absolute value is because past the critical point, the system loses its time reversal symmetry, as the system without an external field simply wants spins to be aligned, but they can either be aligned up or down, which results in the same magnetization up to a sign. The magnetization can't change at low temperatures from one sign to another, and this gets worse with larger lattice size, so we calculate the absolute value of the magnetization to allow for the case where the spins go all downwards with respect to our definition of up.



