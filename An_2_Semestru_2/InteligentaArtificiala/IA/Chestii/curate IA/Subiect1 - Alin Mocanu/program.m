%a)
nrExemple=10;
x=rand(nrExemple,-3,3);
y=rand(nrExemple,-3,3);
t=zeros(nrExemple);
for i=1:nrExemple
    if (x(i)>y(i))
        t(i)=1;
    else
        t(i)=0;
    end
end
p=[x y];
S=[p,t];

save('S.mat','S');

%b
nrs1=1;
nrs2=1;
S1=zeros(nrExemple);
S2=zerios(nrExemple);
for i=1:nrExemple
    
    if (S(1,i)>0)
        S1(nrs1)=s(i);
        nrs1=nrs1+1;
    end
    if (S(1,i)<=0)
       S2(nrs2)=s(i);
       nrs2=nrs2+1;
    end
end

save('S1.mat','S1');
save('S2.mat','S2');

S=load('S.mat');
S1=load('S1.mat');
S2=load('S2.mat');

%c
figure, hold on;
etichete=t;
for i=1:neExemple
   if (etichete(i)==1)
        plot(S1(1,i),S1(2,i),'+r');
   else
       plot(S1(1,i),S1(2,i),'ob');
   end
   
end

%d

R=newp([-1 1; -1 1; -1 1,1);
R.IW{1}=[0 1 0];
net.b{1}=0;
view(R);


