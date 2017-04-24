function matrice = prob2(v1, v2)

matrice = zeros(2, 2);

for i = 1:size(v1, 2)
        matrice(v1(i)+1, v2(i)+1) = matrice(v1(i)+1, v2(i)+1) + 1;
end
end