**__Why Might we care about formatting?__**

Formatting is what makes code readable. Poorly formatted code can make it difficult to understand the scope of variables or general statements of code, whether it's in a loop or a function or something else. This makes it far easier for errors to happen when editing the code.


**__List the errors here:__**

```
quadratic_equation_1a.cpp:33:1: error: ISO C++ forbids declaration of ‘main’ with no type [-Werror=return-type]
   33 | main () {
      | ^~~~
quadratic_equation_1a.cpp: In function ‘int main()’:
quadratic_equation_1a.cpp:43:1: error: ‘out’ was not declared in this scope
   43 | out << "a = " << a << ", b = " << b << ", c = " << c;
      | ^~~
quadratic_equation_1a.cpp:45:1: error: ‘disc’ was not declared in this scope
   45 | disc = pow (b * b - 4. * a * c, 0.5); // definition of discriminant
      | ^~~~
quadratic_equation_1a.cpp:53:18: error: ‘setprecision’ was not declared in this scope
   53 | cout << fixed << setprecision (16) << x1 << "   " << x2;
      |                  ^~~~~~~~~~~~
quadratic_equation_1a.cpp:48:7: error: unused variable ‘x1p’ [-Werror=unused-variable]
   48 | float x1p = -2. * c / (b + disc);    // first root, new formula
      |       ^~~
quadratic_equation_1a.cpp:50:7: error: unused variable ‘x2p’ [-Werror=unused-variable]
   50 | float x2p = (-2. * c) / (b - disc);   // second root, new formula
      |       ^~~


```

**__Which two (of x1, x1p, x2, x2p) are the most accurate? Explain why the others are not as accurate.__**

The most accurate of these 4 computed values are x1p and x2, as these two calculations are free of subtractive cancellations. The discriminant is of the same order as b since 4ac is an order of magnitude less than b and it's all under the square root, so x1 involves a subtraction of two terms that are of order b, as does x2p.

**__List below up to three C++ lines from the code that you don't understand completely:__**

I don't understand the use of `scientific` inside the print statements. I've never seen that before.

**__Is the plot qualitatively and quantitatively consistent with the analysis in the notes? Explain in a few sentences.__**

The plot makes sense qualitatively and quantitatively with the analysis in the notes. According to what was shown in the analysis, the absolute value of the relative error for a given root should be proportional to the absolute value of 1/c. Of course, this means that there should be roughly a straight line when plotting both relative errors against 1/c, as this means that the analysis is correct. The slope of this line is, of course $b^2/2a$ which is 2 in this case.


