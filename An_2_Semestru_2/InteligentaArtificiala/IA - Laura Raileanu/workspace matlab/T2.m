function T2 

% !!!!!!!!!!ATENTIEEEEEE!!!!!!!
% Eroare Exception in thread "AWT-EventQueue-0" javax.media.opengl.GLException: Profile GL_DEFAULT is not available on WindowsGraphicsDevice[type .windows, connection decon, unitID 0, handle 0x0, owner false, NullToolkitLock[]], but: []
% e posibil sa fie de la drivere-le pc-ului meu

p = 1 - 2 .* rand(3,50); 
net = newp([-1 1; -1 1; -1 1],1,'hardlims'); 
for i=1 : length(p) 
    t(i) = hardlims(p(1,i)*2 - p(2,i) + p(3,i)); 
end 

net.trainParam.epochs = 1000;

net = train(net,p,t); 
plotpv(p,hardlim(t)); 
plotpc(net.IW{1,1},net.b{1}); 
et = sim(net,p); 
confusionmat(t,et) 
end