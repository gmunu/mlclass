function [bestEpsilon bestF1] = selectThreshold(yval, pval)
%SELECTTHRESHOLD Find the best threshold (epsilon) to use for selecting
%outliers
%   [bestEpsilon bestF1] = SELECTTHRESHOLD(yval, pval) finds the best
%   threshold to use for selecting outliers based on the results from a
%   validation set (pval) and the ground truth (yval).
%

bestEpsilon = 0;
bestF1 = 0;
F1 = 0;

stepsize = (max(pval) - min(pval)) / 1000;
epsilon_candidates = min(pval):stepsize:max(pval);
predictions = bsxfun(@lt, pval, epsilon_candidates);
TP = sum(bsxfun(@and, predictions, yval));
FP = sum(bsxfun(@and, predictions, !yval));
FN = sum(bsxfun(@and, !predictions, yval));
% TN = sum(bsxfun(@and, !predictions, !yval));
% R=TP/(TP+FN); P=TP/(TP+FP); F1=2RP/(R+P)=2TP/(2TP+FP+FN)
F1 = 2 * TP ./ (2 * TP + FP + FN);
[bestF1, ix] = max(F1);
bestEpsilon = epsilon_candidates(ix);

% for epsilon = min(pval):stepsize:max(pval)
    
    % ====================== YOUR CODE HERE ======================
    % Instructions: Compute the F1 score of choosing epsilon as the
    %               threshold and place the value in F1. The code at the
    %               end of the loop will compare the F1 score for this
    %               choice of epsilon and set it to be the best epsilon if
    %               it is better than the current choice of epsilon.
    %               
    % Note: You can use predictions = (pval < epsilon) to get a binary vector
    %       of 0's and 1's of the outlier predictions

    % pred = (pval < epsilon);
    % TP = sum(yval & pred);
    % FP = sum(!yval & pred);
    % FN = sum(yval & !pred);
    % TN = sum(!yval & !pred);
    % R=TP/(TP+FN); P=TP/(TP+FP); F1=2RP/(R+P)=2TP/(2TP+FP+FN)
    % F1 = 2 * TP / (2 * TP + FP + FN);

    % =============================================================

    % if F1 > bestF1
       % bestF1 = F1;
       % bestEpsilon = epsilon;
    % end
% end

end
