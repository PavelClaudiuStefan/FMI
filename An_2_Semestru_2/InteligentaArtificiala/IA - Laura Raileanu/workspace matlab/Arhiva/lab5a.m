function lab5a( X, d )

newX = X;
newX(size(newX,1)+1,:) = ones(1, size(newX,2));
w = rand(1, size(newX,1));
done = false;
i = 1;
while i <= 500 && ~done
    for j = 1:size(newX,2);
        w = w + 0.5 * (d(j) - hardlims(w * newX(:,j))) * newX(:,j)';
        if isequal(hardlims(w * newX), d)
            done = true;
            break;
        end
    end
    i = i + 1;
end
plotpv(newX(1:size(newX,1) - 1,:), hardlim(d));
plotpc(w(1:size(w, 2) - 1), w(size(w,2)));
end

