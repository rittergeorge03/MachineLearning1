function [scaledData] = scalingMinMaxNorm(inputData)
%scalingMinMaxNorm function is used for feature scaling using Min-Max normalization
%   scaledData = (inputData - min(inputData)) / range(inputData)
if ~exist('inputData') || isempty(inputData)
    error('inputData is empty or not specified')
elseif ~isvector(inputData)
    error('inputData is not a vector')
elseif std(inputData) == 0
    error('Input stdev is zero which results in divide by zero')
% Feature Scaling calculation
else
scaledData = (inputData - min(inputData)) / range(inputData);
end
end

