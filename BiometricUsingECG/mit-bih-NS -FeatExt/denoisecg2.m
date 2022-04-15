x=ecgsig(2,:);
ecg=x;
fs=360;
N=length(ecg);
t=((0:length(ecg)-1)/fs);
subplot (3,1,1),plot(t,ecg);grid on
title('Corrupted ECG Signal')
xlabel('Time[sec]')
ylabel('Amplitude')
grid on

%high pass filter to remove baseline noise
[b2,a2]=butter(2,.5/(fs/2),'high');
m=filtfilt(b2,a2,ecg);
subplot(3,1,2),plot(t,ecg,t,m);grid on

title('Filtered ECG signal with baseline removed')
xlabel('Time[sec]')
ylabel('Amplitude')
legend('unfiltered','filtered')


% m = designfilt('bandstopiir','FilterOrder',2, ...
%                'HalfPowerFrequency1',0.1,'HalfPowerFrequency2',0.5, ...
%                'DesignMethod','butter','SampleRate',fs);
% fvtool(m,'fs',fs)

%to check freq response of orignal signal

Ys=fft(ecg);
Ys=fftshift(Ys);
equal_space=linspace(0,0.5,N/2); %adjusting freq range interval
freq=(fs/2)*equal_space;
Ys=Ys(1:ceil(N)/2);
% subplot (5,1,3),plot(freq,2*abs(Ys));grid on
title('ECG signal in freq Domain(original)')
xlabel('Frequency(Hz)')
ylabel('|Y(f)|')

%To check frequency response of filtered signal
% 
% Ys=fft(m);
% Ys=fftshift(Ys);
% equal_space=linspace(0,0.5,N/2); %adjusting freq range interval
% freq=(fs/2)*equal_space;
% Ys=Ys(1:ceil(N)/2);
% figure(4),
% plot(freq,2*abs(Ys))
% title('ECG signal in freq Domain(Baseline Noise free)')
% xlabel('Frequency(Hz)')
% ylabel('|Y(f)|')


%designing of low pass notch filter

w=50/(360/2);
bw=w/20;
[d,c]=iirnotch(w,bw); % notch filter implementation 
ecg_notch=filter(d,c,m);
N1=length(ecg_notch);
t1=(0:N1-1)/fs;
y1 = sgolayfilt(ecg_notch,0,5);
subplot (3,1,3),plot(t1,ecg,t1,y1);grid on
legend('unfiltered','filtered')
title('Filtered ECG signal with powerline removed ')             
xlabel('time')
ylabel('amplitude')

%To check freq response of filtered signal
Ys=fft(y1);
Ys=fftshift(Ys);
equal_space=linspace(0,0.5,N/2); %adjusting freq range interval
freq=(fs/2)*equal_space;
Ys=Ys(1:ceil(N)/2);
% subplot (5,1,5),plot(freq,2*abs(Ys));grid on

title('ECG signal in freq Domain(Powerline noise free')
xlabel('Frequency(Hz)')
ylabel('|Y(f)|')









% Fs = 360; % Sampling Frequency
% N = 4; % Order
% Fc = 0.667; % Cutoff Frequency
% % Construct an FDESIGN object and call its BUTTER method.
% x1=ecgsig(1,:);
% 
% h = fdesign.lowpass('N,Fc', N, Fc, Fs);
% Hd = butter(h);
% LPa(1) = 1;
% LPb(1) = 1;
% LPb(2) = 2;
% LPb(3) = 1;
% ECGLPFilteredVoltage = filter(LPb, LPa, x1);
% % x2=x1./ max(x1);
% % subplot (2,1,1), plot(x2);grid on
% % y0=filter (Hd, x2);
% % subplot (2,1,2), plot(y0);grid on
% 
% subplot(2,1,1); plot(x1);
% 
% subplot(2,1,2); plot(ECGLPFilteredVoltage);
