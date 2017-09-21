function lab6_2ab( X, d )

maxEpochs = 1000;
newX = X;
newX(size(X,1) + 1,:) = ones(1, size(X,2));
done = false;
i = 1;
w = rand(1, size(newX,1));
bestw = w;
while i <= maxEpochs && ~done
    w = w + 0.5 * ((d - hardlims(w * newX)) * newX');
    if sum((d - hardlims(w * newX)) == 0) > sum((d - hardlims(bestw * newX)) == 0)
       bestw = w;
    end
    if isequal(d, hardlims(w * newX))
        done = true;
    end
    i = i + 1;
end
if done
    disp('Multimea de antrenare este liniar separabila.');
    plotpv(newX(1:size(newX,1) - 1,:), hardlim(d));
    plotpc(w(1:size(w, 2) - 1), w(size(w,2)));
else
    disp('Multimea este neliniar separabila.');
    plotpv(newX(1:size(newX,1) - 1,:), hardlim(d));
    plotpc(bestw(1:size(bestw, 2) - 1), bestw(size(bestw,2)));
    disp('Punctele incorect clasificate sunt:');
    disp(X(:,d - hardlims(bestw * newX) ~= 0));
end

end

