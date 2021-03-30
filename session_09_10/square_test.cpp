//  file: square_test.cpp
// 
//  Program to explore the "cost" of squaring numbers different
//   ways in C++
//
//  Programmer:  Dick Furnstahl  furnstahl.1@osu.edu
//  Notes:
//   * Uses two consectutive calls to "gettimeofday" to time the calculations.
//      The #include <sys/time.h> statement is required.
//
//  To do:
//
//******************************************************************

// include files
#include <iostream>     
#include <iomanip>      
#include <fstream>      
#include <cmath>
using namespace std;    

#include <sys/time.h>               // clock functions

double elapsed (timeval start, timeval stop);
double squareit(double x);
inline double square(double x) {return (x*x);};

#define sqr(z) ((z)*(z))
int main (void){
	timeval start, stop;       // start and stop times 
	int repeat = 100000000;    // # of times to repeat operation
	double x, y;               // test variables

	// square two numbers using the pow function 
	gettimeofday (&start, NULL);     // start the clock to time the next section 
	for (int i = 0; i < repeat; i++){
		x = double(i);
		y = pow (x, 2); 
	}
	cout << "final y = " << y << endl;  // prevent optimizing away loop
	gettimeofday (&stop, NULL);      // stop the clock and print elapsed time 
	cout << " Evaluating " << repeat << " pow(x,2)'s took "
		<< elapsed (start, stop) << " seconds" << endl << endl;

	// square two numbers by multiplying them together 
	gettimeofday (&start, NULL);     // start the clock to time the next section 
	for (int i = 0; i < repeat; i++){
		x = double(i);
		y = x * x;
	}
	cout << "final y = " << y << endl;  // prevent optimizing away loop
	gettimeofday (&stop, NULL);      // stop the clock and print elapsed time 
	cout << " Evaluating " << repeat << " x*x's took "
		<< elapsed (start, stop) << " seconds" << endl << endl;

	gettimeofday (&start, NULL);     // start the clock to time the next section 
	for (int i = 0; i < repeat; i++){
		x = double(i);
		y = squareit(x);
	}
	cout << "final y = " << y << endl;  // prevent optimizing away loop
	gettimeofday (&stop, NULL);      // stop the clock and print elapsed time 
	cout << " Evaluating " << repeat << " squareit(x)'s took "
		<< elapsed (start, stop) << " seconds" << endl << endl;

	gettimeofday (&start, NULL);     // start the clock to time the next section 
	for (int i = 0; i < repeat; i++){
		x = double(i);
		y = sqr(x);
	}
	cout << "final y = " << y << endl;  // prevent optimizing away loop
	gettimeofday (&stop, NULL);      // stop the clock and print elapsed time 
	cout << " Evaluating " << repeat << " sqr(x)'s took "
		<< elapsed (start, stop) << " seconds" << endl << endl;

	gettimeofday (&start, NULL);     // start the clock to time the next section 
	for (int i = 0; i < repeat; i++){
		x = double(i);
		y = square(x);
	}
	cout << "final y = " << y << endl;  // prevent optimizing away loop
	gettimeofday (&stop, NULL);      // stop the clock and print elapsed time 
	cout << " Evaluating " << repeat << " square(x)'s took "
		<< elapsed (start, stop) << " seconds" << endl << endl;

	return (0);                  // successful completion 
}

//************************* elapsed *******************************
//
// Return the elapsed time between two calls to clock.
//
//  * requires #include <sys/time.h>
//  * gettimeofday (&start,NULL);   effectively starts the timer and
//    gettimeofday (&stop,NULL);     stops the timer (in a manner of speaking) 
//****************************************************************
double elapsed (timeval start, timeval stop){
	timeval result;
	timersub (&stop, &start, &result);
	return ( result.tv_sec + result.tv_usec/1000000.0 );
}

double squareit(double x){
	return x*x;
}

