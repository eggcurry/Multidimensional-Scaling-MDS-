function scree_plot(Dissimilarity_matrix,stop_given)
%UNTITLED Summary of this function goes here
%  Dissimialrity Matrix - 
% k - 
% stop - till how many dimensions does one want to calculate the variance
% explained
stop = 10;
if stop_given ~= stop
    stop = stop_given;
end

Stress_values = zeros(size(stop));
k_values = zeros(size(stop));


for i = 1:stop
    [~, stress] = mdscale(Dissimilarity_matrix,i);
    Stress_values(i) = stress;
    k_values(i) = i; 

    if(stress < 0 )
        break

    end
end



plot(k_values,Stress_values)

% plot(k_values, Stress_values)



end