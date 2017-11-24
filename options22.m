options=odeset('RelTol',1e-10,'InitialStep',0.01);
options
[t_true,y_true]=ode45(@bungeeODE,[0 100],[0;0],options);

