function [ net ] = earlyStopping( p,t,nr_iter )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
    Q = size(p,2);
    indici_testare = 2:4:Q;
    indici_validare = 4:4:Q;
    indici_antrenare = [1:4:Q 3:4:Q];
    mult_antr_points = p(indici_antrenare);
    mult_antr_labels = t(indici_antrenare);
    mult_valid_points = p(indici_validare);
    mult_valid_labels = t(indici_validare);
    net=newff(minmax(p),[20,1],{'tansig','purelin'},'trainbfg');
    net.trainParam.epochs = 1;
    net.trainParam.showWindow = 0;
    net = init(net);
    nr_iter_cresc = 0;
    er_valid_last = 45654;
    vec_err_valid = [];
    vec_err_antr = [];
    indice_oprire = 1;
    err_valid_min = 1000;
    for i = 1:100
        [net,~,~,e] = train(net,mult_antr_points,mult_antr_labels);
        er_antr = sse(e);
        vec_err_antr = [vec_err_antr er_antr];
        yvalid = sim(net,mult_valid_points');
        er_valid = sse(mult_valid_labels - yvalid);
        vec_err_valid = [vec_err_valid er_valid];
        if(er_valid<err_valid_min)
           err_valid_min = er_valid; 
        end
        if er_valid > err_valid_min
           nr_iter_cres = nr_iter_cres + 1;
        else
            nr_iter_cres = 0;
        end
        if nr_iter_cres > nr_iter 
           indice_oprire = i; 
           break; 
        end
        indice_oprire= i;
    end
    pas = 1:indice_oprire;
    figure;
    subplot(1,2,1);
    plot(pas,vec_err_antr,'r');
    subplot(1,2,2);
    plot(pas,vec_err_valid,'r');
    
end

