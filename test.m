close all; clear;

% parameters
D = 5;      % duration (s)
f0 = 1e3;   % base frequency (Hz)
fs = 40e3;  % sample frequency (Hz)
T = 1/10;

% helper vectors/signals
t = 0:1:2*fs*D-1;   % time vector (-)

x = cos(2*pi*t*f0/fs);      % create cos with frequency f0
h = 1/(D).*sinc(-D*pi:T:D*pi);  % filter, lower sampling rate
y = conv(x,h,'same');              % filter signal

% get some statistics
fprintf('SNR filtered signal: %.3f dB.\n',snr(x,y));

% plot small part of signals
figure; hold on
plot(t(5000:6000),y(5000:6000),'-g');
plot(t(5000:6000),x(5000:6000),'--b');
legend('y(n)','x(n)');
hold off

% plot filter and impulse response
figure; 
[H,f]=freqz(h,1,2^11,fs);
plot(f,abs(H));

figure;
plot(h);