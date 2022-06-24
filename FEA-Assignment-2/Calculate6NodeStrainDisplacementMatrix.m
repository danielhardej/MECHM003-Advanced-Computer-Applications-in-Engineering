function [ B_sample ] = Calculate6NodeStrainDisplacementMatrix( L1, L2, J )
% This function calculates the strain-displacement matrix for a single
% sampling point of a 6-noded element
%   Detailed explanation goes here

dN1dL1 = 4*L1 - 1;
dN2dL1 = 0;
dN3dL1 = -3 + 4*L1 + 4*L2;
dN4dL1 = 4*L2;
dN5dL1 = -4*L2;
dN6dL1 = 4 - 4*L2 - 8*L1;

dN1dL2 = 0;
dN2dL2 = 4*L2 - 1;
dN3dL2 = -3 + 4*L1 + 4*L2;
dN4dL2 = 4*L1;
dN5dL2 = 4 - 4*L1 - 8*L2;
dN6dL2 = -4*L1;

B1 = [1, 0, 0, 0;
      0, 0, 0, 1;
      0, 1, 1, 0];

B2 = [J(2,2)/det(J) , -J(1,2)/det(J) , 0 , 0 ;
        -J(2,1)/det(J) , J(1,1)/det(J) , 0 , 0 ;
        0 , 0 , J(2,2)/det(J) , -J(1,2)/det(J) ;
        0 , 0 , -J(2,1)/det(J) , J(1,1)/det(J) ];

B3 = [dN1dL1, 0, dN2dL1, 0, dN3dL1, 0, dN4dL1, 0, dN5dL1, 0, dN6dL1, 0;
    dN1dL2, 0, dN2dL2, 0, dN3dL2, 0, dN4dL2, 0, dN5dL2, 0, dN6dL2, 0;
    0, dN1dL1, 0, dN2dL1, 0, dN3dL1, 0, dN4dL1, 0, dN5dL1, 0, dN6dL1;
    0, dN1dL2, 0, dN2dL2, 0, dN3dL2, 0, dN4dL2, 0, dN5dL2, 0, dN6dL2];

B_sample = B1 * B2 * B3;
end

