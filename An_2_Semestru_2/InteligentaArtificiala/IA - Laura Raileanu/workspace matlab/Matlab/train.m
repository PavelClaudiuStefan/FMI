function [ output_args ] = trainLab( net, p, t )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    
    net.trainParam.epochs = 1;
    net = train(net, p,t);
    plotpc(net.IW{1,1}, net.b{1});
    plotpv(p,t);
    while(sum(sim(net,p) ~= t) ~= 0)
        net = train(net, p,t);
        plotpc(net.IW{1,1}, net.b{1});
        hold off;
        pause(0.5);
    end

end

