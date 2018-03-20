A1 = [0,1,1;2,1,5;4,2,1];
b1 = [3;5;1];

A2 = [0,1,-2;1,-1,1;1,0,-1];
b2 = [4;6;2];

disp(GaussFaraPiv(A1,b1));
disp(GaussFaraPiv(A2,b2));

disp(GaussPivPart(A1,b1));
disp(GaussPivPart(A2,b2));

disp(GaussPivTot(A1,b1));
disp(GaussPivTot(A2,b2));