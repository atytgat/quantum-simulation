function [ C ] = Residu( N )
% N = degré du polynome
% Cette fonction calcule le résidu 

H = zeros(N+1,N+1); % Matrice de dérivation première

for i=1:N+1
    for j=i+1:N+1
        
        if i == 1
            if (mod(j,2) == 0)
          
                H(i,j) = (j-1);
                
            end
            
        else
            if (mod(j,2) == 0) && (mod(i,2) == 1)
          
                H(i,j) = 2*(j-1);
           
            elseif (mod(j,2) == 1) && (mod(i,2) == 0)
       
                H(i,j) = 2*(j-1);
        
            end
        end

    end
end

F = H*H; % Matrice de dérivation seconde

% La matrice du système est donnée par

C = F + H - 2*eye(N+1,N+1);

end

