function [ rezultat ] = Ex1learnp( P, D )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    net = newp(P, D, 'hardlim', 'learnp');
    iteratii = 0;
    net = adapt(net, P, D);
    while ( isequal(sim(net, P), D) == false)
        iteratii = iteratii + 1;
        
        
        net = adapt(net, P, D);
        plotpv(P, D)
        plotpc(net.IW{1,1}, net.b{1})
        hold off;
        pause(0.5);
    end
    iteratii
    rezultat = sim(net, P);
    
end

