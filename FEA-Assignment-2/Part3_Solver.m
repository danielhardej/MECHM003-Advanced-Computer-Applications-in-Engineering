function [ F ] = Part3_Solver( F_total, theta, n_elems, n_nodes )
%-------------------------------------------------------------------------%
%---------------------------------Part 3----------------------------------%
%-------------------------------------------------------------------------%
% This function for Part 3 modifies the force vector [F] by adding vertical
% components of force, in addition to horizontal components, to the force
% vector [F], depending on the size of the new angle theta.

F_x  = F_total * cos(theta);
F_y  = F_total * sin(theta);

if n_nodes == 3
    if n_elems == 2
        F = zeros(8,1);
        F(3,1) = F_x/2;
        F(4,1) = F_y/2;
        F(7,1) = F_x/2;
        F(8,1) = F_y/2;
    elseif n_elems == 4
            F = zeros(12,1);
            F(5,1) = F_x/2;
            F(6,1) = F_y/2;
            F(11,1) = F_x/2;
            F(12,1) = F_y/2;
    end
elseif n_nodes == 6
    if n_elems == 2
        F = zeros(18,1);
        F(5,1) = F_x/3;
        F(6,1) = F_y/3;
        F(11,1) = F_x/3;
        F(12,1) = F_y/3;
        F(17,1) = F_x/3;
        F(18,1) = F_y/3;
    elseif n_elems == 4
            F = zeros(30,1);
            F(9,1) = F_x/3;
            F(10,1) = F_y/3;
            F(19,1) = F_x/3;
            F(20,1) = F_y/3;
            F(29,1) = F_x/3;
            F(30,1) = F_y/3;
    end
end

disp(F_x);
disp(F_y);
end

