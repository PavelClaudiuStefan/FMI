
function [w, y, error] = batchPerceptron(x, t, epochs, r)

[m , n] = size(x);

w = rand(n + 1, 1) * 2 - 1; % ponderile initializate in intervalul -1, 1
y = zeros(m,1); % output-ul

for e = 1:epochs
    
    %p = randperm(m);
    %x = x(p,:);
    %t = t(p);
    
    s = zeros(1, n+1);
    
    for i = 1:m
        xi = [x(i,:) 1]; 
        out = xi * w;
        if out > 0
            y(i) = 1;
        else
            y(i) = -1;
        end
        
        if t(i) ~= y(i)
            %w = w + t(i) * xi';
            s = s + t(i)*xi;
        end
    end
    w = w + r * s';
    mse((y-t)*0.5)
end

error = nnz(gsubtract(y,t)) / m

end

