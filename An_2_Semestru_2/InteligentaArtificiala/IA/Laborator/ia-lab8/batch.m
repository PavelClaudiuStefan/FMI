x=[-2 2;-2 3;-1 1;-1 -4;0 0;0 1;0 2;0 3;1 0; 1 1;2 1;2 2;3 -1;3 0;3 1;3 2;4 -2;4 1;5 -1;5 0];
d=[-1,-1,-1,-1,-1,-1,-1,-1,1,-1,1,-1,1,1,1,1,1,1,1,1];
hold on
[s1,s2]=size(x);
for i=1:s1
    if d(i)==-1 
        plot(x(i,1),x(i,2),'or');
    else
        plot(x(i,1),x(i,2),'sg');
    end
end
w=[0,0];
nr=100;
u=0.005;
while nr>0
    sum=0;
    for i=1:s1
        xi=[x(i,:)]';
        y=w*xi;
        sum=sum+(d(i)-y)*x(i,:);
    end
    w=w+u*sum;
    nr=nr-1;
end
plotpc(w,0);
hold off