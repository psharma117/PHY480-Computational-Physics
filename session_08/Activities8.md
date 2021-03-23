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

Undamped			|Underdamped
:------------------:|:-----------------:
![](https://github.com/psharma117/PHY480-Computational-Physics/tree/main/session_08/pendulum_00.png)|![](https://github.com/psharma117/PHY480-Computational-Physics/tree/main/session_08/pendulum_02.png)


