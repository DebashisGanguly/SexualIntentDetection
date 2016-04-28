% Copyright (C) Debashis Ganguly - All Rights Reserved
% Project: Detecting Sexual Innuendos behind Images
% Purpose: Evaluating performance for predicting Global Classes directly 
%           using Amazon MTurk labels in Hierarchical Pipeline Model  
% Author: Debashis Ganguly
% Email: debashis@cs.pitt.edu
% Date: April 2016

filename = 'GlobalClasses.csv';
delimiter = ',';
formatSpec = '%s%f%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter,  'ReturnOnError', false);
fclose(fileID);
imageNames = dataArray{:, 1};
globalClass = dataArray{:, 2};

filename = 'PersonalityAttributes.csv';
delimiter = ',';
formatSpec = '%*s%f%f%f%f%f%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter,  'ReturnOnError', false);
fclose(fileID);

PA1 = dataArray{:, 1};
PA2 = dataArray{:, 2};
PA3 = dataArray{:, 3};
PA4 = dataArray{:, 4};
PA5 = dataArray{:, 5};

filename = 'SynatcticalAttributes.csv';
delimiter = ',';
formatSpec = '%*s%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter,  'ReturnOnError', false);
fclose(fileID);
SA1 = dataArray{:, 1};
SA2 = dataArray{:, 2};
SA3 = dataArray{:, 3};
SA4 = dataArray{:, 4};
SA5 = dataArray{:, 5};
SA6 = dataArray{:, 6};
SA7 = dataArray{:, 7};
SA8 = dataArray{:, 8};
SA9 = dataArray{:, 9};
SA10 = dataArray{:, 10};
SA11 = dataArray{:, 11};
SA12 = dataArray{:, 12};
SA13 = dataArray{:, 13};
SA14 = dataArray{:, 14};
SA15 = dataArray{:, 15};
SA16 = dataArray{:, 16};
SA17 = dataArray{:, 17};

clearvars filename delimiter formatSpec fileID dataArray ans;

PA = [PA1 PA2 PA3 PA4 PA5];

SA = [SA1 SA2 SA3 SA4 SA5 SA6 SA7 SA8 SA9 SA10 SA11 SA12 SA13 SA14 SA15 SA16 SA17];

numOfSamples = size(imageNames, 1);

numOfFolds=10;

t = templateSVM('BoxConstraint', 1, 'KernelFunction', 'polynomial', 'PolynomialOrder', 2, 'Standardize', 1);

statistics = [];

for i=1:numOfFolds
    
    testIndices = i : numOfFolds : numOfSamples;
    trainIndices = setdiff(1:numOfSamples, testIndices);
    
    mPA1 = fitcecoc(SA(trainIndices, :), PA(trainIndices, 1), 'Learners', t);
    predictPA1 = predict(mPA1, SA(testIndices, :));
    
    mPA2 = fitcecoc(SA(trainIndices, :), PA(trainIndices, 2), 'Learners', t);
    predictPA2 = predict(mPA2, SA(testIndices, :));
    
    mPA3 = fitcecoc(SA(trainIndices, :), PA(trainIndices, 3), 'Learners', t);
    predictPA3 = predict(mPA3, SA(testIndices, :));
    
    mPA4 = fitcecoc(SA(trainIndices, :), PA(trainIndices, 4), 'Learners', t);
    predictPA4 = predict(mPA4, SA(testIndices, :));
    
    mPA5 = fitcecoc(SA(trainIndices, :), PA(trainIndices, 5), 'Learners', t);
    predictPA5 = predict(mPA5, SA(testIndices, :));
    
    %fprintf('Run %d PAs\n', i);
    %numel(find(predictPA1==PA(testIndices, 1))) / numel(testIndices)
    %numel(find(predictPA2==PA(testIndices, 2))) / numel(testIndices)
    %numel(find(predictPA3==PA(testIndices, 3))) / numel(testIndices)
    %numel(find(predictPA4==PA(testIndices, 4))) / numel(testIndices)
    %numel(find(predictPA5==PA(testIndices, 5))) / numel(testIndices)
    
    predictPA = [predictPA1 predictPA2 predictPA3 predictPA4 predictPA5];
    
    mGC = fitcecoc(PA(trainIndices, :), globalClass(trainIndices, :), 'Learners', t);
    predictGC = predict(mGC, predictPA);
    
    %fprintf('Run %d GC\n', i);
    %predictGC0 = predict(mGC, PA(testIndices, :));
    %numel(find(predictGC0==globalClass(testIndices, :))) / numel(testIndices)
    
    stat = Evaluate(globalClass(testIndices, :), predictGC);
    statistics = [statistics; stat];
end

statistics
mean(statistics)