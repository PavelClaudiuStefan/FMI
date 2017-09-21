function [ rez ] = generareA( f, sigma, n )
%1 Summary of this function goes here
%   Detailed explanation goes here
    x= rand(1,n);
    eps=randn(1,n);
    u =f(x)+sigma*eps;
    
    rez=[x;u];
    

end

