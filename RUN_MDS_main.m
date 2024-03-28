%RUNNING THE ANALYSES
% 1. Import data by going to HOME -> Import Data -> select file -> select
%section to import
%
% 2. Specify your values in the code
% 2.1. In function runMDS(data, number_of_dimensions, distance_measure, take_variables_from)
% replace ^ data with the name of your imported data, on which you want to
% run MDS.
% 2.2. select whether your objects/independent variables are the column names or row names
% E.g. if your objects are the column names, then put the take_variables_from as "col"
% 2.3. If needed check out pdist to know what distances can be inputted
%(some commone ones: 'euclidean', 'fasteuclidean', 'cosine', 'spearman')
%https://www.mathworks.com/help/stats/pdist.html
%
% 3. RUN the script by going to Editor -> Run (big green Play triangle)

% sets default values
defaults

% optional import
data = readtable("analysis_matlab.csv", ReadRowNames=true); %enter name of your data file here

% in the function runMDS, the parmateres entered are:
% runMDS(data, number_of_dimensions, distance_measure, take_variables_from)
[distance_matrix, Y, stress] = runMDS(data, 3, "cityblock", "col") 
