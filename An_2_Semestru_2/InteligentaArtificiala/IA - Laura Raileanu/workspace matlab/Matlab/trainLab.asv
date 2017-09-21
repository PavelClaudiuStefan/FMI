function [ output_args ] = trainLab(  p, t )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    net = newp([-2 2;-2 +2],1);
    net.trainParam.epochs = 1;
    net = train(net, p,t);
    plotpc(net.IW{1,1}, net.b{1});
    plotpv(p,t);
    sim(net,p)
    hold on;
    while(sum(sim(net,p) ~= t) ~= 0)
        net = train(net, p,t);
        plotpc(net.IW{1,1}, net.b{1});
        hold on;
        pause(0.5);
        tri = 6
    end

end

