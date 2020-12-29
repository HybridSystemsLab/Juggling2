function out = f(z)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matlab M-file                Author: Ricardo Sanfelice
%
% Project: Simulation of a hybrid system (bouncing ball)
%
% Name: f.m
%
% Description: Flow map
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

% flow map
%xdot=f(x,u);
x1dot = x2;
x2dot = -9.81;
%x3dot = 0;

out = [x1dot;x2dot];