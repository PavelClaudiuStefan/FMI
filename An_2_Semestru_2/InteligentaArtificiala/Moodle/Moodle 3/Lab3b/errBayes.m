function eroareMisclasare = calculeazaEroareClasificatorBayes(n,c,optiuneRepartitie,folosesteEtaEstimat)

if nargin<3
    optiuneRepartitie = 'uniforma';
end

if nargin < 4
    folosesteEtaEstimat = 0;
end

switch optiuneRepartitie
    case 'uniforma'
        %X e repartizat uniform repartizat in [0,4c]
        X = rand(n,1) * 4*c;
    case 'exponentiala'
        %X e repartizat exponential de parametru lambda = c
        lambda = c;
        X = exprnd(lambda,n,1);
end
%generez realizarile Y iau examenul/nu iau examenul
if folosesteEtaEstimat
    etaEstimat = mean(X./(X+c));
    Y = rand(n,1) < etaEstimat;
else
    Y = rand(n,1) < X./(X+c);
end
%generez Ystar pe baza lui gstar iau examenul daca functia de regresie > 0.5
Ystar = X./(X+c) > 0.5;

%calculez eroarea de misclasare
eroareMisclasare = mean(abs(Y-Ystar));