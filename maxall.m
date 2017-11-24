clear all;

m = 70;
g = 9.8;
cv = 0.227;
len = 150;

[t, y] = rungekutta(@(t,y)bungeeODE(t,y,70,150),[0 50], 0.001, [0;0]);
    
size= length(y);
for k=1:size
    if y(1,k)< 150
        acce(k) = (m*g-sign(y(2,k))*cv*(y(2,k))^2)/m;
    else   
        acce(k) = (m*g-sign(y(2,k))*cv*(y(2))^2-50*(y(1,k)-len))/m;
        
       
    end
    
end
    
[max_acce,location]=max(abs(acce))
time=location*0.001;
[max_vel,abc]=max(y(2,:));
[max_dis,abcd]=max(y(1,:));

y=[y;acce];
y(1,location)
plot (t, y);
text(time-5,-40,['max acceleration ', num2str(max_acce), ' time ', num2str(time),' location ',num2str(y(1,location))])
xlabel('Time')
ylabel('distance, velocity and accelation');
title ('Simulation of bungee jumping');
legend('distance','velocity','accleration');
