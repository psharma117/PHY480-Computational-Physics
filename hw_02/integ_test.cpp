//  file: integ_test.cpp
/*
  I chose an integrand that reduces to the previous decaying exponential via u-subtitution, not that any of these algorithms will know that. I see the Milne rule has much smaller error for the same number of points. Based on the initial plot, I didn't bother fitting the gsl routine's output because it's a fixed error every time, but the other two algorithms clearly follow a power law since on a log-log plot there are clear linear regions in the plot of relative error vs number of points. Fitting these to straight lines, I see the predicted h^4 error for Simpson's rule, and I see a power of 6.5 for Milne's rule. The non-integer power law is surprising but the fit returns it with very low error, and I see strong agreement on the plot. 
Because of the much smaller error that it follows, Milne's rule succumbs to roundoff error first around the mid 200s of points. On the other hand, Simpson's rule takes around 3500 points to start showing signs of roundoff error at around the same level of accuracy. 

Looking at the plot and seeing where the error changes directions, I estimate that it's around 2.25 on the x-axis which translates to 177 points as the ideal number of points (staying with the constraint that the number of points is 4n+1). This makes sense analytically, as h is of order 1/N, and so if error goes like h^6.5 then since h is smaller than 10^-2, this puts the error below 10^-13. Actually computing this number, I find it's actually 10^-15. Then, since these integration rules always have some coefficient of order less than 1 (in our case the fit tells us that it's 0.35019 to some degree of precision), we find the error around 10^-16 which is the order of machine precision, right when roundoff errors rear their ugly heads. 
*/

#include <iostream>
#include <iomanip>
#include <fstream>	//output to files
#include <cmath>	//math functions
using namespace std;

#include "integ_routines.h"	

//prototypes for integrands 
//gsl wants a void pointer even if it's not used, so it gets its own function
double my_integrand (double x);
double gsl_integrand (double x, void *);

//declaring math constants
const double ME = exp(1.);	
const double PI = 4.*atan(1.);	

int main (){
	const int max_intervals = 3000;	
	const double lower = 0.0;	
	const double upper = 0.5*PI;	

	const double actual = 1. - 1. / ME;	
	double integral = 0.;  

	ofstream out ("integ_test.dat");	
	out << "#  N   Simpsons      Milne        qags  \n" << endl;

	//cout << "exact = " << actual << "\n";
	
	//milne takes 4N + 1 points so I start at 5 points and move up in steps of 4. 
	for (int N = 5; N <= max_intervals; N += 4){
		//cout << "N = " << setw(2) << N << "  ";
		out << scientific <<  setw(4) << log10(N);

		integral = simpsons_rule (N, lower, upper, &my_integrand);
		//cout << "simpson: " << setprecision(6) << integral << "  ";
		out << "  " << scientific << log10(fabs (integral - actual)/actual);

		integral = milne_rule (N, lower, upper, &my_integrand);
		//cout << "milne: " << setprecision(6) << integral << "  ";
		out << "  " << scientific << log10(fabs (integral - actual)/actual);

		integral = gsl_qags (lower, upper, &gsl_integrand);
		//cout << "gsl qags : " << setprecision(6) << integral << "\n";
		out << "  " << scientific << log10(fabs (integral - actual)/actual);

		out << endl;
	}

	cout << "done, see integ_test.dat\n";
	out.close ();

	return (0);
}

double my_integrand (double x){
  return exp(-sin(x))*cos(x);
}

double gsl_integrand (double x, void *){
  return exp(-sin(x))*cos(x);
}
