function [ w ] = perc( x, d, ro, fn_transfer )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    [n m] = size(x);
    w = rand(1,n);
    for j=1:1:50
        for i=1:1:m
            y = fn_transfer(w * x(:,i));
            w = w + ro*(d(i) - y)*x(:,i)';
            
        end
    end
end

