function [ rezultat ] = genereazaExemple(f,sigma,n)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%Functia genereaza perechea de numere xi si ui ce respecta conditiile
%impuse
%punctul a
u=[];
x=rand(1,n);
eps=randn(1,n);
g=f(x)+sigma*eps;
rezultat=[x;g];
end

