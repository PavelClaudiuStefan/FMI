f = @(x) x.^3-18*x-10;
eroare=10^(-3);

interval = [-5,5];

x_aprox_1 = MetSecantei(f,-5,3,-3.5,1.5,eroare);
x_aprox_2 = MetSecantei(f,-2,4,-1.5,3.5,eroare);
x_aprox_3 = MetSecantei(f,-1,5,0.5,4.5,eroare);
 
 
fplot(f,interval); hold on;
plot(x_aprox_1,f(x_aprox_1),'r.'); hold on;
plot(x_aprox_2,f(x_aprox_2),'r.'); hold on;
plot(x_aprox_3,f(x_aprox_3),'r.');



