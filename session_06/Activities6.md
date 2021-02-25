## Wrapping GSL Functions: eigen_tridiagonal_class
### Look at the eigen_tridiagonal_class.cpp printout and compare to the eigen_tridiagonal.cpp printout from Session 5. If this is your first (real) exposure to a C++ class (or if you forget what you used to know), there will be confusing aspects. Look at the motivation in the Session 6 notes. A detailed guide to the implementation will be given in the Session 7 notes. For now, identify what has happened to each of the GSL function calls. In what ways is the new version better?

The new version of the code does not include any of the unnecessary details of allocating memory for the Hamiltonian, or any of the GSL calls in general. The code is now significantly more readable and easier to alter methods for. It's also easy to iterate over to test things like dependence on Rmax, as previously the GSL allocation/freeing statements made things irritating. 

### Verify that the code still works. Try adding a loop over the matrix dimension N. Does it work?

The code still works with and without the loop. Eigenvalues are the same as they were last week. 

### (Bonus) What additional functions might you define in the Hamiltonian class? What other classes might you define?

I think I would define separate functions to return eigenvalues and eigenvectors, perhaps with an optional argument `n` that specifies which eigenvalue/eigenvector to return. 

## Introduction to Parallel Processing with OpenMP
### Your computer almost certainly has multiple cores. How many cores are there (hint: Google is your friend if it's not immediately clear how to get this information from your computer.)?

My CPU has 4 cores, 8 threads with multithreading. 

### Look at the program `simpson_cosint_openmp.cpp` in an editor or in the printed copy. The key openmp features are the omp include statement and the #pragma omp statement, which is an instruction to the compiler. What part of the program is executed in parallel?

The integration for different values of `k` is done in parallel. 

### Let's compare using one and two threads. There is a built-in timer in the program, but run the program with time ./simpson_cosint_openmp, which will automatically print some timing info on the cpu time and the wall time after you run the program. Compile the program with g++ following the instructions in the comments, and then run it. Record the "num_time", the CPU time, and the wall time. (In tcsh, these are the first and third numbers; in bash, these are the second and first numbers.) 

With 2 threads, `num_time` is 2.54663s, CPU time is 5.007s, wall time is 2.575s

### Then change from two threads to one thread by modifying the omp_set_num_threads command in the code, recompile it, and re-run. Record the numbers again. Why do you think the CPU time is about the same but the wall time differs? Is the parallelization working?

With 1 thread, `num_time` is 5.01302s, CPU time is 5.015s, wall time is 5.058s

I think CPU time is about the same because it's not actual time, it's like "man-hours" in that it's a measure of how much time a single core would take to perform a task, but it reduces to a lower actual time spent if there are more cores. This means that parallelization is working.

### Now try to use all the cores you can. How well does the program scale? (E.g., compare (num_time for 1 core)/(num_time for n cores) to n.) Why is it not perfect scaling?

With 8 threads, `num_time` is 0.846712, CPU time is 6.392, wall time is 0.877s

The ratio `num_time2/num_time1` (these aren't variables I added, just my shorthand for the calculation) is 0.508, while the ratio `num_time8/num_time2` is 0.332. The first ratio is close enough to the expectation of 0.5, but the second is fairly far off. I think scaling isn't quite right because the CPU can't be completely given over to the calculation, it's also busy processing everything else that's going on in the background on my machine, such as background processes for the OS to function and applications like the Zoom call. 

