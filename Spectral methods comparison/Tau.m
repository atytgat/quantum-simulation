function [ a ] = Tau( N )
% R�solution du syst�me lin�aire de la m�thode de  Tau

T = ones(N+1,N+1);
b = zeros(N+1,1);
if N > 1
    b(3,1) = -2;
end

for j=1:N+1
    T(2,j) = (-1)^(j+1);
end

C =  Residu(N);
T(3:N+1,1:N+1) = C(1:N-1,1:N+1);


a = T\b;

end