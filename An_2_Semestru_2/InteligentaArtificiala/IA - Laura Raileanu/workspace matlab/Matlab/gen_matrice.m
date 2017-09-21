function [ A ] = gen_matrice(n)

for i=1:1:n
    for j=1:1:n+1
        if i==j
            A(i,j) = 2;
        elseif abs(i - j) == 1
            A(i,j) = -1;
        else A(i,j) = 0;
        end
    end
end


end

