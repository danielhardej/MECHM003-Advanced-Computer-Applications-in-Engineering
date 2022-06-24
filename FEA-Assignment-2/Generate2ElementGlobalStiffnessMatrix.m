function K = Generate2ElementGlobalStiffnessMatrix(K, k1, k2)

% Generate stiffness matrix elements at overlapping nodes
for i = (2*size(k1,1) - size(K,1) - 1):size(k1,1)
    K(i,i) = k1(i,i) + k2(i-2,i-2);
end

for i = 1:size(k1,2)
    K(1,i) = k1(1,i);
    K(2,i) = k1(2,i);
end

for i = 1:size(k1,1)
    K(i,1) = k1(i,1);
    K(i,2) = k1(i,2);
end

for i = 1:size(k2,2)
    K(7,i) = k2(5,i);
    K(8,i) = k2(6,i);
end

for i = 1:size(k2,1)
    K(i,7) = k2(i,5);
    K(i,8) = k2(i,6);
end


