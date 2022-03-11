# Solving differential equations with spectral methods

Here, we showcase the effectiveness of spectral methods on two different problems. More details can be found in the report.

Note that this project was completed in French as part of the course LPHYS2371 Simulation Numérique at UCLouvain.


# Spectral methods comparison
Here, we are interested in comparing the performances of three spectral methods (Tau, Collocation, and Galerkin) in solving the differential equation u"(x)+u'(x)-u(x)+2=0. This problem admits an exact solution, which is used to evaluate the quality of the numerical solutions found. Additionally, a finite difference method is used to showcase the superiority of spectral methods on this problem.

The 4 methods are implemented in the files named after them. The main file is MethodesSpectrales.m, running it will output figures displaying the solutions obtained by each method.


# Quantum particle in a EM field
The second problem is focused on solving a more complex and more interesting differential equation: the Schrodinger equation of a 1D particle in a potential well excited by an external time-varying electromagnetic field. This non-trivial problem does not admit an analytical solution, and so numerical methods are required. Again, we use a spectral approach.

Interestingly, for some parameter values, we observe the Rabi oscillations phenomenon.
