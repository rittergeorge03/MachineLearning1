function [newTable] = cat2Dummy(myTable,myCat)
%CATEGORICAL2DUMMY generates dummy variables based on category distinct
%values and adds to the newTable
%values
%   [newTable] = cat2Dummy(myTable,myCat) where the variables are as noted
%   below
%   newTable = output table with dummy categories added
%   myTable = original table which contains myCat
%   myCat = categorie within myTable, ie myTable.myCat

% Determine unique categories within myCat
tempCat = unique(myCat);

% Generate temp table
varTypes = cell(1,length(tempCat));
varTypes(1,:) = {'double'};
tempTable = table('Size',[height(myTable) length(tempCat')],'VariableTypes',varTypes);

% Assign the Variable Names based on unique categories in myCat
tempTable.Properties.VariableNames = tempCat';


% Fill in the dummy table with 0||1
for cats = 1:length(tempCat) % index through categorie
    for rows = 1:height(myTable) % index through rows
        
        % Determine if the categorie is true
        
        if strcmp(myCat(rows),tempCat(cats)) ==1
            tempTable(rows,cats) = {1};
        else
            tempTable(rows,cats) = {0};      
        end
    end
end

% Add the dummy temp table to the original table
newTable = [myTable tempTable];
end

