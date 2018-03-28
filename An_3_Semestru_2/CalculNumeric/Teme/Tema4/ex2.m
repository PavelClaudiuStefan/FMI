A = [1 -3 3; 3 -5 3; 6 -6 4];

% a)
[V, lambda] = eig(A' * A);
%V
%lambda

disp("||A||2=")
disp(max(max(sqrt(lambda))))


% b)
normaA = max(max(sqrt(lambda))); 
normaAInv = max(max(sqrt(lambda)^(-1)));

disp('k2(A)')
disp(normaA * normaAInv)


% c)
cond(A,2)
norm(A,2)