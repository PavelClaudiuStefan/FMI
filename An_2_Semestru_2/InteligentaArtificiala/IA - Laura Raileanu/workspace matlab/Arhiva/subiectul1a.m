function [ nw, nb ] = subiectul1a( P, T, w, b, ro )

%cream un nou vector care va contine ponderile + bias
weights = w;
weights(size(w, 2) + 1) = b;
%normalizam vectorii de intrare
newP = normc(P);
%adaugam o linie de 1 pentru a o inmulti cu bias-urile
newP(size(P,1) + 1, :) = ones(1, size(P,2));
%actualizam ponderile si bias-ul
weights = weights + ro * ((T - hardlims(weights * newP)) * newP');
%returnam ponderile actualizate
nw = weights(1:(size(weights, 2) - 1));
%returnam bias-ul actualizat
nb = weights(size(weights, 2));

end

