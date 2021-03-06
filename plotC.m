function plotC(xmin,xmax,res)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matlab M-file                Author: Ricardo Sanfelice
%
% Project: Simulation of a hybrid system
%
%
% Name: plotC.m
%
% Description: plots the flow set
%
% Version: 0.4
% Required files: -
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% get dimensions
d = length(xmin);
%figure(3)
%clf

if (d==1)
   xin = linspace(xmin,xmax,res);
   N = length(xin);
   for i=1:N,   
%     Cout(i) = C(xin(i));
     if (C(xin(i)) == 1)
          plot(xin(i),'b*')
          hold on
     end
   end
elseif (d==2)
   resolution=1/res; 
   [x1 x2] = ndgrid(xmin(1):resolution:xmin(2), xmax(1):resolution:xmax(2));
   N = length(xin);
   for i=1:N,   
%     Cout(i) = C(xin(i));
     if (C(xin(i)) == 1)
          plot(xin(i),'b*')
          hold on
     end
   end
   end
end