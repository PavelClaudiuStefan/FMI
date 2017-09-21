function [ W ] = punctePerceptronBatch( X,D,q,f )
%adapt
    [n m] = size(X);
    X(n + 1, :) = ones(1, m);
    W = rand(1, n+1);
    
    while sum(D ~= f(W * X)) ~= 0 
        S=0;
        for i=1:m
            y = f(W * (X(:,i)/norm(X(:,i))));
            if D(i)~= y
                S = S + (D(i)-y) * (X(:,i)/norm(X(:,i)))';
            end
        end
        W = W + q * S;
    end
    y = f(W*X);
    y
    D
    y ~= D
end
