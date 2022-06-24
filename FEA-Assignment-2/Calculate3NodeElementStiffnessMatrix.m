function [ k, B ] = Calculate3NodeElementStiffnessMatrix(E, v, t, xi, yi, xj, yj, xk, yk, n_elems)
% This function computes and returns the element stiffness matrix for a 3
% noded triangular element, using input arguments of Youngs modulus (E), Poissons ratio (v),
% plate thickness (t), and the coordinates of the three nodes. 
% Where nodes 1, 2 , and 3 are the vertices of the triangular element.

% Calculate element area
if n_elems == 2
    A = 0.0015/2;
elseif n_elems ==4
    A = 0.0015/4;
end

% 2D plane stress matrix
D = (E/(1-v^2)).*[1, v, 0; v, 1, 0; 0, 0, (1-v)/2];

%Create strain-displacement matrix [B]
%Beta values
bi = yj - yk;
bj = yk - yi;
bk = yi - yj;

%Gamma values
gi = xk - xj;
gj = xi - xk;
gk = xj - xi;

% strain-displacement matrix            
B = (1/(2*A)).*[bi, 0, bj, 0, bk, 0; 0, gi, 0, gj, 0, gk; gi, bi, gj, bj, gk, bk];

% Compute the element stiffness matrix
k = t * A * transpose(B) * D * B;
