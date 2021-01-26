**Why Might we care about formatting?**
Formatting is what makes code readable. Poorly formatted code can make it difficult to understand the scope of variables or general statements of code, whether it's in a loop or a function or something else. This makes it far easier for errors to happen when editing the code.


**List the errors here:**
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

**Which two (of x1, x1p, x2, x2p) are the most accurate? Explain why the others are not as accurate.**


