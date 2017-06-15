m=[10, 50, 100, 250, 500]
deplasare=[0.5, 0.3, 0.1,0.01, -0.1, -0.3]


for i=1:numel(m)
figure
for j=1:numel(deplasare)
    subplot(3,2,j);
    [X,T]=functie(m(i), deplasare(j));

    net = newp([-1 1;-1 +1],1,'hardlims');
    net.trainParam.epochs = 1
    
    [net, antreneaza] = train(net, X', T');
    eticheta1 = find(T==1);
    etichetaMinus1 = find(T==-1);
    plot(X(eticheta1, 1),X(eticheta1, 2),'or');
    hold on;

    plot(X(etichetaMinus1, 1),X(etichetaMinus1, 2),'xg');
        axis([-2 2 -2 2]);
    plotpc(net.IW{1}, net.b{1});
    
end
end
