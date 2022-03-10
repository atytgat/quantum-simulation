function [ a ] = Collocation( N )
% Résolution du système linéaire de la de Collocation

E = zeros(N-1,N+1);

for i=1:N-1
    for j=1:N+1       
        E(i,j) = cos(i*(j-1)*pi/N);
    end
end

C = E*Residu(N);
for j=1:N+1
    C(N,j) = 1;
    C(N+1,j) = (-1)^(j+1);
end

% Création du vecteur b
b = zeros(N+1,1);
b(1,1) = -2;
b = E*b;
b(N,1) = 0;
b(N+1,1) = 0;

a = C\b;

end

