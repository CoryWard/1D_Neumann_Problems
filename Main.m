%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Main:
% Solve the nonlocal linear system using the trapezoidal
% rule. The file "CreateInitialData.m" acts as a
% constructor, defining the system, it's
% parameters, and the corresponding BVP. This file solves 
% the corresponding BVP.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;

%%%%%
% Select which system to use
%%%%%

sys = load('System/GK/Data/GK1.mat');

par = sys.par;
file_names = sys.file_names;

%%%%%
% Solve system
%%%%%

uf = NonlocalSystemSolver(par);

u = uf(1:2*par.M+1,1);
c = uf(end,1);

%%%%%
% Plot the solution.
%%%%%
plot(par.x,u)

%%%%%
% Save solution to par structure
%%%%%

par.u = u;

save(file_names.Data,'par','file_names');