function [ x_aprox ] = MetPozFalse(f,a,b,eroare)
k=1;
a(1)=a;
b(1)=b;
x(1)=(a(1)*f(b(1))-b(1)*f(a(1)))/(f(b(1))-f(a(1)));
k=k+1;
    if(f(x(k-1))==0)
        x(k)=x(k-1);
    elseif(f(a(k-1))*f(x(k-1))<0)
        a(k)=a(k-1);
        b(k)=x(k-1);
        x(k)=(a(k)*f(b(k))-b(k)*f(a(k)))/(f(b(k))-f(a(k)));
    elseif(f(a(k-1))*f(x(k-1))>0)
        a(k)=x(k-1);
        b(k)=b(k-1);
        x(k)=(a(k)*f(b(k))-b(k)*f(a(k)))/(f(b(k))-f(a(k)));
    end
while((abs(x(k)-x(k-1)))/abs(x(k-1))>=eroare)
    k=k+1;
    if(f(x(k-1))==0)
        x(k)=x(k-1);
        break;
    elseif(f(a(k-1))*f(x(k-1))<0)
        a(k)=a(k-1);
        b(k)=x(k-1);
        x(k)=(a(k)*f(b(k))-b(k)*f(a(k)))/(f(b(k))-f(a(k)));
    elseif(f(a(k-1))*f(x(k-1))>0)
        a(k)=x(k-1);
        b(k)=b(k-1);
        x(k)=(a(k)*f(b(k))-b(k)*f(a(k)))/(f(b(k))-f(a(k)));
    end
end
x_aprox = x(k);
end

