%--------------------------------------------------------------------------
% Project: Hybrid Feedback Control book
% Description: Passivity-based Juggling Control
% https://hybrid.soe.ucsc.edu/software
% http://hybridsimulator.wordpress.com/
% Filename: run.m
% Set of simulation files created and edited by 
% Roberto Naldi and Ricardo Sanfelice
%--------------------------------------------------------------------------

clear all

% initial conditions
x0 = [5;0];
u0 = 0;
% combine initial conditions
z0 = [x0; u0];

% simulation horizon
T = 10;
J = 20;

% rule for jumps
% rule = 1 -> priority for jumps
% rule = 2 -> priority for flows
% rule = 3 -> no priority, random selection when simultaneous conditions
rule = 1;

% constants
global  m n;
    n = 2; %# of state components
    m = 1; %# of input components   
% simulate
global lambdabar lambda1 lambda2;
lambda2 = 0.8;
lambda1 = 0.1;
lambdabarmax = 2*lambda2^2/(1-lambda2^2);
lambdabarmin = 2*lambda1*lambda2^2/(1-lambda2^2);
lambdabar=(lambdabarmax+lambdabarmin)/2;

sim('HybridSimulator')

% plot solution
figure(1)
clf
subplot(2,1,1),plotflows(t,j,x)
grid on
ylabel('x')

subplot(2,1,2),plotjumps(t,j,x)
grid on
ylabel('x')

% plot hybrid arc
figure
plotHybridArc(t,j,x)
xlabel('jumps [j]')
ylabel('flows [t] [sec]')
zlabel('x_1 [m]')


% plot hybrid arc (velocity)
figure
plotHybridArc(t,j,x(:,2))
xlabel('jumps [j]')
ylabel('time [t] [sec]')
zlabel('x_2 [m/s]')




%passivity:
uy=[];
V=[];
for i=1:length(x)
    yd=0.5*((1-lambda2^2)/lambda2)*x(i,2);
    uy=[uy -lambdabar*yd*yd];
   
    V=[V 0.5*x(i,2)^2+9.81*x(i,1)];
end







% figure(4)
% clf
% plotflows(t,j,V);
% xlabel('time [sec]')
% ylabel('V(x)')


% plot hybrid arc (velocity)
figure;
plotHybridArc(t,j,V)
xlabel('jumps [j]')
ylabel('time [t] [sec]')
zlabel('V(x)')





figure(5)
clf
subplot(2,1,1),plotflows(t,j,V)
grid on
ylabel('V(x)')

subplot(2,1,2),plotjumps(t,j,V)
subplot(2,1,2),plot(j,uy,'r*')
grid on
ylabel('V(x)')




% figure(7)
% scatter(x(:,1),x(:,2));
% grid;
% hold on;
% axis([0 5 -10 5]);
% plotC([0 5],[-10 5],100);
% xlabel('x_1 [m]');
% ylabel('x_2 [m/s]');





%compute domains:
Xmin=-0.5;
Xmax=5;
Ymin=-10;
Ymax=5;

res=0.004;

resX=(res*(Xmax-Xmin));
resY=(res*(Ymax-Ymin));

domainC=[];
domainD=[];
for x1= Xmin:resX:Xmax
    for x2=Ymin:resY:Ymax
    if C([x1 x2 0])==1
        domainC=[domainC [x1; x2]];
    end
    if D([x1 x2 0])==1
        domainD=[domainD [x1; x2]];
    end
    end
end


figure(7);
scatter(domainC(1,:),domainC(2,:),2,'r','filled');
hold on;
scatter(domainD(1,:),domainD(2,:),3,'g','filled');
axis([Xmin Xmax Ymin Ymax]);
hold on;
scatter(x(:,1),x(:,2),3,'b','filled');
grid;
xlabel('x_1 [m]');
ylabel('x_2 [m/s]');
%hold on;
%plotD([-1; -2.5], [0.4; 2.5], 0.001);
hold off;


figure(8);
axis([Xmin Xmax Ymin Ymax]);
grid on
hold on
%fill([Xmin,Xmin,Xmax,Xmax],[Ymin,Ymax,Ymax,Ymin],'r')
fill([-0.02,-0.02,0.02,0.02],[-10,0,0,-10],'g')
scatter(x(:,1),x(:,2),3,'b','filled');
grid on;


figure(9);
clf
subplot(1,2,1)
fill([-0.02,-0.02,0.02,0.02],[-10,0,0,-10],'r')
hold on
plot(x(1,1),x(1,2),'b*')
scatter(x(:,1),x(:,2),3,'b','filled');
axis([Xmin Xmax Ymin Ymax]);
grid on;
xlabel('$x_1$','Interpreter','latex')
ylabel('$x_2$','Interpreter','latex')
hYLabel = get(gca,'YLabel');
set(hYLabel, 'FontSize', 14)
set(hYLabel,'rotation',0)
hXLabel = get(gca,'XLabel');
set(hXLabel, 'FontSize', 14)
title('')

subplot(1,2,2),plotflows(t,j,V)
grid on
xlabel('$t\ [s]$','Interpreter','latex')
ylabel('$V(x)\ \ \ \ \ \ $','Interpreter','latex')
hYLabel = get(gca,'YLabel');
set(hYLabel, 'FontSize', 14)
set(hYLabel,'rotation',0)
hXLabel = get(gca,'XLabel');
set(hXLabel, 'FontSize', 14)
title('')

print -depsc -tiff -r300 Juggling2.eps