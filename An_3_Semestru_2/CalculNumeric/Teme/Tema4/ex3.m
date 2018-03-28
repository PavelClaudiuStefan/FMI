A = [10 7 8 7; 7 5 6 5; 8 6 10 9; 7 5 9 10];
b = [32; 23; 33; 31];
x = [1; 1; 1; 1];

% a)
% *inv(A) | Ax = b <=> x = inv(A) * b 
x_prim = inv(A) * b


% b)
matrA = [10 7 8.1 7.2; 7.08 5.04 6 5; 8 5.98 9.89 9; 6.99 4.99 9 9.98];
matrb = [32.1; 22.9; 33.1; 30.9];
matrx = inv(matrA) * matrb


% c)
cond(A,1)
cond(A,2)
cond(A,inf)