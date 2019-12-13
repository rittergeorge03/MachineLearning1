function [scaledData] = scalingStd(inputData)
%SCALINGSTD is used for standardized feature scaling
%   scaledData = (inputData - mean(inputData)) / std(inputData)
%   [scaledData] = scalingStd(inputData)
% Error Checking
if ~exist('inputData') || isempty(inputData)
    error('inputData is empty or not specified')
elseif ~isvector(inputData)
    error('inputData is not a vector')
elseif std(inputData) == 0
    error('Input stdev is zero which results in divide by zero')
% Feature Scaling calculation
else
scaledData = (inputData - mean(inputData)) / std(inputData);
end
end

