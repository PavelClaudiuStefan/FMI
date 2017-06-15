function [X, Y] = genereaza(m, depl)

X = 2 * rand(m, 2) - 1;
Y = ones(m, 1)* -1;
Y(X(:,1) - X(:,2) < 0) = 1;

X(Y==1, 2) = X(Y==1, 2) + depl;
X(Y==-1, 2) = X(Y==-1, 2) - depl;

plot(X(Y==1, 1), X(Y == 1, 2), '*b')
hold on
plot(X(Y==-1, 1), X(Y == -1, 2), '*r')
hold on

end