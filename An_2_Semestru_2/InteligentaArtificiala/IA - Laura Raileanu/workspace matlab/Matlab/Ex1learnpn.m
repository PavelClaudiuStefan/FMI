function [ net ] = Ex1learnp( P, D )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    net = newp(P, D, 'hardlim', 'learnpn');
    iteratii = 0;
    net = adapt(net, P, D);
    while ( isequal(sim(net, P), D) == false)
        iteratii = iteratii + 1;
        net = adapt(net, P, D);
    end
    iteratii
end

