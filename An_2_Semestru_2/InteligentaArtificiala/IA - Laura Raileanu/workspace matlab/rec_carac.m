[alphabet, targets] = prprob();
S1 = 10;
[R,Q] = size(alphabet);
[S2,Q] = size(targets);
P = alphabet;
T = targets;
net = newff(minmax(P),[S1 S2],{'logsig' 'logsig'},'traingdx');
net.LW{2,1} = net.LW{2,1}*0.01;
net.b{2} = net.b{2}*0.01;

net.trainParam.epochs = 5000;
net.trainParam.goal = 0.1;
net.trainParam.mc = 0.95;
net.performFcn = 'sse';
[net,tr] = train(net,P,T);

net.trainParam.epochs = 300;
net.trainParam.goal = 0.6;


for i=1:10
   P = [alphabet alphabet alphabet + 0.1 * randn(size(alphabet)) ...
       alphabet + 0.2 * randn(size(alphabet))];
   T = [targets targets targets targets];
   [net tr] = train(net,P,T);
end
P = alphabet;
T = targets;
[net tr] = train(net,P,T);
figure;
for i = 1:26
    noisyJ = alphabet(:,i)+randn(35,1) * 0.2;
    subplot(9,6,i);
    plotchar(noisyJ);
    A2 = sim(net,noisyJ);
    A2 = compet(A2);
    answer = find(compet(A2) == 1);
    subplot(9,6,26+i);
    plotchar(alphabet(:,answer));
end
