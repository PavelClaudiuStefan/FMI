function Test233_2
X = [0 0; 0 1; 1 0; 1 1]';

% vectorul [1 1] va avea eticheta 1, iar restul vectorilor vor avea eticheta 0;
T = [0 0 0 1];

% Aplicati algoritmul Widrow-Hoff, varianta batch, pentru 4 epoci. 
% Rata de invatare este .3, iar memoria intiala este [2 2]. 
% Biasul va fi 0. 
% Plotati punctele, impreuna cu dreapta de separatie.

learn_rate = 0.3;
w = [2 2]';
bias = [0];
figure
for i = 1 : 4
    sum = 0;
    sbi = 0;
    for j = 1 : length(X)
        error = (T(j) - X(:,j)' * w) * X(:,j);
        sum = sum + error;
        sbi = sbi + (T(j) - X(:,j)' * w);
    end
sum = sum * learn_rate;
w = w + sum;

bias = norm(sbi)^2;
plotpv(X, T);
plotpc(w',bias);
disp('Batch:');
disp(i);
pause(1);
end

% Aplicati algoritmul Widrow-Hoff, varianta incrementala, pentru 4 epoci. 
% Rata de invatare este .1, iar memoria initiala este initializata random. 
% Biasul va fi 0. 
% Plotati punctele, impreuna cu dreapta de separatie obtinuta.

learn_rate = 0.1;
w = rand(1,2)';
bias = [0];
figure
for i = 1 : 4
    for j = 1 : length(X);
    error = (T(j) - X(:,j)' * w) * X(:,j);
    w = w + error * learn_rate;
    bias = (norm(T(j) - X(:,j)' * w))^2;
    end
    disp('Increm: ');
    disp(i);
    disp(' ');
    plotpv(X,T);
    plotpc(w',0);
    pause(1);
end;

% Comparati cele doua rezultate.
% Prin varianta batch, invata la final, pe cand prin varianta incrementala
% invata dupa fiecare epoca. Prin urmare, varianta incrementala este mult
% mai eficienta decat varianta batch.

end
    