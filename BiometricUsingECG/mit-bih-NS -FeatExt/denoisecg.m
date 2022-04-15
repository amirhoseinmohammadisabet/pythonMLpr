function [deno] = denoisecg(ecgsigorg,tn)
    Fs = 360; % Sampling Frequency
    Fnotch = 0.67; % Notch Frequency
    BW = 5; % Bandwidth
    Apass = 1; % Bandwidth Attenuation
    [b, a] = iirnotch (Fnotch/ (Fs/2), BW/(Fs/2), Apass);
    Hd = dfilt.df2 (b, a);
    x1=ecgsigorg;
    x2=x1./ max(x1);
    y0=filter (Hd, x2);
    if tn==1
        subplot (2, 1, 1), plot(x1);grid on;
        subplot (2, 1, 2), plot(y0);grid on;
    end
    deno=y0;
    
end