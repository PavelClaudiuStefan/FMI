function [ output_args ] = adaptLab(  )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

    net = newp([-2 2; -2 2], 1);
    p = [2 1 -1 -1; 2 -2 2 1] % datele de intrare
    t = [0 1 0 1] % valorile target
    net.adaptParam.passes = 100;
    net = adapt(net, p, t);
    plotpv(p,t); % reprezint? grafic punctele
    hold on
    plotpc(net.IW{1,1}, net.b{1}); % reprezint? grafic dreapta separatoare

end

