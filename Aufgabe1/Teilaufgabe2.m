%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                  Aufgabe 1, Teilaufgabe 2: Sinusgemisch                 %
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

% length of signal (5s) 
time = (0:samplePeriod:timeInSec-samplePeriod);
timeInMs=time.*1000;

% Errechnenvon Sinusschwingungen
signal1 = A1 * sin(2 * pi * f1 * time + phi1);
signal2 = A2 * sin(2 * pi * f2 * time + phi2);
signal3 = A3 * sin(2 * pi * f3 * time + phi3);


% mix sine vibrations and scale sinemix
sinusgemisch = signal1 + signal2 + signal3;
sinusgemisch = sinusgemisch/max(abs(sinusgemisch));

framelength_list = [50 100 500 1000 5000];

hFig = figure(1);
set(hFig, 'Position', [0 0 800 1000])

for i = 1:numel(framelength_list)
    frame_length = framelength_list(i);
    fourier_sinemix = fft(sinusgemisch, frame_length);
    delta_f = sampleRate/frame_length;
    f=(0:delta_f:sampleRate-delta_f);
        
    subplot(5,1,i);
    plot(f, abs(fourier_sinemix));
    current_title = strcat('frame length= ', int2str(frame_length), ', delta f= ', int2str(delta_f));
    title(current_title);
    xlabel('f_{Hz}'); 
    ylabel('x_t'); 
end

% save plot as jpg
saveas(hFig, 'plot_12', 'jpg');

% close figure
close(hFig);
