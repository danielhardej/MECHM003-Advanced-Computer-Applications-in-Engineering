function [ k, B ] = Calculate6NodeElementStiffnessMatrix( E, v, t, ...
    x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, x6, y6 )


% 2D plane stress matrix
D = (E/(1-v^2)).*[1, v, 0;
                  v, 1, 0;
                  0, 0, (1-v)/2];

H = 1/6;

x = [x1; x2; x3; x4; x5; x6];
y = [y1; y2; y3; y4; y5; y6];

L1 = [ 0.5 ; 0.5 ; 0 ];
L2 = [ 0.5 ; 0 ; 0.5 ];

J_n1 = CalculateJacobian( L1(1), L2(1), x, y );
J_n2 = CalculateJacobian( L1(2), L2(2), x, y );
J_n3 = CalculateJacobian( L1(3), L2(3), x, y );

B_n1 = Calculate6NodeStrainDisplacementMatrix( L1(1), L2(1), J_n1 );
B_n2 = Calculate6NodeStrainDisplacementMatrix( L1(2), L2(2), J_n2 );
B_n3 = Calculate6NodeStrainDisplacementMatrix( L1(3), L2(3), J_n3 );

k_n1 = H * transpose(B_n1) * D * B_n1 * det(J_n1);
k_n2 = H * transpose(B_n2) * D * B_n2 * det(J_n2);
k_n3 = H * transpose(B_n3) * D * B_n3 * det(J_n3);

B = B_n1 + B_n2 + B_n3;

k = t * (k_n1 + k_n2 + k_n3); 
end