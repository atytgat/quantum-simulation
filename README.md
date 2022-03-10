# Spectral methods

Comparing the performances of three spectral methods (Tau, Collocation, and Galerkin) on the differential equation u"(x)+u'(x)-u(x)+2=0. Additionally, a finite difference method is used to showcase the power of spectral methods on this problem.

This solution admits the following exact solution : u(x)=1+\frac{ \sinh(2) e^x + \sinh(1) e^{-2x} }{ \sinh(3) }. This allows us to evaluate the quality of the solution obtained with the three numerical methods.

The 4 methods are implemented in files named after them. The main file is MethodesSpectrales.m, running it will output graphs displaying solutions for each method.

Note that comments are written in French.
