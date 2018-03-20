function [ x_aprox ] = MetSecantei(f,a,b,x0,x1,eroare)
k=2;
x(1)=x0;
x(2)=x1;
while ((abs(x(k)-x(k-1)))/abs(x(k-1))>=eroare)
    k=k+1;
    x(k)=(x(k-2)*f(x(k-1))-x(k-1)*f(x(k-2)))/(f(x(k-1))-f(x(k-2)));
    if (x(k)<a || x(k)>b)
        disp ('introduceti alte valori pentru a si b');
        disp (x(k));
        break;
    end
end
x_aprox=x(k);
end

