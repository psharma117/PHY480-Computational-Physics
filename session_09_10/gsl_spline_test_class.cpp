//  file: gsl_spline_test_class.cpp
// 
//  Test program for the gsl spline routines using the Spline class
//
//  Programmer:  Dick Furnstahl  furnstahl.1@osu.edu
//
//  Notes:
//   * uses the GSL interpolation functions (see online documentation) 
//
//*****************************************************************
// include files
#include <iostream>    // cout and cin
#include <iomanip>     // manipulators like setprecision
#include <cmath>
#include <fstream>
#include <string>     // C++ strings                                 
using namespace std;    
#include "GslSpline.h"  // Header file for the GSL Spline class

inline double sqr (double z) {return z*z;}  // inline function for z^2
double breit_wigner(double E);

int main (void){
	const int NMAX = 9;   // maximum number of array points 

	double E_values[NMAX] = {0., 25., 50., 75., 100., 125., 150., 175., 200.};
	//double sigma_exp[NMAX] = {10.6, 16., 45., 85.5, 52.8, 19.9, 10.8, 8.25, 4.7};
	double sigma_th[NMAX] = {9.34, 17.9, 41.5, 83.5, 51.5, 21.5, 10.8, 6.29, 4.09};

	// Make the spline object
	string type = "cubic";
	Spline my_cubic_spline (E_values, sigma_th, NMAX, type);

	// Evaluate the spline and derivatives
	ofstream csout; 
	csout.open("cross_section_th.dat");
	csout << "E value " << "    " << "cross section" << "    " << "Breit Wigner" << "\n";
	for (double E = 5.; E<=200.; E+= 5.){
		csout << E << "    " << my_cubic_spline.y(E) << "    " << breit_wigner(E) << "\n";
	}
	/*
	 *double y = my_cubic_spline.y (x);
	 *double y_deriv = my_cubic_spline.yp (x);
	 *double y_deriv2 = my_cubic_spline.ypp (x);
	 */
	csout.close();
	return (0);      // successful completion 
}

double breit_wigner(double E){
	double sigma_0 = 63900.; //mb*MeV
	double E_r = 78.;		//MeV
	double gamma = 55.;		//MeV

	return sigma_0/(sqr(E - E_r) + sqr(0.5*gamma));
}
