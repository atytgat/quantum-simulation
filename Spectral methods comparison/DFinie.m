function [ u ] = DFinie( N )
% Résolution de l'équation avec une méthode de différence finie

d = 2;       % Taille de l'interval [-1,1]
h = d/(N+1); % Pas

% Création de la matrice D
D = zeros(N,N);

for i=1:N
    
    if (i > 1)
        D(i,i-1) = 1-h/2;
    end
    
    D(i,i) = -2*(1+h^2);
    
    if (i < N)
        D(i,i+1) = 1+h/2;
    end

end

% Création du vecteur b
b = ones(N,1);
b = -2*h^2*b;

% Solution de l'équation
u = zeros(1,N+2);
u(2:N+1) = D\b;

end
