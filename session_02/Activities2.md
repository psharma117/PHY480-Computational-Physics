### Might we care about formatting?

Formatting is what makes code readable. Poorly formatted code can make it difficult to understand the scope of variables or general statements of code, whether it's in a loop or a function or something else. This makes it far easier for errors to happen when editing the code.


### List the errors here:

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

### Which two (of x1, x1p, x2, x2p) are the most accurate? Explain why the others are not as accurate.

The most accurate of these 4 computed values are x1p and x2, as these two calculations are free of subtractive cancellations. The discriminant is of the same order as b since 4ac is an order of magnitude less than b and it's all under the square root, so x1 involves a subtraction of two terms that are of order b, as does x2p.

### List below up to three C++ lines from the code that you don't understand completely:

I don't understand the use of `scientific` inside the print statements. I've never seen that before.

### Is the plot qualitatively and quantitatively consistent with the analysis in the notes? Explain in a few sentences.

The plot makes sense qualitatively and quantitatively with the analysis in the notes. According to what was shown in the analysis, the absolute value of the relative error for a given root should be proportional to the absolute value of 1/c. Of course, this means that there should be roughly a straight line when plotting both relative errors against 1/c, as this means that the analysis is correct. The slope of this line is, of course $b^2/2a$ which is 2 in this case.

### If you add 1 + a + a + ... in single precision, what do you expect to get for the total? What do you get when you carry it out? 

I expect that adding 1 + a + a ... all the way down in single precision will return 1 since a is below machine precision and sufficiently small compared to 1. Carrying out the experiment verified this - I got 1.0 when adding a repeatedly to 1.

### If, instead, you add a + a + ... + 1 in single precision, do you expect a different answer? Which will be closer to the exact answer, the first way of summing or the 2nd way?

I expect a different answer in this order of addition, since a isn't being added to something with as large a difference in the order of magnitude til it's much closer to order 1, so I think that this order will yield a closer answer. Carrying out the experiment, I see that this is correct, with an end result that's roughly .03 above the expected value instead of 0.5 below it. 

### If you repeat the exercise in double precision, what do you expect will happen? Now actually perform the double precision calculation. Does it agree with your expectations?

I expect that in double precision, order won't matter since we're adding numbers well above machine precision. Carrying out the experiment, I do actually see small differences in the 8th decimal place, but both are very close to the correct answer.

### Write a brief "pseudocode" here for a program that would compare these two ways of summing. Then look at the file order_of_summation1a.cpp in an editor; does it look like an implementation of your pseudocode?

```
single_a = float(5e-8)
double_a = double(5e-8)
sp_addition_first = 1.0
dp_addition_first = 1.0
sp_addition_last = 0.0
dp_addition_last = 0.0
for i in range(1e7):
	 sp_addition_first += single_a
	 dp_addition_first += double_a

	 sp_addition_last += double_a
	 dp_addition_last += double_a
print('Single precision, 1 first: ', sp_addition_first)
print('Double precision, 1 first: ', dp_addition_first)
print('Single precision, 1 last: ', sp_addition_last)
print('Double precision, 1 last: ', dp_addition_last)
```

### Write a brief "pseudocode" here for a program that would compare these two ways of summing. Then look at the file order_of_summation1a.cpp in an editor; does it look like an implementation of your pseudocode?

The logic behind the pseudocode and the code in `order_of_summation1a.cpp` is pretty close. I see minor differences like the order in which things were computed in the loop which won't matter. 

### Challenge: Predict the results for 10^8 additions (instead of 10^7):

I suspect that adding 1 + a ... in single precision will still be 1, but a + a + ... 1 will be roughly 6. I also expect both double precision calculations to yield a number very close to 6.

### Now change the code, and see if your prediction is correct (or that you can explain it after the fact). 

My predictions for double precision were correct, however my prediction for the reverse order addition in single precision was wrong. Added up, I got 2 instead of roughly 6, which can be explained by noting that adding a to itself enough times gives 1 and anything past 1 will yield 1 since we're adding numbers below machine precision. So the summation over a will in total yield 1, which we add 1 to at the end to get 2. 

### If you run bessel.cpp, you'll generate a data file "bessel.dat". By looking at the code, figure out what the columns in the file mean. What Bessel function is being output? What are the columns?

A 10th order spherical bessel function of the first kind (so not a spherical Neumann function) is being output. The first column is x values, the second is the computed bessel function using the "downward" recursion formula, and the third is the computed bessel function using the "upward" recursion formula.

### Print out your plot.

![Plots of j_10](https://github.com/psharma117/PHY480-Computational-Physics/blob/main/session_02/bessels-up-down.png)

