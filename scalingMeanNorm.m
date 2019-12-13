function [scaledData] = scalingMeanNorm(inputData)
%scalingMeanNorm function is used for feature scaling using normalization
%   [scaledData] = scalingMeanNorm(inputData)
%   scaledData = (inputData - mean(inputData)) / range(inputData)
if ~exist('inputData') || isempty(inputData)
    error('inputData is empty or not specified')
elseif ~isvector(inputData)
    error('inputData is not a vector')
elseif std(inputData) == 0
    error('Input stdev is zero which results in divide by zero')
% Feature Scaling calculation
else
scaledData = (inputData - mean(inputData)) / range(inputData);
end
end

