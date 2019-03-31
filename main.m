[sig,fs] = audioread('dsp_test1.wav');

t = (0:length(sig) - 1)/fs;

%to plot the sudio signal wrt time
plot(t,sig)
xlabel('time')
ylabel('amplitude')

n = length(sig);

diff_rect=zeros(n,1);

for j = 5:n
    d = sig(j) - sig(j-1);
    if d > 0
        diff_rect(j)=d;
    end
end

%differentiates and rectifies the audio signal
figure
plot(t,diff_rect)
xlabel('time')
ylabel('amplitude')


onset_data = diff_rect;

n = length(onset_data);

[autocor,lags] = xcorr(onset_data,44100*4);

%autocorrelation of the signal
figure
plot(lags/fs,autocor)
xlabel('Lag (secs)')
ylabel('Autocorrelation')

%timeperiod estimation of the short peaks
[pksh,lcsh] = findpeaks(autocor);
short = mean(diff(lcsh))/fs;

%timeperiod estimation of the long peaks
[pklg,lclg] = findpeaks(autocor,'MinPeakDistance',ceil(short)*fs,'MinPeakheight',35);
long = mean(diff(lclg))/fs;

bpm = 60*2/long;

bpm
