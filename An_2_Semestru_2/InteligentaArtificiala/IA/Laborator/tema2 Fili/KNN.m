function [ PredictedLabels ] = KNN( TrainImages, TrainLabels, TestImages, k)
    
    [a,b,n]=size(TestImages);
    [a,b,m]=size(TrainImages);
    PredictedLabels = zeros(n,1);
    for i=1:n
       dist = zeros(m,1);
        v1 = reshape(TestImages(:,:,i),1,28*28);
        for j=1:m
            v2 = reshape(TrainImages(:,:,j),1,28*28);
            dist(j) =  sqrt(sum((v1-v2).^2));
        end
        [dist, idx] = sort(dist);
        SortedLabels = TrainLabels(idx);
        NNLabels = SortedLabels(1:k);
        x = hist(NNLabels,0:9);
        [ma,idxMax] = max(x);
        PredictedLabels(i) = idxMax(1)-1;
    end
    
end

