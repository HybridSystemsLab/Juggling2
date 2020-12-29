function out = g(z)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matlab M-file               Author: Ricardo Sanfelice 
%
% Project: Simulation of a hybrid system (bouncing ball)
%
% Name: g.m
%
% Description: Jump map
%
% Version: 0.4
% Required files: -
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% constants
global  n m;

global lambdabar lambda1 lambda2;
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

% jump map
%if (x == 1)
%   xplus = 2;
%elseif (x == 2)
%   xplus = 1;
%else
%   xplus = x;
%end

%
%e2=0.1;
yd=0.5*((1-lambda2^2)/lambda2)*x2;
%e=0.1;

x1plus=0;
x2plus=-lambdabar*yd;
%xplus = [x1plus;x2plus];


out = [x1plus;x2plus];