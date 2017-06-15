function [W, b] = antreneaza(X, T, nrMaxEp)

W = [0 0];
b = 0;
k = 0;
while k <=nrMaxEp
    for i=1:size(X, 1)
        y = hardlims(W * X(i,:)' + b);
        if y ~=T(i)
            ok = 1;
            W = W + X( i,:) * T(i);
            b = b + T(i);
        end
    end
    if ok == 0
        break;
    end
    k = k + 1;
end


end