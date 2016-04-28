function EVAL = Evaluate(ACTUAL,PREDICTED)
% This fucntion evaluates the performance of a classification model by 
% calculating the common performance measures: Accuracy, Sensitivity, 
% Specificity, Precision, Recall, F-Measure.
% Input: ACTUAL = Column matrix with actual class labels of the training
%                 examples
%        PREDICTED = Column matrix with predicted class labels by the
%                    classification model
% Output: EVAL = Row matrix with all the performance measures


    idx = (ACTUAL()==1);

    p = length(ACTUAL(idx));
    n = length(ACTUAL(~idx));
    N = p+n;

    tp = sum(ACTUAL(idx)==PREDICTED(idx));
    tn = sum(ACTUAL(~idx)==PREDICTED(~idx));
    fp = n-tn;
    fn = p-tp;

    tp_rate = tp/p;
    tn_rate = tn/n;

    accuracy = (tp+tn)/N;
    sensitivity = tp_rate;  % tp/(tp+fn) -> p = tp+fn -> tp/p == tp/(tp+fn)
    specificity = tn_rate;  % tn/(tn+fp)
    precision = tp/(tp+fp);
    recall = sensitivity;   % tp/(tp+fn)
    f_measure = 2*((precision*recall)/(precision + recall));

    EVAL = [accuracy sensitivity specificity precision recall f_measure];