clear all;

cont = 0;

while cont==0

choosemethod = input('enter 1 for euler forward and enter 2 for RK 4: ')

h = input('enter h: ');
t1 = input('start time: ');
t2 = input('final time: ');

if choosemethod==1
    [t, y] = forwardeuler(@(t,y)bungeeODE(t,y,60,150),[t1 t2], h, [0;0]);

elseif choosemethod==2
    [t, y] = rungekutta(@(t,y)bungeeODE(t,y,60,150),[t1 t2], h, [0;0]);

end
    

hdis = ['h = ', num2str(h)];
plot (t, y);
text(10,100, hdis);

   xlabel('Time')
   ylabel('velocity and accelation');
   title ('Simulation of bungee jumping');
   legend('distance','velocity');
   
   
   
disp('press 0 to continue')
cont = input('enter here ');
end




