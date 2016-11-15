function SatelliteMotion(v0,theta0,H,tmax)
c=[0;1/2;1/2;1];
a=[0 0 0 0;1/2 0 0 0;0 1/2 0 0;0 0 1 0];
w=[1/6 1/3 1/3 1/6];
Re=6400;
t(1)=0;
dt=0.01;
s(:,1)=[0;v0*cosd(theta0);Re+H;v0*sind(theta0)];
GM=4e14*1e-9*3600^2;
Fx=@(t,s)[-GM/(s(1)^2+s(3)^2)^(3/2)*s(1)];
Fy=@(t,s)[-GM/(s(1)^2+s(3)^2)^(3/2)*s(3)];
F=@(t,s)[s(2);Fx(t,s);s(4);Fy(t,s)];
