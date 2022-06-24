%-------------------------------------------------------------------------%
%---------------------------------Part 1----------------------------------%
%-------------------------------------------------------------------------%

%----Set up model to be analyised----%
%--------Initialize variables--------%

%Set number of nodes
n_nodes = input('Enter number of element nodes (3 or 6): ');

%Set plate material properties
E = 100E9;  % Young's modulus
v = 0.3;    % Poisson's ratio
t = 2E-3;   % Plate thickness

% Input arguments: coordinates of vertices of element
x1 = 0;
y1 = 0;
x2 = 50E-3;
y2 = 0;
x3 = 0;
y3 = 30E-3;

%-----Calculate stiffness matrix based on number of nodes-----%
if n_nodes == 3
    % Call function to calculate stiffness matrix for a 3 node element
    k = Calculate3NodeElementStiffnessMatrix(E, v, t, x1, y1, x2, y2, x3, y3, 2);

    % Create coordinate vectors for element plot function    
    x = [x1; x2; x3];
    y = [y1; y2; y3];

elseif n_nodes == 6
    % Calculation of coordinates of nodes 4, 5 and 6
    % NB - nodes 4, 5 and 6 are the mid points of elements joining nodes 1,
    % 2 and 3 (convention used by Seshu and Kattan)
    x4 = (x1 + x2)/2;
    y4 = (y1 + y2)/2;
    x5 = (x2 + x3)/2;
    y5 = (y2 + y3)/2;
    x6 = (x1 + x3)/2;
    y6 = (y1 + y3)/2;
    
    % Call function to calculate stiffness matrix for a 6 node element
    k = Calculate6NodeElementStiffnessMatrix(E, v, t, x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, x6, y6);

    % Create coordinate vectors for element plot function    
    x = [x1; x2; x3; x4; x5; x6];
    y = [y1; y2; y3; y4; y5; y6];

elseif (n_nodes ~= 3) || (n_nodes ~= 6)
    disp('Get bent');
    
end

% Display element stiffness matrix
disp('Element stiffness matrix: ');
disp(k);
    
% Plot element under zero stress/strain
p = PlotElement(n_nodes, x, y);
