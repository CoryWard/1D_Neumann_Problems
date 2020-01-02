%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Creates the par structure containing the parameters and 
% system definition. This file is essentially a contructor.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear

%%%%%
% Create Computational Domain
%%%%%

par.L = 20; % The computational domain is [-Lw, Lw]
par.M = 500; % Number of equally spaced points between [0,Lw] not including 0.
             % Also note that M has to be EVEN!
par.h = par.L/par.M; % Space between points

par.x = par.h*(-par.M:1:par.M)'; % Computational Domain
[X,Y] = ndgrid(par.x,par.x);     % Constructing \hat{omega}

%%%%%
% Define Kernel and Associated Functions
%%%%%

nu = @(y) (1/2)*exp(-abs(y));   % Kernel
f1 = @(x,y) (1/24)*((exp(2*par.L)-1)/exp(4*par.L)).*(exp(y+x)+exp(-1.*(y+x)));    % Define f_1(x,y)

par.wh = nu(X-Y) + f1(X,Y);
par.wh(:,1) = (1/2)*par.wh(:,1);
par.wh(:,end) = (1/2)*par.wh(:,end);

%%%%%
% Define Forcing Function
%%%%%

%Example 1 from the notes.
% al = (13/24)*exp(-par.L) -(1/12)*exp(-3*par.L) + (1/24)*exp(-5*par.L) +...
%     (11/24)*par.L*exp(-par.L)+ (1/24)*par.L*exp(-5*par.L);
% fi = @(y) al*exp(y) - al*exp(-y);

%Example 2 from the notes.
be = (1/2)*log((exp(2*par.L) +1)/(exp(2*par.L))) - (1/12)*par.L*exp(-2*par.L) +...
     (1/12)*par.L*exp(-4*par.L);
gm = (1/2)*log(exp(-2*par.L) + 1) - (1/24)*exp(-2*par.L)*log(exp(-2*par.L) + 1)  +...
     (1/24)*exp(-2*par.L)*log(exp(2*par.L) + 1) + (1/24)*exp(-4*par.L)*log(exp(-2*par.L) + 1) ...
     - (1/24)*exp(-4*par.L)*log(exp(2*par.L) + 1)  -  (1/6)*par.L*exp(-2*par.L) +...
     (1/6)*par.L*exp(-4*par.L);

fi = @(y) sech(y)- (1/2).*exp(-y).*log(1+exp(2*y)) - (1/2).*exp(y).*log(1+exp(2*y))...
     + y.*exp(y) +  be*exp(y) + gm*exp(-y);

par.f = fi(par.x);

%%%%%
% Define Neumann BC and corresponding Integral
%%%%%

g = @(x) 0*x;
f2 = @(x) 0.*x; % Define f_2(x)
par.f2 = f2(par.x);

%%%%%
% Create path to save data
%%%%%

filename='GK1';
file_names.Data = strcat('System/GK/Data/',filename,'.mat');

save(strcat('Data/',filename,'.mat'), 'par', 'file_names');
