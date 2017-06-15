load exempleAntrenare;
xTrain = exempleAntrenare(:,1);
uTrain = exempleAntrenare(:,2);
%xTrain = x; uTrain = y; exempleAntrenare=[x' y'];

load exempleTest;
xTest = exempleTest(:,1);
uTest = exempleTest(:,2);
%xTest=x1; uTest=y1; exempleTest=[x1' y1'];

%punctul a
ploteazaExemple(exempleAntrenare);
title('Exemple de antrenare');

gradPolinom = 0:1:9;
eroareAntrenare = zeros(1,length(gradPolinom));
eroareTest = zeros(1,length(gradPolinom));

figure, hold on
for i =1:length(gradPolinom);
    
    %punctul b
    P = gasestePolinomOptim(exempleAntrenare,gradPolinom(i));
    
    %punctul c + e
    subplot(4,3,i);hold on;
    ploteazaExemple(exempleAntrenare);
    ploteazaGraficPolinom(P);
    legend('Exemple de antrenare', ['Solutia de grad ' num2str(gradPolinom(i))]);
    axis([0 1 -1.5 1.5]);
    
    %punctul d
    pTrain = polyval(P,xTrain);
    eroareAntrenare(i) = calculeazaEroare(uTrain,pTrain);
    
    pTest = polyval(P,xTest);
    eroareTest(i) = calculeazaEroare(uTest,pTest);
end

%punctul f + g
figure, hold on
plot(gradPolinom, eroareAntrenare,'r');
plot(gradPolinom, eroareTest,'b');
legend('eroarea pe exemplele de antrenare','eroarea pe exemplele de test');

%punctul i

figure, hold on
indiciAleatori = randperm(size(exempleAntrenare,1));
S1 = exempleAntrenare(1:0.7*length(indiciAleatori),:);
S2 = exempleAntrenare(0.7*length(indiciAleatori)+1:end,:);

xTrain = S1(:,1);
uTrain = S1(:,2);
xTest = S2(:,1);
uTest = S2(:,2);

eroareAntrenare = zeros(1,length(gradPolinom));
eroareValidare = zeros(1,length(gradPolinom));
for i =1:length(gradPolinom);
    
    
    P = gasestePolinomOptim(S1,gradPolinom(i));
    
    subplot(4,3,i);hold on;
    ploteazaExemple(S1);
    ploteazaGraficPolinom(P);
    legend('Exemple de antrenare', ['Solutia de grad ' num2str(gradPolinom(i))]);
    axis([0 1 -1.5 1.5]);
    
    pTrain = polyval(P,xTrain);
    eroareAntrenare(i) = calculeazaEroare(uTrain,pTrain);
    
    pTest = polyval(P,xTest);
    eroareValidare(i) = calculeazaEroare(uTest,pTest);
end

figure, hold on
plot(gradPolinom, eroareAntrenare,'r');
plot(gradPolinom, eroareValidare,'b');
legend('eroarea pe exemplele de antrenare S1','eroarea pe exemplele de validare S2');


gradOptim = gradPolinom(find(eroareValidare == min(eroareValidare)))

