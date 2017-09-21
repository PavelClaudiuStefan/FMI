function [ output_args ] = ploateazaExemple( s )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
%afiseaza punctele generate la pasul a
%punctul c
[nl,nc]=size(s);
x=[];u=[];
for i=1:nc
    x(i)=s(1,i);
    u(i)=s(2,i);
end
plot(x,u,'d')
end

