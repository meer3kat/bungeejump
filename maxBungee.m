function ym = maxBungee(w)
  [t, y] = rungekutta(@(t,y)bungeeODE(t,y,w,122),[0 50], 0.01, [0;0]);
  ym =max(y(1,:))-200;
  