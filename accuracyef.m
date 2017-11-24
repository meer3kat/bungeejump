clear all;

ti=0;
ops=odeset('RelTol',1e-9);
[t_true,y_true]=ode45(@(t,y)bungeeODE(t,y,70,150),[0 5],[0;0],ops);
h=1;

for i=1:4
   [t, y] = forwardeuler(@(t,y)bungeeODE(t,y,70,150),[0 5], h, [0;0]); 
   y=y';
   err(i,:)= abs(y(end,:)-y_true(end,:));
   x(i)=h;
   h=h/10;
   
end
my_y=err(:,1)';

linearCoefficients = polyfit(log(x), log(my_y), 1)

plot(log(x),log(err(:,1)))
text(-6,0,['slope = ',num2str(linearCoefficients(1))]);
xlabel('log(h)')
ylabel('log(error)');
title ('error analysis for forward euler');
legend('error in distance');
 

