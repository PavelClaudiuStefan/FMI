function [exit code] = problema1
	X = randi( [-30, 20], 2, 240 );

	for col=1:240
		if X(1, col) < X(2, col)
			T(1, col) = 0;
			T(2, col) = 1;
		else
            T(1, col) = 1;
			T(2, col) = 0;
		end
    end
    
    plotpv(X,T)
    print('Plot1','-djpeg');

	M = X;
    M(3:4, :) = T;
	save('M.mat', 'M');
    
	net = newp([-20 30; -30 20], 1, 'hardlim', 'learnwh');
	net.trainParam.showWindow = true;
	net = train(net, X, T(1, :));

	plotpv(X, T(1, :));
	plotpc(net.IW{1, 1}, net.b{1});
	print('Plot2', '-djpeg');

end