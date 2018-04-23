xfcn = @(s,t) t .* cos(s);
yfcn = @(s,t) t .* sin(s);
zfcn = @(s,t) t;

cone = fsurf(xfcn,yfcn,zfcn,[0 2*pi -1 1]);
cone.ShowContours = true;
x = cone.XData;
y = cone.YData;
z = cone.ZData;
m = [x', y', z'];

P = m;
k = boundary(m);
hold on
trisurf(k,P(:,1),P(:,2),P(:,3),'Facecolor','red','FaceAlpha',0.1)
%mg = meshgrid(x', y');

ptCl = pointCloud(m);
pcshow(ptCl);

pcwrite(ptCl,'cone','PLYFormat','ascii');