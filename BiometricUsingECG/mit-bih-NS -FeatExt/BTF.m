
function [ecgoutput] = BTF(ecginput)
    %fs=250;
    d = fdesign.bandpass('Fst1,Fp1,Fp2,Fst2,Ast1,Ap,Ast2',0.5,1,50,51,60,0.5,60,250);
    Hd = design(d,'butter');
    sig = filter(Hd,ecginput);
    ecgoutput = psd(spectrum.periodogram('Hamming'),sig,'NFFT',4096,'Fs',250);
end