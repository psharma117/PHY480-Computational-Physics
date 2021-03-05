//  file: diffeq_test.cpp
// 
//  Program to study the error in differential equation algorithms
//
//  Programmer:  Dick Furnstahl  furnstahl.1@osu.edu
//
//  Notes:
//   * As a convention (advocated in "Practical C++"), we'll append
//      "_ptr" to all pointers.
//
//********************************************************************

// include files
#include <iostream>		// note that .h is omitted
#include <iomanip>		// note that .h is omitted
#include <fstream>		// note that .h is omitted
using namespace std;		// we need this when .h is omitted
#include <cmath>
#include "diffeq_routines.h"	// diffeq routine prototypes

// function prototypes
double rhs (double t, double y[], int i, void *params_ptr);
double exact_answer (double t, void *params_ptr);

// structures
typedef struct{
	double alpha;
	double beta;
}
f_parameters;			// now we can define a structure of this type
				//   using the keyword "f_parameters" 

//************************** main program ****************************
int main (void) {
	void *params_ptr;		   // void pointer passed to functions 
	f_parameters funct_parameters;   // parameters for the function 

	const int N = 1;		// size of arrays of y functions
	double y_euler[N], y_rk4[N];	// arrays of y functions 

	funct_parameters.alpha = 1.;	// function parameter to be passed 
	funct_parameters.beta = 1.;	// function parameter to be passed
	params_ptr = &funct_parameters;	// structure to pass to function 

	y_euler[0] = 1.0;		// initial condition for y(t) 
	y_rk4[0] = 1.0;		// initial condition for y(t) 
/*
	ofstream out ("diffeq_test.dat");	// open the output file 
	out << "#      t           y_euler(t)         y_rk4(t)        y_exact(t) \n";
	out << scientific << setprecision (9)
		<< tmin << "  "
		<< y_euler[0] << "  "
		<< y_rk4[0] << "  " << exact_answer (tmin, params_ptr) << endl;

	double h0 = 0.1;		// initialize mesh spacing 
	for (double t = tmin; t <= tmax; t += h0){
		euler (N, t, y_euler, h0, rhs, params_ptr);	// Euler's algorithm 
		runge4 (N, t, y_rk4, h0, rhs, params_ptr);	        // 4th order R-K 
		out << scientific << setprecision (9)
			<< t + h0 << "  "
			<< y_euler[0] << "  "
			<< y_rk4[0] << "  " << exact_answer (t + h0, params_ptr) << endl;
	}
	cout << "data stored in diffeq_test.dat\n";
	out.close ();			// close the output file 
*/
	cout<<"starting\n";
	ofstream out ("diffeq_test.dat");
	double tmin = 0.0;
	double tmax = 0.1;
	//cout << "h               euler           rk4               exact_answer" << endl;
	out << "#      h                euler                   rk4                     exact \n";
	for (double h = 1e-9; h <= 1.; h*= 10){
		if(h >= 1e-5) tmax = 1.;
		cout << scientific << h << "  " << tmax << "\n";
		for (double t = tmin; t<=tmax; t += h){
			euler(N, t, y_euler, h, rhs, params_ptr);
			runge4(N, t, y_rk4, h, rhs, params_ptr);	
		}
		out << scientific << setprecision(16)
			<< h << "  "
			<< y_euler[0] << "  "
			<< y_rk4[0] << "  "
			<< exact_answer(tmax, params_ptr) << endl;
	}
	out.close();

	return (0);			// successful completion 
}


//************************** rhs ************************************
double rhs (double t, double y[], int i, void *params_ptr){
  double a = ((f_parameters *) params_ptr)->alpha;
  // double b = ((f_parameters *) params_ptr)->beta; 

	if (i == 0){
		return (-a * t * y[0]);
	}

  return (1);			// something's wrong if we get here 
}

//********************** exact_answer **************************
double exact_answer (double t, void *params_ptr){
	double a = ((f_parameters *) params_ptr)->alpha;
	double b = ((f_parameters *) params_ptr)->beta;

	return (b * exp (-a * t * t / 2.));
}
