f = @(x) x.^3-18*x-10;
eroare=10^(-3);

interval = [-5,5];

x_aprox_1 = MetPozFalse(f,-5,1,eroare);
x_aprox_2 = MetPozFalse(f,-2,3,eroare);
x_aprox_3 = MetPozFalse(f,-2,5,eroare);
 
 
fplot(f,interval); hold on;
plot(x_aprox_1,f(x_aprox_1),'r.'); hold on;
plot(x_aprox_2,f(x_aprox_2),'r.'); hold on;
plot(x_aprox_3,f(x_aprox_3),'r.');