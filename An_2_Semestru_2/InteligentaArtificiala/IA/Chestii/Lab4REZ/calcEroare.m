function [ E ] = calcEroare( rez,p )
%F Summary of this function goes here
%   Detailed explanation goes here
    x=rez(1, :);
    u=rez(2, :);    %ce a prezis ca va iesi
    
    y=polyval(p,x);  %ce iese de fapt
    
    E=mean((u-y).^2);
end

