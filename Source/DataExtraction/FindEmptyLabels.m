% Copyright (C) Debashis Ganguly - All Rights Reserved
% Project: Detecting Sexual Innuendos behind Images
% Purpose: Find Hit IDs which are not answered completely to reject
% Author: Debashis Ganguly
% Email: debashis@cs.pitt.edu
% Date: April 2016

filename = 'download.csv';
delimiter = ',';
startRow = 2;

formatSpec = '%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%[^\n\r]';

fileID = fopen(filename,'r');

dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'HeaderLines' ,startRow-1, 'ReturnOnError', false);

fclose(fileID);

raw = repmat({''},length(dataArray{1}),length(dataArray)-1);
for col=1:length(dataArray)-1
    raw(1:length(dataArray{col}),col) = dataArray{col};
end
numericData = NaN(size(dataArray{1},1),size(dataArray,2));

rawNumericColumns = {};
rawCellColumns = raw(:, [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49]);

HITId = rawCellColumns(:, 1);
HITTypeId = rawCellColumns(:, 2);
Title = rawCellColumns(:, 3);
Description = rawCellColumns(:, 4);
Keywords = rawCellColumns(:, 5);
Reward = rawCellColumns(:, 6);
CreationTime = rawCellColumns(:, 7);
MaxAssignments = rawCellColumns(:, 8);
RequesterAnnotation = rawCellColumns(:, 9);
AssignmentDurationInSeconds = rawCellColumns(:, 10);
AutoApprovalDelayInSeconds = rawCellColumns(:, 11);
Expiration = rawCellColumns(:, 12);
NumberOfSimilarHITs = rawCellColumns(:, 13);
LifetimeInSeconds = rawCellColumns(:, 14);
AssignmentId = rawCellColumns(:, 15);
WorkerId = rawCellColumns(:, 16);
AssignmentStatus = rawCellColumns(:, 17);
AcceptTime = rawCellColumns(:, 18);
SubmitTime = rawCellColumns(:, 19);
AutoApprovalTime = rawCellColumns(:, 20);
ApprovalTime = rawCellColumns(:, 21);
RejectionTime = rawCellColumns(:, 22);
RequesterFeedback = rawCellColumns(:, 23);
WorkTimeInSeconds = rawCellColumns(:, 24);
LifetimeApprovalRate = rawCellColumns(:, 25);
Last30DaysApprovalRate = rawCellColumns(:, 26);
Last7DaysApprovalRate = rawCellColumns(:, 27);
Inputimage_url = rawCellColumns(:, 28);
AnswerQ1 = rawCellColumns(:, 29);
AnswerQ10 = rawCellColumns(:, 30);
AnswerQ11 = rawCellColumns(:, 31);
AnswerQ12 = rawCellColumns(:, 32);
AnswerQ13 = rawCellColumns(:, 33);
AnswerQ14 = rawCellColumns(:, 34);
AnswerQ15 = rawCellColumns(:, 35);
AnswerQ16 = rawCellColumns(:, 36);
AnswerQ17 = rawCellColumns(:, 37);
AnswerQ18 = rawCellColumns(:, 38);
AnswerQ19 = rawCellColumns(:, 39);
AnswerQ2 = rawCellColumns(:, 40);
AnswerQ3 = rawCellColumns(:, 41);
AnswerQ4 = rawCellColumns(:, 42);
AnswerQ5 = rawCellColumns(:, 43);
AnswerQ6 = rawCellColumns(:, 44);
AnswerQ7 = rawCellColumns(:, 45);
AnswerQ8 = rawCellColumns(:, 46);
AnswerQ9 = rawCellColumns(:, 47);
Approve = rawCellColumns(:, 48);
Reject = rawCellColumns(:, 49);

clearvars filename delimiter startRow formatSpec fileID dataArray ans raw col numericData rawCellColumns;

invalidInd = [];

for i=1:19
    name=strcat('AnswerQ', num2str(i));
    cmd = strcat('invalidInd = [invalidInd; find(cellfun(@isempty,', name , '))];');
    eval(cmd)
end

invalidInd=sort(invalidInd);
invalidInd=unique(invalidInd);

rejectedInd = find(not(cellfun('isempty', strfind(AssignmentStatus, 'Rejected'))));
toBeRejectedInd=setdiff(invalidInd, rejectedInd);

rejectableId = AssignmentId(toBeRejectedInd);
rejectableId = sort(rejectableId)
