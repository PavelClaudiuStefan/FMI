f = @(x) x.^3 - 7*x.^2 + 14*x - 6;
df = @(x) 3*x.^2 - 14*x + 14;
ddf = @(x) 6*x - 14;
eps= 10^(-3);

x0_ex = 2;
val_nu_converge = f(x0_ex) * ddf(x0_ex); % <0 I.2

x0 = 0.5;
val_converge = f(x0) * ddf(x0)  % >0
 
x_aprox = MetNR(f,df,x0,eps)
check = f(x_aprox)