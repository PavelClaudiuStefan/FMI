function lab6_2c( X, d )

maxEpochs = 1000;
newX = X;
newX(size(X,1) + 1,:) = ones(1, size(X,2));
done = false;
i = 1;
w = rand(1, size(newX,1));
bestw = w;
iterations = [];
cosines = [];
while i <= maxEpochs && ~done
    wold = w;
    w = w + 0.5 * ((d - hardlims(w * newX)) * newX');
    if sum((d - hardlims(w * newX)) == 0) > sum((d - hardlims(bestw * newX)) == 0)
       bestw = w;
    end
    if i > 1
        iterations(size(iterations,1) + 1) = i;
        cosines(size(cosines,1) + 1) = dot(wold, w) / (norm(wold) * norm(w));
    end
    if isequal(d, hardlims(w * newX))
        done = true;
    end
    i = i + 1;
end
plot(iterations, cosines);
if done
    disp('Multimea de antrenare este liniar separabila.');
else
    disp('Multimea este neliniar separabila.');
    disp('Punctele incorect clasificate sunt:');
    disp(X(:,d - hardlims(bestw * newX) ~= 0));
end

end