% Copyright (C) Debashis Ganguly - All Rights Reserved
% Project: Detecting Sexual Innuendos behind Images
% Purpose: Evaluating performance for predicting Global Classes directly 
%           from Raw Features/Subjective Attributes using Multi-Class SVM 
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

numOfSamples = size(imageNames, 1);

numOfFolds=10;

t = templateSVM('BoxConstraint', 1, 'KernelFunction', 'polynomial', 'PolynomialOrder', 2, 'Standardize', 1);

statistics = [];

for i=1:numOfFolds
    
    testIndices = i : numOfFolds : numOfSamples;
    trainIndices = setdiff(1:numOfSamples, testIndices);
    
    mGC = fitcecoc(rawFeatures(trainIndices, :), globalClass(trainIndices, :), 'Learners', t);
    predictGC = predict(mGC, rawFeatures(testIndices, :));
    
    stat = Evaluate(globalClass(testIndices, :), predictGC);
    statistics = [statistics; stat];
end

statistics
mean(statistics)