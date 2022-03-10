function [ out ] = phi( x,N )
% On génère les fonctions de Hermite par réccurence
P(:,1) = 1 / sqrt(sqrt(pi)) * exp(-x.^(2) / 2);           % phi_0
P(:,2) = 1 / sqrt(2*sqrt(pi)) * 2 * x.* exp(-x.^(2) / 2); % phi_1

for k=3:N
    P(:,k) = sqrt(2/(k-1)) * x.* P(:,k-1) - sqrt((k-1-1)/(k-1)) * P(:,k-2);
end
out = P;
end

