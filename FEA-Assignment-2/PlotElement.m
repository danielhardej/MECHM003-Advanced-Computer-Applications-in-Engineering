function p = PlotElement(x, y, element_positions)

% This function calls the number of element nodes and their coordinates,
% then uses their connectivity to plot the shape of the undeformed 3-noded
% or 6-noded element.

% The variable 'element_positions' denotes the connectivity between the
% nodes. (i.e. 2,3 indicates that an element is connected to nodes 2 and 3)

for i = 1:size(element_positions,1)
    p = line(x(element_positions(i,1:2),1), y(element_positions(i,1:2),1));
    set(p,'Marker','o','MarkerSize',10,'MarkerFaceColor','r');
end
