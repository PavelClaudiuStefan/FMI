X = [0 1 0 1; 0 0 1 1]; %input-urile
t = [0 1 1 0]; % target-urile
net=newff(minmax(X),[2 1],{'hardlim','hardlim'});%creare retea
net.IW{1,1} = [-1 1; 1 -1]; %matricea de ponderi de pe primul strat
net.LW{2,1}=[1 1]; % matricea de ponderi de pe al doilea strat
net.b{1} = [-0.5;- 0.5]; 
net.b{2} = -0.5; %bias-urile
view(net);%vizualizare retea
a=sim(net,X)
isequal(a,t)

%exercitiul 1:
net=newff(minmax(X),[2 1],{'hardlim','hardlim'});%reteaua
net.IW{1,1} = [1 1; -1 -1]; %matricea de ponderi de pe primul strat
net.LW{2,1}=[1 1]; % matricea de ponderi de pe al doilea strat
net.b{1} = [-0.5;+1.5]; 
net.b{2} = -1.5; %bias-urile
a=sim(net,X)
isequal(a,t)

%exercitiul 2:
puncteTest = rand(2,20000)*4-2;
net=newff(minmax(X),[3 1],{'hardlim','hardlim'});%reteaua
net.IW{1,1} = [1 -1; 0 1 ;-1 -1]; %matricea de ponderi de pe primul strat
net.b{1} = [1;0;1];%bias-ul de pe primul strat
net.LW{2,1}=[1 1 1]; % matricea de ponderi de pe al doilea strat 
net.b{2} = -2.5; %bias-ul de pe ultimul strat
etichete=sim(net,puncteTest);
ndx1 = find(etichete==1);
ndx0 = find(etichete==0);
figure, hold on;
plot(puncteTest(1,ndx1),puncteTest(2,ndx1),'or');
plot(puncteTest(1,ndx0),puncteTest(2,ndx0),'xb');


%exercitiul 3
X = [0 1 0 1; 0 0 1 1]; %input-urile
t = [0 1 1 0]; % target-urile
net=newff(minmax(X),[2 1],{'logsig','logsig'},'traingdx');%creare retea
view(net);%vizualizare retea
net = train(net,X,t);
a=sim(net,X)
net.layers{2}.transferFcn = 'hardlim';
a=sim(net,X)


%exercitiul 4
nrPuncte = 1000;
p = puncteTest(:,1:nrPuncte);
t = etichete(1:nrPuncte);
net=newff(minmax(puncteTest),[3 1],{'logsig','logsig'},'traingdx');%creare retea
view(net);%vizualizare retea
net = train(net,p,t);
a=sim(net,p);
sum((a-t).^2)





