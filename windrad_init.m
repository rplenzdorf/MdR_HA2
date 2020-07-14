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

P = T1/(Kp*Tt);

%% Übertragungsfunktion
s = tf('s');
Fs = b/(s+a)*exp(-Tt*s);
Fr = 0.9*T1/(Kp*Tt)+1/(3.33*Tt*s);

T = Fr*Fs/(1+Fr*Fs);

margin(T)

%% Simulation