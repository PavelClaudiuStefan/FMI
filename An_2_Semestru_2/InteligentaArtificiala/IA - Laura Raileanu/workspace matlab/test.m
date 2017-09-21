function [ ] = Problema1( )
    
    m = 50;
    
    for i = 1 : m
        X(1, i) = unifrnd(-1, 1);
        X(2, i) = unifrnd(-1, 1);
    end
    
    % 2x - y = 0
    for i = 1 : m
        if (2 * X(1, i) - X(2, i) < 0)
            T(i) = -1;
        else
            T(i) = 1;
        end
    end
    p = X;
    t = T;
    
    net = newp([-1 1; -1 1], 1, 'hardlims', 'learnpn');
    net.trainParam.epochs = 1000;
    net.trainParam.showWindow = false;
    
    net = train(net, p, t);
    plotpv(p, hardlim(t));
    plotpc(net.IW{1, 1}, net.b{1});
    
    y1 = confusionmat(hardlim(T), hardlim(SIM(net, X))) 
end