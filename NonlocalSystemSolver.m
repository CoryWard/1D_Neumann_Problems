function u = NonlocalSystemSolver(par)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Solves the nonlocal linear system 
%           Lu = b
% defined by the par structure.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%
% Set parameter values for ease of use.
%%%%%

wh = par.wh;
f2 = par.f2;
f = par.f;

M = par.M;
h = par.h;

%%%%%
% Define system
%%%%%

L = zeros(2*M+2, 2*M+2);
b = zeros(2*M+2,1);

L(1:2*M+1,1:2*M+1) = eye(2*M+1,2*M+1)- h*wh;
b(1:2*M+1) = f + f2;

% Like with local Neumann problems, if u is a soluiton then so is "u + c" for any
% constant "c". To pick out a single solution, we have to add a constraint
% equations and a dummy variable. 
%
% For our constraint equation, we want to choose "u + c" such that "sum (u(x_i)+c)^2"
% is as small as possible i.e. we must have "sum 2*(u(x_i)+c) = 0".

L(2*M+2,1:2*M+1) = 1;
L(2*M+2,1:2*M+2) = 2*M+1;
b(end,1) = 0;

%%%%%
% Solve system
%%%%%

u = L\b;
end

