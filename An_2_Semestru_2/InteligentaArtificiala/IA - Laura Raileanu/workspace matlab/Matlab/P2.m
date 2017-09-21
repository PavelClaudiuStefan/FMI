function P2
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
p = [0 0 0 0.5 0.5 0.5 1 1; 0 0.5 1 0 0.5 1 0 0.5];
t = [1 1 1 1 0 0 0 0];
net = newp([-1 1; -1 1], 1);
net.adaptParam.passes = 100;
% net.inputweights{1,1}.initFcn = 'rands';
% net.biases{1}.initFcn = 'rands';
net = adapt(net, p, t);
plotpv(p, t);
hold on;
plotpc(net.IW{1,1}, net.b{1});

%a = net.IW{1};
%asd1 = (a(1)*-6+ net.b{1})/ -(a(2)+.0000001);
%asd2 = (a(1)+ net.b{1})/-(a(2)+.0000001);
%plot([-2 2],[asd1 asd2])

end

