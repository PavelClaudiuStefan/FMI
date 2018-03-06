function [x_aprox,rez]=Ex4()
    f = @(x) x-sqrt(3);
    eps = 10^(-5);
    x_aprox = MetBisectie(f,0,3,eps);
    rez = f(x_aprox);
end