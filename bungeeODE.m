function y_out = bungeeODE(t, y, m, len)
% y_out = bungeeODE(t, y, m, len);
% call by @(t,y)@bungeeODE(t,y,m,len)
%
% Computes the right-hand side of the system of ODEs
%
% y is a vector with two components, y = [y1; y2]
% y1 is the distance and 
% y2 is the velocity.
%
% m (weight of the person in kg) testing parameter
% g(gravity, 9.8)
% cv(coefficient for wind resistance 0.0227)
% len(lenth of the bungee rope) testing parameter

g = 9.8;
cv = 0.227;

if y(1) < len
    
y_out = [y(2); (m*g-sign(y(2))*cv*y(2)^2)/m];

else
      
y_out = [y(2); (m*g-sign(y(2))*cv*y(2)^2-50*(y(1)-len))/m];
end


    
    