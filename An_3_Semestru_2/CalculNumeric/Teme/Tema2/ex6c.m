c1=eps(10^(-20));
A1=[c1,1;1,1];
b1=[1;2];

c2=sym(10^20);
A2=[2,2*c2;1,1];
b2=[2*c2;2];

disp(GaussFaraPiv(A1,b1));
disp(GaussPivPart(A2,b2));

disp(GaussPivPart(A2,b2));
disp(GaussPivTot(A2,b2));