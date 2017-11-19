%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                  Aufgabe 1, Teilaufgabe 1: Sinusgemisch                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
clc;
%--------------------------------------------------------------------------
% Durch die Aufgabe vorgegebene Werte: 
%Signal 1
f1=100;
A1=1;
phi1=0;

%Signal 2
f2=200;
A2=0.5;
phi2=-pi/2;

%Signal 3
f3=400;
A3=0.5;
phi3=pi;

sampleRate   = 16000;           % Abtastrate (16kHz)
samplePeriod = 1/sampleRate;    % Abtastperiode (0.0000625s) 
timeInSec    = 5;               % time

%--------------------------------------------------------------------------
% Den Pfad ermitteln, um dort die Grafiken und Sound abzuspeichern: 
currentfolder = pwd;
outputfile = strcat(currentfolder, '/sinusgemisch.wav');

% length of signal (5s) 
time = (0:samplePeriod:timeInSec-samplePeriod);

% Errechnenvon Sinusschwingungen
signal1 = A1 * sin(2 * pi * f1 * time + phi1);
signal2 = A2 * sin(2 * pi * f2 * time + phi2);
signal3 = A3 * sin(2 * pi * f3 * time + phi3);

% mix sine vibrations and scale sinemix
sinusgemisch = signal1 + signal2 + signal3;
sinusgemisch = sinusgemisch/max(abs(sinusgemisch));


% Eingangssignale Plotten und als Grafik abschpeichern
timeInMs = time.*1000;


hFig = figure(1);
set(hFig, 'Position', [0 0 500 500])
plot(timeInMs, signal1, timeInMs, signal2, timeInMs, signal3),axis([0 20 -2 2]);
grid on
title('Eingangssignale');
xlabel('t[ms]');
ylabel('A(t)');
legend('Signal 1','Signal 2','Signal 3');
saveas(hFig, 'plot_1_1_eingangssignale', 'jpg');
% close figure
close(hFig);

% Sinusgemisch Plotten und als Grafig abspeichern
hFig = figure(2);
%set(hFig, 'Position', [0 0 500 500])
% plotting sinemix
plot(time, sinusgemisch);
grid on
title('Sinusgemisch');
axis([0 0.02 -1 1]);
xlabel('t[ms]'); 
ylabel('x[t]');
legend('Sinusgemisch');
% save plot as jpg
saveas(hFig, 'plot_1_1_sinusgemisch', 'jpg');
% close figure
close(hFig);     

% write to wav-file
wavwrite(sinusgemisch, sampleRate, 16, outputfile);