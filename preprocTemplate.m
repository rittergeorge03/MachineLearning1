% This is a preprocessing template for machine learning

%% Import Data in Table format
% Import Data (see UCI Machine Learning Repository for Data Set)
fileName = 'iris.csv';
varNames = {'sepalLength' 'sepalWidth' 'pedalLength' 'pedalWidth' 'class'};
myTable = myData(fileName, varNames);


%% Import Messy Data
% this reads a messy table data set provided by matlab
myTable = readtable('messy.csv','TreatAsEmpty',{'.','NA'})


%% Remove Missing Data: Numeric Method 1 - Delete Row or Column

% Remove rows with missing data (see rmmissing help for definition of
% missing)
completeTable1 = rmmissing(myTable);

% Remove columns with missing data (see rmmissing help for definition of
% missing
completeTable2 = rmmissing(myTable,2);

%% Remove Missing Data: Numeric Method 2 - Use Numeric Mean Value

M_B = mean(myTable.B, 'omitnan');
New_B = fillmissing(myTable.B,'constant',M_B);
myTable.B = New_B;

%% Remove Missing Data: NonNumeric Method 3 - Replace with Most Frequent

% Assign as categorical array
myTable.C = categorical(myTable.C);

% Determine the most used category
Freq_value = mode(myTable.C);

% fill those missing categories with the most used
newC = fillmissing(myTable.C, 'constant', cellstr(Freq_value));

% Update the table
myTable.C = newC;

%% Feature Scaling - Standardization
% For feature scaling using standardization please refer to the generated
% function scalingStd
% scaledData = (inputData - mean(inputData)) / std(inputData)

% NOTE THAT MISSING DATA MUST FIRST BE ADDRESSED
myTable.D = fillmissing(myTable.D, 'constant', mean(myTable.D, 'omitnan'));
myTable.D = scalingStd(myTable.D);

%% Feature Scaling - Normalization
% For feature scaling using normalization please refer to the generated
% function scalingMeanNorm

% NOTE THAT MISSING DATA MUST FIRST BE ADDRESSED
myTable.E = fillmissing(myTable.E, 'constant', mean(myTable.E, 'omitnan'));
myTable.E = scalingMinMaxNorm(myTable.E);

%% Outlier Removal - 
% outlier removal acts on numerical data only
% missing data is not evaluated

%outliers = isoutlier(myData.E);
outliers = isoutlier(myData.E,'method','mean');

%% Dealing with Categorical Data
% If there is no numerical relationship then dummy variables are made
% and boolean value is assigned if it is evaluated against

















