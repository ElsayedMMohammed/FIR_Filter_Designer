function [filter, filter_freq] = windowed_sinc(L,Type,factor,Fs,pass_type) 
%L is the length of the window specified by the user.
% The output is odd, if L is the EVEN, the output is L+1 taps.
if rem(L,2) == 0
    L=L+1;
end
%% Make the sinc
%Fs = 10; 
Ts=1/Fs;
x = -(L-1)*Ts/2:Ts:(L-1)*Ts/2;
filter = sinc(x);
%% Choose the window
if strcmp(Type,'Blackman')
win_blackman = blackman(L);
filter = filter.*win_blackman';
end
if strcmp(Type,'Chebyshev')
win_Chebyshev = chebwin(L,factor);
filter = filter.*win_Chebyshev';
end
if strcmp(Type,'Kaiser')
win_Kaiser = kaiser(L,factor);
filter = filter.*win_Kaiser';
end
%% Determine its type (High or Band Pass)
if strcmp(pass_type,'High Pass')
n = 1:1:L;
to_shift = cos(2*pi*n/2);
filter = filter.*to_shift;
elseif strcmp(pass_type,'Band Pass')
n = 1:1:L;
to_shift = cos(2*pi*n/4);
filter = filter.*to_shift;
end
%% Get the filter spectrum and PLOT
filter_freq = fft(filter);
end
