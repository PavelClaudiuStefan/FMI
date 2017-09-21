function [exit code] = Test_2_Lab
	X = randi( [-30, 20], 2, 240 );

	for j=1:240
		if X(1, j) > X(2, j)
			T(1, j) = 1;
			T(2, j) = 0;
		else
			T(1, j) = 0;
			T(2, j) = 1;
		end
	end

	p = plot(T, 'pb');
	saveas(p, 'plot1.jpg');

	M = X;
	M[3:4, :] = T;
	save ('M.mat', M);


	net = newp([-20 30; -20 30]), 1, 'hardlim', 'learnwh');
	net.trainParam.showWindow = true;
	net = train(net, X, T(1, :));

	plotpv(X, T[1, :]);
	plotpc(net.IW(1, 1), net.b(1));

	print('plot', '-djpeg');

end