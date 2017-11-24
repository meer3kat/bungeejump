% bungee jump
% Program to simulate the bungee jumping using forward euler's method
clear all;

% Set start and end times for simulation
starttime = 0;
finaltime = 100;
interval = [starttime finaltime];

% Set initial values, i.e., the y1 distance and y2 velocity
dis = 0;
vel = 0;

y0 = [dis; vel];

% Set parameters m g cv

global m g cv len;
m = 70;
g = 9.8;
cv = 0.227;
len = 145;


h = input('please enter your step size (h): \n'); %step size
N = round((finaltime-starttime)/h); %number of iteration
y = [y0(:), zeros(2,N)];
t0 = starttime;
t = [t0, zeros(1,N)];   



t = starttime: h : finaltime;
n = length(t);
y_out = [y(0): zeros(2,N)]


for i=1:N
    t(i+1)=t(i)+h;
    
    y(:,i+1) = y(:,i) + h * bungeeODE(t(i), y(:,i));
end



% Plot the solution

   plot (t, y);

   %xlabel('Time')
   %ylabel('velocity and accelation');
   %title ('Simulation of bungee jumping');
   %legend('distance','velocity');