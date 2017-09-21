function [ wk1, bk1 ] = Test1( S, ro, wk, bk )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

    w = [wk bk];
    [n m] = size(S);
    X = S(1:n-1,:);
    D = S(n,:);
    X(n,:) = ones(1,m);
    for i=1:m
        normalizare = X(:,i)/norm(X(:,i));
        y = hardlims(w * normalizare);
        w = w + ro * (D(i) - y) * normalizare';
    end
    wk1 = w(:, 1:n-1);
    bk1 = w(:, n);

end

