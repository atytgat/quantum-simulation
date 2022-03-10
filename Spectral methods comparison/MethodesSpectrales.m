N = 40;    % Degr� max des polynomes de Tchebychev
M = 200;   % Nbr de points de discr�tisation de [-1,1]

% On augmente la pr�cision
digitsOld = digits(100); 

% Discr�tisation de l'intervalle [-1,1]
x = linspace(-1,1,M);

% Solution exacte 
u = vpa(1 - ( (sinh(2)*exp(x) + sinh(1)*exp(-2*x) )/ sinh(3) ));

% Solutions des m�thodes spectrales
T = zeros(1,M); % Tau
G = zeros(1,M); % Galerkin
C = zeros(1,M); % Collocation

% Erreur des m�thodes 
T_err = zeros(1,N); % Tau
G_err = zeros(1,N); % Galerkin
C_err = zeros(1,N); % Collocation
D_err = zeros(1,N); % Diff�rence finies

for n=1:N
    % M�thodes spectrales
    
    % Coefficients a_k des m�thodes
    t = Tau(n);
    g = Galerkin(n);
    c = Collocation(n);

    % Solutions approch�es
    for i=1:n
        T = T + t(i) * cos((i-1)*acos(x));
        G = G + g(i) * cos((i-1)*acos(x));
        C = C + c(i) * cos((i-1)*acos(x));
    end
    
    % Calculs des erreurs
    T_err(n) = abs(norm(T)^2 / M - norm(u)^2 / M);
    G_err(n) = abs(norm(G)^2 / M - norm(u)^2 / M);
    C_err(n) = abs(norm(C)^2 / M - norm(u)^2 / M);
    
    T = zeros(1,M);
    G = zeros(1,M);
    C = zeros(1,M);
    
    % M�thode de diff�rences finies
    
    D = DFinie(n); % Solution approch�e 
    
    D_err(n) = abs(norm(D)^2 / n - norm(u)^2 / M); % Erreurs
    z = linspace(-1,1,n+2);
    

end

figure(1)
semilogy(1:N,T_err,'b',1:N,G_err,'g',1:N,C_err,'r',1:N,D_err,'y')
legend('M�thode de Tau', 'M�thode de Galerkin','M�thode de Collocation','M�thode des diff�rences finies','location','best')
lgd = legend('show');
lgd.FontSize = 6;
title('Erreurs des m�thodes')
xlabel('N')
ylabel('Erreur')

