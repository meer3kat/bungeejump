function [t, y_out] = forwardeuler(func, t, h, y_0)
 %return the solution of forward euler for solving ODE
 %call [t, y_out] = forwardeuler(func, t, h, y_0)
 %will return t and y_out
 
N = round(((t(2) - t(1))/h)); %number of iteration
y_out = [y_0(:), zeros(2,N)];
t = [t(1), zeros(1,N)];

  for i=1:N
    t(i+1)=t(i)+h;
    
    y_out(:,i+1) = y_out(:,i) + h*func(t(i), y_out(:,i));
  end
  
end