f=@(x)sin(2*pi*x); %punctul b
sigma=0.2;
s=genereazaExemple(f,sigma,100);
t=genereazaExemple(f,sigma,10);
hold on
ploateazaExemple(s);
E=[];
E2=[];
for i=0:9
    p=gasestePolinomOptim(s,i);
    ploteazaGraficPolinom(p); %punctul g
    E(i+1)=calculeazaEroare(s,p); %punctul h
    E2(i+1)=calculeazaEroare(t,p); %puncul i
end
%punctul j
cell=mat2cell(s,2,[7,3]);
s1=cell{1};
s2=cell{2};
E3=[];
for i=0:7
    p=gasestePolinomOptim(s1,i);
    E3(i+1)=calculeazaEroare(s2,p);
end
M=min(E3);
hold off