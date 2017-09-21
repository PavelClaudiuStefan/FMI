function [ class ] = classify( x )

if 2 * x(1) - x(2) > 0
    class = 1;
else
    class = 0;
end

end

