% Aplicatie:
% Crearea si antrenarea unei retele neurale pentru aproximarea functiei 
% f : [-1,1] -> R, f(x) = sin(2*pi*x)

%-------------------------------------------------------------------------

% Se da multimea de antrenare
X = -1:0.05:1;
t = sin(2*pi*X) + 0.1*randn(size(X));

%-------------------------------------------------------------------------

% EX 1: Creati o retea avand un singur nivel ascuns cu 20 de perceptroni
% pentru aproximarea functiei f.

net = newff(minmax(X), [20,1], {'tansig', 'purelin'});
% folosind toti parametrii impliciti:
% net = newff(minmax(X),[20,1], {'tansig', 'purelin'},'trainlm','learngdm','mse');
% folosind sintaxa echivalenta:
% net = newff(X,t,[20],{'tansig', 'purelin'});


%-------------------------------------------------------------------------

% EX2: Antrenati reteaua, folosind algoritmul backprop cu momentum si rata 
% variabila, cat timp valoarea functiei de performanta/eroare (MSE) este 
% mai mare decat 0.001 si numarul de epoci este mai mic de 500.

% setarea functiei de performanta (inlocuirea functiei implicite): 
% net.performFcn = 'sse';

% setarea algoritmului de antrenare (inlocuirea algoritmului implicit)
net.trainFcn = 'traingdx';

% setarea parametrilor de antrenare
net.trainParam.epochs = 500;
net.trainParam.goal = 0.001;

% antrenarea retelei
[net antrenare] = train(net, X, t);

%-------------------------------------------------------------------------

% EX3: Sa se reprezinte grafic eroarea (MSE) dupa fiecare epoca.

figure(1)
hold on

subplot(1,2,1);
plot(antrenare.epoch, antrenare.perf);
axis([0 500 10^(-3) 10])

subplot(1,2,2);
semilogy(antrenare.epoch, antrenare.perf);
axis([0 500 10^(-3) 10])

%-------------------------------------------------------------------------

% EX4 - Exercitiu suplimentar:

clear

X = -1:0.05:1;
t = sin(2*pi*X) + 0.1*randn(size(X));

net = newff(minmax(X), [5,1], {'tansig', 'purelin'},'traingdx');
net.trainParam.epochs = 1;
epoca = 1;
maxEpoci = 50;
t1 = [0];
eroare = [mse(t - sim(net, X))];
er = eroare;
eps0 = 10^(-5);
timp = 30;

figure(2)

t0 = cputime;
while (cputime - t0 <= timp && epoca <= maxEpoci)
    
    [net antrenare] = train(net, X, t);
    
    t1 = [t1 cputime - t0 - eps0 cputime - t0];
    eroare = [eroare eroare(length(eroare)) mse(t - sim(net, X))];
    er = [er mse(t - sim(net, X))];
    epoca = epoca + 1;
    
end

% Comparatie grafice (timp vs eroare) si (epoca vs eroare)

% Graficul timp vs eroare
subplot(1,2,1)
semilogy(t1, eroare,'b');
hold on
axis([0 30 10^(-1) 10])

% Graficul epoca vs eroare
subplot(1,2,2)
semilogy(1:length(er), er,'r');
hold on
axis([0 50 10^(-1) 10]) 


%-------------------------------------------------------------------------

% EX5: (Imbunatatirea generalizarii) Implementati algoritmul de antrenare
% “Bayesian Regularization Backpropagation” folosind functia din Matlab
% ‘trainbr’ (net.trainFcn = ‘trainbr’). Precizati numarul efectiv de parametri
% folositi de retea. Precizati cati perceptroni sunt (de fapt) necesari pe 
% nivelul ascuns pentru aproximarea funcþiei f.

X = -1:0.05:1;
t = sin(2*pi*X) + 0.1*randn(size(X));

net = newff(minmax(X), [20,1], {'tansig', 'purelin'});

net.trainFcn = 'trainbr';

% setarea parametrilor de antrenare
net.trainParam.epochs = 500;
net.trainParam.goal = 10^(-5);

% antrenarea retelei
[net antrenare] = train(net, X, t);

% Numarul initial de parametri ai retelei (ponderi si bias-uri) este 61.
% Dupa antrenarea retelei numarul efectiv de parametri folositi de retea 
% (parametrii care nu mai sunt folositi de catre retea sunt cei egali cu zero 
% sau parametri de forma w (pondere) si b (bias) cu proprietatea ca 
% |w| < eps, |b| < eps, unde 0 < eps < 10^(-5)) devine aproximativ de 
% 12 - 15 parametri. 
% Este recomandat sa se repete de un numar de ori reinitializarea 
% parametrilor (ponderilor si bias-urilor) si reantrenarea retelei
% si sa se estimeze valoarea medie a numarului de parametri folositi efectiv.

%-------------------------------------------------------------------------

% EX6: (Imbunatatirea generalizarii) Folositi in procesul de antrenare tehnica
% ‘Early stopping’ si functiile de impartire a multimii de exemple/de invatare 
% in cele trei submultimi (multimea de antrenare, multimea de validare si 
% multimea de testare): ‘divideind’, ‘dividerand’, ‘divideint’ ºi ‘divideblock’.

clear

X = -1:0.05:1;
t = sin(2*pi*X) + 0.1*randn(size(X));

net = newff(minmax(X), [20,1], {'tansig', 'purelin'});

net.trainFcn = 'traingdx';

% setarea parametrilor de antrenare
net.trainParam.epochs = 500;
net.trainParam.goal = 10^(-5);

% pentru folosirea in procesul de antrenare a tehnicii ‘Early stopping’ se
% realizeaza setarea de mai jos, care permite impartirea multimii de 
% exemple/de invatare in cele trei submultimi (multimea de antrenare, 
% multimea de validare si multimea de testare)
net.divideFcn = 'divideind';

% functia de impartire a multimii de exemple, 'divideind' se foloseste in
% cazul in care se doreste impartirea manuala in cele trei submultimi; cu
% alte cuvinte se seteaza indicii de antrenare, indicii de validare si
% indicii de testare la care se gasesc datele din cele trei submultimi
% corespunzatoare.
m = size(X,2);
indici_antrenare = [1:4:m 3:4:m];
indici_validare = 2:4:m;
indici_testare = 4:4:m;
net.divideParam.trainInd = indici_antrenare;
net.divideParam.valInd = indici_validare;
net.divideParam.testInd = indici_testare;

% antrenarea retelei
[net antrenare] = train(net, X, t);

% Analizati curbele asociate erorii de antrenare, erorii de validare si
% erorii de testare folosind instructiunea de mai jos
figure(3)
plotperform(antrenare);

% % Daca se doreste impartirea multimii de exemple in cele trei submultimi in
% % mod aleator se poate folosi in acest sens functia 'dividerand'.
% net.divideFcn = 'dividerand';
% 
% % setarea procentului (frecventei relative) de date din multimea de
% % invatare continut de fiecare dintre cele trei submultimi
% net.divideParam.trainRatio = 0.7;
% net.divideParam.valRatio = 0.15;
% net.divideParam.testRatio = 0.15;
%  
% % antrenarea retelei
% [net antrenare] = train(net, X, t);
% 
% figure(3)
% plotperform(antrenare);

% Studiati, folosind help-ul functiile 'divideblock' si 'divideint'!

%-------------------------------------------------------------------------

% EX7: Daca eroarea de validare creste timp de un numar de iteratii specificat 
% (net.trainParam.max_fail) antrenarea se opreste si se returneaza
% ponderile si bias-urile corespunzatoare erorii de validare minime. 
% Modificati numarul de iteratii dupa care antrenarea este oprita.

% setarea numarului de iteratii dupa care antrenarea este oprita:
net.trainParam.max_fail = 10;

%-------------------------------------------------------------------------

% EX8: Folosind punctul 3., sa se compare performantele algoritmilor de 
% antrenare prezentati in fisierul Laborator 10. Care este cel mai adecvat 
% rezolvarii acestei probleme?

clear

X = -1:0.05:1;
t = sin(2*pi*X) + 0.1*randn(size(X));

algAntrenare = {'traingd', 'traingdm', 'traingda', 'traingdx', 'trainrp', ...
                'traincgf', 'traincgp', 'traincgb', 'trainbfg', 'trainoss',...
                'trainlm'};
culori = {'r', 'b', 'g', 'k', 'm', 'c', '-.r', '-.b', '-.g', '-.k', '-.m'};

netInitial = newff(minmax(X), [5,1], {'tansig', 'purelin'});

figure(4)

for i = 1 : length(algAntrenare)
    
    net = netInitial;

    % setarea algoritmului de antrenare
    net.trainFcn = algAntrenare{i};
    net.trainParam.epochs = 50;
    
    % antrenarea retelei
    [net antrenare] = train(net, X, t);

    semilogy(antrenare.epoch, antrenare.perf, culori{i});
    hold on
    legend(algAntrenare)
    axis([0 50 10^(-3) 10])

end

%-------------------------------------------------------------------------

% EXERCITIU suplimentar: sa se compare performantele algoritmilor de 
% antrenare prezentati in fisierul Laborator 10.
% Se considera pe axa OX timpul si pe axa OY eroarea.

% Multimea de antrenare "(X, t)" si reteaua "netInitial" sunt definite 
% mai sus in EX 8

figure(5)

for i = 1 : length(algAntrenare)
    
    net = netInitial;

    % setarea algoritmului de antrenare
    net.trainFcn = algAntrenare{i};   
    net.trainParam.epochs = 1;
    
    epoca = 1;
    maxEpoci = 50;
    t1 = [0];
    eroare = [mse(t - sim(net, X))];
    eps0 = 10^(-10);
    timp = 30;

    t0 = cputime;
    while (cputime - t0 <= timp && epoca <= maxEpoci)

        [net antrenare] = train(net, X, t);

        t1 = [t1 cputime - t0 - eps0 cputime - t0];
        eroare = [eroare eroare(length(eroare)) mse(t - sim(net, X))];
%         eroare = [eroare eroare(length(eroare)) antrenare.perf(end)];
   
        epoca = epoca + 1;

    end

    semilogy(t1, eroare, culori{i});
    hold on
    legend(algAntrenare)
    axis([0 30 10^(-3) 10])

end

hold off






