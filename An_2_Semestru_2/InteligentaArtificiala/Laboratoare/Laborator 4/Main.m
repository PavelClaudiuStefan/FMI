[X, U] = genereazaExemple(n);

ploteazaExemple(X, U);

[p] = gasestePolinomOptim(X, U, 2);

ploteazaGraficPolinom(p);

err = calculeazaEroare(p, X, U);

N = 0:9;
% for i = 1:numel(N);
%     p = gasestePolinomOptim(X, U, N(i));
%     subplot(4, 3, i);
%     ploteazaExemple(X, U);
%     hold on;
%     ploteazaGraficPolinom(p);
%     eroare = calculeazaEroare(p, X, U);
%     
% end


for i=1:7
    indici = randperm(10);
    
    p = gasestePolinomOptim(X(indici(1:7)), U(indici(1:7)), 6)
    subplot(4, 3, i)
    ploteazaExemple(X(indici(1:7)), U(indici(1:7)));
    hold on;
    ploteazaGraficPolinom(p);
    
    y = polyval(p, X(indici(1:7)));
    
    err1 = calculeazaEroare(p, X(indici(1:7)), U(indici(1:7)));
    
    y2 = polyval(p, X(indici(8:end)));
    
    plot(X(indici(8:end)), U(indici(8:end)), 'b' )
    
end
