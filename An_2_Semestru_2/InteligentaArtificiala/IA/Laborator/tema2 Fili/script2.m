load('testData.mat');
load('trainData.mat');

predictedLabels = KNN(trainImages, trainLabels, testImages, 1);
acc = consultAccuracy(predictedLabels, testLabels);
str1=strcat(num2str(acc),'%');
sprintf(' Accuracy %s ', str1)