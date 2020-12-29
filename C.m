function [v] = C(z) 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matlab M-file                Author: Ricardo Sanfelice
%
% Project: Simulation of a hybrid system (bouncing ball)
%
% Name: C.m
%
% Description: Flow set
%
% Version: 0.4
% Required files: -
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% constants
global  n m;
    %n = # of state components
    %m = # of input components 

% state
x =z(1:n);
x1=x(1);
x2=x(2);
%x3=x(3);

%input
u=z(n+1:n+m);
u1=u(1);
%u2=u(2);

if (x1 >= 0)  % flow condition
    v = 1;  % report flow
else
    v = 0;   % do not report flow
end