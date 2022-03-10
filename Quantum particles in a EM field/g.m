function [ G ] = g( N,V,E,A0,w,sig,t,b )
% on génère le membre de droite de l'équation
% différentielle des coefficients b. 
% ce code est utile lors de l'utilisation
% de la fonction ode15s

I = zeros(N+1,N+1);
M = zeros(N+1,N+1);

A = A0*sin(w*t)*exp(-t^2/sig);

for m=1:N+1
    for n=1:N+1
        
        for k=1:N+1 
            
            if (k == 1)
                 I(m,n) = I(m,n) - V(n,k) * sqrt((k-1+1)/2)*V(m,k+1);
           
            elseif (k == N+1)
                 I(m,n) = I(m,n) + V(n,k)*sqrt((k-1)/2)*V(m,k-1);
            
            else 
                 I(m,n) = I(m,n) + V(n,k)*( sqrt((k-1)/2)*V(m,k-1) - sqrt((k-1+1)/2)*V(m,k+1) );
                 
            end
        end
        
        M(m,n) = -A*exp(-1i*(E(n,1)-E(m,1))*t) * I(m,n);
    end
end

G = M*b;

end

