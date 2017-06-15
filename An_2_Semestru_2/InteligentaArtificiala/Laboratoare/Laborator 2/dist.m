function [d] = dist(a, b) 
    sa = size(a);
%     sb = size(b);
%     else
%     nrl = sa(1);
    nrc = sa(2);
    temp = [0; 0];
    for i = 1:1:nrc
        for j = 1:1:nrc
            temp = temp + ((a(:, j) - b(i,j)).^2);
        end
        d(:,i) = temp;
    end
    d = sqrt(d);
end