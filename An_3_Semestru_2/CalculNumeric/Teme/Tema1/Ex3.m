y1 = @(x) exp(x) - 2;
y2 = @(x) cos(exp(x) -2);

fplot(y1); 
hold on;
fplot(y2);

a=0.5;
b=1.5;
eps = 10^(-5);
ecuatie = @(x) exp(x) - 2 - cos(exp(x) -2);
x_aprox = MetBisectie(ecuatie,a,b,eps)