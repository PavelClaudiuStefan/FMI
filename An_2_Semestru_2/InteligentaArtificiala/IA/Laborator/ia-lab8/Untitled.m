X=[[-2 2]',[-2 3]',[-1 1]',[-1 4]',[0 0]',[0 1]',[0 2]',[0 3]', [1 0]', [1 1]',[2 1]',[2 2]',[3 -1]',[3 0]',[3 1]', [3 2]', [4 -2]', [4 1]', [5 -1]', [5 0]']
T=[-1 -1 -1 -1 -1 -1 -1 -1 1 -1 1 -1 1 1 1 1 1 1 1 1];

%a
eticheta1=find(T==1);
etichetaMinus1=find(T==-1);
figure,hold on;
plot(X(1,eticheta1),X(2,eticheta1),'or');
plot(X(1,etichetaMinus1), X(2,etichetaMinus1),'xg');
axis([-5 5 -5 5]);

%b
ceva=(inv(X*X'))*X*T';
bstar=ceva(1);
wstar=ceva(2:end);
LGlobal=plotpc(wstar',bstar);
set(LGlobal,'color','m','linewidth',3);

%c
net=newp([-2 2;-2 2],1,'purelin','trainb');
net.inputWeights{1}.learnFcn='learnwh';
net.biases{1}.learnFcn='learnwh';
net.inputWeights{1}.learnParam.lr = 0.005;
net.biases{1}.learnParam.lr = 0.005;
net.trainParam.epochs=200;

[net,antrenare]=train(net,X,T);
b=plotpc(net.IW{1},net.b{1});
set(b,'color','b','linewidth',2);

title('linii');
legend('exemplele din clasa 1','exemplele din clasa -1','dreapta de separare data de Beta','dreapta de separare invatata');

%4
figure(2),hold on;
plot(X(1,eticheta1),X(2,eticheta1),'or');
plot(X(1,etichetaMinus1), X(2,etichetaMinus1),'xg');
axis([-5 5 -5 5]);

wstar = inv(X*X')*X*T';
bstar = 0;
plotpc(wstar',bstar);

%7

net = newp([min(X(1,:)) max(X(1,:));min(X(2,:)) max(X(2,:))],1,'purelin');
net.inputWeights{1}.initFcn = 'initzero';
net.inputWeights{1}.learnFcn = 'learnwh';
net.inputWeights{1}.learnParam.lr = 0.005;
net.biasConnect = 0;
net.trainFcn = 'trainb';
net.trainParam.epochs = 200;



net = train(net,X,T);
figure(2);hold on;
dreaptaSolutieInvatataB0Batch = plotpc(net.IW{1},0);
set(dreaptaSolutieInvatataB0Batch,'color','r','linewidth',2);


