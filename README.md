# Simulation of a quantum particle in a time varying external EM field

Here, we showcase the effectivness of spectral methods on two different problems. The first consists of a simple differential equation, and the second of a 1-dimensional Schrodinger equation with a potential well and an electromagnetic impulsion. 

Note that all comments are written in French.


# Spectral methods comparison
In the first, the performances of three spectral methods (Tau, Collocation, and Galerkin) are compared on the differential equation u"(x)+u'(x)-u(x)+2=0. Additionally, a finite difference method is used to showcase the superiority of spectral methods on this problem.
This solution admits the following exact solution : u(x)=1+\frac{ \sinh(2) e^x + \sinh(1) e^{-2x} }{ \sinh(3) }. This allows us to evaluate the quality of the solution obtained with all methods.
The 4 methods are implemented in the files named after them. The main file is MethodesSpectrales.m, running it will output figures displaying the solutions obtained by each method.


# Simulation of a quantum particle in a time varying external EM field

