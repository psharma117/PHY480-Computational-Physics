//  file: integ_routines.cpp

#include <cmath>
#include <gsl/gsl_integration.h>

double simpsons_rule ( int num_pts, double x_min, double x_max, double (*integrand) (double x) ){  
	double interval = ((x_max - x_min)/float(num_pts - 1));  // called h in notes
	double sum=  0.;  // initialize integration sum to zero		 
	for (int n=2; n<num_pts; n+=2){                // loop for odd points  
		double x = x_min + interval * float(n-1);
		sum += (4./3.)*interval * integrand(x);
	}
	for (int n=3; n<num_pts; n+=2){                // loop for even points  
		double x = x_min + interval * float(n-1);
		sum += (2./3.)*interval * integrand(x);
	}   
	sum +=  (interval/3.) * (integrand(x_min) + integrand(x_max));	

	return (sum);
}  

double milne_rule ( int num_pts, double x_min, double x_max, double (*integrand) (double x) ){  
	double interval = (x_max - x_min)/double(num_pts - 1);
	double sum = 0;
	for (int n = 1; n<num_pts; n+=2){
		double x = x_min + interval*double(n);
		sum += (64./45.)*interval*integrand(x);
	}
	for (int n = 2; n<num_pts - 1; n+=2){
		double x =x_min + interval*double(n);
		if(n%4 == 2) 
			sum += (24./45.)*interval*integrand(x);
		else 
			sum += (28./45.)*interval*integrand(x);
	}
	sum += (interval*14./45.)*(integrand(x_min) + integrand(x_max));
	return sum;
}

double gsl_qags (double x_min, double x_max, double (*integrand) (double x, void *)){
	gsl_integration_workspace *work_ptr = gsl_integration_workspace_alloc (1000);
	double abs_error = 1.0e-8; 
	double rel_error = 1.0e-8; 
	double result, error;
	
	gsl_function func;
	func.function = *integrand;

	gsl_integration_qags (&func, x_min, x_max, abs_error, rel_error, 1000, work_ptr, &result, &error);
	return result;
}

