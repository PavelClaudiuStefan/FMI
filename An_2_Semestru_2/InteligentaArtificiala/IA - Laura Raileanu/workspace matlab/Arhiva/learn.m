function [ w ] = learn( X, d )

w = rand(1, size(X,1));
maxEpochs = 10;
for i = 1:maxEpochs
    for j = 1:size(X,2);
        if w * X(:,j) > 0
            y = 1;
        else
            y = -1;
        end
        if y ~= d(j)
            w = w + d(j) * X(:,j)';
        end
    end

end

