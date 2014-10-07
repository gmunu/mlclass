function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

C_vals = [0.01 0.03 0.1 0.3 1 3 10 30]';
sigma_vals = [0.01 0.03 0.1 0.3 1 3 10 30]';
[C_grid, sigma_grid] = ndgrid(C_vals, sigma_vals);
predictions = arrayfun(@(C_i, sigma_i) (mean(double(yval ~= (svmPredict(svmTrain(X, y, C_i, @(x1, x2) gaussianKernel(x1, x2, sigma_i)), Xval))))), C_grid, sigma_grid);
[dummy, ix] = min(predictions(:));
C = C_grid(ix);
sigma = sigma_grid(ix);

% =========================================================================

end
