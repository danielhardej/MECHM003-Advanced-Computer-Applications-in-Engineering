function [ epsilon_e1, epsilon_e2 ] = StrainCalculate2Element( U, B1, B2, n_nodes )
% This function calculates the element strains for a system of two
% triangular elements with either 3 nodes or 6 nodes.
%   The function calls the displacement vector [U], the element strain displacement
%   matrices [B], and the number of element nodes as input arguments.
%   Element node displacements are determined from [U], then the strain
%   vector for each element is calculated by multiplying displacement by [B].

if n_nodes == 3
    % Populate element 1 displacement matrix
    delta_e1 = zeros(6,1);
    delta_e1(3:4,1) = U(1:2,1);
    delta_e1(6,1) = U(3,1);
    % Populate element 2 displacement matrix
    delta_e2 = zeros(6,1);
    delta_e2(1:2,1) = U(1:2,1);
    delta_e2(3:4,1) = U(4:5,1);
    delta_e2(6,1) = U(3,1);
elseif n_nodes == 6
    % Populate element 1 displacement matrix
    delta_e1 = zeros(12,1);
    delta_e1(3:10,1) = U(1:8,1);
    delta_e1(12,1) = U(12,1);
    % Populate element 2 displacement matrix
    delta_e2 = zeros(12,1);
    delta_e2(1:2,1) = U(3:4,1);
    delta_e2(3:6,1) = U(7:10,1);
    delta_e2(8:12,1) = U(11:15,1);
end

% Calculate element strain matrices
epsilon_e1 = B1 * delta_e1;
epsilon_e2 = B2 * delta_e2;

end

