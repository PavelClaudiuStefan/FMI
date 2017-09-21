s = [-2 2 -1; -2 3 -1; -1 1 -1; -1 4 -1; 0 0 -1; 0 1 -1;
    0 2 -1; 0 3 -1; 1 0 1; 1 1 -1; 2 1 1; 2 2 -1; 3 -1  1;
    3 0 1; 3 1 1; 3 2 1; 4 -2 1; 4 1 1; 5 -1 1; 5 0 1];
s = s';
x = s(1:2,:);
t = s(3,:);
pon1 = -0.3:0.05:0.5;
pon2 = -0.3:0.05:0.5;
[pon1, pon2] = meshgrid(pon1,pon2);
jw = zeros(size(pon1));
net = newlin(x,t);
for i = 1:size(pon1,2)*size(pon2,1)
    net.IW{1,1} = [pon1(i) pon2(i)];
    dif = t - sim(net,x);
    jw(i) = sse(dif);
end
surf(pon1,pon2,jw);
hold on;
net.adaptParam.passes = 1;
net.IW{1,1}= [0 0];
lastj = 0;
for i = 1:100
   [net, y ,e] = adapt(net,x,t);
   j = sse(e);
   plot3(net.IW{1,1}(1),net.IW{1,1}(2),j,'w*');
   lastj = j;
end
wstar = inv(x*x')*x * t';
plot3(wstar(1),wstar(2),lastj,'r*');