function [FEATFFT] = fidfeatfft(fs,arz,samnum,lengsig,pernum,ecgsig)
    %fs=250;
    for n=1:pernum
        ecgsigL=ecgsig(n,1:lengsig);
    [~,qrs_i_raw,~]=pan_tompkin(ecgsigL,fs,0);
        for m=1:samnum
            mm=qrs_i_raw(m+1);
            FEATURES=ecgsigL(mm-arz:mm+arz);
            s=fft(FEATURES);
			y=real(s);
            FEATFFT{1}(n,m)= y(1); 
            FEATFFT{2}(n,m)= y(2);
            FEATFFT{3}(n,m)= y(3);
            FEATFFT{4}(n,m)= y(4);
            FEATFFT{5}(n,m)= y(5);
            FEATFFT{6}(n,m)= y(6);
            FEATFFT{7}(n,m)= y(7);
        end
    end
end