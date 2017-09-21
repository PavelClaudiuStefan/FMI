%1
X = randi([-30 20], 2, 240);

%2
for i = 1:240
    if (X(1,i) < X(2,i))
        T(1,i) = 0;
        T(2,i) = 1;
    else
        T(1,i) = 1;
        T(2,i) = 0;
    end
end

%3
plotpv(X,T);

%4
print('Plot1','-djpeg');

for i = 1:1:240
    M(1, i) = X(1,i);
    M(2, i) = X(2,i);
    M(3, i) = T(1,i);
end

save ('matrice.mat', 'M');

%5
W = [0 0 0];

net = newp([-30 20; -30 20], 1, 'hardlim', 'learnwh');
net = train(net, X, T(1,:));

plotpv(X, T(1,:));
plotpc(net.IW{1, 1}, net.b{1});

print('Plot2','-djpeg');