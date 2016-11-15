function [range, height]=LinearDragProjectile(v0,theta0,D1,m)
g=9.8;
c=[0;1/2;1/2;1];
a=[0 0 0 0;1/2 0 0 0;0 1/2 0 0;0 0 1 0];
w=[1/6 1/3 1/3 1/6];
v0x=v0*cosd(theta0);
v0y=v0*sind(theta0);
s(:,1)=[0;0;v0x;v0y];
t(1)=0;
F=@(t,s)[s(3);s(4);-D1/m*s(3);-g-D1/m*s(4)];
i=1;
h=0.01;
while s(2,i)>=0
    k=zeros(length(s(:,1)),length(c));
    for j=1:length(c)
        k(:,j)=h*F(t(i)+c(j)*h, s(:,i)+k*a(j,:)');
    end
    s(:,i+1)=s(:,i)+k*w';
    t(i+1)=t(1)+h;
    i=i+1;
    plot(s(1,:),s(2,:));
end
end