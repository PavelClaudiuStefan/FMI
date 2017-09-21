function [ ] = L5pag12 (p,t)

    w=[0 0];
    b=[0];
    cond=true;
    [n m]=size(p);
    while (cond)     
        cond=false;
        for i=1:m
            a=hardlim(w*p(:,i)+b);
            e=t(i)-a;
            w=w + e * p(:,i)';
            b=b+e;
            if(e==1) cond = true;
            end
        end
    end

end