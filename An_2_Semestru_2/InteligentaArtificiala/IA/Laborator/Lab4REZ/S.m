n=10;
sigma=0.2;
f=@(x)sin(2*pi*x); 
multAntrenare=generareA(f, sigma, n);
%a&b
hold on
    ploatareA1(multAntrenare);

    for i=0:9
       p=gasestePol(multAntrenare, i);
       ploateazaA2(p); %g
       eror=calcEroare(multAntrenare,p);
       
       
       
    


hold off;


