%% Head
clear 
clc
close all

%% Variablen

a = 0.0158;
b = 0.00084;
c = 0.0127;
k = 11.5;

%Parameter PI-Regler
Tt = 0.2;
Kp = b/a
T1 = 1/a
T_PID = 0.002;

P = T1/(Kp*Tt);

%% Übertragungsfunktion
s = tf('s');
Fs = b/(s+a)*exp(-Tt*s);
Fr = 0.9*T1/(Kp*Tt)+1/(3.33*Tt*s);

L = Fr*Fs;
T = Fr*Fs/(1+Fr*Fs);
S = 1/(1+Fr*Fs);

margin(L)

Tt_r =38.6*(pi/180)/5.5
%% Simulation
sim("windrad_PID")
sim("windrad")
figure()
plot(U)
hold on
plot(U_PID)
set(gca, 'XScale', 'log')
grid on
hold off
legend("PI","PID")
figure()
plot(alpha)
hold on
plot(alpha_PID)
xlim([0 10])
grid on