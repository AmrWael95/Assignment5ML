function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.

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

% predictions = svmPredict(model,Xval);
% 
% 
% predictionerror =  mean(double(predictions ~= yval))
% 
highesterror = 10000000000;
probable_parameters = [0.001 0.003 0.01 0.03 0.1 0.3 1 3 10 30 100 300];
numTrials = size(probable_parameters,2);

for i= 1:numTrials
    for j=1:numTrials
        model = svmTrain(X, y, probable_parameters(i), @(x1, x2) gaussianKernel(x1, x2, probable_parameters(j)));
        predictions  = svmPredict(model, Xval);
        newerror = mean(double(predictions ~= yval));
        if (newerror < highesterror)
            highesterror = newerror;
            C = probable_parameters(i);
            sigma = probable_parameters(j);
        end 
    end
end







% =========================================================================

end
