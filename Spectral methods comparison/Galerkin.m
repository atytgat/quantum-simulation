function [ a ] = Galerkin( N )
% Résolution du système linéaire de la méthode de Galerkin

% Création de la matrice V

U = diag(ones(N-1,1),2);

for i=1:N+1
    for j=1:2
        
        if (mod(i,2) == 1) && (j==1)
            U(i,j) = -2;
        elseif (mod(i,2) == 0) && (j==2)
            U(i,j) = -1;
            
        end
    end
end
V = zeros(N-1,N+1);
V = U(1:N-1,1:N+1);

% Création de la matrice G
G = V*Residu(N);

for j=1:N+1
    G(N,j) = 1;
    G(N+1,j) = (-1)^(j+1);
end


% Création du vecteur b
b = zeros(N+1,1);
b(1,1) = -2;
b = V*b;
b(N,1) = 0;
b(N+1,1) = 0;

% Résultat
a = G\b;

end

