function [net] = lab6ex1(net,p,t) 
net.adaptParam.passes = 100; 
error = 1; 
plotpv(p,t); 
lineHandler = plotpc(net.IW{1,1},net.b{1}); 
step = 0; 
while error 
    step = step + 1; 
    net = adapt(net,p,t);
    error = sum(abs(sim(net,p) - t)); 
    lineHandler = plotpc(net.IW{1,1},net.b{1},lineHandler);
    pause(1);
end 
disp(net.IW{1,1});
disp(net.IW{1,1});
net = newp([-1 1; -1 1],1,'hardlim','learnpn');
error = 1; 
