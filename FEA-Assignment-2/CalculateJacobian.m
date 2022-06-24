function [ J ] = CalculateJacobian( L1, L2, x, y )
%UNTITLED6 Summary of this function goes here
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

dNidL1 = [dN1dL1; dN2dL1; dN3dL1; dN4dL1; dN5dL1; dN6dL1];
dNidL2 = [dN1dL2; dN2dL2; dN3dL2; dN4dL2; dN5dL2; dN6dL2];

J = [sum(dNidL1.*x), sum(dNidL1.*y);
    sum(dNidL2.*x), sum(dNidL2.*y)];

disp(J);

end

