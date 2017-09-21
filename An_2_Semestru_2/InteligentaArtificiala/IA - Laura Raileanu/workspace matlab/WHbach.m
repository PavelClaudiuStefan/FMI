function [ w, jw] = WHbach( x,labels,r,func)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    maxEpochs = 100;
    m = size(x,1);
    w = rand(m,1)';
    w = w';
    for i = 1:1:maxEpochs
        ok = false;
        sum = 0;
        jw = 0;
        for j = 1:1:size(x,2)
           newLabel =  x(:,j)' * w;
           newLabel = func(newLabel);
           sum = sum + (labels(j) - newLabel)*x(:,j);
           jw = jw + (labels(j) - newLabel)^2;
           if (newLabel ~= labels(j))
                ok = true;
           end
        end
        w = w + r*sum;
        if ok == false
            break;
        end
    end
    jw = jw/2;
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

