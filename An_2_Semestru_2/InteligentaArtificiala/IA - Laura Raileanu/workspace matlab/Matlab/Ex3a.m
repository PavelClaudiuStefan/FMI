function Ex3a()

    n=100;
    x=rand(2,n);
    i=find(x<0.5);
    x(i)= -1 * ones(size(i),1) + rand(size(i),1);
    for i=1:100
        if 2* x(1,i) - x(2,i) >= 0
            d(i) = 1;
        else
            d(i) = -1;
        end
    end
    
    [n m] = size(x);
    x(n + 1, :) = ones(1, m);
    w = rand(1, n+1);   
    s = zeros(1,n);  
    ro = 0.5;

    while sum(d ~= hardlims(w * x)) ~= 0 
        %s = (d - fn_transfer(w * x)) * x';
        %w = w + ro*s;
        for i=1:m
             normalizare = x(:,i)/norm(x(:,i));
             y = hardlims(w * normalizare);
             w = w + ro * (d(i) - y) * normalizare';
        end
    end
    plotpv(x(1:2,:), hardlim(d))
    plotpc(w(1:n), w(n+1))
    hold on
    plotpc([2 -1], [0])
   
end

