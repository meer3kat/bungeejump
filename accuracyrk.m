clear all;

ti=0;

[t_true,y_true]=rungekutta(@(t,y)bungeeODE(t,y,70,150),[0 5], 0.0001, [0;0]);
h=1;

for i=1:3
   [t, y] = rungekutta(@(t,y)bungeeODE(t,y,70,150),[0 5], h, [0;0]); 
   
   err(:,i)= abs(y(:,end)-y_true(:,end));
   
   x(i)=h;
   h=h/10;
   
end


linearCoefficients = polyfit(log(x), log(err(1,:)), 1)

plot(log(x),log(err(1,:)))
text(-4,-18,['slope = ',num2str(linearCoefficients(1))])
xlabel('log(h)')
ylabel('log(error)');
title ('error analysis for Runge-Kutta');
legend('error in distance');