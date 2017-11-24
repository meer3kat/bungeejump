clear all;


for a=1:200

    [t, y] = rungekutta(@(t,y)bungeeODE(t,y,a,122),[0 50], 0.01, [0;0]);
    
    w(a) = max(y(1,:));
    
    if w(a)>200
        w(a)=0;
    end

end

[M,safe_weight] = max(w);

safe_weight
