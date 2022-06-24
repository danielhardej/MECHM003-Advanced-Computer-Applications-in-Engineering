function K = Generate3NodeElementGlobalStiffnessMatrix(K, k, i, j, m)

% This function generates the global stiffness matrix [K] for a system of
% three node elements, based on the element stiffness matrix [k], and the
% indexes of each element node, i, j, and m. Note that this function is
% called for each element in a system until the entire global stiffness
% matrix has been generated (see Part2_Solver.m)

K(2*i-1,2*i-1) = K(2*i-1,2*i-1) + k(1,1);
K(2*i-1,2*i) = K(2*i-1,2*i) + k(1, 2);
K(2*i-1,2*j-1) = K(2*i-1,2*j-1) + k(1,3);
K(2*i-1,2*j) = K(2*i-1,2*j) + k(1,4);
K(2*i-1,2*m-1) = K(2*i-1,2*m-1) + k(1,5);
K(2*i-1,2*m) = K(2*i-1,2*m) + k(1,6);
K(2*i,2*i-1) = K(2*i,2*i-1) + k(2,1);
K(2*i,2*i) = K(2*i,2*i) + k(2,2);
K(2*i,2*j-1) = K(2*i,2*j-1) + k(2,3);
K(2*i,2*j) = K(2*i,2*j) + k(2,4);
K(2*i,2*m-1) = K(2*i,2*m-1) + k(2,5);
K(2*i,2*m) = K(2*i,2*m) + k(2,6);

K(2*j-1,2*i-1) = K(2*j-1,2*i-1) + k(3,1);
K(2*j-1,2*i) = K(2*j-1,2*i) + k(3,2);
K(2*j-1,2*j-1) = K(2*j-1,2*j-1) + k(3,3);
K(2*j-1,2*j) = K(2*j-1,2*j) + k(3,4);
K(2*j-1,2*m-1) = K(2*j-1,2*m-1) + k(3,5);
K(2*j-1,2*m) = K(2*j-1,2*m) + k(3,6);
K(2*j,2*i-1) = K(2*j,2*i-1) + k(4,1);
K(2*j,2*i) = K(2*j,2*i) + k(4,2);
K(2*j,2*j-1) = K(2*j,2*j-1) + k(4,3);
K(2*j,2*j) = K(2*j,2*j) + k(4,4);
K(2*j,2*m-1) = K(2*j,2*m-1) + k(4,5);
K(2*j,2*m) = K(2*j,2*m) + k(4,6);

K(2*m-1,2*i-1) = K(2*m-1,2*i-1) + k(5,1);
K(2*m-1,2*i) = K(2*m-1,2*i) + k(5,2);
K(2*m-1,2*j-1) = K(2*m-1,2*j-1) + k(5,3);
K(2*m-1,2*j) = K(2*m-1,2*j) + k(5,4);
K(2*m-1,2*m-1) = K(2*m-1,2*m-1) + k(5,5);
K(2*m-1,2*m) = K(2*m-1,2*m) + k(5,6);
K(2*m,2*i-1) = K(2*m,2*i-1) + k(6,1);
K(2*m,2*i) = K(2*m,2*i) + k(6,2);
K(2*m,2*j-1) = K(2*m,2*j-1) + k(6,3);
K(2*m,2*j) = K(2*m,2*j) + k(6,4);
K(2*m,2*m-1) = K(2*m,2*m-1) + k(6,5);
K(2*m,2*m) = K(2*m,2*m) + k(6,6);
