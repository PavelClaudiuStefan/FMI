function subiectul1b( X, d )

newX = X;
%adaugam o linie de 1 pentru a o inmulti cu bias-urile
newX(size(newX,1) + 1,:) = ones(1, size(newX,2));
% setam ponderile initiale ca avand valori distribuite uniform pe [-1;1]
w = rand(1, size(newX,1));

%cat timp avem puncte incorect clasificate
while ~isequal(d, hardlims(w * newX))
    %actualizam ponderile si bias-ul
    w = w + 0.5 * ((d - hardlims(w * newX)) * newX');
end

%punem graficele pe ecran
plotpv(newX(1:size(newX,1) - 1,:), hardlim(d));
plotpc(w(1:size(w, 2) - 1), w(size(w,2)));

end