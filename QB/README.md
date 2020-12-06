
# This folder contains code for implemnting Godunov finite volume method for the inviscid Burgers' equation in Homework 4

1) In order to just run a single instance of Godunov finite volume method to observe the numerical solution, one can run the file "myGodunov.m". Note the value of N, i.e. the number of grid points as described in the question can be changed in this file.

2) In order to compare the Godunov finite volume based scheme and the scheme from Part A, one can run the file "compare.m". 
Below is a plot showing the comparison of the two schemes. The red plot is for the Godunov solution and the blue plot is for the other finite difference based scheme.
![alt text](https://github.com/sourav-roni/Math714_HW4/blob/main/QB/gnull.png)

2) In order to run a single instance of Godunov finite volume method schem with the entropy fix for the transonic rarefaction wave, one can run the file "myGodunov_entropyFix.m". Note the value of N, i.e. the number of grid points as described in the question can be changed in this file.

