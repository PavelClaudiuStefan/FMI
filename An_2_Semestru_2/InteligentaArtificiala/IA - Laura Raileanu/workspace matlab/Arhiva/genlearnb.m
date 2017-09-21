function [ w ] = genlearnb( X, d, ro, tranfunc )

maxEpochs = 100;
w = rand(1, size(X,1));
for i = 1:maxEpochs
    w = w + ro * ((d - tranfunc(w * X)) * X');

end

