function [] = ploteazaGraficPolinom(p)

D = 0: 0.01:1;

pv = polyval(p, D);
plot(D, pv, 'b');

end