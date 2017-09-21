function lab5c( X, d )

newX = X;
newX(size(newX,1)+1,:) = ones(1, size(newX,2));
w = rand(1, size(newX,1));
bestw = w;
done = false;
i = 1;
iterations = [];
cosines = [];
while i <= 500 && ~done
    for j = 1:size(newX,2);
        wold = w;
        w = w + 0.5 * (d(j) - hardlims(w * newX(:,j))) * newX(:,j)';
        if isequal(hardlims(w * newX), d)
            done = true;
            break;
        end
        if i > 1
            iterations(size(iterations,1) + 1) = i;
            cosines(size(cosines,1) + 1) = dot(wold, w) / (norm(wold) * norm(w));
        end
        if sum((d - hardlims(w * newX)) == 0) > sum((d - hardlims(bestw * newX)) == 0)
            bestw = w;
        end
    end
    i = i + 1;
end
plot(iterations,cosines);
if done
    disp('Multimea este liniar separabila.');
else
    disp('Multimea este neliniar separabila.');
    disp('Punctele incorect clasificate sunt:');
    disp(X(:,[d - hardlims(bestw * newX) ~= 0]));
end

end