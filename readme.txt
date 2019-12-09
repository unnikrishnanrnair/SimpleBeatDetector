dsp60 = 60 bpm metronome
dsp80 = 80 bpm metronome
dsp100 = 100 bpm metronome
dsp_test1 = first 30 secs of DO I WANNA KNOW - Arctic Monkeys = 84 bpm

Change the first line to any file for finding the bpm of some wav file xyz.wav
[sig,fs] = audioread('xyz.wav');

Tweaking of this line (line 45 in main.m) min peak height might be required to get proper values in some cases
[pklg*,lclg] = findpeaks(autocor,'MinPeakDistance',ceil(short)*fs,'MinPeakheight',35);

This was done as a project as a part of Digital signal processing.
