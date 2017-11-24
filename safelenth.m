clear all;

for len=1:200

    [t, y] = rungekutta(@(t,y)bungeeODE(t,y,70,len),[0 50], 0.01, [0;0]);
    
    r(len) = max(y(1,:));
    
    if r(len)>180
        r(len)=0;
    end

end

[M,length] = max(r);

length



