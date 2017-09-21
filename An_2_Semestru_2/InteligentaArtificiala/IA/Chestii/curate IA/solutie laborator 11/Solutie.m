[alphabet,targets] = prprob();

for i=1:26
    figure, imagesc(reshape(alphabet(:,i),5,7)');
    pause(0.1);
end

n= 50;sigma = 0.3;
Xp = genereazaLiterePerturbate(alphabet(:,1),n,0.2);

for i=1:n
    figure, imagesc(reshape(Xp(:,i),5,7)');pause(0.1);close all;
end

X = alphabet;
T = targets;
[exempleAntrenare, eticheteAntrenare] = genereazaAlfabetPerturbat(X,T,n,sigma);
[exempleValidare, eticheteValidare] = genereazaAlfabetPerturbat(X,T,n,sigma);
[exempleTestare, eticheteTestare] = genereazaAlfabetPerturbat(X,T,n,sigma);

%reteaua
S1=10; 
[R,Q] = size(alphabet); 
[S2,Q] = size(targets); 
P = alphabet; 

net = newff(minmax(P),[S1 S2],{'logsig', 'logsig'},'traingdx'); 
net1 = train(net,exempleAntrenare,eticheteAntrenare);
T1 = compet(sim(net1,exempleValidare));
eroareMisclasareVal1 = calculeazaEroareMisclasare(T1,eticheteValidare)
T1 = compet(sim(net1,exempleTestare));
eroareMisclasareTest1 = calculeazaEroareMisclasare(T1,eticheteTestare)


net = newff(minmax(P),[S1 S2],{'logsig', 'logsig'},'traingdx'); 
net.IW{1,1} = rand(size(net.IW{1,1}))*0.1;net.b{1} = rand(size(net.b{1}))*0.1;
net.LW{2,1} = rand(size(net.LW{2,1}))*0.1;net.b{2} = rand(size(net.b{2}))*0.1;
net2 = train(net,exempleAntrenare,eticheteAntrenare);
T2 = compet(sim(net2,exempleValidare));
eroareMisclasareVal2 = calculeazaEroareMisclasare(T2,eticheteValidare)
T2 = compet(sim(net2,exempleTestare));
eroareMisclasareTest2 = calculeazaEroareMisclasare(T2,eticheteTestare)

net = newff(minmax(P),[S1 S2],{'logsig', 'logsig'},'trainbr'); 
net3 = train(net,exempleAntrenare,eticheteAntrenare);
T3 = compet(sim(net3,exempleValidare));
eroareMisclasareVal3 = calculeazaEroareMisclasare(T3,eticheteValidare)
T3 = compet(sim(net3,exempleTestare));
eroareMisclasareTest3 = calculeazaEroareMisclasare(T3,eticheteTestare)

net = newff(minmax(P),[S1 S2],{'logsig', 'logsig'},'trainbr'); 
net.IW{1,1} = rand(size(net.IW{1,1}))*0.1;net.b{1} = rand(size(net.b{1}))*0.1;
net.LW{2,1} = rand(size(net.LW{2,1}))*0.1;net.b{2} = rand(size(net.b{2}))*0.1;
net4 = train(net,exempleAntrenare,eticheteAntrenare);
T4 = compet(sim(net4,exempleValidare));
eroareMisclasareVal4 = calculeazaEroareMisclasare(T4,eticheteValidare)
T4 = compet(sim(net4,exempleTestare));
eroareMisclasareTest4 = calculeazaEroareMisclasare(T4,eticheteTestare)

clear eticheta etichetaPrezisa
for i =1:n*26
    eticheta(i) = find(eticheteTestare(:,i)==1);
    etichetaPrezisa(i) = find(T2(:,i)==1);
end
matriceConfuzie = confusionmat(eticheta,etichetaPrezisa)

