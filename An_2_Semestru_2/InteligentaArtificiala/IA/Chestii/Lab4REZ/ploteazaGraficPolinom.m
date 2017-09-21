function [  ] = ploteazaGraficPolinom( p )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%afiseaza polinomul
%punctul e
v=polyval(p,[0:0.01:1]);
plot([0:0.01:1],v,'s')
end

