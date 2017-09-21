X = rand(2, 100);
for i = 1:size(X,2)
    while abs([2 -1] * X(:, i)) / sqrt(5) <= 0.25
        X(:,i) = rand(2, 1);
    end
end
%d = cellfun(@classify, num2cell(X, 1));
d = hardlim([2 -1] * X);
net = newp(X, d);
iterations = 0;
while ~isequal(sim(net,X), d)
    net = adapt(net, X, d);
    iterations = iterations + 1;
end
disp(iterations);