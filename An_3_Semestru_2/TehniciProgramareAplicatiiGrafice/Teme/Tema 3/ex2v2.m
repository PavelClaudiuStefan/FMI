xfcn = @(s,t) t .* cos(s);
yfcn = @(s,t) t .* sin(s);
zfcn = @(s,t) t .* t;

figure = fsurf(xfcn,yfcn,zfcn,[0 pi -1 1]);
figure.ShowContours = true;
x = figure.XData;
y = figure.YData;
z = figure.ZData;
m = [x', y', z'];

%k = boundary(m);
%hold on
%trisurf(k,P(:,1),P(:,2),P(:,3),'Facecolor','red','FaceAlpha',0.1)

ptCl = pointCloud(m);
pcshow(ptCl);

%pcwrite(ptCl,'figure','PLYFormat','ascii');

[X,Y,Z] = meshgrid(x', y', z');

