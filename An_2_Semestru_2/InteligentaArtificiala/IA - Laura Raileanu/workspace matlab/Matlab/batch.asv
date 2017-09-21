function [ w ] = batch( x, d, ro, fn_transfer )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    [n m] = size(x);
    x(n + 1, :) = ones(1, m);
    w = rand(1, n+1);   
    s = zeros(1,n);  
    

    while sum(d ~= fn_transfer(w * x)) ~= 0 
        %s = (d - fn_transfer(w * x)) * x';
        %w = w + ro*s;
        for i=1:m
             normalizare = X(:,i)/norm(X(:,i));
             y = hardlims(w * normalizare);
             w = w + ro * (D(i) - y) * normalizare';
        end
    end
    plotpv(x, hardlim(d))
   
  
end

