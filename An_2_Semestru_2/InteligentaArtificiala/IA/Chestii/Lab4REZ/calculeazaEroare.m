function [ E ] = calculeazaEroare( s,p )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here  
%punctul f
%calculeaza eroarea dintre rezultatele date de polinom si ce ar trebuii sa
%dea
[nl,nc]=size(s);
x=[];
u=[];
for i=1:nc
    x(i)=s(1,i);
    u(i)=s(2,i);
v=polyval(p,x);
%E=mse(x,u,v); 
%daca o folosim pe mse ne da aceasi eroare peste tot :|
E=mean((u-v).^2); 
%nu am inteles exact pe care dintre cele doua trebuie sa
%o folosim
end

