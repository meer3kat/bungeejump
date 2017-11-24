% bungee jump
% Program to simulate the bungee jumping

% Set start and end times for simulation
starttime = 0;
finaltime = 100;
interval = [starttime finaltime];

% Set initial values, i.e., the distance and velocity
dis = 0;
vel = 0;

y0 = [dis, vel];

% Set parameters r, a, c, d
% r is the birth rate for the prey
% a indicates how strongly prey contributes to the growth of the predator
%   population
% c specifies how effectively predators take prey
% d is the death rate for the predator

m=70;
g=9.8;
cv=0.227;
len=150;


% Set values for internal parameters in Matlab's ODE solvers. NB: this is
% not necessary but can be used if you want to change default values.
% This means that the default values will be used
% values = odeset('OutputFcn','odeplot','RelTol', 1e-2);


% Solve the ODE system by calling ode45. The input parameter 'values'
% is not required if you are satisfied with the default values in ode45.
[t, y] = ode45(@(t,y)bungeeODE(t, y, m, len), interval, y0, values);

% Plot the solution
if isempty(values.OutputFcn)
   plot (t, y);
end
   xlabel('Time')
   ylabel('velocity and accelation');
   title ('Simulation of bungee jumping with ode45');
   legend('distance','velocity');