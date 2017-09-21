function [ p ] = gasestePol( rez, n )
%E Summary of this function goes here
%   Detailed explanation goes here
     x=[];u=[];
    
    x=rez(1, :);
    u=rez(2, :);
    
    p=polyfit(x,u,n);

end

