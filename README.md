# NonlocalEquations
Matlab code using a quadrature method for solving nonlocal Neumann problems.

Specifically, we are interested in Neumann problems of the form given in: "Nonlocal Problems With Neumann Boundary Conditions", Arxiv:1407.3313v3 (2014) 

Here we've implemented the code for more general nonlocal kernels, and it currently supports solving Neumann boundary value problems. 

## Instructions

A detailed write up containing descriptions of the method is contained in the file, WriteUp.pdf. We've provided this as a quick introduction to the ideas behind the method so that the code can be quickly used.

To understand the code and file structure, we will focus on a specific example included in the repository. Within the System folder is contained the folder GK. This folder defines the equations we want to solve as well as code to initialize the equations. Specifically, CreateInitialData.m will construct a file, GK1.mat, in the Data folder which defines the system to solve, it's specific parameter values, and the Neumann boundary value problem.

Once this .mat file is created, run the file Main.m. This will solve the equations defined in the .mat file and store the solution back into the .mat file.

