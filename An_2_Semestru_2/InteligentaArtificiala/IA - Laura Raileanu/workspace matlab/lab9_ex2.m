p = 2*rand(10,5) - 1;
p = p';
t = mean(p);
net = newlin(p,t);
net.trainParam.epochs = 1000;
net.trainParam.goal = 0;
[net tr y e] = train(net,p,t);
net.IW{1,1}
net.b{1}
