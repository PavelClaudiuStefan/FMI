function [x, L] = DescCholesky(A,b)
    %Step 1
   if( A(1,1) <= 0 )
       print('A nu este pozitiv definita');
       return;
   end
   
   n = length(b);
   L(1,1) = sqrt(A(1,1));
   for i = 2:n
       L(i,1) = A(i,1) / L(1,1);
   end

    %Step 2
    for k = 2:n
        sum = 0;
        for s=1:k-1
            sum = sum + L(k,s).^2;
        end
        result = A(k,k) - sum;
        if result <= 0
            print('A nu este pozitiv definita');
            return;
        end
        L(k,k) = sqrt(result);
        for i = k+1 : n
            sum = 0;
            for s = 1:k-1
                sum = sum + L(i,s) * L(k,s);
            end
            L(i,k) = ( A(i,k) - sum ) / L(k,k);
        end
    end
   
    %Step 3
    y = SubsAsc(L,b);
    %Step 4
    x = SubsDesc(L',y);
end