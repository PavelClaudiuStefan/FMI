f = @(x) x.^3-7*x.^2+14*x-6;
interval=[0 4];
 
eps = 10^(-5);
x_aprox_1 = MetBisectie(f,0,1,eps)
x_aprox_2 = MetBisectie(f,1,3.2,eps)
x_aprox_3 = MetBisectie(f,3.2,4,eps)

fplot(f,interval);
hold on;
plot(x_aprox_1,f(x_aprox_1),'r.'); 
hold on;
plot(x_aprox_2,f(x_aprox_3),'r.'); 
hold on;
plot(x_aprox_3,f(x_aprox_3),'r.');