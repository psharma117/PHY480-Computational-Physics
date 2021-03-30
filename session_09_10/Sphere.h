//  file: Circle.h
//
//  Header file for the Circle C++ class.
//
//  Programmer:  Dick Furnstahl  furnstahl.1@osu.edu
//
//  Revision history:
//      02/05/09  original version
//
//  Notes:
//   * 
//
//  To do:
//   * Add additional methods (e.g., for circumfrence)
//
//*****************************************************************

// The ifndef/define macro ensures that the header is only included once
#ifndef SPHERE_H
#define SPHERE_H

// include files

class Sphere{ 
  public:
    Sphere (const double rad);  // constructor
    ~Sphere ();  // destructor

    // accessor functions
    double get_radius ();
    void set_radius (const double rad);
    double volume ();
	double surface_area();

  private:
    double radius;  // the circle radius
    inline double sqr (const double x) {return x*x;};  // inline function
    inline double cube (const double x) {return x*x*x;};  // inline function
};

#endif
