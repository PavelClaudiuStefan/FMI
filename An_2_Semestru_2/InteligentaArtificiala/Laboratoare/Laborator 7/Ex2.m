


X = [0 0 0 0.5 0.5 0.5 1 1;0 0.5 1 0 0.5 1 0 0.5];
T = [1 1 1 1 -1 -1 -1 -1];


err = 1
net = newp([-1 1;-1 +1],1,'hardlims');
net.trainParam.epochs = 1

net.inputWeights{1}.initFcn = 'rands'
net.biases{1}.initFcn = 'rands'
net.inputWeights{1}.learnFcn = 'learnpn'

contor = 0
while err ~= 0
    contor = contor + 1
    [net, antreneaza] = train(net, X, T);
    %plotare puncte
    eticheta1 = find(T==1);
    etichetaMinus1 = find(T==-1);
    plot(X(1,eticheta1),X(2,eticheta1),'or');
    hold on
    axis([-51 2 -2 41]);
    plot(X(1,etichetaMinus1),X(2,etichetaMinus1),'xg');
    plotpc(net.IW{1}, net.b{1});
    err = antreneaza.perf(end);
end