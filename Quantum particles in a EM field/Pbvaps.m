function [out] = Pbvaps(N,a,V0)
% On résoud le problème au valeur propre

% On créé la matrice F
F = zeros(N+1,N+1);
for i=1:N+1
    
    if (i > 2)
        F(i,i-2) = sqrt((i-1)*((i-1)-1))/2;
    end
    
    F(i,i) = - (2*(i-1)+1)/2;

    if (i<N)
        F(i,i+2) = sqrt(((i-1)+1)*((i-1)+2))/2;
    end
end

% On créé la matrice U

U = zeros(N+1,N+1);

H = GaussHermite(2*(N+1)+1); 
x = H(:,1); % points d'abscisses
w = H(:,2); % poids

Phi = phi(x/sqrt(a),N+1);

for i=1:N+1
    for j=1:N+1
        U(i,j) = -V0/sqrt(a) * dot(w,Phi(:,j).* Phi(:,i)) ;
    end
end

[V,D] = eig(-1/2*F+U); % On résoud le système au valeurs propres

E = zeros(N+1,1);
for i=1:N+1
    E(i,1)=D(i,i);
end
E = sort(E); % On ordonne les énergies de façon croissante
out = [V,E];

%T = V*transpose(V); % On vérifie que les vecteurs sont orthogonaux
end