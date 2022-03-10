N = 40;    % Degré max des polynomes de Tchebychev
M = 200;   % Nbr de points de discrétisation de [-1,1]

% On augmente la précision
digitsOld = digits(100); 

% Discrétisation de l'intervalle [-1,1]
x = linspace(-1,1,M);

% Solution exacte 
u = vpa(1 - ( (sinh(2)*exp(x) + sinh(1)*exp(-2*x) )/ sinh(3) ));

% Solutions des méthodes spectrales
T = zeros(1,M); % Tau
G = zeros(1,M); % Galerkin
C = zeros(1,M); % Collocation

% Erreur des méthodes 
T_err = zeros(1,N); % Tau
G_err = zeros(1,N); % Galerkin
C_err = zeros(1,N); % Collocation
D_err = zeros(1,N); % Différence finies

for n=1:N
    % Méthodes spectrales
    
    % Coefficients a_k des méthodes
    t = Tau(n);
    g = Galerkin(n);
    c = Collocation(n);

    % Solutions approchées
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
    
    % Méthode de différences finies
    
    D = DFinie(n); % Solution approchée 
    
    D_err(n) = abs(norm(D)^2 / n - norm(u)^2 / M); % Erreurs
    z = linspace(-1,1,n+2);
    

end

figure(1)
semilogy(1:N,T_err,'b',1:N,G_err,'g',1:N,C_err,'r',1:N,D_err,'y')
legend('Méthode de Tau', 'Méthode de Galerkin','Méthode de Collocation','Méthode des différences finies','location','best')
lgd = legend('show');
lgd.FontSize = 6;
title('Erreurs des méthodes')
xlabel('N')
ylabel('Erreur')

