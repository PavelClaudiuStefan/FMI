function [x,y] = functie(m,depl)
x=2*rand(m,2)-1;
y=ones(m,1)*-1;
y(x(:,1)-x(:,2)<0)=1;
x(y==1,2)=x(y==1,2)+depl;
x(y==-1,2)=x(y==-1,2)-depl;

plot(x(y==1,1),x(y==1,2), '*r')
hold on
plot(x(y==-1,1),x(y==-1,2), '*b')
end
