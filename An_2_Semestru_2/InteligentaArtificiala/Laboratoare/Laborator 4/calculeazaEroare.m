function [err] = calculeazaEroare(p, X, U)

Y1 = polyval(p, X);

err = mean(Y1 - U).^2;

end