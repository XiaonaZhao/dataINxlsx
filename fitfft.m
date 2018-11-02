% function Y = fitfft(X)
% Fs = 106;            % Sampling frequency, when pike used
% % T = 1/Fs;             % Sampling period       
% L = length(X);             % Length of signal
% % t = (0:L-1)*T;        % Time vector
% 
% Y = fft(X);
% 
% P2 = abs(Y/L);
% P1 = P2(1:fix(L/2)+1);
% P1(2:end-1) = 2*P1(2:end-1);
% 
% f = Fs*(0:fix(L/2))/L;
% plot(f,P1) 
% title('Single-Sided Amplitude Spectrum of X(t)')
% xlabel('f (Hz)')
% ylabel('|P1(f)|')

function newd = fitfft(X)
Fs = 106;
L = length(X);
t = (0 : L - 1)/Fs;
% data = chirp(t,20,.05,50) + chirp(t,500,.1,700);
subplot(411)
plot(t, X,'LineWidth',2);
title('Original Data') 
N = 2^nextpow2(L);
y = fft(X, N)/L;
f = Fs/2 * linspace(0, 1, N/2+1);
subplot(412)
plot(f,abs(y(1:N/2+1)))
title('Spectrum of Original Data')
b = fir1(40, 2*[1 200]/Fs); 
newd = filter(b, 1, X);
subplot(413)
plot(t, newd)
title('Filtered Data')
newy = fft(newd, N)/L;
subplot(414)
plot(f,abs(newy(1:N/2+1)))
title('Spectrum of Filtered Data')