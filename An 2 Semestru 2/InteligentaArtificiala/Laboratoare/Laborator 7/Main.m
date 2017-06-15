%datele: exemplele + etichetele
X = [0 0 0 0.5 0.5 0.5 1 1;0 0.5 1 0 0.5 1 0 0.5];
T = [1 1 1 1 -1 -1 -1 -1];
%reprezentare grafica a datelor
figure(1), hold on;
eticheta1 = find(T==1);
etichetaMinus1 = find(T==-1);
plot(X(1,eticheta1),X(2,eticheta1),'or');
plot(X(1,etichetaMinus1),X(2,etichetaMinus1),'xg');
axis([-2 2 -2 2]);
%pune pauza 2 secunde
pause(2);
%creaza perceptron
net = newp([-1 1;-1 +1],1,'hardlims');
view(net);
pause(5);
%afiseaza proprietatile perceptronului legate de vectorul de ponderi + bias
disp('Proprietati legate de vectorul de ponderi:');
disp(net.inputWeights{1});
pause(3);
disp('Proprietati legate de bias:');
disp(net.biases{1});
pause(3);
%initializeaza parametri retelei, implicit ponderile + bias sunt nule
net = init(net);
%seteaza numarul de epoci pentru antrenare
net.trainParam.epochs = 100;
%antreneaza reteaua
[net,antrenare] = train(net,X,T);
figure(1);
%ploteaza dreapta de separare
plotpc(net.IW{1},net.b{1})
title('Reprezentarea grafica a exemplelor de antrenare si a dreptei de separare');
%simuleaza reteaua pentru datele de intrare
etichetePrezise = sim(net,X);
isequal(etichetePrezise,T)