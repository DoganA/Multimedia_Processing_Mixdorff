fa=16000; %%Abtastfrequenz 16kHz
Ta=1/fa;
dauer=5;
t=[0:Ta:dauer-Ta];
t_ms=t.*1000;

f1=100;
a1=1.0;
phi1=0;

f2=200;
a2=0.5;
phi2=(-pi/2);

f3=400;
a3=0.5;
phi3=pi;

s1=1.0*sin(2*pi*f1*t+phi1);
s2=0.5*sin(2*pi*f2*t+phi2);
s3=0.5*sin(2*pi*f3*t+phi3);

a=s1+s2+s3;

plot(t_ms,s1,t_ms,s2,t_ms,s3,t_ms,a),axis([0 20 -2 2]),xlabel('t[ms]'),ylabel('A(t)');
a_max=max(abs(a));
a=a/a_max;
wavwrite(a,16000,16,'C:\Übung1\sinusgemisch.wav');

%Framelängen, (N=fa*dauer)
N1=fa*(50/1000); 
N2=fa*(100/1000);
N3=fa*(500/1000);
N4=fa*1;
N5=fa*5;

%N1
df1=fa/N1; %Delta-Frequenz
f1=[0:df1:fa-df1]; %Frequenzachse
b1=fft(a,N1);
plot(f1,abs(b1)),xlabel('f[Hz]'),ylabel('Amplitude');

%N2
df2=fa/N2; %Delta-Frequenz
f2=[0:df2:fa-df2]; %Frequenzachse
b2=fft(a,N2);
plot(f2,abs(b2)),xlabel('f[Hz]'),ylabel('Amplitude');

%N3
df3=fa/N3; %Delta-Frequenz
f3=[0:df3:fa-df3]; %Frequenzachse
b3=fft(a,N3);
plot(f3,abs(b3)),xlabel('f[Hz]'),ylabel('Amplitude');

%N4
df4=fa/N4; %Delta-Frequenz
f4=[0:df4:fa-df4]; %Frequenzachse
b4=fft(a,N4);
plot(f4,abs(b4)),xlabel('f[Hz]'),ylabel('Amplitude');

%N5
df5=fa/N5; %Delta-Frequenz
f5=[0:df5:fa-df5]; %Frequenzachse
b5=fft(a,N5);
plot(f5,abs(b5)),xlabel('f[Hz]'),ylabel('Amplitude');

%--------------------------------------------------------
%Einlesen vom Vokal 'a'

y=wavread('C:\Übung1\vokala.wav');

N1=fa*(50/1000); 
N2=fa*(100/1000);
N3=fa*(500/1000);
N4=fa*1;

%Fouriertransformation mit verschiedenen Framebreiten(oben berechnet)
df1=fa/N1;
f1=[0:df1:fa-df1];
z1=fft(y,N1);
%subplot(4,1,1)
plot(f1,abs(z1)),xlabel('f[Hz]'),ylabel('Amplitude');

df2=fa/N2;
f2=[0:df2:fa-df2];
z2=fft(y,N2);
%subplot(4,1,2)
plot(f2,abs(z2)),xlabel('f[Hz]'),ylabel('Amplitude');

df3=fa/N3;
f3=[0:df3:fa-df3];
z3=fft(y,N3);
%subplot(4,1,3)
plot(f3,abs(z3)),xlabel('f[Hz]'),ylabel('Amplitude');

df4=fa/N4;
f4=[0:df4:fa-df4];
z4=fft(y,N4);
%subplot(4,1,4)
plot(f4,abs(z4)),xlabel('f[Hz]'),ylabel('Amplitude');

%Einlesen vom Vokal 'i'

x=wavread('C:\Übung1\vokali.wav');

df1=fa/N1;
f1=[0:df1:fa-df1];
z1=fft(x,N1);
subplot(4,1,1)
plot(f1,abs(z1)),xlabel('f[Hz]'),ylabel('Amplitude');

df2=fa/N2;
f2=[0:df2:fa-df2];
z2=fft(x,N2);
subplot(4,1,2)
plot(f2,abs(z2)),xlabel('f[Hz]'),ylabel('Amplitude');

df3=fa/N3;
f3=[0:df3:fa-df3];
z3=fft(x,N3);
subplot(4,1,3)
plot(f3,abs(z3)),xlabel('f[Hz]'),ylabel('Amplitude');

df4=fa/N4;
f4=[0:df4:fa-df4];
z4=fft(x,N4);
subplot(4,1,4)
plot(f4,abs(z4)),xlabel('f[Hz]'),ylabel('Amplitude');






