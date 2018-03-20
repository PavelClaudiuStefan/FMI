function [ x ] = GaussFaraPiv( A,b )
A=[A,b];
n = length(b);
for k=1:n-1
    p=k;
    if A(p,k)==0
        while A(p,k)==0 && p<=n
            p=p+1;
        end;
    end
    if A(p,k)==0
        display('Sist. incomp. sau comp. nedet.');
        break
    end
    if p~=k
       A([p,k],:) = A([k,p],:);
    end
    for l=k+1:n
        A(l,:) = A(l,:)-A(l,k)/A(k,k)*A(k,:);
    end
end
if A(n,n) == 0
    display('Sist. incomp. sau comp. nedet.')
end
x=SubsDesc(A(1:n,1:n),A(:,n+1)); 
end  

