% Copyright (C) Debashis Ganguly - All Rights Reserved
% Project: Detecting Sexual Innuendos behind Images
% Purpose: Evaluating performance for predicting Global Classes directly 
%           using full Hierarchical Pipeline Model formed by Raw Features
%           at base and Amazon MTurk labels at indermediate layers
% Author: Debashis Ganguly
% Email: debashis@cs.pitt.edu
% Date: April 2016

fprintf('Please select one of the following options...\n');
fprintf('1-Using CaffeNet FC6\n');
fprintf('2-Using CaffeNet FC7\n');
fprintf('3-Using CaffeNet FC8\n');
fprintf('4-Using HOG\n');
fprintf('5-Using SIFT HIST\n');
fprintf('6-Using HIST\n\n');

opt=input('Enter option: ');

switch opt
    case 1
        folderName = './RawFeatures/caffe/fc6/';
    case 2
        folderName = './RawFeatures/caffe/fc7/';
    case 3
        folderName = './RawFeatures/caffe/fc8/';
    case 4
        folderName = './RawFeatures/hog/';
    case 5
        folderName = './RawFeatures/sift_hist/';
    case 6
        folderName = './RawFeatures/hist/';
    otherwise
        fprintf('Invalid option');
        exit;
end

folder = dir(strcat(folderName, '*.txt'));

fileNames = { folder.name };

rawFeatures = [];

for i = 1:length(fileNames)
    fileName=strcat(folderName, char(fileNames{i}));
    fid=fopen(char(fileName));
    feature = textscan(fid,'%s', 'delimiter', ' ');
    fclose(fid);

    feature=str2double(feature{1});
    
    rawFeatures = [rawFeatures; feature'];
end

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
    
    mSA1 = fitcecoc(rawFeatures(trainIndices, :), SA(trainIndices, 1), 'Learners', t);
    predictSA1 = predict(mSA1, rawFeatures(testIndices, :));
    
    mSA2 = fitcecoc(rawFeatures(trainIndices, :), SA(trainIndices, 2), 'Learners', t);
    predictSA2 = predict(mSA2, rawFeatures(testIndices, :));
    
    mSA3 = fitcecoc(rawFeatures(trainIndices, :), SA(trainIndices, 3), 'Learners', t);
    predictSA3 = predict(mSA3, rawFeatures(testIndices, :));
    
    mSA4 = fitcecoc(rawFeatures(trainIndices, :), SA(trainIndices, 4), 'Learners', t);
    predictSA4 = predict(mSA4, rawFeatures(testIndices, :));
    
    mSA5 = fitcecoc(rawFeatures(trainIndices, :), SA(trainIndices, 5), 'Learners', t);
    predictSA5 = predict(mSA5, rawFeatures(testIndices, :));
    
    mSA6 = fitcecoc(rawFeatures(trainIndices, :), SA(trainIndices, 6), 'Learners', t);
    predictSA6 = predict(mSA6, rawFeatures(testIndices, :));
    
    mSA7 = fitcecoc(rawFeatures(trainIndices, :), SA(trainIndices, 7), 'Learners', t);
    predictSA7 = predict(mSA7, rawFeatures(testIndices, :));
    
    mSA8 = fitcecoc(rawFeatures(trainIndices, :), SA(trainIndices, 8), 'Learners', t);
    predictSA8 = predict(mSA8, rawFeatures(testIndices, :));
    
    mSA9 = fitcecoc(rawFeatures(trainIndices, :), SA(trainIndices, 9), 'Learners', t);
    predictSA9 = predict(mSA9, rawFeatures(testIndices, :));
    
    mSA10 = fitcecoc(rawFeatures(trainIndices, :), SA(trainIndices, 10), 'Learners', t);
    predictSA10 = predict(mSA10, rawFeatures(testIndices, :));
    
    mSA11 = fitcecoc(rawFeatures(trainIndices, :), SA(trainIndices, 11), 'Learners', t);
    predictSA11 = predict(mSA11, rawFeatures(testIndices, :));
    
    mSA12 = fitcecoc(rawFeatures(trainIndices, :), SA(trainIndices, 12), 'Learners', t);
    predictSA12 = predict(mSA12, rawFeatures(testIndices, :));
    
    mSA13 = fitcecoc(rawFeatures(trainIndices, :), SA(trainIndices, 13), 'Learners', t);
    predictSA13 = predict(mSA13, rawFeatures(testIndices, :));
    
    mSA14 = fitcecoc(rawFeatures(trainIndices, :), SA(trainIndices, 14), 'Learners', t);
    predictSA14 = predict(mSA14, rawFeatures(testIndices, :));
    
    mSA15 = fitcecoc(rawFeatures(trainIndices, :), SA(trainIndices, 15), 'Learners', t);
    predictSA15 = predict(mSA15, rawFeatures(testIndices, :));
    
    mSA16 = fitcecoc(rawFeatures(trainIndices, :), SA(trainIndices, 16), 'Learners', t);
    predictSA16 = predict(mSA16, rawFeatures(testIndices, :));
    
    mSA17 = fitcecoc(rawFeatures(trainIndices, :), SA(trainIndices, 17), 'Learners', t);
    predictSA17 = predict(mSA17, rawFeatures(testIndices, :));
    
    predictSA = [predictSA1 predictSA2 predictSA3 predictSA4 predictSA5 predictSA6 predictSA7 predictSA8 predictSA9 predictSA10 predictSA11 predictSA12 predictSA13 predictSA14 predictSA15 predictSA16 predictSA17];
    
    mPA1 = fitcecoc(SA(trainIndices, :), PA(trainIndices, 1), 'Learners', t);
    predictPA1 = predict(mPA1, predictSA);
    
    mPA2 = fitcecoc(SA(trainIndices, :), PA(trainIndices, 2), 'Learners', t);
    predictPA2 = predict(mPA2, predictSA);
    
    mPA3 = fitcecoc(SA(trainIndices, :), PA(trainIndices, 3), 'Learners', t);
    predictPA3 = predict(mPA3, predictSA);
    
    mPA4 = fitcecoc(SA(trainIndices, :), PA(trainIndices, 4), 'Learners', t);
    predictPA4 = predict(mPA4, predictSA);
    
    mPA5 = fitcecoc(SA(trainIndices, :), PA(trainIndices, 5), 'Learners', t);
    predictPA5 = predict(mPA5, predictSA);
    
    predictPA = [predictPA1 predictPA2 predictPA3 predictPA4 predictPA5];
    
    mGC = fitcecoc(PA(trainIndices, :), globalClass(trainIndices, :), 'Learners', t);
    predictGC = predict(mGC, predictPA);
    
    stat = Evaluate(globalClass(testIndices, :), predictGC);
    statistics = [statistics; stat];
end

statistics
mean(statistics)