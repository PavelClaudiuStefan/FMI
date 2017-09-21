function [ w ] = WHincrem( x,labels,r,func)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    maxEpochs = 2000;
    m = size(x,1);
    w = rand(m,1)';
    w = w';
    for i = 1:1:maxEpochs
        ok = false;
        for j = 1:1:size(x,2)
           newLabel =  x(:,j)' * w;
           newLabel = func(newLabel);
           if newLabel ~= labels(j)
               w = w + r*(labels(j) - newLabel)*x(:,j);
               ok = true;
           end
        end
        if ok == false
            break;
        end
    end
    ok = false;
    for i = 1:1:length(labels)
        if(labels(i) < 0)
            ok = true;
            break;
        end
    end
    if ok
        labels = hardlim(labels);
    end
    plotpv(x(1:2,:),labels);
    plotpc(w(1:2)',0);
end

