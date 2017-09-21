function Widrow_Hoff (antrenare, etichete)

%x = [-2 -2 -1 -1 0 0 0 0 1 1 2 2 3 3 3 3 4 4 5 5;...
%2 3 1 4 0 1 2 3 0 1 1 2 -1 0 1 2 -2 1 -1 0]
% t = [ -1 -1 -1 -1 -1 -1 -1 -1 1 -1 1 -1 1 1 1 1 1 1 1 1]
%
% w_star = antrenare * antrenare';
% w_star = inv(w_star);
% w_star = w_star * antrenare;
% w_star = w_star * etichete'

w = [0 0]';
learn_rate = 0.005;
% xx = 0:100;
% yy = [];
% figure
for i = 1 : 100
sum = 0;
for j = 1 : length(antrenare)
error = (etichete(j) - antrenare(:,j)' * w) * antrenare(:,j);
sum = sum + error;
end
sum = sum * learn_rate;
w = w + sum;
% yy(i) = (norm(w - w_star))^2;
plotpv(antrenare,hardlim(etichete));
plotpc(w',0);
disp(i);
pause(2);
end

% yy(101) = yy(100);
% semilogx(xx,yy);
% title('Batch training');
%
%
% %adaugam antrenarea incrementala
% w = [0 0]';
% xx = 0:2000;
% yy = [];
% figure
% learn_rate = 0.005;
% for i = 1 : 2000
% j = randi([1 length(antrenare)]);
% error = (etichete(j) - antrenare(:,j)' * w) * antrenare(:,j);
% w = w + error * learn_rate;
% disp('Epoca: ')
% disp(i)
% disp('\n');
% yy(i) = (norm(w - w_star))^2;
% % plotpv(antrenare,hardlim(etichete));
% % plotpc(w',0);
% %pause(.15);
% end
% yy(2001) = yy(2000);
% yy(2000)
% semilogx(xx,yy);
% title('Incremental Training');
% end
%