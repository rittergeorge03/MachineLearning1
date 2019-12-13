function [Table] = myData (fileName,varNames)

Table = readtable(fileName);

Table.Properties.VariableNames = varNames;


end