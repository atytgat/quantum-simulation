tic

A0 = 1;   % Amplitude de la perturbation
sig = 20; % sigma

% paramètre qui modifie l'energie
N = 30;    % Nbr de fonctions propres
a = 1;     % alpha
V0 = 3;    % profondeur du potentiel

% Bornes du temps
t_i = -15;
t_f = 15;
tspan = linspace(t_i,t_f,100);


% Etats propres et energies
B = Pbvaps(N,a,V0);
E = B(:,N+2)            % Energies
V = B(:,1:N+1);         % Vecteurs propres
w = abs(E(1,1)-E(2,1))  % Fréquence 

% Conditions initiales
c = zeros(N+1,1);
c(1,1) = 1;

% Résolution
[t,b] = ode15s(@(t,b) g( N,V,E,A0,w,sig,t,b ), tspan, c);
toc

% Etat lié
b1 = abs(b(:,1)).^2;
b2 = abs(b(:,2)).^2;
for i=1:N
    if (b1(i,1) > 1)
        b1(i,1) = 1;
    end
    if (b2(i,1) > 1)
        b2(i,1) = 1;
    end
end
p = 0;
for i=1:N
    if (E(i) < 0)
        p = p + 1;
    end
end

EL = zeros(100,1);
if (p > 2)
    for i=3:p
        EL = EL + abs(b(:,i)).^2;
    end
end

% Continuum
CO = 1-abs(b(:,1)).^2-abs(b(:,2)).^2-EL;

for i=1:100
    if (CO(i,1) < 0)
        CO(i,1) = 0;
    end
end

%Graphes 
figure(1)
plot(tspan,b1,tspan,b2,tspan,EL,tspan,CO);
legend('Etat fondamental','1er etat lie','Autres etats lie','Continuum')
xlabel('temps')
ylabel('Probabilité')

% graphique de l'excitation
t=linspace(t_i,t_f,300);
A = A0*sin(w.*t).*exp(-t.^2/sig);

figure(2)
plot(t,A)
title('Excitation EM')
xlabel('temps')
ylabel('A(t)')

% graphique du potentiel
x=linspace(-25,25,300);
V = -V0 * exp(-a*x.^2);
figure(3)
plot(x,V)
title('Potentiel')
xlabel('x')
ylabel('V(x)')
