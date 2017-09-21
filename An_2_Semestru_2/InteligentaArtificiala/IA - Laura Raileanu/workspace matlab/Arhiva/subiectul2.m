%7 exemple, cerinta nu spune sa fie si toate distincte :)
%admit totusi ca o multime de antrenare care contine acelasi element
%de mai multe ori este prost aleasa

%vectorii de intrare
P = [1 1 1 1 1 2 5; 0 0 0 0 0 4 9; 2 2 2 2 2 4 3; 4 4 4 4 4 4 1];
%etichetele
T = [1 1 1 1 1 1 0; 1 1 1 1 1 0 0];
%cream o retea cu 2 perceptroni, avand functia de transfer implicita
%(hardlim) si regula de invatare implicita (learnp)
net = newp([1 5; 0 9; 2 3; 1 4], 2);
%setam ponderile
net.IW{1, 1} = [2 1 1 2; 0 2 0 3];
%setam bias-urile
net.b{1} = [2; 1];
%calculeaza iesirea pentru primul vector, astfel:
%a1 = hardlim(2 * 1 + 1 * 0 + 1 * 2 + 2 * 4 + 2)
%a2 = hardlim(0 * 1 + 2 * 0 + 0 * 2 + 3 * 4 + 1)
%unde hardlim(x) = 1 daca x >= 0 si 0 altfel
%cazul general pentru un singur vector:
%ai = hardlim(wi,1 * p1 + wi,2 * p2 + wi,3 * p3 + wi,4 * p4 + bi)
disp(sim(net, P(:,1)));
%setam rata de invatare la 0.1
net.inputWeights{1,1}.learnParam.lr = 0.1;
net.biases{1}.learnParam.lr = 0.1;
%pentru varianta incrementala, avem functia train
%cei doi vectori misclasificati sunt al 6-lea si al 7-lea
%dam insa toata multimea de antrenare pentru a da raspunsurile corecte
%pentru toti vectorii din aceasta
net = train(net, P, T);
%afisam noile ponderi
disp(net.IW{1, 1});
