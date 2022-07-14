clc;
clf;
clear;

%% Partie 1:
p=3;
M=2^p;
L=1000;
N=50;

for i=1:L
    x(i)=(1+(-1)^i)/2;
end

Lx=length(x);

figure(1);
subplot(211);
plot(x,'b*');
title('');
xlabel('itération');
ylabel('symbole');
axis([0 L 0 M]);
grid;

%%Partie 2:
x = randi(1,M,L);
Lx = length(x);

subplot(212);
plot(x,'r+');
title('');
xlabel('');
ylabel('symboles');
axis([0 L 0 M]);
grid ; 

%% Partie 3: Simulation  d'un signal avec N pts/sym
N=50;
xe=zeros(1,N*L);
for i=1:N*L
    if(i<N*L)
        xe(i)=x(1+floor(i/N));
    end
end

%% Partie 4:Filtre de Butterworth
%Ordre n. Frequence de coupure wn
n=4;
wn=0.05;
[b,a] = butter(n,wn,'low');
y = filter(b,a,xe);

figure(2);
subplot(211);
plot(xe);
title('');
xlabel('temps');
ylabel('Valeurs de xe');
axis([0 N*L 0 M]);
grid;
subplot(212);
plot(y);
title('');
xlabel('temps');
ylabel('Valeurs de y');
axis([0 N*L 0 M]);
grid;

%%  Partie 5 : Synthese de eyediagram 
q = 2;
eyediagram(y,q*N);
grid;
title('');

%% Partie 6 : 
T=L/q;
for t=1:T
    for i=1:q*N
        oeil(i,t) = y(i+N*(t-1));
    end
end

figure(4);
plot(oeil);
grid,
title('Obseravtion a l echelle de la durée q symb');
ylabel('t');
ylabel('Sortie du canal')