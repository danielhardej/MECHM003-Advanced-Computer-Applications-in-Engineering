function [ epsilon_e1, epsilon_e2, epsilon_e3, epsilon_e4 ] = StrainCalculate4Element( U, B1, B2, B3, B4, n_nodes )
if n_nodes == 3
        % Populate element 1 displacement matrix
        delta_e1 = zeros(6,1);
        delta_e1(3:4,1) = U(1:2,1);
        delta_e1(6,1) = U(5,1);
        % Populate element 2 displacement matrix
        delta_e2 = zeros(6,1);
        delta_e2(1:2,1) = U(1:2,1);
        delta_e2(3:4,1) = U(7:8,1);
        delta_e2(6,1) = U(5,1);
        % Populate element 3 displacement matrix
        delta_e3 = zeros(6,1);
        delta_e3(1:4,1) = U(1:4,1);
        delta_e3(5:6,1) = U(6:7,1);
        % Populate element 4 displacement matrix
        delta_e4 = zeros(6,1);
        delta_e4(1:2,1) = U(3:4,1);
        delta_e4(3:4,1) = U(8:9,1);
        delta_e4(5:6,1) = U(6:7,1);
elseif n_nodes == 6
        % Populate element 1 displacement matrix
        delta_e1 = zeros(12,1);
        delta_e1(3:6,1) = U(1:4,1);
        delta_e1(7:8,1) = U(11:12,1);
        delta_e1(10,1) = U(19,1);
        delta_e1(11:12,1) = U(9:10,1);
        % Populate element 2 displacement matrix
        delta_e2 = zeros(12,1);
        delta_e2(1:2) = U(3:4);
        delta_e2(3:4) = U(13:14);
        delta_e2(5:6) = U(22:23);
        delta_e2(7:8) = U(20:21);
        delta_e2(10,1) = U(19,1);
        delta_e2(11:12,1) = U(11:12,1);
        % Populate element 3 displacement matrix
        delta_e3 = zeros(12,1);
        delta_e3(1:6,1) = U(3:8,1);
        delta_e3(7:8,1) = U(15:16,1);
        delta_e3(9:10,1) = U(22:23,1);
        delta_e3(11:12,1) = U(13:14,1);
        % Populate element 4 displacement matrix
        delta_e4 = zeros(12,1);
        delta_e4(1:2,1) = U(7:8,1);
        delta_e4(3:4,1) = U(17:18,1);
        delta_e4(5:6,1) = U(26:27,1);
        delta_e4(7:8,1) = U(24:25,1);
        delta_e4(9:10,1) = U(22:23,1);
        delta_e4(11:12,1) = U(15:16,1);
end
% Calculate element strain matrices
epsilon_e1 = B1 * delta_e1;
epsilon_e2 = B2 * delta_e2;
epsilon_e3 = B3 * delta_e3;
epsilon_e4 = B4 * delta_e4;

end

