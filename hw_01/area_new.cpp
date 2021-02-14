//  file: area.cpp
//
//  This program calculates the area of a circle, given the radius.
//
//  Programmer:  Dick Furnstahl  furnstahl.1@osu.edu
//
//  Revision history:
//      02-Jan-2004  original version, for 780.20 Computational Physics
//      01-Jan-2010  updates to "To do" wishlist
//      12-Jan-2016  comment out "using namespace std;"
//
//  Notes:  
//   * compile with:  "g++ -o area.x area.cpp"
//
//  To do:
//   1. output the answer with higher precision (more digits)
//   2. use a "predefined" value of pi or generate it with atan
//   3. define an inline square function
//   4. split the calculation off into a function (subroutine)
//   5. output to a file (and/or input from a file)
//   6. add checks of the input (e.g., for non-positive radii)
//   7. rewrite using a Circle class
//
//*********************************************************************// 

// include files
#include <iostream>	     // this has the cout, cin definitions
#include <iomanip>	     
#include <cmath>
#include <fstream>
#include <typeinfo>
using namespace std;     // if omitted, then need std::cout, std::cin 

//*********************************************************************//

//const double pi = 3.1415926535897932385;   // define pi as a constant 
//~~~~~~~2.
const double pi = 4*atan(1);	

int main (){
	double radius;    

	ofstream out ("area.dat");
	cout << "Enter the radius of a circle: ";	// ask for radius
	cin >> radius;
//~~~~~~~6.
	while (radius < 0 ){
		cout << "Please enter a positive radius: ";
		cin >> radius;
	}

	double area = pi * radius * radius;	
//~~~~~~~1.
	cout << "radius = " << radius << ",  area = " << fixed << setprecision(8) << area << endl;
//~~~~~~~5.
	out << "radius = " << radius << ",  area = " << fixed << setprecision(8) << area << endl;
	out.close();

	return 0;			// "0" for successful completion
}

//~~~~~~~3.
inline double square(double radius){
	return radius * radius;
}

//~~~~~~~4.
double area(double radius){		
	return pi * square(radius);
}

//*********************************************************************//
