function [ accuracy ] = consultAccuracy( PredictedLabels, TestLabels )
    x = numel(find(PredictedLabels==TestLabels));
    accuracy = (x/numel(PredictedLabels))*100;
end

