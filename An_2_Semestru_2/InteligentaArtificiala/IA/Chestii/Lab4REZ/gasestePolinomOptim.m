function [ p ] = gasestePolinomOptim( s,n )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%gaseste un polinom de grad n care sa aiba cat mai putine erori fata de
%valorile pe care ar trebuii sa le aiba
%punctul d
[nl,nc]=size(s);
x=[];
y=[];
for i=1:nc
    x(i)=s(1,i);
    y(i)=s(2,i);
p=polyfit(x,y,n);
end

