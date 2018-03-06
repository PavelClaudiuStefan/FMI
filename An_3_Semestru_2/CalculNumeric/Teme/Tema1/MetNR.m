function xaprox=MetNR(f,f2,x0,eps)
    x(1) = x0;
    k=1;
    while true
        k = k + 1;
        x(k) = x(k-1) - f(x(k-1))/f2(x(k-1));
        if abs(x(k) - x(k-1)) / abs(x(k-1)) >= eps
            break;
        end
    end
    xaprox = x(k)
end

