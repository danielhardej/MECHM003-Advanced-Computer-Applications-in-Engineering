%-------------------------------------------------------------------------%
%--------------------------------Part 2&3---------------------------------%
%-------------------------------------------------------------------------%

clear; clc;

%----Set up model to be analyised----%
%--------Initialize variables--------%

%Set number of element nodes
n_nodes = input('Enter number of element nodes (3 or 6): ');

% Choose mesh density/number of elements
n_elems = input('Enter number of elements (2 or 4): ');

% %Select triangular element shape NB - only applicable to 4 elements
% if n_elems == 4
%     elem_shape = input('Select element shape (0=isosoles, 1=right-angle): ');
% end

% Select value for angle theta
deg = input('Enter value for angle theta: ');
% Convert degrees to radians
theta = (deg * pi()/180);

%Set plate material properties
E = 100E9;  % Young's modulus
v = 0.3;    % Poisson's ratio
t = 2E-3;   % Plate thickness


% Calculate element stiffness matrices & then generate global stiffness matrix 
% based on number of nodes and elements
if n_nodes == 3
    if n_elems == 2
        % Input arguments: additional coordinates of vertices of elements
        x = [0; 50E-3; 0; 50E-3];
        y = [0; 0; 30E-3; 30E-3];
        % Call function to calculate stiffness matrices for 3-node elements
        [ k1, B1 ] = Calculate3NodeElementStiffnessMatrix(E, v, t, x(1), y(1), x(2), y(2), x(3), y(3), n_elems);
        [ k2, B2 ] = Calculate3NodeElementStiffnessMatrix(E, v, t, x(2), y(2), x(4), y(4), x(3), y(3), n_elems);
    elseif n_elems == 4
            % Input arguments: additional coordinates of vertices of elements
            x = [0; 25E-3; 50E-3; 0; 25E-3; 50E-3];
            y = [0; 0; 0; 30E-3; 30E-3; 30E-3];
            % Call function to calculate stiffness matrices for 3-node elements
            [ k1, B1 ] = Calculate3NodeElementStiffnessMatrix(E, v, t, x(1), y(1), x(2), y(2), x(4), y(4), n_elems);
            [ k2, B2 ] = Calculate3NodeElementStiffnessMatrix(E, v, t, x(2), y(2), x(5), y(5), x(4), y(4), n_elems);
            [ k3, B3 ] = Calculate3NodeElementStiffnessMatrix(E, v, t, x(2), y(2), x(3), y(3), x(5), y(5), n_elems);
            [ k4, B4 ] = Calculate3NodeElementStiffnessMatrix(E, v, t, x(3), y(3), x(6), y(6), x(5), y(5), n_elems);
    end
elseif n_nodes == 6
    if n_elems == 2
        % Input arguments: coordinates of vertices of elements
        x = [0; 25E-3; 50E-3; 0; 25E-3; 50E-3; 0; 25E-3; 50E-3];
        y = [0; 0; 0; 15E-3; 15E-3; 15E-3; 30E-3; 30E-3; 30E-3];
        % Call function to calculate stiffness matrices for 6-node elements
        % for each element
        [ k1, B1 ] = Calculate6NodeElementStiffnessMatrix(E, v, t, x(1), y(1), x(3), y(3), x(7), y(7), x(2), y(2), x(5), y(5), x(4), y(4));
        [ k2, B2 ] = Calculate6NodeElementStiffnessMatrix(E, v, t, x(3), y(3), x(9), y(9), x(7), y(7), x(6), y(6), x(8), y(8), x(5), y(5));
    elseif n_elems == 4
            % Input arguments: additional coordinates of vertices of elements
            x = [0; 12.5E-3; 25E-3; 37.5E-3; 50E-3; 0; 12.5E-3; 25E-3; 37.5E-3; 50E-3; 0; 12.5E-3; 25E-3; 37.5E-3; 50E-3];
            y = [0; 0; 0; 0; 0; 15E-3; 15E-3; 15E-3; 15E-3; 15E-3; 30E-3; 30E-3; 30E-3; 30E-3; 30E-3]; 
            % Call function to calculate stiffness matrices for 6-node elements
            % for each element
            [ k1, B1 ] = Calculate6NodeElementStiffnessMatrix(E, v, t, x(1), y(1), x(3), y(3), x(11), y(11), x(2), y(2), x(7), y(7), x(6), y(6));
            [ k2, B2 ] = Calculate6NodeElementStiffnessMatrix(E, v, t, x(3), y(3), x(13), y(13), x(11), y(11), x(8), y(8), x(12), y(12), x(7), y(7));
            [ k3, B3 ] = Calculate6NodeElementStiffnessMatrix(E, v, t, x(3), y(3), x(5), y(5), x(13), y(13), x(4), y(4), x(9), y(9), x(8), y(8));
            [ k4, B4 ] = Calculate6NodeElementStiffnessMatrix(E, v, t, x(5), y(5), x(15), y(15), x(13), y(13), x(10), y(10), x(14), y(14), x(9), y(9));
    end
end

disp('Element stiffness matrices: ');
disp(k1);
disp(k2);
if n_elems == 4
    disp(k3);
    disp(k4);
end

% Generate global stiffness matrix 
% NB - size dependant on number of elements and nodes...
% Global stiffness matrix is of size 2n x 2n where n = total number of nodes
% NB - 3 node elements and 6 node elements need different functions for
% generating the global stiffness matrix
if (n_nodes == 3) && (n_elems == 2)
    K = zeros(8, 8);    %Initialize zeros matrix for global K
    % Add each local k to global K according to local k node indexes 
    K = Generate3NodeElementGlobalStiffnessMatrix(K, k1, 1, 2, 3);
    K = Generate3NodeElementGlobalStiffnessMatrix(K, k2, 2, 4, 3);
elseif (n_nodes == 3) && (n_elems == 4)
        K = zeros(12, 12);  %Initialize zeros matrix for global K
        % Add each local k to global K according to local k node indexes 
        K = Generate3NodeElementGlobalStiffnessMatrix(K, k1, 1, 2, 4);
        K = Generate3NodeElementGlobalStiffnessMatrix(K, k2, 2, 5, 4);
        K = Generate3NodeElementGlobalStiffnessMatrix(K, k3, 2, 3, 5);
        K = Generate3NodeElementGlobalStiffnessMatrix(K, k4, 3, 6, 5);        
elseif (n_nodes == 6) && (n_elems == 2)
    K = zeros(18, 18);  %Initialize zeros matrix for global K
    % Add each local k to global K according to local k node indexes 
    K = Generate6NodeElementGlobalStiffnessMatrix(K, k1, 1, 3, 7, 2, 5, 4);
    K = Generate6NodeElementGlobalStiffnessMatrix(K, k2, 3, 9, 7, 6, 8, 5); 
elseif (n_nodes == 6) && (n_elems == 4)
        K = zeros(30, 30);  %Initialize zeros matrix for global K
        % Add each local k to global K according to local k node indexes 
        K = Generate6NodeElementGlobalStiffnessMatrix(K, k1, 1, 3, 11, 2, 7, 6);
        K = Generate6NodeElementGlobalStiffnessMatrix(K, k2, 3, 13, 11, 6, 12, 7);
        K = Generate6NodeElementGlobalStiffnessMatrix(K, k3, 3, 5, 13, 4, 9, 8);
        K = Generate6NodeElementGlobalStiffnessMatrix(K, k4, 5, 15, 13, 10, 14, 9);
end

disp('Global stiffness matrix: ');
disp(K);

%------------------------Initialize force vectors-------------------------%
% If theta = 90 degrees, then Part 2 Solver continues as normal and calls
% the function GenerateForceVector, which generates the force vector for
% the base case in which a simple horizontal pressure is applied.
%
% For Part 3, where theta ~= 90 degrees , the function for modifying the
% force vector [F] is called (function Part3_Solver). The Part 3 function
% adds vertical components for the force vector [F], depending on the size
% of the new angle theta.

F_total = 200E6 * t * 30E-3;

if deg == 90
    [ F ] = GenerateForceVector( F_total, n_elems, n_nodes );
else
    [ F ] = Part3_Solver( F_total, theta, n_elems, n_nodes );
end

disp('Force vector: ');
disp(F);

%------------------Initialize nodal displacements and DOF------------------%
%-------------------------Apply BOUNDARY CONDITIONS------------------------%

if n_nodes == 3
    if n_elems == 2
        K(5,:) = [];
        K(:,5) = [];
        K(1:2,:) = [];
        K(:,1:2) = [];
        F(5) = [];
        F(1:2) = [];
    elseif n_elems == 4
            K(7,:) = [];
            K(:,7) = [];
            K(1:2,:) = [];
            K(:,1:2) = [];
            F(7) = [];
            F(1:2) = [];
    end
elseif n_nodes == 6
    if n_elems == 2
        K(13,:) = [];
        K(:,13) = [];
        K(1:2,:) = [];
        K(:,1:2) = [];
        F(13) = [];
        F(1:2) = [];
    elseif n_elems == 4
            K(21,:) = [];
            K(:,21) = [];
            K(1:2,:) = [];
            K(:,1:2) = [];
            F(21) = [];
            F(1:2) = [];
    end
end

disp('Global stiffness matrix after applying BCs: ');
disp(K);

disp('Force vector after applying BC: ');
disp(F);

%-------------Calculate nodal displacements and element strains-------------%
U = K\F;

disp('Nodal displacements: ');
disp(U);

if n_elems == 2
    [ epsilon_e1, epsilon_e2 ] = StrainCalculate2Element( U, B1, B2, n_nodes );
    disp('Element 1 strain: ');
    disp(epsilon_e1);
    disp('Element 2 strain: ');
    disp(epsilon_e2);
elseif n_elems == 4
    [ epsilon_e1, epsilon_e2, epsilon_e3, epsilon_e4 ] = StrainCalculate4Element( U, B1, B2, B3, B4, n_nodes );
    disp('Element 1 strain: ');
    disp(epsilon_e1);
    disp('Element 2 strain: ');
    disp(epsilon_e2);
    disp('Element 3 strain: ');
    disp(epsilon_e3);
    disp('Element 4 strain: ');
    disp(epsilon_e4);
end