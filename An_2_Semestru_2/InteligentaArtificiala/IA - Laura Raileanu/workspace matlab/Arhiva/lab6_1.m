P = [-0.5 -0.5 -0.3 -0.1 -40; -0.5 0.5 -0.5 1 50];
T = [1 1 0 0 1];
plotpv(P, T);
net = newp(P, T, 'hardlim', 'learnpn');
old = [];
iterations = 0;
while ~isequal(sim(net,P), T)
    net = adapt(net, P, T);
    if old
        old = plotpc(net.IW{1, 1}, net.b{1}, old);
    else
        old = plotpc(net.IW{1, 1}, net.b{1});
    end
    pause(0.5);
    iterations = iterations + 1;
end
disp(iterations);