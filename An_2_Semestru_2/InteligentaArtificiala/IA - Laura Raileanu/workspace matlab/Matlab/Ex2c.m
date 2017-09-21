function Ex2c( x, d, ro, fn_transfer )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    [n m] = size(x);
    x(n + 1, :) = ones(1, m);
    w = rand(1, n+1);    
    j = 0;
    s = zeros(1,n+1);
    min = n;
    y=[];
    while ( j < 1000 && sum(d ~= fn_transfer(w*x)) ~= 0)
        s = s + (d - fn_transfer(w * x)) * x';
        wk=w;
        w = w + ro*s;   
        j = j + 1;
        if(sum(d ~= fn_transfer(w*x))<min)
            min = sum(d ~= fn_transfer(w*x));
            best = w;
        end
        y(j)=dot(wk,w)/(norm(wk)*norm(w));
    end
    if(j==1000)
        w = best;
        disp('Multimea nu e liniar separabila');
    else
        disp('Multimea e liniar separabila');
    end
    
    plotpv(x(1:n, :), hardlim(d))
    plotpc(w(1:n), w(n+1))
    hold on;
    v=1:j;
    plot(v,y);


end

