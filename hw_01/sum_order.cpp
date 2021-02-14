/*
The plot indicates that initially there's one way of doing the sum that's always better (otherwise we'd see the abs value version of a sign change), and through experience from this course I'd venture that the sum down term formula is more accurate. 

There is a region that looks like a power law, the middle region of the graph before it starts to level off. I've included this as an image called sum_error.png. Fitting this with gnuplot, I found that the power was 2.55.

For large values of N, I see the error leveling off due to (I'd imagine) roundoff errors. 

The downward sum is more precise since we're not adding increasingly smaller orders of magnitude to a number of order 1 already, so machine precision won't be a nuisance.
*/

#include <iostream>		//basic cin, cout
#include <iomanip>		//Changing precision of numbers in cout statement
#include <fstream> 		//file IO
#include <math.h>		//math functions (log, pow)
using namespace std;

int main(){
	float summation_up (int N);		//Declaring the functions I'm going to be using later
	float summation_down (int N);	

	int max_N;						//max order of magnitude for N
	
	cout << "Please enter the max order of magnitude (greater than 1): ";	//Letting the user set the max value of N
	cin >> max_N;
	ofstream out ("summations.dat");//file we're gonna output to
	for (int N = 10; N <= pow(10, max_N); N*=2){
		float sum_up = summation_up(N);		//equating summations to variables to avoid excess function calls.
		float sum_down = summation_down(N);
		out << fixed << setprecision(8) << N << "    "
			<< fixed << setprecision(8) << 2*fabs(sum_up - sum_down)/(fabs(sum_up) + fabs(sum_down)) << endl;
	}
	out.close();		//close file IO stream
	return 0;
}

float summation_up(int N){
	float sum = 0.0;		//starting out at 0 every time function is called
	for (int n = 1; n <= N; n++){
		sum += 1./n;		//using 1.0 in the numerator to avoid integer division nonsense
	}
	return sum;
}

float summation_down(int N){
	float sum = 0.0;		//starting at 0 doesn't matter here
	for (int n = N; n > 0; n--){
		sum += 1./n;
	}
	return sum;
}

