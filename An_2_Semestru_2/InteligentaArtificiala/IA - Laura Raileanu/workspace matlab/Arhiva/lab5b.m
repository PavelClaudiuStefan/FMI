function lab5b( X, d )

newX = X;
newX(size(newX,1)+1,:) = ones(1, size(newX,2));
w = rand(1, size(newX,1));
bestw = w;
done = false;
i = 1;
while i <= 500 && ~done
    for j = 1:size(newX,2);
        w = w + 0.5 * (d(j) - hardlims(w * newX(:,j))) * newX(:,j)';
        if isequal(hardlims(w * newX), d)
            done = true;
            break;
        end
        if sum((d - hardlims(w * newX)) == 0) > sum((d - hardlims(bestw * newX)) == 0)
            bestw = w;
        end
    end
    i = i + 1;
end
if done
    disp('Multimea este liniar separabila.');
    plotpv(newX(1:size(newX,1) - 1,:), hardlim(d));
    plotpc(w(1:size(w, 2) - 1), w(size(w,2)));
else
    disp('Multimea este neliniar separabila.');
    plotpv(newX(1:size(newX,1) - 1,:), hardlim(d));
    plotpc(bestw(1:size(bestw, 2) - 1), bestw(size(bestw,2)));
    disp('Punctele incorect clasificate sunt:');
    disp(X(:,[d - hardlims(bestw * newX) ~= 0]));
end

end
