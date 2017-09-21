function [ output_args ] = Test2( W, B )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

    net=newp([-3 3;-3 3;-3 3;-3 3],2);
    net.IW{1,1}=W;
    net.b{1,1}=B;
    plotpc(W, B);
    
    
    P=[1 0 -2 1; 0 1 -1 -2; 1 0 -2 1; 0 1 -1 -2]
    T=[1 1 0 1;1 1 0 0]
    
    % VARIANTA 1
    T1=sim(net,P)
    tes1 = T1-T
    
    % VARIANTA 2
    Ta1=hardlim(W(1,:)*P + B(1,1));
    Ta2=hardlim(W(2,:)*P + B(2,1));
    T2=[Ta1;Ta2];
    test2=T2-T
    
    %VARIANTA 3
    net=train(net, P, T);
end

