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


