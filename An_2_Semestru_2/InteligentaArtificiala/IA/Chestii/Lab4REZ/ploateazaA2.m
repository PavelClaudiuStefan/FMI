function [ output_args ] = ploateazaA2( p )
%D Summary of this function goes here
%   Detailed explanation goes here
    x=[0:0.01:1];
    y=polyval(p,x);
    
    plot(x,y,'-')

end

