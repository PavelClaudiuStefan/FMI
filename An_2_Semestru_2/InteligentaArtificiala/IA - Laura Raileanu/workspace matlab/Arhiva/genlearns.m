function [ w ] = genlearns( X, d, ro, tranfunc )

maxEpochs = 10;
w = rand(1, size(X,1));
for i = 1:maxEpochs
    for j = 1:size(X,2);
        w = w + ro * (d(j) - tranfunc(w * X(:,j))) * X(:,j)';
    end
end

end

