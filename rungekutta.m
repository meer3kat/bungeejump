function [t, y_out] = rungekutta(func, t, h, y_0)
 %return the rungekutta results for solving ODE
 %call [t, y_out] = rungekutta(func, t, h, y_0)
 %will return t and y_out

N = round(((t(2) - t(1))/h)); %number of iteration
y_out = [y_0(:), zeros(2,N)];
t = [t(1), zeros(1,N)];

  for i=1:N
    t(i+1)=t(i)+h;
    k1 = h * func(t(i), y_out(:,i));
    k2 = h * func((t(i)+h/2), (y_out(:,i)+k1/2));
    k3 = h * func((t(i)+h/2), (y_out(:,i)+k2/2));
    k4 = h * func((t(i)+h), (y_out(:,i)+k3));
    
    y_out(:,i+1) = y_out(:,i) + k1/6 + k2/3 + k3/3 + k4/6;
  end

end