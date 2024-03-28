function [distance_matrix, Y, stress, mds_plot]= runMDS(data, number_of_dimensions, distance_measure, take_variables_from)
 
%runMDS performs and plots an MDS on given set of objects.  
%   data - containing objects and parameters/ groups/ variables  
%   number_of_dimensions - number of dimensions the MDS should optimise for
%   distance_measure - optional parameter. Can specify what distance to use
%  for calculating dissimilarity between the variables. Takes values: "euclidean",
%  "manhattan", "cityblock" (manhattan and cityblock are the same), "correlation". By default uses "manhattan"
%   take_variables_from - optional parameter. You can specify whether to
%   consider the column names or row names as the objects. Enter "col" or "row."
%   Default is set to row


if take_variables_from == "col"
    
    % save variable labels
    row_names = data.Properties.VariableNames
    % transpose
    data = rows2vars(data); 
    % remove the first names column
    data(:,1) = [];

elseif take_variables_from == "row"

    % these will be the labels on the MDS
    row_names = data.Properties.RowNames

end   



%converting data from table to array form because pdist does not work well with table
data = table2array(data); 

%calculating distance matrix
distance_matrix = pdist(data, distance_measure);



% scree plot
stop = 7 + number_of_dimensions;
f_1 = figure(1);
movegui(f_1,'west');
scree_plot(distance_matrix, stop)
title("Scree Plot");
xlabel("Dimension");
ylabel("stress");


% Calculating MDS values
[Y, stress] = mdscale(distance_matrix, number_of_dimensions, "Criterion", "sstress"); 
    

%Plotting MDS graphs
f_2 = figure(2);
movegui(f_2,'east');
plot(Y(:,1),Y(:,2),'o','LineWidth',2);
text(Y(:,1),Y(:,2), row_names);
title("MDS Plot");
xlabel("Dim 1");
ylabel("Dim 2");

if number_of_dimensions == 3
    figure(3)
    scatter3(Y(:,1), Y(:,2),Y(:,3), 'filled');
    text(Y(:,1),Y(:,2), Y(:,3), row_names);
    title("MDS 3D Plot");
    xlabel("Dim 1");
    ylabel("Dim 2");
    zlabel("Dim 3");

elseif number_of_dimensions >3
    figure(3)
    plot(Y(:,3), Y(:,4), 'o', Linewidth, 2);
    text(Y(:,1),Y(:,2), row_names);
    title("Dim 3 vs Dim 4");
    xlabel("Dim 3");
    ylabel("Dim 4");
end


end