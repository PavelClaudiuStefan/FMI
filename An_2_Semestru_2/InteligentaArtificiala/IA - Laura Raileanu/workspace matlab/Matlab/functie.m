function [ ] = functie( )
    x = [-10 -9 -8 -7 -6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6 7 8 9 10];
    y = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
    for i=1:1:size(x)
        if x(i) <= 2 
            y(i) = 2*x(i) + 8;
        else 
            y(i) = 3 * x(i)*x(i);
        end
    end
    plot(x, y);
end

