function [ w ] = Batch_general(X, d, ro, f_transfer)

    [n m] = size(X);
    X(n + 1, :) = ones(1, m);
    w = rand(1, n+1);
    max_epochs = 1000;
    
    for k = 1:max_epochs
        n1 = w * X; %linie
        y = f_transfer(n1); %linie
        s = (d - y) * X'; %linie * coloana
        w = w + ro * s;
    end
    f_transfer(w* X)
    d
    plotpv(X(1:n, :), hardlim(d))
    plotpc(w(1:n), w(3))
    
end

