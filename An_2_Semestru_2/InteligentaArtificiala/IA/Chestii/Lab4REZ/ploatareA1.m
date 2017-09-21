function [ output ] = ploatareA1( rez )
%2 Summary of this function goes here
%   Detailed explanation goes here
    x=[];u=[];
    
    x=rez(1, :);
    u=rez(2, :);
    
    plot(x,u,'d');
    
    
    

end

