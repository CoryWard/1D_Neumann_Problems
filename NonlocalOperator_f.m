%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This file is for finding a forcing function "f" given a
% solution "u".
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
syms x y L

% L=1;

u = @(w) sech(w);
uy = u(y);
ux = u(x);
nu = (1/2)*exp(-abs(x-y));
f1 = (1/24)*((exp(2*L)-1)/(exp(4*L)))*(exp(y+x) + exp(-(y+x)));

assume(x<L & x>-L);
f= ux - int(uy*(nu + f1),y,-L,L);