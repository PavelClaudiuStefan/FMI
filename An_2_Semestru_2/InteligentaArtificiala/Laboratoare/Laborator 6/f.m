m = [10, 50, 100, 250, 500]
deplasare = [0.5 0.3 0.1 -0.1 -0.3]
for i= 1: numel(m)
    figure
    for j = 1:numel(deplasare)        
        subplot(3, 2, j)
        [X, T] = genereaza(m(i), deplasare(j));
        [W, b] = antreneaza(X, T, 100)   ;     
        plotpc(W, b);
    end
end
