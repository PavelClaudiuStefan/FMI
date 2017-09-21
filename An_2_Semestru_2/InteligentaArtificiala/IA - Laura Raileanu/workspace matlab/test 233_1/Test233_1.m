function Test2

%     a
	X = randi( [-30, 20], 2, 240 ); % random
%     b
	for j=1:240
		if X(1, j) > X(2, j)
			T(1, j) = 1;
			T(2, j) = 0;
		else
			T(1, j) = 0;
			T(2, j) = 1;
		end
    end
%     c
	p = plot(X, T); % plotarea
%     d
	print('plotarea', '-djpeg'); % salvarea imaginii cu plotarea

	for i = 1:1:240
        M(1, i) = X(1,i);
        M(2, i) = X(2,i);
        M(3, i) = T(1,i);
    end
    
    save ('M.mat', 'M'); % salvarea matricii M
    
%    e 

    net = newff(minmax(X),[5,2],{'tansig','purelin'},'traingd');
    
    net.trainParam.lr = 0.2; % learning rate
    
    net.trainParam.epochs = 150; % setarea limitei maxime la epoci
    
    [net,tr] = train(net,X, T);
    
%     f

end