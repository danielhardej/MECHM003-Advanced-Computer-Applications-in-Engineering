function [ F ] = GenerateForceVector( F_total, n_elems, n_nodes )

if n_nodes == 3
    if n_elems == 2
        F = zeros(8,1);
        F(3,1) = F_total/2;
        F(7,1) = F_total/2;
    elseif n_elems == 4
            F = zeros(12,1);
            F(5,1) = F_total/2;
            F(11,1) = F_total/2;
    end
elseif n_nodes == 6
    if n_elems == 2
        F = zeros(18,1);
        F(5,1) = F_total/3;
        F(11,1) = F_total/3;
        F(17,1) = F_total/3;
    elseif n_elems == 4
            F = zeros(30,1);
            F(9,1) = F_total/3;
            F(19,1) = F_total/3;
            F(29,1) = F_total/3;
    end
end

end

