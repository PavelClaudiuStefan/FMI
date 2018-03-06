f = @(x) x.^3 - 7*x.^2 + 14*x - 6;
df = @(x) 3*x.^2 - 14*x + 14;
 
interval=[0 4];
eps = 10^(-3);
 
x0_1 = 0.5;
x0_2 = 2.5;
x0_3 = 3.5;

x_aprox_1 = MetNR(f,df,x0_1,eps)
x_aprox_2 = MetNR(f,df,x0_2,eps)
x_aprox_3 = MetNR(f,df,x0_3,eps)
 
fplot(f,interval);
hold on;
plot(x_aprox_1,f(x_aprox_1),'r.');
hold on;
plot(x_aprox_2,f(x_aprox_3),'r.');
hold on;
plot(x_aprox_3,f(x_aprox_3),'r.');