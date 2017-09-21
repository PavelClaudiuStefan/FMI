function A
load x.mat;
load t.mat;

net = newp([-1 1; -1 1], 1);
net.trainParam.epochs = 1000;
net.inputweights{1,1}.initFcn = 'rands';
net.biases{1}.initFcn = 'rands';

net = init(net);

net = train(net,x',t');


y = sim(net,x');

fprintf('Eroare este de %g\n', numel(find(y' ~= t)) / size(t,1));

plotSet(x, y', [net.IW{1,1} net.b{1}]);
plotpc(net.IW{1,1}, net.b{1});


end

