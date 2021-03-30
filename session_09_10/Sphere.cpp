// include files
#include "Sphere.h"      // include the header for this class

//********************************************************************

#include <iostream>

const double pi = 3.1415926535897932385;	// define pi 

Sphere::Sphere (const double rad) // Constructor for Sphere
{
  radius = rad;    // set the internal (private) radius to the passed value
  
  // For debugging, print a message when we make a circle
  std::cout << "A sphere of radius " << radius
            << " is created ..." << std::endl;
}

Sphere::~Sphere () // Destructor for Sphere (not much to do here!)
{
  // For debugging, print a message when a circle goes out of scope
  std::cout << "A sphere of radius " << radius 
            << " is destroyed ..." << std::endl;  
}

void Sphere::set_radius(const double rad){
  radius = rad;
}

double Sphere::get_radius(){
  return radius;
}

double Sphere::volume(){
  return (4./3.)*pi * cube(radius);
}

double Sphere::surface_area(){
	return 4*pi*sqr(radius);
}

//********************************************************************
